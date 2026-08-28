function goupgrade --description 'Upgrade Docker and GitHub Actions to the installed Go version'
    if not command -sq go
        echo "error: go is not installed" >&2
        return 1
    end

    if not command -sq git
        echo "error: git is not installed" >&2
        return 1
    end

    if not command -sq perl
        echo "error: perl is not installed" >&2
        return 1
    end

    set -l go_version_output (command go version)
    set -l go_version (string match --regex --groups-only 'go([0-9]+\.[0-9]+(?:\.[0-9]+)?(?:beta[0-9]+|rc[0-9]+)?)' -- "$go_version_output")
    if test -z "$go_version"
        echo "error: could not read the installed Go version from: $go_version_output" >&2
        return 1
    end

    set -l repo_root (command git rev-parse --show-toplevel 2>/dev/null)
    if test $status -ne 0
        echo "error: not inside a git repository" >&2
        return 1
    end

    set -l worktree_status (command git -C "$repo_root" status --porcelain)
    if test -n "$worktree_status"
        echo "error: working tree is not clean; commit or stash your changes first" >&2
        return 1
    end

    set -l dockerfile "$repo_root/Dockerfile"
    if not test -f "$dockerfile"
        echo "error: Dockerfile not found at the repository root" >&2
        return 1
    end

    set -l workflow_dir "$repo_root/.github/workflows"
    if not test -d "$workflow_dir"
        echo "error: .github/workflows not found" >&2
        return 1
    end

    set -l workflow_files (command find "$workflow_dir" -type f \( -name '*.yml' -o -name '*.yaml' \))
    if test (count $workflow_files) -eq 0
        echo "error: no GitHub Actions workflow files found" >&2
        return 1
    end

    if not command grep -Eq '^[[:space:]]*(FROM[[:space:]].*golang:|(ARG|ENV)[[:space:]]+GO_VERSION([[:space:]]*=|[[:space:]]+))[0-9]+\.[0-9]+' "$dockerfile"
        echo "error: no Go version found in Dockerfile" >&2
        return 1
    end

    if not command grep -Eq '^[[:space:]]*go-version:[[:space:]]*.*[0-9]+\.[0-9]+' $workflow_files
        echo "error: no numeric go-version found in GitHub Actions workflows" >&2
        return 1
    end

    command env GOUPGRADE_VERSION="$go_version" perl -0pi -e '
        s{^(\s*FROM\s+(?:--platform=\S+\s+)?golang:)[0-9]+\.[0-9]+(?:\.[0-9]+)?(?:beta[0-9]+|rc[0-9]+)?(?=[-\s@]|$)}{$1 . $ENV{GOUPGRADE_VERSION}}gme;
        s{^(\s*(?:ARG|ENV)\s+GO_VERSION(?:\s*=\s*|\s+))[0-9]+\.[0-9]+(?:\.[0-9]+)?(?:beta[0-9]+|rc[0-9]+)?(?=\s|$)}{$1 . $ENV{GOUPGRADE_VERSION}}gme;
    ' "$dockerfile"
    or return 1

    command env GOUPGRADE_VERSION="$go_version" perl -0pi -e '
        s{^(\s*go-version:\s*)(["\x27]?)[0-9]+\.[0-9]+(?:\.[0-9]+)?(?:\.x|beta[0-9]+|rc[0-9]+)?\2(\s*(?:#.*)?)$}{$1 . $2 . $ENV{GOUPGRADE_VERSION} . $2 . $3}gme;
    ' $workflow_files
    or return 1

    set -l changed_files (command git -C "$repo_root" diff --name-only -- Dockerfile .github/workflows)
    if test (count $changed_files) -eq 0
        echo "Go is already at $go_version"
        return 0
    end

    command git -C "$repo_root" add -- $changed_files
    or return 1

    command git -C "$repo_root" commit -m "chore: upgrade go to $go_version"
end

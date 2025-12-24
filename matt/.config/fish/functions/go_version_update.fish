function go_version_update --description 'Update go.mod (go X.Y) and Dockerfile (golang:X.Y.Z)'
    if test (count $argv) -ne 1
        echo "Usage: go_version_update NEW_VERSION (e.g. 1.25.4)"
        return 1
    end

    set -l new_full $argv[1]

    set -l parts (string split . -- $new_full)
    if test (count $parts) -lt 2
        echo "NEW_VERSION must be at least major.minor (e.g. 1.25 or 1.25.4)"
        return 1
    end
    set -l new_mod "$parts[1].$parts[2]"

    if not test -f go.mod
        echo "go.mod not found"
        return 1
    end

    set -l old_mod (awk '/^go / {print $2; exit}' go.mod)
    if test -z "$old_mod"
        echo "Could not find current Go version in go.mod"
        return 1
    end

    echo "Updating go.mod: $old_mod -> $new_mod"
    sed -i '' -E "s/^go[[:space:]]+$old_mod\$/go $new_mod/" go.mod; or return 1

    if command -q rg
        set -l dockerfiles (rg -l --hidden --glob '!.git' -g 'Dockerfile*' '^FROM[[:space:]]+golang:' .)
    else
        set -l dockerfiles (find . -maxdepth 5 -name 'Dockerfile*' 2>/dev/null)
    end

    for f in $dockerfiles
        echo "Updating $f: golang:* -> golang:$new_full"
        sed -i '' -E "s/^(FROM[[:space:]]+golang:)[^[:space:]]+/\1$new_full/" "$f"; or return 1
    end

    git add -A
    git commit -m "feat: update go to $new_full"
    git push
end
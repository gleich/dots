function go_version_update --description 'Update the go version in the current project'
    if test (count $argv) -ne 1
        echo "Usage: go_version_update NEW_VERSION"
        return 1
    end

    set -l new_version $argv[1]

    if not test -f go.mod
        echo "go.mod not found"
        return 1
    end

    set -l old_version (awk '/^go / {print $2; exit}' go.mod)

    if test -z "$old_version"
        echo "Could not find current Go version in go.mod"
        return 1
    end

    echo "Updating Go version $old_version -> $new_version"

    if not command -q rg
        echo "ripgrep (rg) not found; install it (e.g. brew install ripgrep)"
        return 1
    end

    set -l files (rg -l --fixed-strings --hidden --glob '!.git' -- "$old_version" .)

    if test (count $files) -eq 0
        echo "No files contain $old_version"
        return 1
    end

    for f in $files
        sed -i '' "s/$old_version/$new_version/g" "$f"; or begin
            echo "sed failed on $f"
            return 1
        end
    end

    git commit -am "feat: update go to $new_version"
    git push
end

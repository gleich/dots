function ghrel --description "Tag + push + create a GitHub release as latest (interactive notes)"
    set -l ver $argv[1]
    if test -z "$ver"
        echo "usage: ghrel v1.2.3" 1>&2
        return 2
    end

    if not string match -rq '^v' -- $ver
        set ver "v$ver"
    end

    if not string match -rq '^v[0-9]+\.[0-9]+\.[0-9]+$' -- $ver
        echo "error: version must look like v1.2.3 (got: $ver)" 1>&2
        return 2
    end

    if not command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        echo "error: not inside a git repository" 1>&2
        return 1
    end

    if not command -sq gh
        echo "error: GitHub CLI 'gh' not found. Install it: https://cli.github.com/" 1>&2
        return 1
    end
    if not gh auth status >/dev/null 2>&1
        echo "error: gh is not authenticated. Run: gh auth login" 1>&2
        return 1
    end

    if git rev-parse -q --verify "refs/tags/$ver" >/dev/null 2>&1
        echo "error: tag already exists: $ver" 1>&2
        return 1
    end

    if test -n (command git status --porcelain)
        echo "error: working tree not clean. Commit or stash before releasing." 1>&2
        return 1
    end

    echo "Creating annotated tag $ver ..."
    command git tag -a "$ver" -m "$ver"
    or return 1

    echo "Pushing tag $ver ..."
    command git push origin "$ver"
    or return 1

    echo
    echo "Creating GitHub release $ver (this will open your editor for notes)..."
    echo "Tip: your editor is controlled by \$GIT_EDITOR / \$VISUAL / \$EDITOR"
    echo

    command gh release create "$ver" \
        --title "$ver" \
        --latest \
        --notes-file -
end

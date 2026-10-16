function s
    set -l src_path
    if test (count $argv) -gt 0
        for dir in ~/src ~/src/gleich ~/src/*
            if test -d "$dir/$argv[1]"
                set src_path "$dir/$argv[1]"
                break
            end
        end
        if test -z "$src_path"
            echo "s: $argv[1] not found in ~/src" >&2
            return 1
        end
    else
        cd ~/src/
        or return
        set src_path (fd . --type d --exact-depth 2 | sk --color=bw --reverse --no-mouse --no-multi)
        or return
    end
    cd "$src_path"
end

complete -c s -f -a "(cd ~/src; and __fish_complete_directories)"
complete -c s -f -a "(path basename ~/src/*/*/)"

function s
    set -l history_file ~/.local/share/s_history
    set -l recent_dirs (command cat $history_file 2>/dev/null)
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
        set -l dirs (fd . --type d --exact-depth 2 | string trim -r -c /)
        set -l ordered
        for entry in $recent_dirs
            if contains -- $entry $dirs
                set -a ordered $entry
            end
        end
        set -l choice (printf '%s\n' $ordered $dirs | awk '!seen[$0]++' | sk --color=bw --reverse --no-mouse --no-multi)
        or return
        set src_path ~/src/$choice
    end
    cd "$src_path"
    or return
    set -l entry (string replace -- ~/src/ "" $src_path | string trim -r -c /)
    printf '%s\n' $entry $recent_dirs | awk '!seen[$0]++' >$history_file
end

complete -c s -f -a "(cd ~/src; and __fish_complete_directories)"
complete -c s -f -a "(path basename ~/src/*/*/)"

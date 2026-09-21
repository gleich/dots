function s
    set -l src_path
    if test (count $argv) -gt 0
        set src_path ~/src/$argv[1]
        if not test -d "$src_path"
            set src_path ~/src/gleich/$argv[1]
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
complete -c s -f -a "(cd ~/src/gleich; and __fish_complete_directories)"

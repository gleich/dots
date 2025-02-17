function s
    if test (count $argv) -gt 0
        set src_path ~/src/gleich/$argv
    else
        cd ~/src/
        set src_path (fd . --type d --exact-depth 2 | sk --color=bw --reverse --no-mouse --no-multi)
    end
    cd $src_path
end

complete -c s -f -a "(command ls ~/src/gleich)"

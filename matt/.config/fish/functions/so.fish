function so
    if test (count $argv) -gt 0
        set src_path ~/src/gleich/$argv
    else
        cd ~/src/
        set src_path (fd . --type d --exact-depth 2 | sk --color=bw --reverse --no-mouse --no-multi)
    end
    cd $src_path
    kitten @ launch --no-response --keep-focus --type="tab" --cwd="current"
end

complete -c so -f -a "(command ls ~/src/gleich)"

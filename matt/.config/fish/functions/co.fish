function co
    if test (count $argv) -gt 0
        set src_path ~/.config/$argv
    else
        set src_path ~/.config/
    end
    cd $src_path
end

complete -c co -f -a "(command ls ~/.config)"

function co
    if count $argv > /dev/null
        set src_path ~/.config/$argv
    else
        set src_path ~/.config/
    end
    cd $src_path
end

complete -c s -f -a "(command ls ~/.config/)"

function s
    if count $argv > /dev/null
        set src_path ~/src/gleich/$argv
    else
        set src_path ~/src/
    end
    cd $src_path
end

complete -c s -a "(command ls ~/src/gleich)"

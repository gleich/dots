function s
    set src_path ~/src/$argv
    cd $src_path
end

# Register the completion
complete -c s -a "(command ls ~/src)"

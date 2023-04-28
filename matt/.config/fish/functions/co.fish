function co
    set config_path ~/.config/$argv
    cd $config_path
end

# Register the completion
complete -c co -a "(command ls ~/.config/)"

source ~/.config/fish/functions.fish
source ~/.config/fish/alias.fish

set fish_greeting

# terminal colors
set -U fish_color_autosuggestion brblack
set -U fish_color_cancel -r
set -U fish_color_command brgreen
set -U fish_color_comment brmagenta
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_end brmagenta
set -U fish_color_error brred
set -U fish_color_escape brcyan
set -U fish_color_history_current --bold
set -U fish_color_host normal
set -U fish_color_match --background=brblue
set -U fish_color_normal normal
set -U fish_color_operator cyan
set -U fish_color_param brblue
set -U fish_color_quote yellow
set -U fish_color_redirection bryellow
set -U fish_color_search_match bryellow '--background=brblack'
set -U fish_color_selection white --bold '--background=brblack'
set -U fish_color_status red
set -U fish_color_user brgreen
set -U fish_color_valid_path --underline
set -U fish_pager_color_completion normal
set -U fish_pager_color_description yellow
set -U fish_pager_color_prefix white --bold --underline
set -U fish_pager_color_progress brwhite '--background=cyan'

# vim
fish_vi_key_bindings
set fish_cursor_insert line blink

# custom vim prompt theme
function fish_mode_prompt
    echo ' ['
    switch $fish_bind_mode
        case default
            set_color --bold red
            echo N
        case insert
            set_color --bold green
            echo I
        case replace_one
            set_color --bold green
            echo R
        case visual
            set_color --bold cyan
            echo V
        case '*'
            set_color --bold red
            echo '?'
    end
    set_color normal
    echo '] '
end

# bun install path
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

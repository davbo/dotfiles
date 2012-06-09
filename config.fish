set -g -x fish_greeting ''
set -g -x EDITOR vim

set -g -x PIP_DOWNLOAD_CACHE "$HOME/.pip/cache"

# Prompt {{{

set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set gray (set_color -o black)

function fish_prompt
    set_color yellow
    printf '%s' (whoami)
    set_color normal
    printf ' at '

    set_color magenta
    printf '%s' (hostname|cut -d . -f 1)
    set_color normal
    printf ' in '

    set_color $fish_color_cwd
    printf '%s' (prompt_pwd)
    set_color normal

    echo
    printf '↪ '
    set_color normal
end

# }}}

set -g -x fish_greeting ''
set -g -x EDITOR vim

# Oxford
set -g -x PRIVATE_PYPI "http://localshop.oucs.ox.ac.uk/simple"
set -g -x MOXIE_SETTINGS "/home/dave/projects/moxie/local_settings.yaml"
set -g -x MOXIE_CELERYCONFIG "/home/dave/projects/moxie/local_celeryconfig.yaml"

set -g -x adb_user "dave"

set -g -x PIP_DOWNLOAD_CACHE "$HOME/.pip/cache"

set -gx PATH /home/dave/android-sdks/platform-tools $PATH
set -gx PATH /home/dave/android-sdks/tools $PATH

# Stop the activate.fish prompt setting an ugly prompt
set -g -x VIRTUAL_ENV_DISABLE_PROMPT 1

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

    # Line 2
    echo
    if test $VIRTUAL_ENV
        printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
    end
    printf '↪ '
    set_color normal
end

# }}}

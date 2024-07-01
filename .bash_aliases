alias kopi='perl -pe "chomp if eof" | xsel --clipboard'
alias xb='xsel --clipboard'
alias bat='upower --show-info /org/freedesktop/UPower/devices/battery_BAT0'
alias path='echo "${PATH}" | tr ":" "\n"'
alias ve='python -m venv env'
alias va='source env/bin/activate'
alias wp='which python'
alias pu='python -m pip install --upgrade pip setuptools wheel'
alias pin='python -m pip install'
alias pun='python -m pip uninstall'
alias pf='python -m pip freeze'
alias pl='python -m pip list'
alias pv='python --version'
alias vd='deactivate'
alias lv='ls -v'
alias lt='ls --human-readable --all -l -t'
alias lat='ls -t | head'
alias open='xdg-open &> /dev/null'
alias tmux='tmux -2'
alias smi='watch nvidia-smi'
alias vih='vim -c ":help | only"'
alias dol='docker login harbor.ste.k8s'
alias feh='feh --sort filename --version-sort'
alias deh='feh --geometry 960x720 --scale-down --auto-zoom'
alias dof='git --git-dir "${HOME}/.config/dotfiles.git/" --work-tree "${HOME}"'
alias ght='ssh -T git@github.com'
alias sshl='ssh-add -L'
alias l.='ls --directory .[!.]* 2> /dev/null'
# alias l.='ls --directory .[!.]*'
alias r.='rm -rfI .[!.]*'
alias todo='grep  --recursive --include "*.py" "TODO"'
alias vpn='openvpn3 sessions-list'
alias jpg='mogrify -format jpg'
alias wget='wget --content-disposition'
alias lesh='less --chop-long-lines +g'
alias mp='mountpoint'
alias sshfu='fusermount -u'
alias sshnf='ssh -o ClearAllForwardings=yes'
alias sshl='ssh-add -L'
alias sin='[[ $- == *i* ]] && echo "Interactive shell." || echo "Not interactive."'
alias slo='shopt -q login_shell && echo "Login shell." || echo "Not login shell."'
alias dfh='df --human-readable | grep --invert-match /snap'
alias pig='cat ${HOME}/.config/gitignore/Python.gitignore >> .gitignore'
alias disp='echo ${DISPLAY}'
alias nv='cat /proc/driver/nvidia/version'
alias dupa='echo "${PATH}" | tr ":" "\n" | sort | uniq -D'
# To fix "missing or unsuitable terminal: alacritty" error when SSHing.
# https://github.com/alacritty/alacritty/issues/3633
alias ssh='TERM="xterm-256color" ssh'
alias bfg='java -jar ${HOME}/bfg.jar'

vpc() {
    if [[ -z "${1}" ]]; then
        config_file="${HOME}/.config/vpn/220902_STE-SELETAR-VPN_config.conf"
    else
        config_file="${1}"
    fi
    openvpn3 session-start --config ${config_file}
}

vpd() {
    if [[ -z "${1}" ]]; then
        config_name="${HOME}/.config/vpn/220902_STE-SELETAR-VPN_config.conf"
        openvpn3 session-manage --disconnect --config ${config_name}
    else
        session_path="${1}"
        openvpn3 session-manage --disconnect --session-path ${session_path}
    fi
}

json() {
    # Input is piped in.
    if [[ -z "${1}" ]]; then
        python -m json.tool \
            | pygmentize -l json -O 'style = monokai' \
            | less --RAW-CONTROL-CHARS
    # Input comes from a file.
    else
        python -m json.tool "${1}" \
            | pygmentize -l json -O  'style = monokai' \
            | less --RAW-CONTROL-CHARS
    fi
}

# Check largest files in a Git repo.
gila() {
    git rev-list --objects --all \
    | git cat-file \
        --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' \
    | sed -n 's/^blob //p' \
    | sort --numeric-sort --key=2 --reverse \
    | cut -c 1-12,41- \
    | $(command -v gnumfmt || echo numfmt) \
        --field=2 --to=iec-i --suffix=B --padding=7 --round=nearest \
    ;
}

# Add directory to path only if it's not in path.
# Solution copied from:
# https://superuser.com/a/39995
pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}


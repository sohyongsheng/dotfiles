alias kopi='perl -pe "chomp if eof" | xsel --input --clipboard'
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias path='echo "${PATH}" | tr ":" "\n"'
alias ve='python3 -m venv env'
alias va='source env/bin/activate'
alias wp='which python'
alias pu='python -m pip install --upgrade pip setuptools wheel'
alias pin='python -m pip install'
alias pinu='python -m pip install --upgrade'
alias pun='python -m pip uninstall'
alias pf='python -m pip freeze'
alias pv='python --version'
alias vd='deactivate'
alias lv='ls -v'
alias lt='ls -halt'
alias open='xdg-open &> /dev/null'
alias tmux='tmux -2'
alias smi='watch nvidia-smi'
alias vih='vim -c ":help | only"'
alias dol='docker login harbor.ste.k8s'
alias deh='feh --geometry 960x720 --scale-down --auto-zoom'
alias con='git --git-dir ${HOME}/.config.git/ --work-tree ${HOME}'
alias ght='ssh -T git@github.com'
alias l.='ls -d .[!.]*'
alias r.='rm -rfI .[!.]*'

json () {
    # Input is piped in.
    if [[ -z $1 ]]; then
        python -m json.tool | pygmentize -l json -O 'style = monokai'
    # Input comes from a file.
    else
        python -m json.tool $1 | pygmentize -l json -O  'style = monokai'
    fi
}


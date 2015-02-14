alias ls="ls --color -F"
alias ll="ls --color -lh"
alias la="ls --color -lha"
alias lrt="ls --color -lhrt"

showlog() {
	flp | grep $1 | awk '{ print $8 }' | xargs tail -f
}

alias flp='forever list --plain'

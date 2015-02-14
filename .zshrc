alias ls="ls --color -F"
alias ll="ls --color -lh"
alias la="ls --color -lha"
alias lrt="ls --color -lhrt"
alias www="nohup firefox &"
alias wwwtor="nohup ~/bin/tor-browser_en-US/start-tor-browser &"
alias video="mplayer -softvol -softvol-max 1000 -af scaletempo"

export BROWSER="firefox"
export EDITOR="vim"
export PATH=~/.bin/R2014a/bin:~/.bin/activator-1.2.7:~/.bin/play-2.2.3:$PATH
export LD_LIBRARY_PATH=/opt/NAG/cll6a23dgl/lib
export NAG_KUSARI_FILE=/opt/NAG/nag.key
export NODE_ENV='development'

HISTFILE=~/.history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

bindkey -e

autoload -Uz compinit && compinit
autoload -Uz select-word-style && select-word-style bash
autoload -Uz vcs_info

setopt PROMPT_SUBST

zstyle ':completion:*' menu select
#zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats '%b'
zstyle ':vcs_info:git*' actionformats '%b|%a'

function git_time() {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || return
	git log -1 --pretty=format:"%ar" | sed 's/\([0-9]*\) \(.\).*/\1\2/'
}

function git_dirty() {
	git rev-parse --is-inside-work-tree &>/dev/null || return
	git diff --quiet --ignore-submodules HEAD &>/dev/null; [ $? -eq 1 ] && echo 1
}

[ $USER != 'jonatt' ] && local username='%n'
[ $HOST != 'kafka' ] && local hostname='%m'

function precmd() {
	vcs_info
	dirinfo='%F{blue}%~%f'

	if [ "`git_dirty`" -eq 1 ]; then
		gitdirty="%F{yellow}`git_time`%f"
	else
		gitdirty=''
	fi

	[ "$username" != '' ] && userstring="$username"
	[ "$hostname" != '' ] && userstring="$username@$hostname"
	userinfo="%F{magenta}$userstring%f"
	RPROMPT='$userinfo $dirinfo $vcs_info_msg_0_ $gitdirty'
}

PROMPT='%(?.%F{cyan}.%F{red})›%f '

if [[ ! ${DISPLAY} && ${XDG_VTNR} == 1 ]]; then
	exec startx
fi

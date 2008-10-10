export PS1="\[\e[0;35m\]\u\[\e[m\]@\[\e[0;33m\]\h\[\e[m\]:\w \[\e[0;31m\][\!:\j]\[\e[m\]$ "
export PATH=/opt/local/bin:/opt/local/sbin:$PATH 
export PATH=/usr/local/bin:$PATH 
export PATH=/Users/Basil/dev/scripts/:$PATH 

alias mutt='mutt -y'

set -o vi

# Terminal title 
case $TERM in
		xterm*|rxvt*|Eterm|aterm)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
				;;
		screen)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
				;;
esac

# enable color support of ls
if [ "$TERM" != "dumb" ]; then
	alias ls='ls -G'
fi

# aliases
alias sshom='ssh bshkara_om@ssh.phx.nearlyfreespeech.net'

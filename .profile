export PS1="\[\e[0;35m\]\u\[\e[m\]@\[\e[0;33m\]\h\[\e[m\]:\w \[\e[0;31m\][\!:\j]\[\e[m\]$ "
export PATH=/usr/local/homebrew/bin:/Users/Basil/.gem/ruby/1.8/bin:/Users/Basil/Development/_Scripts:/Developer/usr/bin:$PATH
export EDITOR=vim

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
alias sshrepo='ssh bshkara_omrepo@ssh.phx.nearlyfreespeech.net'

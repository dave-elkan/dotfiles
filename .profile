export PS1="\[\e[0;35m\]\u\[\e[m\]@\[\e[0;33m\]\h\[\e[m\]:\w \[\e[0;31m\][\!:\j]\[\e[m\]$ "
export PATH=/usr/local/homebrew/bin:~/.gem/bin:/Developer/usr/bin:$PATH
export EDITOR=vim

# Git bash completion
source /usr/local/git/contrib/completion/git-completion.bash

# Keep Ruby gems in home path
export GEM_HOME=$HOME/.gem
export GEM_PATH=$HOME/.gem:/usr/lib/ruby/gems1.8

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

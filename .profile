export PATH=/usr/local/homebrew/bin:~/.gem/bin:/Developer/usr/bin:~/Development/_Scripts:$PATH
export EDITOR=vim
export CLASSPATH=$(find ${HOME}/Development/_Libraries/Clojure -type f | tr '\n' ':' | sed 's/:$//'):$CLASSPATH

# Git bash completion
source /usr/local/git/contrib/completion/git-completion.bash

# Git state
function parse_git_dirty {
	[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo ":Δ"
}
function parse_git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

export PS1="\[\e[0;35m\]\u\[\e[m\]@\[\e[0;33m\]\h\[\e[m\]:\w "'\[\033[1;34m\]$(parse_git_branch "[%s]")'"\[\e[0;31m\][\!:\j]\[\e[m\]$ "

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

export LANG=en_US.UTF-8

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(
	ag
	git
	z
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# homebrew
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

# fnm
eval "$(fnm env --use-on-cd)"

export PATH=/usr/local/bin:$PATH
alias ff="source ~/.zshrc"
alias vi="nvim"
alias p="pnpm"
alias j="z"
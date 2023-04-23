export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh
export PATH=/usr/local/bin:$PATH

alias ff="source ~/.zshrc"

source /usr/local/etc/profile.d/autojump.sh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh


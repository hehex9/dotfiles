SHELL = /bin/zsh

.PHONY: all
all: sync

.PHONY: sync
sync:
	mkdir -p ~/.config/alacritty
	mkdir -p ~/Code/github
	[ -f ~/.config/alacritty/alacritty.yml ] || ln -s $(PWD)/alacritty.yml ~/.config/alacritty/alacritty.yml
	[ -f ~/.gitconfig ] || ln -s $(PWD)/.gitconfig ~/.gitconfig
	[ -f ~/.tigrc ] || ln -s $(PWD)/.tigrc ~/.tigrc
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/.tmux.conf ~/.tmux.conf
	[ -f ~/.vimrc ] || ln -s $(PWD)/.vimrc ~/.vimrc
	[ -f ~/.zshrc ] || ln -s $(PWD)/.zshrc ~/.zshrc

.PHONY: clean
clean:
	rm -f ~/.config/alacritty/alacritty.yml
	rm -f ~/.gitconfig
	rm -f ~/.tigrc
	rm -f ~/.tmux.conf
	rm -f ~/.vimrc
	rm -f ~/.zshrc

.PHONY: macos
macos:
	defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

.PHONY: omz
omz:
	[ -f ~/.zshrc ] || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

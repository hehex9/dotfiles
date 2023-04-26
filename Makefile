SHELL = /bin/zsh

.PHONY: sync
sync:
	mkdir -p ~/.config/alacritty
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

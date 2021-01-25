.PHONY: zshrc

install: powerlevel10k copy-zshrc

powerlevel10k:
	mkdir -p ~/.zsh/powerlevel10k
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k

zshrc:
	cp zshrc ~/.zshrc

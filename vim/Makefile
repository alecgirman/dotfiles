INSTALLDIR=~/.config/nvim
VIMPLUGDIR=~/.local/share/nvim/site/autoload
VIMPLUGURL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
COCEXTDIR=~/.config/coc/extensions

# full install
install: vimplug snippets
	mkdir -p $(INSTALLDIR)
	cp init.vim $(INSTALLDIR)
	# https://github.com/junegunn/vim-plug/issues/225
	nvim --headless +PlugInstall +q +q
	make coc-extensions

# remove all plugin files
uninstall:
	rm -rf $(INSTALLDIR)/init.vim
	rm -rf $(INSTALLDIR)/UltiSnips
	rm -rf $(VIMPLUGDIR)/plug.vim
	rm -rf $(COCEXTDIR)

# install vim plug
vimplug:
	mkdir -p $(VIMPLUGDIR)
	curl $(VIMPLUGURL) > $(VIMPLUGDIR)/plug.vim

# install custom snippets
snippets:
	cp -r UltiSnips $(INSTALLDIR)/

# update dotfiles folder after making changes to
# config files in the install directory
updatelocal:
	cp -r $(INSTALLDIR)/UltiSnips ./
	cp $(COCEXTDIR)/package.json package.json

# install coc extensions with yarn
coc-extensions:
	mkdir -p $(COCEXTDIR)
	cp package.json $(COCEXTDIR)
	cd $(COCEXTDIR) && yarn install && cd -

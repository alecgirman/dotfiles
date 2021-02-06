INSTALLDIR=~/.config/nvim
VIMPLUGDIR=~/.local/share/nvim/site/autoload
VIMPLUGURL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
COCEXTDIR=~/.config/coc/extensions

# full install
install: vimplug snippets python-scripts
	mkdir -p $(INSTALLDIR)
	cp init.vim $(INSTALLDIR)
	cp -r ftplugin/ $(INSTALLDIR)
	# https://github.com/junegunn/vim-plug/issues/225
	nvim --headless +PlugInstall +q +q
	make coc-extensions

# remove all plugin files
uninstall:
	rm -rf $(INSTALLDIR)/init.vim
	rm -rf $(INSTALLDIR)/UltiSnips
	rm -rf $(INSTALLDIR)/ftplugin
	rm -rf $(VIMPLUGDIR)/plug.vim
	rm -rf $(COCEXTDIR)

# install vim plug
vimplug:
	mkdir -p $(VIMPLUGDIR)
	curl $(VIMPLUGURL) > $(VIMPLUGDIR)/plug.vim

# install custom snippets
snippets:
	cp -r UltiSnips $(INSTALLDIR)/

python-scripts:
	cp -r scripts $(INSTALLDIR)/

# update dotfiles folder after making changes to
# config files in the install directory
updatelocal:
	cp -r $(INSTALLDIR)/UltiSnips ./
	cp -r $(INSTALLDIR)/init.vim ./
	cp $(COCEXTDIR)/package.json package.json
	cp -r $(INSTALLDIR)/ftplugin ./

# install coc extensions with yarn
coc-extensions:
	mkdir -p $(COCEXTDIR)
	cp package.json $(COCEXTDIR)
	cd $(COCEXTDIR) && yarn install && cd -

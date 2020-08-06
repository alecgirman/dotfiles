# Very simple ZSH plugin manager

# Install plugin into custom plugin dir
plugin_install() {
    # clone into oh-my-zsh custom plugin folder
    pushd ~/.oh-my-zsh/custom/plugins/
    git clone "https://github.com/$1"
    popd

    # plugin must be added to .zshrc manually
}

# Updates all custom plugins
plugin_update() {
    pushd ~/.oh-my-zsh/custom/plugins/

    # for each folder in the custom plugin directory
    for folder in $(/usr/bin/ls)
    do
        # cd into plugin folder and run git pull to update plugin
        cd $folder && git pull && cd ..
    done
    popd
}


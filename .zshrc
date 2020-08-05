export ZSH="/root/.oh-my-zsh"
export LANG=en_US.UTF-8
export LANGUAGE=en_US

fpath+=$HOME/.zsh/pure
plugins=(git)
source $ZSH/oh-my-zsh.sh

autoload -U colors;
autoload -U promptinit;

colors && promptinit;
prompt pure

eval $(thefuck --alias)

alias rlz="source ~/.zshrc"
alias ls='ls --color'
alias chx='chmod +x'

# alias mvs="mv $1 $2; ln -s $2/$1 $1"

alias snow='shutdown now'

# :)
alias :q='exit'
alias sl='echo "You spelled ls wrong"; ls'

# desktop env
alias kde='xinit /usr/bin/startplasma-x11'

# source other files
source ~/dotfiles/zsh/startup.zsh

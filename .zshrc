# exports
export ZSH="/root/.oh-my-zsh"
export LANG=en_US.UTF-8
export LANGUAGE=en_US

# oh my zsh setup
# 爵 https://ohmyz.sh
#   https://github.com/ohmyzsh/ohmyzsh
plugins=(git colored-man-pages zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# setup pure prompt (my favorite zsh prompt)
#   https://github.com/sindresorhus/pure
fpath+=$HOME/.zsh/pure
autoload -U colors;
autoload -U promptinit;
colors && promptinit;
prompt pure

# Vi mode options
bindkey -v
export KEYTIMEOUT=0.3

# init thefuck alias
eval $(thefuck --alias)

# some basic command aliases
alias rlz="source ~/.zshrc"
alias ls='ls --color'
alias chx='chmod +x'
alias snow='shutdown now'

# spelling error aliases
alias :q='exit'
alias sl='echo "You spelled ls wrong"; ls'

# desktop env
alias kde='xinit /usr/bin/startplasma-x11'

# source other files
source ~/dotfiles/zsh/startup.zsh
source ~/dotfiles/zsh/zplugman.zsh

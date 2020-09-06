# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# exports
export ZSH="/root/.oh-my-zsh"
export LANG=en_US.UTF-8
export LANGUAGE=en_US

# XDG directories
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

# oh my zsh setup
# 爵 https://ohmyz.sh
#   https://github.com/ohmyzsh/ohmyzsh
plugins=(git colored-man-pages zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# setup pure prompt (my favorite zsh prompt)
#   https://github.com/sindresorhus/pure
autoload -U colors;
autoload -U promptinit;
colors && promptinit;

source /root/.oh-my-zsh/custom/plugins/powerlevel10k/powerlevel10k.zsh-theme

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

# cargo
alias ccb='cargo clean; cargo build'
alias ccbr='cargo clean; cargo build; cargo run'

# spelling error aliases
alias :q='exit'
alias sl='echo "You spelled ls wrong"; ls'

# desktop env
alias kde='xinit /usr/bin/startplasma-x11'
alias bspwm='xinit /usr/local/bin/bspwm'

# source other files
source ~/dotfiles/zsh/startup.zsh
source ~/dotfiles/zsh/zplugman.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

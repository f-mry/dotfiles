source ~/.zshalias
# source ~/c_overload.sh

# AUTOENV_ENABLE_LEAVE="1"
# source ~/PROGRAM/autoenv/activate.sh

### Added by Zplugin's installer
source '/home/farhanmry/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

### End of Zplugin installer's chunk

# The following lines were added by compinstall

zstyle :compinstall filename '/home/farhanmry/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd
bindkey -e
zstyle ':completion:*' menu select
zstyle ':completion:::::' completer _expand _complete _ignored _approximate
zstyle ':completion:*' max-errors 5


# set -o vi
# End of lines configured by zsh-newuser-install

# SPACESHIP_GOLANG_SHOW=true
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_STRATEGY=( completion history )

# zplugin ice silent wait'!' atload'clear;'
zplugin light denysdovhan/spaceship-prompt
zplugin light zdharma/fast-syntax-highlighting
zplugin ice silent wait'!1'
zplugin light mdumitru/git-aliases
zplugin light shanedabes/zsh-tmux
zplugin light zsh-users/zsh-autosuggestions
# eval "$(starship init zsh)"

bindkey '^J' autosuggest-accept
source '/home/farhanmry/.zplugin/spaceship.zsh'
source '/usr/share/fzf/key-bindings.zsh'
source '/usr/share/fzf/completion.zsh'

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

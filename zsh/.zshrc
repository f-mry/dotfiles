# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' file-sort name
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' menu select=0
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' verbose true
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
# End of lines configured by zsh-newuser-install

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

## Zinit's Plugins
zinit light spaceship-prompt/spaceship-prompt
zinit light zdharma/fast-syntax-highlighting
zinit ice silent wait'!1'
zinit light zsh-users/zsh-autosuggestions

## Alias
source "$HOME/.zshalias"

## FZF Config
source '/usr/share/fzf/key-bindings.zsh'
source '/usr/share/fzf/completion.zsh'

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

## Autosuggest Config
bindkey '^J' autosuggest-accept

## Spaceship Config

SPACESHIP_EXEC_TIME_SHOW=false

SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  host          # Hostname section
  exit_code     # Exit code section
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  char          # Prompt character
)


SPACESHIP_RPROMPT_ORDER=(
  git           # Git section (git_branch + git_status)
  dir           # Current directory section
)

SPACESHIP_DIR_PREFIX="|"
SPACESHIP_DIR_SUFFIX=""
# SPACESHIP_DIR_COLOR=244
SPACESHIP_DIR_COLOR=grey

SPACESHIP_GIT_BRANCH_COLOR=blue
SPACESHIP_GIT_STATUS_COLOR=red

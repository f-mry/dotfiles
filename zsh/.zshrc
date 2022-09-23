# zmodload zsh/zprof
# The following lines were added by compinstall
#
fpath=(~/.zsh/completion $fpath)
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' file-sort name
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' menu select=0
# zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
# zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/farhanmry/.zshrc'

autoload -U compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install

export EDITOR=nvim

#Prompt
fpath+=($HOME/.zsh/prompt)
autoload -Uz prompt_purification_setup && prompt_purification_setup


HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY_TIME

setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install

## Alias
source "$HOME/.zshalias"
source "$HOME/.zshenv"

## FZF Config
source '/usr/share/fzf/key-bindings.zsh'
source '/usr/share/fzf/completion.zsh'

export FZF_DEFAULT_COMMAND='fd --type file -E .git -E .venv -E node_modules -E vendor -E vendors'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d -E .venv -E node_modules -E vendor -E vendors -E ,cache -d 4 -H'

# # Use fd (https://github.com/sharkdp/fd) instead of the default find
# # command for listing path candidates.
# # - The first argument to the function ($1) is the base path to start traversal
# # - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
    fd -I --type file -E .venv -E node_modules -E vendor -E vendors . "$1" 
  }

# # Use fd to generate the list for directory completion
_fzf_compgen_dir() {
    fd --type d -E .venv -E node_modules -E vendor -E vendors . "$1"
}

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

# Edit command line
# use text editor to write comman then execute it on exit

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line

# zprof



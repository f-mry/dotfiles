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

eval "$(starship init zsh)"

# Base 16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] && \
#     [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#     eval "$("$BASE16_SHELL/profile_helper.sh")"

eval "$(_TMUXP_COMPLETE=source_zsh tmuxp)"

## Alias
source "$HOME/.zshalias"
source "$HOME/.zshenv"

## FZF Config
source '/usr/share/fzf/key-bindings.zsh'
source '/usr/share/fzf/completion.zsh'

export FZF_DEFAULT_COMMAND='fd --type file -E .git -E .venv -E node_modules -E vendor -E vendors'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d -E .venv -E node_modules -E vendor -E vendors'

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

# fzf colorscheme
source "$HOME/.zsh/base16-fzf/bash/base16-default-dark.config"

autoload -Uz add-zsh-hook

function xterm_title_precmd () {
	print -Pn -- '\e]2;%~\a'
	[[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}

function xterm_title_preexec () {
	print -Pn -- '\e]2;%~ | ' && print -n -- "${(q)1}\a"
	[[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
}

if [[ "$TERM" == (Eterm*|alacritty*|aterm*|gnome*|konsole*|kterm*|putty*|rxvt*|screen*|tmux*|xterm*) ]]; then
	add-zsh-hook -Uz precmd xterm_title_precmd
	add-zsh-hook -Uz preexec xterm_title_preexec
fi

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^J' autosuggest-accept
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# pip zsh completion start
# function _pip_completion {
#   local words cword
#   read -Ac words
#   read -cn cword
#   reply=( $( COMP_WORDS="$words[*]" \
#              COMP_CWORD=$(( cword-1 )) \
#              PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
# }
compctl -K _pip_completion pip
# pip zsh completion end
#
# zprof



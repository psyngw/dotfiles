# Setup fzf
# ---------
if [[ ! "$PATH" == */home/warren/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}${HOME}/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${HOME}/.config/utils/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "${HOME}/.config/utils/key-bindings.zsh"

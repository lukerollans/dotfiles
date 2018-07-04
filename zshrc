# modify the prompt to contain git branch name if applicable
git_prompt_info() {
  current_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  if [[ -n $current_branch ]]; then
    echo " %{$fg_no_bold[green]%}$current_branch%{$reset_color%}"
  fi
}
setopt promptsubst
export PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%c%{$reset_color%}$(git_prompt_info) %# '

# Autocomplete
autoload -U compinit
compinit

# makes color constants available
autoload -U colors
colors

# history settings
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=100
SAVEHIST=100

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^K" kill-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# yarn
export PATH="$HOME/.yarn/bin:$PATH"

# asdf package manager
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# fzf for fuzzy finding
# Use The Silver Searcher (`ag`) as the default fzf finder
export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lukerollans/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/lukerollans/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/lukerollans/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/lukerollans/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

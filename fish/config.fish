# Set universal editor
set -U EDITOR vim

# Setup asdf
source ~/.asdf/asdf.fish

# fzf for fuzzy finding
# Use The Silver Searcher (`ag`) as the default fzf finder
export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'

# Set some arbitrary aliases I use
alias mt "mix test"
alias mc "mix compile"

# Add Android Studio things
set PATH ~/Library/Android/sdk/tools $PATH
set PATH ~/Library/Android/sdk/platform-tools $PATH

# Use Starship prompt
# https://starship.rs
export STARSHIP_CONFIG=~/.dotfiles/starship.toml
eval (starship init fish)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lukerollans/code/google-cloud-sdk/google-cloud-sdk/path.fish.inc' ]; . '/Users/lukerollans/code/google-cloud-sdk/google-cloud-sdk/path.fish.inc'; end

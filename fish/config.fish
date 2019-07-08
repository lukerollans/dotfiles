# Set universal editor
set -U EDITOR vim

# Setup asdf
source ~/.asdf/asdf.fish

# fzf for fuzzy finding
# Use The Silver Searcher (`ag`) as the default fzf finder
export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'

# Set some random aliases I use
alias mt "mix test"

# Add Android Studio things
set PATH ~/Library/Android/sdk/tools $PATH
set PATH ~/Library/Android/sdk/platform-tools $PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lukerollans/google-cloud-sdk/path.fish.inc' ]; . '/Users/lukerollans/google-cloud-sdk/path.fish.inc'; end

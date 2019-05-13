# Set universal editor
set -U EDITOR vim

# Setup asdf
source ~/.asdf/asdf.fish

# fzf for fuzzy finding
# Use The Silver Searcher (`ag`) as the default fzf finder
export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lukerollans/Desktop/google-cloud-sdk/path.fish.inc' ]; . '/Users/lukerollans/Desktop/google-cloud-sdk/path.fish.inc'; end

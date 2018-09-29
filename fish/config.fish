# Set universal editor
set -U EDITOR vim

# Setup asdf
source ~/.asdf/asdf.fish

# fzf for fuzzy finding
# Use The Silver Searcher (`ag`) as the default fzf finder
export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lukerollans/Downloads/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/Users/lukerollans/Downloads/google-cloud-sdk/path.fish.inc'; else; . '/Users/lukerollans/Downloads/google-cloud-sdk/path.fish.inc'; end; end

# Add composer binaries to path
set -gx PATH ~/.composer/vendor/bin $PATH

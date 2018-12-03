# Set universal editor
set -U EDITOR vim

# Setup asdf
source ~/.asdf/asdf.fish

# fzf for fuzzy finding
# Use The Silver Searcher (`ag`) as the default fzf finder
export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'

# Add composer binaries to path
set -gx PATH ~/.composer/vendor/bin $PATH

# Add brew mysql binary to path
set -gx PATH /usr/local/opt/mysql@5.7/bin $PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lukerollans/Desktop/google-cloud-sdk/path.fish.inc' ]; . '/Users/lukerollans/Desktop/google-cloud-sdk/path.fish.inc'; end

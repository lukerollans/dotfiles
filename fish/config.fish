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
set -g STARSHIP_CONFIG ~/.dotfiles/starship.toml
eval (starship init fish)

# Ensure compilers can find openssl
set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths
set -gx LDFLAGS "-L/usr/local/opt/openssl@1.1/lib"
set -gx CPPFLAGS "-I/usr/local/opt/openssl@1.1/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl@1.1/lib/pkgconfig"

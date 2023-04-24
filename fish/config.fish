# Set universal editor
set -U EDITOR vim

# fzf for fuzzy finding
# Use The Silver Searcher (`ag`) as the default fzf finder
export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'

# Set some arbitrary aliases I use
alias mt "mix test"
alias mc "mix compile"

# Ensure Homebrew paths are available
set -gx HOMEBREW_PREFIX "/opt/homebrew";
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
set -q PATH; or set PATH ''; set -gx PATH "/opt/homebrew/bin" "/opt/homebrew/sbin" $PATH;
set -q MANPATH; or set MANPATH ''; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;

# Ensure Homebrew openjdk is in PATH
set -gx PATH "/opt/homebrew/opt/openjdk/bin" $PATH;

# Setup asdf and assume it was installed via Homebrew
source /opt/homebrew/opt/asdf/libexec/asdf.fish

# Use Starship prompt
# https://starship.rs
set -g STARSHIP_CONFIG ~/.dotfiles/starship.toml
eval (starship init fish)

# Ensure compilers can find openssl
set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths
set -gx LDFLAGS "-L/usr/local/opt/openssl@1.1/lib"
set -gx CPPFLAGS "-I/usr/local/opt/openssl@1.1/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl@1.1/lib/pkgconfig"
set -gx EGREP "egrep"
set -gx CC "clang"
set -gx CPP "clang -E"

# Make Rust things work
export PATH="$HOME/.cargo/bin:$PATH"

# Read in Perx secrets
source ~/.config/fish/perx.fish

# Bun
set -Ux BUN_INSTALL "/Users/admin/.bun"
set -px --path PATH "/Users/admin/.bun/bin"


# pnpm
set -gx PNPM_HOME "/Users/admin/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
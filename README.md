## My humble dotfiles

These are my dotfiles. There are many dotfiles like them, but these ones are
mine

### Setup

The first step is to clone this repository and cwd in to the repo

```bash
$ git clone git@github.com:lukerollans/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
```

Secondly, use [RCM](https://github.com/thoughtbot/rcm) to install and configure
the dotfiles (essentially just symlinking to the relevant directories for vim,
tmux etc)

```bash
$ brew install rcm
$ rcup
```

RCM doesn't cover fish or kitty, however, given they both look in `~/.config`
instead of simply `~/`, so just a couple of quick commands to
link those up..

```bash
$ ln -s ~/.dotfiles/kitty.conf ~/.config/kitty/kitty.conf
$ ln -s ~/.dotfiles/fish ~/.config/fish
```

Next, install a few packages via [Homebrew](https://brew.sh) which will be used
about the place, but primarily in vim

```bash
$ brew install fzf
$ brew install diff-so-fancy
```

Lastly, run vim's setup script for the first time

```bash
$ sh vim/setup.sh
```

Now you're cooking with gas

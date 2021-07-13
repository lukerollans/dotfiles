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

# Lastly, run vim's setup script for the first time

```bash
$ sh vim/setup.sh
```

Now you're cooking with gas

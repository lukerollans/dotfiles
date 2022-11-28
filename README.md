## My humble dotfiles

These are my dotfiles. There are many dotfiles like them, but these ones are
mine.

### Setup

Clone the repo and change your working directory.

```bash
$ git clone git@github.com:lukerollans/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
```

Secondly, use [RCM](https://github.com/thoughtbot/rcm) to install each
dotfile. This is essentially a matter of symlinking each to the correct
directory.

```bash
$ brew install rcm
$ rcup
```

RCM doesn't cover fish or kitty, however, given they source config from
`~/.config` We need to create the following symlinks manually.

```bash
$ ln -s ~/.dotfiles/kitty.conf ~/.config/kitty/kitty.conf
$ ln -s ~/.dotfiles/fish ~/.config/fish
```

Next, install a few packages via [Homebrew](https://brew.sh) which will be used
in a few different scenarios, but primarily in vim.

```bash
$ brew install fzf
$ brew install diff-so-fancy
```

Lastly, run vim's setup script for the first time.

```bash
$ sh vim/setup.sh
```

Now you're cooking with gas!

call plug#begin('~/.vim/bundle')
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
" Plug 'cakebaker/scss-syntax.vim'
Plug 'tpope/vim-endwise'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim'
Plug 'gregsexton/MatchTag'
Plug 'elixir-lang/vim-elixir'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'vim-scripts/auto-pairs-gentle'
Plug 'stephpy/vim-yaml'

" Opinionated JavaScript formatting
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript'] }

" File contents searching
Plug 'mileszs/ack.vim'

" fzf for fuzzy finding
Plug '/usr/local/opt/fzf'

" Themes
Plug 'lifepillar/vim-solarized8'
call plug#end()

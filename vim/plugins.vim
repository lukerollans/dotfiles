call plug#begin('~/.vim/bundle')
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
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
Plug 'jiangmiao/auto-pairs'
Plug 'stephpy/vim-yaml'
" Plug 'slim-template/vim-slim'
" Plug 'kchmck/vim-coffee-script'

" Opinionated JavaScript formatting
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript'] }

" File contents searching
Plug 'mileszs/ack.vim'

" Themes
Plug 'jacoborus/tender'
call plug#end()


call plug#begin('~/.vim/bundle')
Plug 'christoomey/vim-tmux-navigator'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-endwise'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim'
" Plug 'gregsexton/MatchTag'
Plug 'elixir-lang/vim-elixir'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'mxw/vim-jsx'
Plug 'ianks/vim-tsx'
Plug 'vim-scripts/auto-pairs-gentle'
Plug 'stephpy/vim-yaml'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'

" Opinionated JavaScript formatting
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" File contents searching
Plug 'mileszs/ack.vim'

" fzf for fuzzy finding
Plug '/usr/local/opt/fzf'

" Themes
Plug 'jacoborus/tender'
Plug 'dracula/vim', { 'as': 'dracula'  }
Plug 'nanotech/jellybeans.vim'
call plug#end()

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
Plug 'elixir-editors/vim-elixir'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'mxw/vim-jsx'
Plug 'ianks/vim-tsx'
Plug 'vim-scripts/auto-pairs-gentle'
Plug 'stephpy/vim-yaml'
Plug 'evanleck/vim-svelte'

" TypeScript
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'

" Terraform
Plug 'hashivim/vim-terraform'

" Opinionated JavaScript formatting
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" File contents searching
Plug 'mileszs/ack.vim'

" fzf for fuzzy finding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Themes
Plug 'jacoborus/tender'
call plug#end()

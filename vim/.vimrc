set relativenumber
set cursorline

set ignorecase
set smartcase

set clipboard=unnamed

colorscheme habamax
syntax on
set re=0

set autoindent expandtab tabstop=2 shiftwidth=2

let mapleader = " "

nnoremap <leader>e :Explore<CR>
nnoremap <leader>th :colo <C-d>
nnoremap <leader>vs :vsplit<CR>
nnoremap <leader>qq :q<CR>
nnoremap <leader>ww :w<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>j :term<CR>
tnoremap <Esc> <C-\><C-n>

nnoremap <leader>b :ls<cr>:b<space>

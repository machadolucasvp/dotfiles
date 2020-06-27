call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

call plug#end()


" General stuff
colorscheme gruvbox
set background=dark
set incsearch
set noerrorbells
set smartindent
set undodir=~/.nvim/undodir
set undofile
set noswapfile
set nobackup

set nowrap
set expandtab
set tabstop=4
set softtabstop=0
set shiftwidth=4

let mapleader = "," 

" Move between windows in a more natural way
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Save
nmap <leader>, :w!<cr>

" Quit
nmap <leader>q :q!<cr>

" https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')


" Close nerdtree if NERDTree is the last one in buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" toggle NERDTree
map <C-b> :NERDTreeToggle<CR>

" It doesn't have to be that big
let g:fzf_layout = { 'down': '~20%' }
" toggle FZF 
nmap <silent> <leader>p :FZF<cr>

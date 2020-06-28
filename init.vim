call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'HerringtonDarkholme/yats.vim' 
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

" General stuff
colorscheme gruvbox
set background=dark
set nu
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

" Remap esc
inoremap jk <esc>
inoremap kj <esc>

" Move between windows in a more natural way
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Save
nmap <leader>, :w!<cr>

" Quit
nmap <leader>q :q!<cr>

" Guess what?
nmap <leader>wq :wq!<cr>

" https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

" Close nerdtree if NERDTree is the last one in buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" toggle NERDTree
map <C-b> :NERDTreeToggle<CR>

" Find current file in tree
nmap <leader>n :NERDTreeFind<CR>

let g:nerdtree_tabs_focus_on_files=1

" NERDTree ignored files
let g:NERDTreeIgnore = ['^node_modules$','^dist$']

" It doesn't have to be that big
let g:fzf_layout = { 'down': '~20%' }
" toggle FZF 
nmap <silent> <leader>p :FZF<cr>

" Coc type/definition related
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)

" Navigate autocomplete suggestions 
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"Autocomplete with first suggestion if no item has been selected
inoremap <silent><expr> <C-space> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Format selected lines
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Docs
nnoremap <silent> <C-k> :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

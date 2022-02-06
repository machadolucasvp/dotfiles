call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'} " Language server support
Plug 'preservim/nerdtree' " System explorer
Plug 'preservim/nerdcommenter' " Quick comments
Plug 'vim-airline/vim-airline' " Status bar
Plug 'airblade/vim-gitgutter' " Git changes in sign column
Plug 'sheerun/vim-polyglot' " Multiple languages syntax highlight 
Plug 'Xuyuanp/nerdtree-git-plugin' " Git changes in nerd tree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Syntax to nerd tree (requires vim-devicons)
Plug 'ryanoasis/vim-devicons' " Icons (requires a nerd font)
Plug 'gruvbox-community/gruvbox' " Theme :)
Plug 'APZelos/blamer.nvim' " Git blamer
Plug 'jiangmiao/auto-pairs' "Autocomplete pairs
Plug 'nvim-lua/plenary.nvim' " Telescope dependency
Plug 'nvim-telescope/telescope.nvim' " Search engine (requires ripgrep)
Plug 'tpope/vim-obsession' " Persist sessions, working well with tmux-ressurect
Plug 'eslint/eslint' " JS/TS Linter
Plug 'christoomey/vim-tmux-navigator' " Unify movements between tmux and vim
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' } " Prettier format
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " Better syntax highlight
Plug 'vim-test/vim-test' " Tests

call plug#end()

"--- General ---
set encoding=UTF-8
set nu
set relativenumber
set incsearch
set noerrorbells
set smartindent
set undodir=~/.nvim/undodir
set undofile
set noswapfile
set nobackup
set hidden
set guicursor=

set nowrap
set smartindent
set scrolloff=8
set signcolumn=yes
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set timeoutlen=500
set ttimeoutlen=200
set termguicolors

set splitright " Default vertical split to the right
set splitbelow " Default horizontal split to below

let mapleader = "," 

" Theme
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'

" Highlight cursor line
set cursorline

" Reload config
nnoremap <silent> <Leader>ls :source $MYVIMRC<cr>

" Remap esc
inoremap jk <esc>
inoremap kj <esc>
cnoremap jk <C-c>
cnoremap kj <C-c>

" Integrate movements between vim panels and tmux windows
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

" Save
nmap <leader>, :w!<cr>
nmap <leader>,a :wa!<cr>

" Quit
nmap <leader>q :q!<cr>
nmap <leader>wq :wq!<cr>

" Close current buffer (doesn't quit vim if has only one window remaining)
map <leader>w :bd<cr>

" Clear search highlight
nnoremap <Leader>fc :noh<cr>

" https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

" Resize window
nnoremap <silent> <C-r>j  :resize +5<CR>
nnoremap <silent> <C-r>k :resize -5<CR>
nnoremap <silent> <C-r>l :vert resize +5<CR>
nnoremap <silent> <C-r>h :vert resize -5<CR>

"--- Git Blamer ---
" Enable gitblamer by default
let g:blamer_enabled = 1
" Disable gitblamer in visual mode
let g:blamer_show_in_visual_modes = 0

"--- NERDTree ----
" Toggle NERDTree
map <C-b> :call NerdTreeToggle()<CR>

" Find the current file in NERDTree
map <leader>nf :NERDTreeFind<CR>

" If NERDTree do not exists, open NERDTree in the current file
function NerdTreeToggle()
    if &filetype == 'nerdtree' || exists("g:NERDTree") && g:NERDTree.IsOpen()
        :NERDTreeToggle
    else
        :NERDTreeFind
    endif
endfunction

" NERDTree ignored files
let g:NERDTreeIgnore = ['^node_modules$','^dist$']

" Increase NERDTree default size
let g:NERDTreeWinSize=50

" Remap horizontal/vertical open file 
let NERDTreeMapOpenSplit="<C-s>"
let NERDTreeMapOpenVSplit="<C-v>"

" --- Telescope Fuzzy Finder --
nnoremap <leader>p <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

" Telescope lua configurations
lua << EOF
require('telescope').setup{ 
    defaults = { 
        mappings = {      
            i = { 
                ["<C-s>"] = "select_horizontal"
            },
            n = { 
                ["<C-s>"] = "select_horizontal"
            }
        },
    file_ignore_patterns = {"node_modules", "dist"} 
    }
}
EOF

"--- Conquer of Completion ---
" Type/definition related
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
" The <C-d> result here is specific, <S-tab> in insertmode conflicts with 
" a remap for remove a tab space. So, in order to make it works, a simple
" solution was to put the remap for remove tab space here, since it happens
" in case pumvisible is false
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-d>"

" Autocomplete with <CR>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Format selected lines
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Open doc tooltip 
nnoremap <silent> <leader>h :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"--- TSSERVER --- 
" autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
" autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

"--- Prettier ---
" Disable autoformat
let g:prettier#autoformat = 0
let g:prettier#autoformat_require_pragma = 0

"--- Terminal ---
" Exit insertmode
tnoremap jk <C-\><C-n>
tnoremap kj <C-\><C-n>

" Open terminal
nnoremap <leader>tt :ter<CR>
nnoremap <leader>ts :split \| ter<CR>
nnoremap <leader>tv :vsplit \| ter<CR>

"--- Treesitter ---
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

"--- Debugger ---
" TO DO

"--- Jest ---
nmap <silent> <leader>rt :TestNearest<CR>
nmap <silent> <leader>rT :TestFile<CR>
nmap <silent> <leader>rs :TestSuite<CR>
nmap <silent> <leader>rl :TestLast<CR>
nmap <silent> <leader>gT :TestVisit<CR>

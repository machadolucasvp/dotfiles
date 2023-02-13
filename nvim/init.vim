call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'} " Language server support
Plug 'preservim/nerdtree' " System explorer
Plug 'preservim/nerdcommenter' " Quick comments
Plug 'vim-airline/vim-airline' " Status bar
Plug 'airblade/vim-gitgutter' " Git changes in sign column
Plug 'Xuyuanp/nerdtree-git-plugin' " Git changes in nerd tree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Syntax to nerd tree (requires vim-devicons)
Plug 'ryanoasis/vim-devicons' " Icons (requires a nerd font)
Plug 'gruvbox-community/gruvbox' " Theme :)
Plug 'APZelos/blamer.nvim' " Git blamer
Plug 'jiangmiao/auto-pairs' "Autocomplete pairs
Plug 'nvim-lua/plenary.nvim' " Telescope dependency
Plug 'nvim-telescope/telescope.nvim' " Search engine (requires ripgrep)
Plug 'tpope/vim-obsession' " Persist sessions, working well with tmux-ressurect
Plug 'tpope/vim-fugitive' " Git integration
Plug 'christoomey/vim-tmux-navigator' " Unify movements between tmux and vim
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' } " Prettier format
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " Better syntax highlight
Plug 'vim-test/vim-test' " Tests
Plug 'puremourning/vimspector' " Debugger
Plug 'szw/vim-maximizer' " Maximize windows easily

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
set guifont=Hack\ Nerd\ Font

" Share same clipboard of the system
set clipboard=unnamedplus

set nowrap
set smartindent
set scrolloff=8
set signcolumn=yes
set signcolumn=auto:2
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
"set background=dark
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
                ["<C-s>"] = "select_horizontal",
                ["<c-d>"] = "delete_buffer",
            },
            n = { 
                ["<C-s>"] = "select_horizontal",
                ["<c-d>"] = "delete_buffer",
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

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Autocomplete with <CR>
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Renaming
nmap <leader>rn <Plug>(coc-rename)

" Navigate autocomplete suggestions 
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" The <C-d> result here is specific, <S-tab> in insertmode conflicts with 
" a remap for remove a tab space. So, in order to make it works, a simple
" solution was to put the remap for remove tab space here, since it happens
" in case pumvisible is false
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-d>"

" Format selected lines
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>fl <Plug>(coc-format-file)

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
nmap <Leader>fa <Plug>(Prettier)
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
  ensure_installed = "all",
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
" let g:vimspector_enable_mappings = 'HUMAN'
" let g:vimspector_base_dir=expand( '$HOME/.config/vimspector-config' )
let g:vimspector_sign_priority = {
  \    'vimspectorBP':         999,
  \    'vimspectorBPCond':     999,
  \    'vimspectorBPLog':      999,
  \    'vimspectorBPDisabled': 999,
  \    'vimspectorPC':         999,
  \ }

nnoremap <leader>m :MaximizerToggle!<CR>

nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>ddc :call vimspector#RunToCursor()<CR>
nnoremap <leader>dr :call vimspector#Restart()<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>


nnoremap <leader>dj :call vimspector#StepInto()<CR>
nnoremap <leader>dl :call vimspector#StepOver()<CR>
nnoremap <leader>dk :call vimspector#StepOut()<CR>
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>dbr :call vimspector#ClearBreakpoints()<CR>
nmap <leader>db <Plug>VimspectorToggleBreakpoint
nmap <leader>dcb <Plug>VimspectorToggleConditionalBreakpoint

nnoremap <leader>dw :call AddToWatch()<CR>
nmap <leader>dh <Plug>VimspectorBalloonEval

func! AddToWatch()
    let word = expand("<cexpr>")
    call vimspector#AddWatch(word)
endfunction

" Running tests with vimspector 
function! JestStrategy(cmd)
  let testName = matchlist(a:cmd, '\v -t ''(.*)''')[1]
  call vimspector#LaunchWithSettings( #{ configuration: 'jest', TestName: testName } )
endfunction

let g:test#custom_strategies = {'jest': function('JestStrategy')}


"--- Tests ---
nmap <silent> <leader>rt :TestNearest<CR>
nmap <silent> <leader>rd :TestNearest -strategy=jest<CR>
nmap <silent> <leader>rT :TestFile<CR>
nmap <silent> <leader>rs :TestSuite<CR>
nmap <silent> <leader>rl :TestLast<CR>
nmap <silent> <leader>gT :TestVisit<CR>

"--- NerdCommenter --
" Add spaces after comment delimiters 
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

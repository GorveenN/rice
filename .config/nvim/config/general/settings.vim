" treat dash separated words as a word text object"
set iskeyword+=-
" Horizontal splits will automatically be below
set splitbelow
" Vertical splits will automatically be to the right
set splitright
syntax enable
filetype plugin indent on
set tabstop=4 softtabstop=0 expandtab shiftwidth=4
set smarttab
set smartindent
set smartcase
set clipboard=unnamedplus
set incsearch
set nocompatible
set encoding=utf-8
set number relativenumber
set go=a
set mouse=a
set hlsearch
set cmdheight=1
set cursorline
set hidden
set nobackup
set nowritebackup
set nowb
set noswapfile
set breakindent
nnoremap c "_c

" Show next 3 lines while scrolling.
if !&scrolloff
    set scrolloff=3
endif

" Show next 5 columns while side-scrolling.
if !&sidescrolloff
    set sidescrolloff=5
endif

" Show next 5 columns while side-scrolling.
if !&sidescrolloff
    set sidescrolloff=5
endif

" Jump to the last known position when reopening a file.
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" VIMRC handling
map <leader>vimrc :e $MYVIMRC<cr>
autocmd bufwritepost init.vim source $MYVIMRC

let g:tex_flavor="latex"

" set completeopt=menuone,noinsert,noselect
" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" let g:python3_host_prog="~/.config/nvim/venv/bin/python3"

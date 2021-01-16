call plug#begin(stdpath('data') . '/vim-plug')
" QOL
Plug 'tpope/vim-commentary'
Plug 'tweekmonster/startuptime.vim'
Plug 'mhinz/vim-signify'

" Completion
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'RishabhRD/popfix' " to manage underlying popup and previews
Plug 'RishabhRD/nvim-lsputils' " for lsp codeactions'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'

" Lang specific
Plug 'neovimhaskell/haskell-vim'
call plug#end()

" Space is easy to click
let mapleader = " "

" Basic settings
syntax enable
filetype plugin indent on
set scrolloff=3 " Show next 3 lines while scrolling.
set sidescrolloff=5 " Show next 5 columns while side-scrolling.
set encoding=utf-8
set clipboard=unnamedplus
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set list lcs=tab:┆·,trail:·,precedes:,extends:
set hidden
set wrap
set splitright
set splitbelow
set ignorecase
set smartcase
set number
set relativenumber
set termguicolors
set noshowmode
set switchbuf=useopen
set signcolumn=yes
set noshowcmd
set noruler
set inccommand=split
set undodir=~/.local/share/nvim/undodir
set undofile
set completeopt=menuone,noinsert
set shm+=c
set iskeyword+=-

" Jump to the last known position when reopening a file.
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Colorscheme
if (has("termguicolors"))
    set termguicolors
endif
set background=dark
colorscheme solarized8
" Visual highlight color
hi Visual gui=bold cterm=bold guibg=#1A4F4F guifg=NONE ctermbg=8 ctermfg=NONE

" Diagnostics
let g:diagnostic_virtual_text_prefix = ''
let g:diagnostic_enable_virtual_text = 1

" Signify
let g:signify_sign_add = '▎'
let g:signify_sign_delete = '▎'
let g:signify_sign_delete_first_line = '▎'
let g:signify_sign_change = '▎'

" Completion
let g:completion_confirm_key = ""
let g:completion_trigger_keyword_length = 2
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_matching_smart_case = 1
let g:completion_trigger_on_delete = 1

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Turn spellcheck on for markdown files
augroup auto_spellcheck
  autocmd BufNewFile,BufRead *.md setlocal spell spelllang=en_us,pl
  autocmd BufNewFile,BufRead *.tex setlocal spell spelllang=en_us,pl
  autocmd FileType gitcommit setlocal spell spelllang=en_us
augroup END

" Print to pdf
function! Printpdf()
    hardcopy > %.ps | !ps2pdf %.ps && rm %.ps
endfunction

" Save file as root
command! Root :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Spell check with fzf
function! FzfSpellSink(word)
    exe 'normal! "_ciw'.a:word
endfunction

function! FzfSpell()
    let suggestions = spellsuggest(expand("<cword>"))
    return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 })
endfunction
nnoremap z= :call FzfSpell()<CR>

nnoremap <silent> <leader>ff    <cmd>Telescope find_files<cr>
nnoremap <silent> <leader>fg    <cmd>Telescope live_grep<cr>
nnoremap <silent> <leader>fb    <cmd>Telescope buffers<cr>
nnoremap <silent> <leader>fh    <cmd>Telescope help_tags<cr>
nnoremap <silent> <leader>n     :noh<cr>
nnoremap <silent> [g            :lua vim.lsp.diagnostic.goto_prev()<cr>
nnoremap <silent> ]g            :lua vim.lsp.diagnostic.goto_next()<cr>

command! Format execute 'lua vim.lsp.buf.formatting()'

let g:diagnostic_auto_popup_while_jump = 1
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

lua require('init')

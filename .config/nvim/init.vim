let g:mapleader = "\<Space>"

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.config/nvim/plugged')

" Essential
    Plug 'tpope/vim-surround'
    Plug 'bling/vim-airline'
    Plug 'tpope/vim-commentary'
    Plug 'Chiel92/vim-autoformat'
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'liuchengxu/vista.vim'
    " LaTeX
    Plug 'lervag/vimtex'
    " Snippets
    Plug 'honza/vim-snippets'
    " Haskell
    " Fuzzy finder for haskell documentation (hoogle)
    Plug 'monkoose/fzf-hoogle.vim'
    " Css colors
    Plug 'ap/vim-css-color'

" Colorschemes
    Plug 'morhetz/gruvbox'
    Plug 'overcache/NeoSolarized'

" Syntax
    Plug 'jackguo380/vim-lsp-cxx-highlight'
    Plug 'cespare/vim-toml'
    Plug 'PotatoesMaster/i3-vim-syntax'
    Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }

" Git wrapper
    Plug 'tpope/vim-fugitive'
    Plug 'shumphrey/fugitive-gitlab.vim'
    Plug 'tpope/vim-rhubarb'

" NERDTree
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Others
    " Switch source/header file
    Plug 'vim-scripts/a.vim'
    " Autosave
    Plug '907th/vim-auto-save'
    " kill buffer preserving layout
    Plug 'qpkorr/vim-bufkill'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""
" Essential
""""""""""""""""""""""""""""""""""""""""""""""""
        syntax on
        filetype plugin indent on
	set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
	set clipboard=unnamedplus
        set smartcase
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
	nnoremap c "_c

    " VIMRC handling
        map <leader>vimrc :e $MYVIMRC<cr>
        autocmd bufwritepost init.vim source $MYVIMRC

    " Print to pdf
        function! Printpdf()
            hardcopy > %.ps | !ps2pdf %.ps && rm %.ps
        endfunction

    " Save file as root
        command! Root :execute ':silent w !sudo tee % > /dev/null' | :edit!

    " Split window appears on the right
        set splitright

    " Show next 3 lines while scrolling.
        if !&scrolloff
            set scrolloff=3
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

    " Remaps
        " Cycle buffers with Tab and Shift+Tab
            nnoremap<silent> <Tab> :bnext<CR>
            nnoremap<silent> <S-Tab> :bprevious<CR>

        " Un-highlight search results
            nnoremap <esc><esc> :silent! nohls<cr>

        " Search for files
            nnoremap <C-f> :Files<CR>

        " Search for word in all files
            nnoremap <C-g> :Rg<CR>

        " Show current buffer in nerdtree
            nnoremap <Leader>m :call MyNerdToggle()<CR>

        " Show buffers
            nnoremap <leader>b :Buffers<CR>

        " Git wrapper
            nmap <leader>gs :G<CR>
            nmap <leader>gh :diffget //3<CR>
            nmap <leader>gf :diffget //2<CR>

        " Switch splits
            nnoremap <leader>j <C-W><C-J>
            nnoremap <leader>k <C-W><C-K>
            nnoremap <leader>l <C-W><C-L>
            nnoremap <leader>h <C-W><C-H>

        " Move between tabs
            " nnoremap <C-h> :tabprevious<CR>
            " nnoremap <C-l> :tabnext<CR>

        " Switch to normal mode while using built-in terminal
        "     tnoremap <Esc> <C-\><C-n>

""""""""""""""""""""""""""""""""""""""""""""""""
" vim-surround
""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
""""""""""""""""""""""""""""""""""""""""""""""""
        " let g:airline_theme='wpgtk'
        " let g:airline_powerline_fonts = 1
        " let g:airline_symbols = {}
        " let g:airline_skip_empty_sections = 1
        " let g:airline_left_sep = ''
        " let g:airline_left_alt_sep = ''
        " let g:airline_right_sep = ''
        " let g:airline_right_alt_sep = ''
        " let g:airline_symbols_branch = ''
        " let g:airline_powerline_fonts = 1
        " let g:airline_symbols.crypt = ''
        " let g:airline_symbols.linenr = '☰'
        " let g:airline_symbols.linenr = '␊'
        " let g:airline_symbols.linenr = '␤'
        " let g:airline_symbols.linenr = '¶'
        " let g:airline_symbols.maxlinenr = ''
        " let g:airline_symbols.paste = 'ρ'
        " let g:airline_symbols.paste = 'Þ'
        " let g:airline_symbols.paste = '∥'
        " let g:airline_symbols.spell = 'Ꞩ'
        " let g:airline_symbols.notexists = 'Ɇ'
        " let g:airline_symbols.whitespace = 'Ξ'
        " let g:airline_symbols.modified = ' '
        " let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
        " let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
        "extensions
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#ale#enabled = 1
        let g:airline#extensions#coc#enabled = 1
        let g:airline#extensions#unicode#enabled = 1
        let g:airline#extensions#branch#enabled = 1
        let g:airline#extensions#vista#enabled = 1
        let g:airline#extensions#hunks#enabled = 1
        "extension settings
        let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
        let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
        let airline#extensions#coc#warning_symbol = ':'
        let airline#extensions#coc#error_symbol = ':'
        let g:airline#extensions#hunks#hunk_symbols = [':', ':', ':']
        let g:airline#extensions#branch#format = 2

""""""""""""""""""""""""""""""""""""""""""""""""
" vim-commentary
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
" vim-autoformat
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
" auto-pairs
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
" fzf.vim
""""""""""""""""""""""""""""""""""""""""""""""""
    let $FZF_DEFAULT_COMMAND = 'if [ -d .git ]; then git ls-files; else rg --files --no-ignore-vcs; fi;'
    " let $FZF_DEFAULT_COMMAND = 'rg --files'

""""""""""""""""""""""""""""""""""""""""""""""""
" coc.nvim
""""""""""""""""""""""""""""""""""""""""""""""""
    " Plugins
        let g:coc_global_extensions =  [
            \ 'coc-python',
            \ 'coc-rls',
            \ 'coc-snippets'
            \ ]

    " Use <c-space> to trigger completion.
        inoremap <silent><expr> <c-space> coc#refresh()

    " Use K to show documentation in preview window
        function! s:show_documentation()
          if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
          else
            call CocAction('doHover')
          endif
        endfunction
        nnoremap <silent> K :call <SID>show_documentation()<CR>

    " Autocompletion
	inoremap <silent><expr> <TAB>
	  \ pumvisible() ? coc#_select_confirm() :
	  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
	  \ <SID>check_back_space() ? "\<TAB>" :
	  \ coc#refresh()

	function! s:check_back_space() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	let g:coc_snippet_next = '<itab>'

    " Use `[g` and `]g` to navigate diagnostics
	nmap <silent> [g <Plug>(coc-diagnostic-prev)
	nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " Remap keys for gotos
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)
	" nmap <leader>rn  <Plug>(coc-refactor)
        nmap <leader>qf  <Plug>(coc-fix-current)
        nmap <F3> <Plug>(coc-format)
        xmap <leader>f  <Plug>(coc-format-selected)
    " Remap for rename current word
        nmap <leader>rn <Plug>(coc-rename)

""""""""""""""""""""""""""""""""""""""""""""""""
" vista.vim
""""""""""""""""""""""""""""""""""""""""""""""""
        nmap <F8> :Vista!!<CR>
        let g:vista_executive_for = {
              \ 'c': 'coc',
              \ }
        nnoremap <silent><leader>vf :Vista finder coc<CR>
        let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
        let g:vista#renderer#enable_icon = 1
        let g:vista_sidebar_width = 50

""""""""""""""""""""""""""""""""""""""""""""""""
" vimtex
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
" vim-snippets
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
" fzf-hoogle.vim
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
" vim-css-color
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
" Colorschemes
""""""""""""""""""""""""""""""""""""""""""""""""
    if (has("termguicolors"))
      set termguicolors
    endif

    set background=dark
    colorscheme NeoSolarized

    " Visual highlight color
    " hi Visual gui=bold cterm=bold guibg=#1A4F4F guifg=NONE ctermbg=8 ctermfg=NONE

    " Search results highlight
    " hi Search cterm=bold ctermbg=8 ctermfg=NONE

    " hi Pmenu cterm=none ctermfg=223 ctermbg=239
    " hi Pmenu cterm=none ctermfg=223 ctermbg=234
    " hi PmenuSel cterm=bold ctermfg=239 ctermbg=109
    " hi PmenuSbar cterm=none ctermfg=none ctermbg=239
    " hi PmenuThumb cterm=none ctermfg=none ctermbg=243

    " hi DiffAdd cterm=reverse ctermfg=142 ctermbg=235
    " hi DiffChange cterm=reverse ctermfg=108 ctermbg=235
    " hi DiffDelete cterm=reverse ctermfg=167 ctermbg=235
    " hi DiffText cterm=reverse ctermfg=214 ctermbg=235

    " hi Normal guibg=233 ctermbg=233

    " Highhlight cursorline
    " hi CursorLine   cterm=NONE ctermbg=darkred " ctermfg=white
    " set cursorline
    " autocmd InsertLeave * hi CursorLine   cterm=NONE ctermbg=235 guibg=235
    " hi CursorLine   cterm=NONE ctermbg=235 ctermfg=NONE
    " highlight CursorLine ctermbg=Yellow cterm=bold guibg=#2b2b2b
    " autocmd InsertLeave * highlight  CursorLine ctermbg=Yellow ctermfg=None
    " autocmd InsertLeave * set cursorline

""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax
""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""
    " Mapping to open NERDTree
        map <leader>n :NERDTreeToggle<CR>
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
        nnoremap <silent> <Leader>v :NERDTreeFind<CR>

    " Check if NERDTree is open or active
        function! IsNERDTreeOpen()
          return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
        endfunction


    " Highlight currently open buffer in NERDTree
        function MyNerdToggle()
            if &filetype == 'nerdtree' || exists("g:NERDTree") && g:NERDTree.IsOpen()
                :NERDTreeToggle
            else
                :NERDTreeFind
            endif
        endfunction

    " if nerdtree is only window, kill nerdtree so buffer can die
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | :bdelete | endif

        let nerdtreequitonopen = 0
        let NERDTreeShowHidden=1
        let nerdchristmastree=1
        let g:NERDTreeMinimalUI = 1
        let g:nerdtreewinsize = 25
        let g:NERDTreeDirArrowExpandable = ''
        let g:NERDTreeDirArrowCollapsible = '▼'
        let NERDTreeAutoCenter=1
        let g:NERDTreeIndicatorMapCustom = {
                \ "modified"  : "✹",
                \ "staged"    : "➕",
                \ "untracked" : "⭐",
                \ "renamed"   : "",
                \ "unmerged"  : "═",
                \ "deleted"   : "✖",
                \ "dirty"     : "✗",
                \ "clean"     : "✔︎",
                \ 'ignored'   : '☒',
                \ "unknown"   : "?"
                \ }

""""""""""""""""""""""""""""""""""""""""""""""""
" Others
""""""""""""""""""""""""""""""""""""""""""""""""
    " Autoformat
        " au BufWrite *.hs :Autoformat
        let g:autoformat_autoindent = 0
        let g:autoformat_retab = 0
        let g:autoformat_remove_trailing_spaces = 0
        let g:formatdef_hass = '"hasss"'
        let g:formatters_haskell = ['hass']
        nnoremap <F4> :Autoformat<CR>

    " Autosaving
        let g:auto_save        = 0
        let g:auto_save_silent = 1
        let g:auto_save_events = ["InsertLeave"]

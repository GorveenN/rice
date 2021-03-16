if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.config/nvim/plugged')

" Essential
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'qpkorr/vim-bufkill'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Chiel92/vim-autoformat'
Plug 'bronson/vim-visual-star-search'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'

" Syntax
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'cespare/vim-toml'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'

" Git wrapper
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Tmux/vim navigation
Plug 'christoomey/vim-tmux-navigator'
Plug 'RyanMillerC/better-vim-tmux-resizer'

" Others
Plug 'ryanoasis/vim-devicons'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'neomake/neomake'

" nvim builtin lsp
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'RishabhRD/popfix' " to manage underlying popup and previews
Plug 'RishabhRD/nvim-lsputils' " for lsp codeactions'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'


" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Others
Plug 'neovimhaskell/haskell-vim'
Plug 'lervag/vimtex' " LaTeX
Plug 'honza/vim-snippets' " Snippets

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

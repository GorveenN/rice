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
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-commentary'
    Plug 'Chiel92/vim-autoformat'
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'liuchengxu/vista.vim'
    Plug 'bronson/vim-visual-star-search'
    " LaTeX
    Plug 'lervag/vimtex'
    " Snippets
    Plug 'honza/vim-snippets'
    " Css colors
    Plug 'ap/vim-css-color'

" Colorschemes
    Plug 'morhetz/gruvbox'
    Plug 'overcache/NeoSolarized'
    Plug 'lifepillar/vim-solarized8'

" Syntax
    Plug 'jackguo380/vim-lsp-cxx-highlight'
    Plug 'cespare/vim-toml'
    Plug 'PotatoesMaster/i3-vim-syntax'
    Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }

" Git wrapper
    Plug 'tpope/vim-fugitive'
    Plug 'shumphrey/fugitive-gitlab.vim'
    Plug 'tpope/vim-rhubarb'
    Plug 'airblade/vim-gitgutter'

" NERDTree
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Others
    " kill buffer preserving layout
    Plug 'qpkorr/vim-bufkill'
    " icons
    Plug 'ryanoasis/vim-devicons'
call plug#end()

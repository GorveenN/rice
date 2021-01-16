" General Settings
source $HOME/.config/nvim/config/vim-plug/plugins.vim
source $HOME/.config/nvim/config/general/settings.vim
source $HOME/.config/nvim/config/general/functions.vim
source $HOME/.config/nvim/config/keys/mappings.vim
source $HOME/.config/nvim/config/general/visuals.vim

" Plugins settings
source $HOME/.config/nvim/config/plugins/airline.vim
source $HOME/.config/nvim/config/plugins/autoformat.vim
source $HOME/.config/nvim/config/plugins/fugitive.vim
source $HOME/.config/nvim/config/plugins/fzf.vim
source $HOME/.config/nvim/config/plugins/nerdtree.vim
source $HOME/.config/nvim/config/plugins/vimtex.vim

" lua require('treesitter')
lua require('lsp')

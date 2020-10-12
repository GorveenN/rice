" General Settings
source $HOME/.config/nvim/config/vim-plug/plugins.vim
source $HOME/.config/nvim/config/general/settings.vim
source $HOME/.config/nvim/config/general/functions.vim
source $HOME/.config/nvim/config/keys/mappings.vim
source $HOME/.config/nvim/config/general/colorscheme.vim

" Plugins settings
source $HOME/.config/nvim/config/plugins/airline.vim
source $HOME/.config/nvim/config/plugins/autoformat.vim
" source $HOME/.config/nvim/config/plugins/coc.vim
source $HOME/.config/nvim/config/plugins/fugitive.vim
source $HOME/.config/nvim/config/plugins/fzf.vim
" source $HOME/.config/nvim/config/plugins/jupyter.vim
source $HOME/.config/nvim/config/plugins/nerdtree.vim
source $HOME/.config/nvim/config/plugins/nvimlsp.vim
" source $HOME/.config/nvim/config/plugins/rainbox.vim
" source $HOME/.config/nvim/config/plugins/vimspector.vim
source $HOME/.config/nvim/config/plugins/vimtex.vim
source $HOME/.config/nvim/config/plugins/vimwiki.vim
source $HOME/.config/nvim/config/plugins/vista.vim

lua require("lsp_config")

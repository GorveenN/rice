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
lua require("treesitter")


let g:completion_chain_complete_list = {
			\'default' : {
			\	'default' : [
			\		{'complete_items' : ['lsp', 'snippet', 'buffer']},
			\		{'mode' : 'file'}
			\	],
			\	},
			\}

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()


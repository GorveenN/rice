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
lua require('completion')

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" set completeopt=menuone,noinsert,noselect
" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
" lua require 'nvim_lsp'.pyls.setup{ on_attach=require'completion'.on_attach }
" lua require 'nvim_lsp'.clangd.setup{ on_attach=require'completion'.on_attach }

" " Use LSP omni-completion in Python files.
" autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc


" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
" " nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

" Treesitter

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust", "python" },  -- list of language that will be disabled
  },
}
EOF

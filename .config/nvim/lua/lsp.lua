-- lsp
local nvim_lsp = require("lspconfig")
local on_attach = function(client, bufnr)
    vim.cmd('nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>')
    vim.cmd('nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>')
    vim.cmd('nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>')
    vim.cmd('nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>')
    vim.cmd('nnoremap <silent> ca :Lspsaga code_action<CR>')
    vim.cmd('nnoremap <silent> K :Lspsaga hover_doc<CR>')
    -- vim.cmd('nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>')
    vim.cmd('nnoremap <silent> <C-p> :Lspsaga diagnostic_jump_prev<CR>')
    vim.cmd('nnoremap <silent> <C-n> :Lspsaga diagnostic_jump_next<CR>')
end
local servers = {
    "clangd",
    "cssls",
    "hls",
    "html",
    "jdtls",
    "jsonls",
    "metals",
    "pyls",
    "pyright",
    "rust_analyzer",
    "sumneko_lua",
    "texlab",
    "tsserver",
    -- "vimls"
}

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach
    }
end

-- Treesitter
require "nvim-treesitter.configs".setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true,
        disable = {}
    }
}


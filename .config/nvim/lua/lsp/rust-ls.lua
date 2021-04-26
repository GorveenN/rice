local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.rust_analyzer.setup {
    cmd = {DATA_PATH .. "/lspinstall/rust/rust-analyzer"},
    capabilities = capabilities,
    on_attach = require'lsp'.common_on_attach
}


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.rust_analyzer.setup {
    cmd = {"rust-analyzer"},
    capabilities = capabilities,
    on_attach = require'lsp'.common_on_attach,
    settings = {
        ['rust-analyzer'] = {
            cargo = {loadOutDirsFromCheck = true},
            checkOnSave = {
                allFeatures = true,
                overrideCommand = {
                    'cargo', 'clippy', '--workspace', '--message-format=json', '--all-targets', '--all-features'
                }
            }
        }
    }
}


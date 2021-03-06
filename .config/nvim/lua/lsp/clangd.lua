require'lspconfig'.clangd.setup {
    -- cmd = {DATA_PATH .. "/lspinstall/cpp/clangd/bin/clangd"},
    -- cmd = {"clangd", "--background-index", "--pch-storage=memory", "--clang-tidy", "--suggest-missing-includes"},
    cmd = {"clangd", "--background-index", "--clang-tidy", "--suggest-missing-includes"},
    on_attach = require'lsp'.common_on_attach,
    filetypes = {"c", "cpp", "objc", "objcpp", "cuda"},
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = O.clang.diagnostics.virtual_text,
            signs = O.clang.diagnostics.signs,
            underline = O.clang.diagnostics.underline,
            update_in_insert = false
        })
    }
}

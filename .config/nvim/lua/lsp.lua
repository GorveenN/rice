-- lsp
local nvim_lsp = require("lspconfig")
local on_attach = function(client, bufnr)
    require("completion").on_attach(client)
    local opts = {noremap = true, silent = true}
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>xD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "qa", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<F4>", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    else
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<F4>", "<cmd>Autoformat<CR>", opts)
    end
end
local servers = {
    "texlab",
    "jsonls",
    "hls",
    "rust_analyzer",
    "pyls",
    "pyright",
    "vimls",
    "clangd",
    "tsserver",
    "cssls",
    "html",
    "jdtls",
    "sumneko_lua"
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

vim.lsp.handlers["textDocument/codeAction"] = require "lsputil.codeAction".code_action_handler
vim.lsp.handlers["textDocument/references"] = require "lsputil.locations".references_handler
vim.lsp.handlers["textDocument/definition"] = require "lsputil.locations".definition_handler
vim.lsp.handlers["textDocument/declaration"] = require "lsputil.locations".declaration_handler
vim.lsp.handlers["textDocument/typeDefinition"] = require "lsputil.locations".typeDefinition_handler
vim.lsp.handlers["textDocument/implementation"] = require "lsputil.locations".implementation_handler
vim.lsp.handlers["textDocument/documentSymbol"] = require "lsputil.symbols".document_handler
vim.lsp.handlers["workspace/symbol"] = require "lsputil.symbols".workspace_handler

require "lspconfig".sumneko_lua.setup {
    cmd = {"lua-language-server"},
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                -- Setup your lua path
                path = vim.split(package.path, ";")
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {"vim"}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                }
            }
        }
    }
}

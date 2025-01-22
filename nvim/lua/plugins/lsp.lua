return {
    "neovim/nvim-lspconfig",
    config = function()
        local lsp = require("lspconfig")

        lsp.clangd.setup({}) -- C/C++
        lsp.denols.setup({}) -- JS
        lsp.jdtls.setup({}) -- Java
        lsp.jsonls.setup({}) -- JSON
        lsp.lua_ls.setup({}) -- Lua
        lsp.html.setup({}) -- HTML
        lsp.gopls.setup({}) -- Go
        lsp.pyright.setup({}) -- python
        lsp.yamlls.setup({}) -- YAML
    end
}

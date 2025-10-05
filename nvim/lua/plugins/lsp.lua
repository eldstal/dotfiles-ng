return {
    "neovim/nvim-lspconfig",
    config = function()
        --local lsp = vim.lsp.config["lspconfig"]

        vim.lsp.enable("clangd")
        vim.lsp.enable("denols")
        vim.lsp.enable("jdtls")
        vim.lsp.enable("jsonls")
        vim.lsp.enable("lua_ls")
        vim.lsp.enable("html")
        vim.lsp.enable("gopls")
        vim.lsp.enable("pyright")
        vim.lsp.enable("yamlls")
    end
}

return {
    -- Useful stuff
    { "farmergreg/vim-lastplace" },
    { "nvim-tree/nvim-tree.lua" },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Colorschemes
    { "phha/zenburn.nvim" },
    { "rebelot/kanagawa.nvim" },
    { "savq/melange-nvim" },
    { "xero/miasma.nvim" },
    { "chama-chomo/grail" },

    {
        "zenbones-theme/zenbones.nvim",
        dependencies = "rktjmp/lush.nvim",
        lazy = false,
        priority = 1000,
        -- you can set set configuration options here
        config = function()
             --vim.g.zenbones_darken_comments = 45
             --vim.cmd.colorscheme('zenburned')
        end
    },

}

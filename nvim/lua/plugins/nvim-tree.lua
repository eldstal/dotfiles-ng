return {
    "nvim-tree/nvim-tree.lua",
    
    opts = {
        renderer = {
            special_files = {},
            indent_markers = { enable = true },
            icons = {
              show = {
                folder_arrow = true,
              },
              glyphs = {
                default = "🗎",
                folder = {
                  default = "📁",
                  open = "📁",
                  empty = "📁",
                  empty_open = "📁",
                  arrow_closed = "˃",
                  arrow_open = "v",
                },
              },
            },
        },
    },
}

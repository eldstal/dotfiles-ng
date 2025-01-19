vim.g.mapleader = "<Space>"

-- Package manager!
require("config.lazy")

-- Needed for some themes
vim.o.termguicolors = true

-- Recommended by nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


--
-- The various color schemes I'm testing out
--

--require("zenburn").setup()

--require("kanagawa").setup({ theme = "dragon" })

--vim.cmd.colorscheme "zenburned"

--vim.cmd.colorscheme "grail"

--vim.cmd.colorscheme "miasma"

vim.cmd.colorscheme "melange"

--
-- Cool plugins and their settings
--
require("nvim-tree").setup({
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
	}
})

-- Auto-close if the file browser is the last thing open
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})


--
-- Custom key mappings
--
vim.keymap.set('n', '§', ":NvimTreeFindFileToggle<cr>")

vim.keymap.set({'n', 'i', 'c'}, '<F1>', ":tabprev<cr>")
vim.keymap.set({'n', 'i', 'c'}, '<F2>', ":tabnext<cr>")

local tele = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', tele.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', tele.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', tele.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', tele.help_tags, { desc = 'Telescope help tags' })

--
-- Formatting settings
--
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.scrolloff = 5
vim.o.mouse = ""

--
-- Display settings for code (default)
--
function code_mode()
    vim.o.number = true
end

--
-- Display settings for text files
--
function txt_mode()
    vim.o.number = false
end


code_mode()
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "*.txt", "*.md", "README" },
    callback = txt_mode,
})



vim.g.mapleader = "<Space>"

-- Package manager!
require("config.lazy")

-- Just auto-update my plugins on startup, OK?
vim.api.nvim_create_autocmd("VimEnter", {
	callback=function()
		require("lazy").update({ show=false })
	end
})

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
-- Cool plugins
--
require("nvim-tree")
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

vim.keymap.set({'n', 'c'}, '<F1>', ":tabprev<cr>")
vim.keymap.set({'n', 'c'}, '<F2>', ":tabnext<cr>")

-- Home key goes to first non-empty character
vim.keymap.set({'n'}, '<Home>', "^")
vim.keymap.set({'i'}, '<Home>', "<Esc>I")

-- Search, search everywhere
local tele = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', tele.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', tele.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', tele.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', tele.help_tags, { desc = 'Telescope help tags' })


-- LSP and code completion and such
vim.keymap.set('n', '<leader>n', vim.lsp.buf.rename, { desc = 'Rename symbol' })
--vim.keymap.set({'n', 'i'}, '<C-Space>', vim.lsp.omnifunc, { desc = 'Autocomplete' })
vim.api.nvim_set_keymap('i', '<C-Space>', '<C-x><C-o>', {noremap = true})

-- Use ctrl+q to send the Telecope results to a quickfix list
-- Then these to skip back and forth between quickfix lists
vim.keymap.set('n', '<leader><F1>', ':colder<cr>', { desc = 'Quick-fix history older' })
vim.keymap.set('n', '<leader><F2>', ':cnewer<cr>', { desc = 'Quick-fix history newer' })
vim.keymap.set('n', '<C-PageUp>', ':cprev<cr>', { desc = 'Quick-fix next' })
vim.keymap.set('n', '<C-PageDown>', ':cnext<cr>', { desc = 'Quick-fix previous' })


--
-- Formatting settings
--
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.scrolloff = 5
vim.o.mouse = ""

-- Don't move my line numbers around for diagnostic markers
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.HINT] = '',
        }
    }
})

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



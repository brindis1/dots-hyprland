local map = vim.keymap.set

-- Leader
vim.g.mapleader = " "

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Neotree
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", {
  desc = "Toggle Explorer",
})

vim.keymap.set("n", "<leader>E", "<cmd>Neotree focus<CR>", {
  desc = "Focus Explorer",
})


-- copy 
vim.keymap.set({ "n", "v" }, "y", '"+y')
vim.keymap.set("n", "Y", '"+Y')

-- Indent 
vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent selection" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Unindent selection" })

-- Clear search
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "clear search highlights" })

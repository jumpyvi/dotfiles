require("plugins.plugins")

require("config.clipboard")

-- Custom key mapping for Telescope
vim.keymap.set('n', '<C-S-e>', ':Telescope find_files<CR>')

vim.keymap.set('n', '<C-e>', ':Neotree toggle<CR>')


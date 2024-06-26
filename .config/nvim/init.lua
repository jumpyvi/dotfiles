require("plugins.plugins")

require("config.clipboard")

-- Custom key mapping for Telescope
vim.keymap.set('n', '<M-f>', ':Telescope find_files<CR>')


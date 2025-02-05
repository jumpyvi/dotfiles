-- Install lazy.nvim if not already installed
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazy_path,
  })
end
vim.opt.rtp:prepend(lazy_path)

-- Plugin setup using lazy.nvim
require('lazy').setup({
  { 'neoclide/coc.nvim', branch = 'release' },
  'williamboman/mason.nvim',
  'mhartington/formatter.nvim',
  'nvim-lua/plenary.nvim',
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
  'nvim-tree/nvim-web-devicons',
  'nvim-telescope/telescope.nvim',
  'esensar/nvim-dev-container',
  'akinsho/bufferline.nvim',
  {
    'MeanderingProgrammer/markdown.nvim',
    main = "render-markdown",
    opts = {},
    name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  },
  'nvim-lualine/lualine.nvim',
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
},
{
        "Mofiqul/adwaita.nvim",
        lazy = false,
        priority = 1000,
    },

})

-- Set options
vim.opt.termguicolors = true

-- Require and setup configurations
require("mason").setup()
require("devcontainer").setup{}
require("bufferline").setup{}
require("config.lualine")
require("config.neo-tree")


--- Theme
vim.g.adwaita_darker = true -- for darker version
vim.g.adwaita_disable_cursorline = true -- to disable cursorline
vim.g.adwaita_transparent = true -- makes the background transparent
vim.cmd([[colorscheme adwaita]])

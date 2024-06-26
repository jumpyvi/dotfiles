local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('neoclide/coc.nvim', { ['branch'] = 'release' })
Plug 'williamboman/mason.nvim'

Plug 'mhartington/formatter.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-telescope/telescope.nvim'

Plug 'esensar/nvim-dev-container'

Plug 'akinsho/bufferline.nvim'

Plug 'nvim-lualine/lualine.nvim'


vim.call('plug#end')

vim.opt.termguicolors = true

require("mason").setup()
require("devcontainer").setup{}
require("bufferline").setup{}
require("config.lualine")

-- init.lua
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disable netrw (oil.nvim replaces it)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.options")
require("config.autocmds")
require("config.keymaps")
require("config.lazy")

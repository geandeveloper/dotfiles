-- init.lua
-- Load plugins
require("plugins")

-- Load keymaps
require("keymaps")

-- Load LSP config
require("lsp")

-- load user java config
require("user.java")

-- Basic options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true

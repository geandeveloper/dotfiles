-- keymaps.lua
local keymap = vim.keymap.set

-- Move between splits like tmux (Ctrl + h/j/k/l)
keymap("n", "<C-h>", "<C-w>h", { silent = true })
keymap("n", "<C-j>", "<C-w>j", { silent = true })
keymap("n", "<C-k>", "<C-w>k", { silent = true })
keymap("n", "<C-l>", "<C-w>l", { silent = true })

-- Easy save and quit
keymap("n", "<Leader>w", ":w<CR>", { silent = true })
keymap("n", "<Leader>q", ":q<CR>", { silent = true })

-- Telescope shortcuts
keymap("n", "<Leader>ff", ":Telescope find_files<CR>", { silent = true })
keymap("n", "<Leader>fg", ":Telescope live_grep<CR>", { silent = true })

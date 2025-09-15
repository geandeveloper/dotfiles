local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Essentials
	"nvim-lua/plenary.nvim",
	"nvim-treesitter/nvim-treesitter",
	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"nvim-lualine/lualine.nvim",
	"nvim-telescope/telescope.nvim",

	-- Java / Gradle support
	{
		"mfussenegger/nvim-jdtls", -- advanced Java LSP
		ft = "java",
	},
	{
		"microsoft/vscode-java-debug", -- optional: Java debugging
		ft = "java",
		build = "mvn clean install", -- required by java-debug
	},
	{
		"stevearc/vim-gradle", -- optional: Gradle commands
		ft = { "java", "groovy" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	},
})

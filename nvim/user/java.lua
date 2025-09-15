local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

-- -------------------------
-- Java LSP (jdtls)
-- -------------------------
lspconfig.jdtls.setup({
	cmd = { "jdtls" }, -- Mason instala automaticamente
	root_dir = lspconfig.util.root_pattern(".git", "build.gradle", "settings.gradle"),
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	settings = {
		java = {
			signatureHelp = { enabled = true },
			contentProvider = { preferred = "fernflower" },
		},
	},
})

-- -------------------------
-- Treesitter
-- -------------------------
require("nvim-treesitter.configs").setup({
	ensure_installed = { "java", "groovy" },
	highlight = { enable = true },
	indent = { enable = true },
})

-- -------------------------
-- Gradle commands (terminal)
-- -------------------------
vim.api.nvim_create_user_command("GradleBuild", "terminal ./gradlew build", {})
vim.api.nvim_create_user_command("GradleRun", "terminal ./gradlew run", {})

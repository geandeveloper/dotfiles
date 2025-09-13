-- lsp.lua
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Example for Python
lspconfig.pyright.setup {
  capabilities = capabilities
}

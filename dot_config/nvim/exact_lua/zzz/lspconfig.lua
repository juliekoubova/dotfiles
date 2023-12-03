local lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp.pylsp.setup { capabilities = capabilities }
lsp.tsserver.setup { capabilities = capabilities }

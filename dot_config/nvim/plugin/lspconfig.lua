local cmp = require('cmp')
cmp.setup {
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = {
    { name = 'nvim_lsp' }
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')
lspconfig.anakin_language_server.setup{
  capabilities = capabilities
}


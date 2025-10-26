return {
  "neovim/nvim-lspconfig",
  enabled = not vim.g.vscode,
  config = function()

    vim.lsp.config('*', {
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    })

    local clangd_opts = {}
    local idf_path = os.getenv("IDF_TOOLS_PATH")
    if idf_path then
      local clang_paths = vim.split(
        vim.fn.glob(idf_path .. "/tools/esp-clang/*"),
        '\n',
        { trimempty = true }
      )
      if #clang_paths > 0 then
        vim.lsp.config('clangd', {
          cmd = {
            clang_paths[#clang_paths] .. "/esp-clang/bin/clangd"
          }
        })
      end
    end

    vim.lsp.enable('clangd')
    vim.lsp.enable('lua_ls')
    vim.lsp.enable('pylsp')
    vim.lsp.enable('tailwindcss')
    vim.lsp.enable('ts_ls')

    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<Leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<Leader>fo', function()
          vim.lsp.buf.format { async = true }
        end, opts)
        vim.keymap.set('n', '<Leader>gh', '<Cmd>ClangdSwitchSourceHeader<CR>', opts)
      end,
    })
  end
}

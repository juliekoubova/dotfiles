vim.g.mapleader = " "

if vim.g.vscode then
  vim.keymap.set('n', '<leader>ff', function() require('vscode-neovim').call('workbench.action.quickOpen') end)
else
  -- Telescope
  vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
  vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>')
  vim.keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<CR>')
  vim.keymap.set('n', '<leader>v', '<cmd>echomsg system("curl -s -m 3 https://vtip.43z.one")<CR>')

  vim.keymap.set('n', '<C-S-F>', '<cmd>Telescope live_grep<CR>')
  vim.keymap.set('n', '<C-A-L>', '<cmd>NvimTreeFindFileToggle<CR>')

  -- Clear search with <Esc>
  vim.keymap.set({'n', 'i'}, '<Esc>', '<Cmd>noh<CR><Esc>')

  -- Disable Ctrl+Z
  vim.keymap.set('n', '<C-z>', '<nop>')
end

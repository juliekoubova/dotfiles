vim.g.mapleader = " "

if vim.g.vscode then
  local function vsc(cmd)
    return function() require('vscode-neovim').call(cmd) end
  end
  vim.keymap.set('n', '<leader>ff', vsc('workbench.action.quickOpen'))
  vim.keymap.set('n', '<leader>fb', vsc('workbench.action.openPreviousEditorFromHistory'))
  vim.keymap.set('n', '<leader>ft', vsc('workbench.view.explorer'))
else
  -- Telescope
  vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
  vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>')
  vim.keymap.set('n', '<leader>fr', '<cmd>Telescope registers<CR>')
  vim.keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<CR>')
  vim.keymap.set('n', '<leader>gb', '<cmd>Telescope git_branches<CR>')


  vim.keymap.set('n', '<leader>v', '<cmd>echomsg system("curl -s -m 3 https://vtip.43z.one")<CR>')

  -- Clear search with <Esc>
  vim.keymap.set({'n', 'i'}, '<Esc>', '<Cmd>noh<CR><Esc>')

  -- Disable Ctrl+Z
  vim.keymap.set('n', '<C-z>', '<nop>')

  -- NeoGit
  vim.keymap.set('n', '<leader>gs', '<cmd>Neogit<CR>')
  vim.keymap.set('n', '<leader>gl', function()
    require('neogit').action('log', 'log_current')()
  end)
end

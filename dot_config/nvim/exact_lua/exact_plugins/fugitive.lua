return {
  "tpope/vim-fugitive",
  config = function ()
    vim.keymap.set('n', '<Leader>ga', '<Cmd>Git add %:p<CR>')
    vim.keymap.set('n', '<Leader>gs', '<Cmd>Git<CR>')
  end,
}

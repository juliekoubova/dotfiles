return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim",        -- optional
  },
  cond = not (vim.g.started_by_firenvim or vim.g.vscode),
  config = true,
  keys = {
    { '<Leader>gs', '<Cmd>Neogit<CR>', desc = 'Neogit' },
  },
}

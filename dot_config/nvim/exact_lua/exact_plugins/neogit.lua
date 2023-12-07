return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim",        -- optional
    "catppuccin/nvim",
  },
  cond = not (vim.g.started_by_firenvim or vim.g.vscode),
  opts = {
    disable_hint = true,
    disable_insert_on_commit = false,
    graph_style = 'unicode',
  },
  keys = {
    { '<Leader>gs', '<Cmd>Neogit<CR>', desc = 'Neogit' },
  },
}

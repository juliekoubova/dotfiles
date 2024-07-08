return {
  "folke/noice.nvim",
  cond = not (vim.g.started_by_firenvim or vim.g.vscode),
  event = "VeryLazy",
  opts = {
    lsp = {
    },
    presets = {
      bottom_search = true,
    },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  }
}

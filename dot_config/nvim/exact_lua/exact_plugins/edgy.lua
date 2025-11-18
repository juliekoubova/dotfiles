return {
  "folke/edgy.nvim",
  lazy = true,
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"
  end,
  opts = {
    animate = { enabled = false },
    exit_when_last = true,
    options = {
      left = { size = 0.25 },
      right = { size = 0.4 },
    },
    left = {
      { ft = "NvimTree" },
    },
    right = {
      { ft = "toggleterm", title = "Terminal"  },
    },
  },
}

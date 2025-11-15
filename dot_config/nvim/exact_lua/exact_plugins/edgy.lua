return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"
  end,
  opts = {
    animate = { enabled = false },
    options = {
      left = { size = 0.25 },
      right = { size = 0.4 },
    },
    left = {
      { ft = "NvimTree" },
    },
    right = {
      { ft = "toggleterm" },
    },
  },
}

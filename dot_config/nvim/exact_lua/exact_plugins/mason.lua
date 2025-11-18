return {
  "mason-org/mason.nvim",
  event = "VeryLazy",
  opts = {
    -- log_level = vim.log.levels.DEBUG
    pip = {
      upgrade_pip = true,
    },
  },
}

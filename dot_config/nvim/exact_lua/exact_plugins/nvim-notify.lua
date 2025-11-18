return {
  "rcarriga/nvim-notify",
  cond = not vim.g.vscode,
  lazy = true,
  opts = {
    top_down = false,
    fps = 40,
  },
}

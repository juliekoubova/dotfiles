return {
  "rcarriga/nvim-notify",
  cond = not vim.g.vscode,
  opts = {
    top_down = false,
    fps = 40,
  },
}


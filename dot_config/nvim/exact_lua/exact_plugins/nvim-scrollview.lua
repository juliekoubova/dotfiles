return {
  "dstein64/nvim-scrollview",
  cond = not vim.g.vscode,
  opts = {
    current_only = true,
    signs_on_startup = {
      "conflicts",
      "diagnostics",
      "loclist",
      "marks",
      "quickfix",
      "search",
    },
  },
}

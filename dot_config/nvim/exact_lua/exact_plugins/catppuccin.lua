return {
  -- the colorscheme should be available when starting Neovim
  "catppuccin/nvim",
  cond = not (vim.g.started_by_firenvim or vim.g.vscode),
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  name = "catppuccin",
  opts = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
  },
  config = function()
    -- load the colorscheme here
    vim.cmd.colorscheme "catppuccin-mocha"
  end,
}

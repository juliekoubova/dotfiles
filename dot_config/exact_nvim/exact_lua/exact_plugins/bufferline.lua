return {
  "akinsho/bufferline.nvim",
  cond = not (vim.g.started_by_firenvim or vim.g.vscode),
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        hover = {
          enabled = true,
          reveal = { 'close' }
        },
        middle_mouse_command = "bdelete! %d",
        right_mouse_command = "",
        show_close_icon = false
      }
    })
  end,
}

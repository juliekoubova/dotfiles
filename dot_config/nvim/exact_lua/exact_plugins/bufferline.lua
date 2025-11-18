return {
  "akinsho/bufferline.nvim",
  cond = not (vim.g.started_by_firenvim or vim.g.vscode),
  lazy = true,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      hover = {
        enabled = true,
        reveal = { "close" },
      },
      middle_mouse_command = "bdelete! %d",
      right_mouse_command = "",
      show_close_icon = false,
    },
  },
  init = function()
    local autocmd_id = 0
    autocmd_id = vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        local buffers = vim.fn.getbufinfo({ buflisted = 1 })
        if #buffers > 1 then
          require("bufferline")
          vim.api.nvim_del_autocmd(autocmd_id)
        end
      end,
    })
  end,
}

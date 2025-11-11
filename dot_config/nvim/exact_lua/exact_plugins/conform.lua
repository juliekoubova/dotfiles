return {
  "stevearc/conform.nvim",
  opts = {
    default_format_opts = { lsp_format = "fallback" },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      javascript = { "prettierd", "prettier", stop_after_first = true },
      python = { "black" },
      lua = { "stylua" },
      sh = { "shfmt" },
    },
  },
  event = { "BufWritePre" },
  keys = {
    {
      "<leader>fo",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}

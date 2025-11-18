return {
  "stevearc/conform.nvim",
  opts = {
    default_format_opts = { lsp_format = "fallback" },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      javascript = { "prettierd" },
      jsonc = { "prettierd" },
      python = { "black" },
      lua = { "stylua" },
      sh = { "beautysh" },
      toml = { "tombi" },
      ["_"] = { "trim_whitespace" },
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
}

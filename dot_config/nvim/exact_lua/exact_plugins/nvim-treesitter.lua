return {
  "nvim-treesitter/nvim-treesitter",
  enabled = not vim.g.vscode,
  config = function()
    require('nvim-treesitter.configs').setup({
      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,
      ensure_installed =  {
        "lua", "vim", "vimdoc", "query", "regex",
        "markdown", "markdown_inline", "bash",
      },
      highlight = {
        enable = true,
      },
    })
  end
}

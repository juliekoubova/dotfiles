return {
  "nvim-treesitter/nvim-treesitter",
  enabled = not vim.g.vscode,
  config = function()
    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    parser_config['gotmpl'] = {
      install_info = {
        url = "https://github.com/ngalaiko/tree-sitter-go-template",
        files = { "src/parser.c" }
      },
      filetype = "gotmpl",
      used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "yaml" }
    }
    require('nvim-treesitter.configs').setup({
      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,
      ensure_installed = {
        "lua", "vim", "vimdoc", "query", "regex",
        "markdown", "markdown_inline", "bash",
      },
      highlight = {
        enable = true,
      },
      modules = {},
      ignore_install = {},
      sync_install = true,
    })
  end
}

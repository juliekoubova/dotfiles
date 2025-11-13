vim.filetype.add({
  pattern = {
    [".*/%.chezmoitemplates/.*"]  = "gotmpl",
    [".*dot_gitconfig.*"] = "git_config"
  }
})

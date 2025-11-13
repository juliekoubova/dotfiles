-- invoked from .chezmoitemplates/install_nvim.{cmd,sh}
require("lazy").sync({ wait = true })
vim.cmd("TSUpdateSync")

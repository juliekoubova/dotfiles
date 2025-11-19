local wezterm = require("wezterm")
local brew_prefix

if wezterm.target_triple == "aarch64-apple-darwin" then
  brew_prefix = "/opt/homebrew"
elseif wezterm.target_triple == "x86_64-apple-darwin" then
  brew_prefix = "/usr/local"
else
  return function() end
end

local brew_paths = { brew_prefix .. "/bin", brew_prefix .. "/sbin" }

return function(config)
  local env = config.set_environment_variables or {}
  env.PATH = env.PATH or os.getenv("PATH")
  for _, dir in ipairs(brew_paths) do
    env.PATH = env.PATH .. ":" .. dir
  end
  config.set_environment_variables = env
end

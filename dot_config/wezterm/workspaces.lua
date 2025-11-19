local wezterm = require("wezterm")

local function spawn_split_tab(args)
  local pane, window
  if args.window then
    _, pane, window =
      args.window:spawn_tab({ args = args.left_args, cwd = args.cwd })
  else
    _, pane, window =
      wezterm.mux.spawn_window({ args = args.left_args, cwd = args.cwd })
  end
  pane:split({
    args = args.right_args,
    cwd = args.cwd,
    direction = "Right",
    size = args.right_size,
  })
  return window
end

local function spawn_dotfiles_tab(args)
  return spawn_split_tab({
    cwd = args.cwd,
    left_args = { "nvim", args.cwd },
    window = args.window,
    right_size = 0.3,
  })
end

return function()
  if wezterm.hostname() == "julie-adell" then
    local root = "C:\\src\\"
    local window = spawn_split_tab({ cwd = root .. "teams\\tcns" })
    spawn_split_tab({ cwd = root .. "teams\\tcns2", window = window })
    spawn_dotfiles_tab({ cwd = root .. "dotfiles", window = window })
    return window
  end
end

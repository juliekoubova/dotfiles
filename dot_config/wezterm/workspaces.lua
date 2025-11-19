local wezterm = require("wezterm")

local function spawn_window(tabs)
  local pane, window
  for _, t in ipairs(tabs) do
    if window then
      _, pane, window = window:spawn_tab({
        args = t.right_args or t.args,
        cwd = t.cwd,
      })
    else
      _, pane, window =
        wezterm.mux.spawn_window({ args = t.right_args or t.args, cwd = t.cwd })
    end
    pane:split({
      args = t.left_args or t.args,
      cwd = t.cwd,
      direction = "Left",
      size = t.left_size,
    })
  end
  return window
end

local function dotfiles_tab(cwd)
  return {
    cwd = cwd,
    left_args = { "nvim", cwd },
    left_size = 0.75,
  }
end

return function()
  if wezterm.hostname() == "julie-adell" then
    local root = "C:\\src\\"
    return spawn_window({
      { cwd = root .. "teams\\tcns" },
      { cwd = root .. "teams\\tcns2" },
      dotfiles_tab(root .. "dotfiles"),
    })
  elseif wezterm.hostname() == "julie-work-mbp" then
    local root = os.getenv("HOME")
    return spawn_window({
      { cwd = root .. "/tcns" },
      dotfiles_tab(root .. "/dotfiles"),
    })
  end
end

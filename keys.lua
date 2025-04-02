local wezterm = require 'wezterm'

local M = {}

function M.apply_to_config(config)
  config.keys = {
    -- 新建标签页
    {
      key = 't',
      mods = 'CMD',
      action = wezterm.action.SpawnTab 'CurrentPaneDomain',
    },
    -- 垂直分割窗格
    {
      key = '|',
      mods = 'CMD|SHIFT',
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    -- 水平分割窗格
    {
      key = '_',
      mods = 'CMD|SHIFT',
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    -- 切换全屏
    {
      key = 'f',
      mods = 'CMD|SHIFT',
      action = wezterm.action.ToggleFullScreen,
    },
  }

  return config
end

return M

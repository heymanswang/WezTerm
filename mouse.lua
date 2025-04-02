local wezterm = require 'wezterm'
local act = wezterm.action

local M = {}

function M.apply_to_config(config)
  -- 鼠标映射配置
  config.mouse_bindings = {
    -- 右键拖拽选择
    {
      event = { Drag = { streak = 1, button = "Right" } },
      action = wezterm.action { ExtendSelectionToMouseCursor = "Cell" }
    },
    
    -- 保留默认的左键选择行为
    {
      event = { Down = { streak = 1, button = 'Left' } },
      mods = 'NONE',
      action = act.SelectTextAtMouseCursor('Cell'),
    },
    {
      event = { Down = { streak = 2, button = 'Left' } },
      mods = 'NONE',
      action = act.SelectTextAtMouseCursor('Word'),
    },
    {
      event = { Down = { streak = 3, button = 'Left' } },
      mods = 'NONE',
      action = act.SelectTextAtMouseCursor('Line'),
    },
    
    -- 不干扰 vim 的鼠标模式
    {
      event = { Down = { streak = 1, button = 'Right' } },
      mods = 'NONE',
      mouse_reporting = true,
      action = act.DisableDefaultAssignment,
    },
  }
  
  -- 启用正确的鼠标模式配置
  -- 使用 enable_kitty_keyboard 代替不存在的 enable_kitty_mouse
  config.enable_kitty_keyboard = true
  
  -- 允许应用程序覆盖光标样式
  config.allow_win32_input_mode = true
end

return M

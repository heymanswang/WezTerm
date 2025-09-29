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
    
    -- 优化鼠标滚轮行为
    {
      event = { Down = { streak = 1, button = { WheelUp = 1 } } },
      mods = 'NONE',
      mouse_reporting = true,
      action = act.ScrollByLine(-3), -- 提高滚轮灵敏度
    },
    {
      event = { Down = { streak = 1, button = { WheelDown = 1 } } },
      mods = 'NONE',
      mouse_reporting = true,
      action = act.ScrollByLine(3), -- 提高滚轮灵敏度
    },
  }
  
  -- 启用正确的鼠标模式配置
  config.enable_kitty_keyboard = true
  
  -- 允许应用程序覆盖光标样式
  config.allow_win32_input_mode = true
  
  -- 优化鼠标行为配置
  config.pane_focus_follows_mouse = true -- 光标跟随鼠标
  
  -- 高精度滚动支持（对高分辨率鼠标更友好）
  config.enable_scroll_bar = true
  
  -- 针对Magic Mouse和触控板的平滑滚动优化
  if wezterm.target_triple:find("apple") then
    -- 增大滚动缓冲区，适应惯性滚动
    config.scrollback_lines = 10000
  end
end

return M

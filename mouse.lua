local wezterm = require 'wezterm'
local act = wezterm.action

local M = {}

function M.apply_to_config(config)
  -- 鼠标映射配置
  config.mouse_bindings = {
    -- 右键行为：如果有选择文本则复制，否则粘贴
    {
      event = { Down = { streak = 1, button = 'Right' } },
      mods = 'NONE',
      action = wezterm.action_callback(function(window, pane)
        local has_selection = window:get_selection_text_for_pane(pane) ~= ''
        if has_selection then
          window:perform_action(act.CopyTo('ClipboardAndPrimarySelection'), pane)
          window:perform_action(act.ClearSelection, pane)
        else
          window:perform_action(act.PasteFrom('Clipboard'), pane)
        end
      end),
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
  
  -- 启用鼠标模式，使 vim 可以接收鼠标事件
  config.enable_kitty_mouse = true  -- 使用正确的配置项名称
  
  -- 允许应用程序覆盖光标样式
  config.allow_win32_input_mode = true
end

return M

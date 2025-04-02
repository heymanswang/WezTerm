local wezterm = require 'wezterm'

local M = {}

function M.apply_to_config(config)
  config.color_scheme = "Dracula"
  
  -- 设置透明度和模糊效果
  config.window_background_opacity = 0.95
  
  -- 如果是macOS，添加模糊效果
  if wezterm.target_triple:find("apple") then
    config.macos_window_background_blur = 20
  end
  
  -- 标题按钮样式
  config.integrated_title_button_style = "MacOsNative"
  
  -- 光标样式
  config.default_cursor_style = "BlinkingBlock"
  
  -- 字体配置
  config.font = wezterm.font("Monaspace Argon", { weight = 500, style = "Italic" })
  config.font_size = 17.0
  config.freetype_load_target = "HorizontalLcd"
  config.line_height = 1.2  -- 减小行高为默认的1.0倍，减少命令间的间距
  config.cell_width = 1.0   -- 设置字符宽度比例为1.0
  
  config.enable_scroll_bar = true
  config.colors = config.colors or {}
  config.colors.scrollbar_thumb = "#666666"
  
  return config
end

return M

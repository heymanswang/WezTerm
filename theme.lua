local wezterm = require 'wezterm'

local M = {}

function M.apply_to_config(config)

  local appearance = wezterm.gui and wezterm.gui.get_appearance() or "Dark"

  if appearance:find("Dark") then
    config.color_scheme = "Gogh (Gogh)"
  else
    config.color_scheme = "Humanoid light (base16)"
  end

  -- 设置透明度和模糊效果
  config.window_background_opacity = appearance:find("Dark") and 0.90 or 0.95

  -- 如果是macOS，添加模糊效果
  if wezterm.target_triple:find("apple") then
    config.macos_window_background_blur = 30
  end

  -- 标题按钮样式
  config.integrated_title_button_style = "MacOsNative"

  -- 光标样式
  config.default_cursor_style = "BlinkingBlock"

  -- 字体配置，添加中文字体支持
  config.font = wezterm.font_with_fallback({
    -- 主字体
    { family = "Hack Nerd Font", weight = 500, style = "Italic" },
    { family = "Monaspace Xenon Var", weight = 500, style = "Italic" },
    -- 中文字体回退，按优先级排序
    { family = "PingFang SC", weight = "Regular" },
    { family = "Noto Sans CJK SC", weight = "Regular" },
    { family = "Microsoft YaHei", weight = "Regular" },
  })

  config.font_size = 17.0
  config.freetype_load_target = "HorizontalLcd"
  config.line_height = 1.2
  config.cell_width = 1.0

  -- 优化中文渲染
  config.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"

  -- 配置半角和全角字符的宽度比例，优化中文显示
  config.use_cap_height_to_scale_fallback_fonts = true

  config.enable_scroll_bar = true
  config.colors = config.colors or {}
  config.colors.scrollbar_thumb = "#666666"

  return config
end

return M

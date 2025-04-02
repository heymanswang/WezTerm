local wezterm = require 'wezterm'

local M = {}

function M.apply_to_config(config)
  -- 统一设置颜色主题为 Nord (Gogh)
  config.color_scheme = "Nord (Gogh)"
  
  -- 设置透明度和模糊效果
  config.window_background_opacity = 0.95
  
  -- 如果是macOS，添加模糊效果
  if wezterm.target_triple:find("apple") then
    config.macos_window_background_blur = 20
  end
  
  -- 标签栏样式
  config.use_fancy_tab_bar = false
  config.enable_tab_bar = true
  config.show_tab_index_in_tab_bar = true
  config.tab_max_width = 120
  config.hide_tab_bar_if_only_one_tab = true
  config.tab_bar_at_bottom = false
  

  -- 自定义标签标题格式
  wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local title = tab.active_pane.title
    
    -- 如果有域名信息，添加到标题中
    if tab.active_pane.domain_name then
      title = title .. ' - (' .. tab.active_pane.domain_name .. ')'
    end
    
    -- 截断过长的标题
    if #title > 20 then
      title = string.sub(title, 1, 18) .. "..."
    end
    
    return title
  end)
  
  -- 设置标签栏颜色
  local scheme = wezterm.color.get_builtin_schemes()[config.color_scheme]
  if scheme then
    -- 从主题中提取颜色设置标签栏
    config.colors = {
      tab_bar = {
        -- 活动标签使用黑色背景
        active_tab = {
          bg_color = "#000000",
          fg_color = "#FFFFFF",
        },
        -- 非活动标签
        inactive_tab = {
          bg_color = scheme.background,
          fg_color = scheme.foreground,
        },
        -- 新标签按钮
        new_tab = {
          bg_color = scheme.background,
          fg_color = scheme.brights[4] or scheme.ansi[4],
        },
        -- 新标签按钮悬停效果
        new_tab_hover = {
          bg_color = scheme.selection_bg or scheme.ansi[4],
          fg_color = scheme.foreground,
        },
      },
    }
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
  config.colors.scrollbar_thumb = "#666666"
  
  return config
end

return M

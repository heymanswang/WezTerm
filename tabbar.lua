local wezterm = require 'wezterm'

local M = {}

function M.apply_to_config(config)
  -- 标签栏样式
  config.use_fancy_tab_bar = false
  config.enable_tab_bar = true
  config.show_tab_index_in_tab_bar = true
  config.tab_max_width = 120
  config.hide_tab_bar_if_only_one_tab = true
  config.tab_bar_at_bottom = false
  
  -- 使用format-tab-title事件处理来自定义标签外观
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
    
    -- 添加左右边界装饰
    local edge_background = "#0b0022"
    local background, foreground
    
    if tab.is_active then
      background = "#2b2042"
      foreground = "#f8f8f2"
    else
      background = "#1b1032"
      foreground = "#a3a3a3"
    end
    
    -- 使用format方法创建自定义标签格式
    return wezterm.format {
      { Background = { Color = edge_background } },
      { Foreground = { Color = background } },
      { Text = " " },  -- 左边界符号
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = " " .. title .. " " },
      { Background = { Color = edge_background } },
      { Foreground = { Color = background } },
      { Text = " " },  -- 右边界符号
    }
  end)
  
  -- 设置标签栏颜色
  local scheme = wezterm.color.get_builtin_schemes()[config.color_scheme]
  if scheme then
    -- 从主题中提取颜色设置标签栏
    config.colors = config.colors or {}
    config.colors.tab_bar = {
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
    }
  end

  -- 移除导致错误的tab_bar_style配置
  -- 替换为wezterm支持的tab_bar_style设置
  config.tab_bar_style = {
    new_tab = wezterm.format {
      { Attribute = { Intensity = "Bold" } },
      { Foreground = { Color = "#f8f8f2" } },
      { Text = " + " },
    },
    new_tab_hover = wezterm.format {
      { Attribute = { Intensity = "Bold" } },
      { Foreground = { Color = "#8be9fd" } },
      { Text = " + " },
    },
  }

  return config
end

return M

local wezterm = require 'wezterm'

local config = wezterm.config_builder()


wezterm.on('format-tab-title', function(tab)
  local pane = tab.active_pane
  local title = pane.title
  if pane.domain_name then
    title = title .. ' - (' .. pane.domain_name .. ')'
  end
  return title
end)

automatically_reload_config = true

-- terminal 颜色
config.color_scheme = "Nord (Gogh)"

-- 窗口标题
config.window_frame = {
    font = wezterm.font("JetBrains Mono"),
    font_size = 14.0,

}

-- 标签栏
config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.show_tab_index_in_tab_bar = true
config.tab_max_width = 120

-- 如果只有一个标签,隐藏标签栏
config.hide_tab_bar_if_only_one_tab = true 

-- 标签栏内边距
config.default_cursor_style = "BlinkingBar"
config.integrated_title_button_style = "MacOsNative"

-- 窗口内边距
config.window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
}


-- 窗口行数
config.initial_rows =  30
config.initial_cols = 118

-- 窗口装饰
-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.default_cursor_style = "SteadyBlock"

-- 窗口不透明度
config.window_background_opacity = 0.95

-- 字体配置
config.font = wezterm.font("JetBrainsMonoNL Nerd Font Propo", { weight = "Regular", italic = true })
config.font_size = 18.0
config.freetype_load_target = "HorizontalLcd"

return config

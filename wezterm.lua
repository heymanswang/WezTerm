local wezterm = require 'wezterm'
local theme = require 'theme'

local config = wezterm.config_builder()

-- 注意：移除或注释掉这里原有的format-tab-title事件处理，
-- 因为它会与theme.lua中的处理冲突

-- 自动重新加载配置
config.automatically_reload_config = true

-- 应用主题设置
theme.apply_to_config(config)

-- 窗口内边距
config.window_padding = {
    left = 10,
    right = 10,
    top = 0,
    bottom = 0,
}

-- 窗口行数
config.initial_rows =  35
config.initial_cols = 120

-- 窗口装饰
-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_decorations = "INTEGRATED_BUTTONS"
config.window_close_confirmation = "AlwaysPrompt"

-- 键盘快捷键配置
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

-- 默认启动程序与工作目录
config.default_prog = { '/bin/zsh' }
config.default_cwd = wezterm.home_dir

-- 状态栏配置
config.status_update_interval = 1000

-- 滚动配置
config.scrollback_lines = 10000
quit_when_all_windows_are_closed = false
return config

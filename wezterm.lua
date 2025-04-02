local wezterm = require 'wezterm'
local theme = require 'theme'
local keys = require 'keys'
local tabbar = require 'tabbar'
local mouse = require 'mouse'  -- 引入新的鼠标配置模块

local config = wezterm.config_builder()

-- 注意：移除或注释掉这里原有的format-tab-title事件处理，
-- 因为它会与theme.lua中的处理冲突

-- 自动重新加载配置
config.automatically_reload_config = true

-- 应用主题设置
theme.apply_to_config(config)

-- 应用键盘快捷键设置
keys.apply_to_config(config)

-- 应用标签栏设置
tabbar.apply_to_config(config)

-- 应用鼠标设置
mouse.apply_to_config(config)

-- 窗口内边距
config.window_padding = {
    left = 10,
    right = 10,
    top = 15,
    bottom = 10,
}

-- 窗口行数
config.initial_rows =  35
config.initial_cols = 120

-- 窗口装饰
-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"

-- 状态栏配置
config.status_update_interval = 1000

-- 滚动配置
config.scrollback_lines = 10000

-- 防止关闭最后一个标签页时自动退出
config.quit_when_all_windows_are_closed = false
config.exit_behavior = "Close"  -- 关闭最后一个标签页时保持程序运行

return config

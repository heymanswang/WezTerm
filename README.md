# WezTerm 配置

这是一个为 WezTerm 终端模拟器定制的配置。该配置专注于提供美观的外观和实用的功能。

## 配置文件结构

- `wezterm.lua` - 主配置文件
- `theme.lua` - 主题和样式配置

## 主要特性

- Nord (Gogh) 主题
- Monaspace Argon 字体
- 合理的透明度和模糊效果
- 高效的标签栏样式
- 实用的键盘快捷键
- 提高可读性的行高设置

## 使用方法

1. 将这些文件放置在 `~/.config/wezterm/` 目录下
2. 重启 WezTerm 或在运行中的 WezTerm 窗口中按 `Command+Shift+R` 重新加载配置

## 调整配置方案

### 调整字体

如果你想改变字体，可以在 `theme.lua` 中修改以下部分：

```lua
config.font = wezterm.font("Monaspace Argon", { weight = 500 })
config.font_size = 17.0
config.line_height = 1.2  -- 行高倍数
```

常用备选字体：
- `JetBrainsMono Nerd Font`
- `Hack Nerd Font Mono`
- `FiraCode Nerd Font`

### 调整透明度

在 `theme.lua` 中修改：

```lua
config.window_background_opacity = 0.95  -- 值在0.0到1.0之间
```

### 调整模糊效果

在 `theme.lua` 中修改（仅适用于macOS）：

```lua
config.macos_window_background_blur = 20  -- 增加数值增强模糊效果
```

### 更改颜色主题

在 `theme.lua` 中修改：

```lua
config.color_scheme = "Nord (Gogh)"  -- 替换为你想要的主题名称
```

你可以使用以下命令查看所有可用的颜色主题：

```lua
-- 在WezTerm中运行以下命令查看所有可用主题
wezterm cli list-colors
```

调整此值可以使标签栏更高或更低，根据个人喜好设置。

### 自定义键盘快捷键

在 `wezterm.lua` 中，可以添加或修改键盘快捷键：

```lua
config.keys = {
  -- 示例：添加打开新窗口的快捷键
  {
    key = 'n',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SpawnWindow,
  },
  -- 添加更多快捷键...
}
```

### 调整窗口大小

在 `wezterm.lua` 中修改：

```lua
config.initial_rows = 35  -- 初始行数
config.initial_cols = 120  -- 初始列数
```

## 常用快捷键

- `CMD+T` - 新建标签页
- `CMD+SHIFT+|` - 垂直分割窗格
- `CMD+SHIFT+_` - 水平分割窗格
- `CMD+SHIFT+F` - 切换全屏

## 问题排查

如果配置无法正常加载：

1. 检查 Lua 语法错误
2. 在终端运行 `wezterm -e echo "Hello"` 查看错误信息
3. 确保配置文件路径正确
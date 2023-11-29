--[[
-- 目录插件
--]]
local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
  vim.notify("nvim-tree not found")
  return
end

-- 列表操作快捷键
--local list_keys = require('keybindings').nvimTreeList
nvim_tree.setup({
  -- 不显示 git 状态图标
  git = {
    enable = false,
  },
  update_cwd = true,
  update_focused_file = {-- project plugin 需要这样设置
    enable = true,
    update_cwd = true,
  },
  sync_root_with_cwd = true, -- project plugin 需要这样设置
  respect_buf_cwd= true,-- project plugin 需要这样设置
  -- 隐藏 .文件 和 node_modules 文件夹
  filters = {
    dotfiles = true,
    custom = { 'node_modules' },
  },
  renderer = {
    -- 隐藏根目录
    root_folder_label = ""
  },
  -- 自定义列表中快捷键
  --   mappings = {
  --      custom_only = false,
  --     list = list_keys,
  ----  },
  view = {
    -- 宽度
    width = 40,
    -- 也可以 'right'
    side = 'left',
    -- 不显示行数
    number = false,
    relativenumber = false,
    -- 显示图标
    signcolumn = 'yes',
  },
  actions = {
    open_file = {
      -- 首次打开大小适配
      resize_window = true,
      -- 打开文件时关闭
      quit_on_open = true,
    },
  },
  system_open = {
    cmd = 'xdg-open', -- mac 直接设置为 open
  },
})
-- 自动关闭
vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])

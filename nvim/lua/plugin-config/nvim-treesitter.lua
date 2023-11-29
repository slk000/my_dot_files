local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify("nvim-treesitter not found")
    return
end

treesitter.setup({
  -- 安装 language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = { "c","cpp","go","json", "html", "css", "vim", "lua", "javascript", "typescript", "tsx" },
  -- 启用代码高亮模块
  highlight = {
    enable = true, -- 开启treesitter的高亮
    additional_vim_regex_highlighting = false, -- 关闭nvim的基于正则的高亮
  },
  -- 启用增量选择模块
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>", -- 开始选择
      node_incremental = "<CR>", -- 增加范围
      node_decremental = "<BS>", -- 减少范围
      scope_incremental = "<TAB>", -- ？
    },
  },
  -- 启用代码缩进模块 (=)
  indent = {
    enable = true,
  },
})

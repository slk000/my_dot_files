require('basic')
require('keybindings')

-- Load lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  -- 目录栏
  { "nvim-tree/nvim-tree.lua", event = "VimEnter", dependencies = "nvim-tree/nvim-web-devicons" },
  -- 主题
  { "ful1e5/onedark.nvim", name = "onedark", priority = 1000 },
  -- tab栏， vim-bbye 代替bdelete命令，关闭tab的时候不会把分屏拆坏
  {'akinsho/bufferline.nvim', version = "*", dependencies = {'nvim-tree/nvim-web-devicons', 'moll/vim-bbye'}},
  -- 底部状态栏和lsp支持
  {"nvim-lualine/lualine.nvim"},{"arkav/lualine-lsp-progress"},
  -- 全局搜索 另外依赖sudo pacman -S ripgrep fd
  {'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' }},
  -- 代码高亮等
  {"nvim-treesitter/nvim-treesitter"},
  -- 匹配括号
  {'windwp/nvim-autopairs', event = "InsertEnter", opts = {}},
  -- 补全引擎
  {"neovim/nvim-lspconfig"},{"hrsh7th/nvim-cmp"},
  -- snippet 引擎
  {"hrsh7th/vim-vsnip"},
  -- 补全源：snippet、lsp、当前buffer、路径、命令行
  {"hrsh7th/cmp-vsnip"}, {"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-path"}, {"hrsh7th/cmp-cmdline"},
  -- LSP 管理
   {"williamboman/mason.nvim"},{"williamboman/mason-lspconfig.nvim"},
  -- 常见编程语言代码段
  {"rafamadriz/friendly-snippets"},
  -- 显示函数签名
  {"ray-x/lsp_signature.nvim", event = "VeryLazy"},
  -- Project管理
  {"ahmedkhalf/project.nvim"},
  -- git
  {"lewis6991/gitsigns.nvim"},
  -- 按键提示
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end, opts = {}
  },
  -- go debug
  {"leoluz/nvim-dap-go", dependencies={"mfussenegger/nvim-dap"}}
})

-- require("colorscheme")
vim.cmd.colorscheme("onedark")

require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require('plugin-config.telescope')
require('plugin-config.nvim-treesitter')
require('plugin-config.project')
require('plugin-config.gitsigns')
-- require('lsp.setup')
require("lsp.mason")
require("lsp.cmp")
-- require("lsp.ui")
require("lsp.lsp_signature")
require("plugin-config.nvim-dap-go")

--[[ 基本绑定 ]]
-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }

map("n", "s", "", opt) -- 取消 s 默认功能

map("n", "sv", ":vsp<CR>", opt) -- 垂直分屏
map("n", "sh", ":sp<CR>", opt) -- 水平分屏
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- Alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "s.", ":vertical resize +20<CR>", opt)
-- 上下比例
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- 等比例
map("n", "s=", "<C-w>=", opt)



-- Terminal相关
map("n", "<leader>t", ":sp | terminal<CR>", opt) -- <leader>t 水平打开terminal
map("n", "<leader>vt", ":vsp | terminal<CR>", opt) -- <leader>vt 垂直打开terminal
map("t", "<Esc>", "<C-\\><C-n>", opt) -- <Esc>关闭terminal
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)


-- 上下滚动浏览
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)


-- 在visual 模式里粘贴后不要复制选中的东西
map("v", "p", '"_dP', opt)

-- 退出
map("n", "q", ":q<CR>", opt)
-- map("n", "qq", ":q!<CR>", opt)
-- map("n", "Q", ":qa!<CR>", opt)

-- insert 模式下，跳到行首行尾
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)


--[[
--      插件快捷键
--]]
local pluginKeys = {}

-- nvim-tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt) -- 打开关闭文件栏
map("i", "<A-m>", "<ESC>:NvimTreeToggle<CR>", opt) -- 打开关闭文件栏
-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- 分屏打开文件
  { key = "v", action = "vsplit" },
  { key = "h", action = "split" },
  -- 显示隐藏文件
  { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- 文件操作
  { key = "<F5>", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "s", action = "system_open" },
}

--[[
-- =======================================================================
--]]

--[[
--      bufferline & moll/vim-bbye
--]]
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt) -- 切换到左侧tab
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt) -- 切换到右侧tab
map("n", "<C-w>", ":Bdelete!<CR>", opt) -- 关闭当前tab
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt) -- 选择一个tab关闭
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt) -- 关闭左侧tab
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt) -- 关闭右侧tab
--[[
-- =======================================================================
--]]


--[[
-- Telescope
--]]
map("n", "<C-p>", ":Telescope find_files<CR>", opt) -- 查找文件
map("n", "<C-f>", ":Telescope live_grep<CR>", opt) -- 全局搜索
-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
  i = {
    -- 上下移动
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    --  ["<Down>"] = "move_selection_next",
    --  ["<Up>"] = "move_selection_previous",
    -- 历史记录
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    -- 关闭窗口
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}
--[[
-- =======================================================================
--]]


--[[
-- LSP
--]]
-- lsp 回调函数快捷键设置
-- rename
map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opt)
-- code action
map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opt)
-- go xx
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opt)
map("n", "gh", ":lua vim.lsp.buf.hover()<CR>", opt)
map("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opt)
map("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opt)
map("n", "gr", ":lua vim.lsp.buf.references()<CR>", opt)
-- diagnostic
map("n", "gp", ":lua vim.diagnostic.open_float()<CR>", opt) -- 单独显示完整的错误信息
map("n", "gk", ":lua vim.diagnostic.goto_prev()<CR>", opt)
map("n", "gj", ":lua vim.diagnostic.goto_next()<CR>", opt)
map("n", "<leader>f", ":lua vim.lsp.buf.formatting()<CR>", opt)
--[[
pluginKeys.mapLSP = function(mapbuf)
  -- rename
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  -- code action
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  -- go xx
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  -- diagnostic
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt) -- 单独显示完整的错误信息
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
  -- 没用到
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end
--]]
--[[
-- =======================================================================
--]]

--[[
--      nvim-cmp 自动补全
--]]
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end
pluginKeys.cmp = function(cmp)
  return {
    -- 出现补全
    ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
    -- 取消
    ["<A-,>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close()
    }),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- 上一个补全项
    ["<Tab>"] = cmp.mapping.select_next_item(), -- 下一个补全项
    -- 自定义代码段跳转到下一个空位
    ["<C-j>"] = cmp.mapping(function(_)
      if vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      end
    end, {"i", "s"}),

    -- 自定义代码段跳转到上一个空位
    ["<C-k>"] = cmp.mapping(function()
      if vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, {"i", "s"}),

    -- 确认
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    -- 如果窗口内容太多，可以滚动
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
  }
end
--[[
-- =======================================================================
--]]

--[[
--      nvim-dap nvim-dap-go调试
--]]
map("n", "<F6>", ":lua require('dap').toggle_breakpoint()<CR>", opt)
map("n", "<F5>", ":lua require('dap').continue()<CR>", opt)
map("n", "<F8>", ":lua require('dap').step_over()<CR>", opt)
map("n", "<F7>", ":lua require('dap').step_into()<CR>", opt)
map("n", "<F9>", ":lua require('dap').step_out()<CR>", opt)
--[[
-- =======================================================================
--]]
return pluginKeys


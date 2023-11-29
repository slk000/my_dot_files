vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false, -- 在输入模式下也更新代码提示，设置为 true 也许会影响性能
})
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


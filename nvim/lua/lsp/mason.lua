require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "lua_ls",
    "clangd"
  },
})

local lspconfig = require('lspconfig')
require("mason-lspconfig").setup_handlers({
  function (server_name)
    require("lspconfig")[server_name].setup{}
  end,
  -- Next, you can provide targeted overrides for specific servers.
  ["lua_ls"] = function ()
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    }
  end,
  ["gopls"] = function()
    lspconfig.gopls.setup {
      settings = {
        gopls = {
          env = {
            GOFLAGS = "-tags=e2e" -- https://github.com/golang/go/issues/29202#issuecomment-1233042513
          }
        }
      }
    }
  end,
  ["clangd"] = function ()
    lspconfig.clangd.setup {
      cmd = {
        "clangd",
        "--header-insertion=never",
        "--query-driver=clangd",
        "--all-scopes-completion",
        "--completion-style=detailed",
      }
    }
  end
})

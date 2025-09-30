local nvlsp = require "nvchad.configs.lspconfig"

local vue_language_server_path = vim.fn.stdpath "data" .. "/mason/packages"
  .. "/vue-language-server"
  .. "/node_modules/@vue/language-server"

-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/configs/lspconfig.lua#L50
nvlsp.defaults()

-- debug
-- vim.lsp.set_log_level "debug"

local servers = {
  "lua_ls",
  "bashls",
  "pyright",
  "gopls",
  "vue_ls",
  "vtsls",
  "html",
  "cssls",
}

local vue_plugin = {
  name = "@vue/typescript-plugin",
  location = vue_language_server_path,
  languages = { "vue" },
  configNamespace = "typescript",
}
vim.lsp.config("vtsls", {
  -- cmd = { "node", "--inspect", "/Users/sdvcrx/.emacs.d/.local/etc/lsp/npm/@vtsls/language-server/bin/vtsls", "--stdio" },
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
        },
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
})

vim.lsp.config("vue_ls", {
})

vim.lsp.config("*", {
  capabilities = nvlsp.capabilities,
  on_init = nvlsp.on_init,
})
vim.lsp.enable(servers)

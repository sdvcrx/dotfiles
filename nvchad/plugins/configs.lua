local M = {}

M.telescope = {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = function (prompt_bufnr)
          require("telescope.actions").close(prompt_bufnr)
        end,
        ["<C-u>"] = false,
      }
    },
  },
  pickers = {
    find_files = {
      -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
      find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
    },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- frontend
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "json-lsp",
    "vue-language-server",

    -- golang
    --"gopls",
  },
}

M.treesitter = {
  indent = {
    enable = true,
  },
  ensure_installed = {
    -- lua
    "lua",

    -- frontend
    "vue",
    "html",
    "css",
    "scss",
    "javascript",
    "typescript",

    -- golang
    "go",
  },
}

return M

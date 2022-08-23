local M = {}

M.telescope = {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = function (prompt_bufnr)
          require("telescope.actions").close(prompt_bufnr)
        end,
        ["<C-u>"] = false,
        ["<C-j>"] = function (prompt_bufnr)
          require("telescope.actions").move_selection_next(prompt_bufnr)
        end,
        ["<C-k>"] = function (prompt_bufnr)
          require("telescope.actions").move_selection_previous(prompt_bufnr)
        end,
      }
    },
  },
  pickers = {
    find_files = {
      theme = "ivy",
      -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
      find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
    },
  },
  extensions_list = { "themes", "terms", "project" },
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

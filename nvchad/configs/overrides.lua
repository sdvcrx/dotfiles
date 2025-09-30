local theme = require "telescope.themes"

local M = {}

local ivy_theme = theme.get_ivy {
  layout_config = {
    preview_cutoff = 3000,
  },
  mappings = {
    i = {
      ["<esc>"] = function(prompt_bufnr)
        require("telescope.actions").close(prompt_bufnr)
      end,
      ["<C-u>"] = false,
      ["<C-j>"] = function(prompt_bufnr)
        require("telescope.actions").move_selection_next(prompt_bufnr)
      end,
      ["<C-k>"] = function(prompt_bufnr)
        require("telescope.actions").move_selection_previous(prompt_bufnr)
      end,
    },
  },
}

M.telescope = {
  defaults = ivy_theme,
  extensions = {
    extensions = {
      workspaces = {
        -- keep insert mode after selection in the picker, default is false
        keep_insert = true,
        -- Highlight group used for the path in the picker, default is "String"
        path_hl = "String"
      }
    },
    -- fzf = {
    --   fuzzy = true, -- false will only do exact matching
    --   override_generic_sorter = false,
    --   override_file_sorter = true,
    --   case_mode = "smart_case",
    -- },
  },
  pickers = {
    buffers = {
      theme = "ivy",
    },
    live_grep = {
      theme = "ivy",
    },
    git_branches = {
      theme = "ivy",
    },
    find_files = {
      theme = "ivy",
      -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
      find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
    },
  },
  extensions_list = { "themes", "terms", "project", "fzf" },
}

-- https://mason-registry.dev/registry/list
M.mason = {
  ensure_installed = {
    -- shell
    "bash-language-server",

    -- python
    "pyright",

    -- lua stuff
    "lua-language-server",
    "stylua",

    -- frontend
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "json-lsp",
    "vue-language-server",
    "vtsls",

    -- golang
    --"gopls",
    --"gofumpt",
    --"goimports",
  },
}

M.treesitter = {
  indent = {
    enable = true,
    disable = {
      "python",
      "javascript",
      "typescript",
      "tsx",
      "json",
    },
  },
  -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
  ensure_installed = {
    -- shell
    "bash",

    -- python
    "python",

    -- lua
    "lua",

    -- frontend
    "vue",
    "html",
    "css",
    "scss",
    "javascript",
    "typescript",
    "tsx",

    -- config
    "json",
    "yaml",

    -- sql
    "sql",

    -- golang
    "go",
    "gomod",
    "gowork",
    "gosum",
  },
}

M.cmp = {
  completion = {
    completeopt = "menu,menuone,noinsert",
    keyword_length = 2,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "luasnip", max_item_count = 4 },
    { name = "nvim_lua" },
    { name = "async_path" },
  },
}

return M

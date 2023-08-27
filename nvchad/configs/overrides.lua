local M = {}

M.telescope = {
  defaults = {
    layout_config = {
      preview_cutoff = 3000,
    },
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
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
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

-- https://github.com/williamboman/mason.nvim/blob/main/PACKAGES.md
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

    -- golang
    --"gopls",
  },
}

M.treesitter = {
  indent = {
    enable = true,
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
    "json",

    -- golang
    "go",
  },
}

M.cmp = {
  completion = {
    completeopt = 'menu,menuone,noinsert',
    keyword_length = 2,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "luasnip", max_item_count = 4 },
    { name = "nvim_lua" },
    { name = "path" },
  },
}

return M

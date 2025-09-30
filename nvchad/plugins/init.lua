local overrides = require "configs.overrides"

---@type NvPluginSpec[]
return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup {
        default_mappings = true,
        timeout = 300,
      }
    end,
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
  },
  {
    "ethanholz/nvim-lastplace",
    config = function()
      require("nvim-lastplace").setup()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-project.nvim" },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    opts = overrides.telescope,
  },
  -- Copy from https://github.com/folke/todo-comments.nvim/issues/181#issuecomment-1532161248
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.todocomments"
    end,
    config = function(_, opts)
      require("todo-comments").setup(opts)
    end,
  },

  -- workspace
  {
    "natecraddock/workspaces.nvim",
    config = function ()
      require("workspaces").setup({
        hooks = {
          open = { "Telescope find_files" },
        }
      })
    end,
  },

  -- neogit
  {
    "NeogitOrg/neogit",
    cmd = {
      "Neogit",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("neogit").setup {
        sections = {
          untracked = {
            folded = true,
          },
          recent = {
            folded = false,
          },
        },
        graph_style = "unicode",
        integrations = {
          telescope = true,
          diffview = true,
        },
        highlight = {
          line_red = "#e06c75",
        },
        mappings = {
          popup = {
            -- align with magit
            -- https://github.com/magit/magit/blob/main/lisp/magit-mode.el#L349
            ["p"] = "PushPopup",
            ["F"] = "PullPopup",
            ["%"] = "WorktreePopup",
            ["*"] = "WorktreePopup",
          },
        },
      }
    end,
  },

  {
    "ray-x/go.nvim",
    ft = { "go", "gomod" },
    event = "CmdlineEnter",
    config = function()
      require("go").setup()

      local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          require("go.format").gofmt()
        end,
        group = format_sync_grp,
      })
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup {}
    end,
    cmd = {
      "Lspsaga",
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  {
    "stevearc/quicker.nvim",
    event = "FileType qf",
    ---@module "quicker"
    ---@type quicker.SetupOptions
    opts = {},
    config = function()
      require("quicker").setup {}
    end,
  },

  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    config = function()
      -- Setup orgmode
      require("orgmode").setup {
      }

      -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
      -- add ~org~ to ignore_install
      -- require('nvim-treesitter.configs').setup({
      --   ensure_installed = 'all',
      --   ignore_install = { 'org' },
      -- })
    end,
  },
  -- ["windwp/nvim-ts-autotag"] = {
  --   ft = { "vue", "html", "typescript", "javascript", "tsx", "jsx" },
  --   config = function ()
  --     require("nvim-ts-autotag").setup()
  --   end,
  -- },
}

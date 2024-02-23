local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
return {
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup {
        mapping = { "jj" }, -- map jj to ESC
        timeout = 300,
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
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
    config = function ()
      require("nvim-lastplace").setup()
    end
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
    lazy = false,
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    init = function()
      require("core.utils").lazy_load "todo-comments.nvim"
    end,
    opts = function()
      return require "custom.configs.todocomments"
    end,
    config = function(_, opts)
      require("todo-comments").setup(opts)
    end
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
    config = function ()
      require("neogit").setup {
        graph_style = "unicode"
      }
    end
  },

  -- ["ray-x/go.nvim"] = {
  --   disable = true,
  --   ft = "go",
  --   opt = true,
  --   config = function ()
  --     require('go').setup()
  --   end,
  -- },
  -- ["windwp/nvim-ts-autotag"] = {
  --   ft = { "vue", "html", "typescript", "javascript", "tsx", "jsx" },
  --   config = function ()
  --     require("nvim-ts-autotag").setup()
  --   end,
  -- },
}

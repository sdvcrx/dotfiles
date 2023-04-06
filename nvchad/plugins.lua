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
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
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
  }
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

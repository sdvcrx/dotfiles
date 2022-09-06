local configs = require "custom.plugins.configs"

local M = {}

M.ui = {
  theme = "onedark",
  hl_override = {
    CursorLine = {
      bg = "one_bg",
    },
  },
}

M.plugins = {
  user = {
    ["max397574/better-escape.nvim"] = {
      event = "InsertCharPre",
      config = function()
        require("better_escape").setup {
          mapping = { "jj" }, -- map jj to ESC
          timeout = 300,
        }
      end,
    },
    ["neovim/nvim-lspconfig"] = {
      config = function()
        require "plugins.configs.lspconfig"
        require "custom.lspconfig"
      end,
    },
    ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
        require "custom.plugins.null-ls"
      end,
    },
    ["folke/which-key.nvim"] = {
      disable = false,
    },
    ["ray-x/go.nvim"] = {
      disable = true,
      ft = "go",
      opt = true,
      config = function ()
        require('go').setup()
      end,
    },
    ["nvim-telescope/telescope.nvim"] = {
      requires = {
        "nvim-telescope/telescope-project.nvim",
      },
    },
    ["ethanholz/nvim-lastplace"] = {
      config = function ()
        require("nvim-lastplace").setup()
      end
    },
  },
  override = {
    ["nvim-telescope/telescope.nvim"] = configs.telescope,
    ["williamboman/mason.nvim"] = configs.mason,
    ["nvim-treesitter/nvim-treesitter"] = configs.treesitter,
  },
  remove = {
    "lukas-reineke/indent-blankline.nvim",
  },
}

-- https://nvchad.github.io/config/Mappings
M.mappings = require "custom.mappings"

return M

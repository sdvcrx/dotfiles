local overrides = require "custom.plugins.overrides"

return {
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
  -- ["jose-elias-alvarez/null-ls.nvim"] = {
  --   after = "nvim-lspconfig",
  --   config = function()
  --     require "custom.plugins.null-ls"
  --   end,
  -- },
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
  ["windwp/nvim-ts-autotag"] = {
    ft = { "vue", "html", "typescript", "javascript", "tsx", "jsx" },
    config = function ()
      require("nvim-ts-autotag").setup()
    end,
  },
  ["ethanholz/nvim-lastplace"] = {
    config = function ()
      require("nvim-lastplace").setup()
    end
  },
  ["nvim-telescope/telescope.nvim"] = {
    requires = {
      { "nvim-telescope/telescope-project.nvim" },
    },
    override_options = overrides.telescope,
  },
  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },
  ["hrsh7th/nvim-cmp"] = {
    override_options = overrides.cmp,
  },
  ["lukas-reineke/indent-blankline.nvim"] = false,
}

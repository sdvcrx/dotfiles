local M = {}

M.ui = {
  theme = "onedark",
  hl_override = {
    CursorLine = {
      bg = "one_bg",
    },
  },
}

M.plugins = require "custom.plugins"

-- https://nvchad.github.io/config/Mappings
M.mappings = require "custom.mappings"

return M

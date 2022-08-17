-- example file i.e lua/custom/init.lua
-- load your options globals, autocmds here or anything .__.
-- you can even override default options here (core/options.lua)

-- editor options
require("custom/options")

-- neovide
if vim.g.neovide then
  require("custom/neovide")
end

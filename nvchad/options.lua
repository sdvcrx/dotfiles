local opt = vim.opt
local opt_local = vim.opt_local
local autocmd = vim.api.nvim_create_autocmd

opt.confirm = true
opt.scrolloff = 5

-- golang
autocmd("FileType", {
  pattern = "go",
  callback = function()
    -- indent with tab
    opt_local.expandtab = false
  end,
})


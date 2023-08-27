local opt = vim.opt
local opt_local = vim.opt_local
local autocmd = vim.api.nvim_create_autocmd

opt.confirm = true
opt.scrolloff = 5

-- limit completion items
opt.pumheight = 10

-- golang
autocmd("FileType", {
  pattern = "go",
  callback = function()
    -- indent with tab
    opt_local.expandtab = false
  end,
})

vim.api.nvim_command('autocmd BufEnter,FocusGained * checktime')

local M = {}

M.user = {
  n = {
    [";"] = { ":", "Command" },

    ["<leader>bd"] = {
      function()
        require("core.utils").close_buffer()
      end,
      "close buffer",
    },
    ["<leader>bb"] = {
      "<cmd> Telescope buffers <CR>", "close buffer",
    },
    ["<leader><leader>"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },

    ["<leader>fs"] = {
      "<cmd> write <CR>", "save current buffer",
    },
    ["<leader>fS"] = {
      "<cmd> wall <CR>", "save all files",
    },

    ["<leader>op"] = {
      "<cmd> NvimTreeToggle <CR>", "toggle nvimtree",
    },

    ["<leader>sp"] = {
      "<cmd> Telescope live_grep <CR>", "Search keyword in project",
    },
  },
}

return M

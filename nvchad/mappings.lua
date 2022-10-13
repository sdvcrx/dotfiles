local M = {}

M.user = {
  i = {
    -- emacs style key mappings
    ["<C-a>"] = { "<ESC>^i", "beginning of line" },
    ["<C-b>"] = { "<Left>", "move left" },
    ["<C-f>"] = { "<Right>", "move right" },
  },
  n = {
    [";"] = { ":", "Command" },

    ["<leader>bd"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "close buffer",
    },
    ["<leader>b]"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },
    ["<leader>b["] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },


    ["<leader>bb"] = {
      "<cmd> Telescope buffers <CR>", "close buffer",
    },

    ["<leader><leader>"] = { "<cmd> Telescope find_files follow=true <CR>", "find all" },

    ["<leader>fs"] = { "<cmd> write <CR>", "save current buffer" },

    ["<leader>fS"] = { "<cmd> wall <CR>", "save all files" },

    ["<leader>op"] = {
      "<cmd> NvimTreeToggle <CR>", "toggle nvimtree",
    },

    ["<leader>/"] = {
      "<cmd> Telescope live_grep <CR>", "Search keyword in project",
    },
    ["<leader>sp"] = {
      "<cmd> Telescope live_grep <CR>", "Search keyword in project",
    },

    ["<leader>sS"] = {
      "<cmd> Telescope grep_string <CR>", "Search keyword under cursor",
    },

    ["<leader>pp"] = {
      "<cmd> Telescope project <CR>", "Switch projectes",
    },

    -- nvterm
    ["<leader>ot"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "new horizontal term",
    },

    -- lsp
    ["<leader>cr"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "lsp rename",
    },
    ["<leader>cd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "lsp references",
    },
    ["<leader>cD"] = {
      function()
        vim.lsp.buf.references()
      end,
      "lsp references",
    },
    ["<leader>ci"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "lsp implementation",
    },
  },
}

-- gcc to toggle comment
M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["gcc"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  },

  v = {
    ["gcc"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },
}

return M

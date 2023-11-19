-- n, v, i, t = mode names
---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<leader>b"] = { "<cmd> enew <CR>", "New buffer" },
  },
}

M.general = {
  i = {
    -- emacs style key mappings
    ["<C-a>"] = { "<ESC>^i", "beginning of line" },
    ["<C-b>"] = { "<Left>", "move left" },
    ["<C-f>"] = { "<Right>", "move right" },
    ["<C-v>"] = { '<ESC>"+pa', "paste" },
    ["<D-v>"] = { '<ESC>"+pa', "paste" },
  },
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    ["<leader>bd"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "close buffer",
    },
    ["<leader>b]"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },
    ["<leader>b["] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },


    ["<leader>bb"] = {
      "<cmd> Telescope buffers <CR>", "buffers list",
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
    ["<leader>sd"] = {
      "<cmd> Telescope live_grep search_dirs=. <CR>", "Search keyword in project",
    },

    ["<leader>sS"] = {
      "<cmd> Telescope grep_string <CR>", "Search keyword under cursor",
    },

    ["<leader>gb"] = {
      "<cmd> Telescope git_branches <CR>", "Git switch branch",
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
        require("nvchad.renamer").open()
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
    ["<leader>cs"] = {
      "<cmd> Telescope lsp_document_symbols <CR>",  "lsp symbols",
    },
    ["<leader>qq"] = {
      function ()
        local ch = vim.fn.input("Confirm quit? [y/n] ")
        if ch == "y" then
          vim.cmd("qa")
        end
      end,
      "Exit with user confirm"
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

require "nvchad.mappings"

local nomap = vim.keymap.del
local map = vim.keymap.set

-- Disabled mappings
nomap("n", "<leader>b")
nomap("n", "<leader>h")
nomap("n", "<leader>v")


-- General mappings
map("i", "<C-a>", "<ESC>^i", { desc = "beginning of line" })
map("i", "<C-b>", "<Left>", { desc = "move left" })
map("i", "<C-f>", "<Right>", { desc = "move right" })
map("i", "<C-v>", '<ESC>"+pa', { desc = "paste" })
map("i", "<D-v>", '<ESC>"+pa', { desc = "paste" })

map("c", "<D-v>", "<C-r>+", { desc = "paste" })
map("n", "<D-v>", "<C-r>+", { desc = "paste" })

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

map("n", "<leader>bd", function()
    require("nvchad.tabufline").close_buffer()
end, { desc = "close buffer" })

map("n", "<leader>b]", function()
    require("nvchad.tabufline").tabuflineNext()
end, { desc = "goto next buffer" })

map("n", "<leader>b[", function()
    require("nvchad.tabufline").tabuflinePrev()
end, { desc = "goto prev buffer" })

map("n", "<leader>bb", "<cmd> Telescope buffers <CR>", { desc = "buffers list" })
map("n", "<leader>,", "<cmd> Telescope buffers <CR>", { desc = "buffers list" })

map("n", "<leader><leader>", "<cmd> Telescope find_files follow=true <CR>", { desc = "find all" })

map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fs", "<cmd> write <CR>", { desc = "save current buffer" })

map("n", "<leader>fS", "<cmd> wall <CR>", { desc = "save all files" })

map("n", "<leader>op", "<cmd> NvimTreeToggle <CR>", { desc = "toggle nvimtree" })

map("n", "<leader>'", "<cmd> Telescope resume <CR>", { desc = "Lists the results incl. multi-selections of the previous picker" })
map("n", "<leader>/", "<cmd> Telescope live_grep <CR>", { desc = "Search keyword in project" })
map("n", "<leader>sp", "<cmd> Telescope live_grep <CR>", { desc = "Search keyword in project" })
map("n", "<leader>sd", "<cmd> Telescope live_grep search_dirs=. <CR>", { desc = "Search keyword in project" })

map("n", "<leader>sS", "<cmd> Telescope grep_string <CR>", { desc = "Search keyword under cursor" })

map("n", "<leader>fp", function ()
  local builtin = require("telescope.builtin")
  builtin.find_files({
    cwd = "~/.config/nvim",
  })
end, { desc = "Search files in neovim config dir" })

map("n", "<leader>gb", "<cmd> Telescope git_branches <CR>", { desc = "Git switch branch" })
map("n", "<leader>gB", "<cmd> Gitsigns toggle_current_line_blame <CR>", { desc = "Git blame current line" })
map("n", "<leader>gg", "<cmd> Neogit <CR>", { desc = "Neogit" })
map("n", "<leader>gs", "<cmd> Gitsigns stage_hunk <CR>", { desc = "Git stage hunk" })
map("n", "<leader>gS", "<cmd> Gitsigns stage_buffer <CR>", { desc = "Git stage current buffer" })

map("n", "<leader>pp", "<cmd> Telescope project <CR>", { desc = "Switch projectes" })

-- terminal
map("n", "<leader>ot", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "new horizontal term" })

map("n", "<leader>ov", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "new horizontal term" })

-- LSP rename
map("n", "<leader>cr", require "nvchad.lsp.renamer", { desc = "lsp rename" })

map("n", "<leader>cd", vim.lsp.buf.definition, { desc = "lsp references" })

map("n", "<leader>cD", vim.lsp.buf.references, { desc = "lsp references" })

map("n", "<leader>ci", vim.lsp.buf.implementation, { desc = "lsp implementation" })

map("n", "<leader>ca", "<cmd> Lspsaga code_action <CR>", { desc = "lsp code action" })
map("n", "<leader>co", function ()
  vim.lsp.buf.code_action({
    apply = true,
    context = {
      diagnostics = {},
      only = { "source.organizeImports" },
    },
  })
end, { desc = "lsp source.organizeImports" })

map("n", "<leader>cf", function()
    require("conform").format({ lsp_format = "fallback", async = true })
end, { desc = "Format code" })

map("n", "<leader>cs", "<cmd> Telescope lsp_document_symbols <CR>", { desc = "lsp symbols" })

map("n", "<leader>qq", function()
    local ch = vim.fn.input("Confirm quit? [y/n] ")
    if ch == "y" then
        vim.cmd("qa")
    end
end, { desc = "Exit with user confirm" })


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

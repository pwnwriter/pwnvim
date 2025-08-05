local modules = require "modules"

local function map(mode, keys, action, desc)
  desc = desc or ""
  local opts = { noremap = true, silent = true, desc = desc }
  vim.keymap.set(mode, keys, action, opts)
end

local M = {}
-- Expose the map function
M.map = map

M.general = function()
  -- insert movement
  map("i", "<C-h>", "<Left>")
  map("i", "<C-j>", "<Down>")
  map("i", "<C-k>", "<Up>")
  map("i", "<C-l>", "<Right>")

  -- Copy and paste in the same cursor position
  map("n", "p", function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    vim.cmd('put')
    vim.api.nvim_win_set_cursor(0, { row + 1, col })
  end)

  map("i", "jj", "<esc>")
  map("i", "<C-c>", "<esc>")

  map("n", "<C-c>", "<cmd>noh<CR>")

  -- Save only on new changes
  map("n", "<C-s>", "<cmd>update<CR>")

  -- Switching splits
  map("n", "<C-h>", "<C-w>h")
  map("n", "<C-j>", "<C-w>j")
  map("n", "<C-k>", "<C-w>k")
  map("n", "<C-l>", "<C-w>l")


  map("n", "<Tab>", "<cmd>bnext<CR>")
  map("n", "<s-Tab>", "<cmd>bprev<CR>")

  -- Resize splits
  map("n", "<A-k>", ":resize +2<CR>")
  map("n", "<A-j>", ":resize -2<CR>")
  map("n", "<A-h>", ":vertical resize +2<CR>")
  map("n", "<A-l>", ":vertical resize -2<CR>")

  map("n", "<C-d>", "<C-d>zz")
  map("n", "<C-u>", "<C-u>zz")

  map("v", "??", 'y:h <C-R>"<cr>"') -- Show vim help
  map("v", "?/", 'y:/ <C-R>"<cr>"') -- Search across the buffer
end

M.mini = function()
  local minipick = require "mini.pick"
  local miniextra = require "mini.extra"
  local minivisits = require "mini.visits"
  local minidiff = require "mini.diff"

  local builtin = minipick.builtin


  map({ "n" }, "<leader>ff", function()
    builtin.files()
  end, "find files")

  map({ "n" }, "<leader>bs", function()
    builtin.buffers()
  end, "Find buffers")

  map({ "n" }, "<leader>fr", function()
    builtin.resume()
  end, "Resume finding")

  map({ "n" }, "<leader>fw", function()
    builtin.grep_live()
  end, "Grep live")

  map({ "n" }, "<leader>e", function()
    local _ = require("mini.files").close() or require("mini.files").open()
  end, "Toggle minifiles")

  map({ "n" }, "<leader>bq", function()
    require("mini.bufremove").delete()
  end, "Remove current buffer")

  map("n", "<A-s>", function()
    miniextra.pickers.visit_paths { filter = "todo" }
  end, "Add file to todolist")

  map("n", "<A-a>", function()
    minivisits.add_label "todo"
  end, "Remove file from todolist")

  map("n", "<A-A>", function()
    minivisits.remove_label()
  end, "Remove label from file")

  map("n", "<leader>gc", function()
    miniextra.pickers.git_commits()
  end, "Show git commits")

  map("n", "<leader>gh", function()
    miniextra.pickers.git_hunks()
  end, "Show git hunks")

  map("n", "<leader>dp", function()
    miniextra.pickers.diagnostic()
  end, "Diagnostic in picker")

  map("n", "<leader>td", function()
    minidiff.toggle_overlay(0)
  end, "Toggle git diff")
end

M.misc = function()
  map("n", "<leader>tn", function()
    modules.toggle_numbering()
  end, "Toggle line numbering")

  map("n", "<leader>tf", function()
    modules.toggle_flow()
  end, "Toggle flow")
end

-- map the following keys on lsp attach only
M.lsp = function()
  --- Set minipick as default picker
  local minipick = require "mini.pick"
  vim.ui.select = minipick.ui_select

  -- Diagnostics mappings
  map("n", "dp", function()
    vim.diagnostic.jump( { count = 1, float = true})
  end, "Diagnostics goto_prev")

  map("n", "dn", function()
    vim.diagnostic.jump( { count = -1, float = true})
  end, "Diagnostics goto_next")

  map("n", "<leader>ds", vim.diagnostic.setloclist, "Add buffer diagnostics to the location list.")

  map("n", "<leader>hi", function()
    modules.toggle_inlay_hint() -- toggle inlay hint
  end, "Toggle inlay hint")

  vim.api.nvim_create_autocmd("LspAttach", {
    --group = lspgroup,
    callback = function(event)
      vim.keymap.set("n", "<leader>k", function() vim.lsp.buf.hover({ border = "rounded" }) end, { buffer = event.buf })
    end
  })

  map("n", "<leader>df", function()
    vim.diagnostic.open_float({ border = vim.g.border_style })
  end, "Open diagnostics float ")
  map("n", "<leader>ld", vim.lsp.buf.definition, "Goto lsp definition")
  map("n", "<leader>lh", vim.lsp.buf.declaration, "Goto lsp declaration")
  map("n", "<leader>lt", vim.lsp.buf.type_definition, "Goto lsp definition")
  map("n", "<leader>li", vim.lsp.buf.implementation, "Goto lsp implementation")
  map("n", "<leader>lr", vim.lsp.buf.references, "Goto lsp reference")
  map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, "Open lsp code action")
  map("n", "<leader>lf", function()
    vim.lsp.buf.format { async = true }
  end, "Lsp format")
  map("n", "<leader>lc", vim.lsp.buf.rename, "Lsp rename")
end

return M

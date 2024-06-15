local utils = require "core.utils"

local function map(mode, keys, action, desc)
  desc = desc or ""
  local opts = { noremap = true, silent = true, desc = desc }
  vim.keymap.set(mode, keys, action, opts)
end

local M = {}

M.general = function()
  map("i", "<C-h>", "<Left>")
  map("i", "<C-j>", "<Down>")
  map("i", "<C-k>", "<Up>")
  map("i", "<C-l>", "<Right>")
  map("i", "jj", "<esc>")
  map("n", "<C-c>", "<cmd>noh<CR>")
  map("n", "<C-h>", "<C-w>h")
  map("n", "<C-j>", "<C-w>j")
  map("n", "<C-k>", "<C-w>k")
  map("n", "<C-l>", "<C-w>l")
  map("n", "<C-s>", "<cmd>update<CR>")
  map("n", "<Tab>", "<cmd>bnext<CR>")
  map("n", "<s-Tab>", "<cmd>bprev<CR>")

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
  local builtin = minipick.builtin

  map({ "n" }, "<leader>ff", function()
    builtin.files()
  end, "find files")

  map({ "n" }, "<leader>b", function()
    builtin.buffers()
  end, "Find buffers")

  map({ "n" }, "<leader>fr", function()
    builtin.resume()
  end, "Resume finding")

  map({ "n" }, "<leader>fw", function()
    builtin.grep_live()
  end, "Grep live")

  vim.b[0].miniindentscope_disable = true

  map({ "n" }, "<leader>ti", function()
    vim.b[0].miniindentscope_disable = not vim.b[0].miniindentscope_disable -- Toggle blankline animations
  end, "Toggle blankline animations")

  map({ "n" }, "<leader>e", function()
    local _ = require("mini.files").close() or require("mini.files").open()
  end, "Toggle minifiles")

  map({ "n" }, "<C-q>", function()
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
    miniextra.pickers.git_commits()
  end, "Show git hunks")

end

M.misc = function()
  local git_command = "git add . || git init && git add . && git commit || exit 0"

  map("n", "<A-r>", function()
    utils.run_vert_command()
  end, "Run command")

  map("n", "<A-g>", function()
    utils.run_vert_command(git_command)
  end, "git commit")

  map("n", "<leader>n", function()
    utils.toggle_numbering()
  end, "Toggle line numbering")

  map("n", "<leader>tf", function()
    utils.toggle_flow()
  end, "Toggle flow")
end

M.lsp = function()
  -- map the following keys on lsp attach only
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

      -- Diagnostics mappings
      map("n", "[d", function()
        vim.diagnostic.goto_prev { float = false }
      end, "Diagnostics goto_prev")

      map("n", "]d", function()
        vim.diagnostic.goto_next { float = false }
      end, "Diagnostics goto_next")
      map("n", "<leader>sd", vim.diagnostic.setloclist)

      map("n", "<leader>hi", function()
        utils.toggle_inlay_hint() -- toggle inlay hint
      end, "Toggle inlay hint")

      map("n", "<leader>k", vim.lsp.buf.hover, "Open lsp hover")
      map("n", "<leader>d", function()
        vim.diagnostic.open_float()
      end, "Open diagnostics")
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
      map({ "i", "s" }, "<c-space>", vim.lsp.buf.signature_help, "Lsp signature help")
    end,
  })
end

return M

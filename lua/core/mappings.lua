local opts = { noremap = true, silent = true }
local utils = require "core.utils"

local map = vim.keymap.set

local M = {}

M.general = function()
  map("i", "<C-h>", "<Left>", opts)
  map("i", "<C-j>", "<Down>", opts)
  map("i", "<C-k>", "<Up>", opts)
  map("i", "<C-l>", "<Right>", opts)
  map("i", "jj", "<esc>", opts)
  map("n", "<C-c>", "<cmd>noh<CR>", opts)
  map("n", "<C-h>", "<C-w>h", opts)
  map("n", "<C-j>", "<C-w>j", opts)
  map("n", "<C-k>", "<C-w>k", opts)
  map("n", "<C-l>", "<C-w>l", opts)
  map("n", "<leader>n", function()
    utils.toggle_numbering() -- toggle line numbers
  end, opts)
  map("n", "<leader>tf", function()
    utils.toggle_flow()
  end, opts)
  map("n", "<C-s>", "<cmd>w<CR>", opts)
  map("n", "<Tab>", "<cmd>bnext<CR>", opts)
  map("n", "<s-Tab>", "<cmd>bprev<CR>", opts)
  map("n", "<C-d>", "<C-d>zz", opts)
  map("n", "<C-u>", "<C-u>zz", opts)
  map("v", "//", 'y/<C-R>"<cr>', opts)
end

M.terminal = function()
  map({ "n", "t" }, "<A-t>", function()
    require("nvterm.terminal").toggle "float"
  end, opts)

  map({ "n", "t" }, "<A-h>", function()
    require("nvterm.terminal").toggle "horizontal"
  end, opts)

  map({ "n", "t" }, "<A-H>", function()
    require("nvterm.terminal").toggle "vertical"
  end, opts)

  map({ "n", "t" }, "<A-R>", function()
    utils.run_command()
  end, opts)
end

M.mini = function()
  local minipick = require "mini.pick"
  local miniextra = require "mini.extra"
  local minivisits = require "mini.visits"
  local builtin = minipick.builtin
  map({ "n" }, "<leader>ff", function()
    builtin.files()
  end, opts)

  map({ "n" }, "<leader>b", function()
    builtin.buffers()
  end, opts)

  map({ "n" }, "<leader>fr", function()
    builtin.resume()
  end, opts)

  map({ "n" }, "<leader>fw", function()
    builtin.grep_live()
  end, opts)

  vim.b[0].miniindentscope_disable = true

  map({ "n" }, "<leader>ti", function()
    vim.b[0].miniindentscope_disable = not vim.b[0].miniindentscope_disable -- Toggle blankline animations
  end, opts)

  map({ "n" }, "<leader>e", function()
    local _ = require("mini.files").close() or require("mini.files").open()
  end, opts)

  map({ "n" }, "<C-q>", function()
    require("mini.bufremove").delete()
  end, opts)

  map("n", "<A-s>", function()
    miniextra.pickers.visit_paths { filter = "todo" }
  end, opts)

  map("n", "<A-a>", function()
    minivisits.add_label "todo"
  end, opts)

  map("n", "<A-A>", function()
    minivisits.remove_label()
  end, opts)
end

M.lsp = function()
  -- map the following keys on lsp attach only
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

      -- Diagnostics mappings
      map("n", "<leader>d", function()
        vim.diagnostic.goto_prev { float = true }
      end)

      map("n", "[d", function()
        vim.diagnostic.goto_prev { float = false }
      end)
      map("n", "]d", function()
        vim.diagnostic.goto_next { float = false }
      end)
      map("n", "<leader>sd", vim.diagnostic.setloclist)

      map("n", "<leader>hi", function()
        utils.toggle_inlay_hint() -- toggle inlay hint
      end, opts)
      map("n", "<leader>k", vim.lsp.buf.hover, opts)
      map("n", "<leader>ld", vim.lsp.buf.definition, opts)
      map("n", "<leader>lh", vim.lsp.buf.declaration, opts)
      map("n", "<leader>lt", vim.lsp.buf.type_definition, opts)
      map("n", "<leader>li", vim.lsp.buf.implementation, opts)
      map("n", "<leader>lr", vim.lsp.buf.references, opts)
      map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)
      map("n", "<leader>lf", function()
        vim.lsp.buf.format { async = true }
      end, opts)
      map("n", "<leader>lc", vim.lsp.buf.rename, opts)
      map({ "i", "s" }, "<c-space>", vim.lsp.buf.signature_help, opts)
    end,
  })
end

M.dropbar = function()
  map("n", "<leader>p", function()
    require("dropbar.api").pick(vim.v.count ~= 0 and vim.v.count)
  end, opts)

  map("n", "<leader>td", function()
    require("core.utils").toggle_dropbar()
  end, opts)
end

M.gitsigns = function()
  map("n", "<leader>gp", function()
    require("gitsigns").preview_hunk()
  end, opts)

  map("n", "<leader>gr", function()
    require("gitsigns").reset_hunk()
  end, opts)

  map("n", "<leader>gb", function()
    package.loaded.gitsigns.blame_line()
  end, opts)

  map("n", "<leader>gt", function()
    package.loaded.gitsigns.diffthis()
  end, opts)

  map("n", "<leader>gd", function()
    require("gitsigns").toggle_deleted()
  end, opts)
end

return M

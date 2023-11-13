local opts = { noremap = true, silent = true }
local utils = require "core.utils"
local M = {}

local map = function(mode, lhs, rhs, options)
  vim.keymap.set(mode, lhs, rhs, options)
end

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
  local MiniPick = require "mini.pick"
  local builtin = MiniPick.builtin
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
end

M.lsp = function()
  -- map the following keys on lsp attach only
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

      map("n", "<space>d", vim.diagnostic.open_float, opts)
      map("n", "[d", vim.diagnostic.goto_prev, opts)
      map("n", "]d", vim.diagnostic.goto_next, opts)
      map("n", "<space>sd", vim.diagnostic.setloclist, opts)
      map("n", "<leader>hi", function()
        utils.toggle_inlay_hint() -- toggle inlay hint
      end, opts)

      map("n", "<leader>ih", vim.lsp.buf.hover, opts)
      map("n", "<leader>id", vim.lsp.buf.definition, opts)
      map("n", "<leader>it", vim.lsp.buf.type_definition, opts)
      map("n", "<leader>ii", vim.lsp.buf.implementation, opts)
      map("n", "<leader>ir", vim.lsp.buf.references, opts)
      map({ "n", "v" }, "<leader>ia", vim.lsp.buf.code_action, opts)
      map("n", "<leader>if", vim.lsp.buf.format, opts)
      map("n", "<leader>ic", vim.lsp.buf.rename, opts)
      map({ "i", "s" }, "<c-space>", vim.lsp.buf.signature_help, opts)
    end,
  })
end

return M

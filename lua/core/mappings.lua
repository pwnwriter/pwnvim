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
  map("n", "<C-s>", "<cmd>w<CR>")
  map("n", "<Tab>", "<cmd>bnext<CR>")
  map("n", "<s-Tab>", "<cmd>bprev<CR>")
  map("n", "<C-d>", "<C-d>zz")
  map("n", "<C-u>", "<C-u>zz")
  map("v", "//", 'y/<C-R>"<cr>') -- search text
  map("v", "??", 'y:h <C-R>"<cr>"') -- Show vim help
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
end

M.misc = function()
  map("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")

  map("n", "<A-r>", function()
    utils.run_vert_command()
  end, "Run command")

  map("n", "<leader>n", function()
    utils.toggle_numbering()
  end, "Toggle line numbering")

  map("n", "<leader>tf", function()
    utils.toggle_flow()
  end, "Toggle flow")

  map("n", "<leader>p", function()
    require("dropbar.api").pick(vim.v.count ~= 0 and vim.v.count)
  end, "Open dropbar menu")

  map("n", "<leader>td", function()
    require("core.utils").toggle_dropbar()
  end, "Toggle dropbar")
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

M.gitsigns = function()
  map("n", "<leader>gp", function()
    require("gitsigns").preview_hunk()
  end, "Git preview hunk")

  map("n", "<leader>gr", function()
    require("gitsigns").reset_hunk()
  end, "Git reset hunk")

  map("n", "<leader>gb", function()
    package.loaded.gitsigns.blame_line()
  end, "Git blame line")

  map("n", "<leader>gt", function()
    package.loaded.gitsigns.diffthis()
  end, "git diff this")

  map("n", "<leader>gd", function()
    require("gitsigns").toggle_deleted()
  end, "Git toggle deleted")
end

return M

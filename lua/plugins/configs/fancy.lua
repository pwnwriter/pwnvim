local icons = require "core.icons"

local M = {}

M.noice = {
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = false,
    command_palette = false,
    long_message_to_split = false,
    inc_rename = false,
    lsp_doc_border = true,
  },
}

M.notify = {
  fps = 60,
  render = "compact",
  timeout = 5,
  fade_in_slide_out = "fade",
}

M.treesitter = {
  ensure_installed = { "lua", "vimdoc", "rust", "ocaml" },
  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

M.drop = {
  bar = {
    sources = function(buf, _)
      local sources = require "dropbar.sources"
      local utils = require "dropbar.utils"

      local filename = {
        get_symbols = function(buff, win, cursor)
          local path = sources.path.get_symbols(buff, win, cursor)
          return { path[#path] }
        end,
      }

      if vim.bo[buf].ft == "markdown" then
        return {
          filename,
          utils.source.fallback {
            sources.treesitter,
            sources.markdown,
            sources.lsp,
          },
        }
      else
        return {
          filename,
          utils.source.fallback {
            sources.lsp,
            sources.treesitter,
          },
        }
      end
    end,
  },
  menu = {
    quick_navigation = false,
    keymaps = {
      ["<C-c>"] = "<C-w>q",
      ["<ESC>"] = "<C-w>q",
      ["h"] = "<C-w>c",
      ["l"] = function()
        local menu = require("dropbar.api").get_current_dropbar_menu()
        if not menu then
          return
        end
        local cursor = vim.api.nvim_win_get_cursor(menu.win)
        local component = menu.entries[cursor[1]]:first_clickable(cursor[2])
        if component then
          menu:click_on(component, nil, 1, "l")
        end
      end,
    },
  },
}

M.gitsigns = {
  signs = {
    add = { text = "" .. icons.gitsigns.add },
    change = { text = "" .. icons.gitsigns.change },
    delete = { text = "" .. icons.gitsigns.delete },
    topdelete = { text = "" .. icons.gitsigns.topdelete },
    changedelete = { text = "" .. icons.gitsigns.changedelete },
    untracked = { text = "" .. icons.gitsigns.untracked },
  },
  on_attach = function()
    require("core.mappings").gitsigns()
  end,
}

vim.diagnostic.config {
  virtual_text = {
    prefix = "",
    suffix = "",
    format = function(diagnostic)
      return "" .. icons.diagnostics.message .. diagnostic.message .. " "
    end,
  },
  underline = {
    severity = { min = vim.diagnostic.severity.WARN },
  },
  signs = {
    text = {
      [vim.diagnostic.severity.HINT] = icons.diagnostics.hint,
      [vim.diagnostic.severity.ERROR] = icons.diagnostics.error,
      [vim.diagnostic.severity.INFO] = icons.diagnostics.info,
      [vim.diagnostic.severity.WARN] = icons.diagnostics.warn,
    },
  },
}

return M

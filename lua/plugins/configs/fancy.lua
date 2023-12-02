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
    command_palette = true,
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

M.mason = {
  ui = {
    icons = {
      package_installed = icons.layout.installed,
      package_pending = icons.layout.pending,
      package_uninstalled = icons.layout.uninstalled,
    },
    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
  },
  max_concurrent_installers = 10,
}

M.treesitter = {
  ensure_installed = { "lua", "rust", "ocaml" },

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

return M

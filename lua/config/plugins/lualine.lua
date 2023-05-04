local icons = require("config.icons")

local spec = {
  "nvim-lualine/lualine.nvim",
  event = { "VeryLazy" },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}

function spec:config()
  local lualine = require("lualine")

  lualine.setup({
    options = {
      globalstatus = true,
      section_separators = "",
      component_separators = "",
      theme = {
        normal = {
          a = "ColorColumn",
          b = "StatusLine",
          c = "StatusLine",
        },
      },
    },
    sections = {
      lualine_a = {
        function()
          if vim.v.servername == nil then return "" end
          return icons.widget.remote
        end,
      },
      lualine_b = {
        {
          "branch",
          icon = icons.widget.branch,
        },
        {
          "diagnostics",
          cond = function()
            return vim.lsp.buf.server_ready()
              or not vim.tbl_isempty(vim.diagnostic.get(0))
          end,
          colored = false,
          always_visible = true,
          sections = { "error", "warn" },
          symbols = {
            warn = icons.widget.warning .. " ",
            error = icons.widget.error .. " ",
          },
        },
      },
      lualine_c = {},
      lualine_x = {},
      lualine_y = {
        function()
          if not vim.tbl_isempty(vim.lsp.util.get_progress_messages()) then
            return icons.widget.progress
          end
          if vim.lsp.buf.server_ready() then return icons.widget.ready end

          return ""
        end,
        function() return "Ln %l, Col %c" end,
        function()
          if vim.bo.expandtab then return "Spaces: " .. vim.bo.shiftwidth end
          return "Tabs"
        end,
        function() return vim.go.encoding:upper() end,
        {
          "fileformat",
          symbols = {
            dos = "CRLF",
            mac = "CR",
            unix = "LF",
          },
        },
        {
          "filetype",
          colored = false,
        },
      },
      lualine_z = {},
    },
  })

  vim.api.nvim_create_autocmd({ "User" }, {
    group = vim.api.nvim_create_augroup("config.plugins.lualine.refresher", {}),
    pattern = "LspProgressUpdate",
    callback = function()
      lualine.refresh({
        trigger = "autocmd",
        place = { "statusline" },
      })
    end,
  })
end

return spec

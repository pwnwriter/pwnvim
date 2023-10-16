local spec = {
  "folke/noice.nvim",
  event = "UiEnter",
  name = "noice",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}

function spec:config()
  local noice = require "noice"
  local notify = require "notify"

  noice.setup {
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

  notify.setup {
    fps = 60,
    render = "compact",
    timeout = 5,
    fade_in_slide_out = "fade",
  }
end
return spec
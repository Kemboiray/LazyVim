return {
  "folke/noice.nvim",
  opts = {
    popupmenu = { backend = "cmp", enabled = true },
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      hover = { silent = true },
      -- signature = { auto_open = { trigger = false } },
    },
    -- routes = {
    --   {
    --     filter = {
    --       event = "msg_show",
    --       any = {
    --         { find = "%d+L, %d+B" },
    --         { find = "; after #%d+" },
    --         { find = "; before #%d+" },
    --       },
    --     },
    --     view = "mini",
    --   },
    -- },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
      lsp_doc_border = true,
    },
  },
}

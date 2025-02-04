return {
  "echasnovski/mini.files",
  keys = {
    {
      "-",
      function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = "Open mini.files (Directory of Current File)",
    },
    {
      "<leader>e",
      function()
        require("mini.files").open(vim.uv.cwd(), true)
      end,
      desc = "Open mini.files (cwd)",
    },
  },
  opts = {
    options = {
      -- Whether to delete permanently or move into module-specific trash
      -- permanent_delete = false,
      -- Whether to use for editing directories
      use_as_default_explorer = false,
    },
    -- mappings = {
    --   go_in = "L",
    --   go_in_plus = "l",
    -- },
    windows = {
      preview = true,
      width_focus = 30,
      width_preview = 90,
      width_nofocus = 20,
    },
  },
}

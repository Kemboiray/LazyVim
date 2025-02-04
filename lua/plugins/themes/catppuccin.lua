local custom_highlights = {
  FloatBorder = { link = "WinSeparator" },
  -- FloatBorder = { fg = "#002633", bg = "NONE" },
  -- TelescopeTitle = { link = "@text" },
  -- CursorLine = { bg = "#363646" },
}

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    background = { -- :h background
      light = "latte",
      dark = "frappe",
    },
    transparent_background = (vim.g.neovide and { false } or { true })[1], -- disables setting the background color.
    show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
    term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
      enabled = false, -- dims the background color of inactive window
      shade = "dark",
      percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    bold = true,
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
      --   comments = { "italic" }, -- Change the style of comments
      --   conditionals = { "italic" },
      --   loops = {},
      functions = { "bold" },
      keywords = { "italic" },
      --   strings = {},
      --   variables = {},
      --   numbers = {},
      --   booleans = { "bold", "italic" },
      --   properties = {},
      --   types = { "italic" },
      --   operators = {},
    },
    -- color_overrides = {},
    custom_highlights = custom_highlights,
    integrations = {
      cmp = true,
      gitsigns = true,
      neogit = false,
      neotree = false,
      nvimtree = false,
      treesitter = true,
      noice = true,
      notify = true,
      mini = {
        enabled = true,
        indentscope_color = "",
      },
      which_key = true,
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
  },
}

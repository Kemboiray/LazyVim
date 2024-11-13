local transparency = true
local overrides = {
  FloatBorder = { fg = "#002633", bg = "NONE" },
  TelescopeTitle = { link = "@text" },
  CursorLine = { bg = "#363646" },
}
if vim.g.neovide then
  overrides = { Normal = { bg = "NONE" } } -- "#0B151B"
  transparency = false
end
return {
  "ellisonleao/gruvbox.nvim",
  opts = {
    terminal_colors = true, -- add neovim terminal colors
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
      strings = true,
      emphasis = true,
      comments = true,
      operators = false,
      folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "soft", -- can be "hard", "soft" or empty string
    -- palette_overrides = {},
    overrides = overrides,
    dim_inactive = false,
    transparent_mode = transparency,
  },
}

local theme = "catppuccin"
if vim.g.neovide then
  theme = "tokyonight"
end

return -- Configure LazyVim to load gruvbox
{
  "LazyVim/LazyVim",
  opts = {
    colorscheme = theme,
  },
}

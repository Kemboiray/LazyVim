local theme = "kanagawa"
if vim.g.neovide then
  theme = "night-owl"
end

return -- Configure LazyVim to load gruvbox
{
  "LazyVim/LazyVim",
  opts = {
    colorscheme = theme,
  },
}

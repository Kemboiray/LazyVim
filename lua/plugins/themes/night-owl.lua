local enable_night = false
if vim.g.neovide then
  enable_night = true
end
return {
  "oxfist/night-owl.nvim",
  enabled = enable_night,
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- load the colorscheme here
    require("night-owl").setup({
      transparent_background = false,
    })
  end,
}

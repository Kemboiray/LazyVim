return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      disable_background = true,
      styles = {
        transparency = true,
      },
      highlight_groups = {
        LspInlayHint = { bg = "#00000000", blend = 100 },
        -- VertSplit = { fg = "muted", bg = "muted" },
      },
    })
  end,
}

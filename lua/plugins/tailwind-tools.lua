-- tailwind-tools.lua
return {
  "luckasRanarison/tailwind-tools.nvim",
  -- enabled = false,
  name = "tailwind-tools",
  event = "VeryLazy",
  build = ":UpdateRemotePlugins",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim", -- optional
    "neovim/nvim-lspconfig", -- optional
  },
  opts = {
    server = { override = false },
    document_color = { enabled = false },
  }, -- your configuration
}

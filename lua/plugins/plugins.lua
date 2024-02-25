return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      "nvim-telescope/telescope.nvim", -- optional
    },
    config = true,
  },

  {
    "tpope/vim-fugitive",
  },

  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
        css = true,
      },
    },
  },
  {
    "laytan/tailwind-sorter.nvim",
    -- lazy = true,
    enabled = false,
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
    build = "cd formatter && npm i && npm run build",
    config = true,
    -- opts = {
    --   on_save_enabled = true,
    -- },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      require 'nvim-treesitter.install'.prefer_git = true
      require 'nvim-treesitter.install'.compilers = { "clang" }
      local configs = require("nvim-treesitter.configs")
      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "javascript", "typescript", "html" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
  },
  -- {
  --   "nvim-telescope/telescope-ui-select.nvim",
  -- },
}

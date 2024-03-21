return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      "nvim-telescope/telescope.nvim", -- optional
    },
    config = true,
    enabled = false,
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
    enabled = true,
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
    build = "cd formatter && npm i && npm run build",
    config = true,
    keys = { { "<leader>ct", "<cmd>TailwindSort<cr>", desc = "Sort tailwind classes" } },
    -- opts = {
    --   on_save_enabled = true,
    -- },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      { "nushell/tree-sitter-nu" },
    },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.install").prefer_git = false
      require("nvim-treesitter.install").compilers = { "clang" }
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = {
          "bash",
          "c",
          "lua",
          "vim",
          "vimdoc",
          "python",
          "javascript",
          "typescript",
          "html",
          "regex",
          "markdown",
          "markdown_inline",
          "jsonc",
          "http",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- {
  --   "rest-nvim/rest.nvim",
  --   disabled = true,
  --   dependencies = { { "nvim-lua/plenary.nvim" } },
  --   ft = "http",
  --   config = function()
  --     require("rest-nvim").setup({
  --       --- Get the same options from Packer setup
  --       -- Open request results in a horizontal split
  --       result_split_horizontal = false,
  --       -- Keep the http file buffer above|left when split horizontal|vertical
  --       result_split_in_place = false,
  --       -- stay in current windows (.http file) or change to results window (default)
  --       stay_in_current_window_after_split = false,
  --       -- Skip SSL verification, useful for unknown certificates
  --       skip_ssl_verification = false,
  --       -- Encode URL before making request
  --       encode_url = true,
  --       -- Highlight request on run
  --       highlight = {
  --         enabled = true,
  --         timeout = 150,
  --       },
  --       result = {
  --         -- toggle showing URL, HTTP info, headers at top the of result window
  --         show_url = true,
  --         -- show the generated curl command in case you want to launch
  --         -- the same request via the terminal (can be verbose)
  --         show_curl_command = false,
  --         show_http_info = true,
  --         show_headers = true,
  --         -- table of curl `--write-out` variables or false if disabled
  --         -- for more granular control see Statistics Spec
  --         show_statistics = false,
  --         -- executables or functions for formatting response body [optional]
  --         -- set them to false if you want to disable them
  --         formatters = {
  --           json = "jq",
  --           html = function(body)
  --             return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
  --           end,
  --         },
  --       },
  --       -- Jump to request line on run
  --       jump_to_request = false,
  --       env_file = ".env",
  --       -- for telescope select
  --       env_pattern = "\\.env$",
  --       env_edit_command = "tabedit",
  --       custom_dynamic_variables = {},
  --       yank_dry_run = true,
  --       search_back = true,
  --     })
  --   end,
  -- },
  -- {
  --   "nvim-telescope/telescope-ui-select.nvim",
  -- },
}

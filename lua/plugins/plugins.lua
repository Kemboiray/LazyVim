return {
  {
    "dgagn/diagflow.nvim",
    enabled = false,
    event = "LspAttach", -- This is what I use personnally and it works great
    opts = {
      enable = true,
      max_width = 60, -- The maximum width of the diagnostic messages
      max_height = 10, -- the maximum height per diagnostics
      severity_colors = { -- The highlight groups to use for each diagnostic severity level
        error = "DiagnosticFloatingError",
        warning = "DiagnosticFloatingWarn",
        info = "DiagnosticFloatingInfo",
        hint = "DiagnosticFloatingHint",
      },
      format = function(diagnostic)
        return diagnostic.message
      end,
      gap_size = 1,
      scope = "line", -- 'cursor', 'line' this changes the scope, so instead of showing errors under the cursor, it shows errors on the entire line.
      padding_top = 0,
      padding_right = 0,
      text_align = "right", -- 'left', 'right'
      placement = "top", -- 'top', 'inline'
      inline_padding_left = 0, -- the padding left when the placement is inline
      update_event = { "DiagnosticChanged", "BufReadPost" }, -- the event that updates the diagnostics cache
      toggle_event = {}, -- if InsertEnter, can toggle the diagnostics on inserts
      show_sign = false, -- set to true if you want to render the diagnostic sign before the diagnostic message
      render_event = { "DiagnosticChanged", "CursorMoved" },
      border_chars = {
        top_left = "┌",
        top_right = "┐",
        bottom_left = "└",
        bottom_right = "┘",
        horizontal = "─",
        vertical = "│",
      },
      show_borders = true,
    },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      -- size can be a number or function which is passed the current terminal
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<c-\>]],
      terminal_mappings = true,
      insert_mappings = true,
      start_in_insert = true,
      shade_terminals = true,
      direction = "horizontal",
      close_on_exit = true,
      shell = vim.o.shell,
      winbar = {
        enabled = true,
        name_formatter = function(term) --  term: Terminal
          return term.name
        end,
      },
    },
  },
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
}

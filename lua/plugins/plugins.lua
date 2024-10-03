return {
  -- { "glacambre/firenvim", build = ":call firenvim#install(0)" },
  {
    "mikesmithgh/kitty-scrollback.nvim",
    enabled = true,
    lazy = true,
    cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
    event = { "User KittyScrollbackLaunch" },
    -- version = '*', -- latest stable version, may have breaking changes if major version changed
    -- version = '^5.0.0', -- pin major version, include fixes and features that do not have breaking changes
    config = function()
      require("kitty-scrollback").setup()
    end,
  },
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "<leader>e",
        function()
          require("yazi").yazi()
        end,
        desc = "Open yazi (root)",
      },
      {
        -- Open in the current working directory
        "<leader>E",
        function()
          require("yazi").yazi(nil, vim.fn.getcwd())
        end,
        desc = "Open yazi (cwd)",
      },
    },
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = true,
      floating_window_scaling_factor = 0.95,
    },
  },
  {
    "mistricky/codesnap.nvim",
    enabled = false,
    build = "make",
    opts = {
      save_path = os.getenv("PWD"),
      mac_window_bar = true,
      title = "CodeSnap",
      code_font_family = "JetBrainsMono Nerd Font",
      watermark_font_family = "Pacifico",
      watermark = "CodeSnap",
      bg_theme = "default",
      breadcrumbs_separator = "/",
      has_breadcrumbs = false,
      has_line_number = false,
      min_width = 0,
    },
  },
  {
    "dgagn/diagflow.nvim",
    -- enabled = false,
    event = "LspAttach", -- This is what I use personnally and it works great
    opts = {
      enable = true,
      max_width = 50, -- The maximum width of the diagnostic messages
      max_height = 100, -- the maximum height per diagnostics
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
      -- toggle_event = {}, -- if InsertEnter, can toggle the diagnostics on inserts
      toggle_event = { "InsertEnter", "InsertLeave" },
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
      show_borders = false,
    },
  },
  {
    "akinsho/toggleterm.nvim",
    -- enabled = false,
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
      open_mapping = [[<a-`>]],
      terminal_mappings = true,
      insert_mappings = true,
      start_in_insert = true,
      shade_terminals = true,
      direction = "float",
      float_opts = { border = "curved", title_pos = "center" },
      highlights = {
        FloatBorder = { guifg = "#002633", guibg = "NONE" },
      },
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
    enabled = false,
    --   dependencies = {
    --     "nvim-lua/plenary.nvim", -- required
    --     "sindrets/diffview.nvim", -- optional - Diff integration
    --
    --     "nvim-telescope/telescope.nvim", -- optional
    --   },
    --   config = true,
    --   -- lazy = false,
    --   keys = { { "<leader>gn", ":Neogit<cr>", desc = "Neogit" } },
    --   -- enabled = false,
  },

  {
    "tpope/vim-fugitive",
    enabled = false,
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
}

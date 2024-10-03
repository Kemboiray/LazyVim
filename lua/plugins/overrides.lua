-- Overrides
-- local function get_lualine_theme(theme)
--   if theme == "catppuccin" then
--     return theme
--   end
local lualine_theme = require("lualine.themes.auto")
lualine_theme.normal.c.bg = nil
-- lualine_theme.inactive.c.bg = nil
-- lualine_theme.normal.b.gui = "bold"
lualine_theme.insert.c.bg = nil
lualine_theme.visual.c.bg = nil
lualine_theme.command.c.bg = nil
lualine_theme.replace.c.bg = nil
--   return lualine_theme
-- end
local function get_lualine_sep()
  if os.getenv("WARP_IS_LOCAL_SHELL_SESSION") then
    return {}
  end
  return { left = "", right = "" }
end
-- if vim.g.neovide then
--   lualine_theme = "gruvbox-material"
-- end

return {
  {
    "akinsho/bufferline.nvim",
    opts = { options = { mode = "buffers" } },
    keys = {
      -- { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      -- { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    },
  },
  {
    "mistweaverco/kulala.nvim",
    keys = {
      { "<leader>R", false },
      { "<leader>Rs", "<cmd>lua require('kulala').run()<cr>", desc = "Send the request" },
      { "<leader>Rt", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Toggle headers/body" },
      { "<leader>Rp", "<cmd>lua require('kulala').jump_prev()<cr>", desc = "Jump to previous request" },
      { "<leader>Rn", "<cmd>lua require('kulala').jump_next()<cr>", desc = "Jump to next request" },
    },
    opts = {
      split_direction = "vertical",
      default_view = "headers_body",
    },
  },
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  {
    "ibhagwan/fzf-lua",
    opts = {
      fzf_colors = {
        ["gutter"] = "-1",
      },
      winopts = { fullscreen = true },
      hls = { border = "FloatBorder", preview_border = "FloatBorder", preview_title = "@text" },
    },
  },
  { "echasnovski/mini.pairs", enabled = false },
  {
    "echasnovski/mini.files",
    opts = {
      options = {
        -- Whether to delete permanently or move into module-specific trash
        -- permanent_delete = false,
        -- Whether to use for editing directories
        use_as_default_explorer = false,
      },
      windows = {
        preview = true,
        width_focus = 30,
        width_preview = 90,
        width_nofocus = 20,
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
      fps = 30,
      icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = "",
      },
      level = 2,
      minimum_width = 50,
      render = "default",
      stages = "fade_in_slide_out",
      time_formats = {
        notification = "%T",
        notification_history = "%FT%T",
      },
      timeout = 5000,
      top_down = true,
    },
  },

  {
    "folke/noice.nvim",
    opts = {
      -- popupmenu = { backend = "cmp" },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
          ["vim.lsp.util.stylize_markdown"] = false,
          ["cmp.entry.get_documentation"] = false,
        },
        hover = { silent = true },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = true,
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      -- PERF: we don't need this lualine require madness 🤷
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      local icons = require("lazyvim.config").icons

      vim.o.laststatus = vim.g.lualine_laststatus

      return {
        options = {
          theme = lualine_theme,
          globalstatus = true,
          component_separators = {},
          -- section_separators = {},
          -- component_separators = { left = ")", right = "(" },
          section_separators = get_lualine_sep(),
          disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },

          lualine_c = {
            LazyVim.lualine.root_dir(),
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { LazyVim.lualine.pretty_path() },
          },
          lualine_x = {
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = LazyVim.ui.fg("Statement"),
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = LazyVim.ui.fg("Constant"),
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = LazyVim.ui.fg("Debug"),
          },
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = LazyVim.ui.fg("Special"),
            },
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
          },
          lualine_y = {
            { "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            function()
              return " " .. os.date("%R")
            end,
          },
        },
        extensions = { "toggleterm", "trouble", "lazy" },
      }
    end,
  },

  {
    "folke/which-key.nvim",
    opts = {
      win = { border = "rounded" },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ui = { border = "rounded" },
    },
  },
}

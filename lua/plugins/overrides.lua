-- Overrides
local lualine_theme = require("lualine.themes.auto")
lualine_theme.normal.c.bg = nil
lualine_theme.insert.c.bg = nil
lualine_theme.visual.c.bg = nil
lualine_theme.command.c.bg = nil
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
  -- { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  { "echasnovski/mini.pairs", enabled = false },
  {
    "echasnovski/mini.files",
    opts = {
      windows = {
        preview = true,
        width_focus = 30,
        width_preview = 30,
      },
      options = {
        -- Whether to use for editing directories
        -- Disabled by default in LazyVim because neo-tree is used for that
        use_as_default_explorer = false,
      },
    },
  },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   keys = {
  --     { "<leader>Ct", "<cmd>Copilot toggle<cr>", desc = "Toggle copilot" },
  --     { "<leader>Ce", "<cmd>Copilot enable<cr>", desc = "Enable copilot" },
  --     { "<leader>Cd", "<cmd>Copilot disable<cr>", desc = "Disable copilot" },
  --     { "<leader>Cs", "<cmd>Copilot status<cr>", desc = "Copilot status" },
  --   },
  -- },
  {
    "lewis6991/gitsigns.nvim",
    cmd = "Gitsigns",
    keys = {
      { "<leader>ght", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle current line blame" },
    },
  },
  -- {
  --   "telescope.nvim",
  --   dependencies = {
  --     "nvim-telescope/telescope-fzf-native.nvim",
  --     build = "make",
  --     config = function()
  --       require("telescope").load_extension("fzf")
  --     end,
  --   },
  -- },
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
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
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
        extensions = { "neo-tree", "lazy" },
      }
    end,
  },

  {
    "folke/which-key.nvim",
    opts = {
      window = {
        border = "none", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
        padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
        zindex = 1000, -- positive value to position WhichKey above other floating windows.
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ui = { border = "single" },
    },
  },
  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdLineEnter" },
    dependencies = {
      { "hrsh7th/cmp-emoji" },
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
      { "hrsh7th/cmp-cmdline" },

      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        -- opts = {
        --   fast_wrap = {},
        --   disable_filetype = { "TelescopePrompt", "vim" },
        -- },
        opts = {
          disable_filetype = { "TelescopePrompt", "spectre_panel", "vim" },
          disable_in_macro = true, -- disable when recording or executing a macro
          disable_in_visualblock = false, -- disable when insert after visual block mode
          disable_in_replace_mode = true,
          ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
          enable_moveright = true,
          enable_afterquote = true, -- add bracket pairs after quote
          enable_check_bracket_line = true, --- check bracket in same line
          enable_bracket_in_quote = true, --
          enable_abbr = false, -- trigger abbreviation
          break_undo = true, -- switch for basic rule break undo sequence
          check_ts = false,
          map_cr = true,
          map_bs = true, -- map the <BS> key
          map_c_h = false, -- Map the <C-h> key to delete a pair
          map_c_w = false, -- map <c-w> to delete a pair if possible
        },

        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require("nvim-autopairs.completion.cmp")
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")
      local cmp_window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }
      if vim.g.neovide then
        cmp_window = {
          completion = cmp.config.window.bordered({
            border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" },
          }),
          documentation = cmp.config.window.bordered({
            border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" },
          }),
        }
      end

      local format_kinds = opts.formatting.format

      -- `:` cmdline setup.
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          },
        }),
      })

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<Down>"] = cmp.mapping(function(fallback)
          cmp.close()
          fallback()
        end, { "i" }),
        ["<Up>"] = cmp.mapping(function(fallback)
          cmp.close()
          fallback()
        end, { "i" }),
      })
      opts.window = cmp_window
      opts.formatting.format = function(entry, vim_item)
        format_kinds(entry, vim_item)
        return require("tailwindcss-colorizer-cmp").formatter(entry, vim_item)
      end
    end,
  },
}

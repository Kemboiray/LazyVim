local lualine_theme = require("lualine.themes.auto")

lualine_theme.normal.a.fg = "#c6d0f6"
lualine_theme.normal.a.bg = nil
lualine_theme.normal.b.fg = "#ffaf87"
lualine_theme.normal.b.bg = nil
lualine_theme.normal.b.gui = "bold"
lualine_theme.normal.c.bg = nil

lualine_theme.insert.a.fg = lualine_theme.insert.a.bg
lualine_theme.insert.a.bg = nil
lualine_theme.insert.b.fg = "#ffaf87"
lualine_theme.insert.b.bg = nil
lualine_theme.insert.b.gui = "bold"
lualine_theme.insert.c.bg = nil

lualine_theme.visual.a.fg = lualine_theme.visual.a.bg
lualine_theme.visual.a.bg = nil
lualine_theme.visual.b.fg = "#ffaf87"
lualine_theme.visual.b.bg = nil
lualine_theme.visual.b.gui = "bold"
lualine_theme.visual.c.bg = nil

lualine_theme.command.a.fg = lualine_theme.command.a.bg
lualine_theme.command.a.bg = nil
lualine_theme.command.b.fg = "#ffaf87"
lualine_theme.command.b.bg = nil
lualine_theme.command.b.gui = "bold"
lualine_theme.command.c.bg = nil

lualine_theme.replace.a.fg = lualine_theme.replace.a.bg
lualine_theme.replace.a.bg = nil
lualine_theme.replace.b.fg = "#ffaf87"
lualine_theme.replace.b.bg = nil
lualine_theme.replace.b.gui = "bold"
lualine_theme.replace.c.bg = nil

local function get_lualine_sep()
  -- if os.getenv("WARP_IS_LOCAL_SHELL_SESSION") then
  return {}
  -- end
  -- return { left = "", right = "" }
end

return {
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
        component_separators = { left = "|", right = "|" },
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
          { LazyVim.lualine.pretty_path({ relative = "root", modified_sign = " ●" }) },
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
          { padding = { left = 1, right = 0 } },
        },
      },
      extensions = { "toggleterm", "trouble", "lazy" },
    }
  end,
}

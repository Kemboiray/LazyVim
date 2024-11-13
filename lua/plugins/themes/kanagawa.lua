return {
  "rebelot/kanagawa.nvim",
  config = function()
    require("kanagawa").setup({
      compile = false, -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = true, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = { -- add/modify theme and palette colors
        palette = {},
        theme = {
          wave = {},
          lotus = {},
          dragon = {},
          all = { ui = {
            bg_gutter = "none",
          } },
        },
      },
      overrides = function(colors) -- add/modify highlights
        return {
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none", fg = "#89a4bd" },
          FloatTitle = { bg = "none" },

          -- Save an hlgroup with dark background and dimmed foreground
          -- so that you can use it where your still want darker windows.
          -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
          NormalDark = { fg = colors.theme.ui.fg_dim, bg = "#111111" },

          -- Popular plugins that open floats will link to NormalFloat by default;
          -- set their background accordingly if you wish to keep them dark and borderless
          -- LazyNormal = { bg = colors.theme.ui.bg_m3, fg = colors.theme.ui.fg_dim },
          -- MasonNormal = { bg = colors.theme.ui.bg_m3, fg = colors.theme.ui.fg_dim },
          -- TelescopeTitle = { fg = colors.theme.ui.special, bold = true },
          -- TelescopePromptNormal = { bg = colors.theme.ui.bg_p1 },
          TelescopePromptBorder = { fg = colors.theme.ui.bg_p1, bg = "none" },
          -- TelescopeResultsNormal = { fg = colors.theme.ui.fg_dim, bg = colors.theme.ui.bg_m1 },
          TelescopeResultsBorder = { fg = colors.theme.ui.bg_m1, bg = "none" },
          -- TelescopePreviewNormal = { bg = colors.theme.ui.bg_dim },
          TelescopePreviewBorder = { bg = "none", fg = colors.theme.ui.bg_dim },
        }
      end,
      theme = "wave", -- Load "wave" theme when 'background' option is not set
      background = { -- map the value of 'background' option to a theme
        dark = "wave", -- try "dragon" !
        light = "lotus",
      },
    })
  end,
}

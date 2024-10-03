local servers = {
  lua_ls = {},
  ruff = {},
  basedpyright = {
    settings = {
      basedpyright = {
        disableOrganizeImports = true, -- Using Ruff
        typeCheckingMode = "off",
      },
    },
  },
  vtsls = {},
  emmet_language_server = {},
  -- taplo = {},
  bashls = {},
  tailwindcss = {
    settings = {
      tailwindCSS = {
        experimental = { classRegex = { { "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" } } },
        classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
        includeLanguages = {
          eelixir = "html-eex",
          eruby = "erb",
          htmlangular = "html",
          templ = "html",
        },
        lint = {
          cssConflict = "warning",
          invalidApply = "error",
          invalidConfigPath = "error",
          invalidScreen = "error",
          invalidTailwindDirective = "error",
          invalidVariant = "error",
          recommendedVariantOrder = "warning",
        },
        validate = true,
      },
    },
  },
  cssls = {},
  html = {},
  -- yamlls = {},
  -- jsonls = {},
  -- marksman = {},
  clangd = { cmd = { "clangd", "--offset-encoding=utf-16" } },
  lemminx = {},
}
return {
  {
    "neovim/nvim-lspconfig",
    -- config = function()
    -- end,
    --
    event = "VeryLazy",
    opts = function(_, opts)
      require("lspconfig.ui.windows").default_options.border = "rounded"
      opts.servers = servers
      opts.setup = {}
    end,
  },
}

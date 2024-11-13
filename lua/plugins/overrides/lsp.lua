-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "rounded"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
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
  hyprls = {},
  glsl_analyzer = {},
}
return {
  {
    "neovim/nvim-lspconfig",
    -- config = function()
    -- end,
    --
    event = "VeryLazy",
    opts = function(_, opts)
      -- require("lspconfig.ui.windows").default_options.border = "rounded"
      opts.servers = servers
      opts.setup = {}
    end,
  },
}

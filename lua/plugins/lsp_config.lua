return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {},
        ruff_lsp = {},
        basedpyright = {
          settings = {
            basedpyright = {
              disableOrganizeImports = true, -- Using Ruff
              typeCheckingMode = "off",
            },
          },
        },
        tsserver = {},
        emmet_language_server = {},
        taplo = {},
        bashls = {},
        tailwindcss = {},
        html = {},
        yamlls = {},
      },
      setup = {},
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "ruff",
        "ruff_lsp",
        "basedpyright",
        "tsserver",
        "yamlls",
        "bashls",
        "shellcheck",
        "shfmt",
        "yamlfmt",
        "yamllint",
        "markdownlint",
        "prettierd",
        "eslint_d",
      },
    },
  },
}

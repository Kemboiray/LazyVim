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
      },
      setup = {},
    },
  },
}

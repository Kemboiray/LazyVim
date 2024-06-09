return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
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
        tsserver = {},
        emmet_language_server = {},
        taplo = {},
        bashls = {},
        tailwindcss = {},
        html = {},
        yamlls = {},
        jsonls = {},
        marksman = {},
        clangd = { cmd = { "clangd", "--offset-encoding=utf-16" } },
      },
      setup = {},
    },
  },
}

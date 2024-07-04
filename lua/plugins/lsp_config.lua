require("lspconfig.ui.windows").default_options.border = "single"

return {
  {
    "neovim/nvim-lspconfig",
    -- config = function()
    -- end,
    opts = {
      ui = { windows = { default_options = { border = "single" } } },
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
        vtsls = {},
        emmet_language_server = {},
        -- taplo = {},
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

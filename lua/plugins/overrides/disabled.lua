local plugins = {
  "folke/persistence.nvim",
  "nvim-neo-tree/neo-tree.nvim",
  "echasnovski/mini.pairs",
}
local disabled_plugins = require("util").disable_plugins(plugins)
return disabled_plugins

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.del({ "n", "t" }, "<C-/>")
vim.keymap.del({ "n", "t" }, "<C-_>")
local wk = require("which-key")

wk.register({
  C = {
    name = "Copilot", -- name of the group
  },
}, { prefix = "<leader>", mode = "n" })

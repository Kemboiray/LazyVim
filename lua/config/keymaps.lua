-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap
map.set({ "n", "i" }, "<A-Tab>", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

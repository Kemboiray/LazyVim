-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap
local ls = require("luasnip")
map.set({ "n", "i" }, "<A-a>", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map.set({ "n", "i" }, "<A-,>", "<cmd>FzfLua buffers<cr>", { desc = "Switch Buffer" })
map.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

map.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })
map.set({ "n", "i" }, "<A-m>", "<cmd>Man<cr>", { desc = "Open man page" })

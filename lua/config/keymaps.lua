-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local wk = require("which-key")

wk.register({
  C = {
    name = "Copilot", -- name of the group
    t = { "<cmd>Copilot toggle<cr>", "Toggle Copilot" }, -- map with description
    d = { "<cmd>Copilot disable<cr>", "Copilot disable" },
    e = { "<cmd>Copilot enable<cr>", "Copilot enable" },
    s = { "<cmd>Copilot status<cr>", "Copilot status" },
  },
}, { prefix = "<leader>" })

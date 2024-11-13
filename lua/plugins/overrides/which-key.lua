return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
    opts.spec = {
      { "<leader>g", group = "Git", icon = { icon = "󰊢 ", color = "orange" } },
      { "<leader>R", group = "Rest", icon = { icon = "󰌷 ", color = "cyan" } },
      { "<leader>q", group = "Quit", icon = { icon = " ", color = "red" } },
    }
    opts.win = { border = "rounded" }
  end,
}

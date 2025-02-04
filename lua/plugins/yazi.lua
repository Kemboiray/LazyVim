return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    -- 👇 in this section, choose your own keymappings!
    {
      "<A-q>",
      function()
        require("yazi").yazi()
      end,
      desc = "Open yazi (root)",
    },
    {
      -- Open in the current working directory
      "<A-S-q>",
      function()
        require("yazi").yazi(nil, vim.fn.getcwd())
      end,
      desc = "Open yazi (cwd)",
    },
  },
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = true,
    floating_window_scaling_factor = 1,
    yazi_floating_window_border = "single",
  },
}

-- stylua: ignore
local config_center = {
  { action = "view .",                                           desc = " Yazi",            icon = " ", key = "e" },
  { action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
  { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
  { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
  { action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",       icon = " ", key = "g" },
  { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
  -- { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
  { action = "LazyExtras",                                     desc = " Lazy Extras",     icon = " ", key = "x" },
  { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
  { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
}

return {
  "nvimdev/dashboard-nvim",
  opts = function(_, opts)
    opts.config.week_header = { enable = true }
    opts.config.center = config_center
    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end
  end,
}

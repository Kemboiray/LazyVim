return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    -- size can be a number or function which is passed the current terminal
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = [[<a-`>]],
    terminal_mappings = true,
    insert_mappings = true,
    start_in_insert = true,
    shade_terminals = true,
    direction = "float",
    float_opts = { border = "curved", title_pos = "center" },
    highlights = {
      FloatBorder = { guifg = "#002633", guibg = "NONE" },
    },
    close_on_exit = true,
    shell = vim.o.shell,
    winbar = {
      enabled = true,
      name_formatter = function(term) --  term: Terminal
        return term.name
      end,
    },
  },
}

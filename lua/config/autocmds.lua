-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- autocommands
local api = vim.api

api.nvim_command("autocmd TermOpen * startinsert") -- starts in insert mode
api.nvim_command("autocmd TermOpen * setlocal nonumber norelativenumber") -- no numbers
api.nvim_command("autocmd TermEnter * setlocal signcolumn=no") -- no sign column
api.nvim_create_autocmd("VimLeave", {
  callback = function()
    vim.opt.guicursor =
      "n-v:ver25,i-c-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:ver25-blinkwait175-blinkoff150-blinkon175"
  end,
})
api.nvim_create_autocmd("User", {
  pattern = "MiniFilesWindowOpen",
  callback = function(args)
    local win_id = args.data.win_id

    -- Customize window-local settings
    -- vim.wo[win_id].winblend = 50
    local config = vim.api.nvim_win_get_config(win_id)
    config.border, config.title_pos = "rounded", "right"
    vim.api.nvim_win_set_config(win_id, config)
  end,
})
api.nvim_command("autocmd BufRead,BufNewFile .env* lua vim.diagnostic.disable()")

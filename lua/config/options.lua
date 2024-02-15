-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.colorcolumn = "80"
vim.opt.autochdir = true
vim.opt.wrap = true
vim.opt.pumblend = 0

vim.diagnostic.config({
  virtual_text = false,
  float = { border = "single" },
})
-- Show line diagnostics automatically in hover window
-- vim.o.updatetime = 250
-- vim.diagnostic.open_float()
-- vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]])

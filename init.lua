if vim.g.vscode then
  -- VSCode extension
else
  -- Neovide
  if vim.g.neovide then
    vim.o.linespace = 0
    vim.g.neovide_scale_factor = 1.0
    -- vim.g.neovide_transparency = 0.0
    vim.g.neovide_floating_shadow = true
    vim.g.neovide_floating_z_height = 10
    vim.g.neovide_light_angle_degrees = 45
    vim.g.neovide_light_radius = 5
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_cursor_animation_length = 0
    vim.g.neovide_scroll_animation_length = 0
    -- vim.g.neovide_fullscreen = true
    vim.g.neovide_theme = "dark"
    -- vim.api.nvim_set_keymap("n", "<F11>", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", { silent = true })
    vim.cmd("cd ~/Projects/")
    vim.g.neovide_floating_corner_radius = 10.0
  end
  -- ordinary Neovim
  -- bootstrap lazy.nvim, LazyVim and your plugins
  require("config.lazy")
  -- vim.cmd("silent Copilot disable")
  -- vim.g.node_host_prog = "/Users/Brian/scoop/apps/nodejs-lts/current/bin/neovim-node-host.cmd"
end

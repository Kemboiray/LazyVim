return {
  "ibhagwan/fzf-lua",
  opts = {
    fzf_opts = { ["--cycle"] = true },
    fzf_colors = {
      ["gutter"] = "-1",
    },
    winopts = { fullscreen = true, preview = { layout = "vertical" } },
    keymap = {
      -- Below are the default binds, setting any value in these tables will override
      -- the defaults, to inherit from the defaults change [1] from `false` to `true`
      builtin = {
        false, -- do not inherit from defaults
        -- neovim `:tmap` mappings for the fzf win
        ["<M-Esc>"] = "hide", -- hide fzf-lua, `:FzfLua resume` to continue
        ["<F1>"] = "toggle-help",
        ["<F2>"] = "toggle-fullscreen",
        -- Only valid with the 'builtin' previewer
        ["<F3>"] = "toggle-preview-wrap",
        ["<F4>"] = "toggle-preview",
        -- Rotate preview clockwise/counter-clockwise
        ["<F5>"] = "toggle-preview-ccw",
        ["<F6>"] = "toggle-preview-cw",
        ["<S-down>"] = "preview-down",
        ["<S-up>"] = "preview-up",
        -- ["<M-S-down>"] = "preview-down",
        -- ["<M-S-up>"] = "preview-up",
      },
      fzf = {
        false, -- do not inherit from defaults
        -- fzf '--bind=' options
        ["ctrl-z"] = "abort",
        ["ctrl-u"] = "unix-line-discard",
        ["ctrl-f"] = "half-page-down",
        ["ctrl-b"] = "half-page-up",
        ["ctrl-a"] = "beginning-of-line",
        ["ctrl-e"] = "end-of-line",
        ["alt-a"] = "toggle-all",
        ["alt-g"] = "last",
        ["alt-G"] = "first",
        -- Only valid with fzf previewers (bat/cat/git/etc)
        ["f3"] = "toggle-preview-wrap",
        ["f4"] = "toggle-preview",
        ["shift-down"] = "preview-down",
        ["shift-up"] = "preview-up",
      },
    },
    hls = { border = "FloatBorder", preview_border = "FloatBorder", preview_title = "@text" },
  },
}

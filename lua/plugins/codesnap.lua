return {
  "mistricky/codesnap.nvim",
  enabled = false,
  build = "make",
  opts = {
    save_path = os.getenv("PWD"),
    mac_window_bar = true,
    title = "CodeSnap",
    code_font_family = "JetBrainsMono Nerd Font",
    watermark_font_family = "Pacifico",
    watermark = "CodeSnap",
    bg_theme = "default",
    breadcrumbs_separator = "/",
    has_breadcrumbs = false,
    has_line_number = false,
    min_width = 0,
  },
}

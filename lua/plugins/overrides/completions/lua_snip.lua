return {
  "L3MON4D3/LuaSnip",
  lazy = true,
  build = (not LazyVim.is_win())
      and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
    or nil,
  dependencies = {
    {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip").filetype_extend("typescript", { "javascript" })
        require("luasnip").filetype_extend("typescriptreact", { "javascript" })
        require("luasnip.loaders.from_vscode").lazy_load({ exclude = { "c" } })
      end,
    },
  },
  opts = function(_, opts)
    LazyVim.cmp.actions.snippet_forward = function()
      if require("luasnip").jumpable(1) then
        require("luasnip").jump(1)
        return true
      end
    end
    opts.history = true
    opts.delete_check_events = "TextChanged"
  end,
}

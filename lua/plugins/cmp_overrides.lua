return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdLineEnter" },
  dependencies = {
    { "hrsh7th/cmp-emoji" },
    { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    { "hrsh7th/cmp-cmdline" },

    -- autopairing of (){}[] etc
    {
      "windwp/nvim-autopairs",
      -- opts = {
      --   fast_wrap = {},
      --   disable_filetype = { "TelescopePrompt", "vim" },
      -- },
      opts = {
        disable_filetype = { "TelescopePrompt", "spectre_panel", "vim" },
        disable_in_macro = true, -- disable when recording or executing a macro
        disable_in_visualblock = false, -- disable when insert after visual block mode
        disable_in_replace_mode = true,
        ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
        enable_moveright = true,
        enable_afterquote = true, -- add bracket pairs after quote
        enable_check_bracket_line = true, --- check bracket in same line
        enable_bracket_in_quote = true, --
        enable_abbr = false, -- trigger abbreviation
        break_undo = true, -- switch for basic rule break undo sequence
        check_ts = false,
        map_cr = true,
        map_bs = true, -- map the <BS> key
        map_c_h = false, -- Map the <C-h> key to delete a pair
        map_c_w = false, -- map <c-w> to delete a pair if possible
      },

      config = function(_, opts)
        require("nvim-autopairs").setup(opts)

        -- setup cmp for autopairs
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
      end,
    },
  },

  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local cmp = require("cmp")

    opts.window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    }

    local format_kinds = opts.formatting.format

    -- `:` cmdline setup.
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        {
          name = "cmdline",
          option = {
            ignore_cmds = { "Man", "!" },
          },
        },
      }),
    })

    opts.formatting.format = function(entry, vim_item)
      format_kinds(entry, vim_item)
      return require("tailwindcss-colorizer-cmp").formatter(entry, vim_item)
    end
    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
          cmp.select_next_item()
        elseif vim.snippet.active({ direction = 1 }) then
          vim.schedule(function()
            vim.snippet.jump(1)
          end)
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.snippet.active({ direction = -1 }) then
          vim.schedule(function()
            vim.snippet.jump(-1)
          end)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<Down>"] = cmp.mapping(function(fallback)
        cmp.close()
        fallback()
      end, { "i" }),
      ["<Up>"] = cmp.mapping(function(fallback)
        cmp.close()
        fallback()
      end, { "i" }),
    })
  end,
}

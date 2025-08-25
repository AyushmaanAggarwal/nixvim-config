{
  plugins.cmp = {
    autoEnableSources = true;
    settings = {
      sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
        { name = "luasnip"; }
      ];
      mapping = {
        __raw = ''
          cmp.mapping.preset.insert({
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<Tab>'] = cmp.mapping.confirm({ select = true }),
            ['<C-l>'] = cmp.mapping(function()
              if luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
              end
            end, { 'i', 's' }),
            ['<C-h>'] = cmp.mapping(function()
              if luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
              end
            end, { 'i', 's' }),

            })
        '';
      };
      snippet = {
        expand = "function(args) require('luasnip').lsp_expand(args.body) end";
      };
      completion = { completeopt = "menu,menuone,noinsert"; };
    };
  };

  # Luasnip
  plugins.luasnip = {
    enable = true;
    fromLua = [{ paths = ../snippets; }];
    settings = {
      enable_autosnippets = true;
      exit_roots = false;
      keep_roots = true;
      link_roots = true;
      update_events = [ "TextChanged" "TextChangedI" ];
    };
  };

  keymaps = [
    # Search snippet folder
    {
      mode = "n";
      key = "<leader>ss";
      action = "require('luasnip.loaders').edit_snippet_files(opts:table|nil)";
    }
  ];

}

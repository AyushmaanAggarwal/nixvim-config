{
  # A snippet engine for Neovim
  #  https://nix-community.github.io/nixvim/plugins/luasnip/index.html
  plugins.luasnip = {
    enable = true;
    fromLua = [ { paths = ../snippets; } ];
    settings = {
      enable_autosnippets = true;
      exit_roots = false;
      keep_roots = true;
      link_roots = true;
      update_events = [
        "TextChanged"
        "TextChangedI"
      ];
    };
  };

  # Autocompletion
  # See `:help cmp`
  # https://nix-community.github.io/nixvim/plugins/cmp/index.html
  plugins.blink-cmp = {
    enable = true;

    settings = {

      keymap = {
        # 'default' (recommended) for mappings similar to built-in completions
        # For an understanding of why the 'default' preset is recommended,
        # you will need to read `:help ins-completion`
        #
        # All presets have the following mappings:
        # <tab>/<s-tab>: move to right/left of your snippet expansion
        # <c-space>: Open menu or open docs if already open
        # <c-n>/<c-p> or <up>/<down>: Select next/previous item
        # <c-e>: Hide menu
        # <c-k>: Toggle signature help
        #
        # See :h blink-cmp-config-keymap for defining your own keymap
        preset = "default";

        # For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        #    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      };

      appearance = {
        # 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        # Adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono";
      };

      completion = {
        # By default, you may press `<c-space>` to show the documentation.
        # Optionally, set `auto_show = true` to show the documentation after a delay.
        documentation = {
          auto_show = false;
          auto_show_delay_ms = 500;
        };
      };

      sources = {
        default = [
          "lsp"
          "path"
          "snippets"
          "lazydev"
        ];
        providers = {
          lazydev = {
            module = "lazydev.integrations.blink";
            score_offset = 100;
          };
        };
      };

      snippets = {
        preset = "luasnip";
      };

      # Blink.cmp includes an optional, recommended rust fuzzy matcher,
      # which automatically downloads a prebuilt binary when enabled.
      #
      # By default, we use the Lua implementation instead, but you may enable
      # the rust implementation via `'prefer_rust_with_warning'`
      #
      # See :h blink-cmp-config-fuzzy for more information
      fuzzy = {
        implementation = "lua";
      };

      # Shows a signature help window while you type arguments for a function
      signature = {
        enabled = true;
      };
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

{
  # Fuzzy Finder (files, lsp, etc)
  # https://nix-community.github.io/nixvim/plugins/telescope/index.html
  plugins.telescope = {
    enable = true;

    # Enable Telescope extensions
    extensions = {
      fzf-native.enable = true;
      ui-select.enable = true;
    };

    # You can put your default mappings / updates / etc. in here
    #  See `:help telescope.builtin`
    keymaps = {
      "<leader>sh" = {
        mode = "n";
        action = "help_tags";
        options = { desc = "[S]earch [H]elp"; };
      };
      "<leader>sk" = {
        mode = "n";
        action = "keymaps";
        options = { desc = "[S]earch [K]eymaps"; };
      };
      "<leader>sf" = {
        mode = "n";
        action = "find_files";
        options = { desc = "[S]earch [F]iles"; };
      };
      "<leader>ss" = {
        mode = "n";
        action = "builtin";
        options = { desc = "[S]earch [S]elect Telescope"; };
      };
      "<leader>sw" = {
        mode = "n";
        action = "grep_string";
        options = { desc = "[S]earch current [W]ord"; };
      };
      "<leader>sg" = {
        mode = "n";
        action = "live_grep";
        options = { desc = "[S]earch by [G]rep"; };
      };
      "<leader>sd" = {
        mode = "n";
        action = "diagnostics";
        options = { desc = "[S]earch [D]iagnostics"; };
      };
      "<leader>sr" = {
        mode = "n";
        action = "resume";
        options = { desc = "[S]earch [R]esume"; };
      };
      "<leader>so" = {
        mode = "n";
        action = "oldfiles";
        options = { desc = "[S]earch Recent Files ('.' for repeat)"; };
      };
      "<leader><leader>" = {
        mode = "n";
        action = "buffers";
        options = { desc = "[ ] Find existing buffers"; };
      };
    };
    settings = {
      defaults = {
        vimgrep_arguments = [
          "rg"
          "--follow" # Follow symbolic links
          "--hidden" # Search for hidden files
          "--no-heading" # Don't group matches by each file
          "--with-filename" # Print the file path with the matched lines
          "--line-number" # Show line numbers
          "--column" # Show column numbers
          "--smart-case" # Smart case search
          "--sort=accessed"

          # Exclude some patterns from search
          "--glob=!**/.git/*"
          "--glob=!**/.idea/*"
          "--glob=!**/.vscode/*"
          "--glob=!**/build/*"
          "--glob=!**/dist/*"
          "--glob=!**/yarn.lock"
          "--glob=!**/package-lock.json"
        ];
      };
      pickers = {
        find_files = {
          hidden = true;
          # needed to exclude some files & dirs from general search
          # when not included or specified in .gitignore
          find_command = [
            "rg"
            "--files"
            "--hidden"
            "--glob=!**/.git/*"
            "--glob=!**/.idea/*"
            "--glob=!**/.vscode/*"
            "--glob=!**/build/*"
            "--glob=!**/dist/*"
            "--glob=!**/yarn.lock"
            "--glob=!**/package-lock.json"
          ];
        };
      };

      extensions.__raw =
        "{ ['ui-select'] = { require('telescope.themes').get_dropdown() } }";
    };
  };

  # https://nix-community.github.io/nixvim/keymaps/index.html
  keymaps = [
    # Slightly advanced example of overriding default behavior and theme
    {
      mode = "n";
      key = "<leader>/";
      # You can pass additional configuration to Telescope to change the theme, layout, etc.
      action.__raw = ''
        function()
          require('telescope.builtin').current_buffer_fuzzy_find(
            require('telescope.themes').get_dropdown {
              winblend = 10,
              previewer = false
            }
          )
        end
      '';
      options = { desc = "[/] Fuzzily search in current buffer"; };
    }
    {
      mode = "n";
      key = "<leader>s/";
      # It's also possible to pass additional configuration options.
      #  See `:help telescope.builtin.live_grep()` for information about particular keys
      action.__raw = ''
        function()
          require('telescope.builtin').live_grep {
            grep_open_files = true,
            prompt_title = 'Live Grep in Open Files'
          }
        end
      '';
      options = { desc = "[S]earch [/] in Open Files"; };
    }
    # Shortcut for searching your Neovim configuration files
    {
      mode = "n";
      key = "<leader>sN";
      action.__raw = ''
        function()
          require('telescope.builtin').find_files {
            cwd = vim.fn.stdpath 'config'
          }
        end
      '';
      options = { desc = "[S]earch [N]eovim files"; };
    }
    {
      mode = "n";
      key = "<leader>sD";
      action.__raw = ''
        function()
          require('telescope.builtin').find_files {
            cwd = '/home/ayushmaan/.dotfiles/'
          }
        end
      '';
      options = { desc = "[S]earch [D]otfiles"; };
    }
    {
      mode = "n";
      key = "<leader>sW";
      action.__raw = ''
        function()
          require('telescope.builtin').live_grep {
            cwd = '/home/ayushmaan/Documents/Obsidian/'
          }
        end
      '';
      options = { desc = "[S]earch [W]iki"; };
    }

  ];
}


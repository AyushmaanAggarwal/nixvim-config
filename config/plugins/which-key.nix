{
  # Useful plugin to show you pending keybinds.
  # https://nix-community.github.io/nixvim/plugins/which-key/index.html
  plugins.which-key = {
    enable = true;
    settings = {
      delay = 0;
      expand = 1;
      notify = false;
      preset = false;
      replace = {
        desc = [
          [ "<space>" "SPACE" ]
          [ "<leader>" "SPACE" ]
          [ "<[cC][rR]>" "RETURN" ]
          [ "<[tT][aA][bB]>" "TAB" ]
          [ "<[bB][sS]>" "BACKSPACE" ]
        ];
      };
      win = { border = "single"; };
    };
  };
}

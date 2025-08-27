{ lib, ... }:
let
  hjkl_keymap = {
    left = "h";
    right = "l";
    bottom = "j";
    top = "k";
  };
in
{
  keymaps = [
    # Clear highlight on search
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>nohlsearch<CR>";
    }
    # Diagnostics
    {
      mode = "n";
      key = "[d";
      action = "vim.diagnostic.goto_prev";
      options.desc = "Go to previous [D]iagnostic message";
    }
    {
      mode = "n";
      key = "]d";
      action = "vim.diagnostic.goto_next";
      options.desc = "Go to next [D]iagnostic message";
    }
    {
      mode = "n";
      key = "<leader>e";
      action = "vim.diagnostic.open_float";
      options.desc = "Show diagnostic [E]rror message";
    }
    {
      mode = "n";
      key = "<leader>q";
      action = "vim.diagnostic.setloclist";
      options.desc = "Open diagnostic [Q]uickfix list";
    }
    # Exit terminal mode
    {
      mode = "t";
      key = "<Esc><Esc>";
      action = "<C-\\><C-n>";
      options.desc = "Exit terminal mode";
    }
    {
      mode = "n";
      key = "<leader>r";
      action = "\"";
      options.desc = "Access [R]egister";
    }
    # Split Window
    {
      mode = "n";
      key = "<leader>pv";
      action = ":vsplit<CR>";
      options.desc = "S[p]lit [V]ertical";
    }
    {
      mode = "n";
      key = "<leader>ph";
      action = ":split<CR>";
      options.desc = "S[p]lit [H]orizontal";
    }
  ]
  # Move focus between window splits
  ++ lib.mapAttrsToList (
    location: key: {
      mode = "n";
      key = "<leader>${key}";
      action = "<C-w><C-${key}>";
      options.desc = "Move focus to the ${location} window";
    }
  );

}

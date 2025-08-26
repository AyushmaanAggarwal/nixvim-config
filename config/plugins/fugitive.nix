{
  plugins.fugitive.enable = true;

  keymaps = [
    {
      mode = "n";
      key = "<leader>ga";
      action = "<cmd>Git add .<CR>";
      options.desc = "[G]it [A]dd all";
    }
    {
      mode = "n";
      key = "<leader>gcc";
      action = "<cmd>Git commit -aS --verbose<CR>";
      options.desc = "[G]it [C]ommit [C]hanges";
    }
    {
      mode = "n";
      key = "<leader>gca";
      action = "<cmd>Git commit -aS --verbose --amend<CR>";
      options.desc = "[G]it [C]ommit [A]mmend";
    }
    {
      mode = "n";
      key = "<leader>gl";
      action = "<cmd>Git log<CR>";
      options.desc = "[G]it [L]og";
    }
    {
      mode = "n";
      key = "<leader>gb";
      action = "<cmd>Git blame<CR>";
      options.desc = "[G]it [B]lame";
    }
    {
      mode = "n";
      key = "<leader>gs";
      action = "<cmd>Git<CR>";
      options.desc = "[G]it [S]tatus";
    }
    {
      mode = "n";
      key = "<leader>gpd";
      action = "<cmd>Git pull<CR>";
      options.desc = "[G]it [P]ull [D]own";
    }
    {
      mode = "n";
      key = "<leader>gpu";
      action = "<cmd>Git push<CR>";
      options.desc = "[G]it [P]ush [U]p";
    }

  ];
}

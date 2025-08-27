{
  plugins.oil = {
    enable = true;
    settings = { };
  };
  keymaps = [
    {
      mode = "";
      key = "<leader>o";
      action = ":Oil<CR>";
      options.desc = "Open [O]il";
    }
  ];

}

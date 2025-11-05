{
  plugins.oil = {
    enable = true;
    settings = {
      preview_win.preview_method = "load";
    };
  };
  keymaps = [
    {
      mode = "";
      key = "<leader>oo";
      action = ":Oil<CR>";
      options.desc = "Open [O]il";
    }
    {
      mode = "";
      key = "\\";
      action = ":Oil<CR>";
      options.desc = "Open Oil";
    }
    {
      mode = "";
      key = "<leader>ot";
      action.__raw = ''
        function()
          detail = not detail
          if detail then
            require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
          else
            require("oil").set_columns({ "icon" })
          end
        end
      '';
      options.desc = "[O]il file preview [T]oggle";
    }
  ];

  extraConfigLua = ''
    local detail = false
  '';

}

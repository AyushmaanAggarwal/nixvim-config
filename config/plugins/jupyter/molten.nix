{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    imagemagick
    luajitPackages.magick
  ];

  plugins.molten = {
    enable = true;

    python3Dependencies =
      p: with p; [
        pynvim
        jupyter-client
        # Image Optional Dependencies
        cairosvg
        pnglatex
        plotly
        kaleido
        pyperclip
        pillow
        # Kernel Optional Dependencies
        ipython
        nbformat
        ipykernel
        requests
        websocket-client
      ];

    settings = {
      auto_open_output = true;
      copy_output = false;
      enter_output_behavior = "open_then_enter";
      output_show_exec_time = true;
      output_show_more = true;
      # output_win_hide_on_leave = false; # Don't redraw after leaving window
      output_virt_lines = true; # Prevent output from hiding lines
      virt_lines_off_by1 = true;
      virt_text_output = false; # Show virtual output after leaving cell

      image_provider = "image.nvim";
      output_crop_border = true;
      output_win_border = [
        ""
        "━"
        ""
        ""
      ];
      output_win_cover_gutter = true;
      output_win_style = false;
      #save_path = {
      #  __raw = "vim.fn.stdpath('data')..'/molten'";
      #};
      show_mimetype_debug = false;
      use_border_highlights = false;
      wrap_output = false;
    };

  };
  keymaps = [
    {
      mode = "n";
      key = "<localleader>mi";
      action = ":MoltenInit<CR>";
      options.desc = "Initialize the plugin";
    }
    {
      mode = "n";
      key = "<localleader>me";
      action = ":MoltenEvaluateOperator<CR>";
      options.desc = "Run operator selection";
    }
    {
      mode = "n";
      key = "<localleader>ml";
      action = ":MoltenEvaluateLine<CR>";
      options.desc = "Run line selection";
    }
    {
      mode = "n";
      key = "<localleader>mr";
      action = ":MoltenReevaluateCell<CR>";
      options.desc = "Re-evaluate Cell";
    }
    {
      mode = "v";
      key = "<localleader>mr";
      action = ":<C-u>MoltenEvaluateVisual<CR>";
      options.desc = "Evaluate visual selection";
    }
    {
      mode = "n";
      key = "<localleader>md";
      action = ":MoltenDelete<CR>";
      options.desc = "Delete cell";
    }
    # {
    #  mode = "n";
    #  key = "<localleader>mo";
    #  action = ":MoltenInit<CR>";
    #  options.desc = "Initialize the plugin";
    #}
    # {
    #  mode = "n";
    #  key = "<localleader>mi";
    #  action = ":MoltenInit<CR>";
    #  options.desc = "Initialize the plugin";
    #}

  ];

}

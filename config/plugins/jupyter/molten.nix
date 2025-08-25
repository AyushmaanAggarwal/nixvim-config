{
  plugins.molten = {
    enable = true;
    python3Dependencies = p:
      with p; [
        pynvim
        jupyter-client
        cairosvg
        ipython
        nbformat
        ipykernel
      ];

    settings = {
      auto_open_output = true;
      copy_output = false;
      enter_output_behavior = "open_then_enter";
      image_provider = "image.nvim";
      output_crop_border = true;
      output_show_more = true;
      output_virt_lines = true;
      output_win_border = [ "" "━" "" "" ];
      output_win_cover_gutter = true;
      output_win_hide_on_leave = true;
      output_win_style = false;
      save_path = { __raw = "vim.fn.stdpath('data')..'/molten'"; };
      show_mimetype_debug = false;
      use_border_highlights = false;
      virt_lines_off_by1 = false;
      wrap_output = false;
    };

  };
}

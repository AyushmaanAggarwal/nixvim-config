{ pkgs, ... }:
{
  # Dependencies
  extraPackages = with pkgs; [
    imagemagick
    luajitPackages.magick
  ];

  plugins.image = {
    enable = true;
    settings = {
      backend = "kitty";
      processor = "magick_rock";
      kitty_method = "normal";
      max_height_window_percentage = 40;
      max_width_window_percentage = 80;
      window_overlap_clear_enabled = true;
      window_overlap_clear_ft_ignore = [
        "cmp_menu"
        "cmp_docs"
        "snacks_notif"
        "scrollview"
        "scrollview_sign"
      ];
      integrations = {
        markdown = {
          enabled = true;
          clear_in_insert_mode = false;
          download_remote_images = true;
          only_render_image_at_cursor = false;
          floating_windows = true;
          filetypes = [
            "markdown"
            "vimwiki"
            "quarto"
          ];
        };
        neorg = {
          enabled = true;
          clear_in_insert_mode = false;
          download_remote_images = true;
          only_render_image_at_cursor = false;
          filetypes = [ "norg" ];
        };
        html = {
          enabled = true;
        };
        css = {
          enabled = true;
        };

      };

      hijack_file_patterns = [
        "*.png"
        "*.jpg"
        "*.jpeg"
        "*.gif"
        "*.webp"
        "*.avif"
      ]; # render image files as images when opened
    };

  };
}

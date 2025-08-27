{
  plugins.vimwiki = {
    enable = true;
    settings = {
      list = [
        {
          path = "~/Documents/Obsidian";
          syntax = "markdown";
          ext = ".md";
        }
      ];
      ext2syntax = {
        ".md" = "markdown";
        ".markdown" = "markdown";
        ".mdown" = "markdown";
      };
      use_mouse = 1;
      markdown_link_ext = 1;
      markdown_header_style = 0;
    };
  };
}

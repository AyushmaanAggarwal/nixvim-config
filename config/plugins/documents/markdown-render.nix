{ pkgs, ... }:
{
  extraPython3Packages =
    p: with p; [
      pylatexenc
    ];
  plugins.render-markdown = {
    enable = true;
    settings = {
      latex = {
        # Turn on / off latex rendering.
        enabled = true;
        # Additional modes to render latex.
        render_modes = true;
        # Executable used to convert latex formula to rendered unicode.
        # If a list is provided the first command available on the system is used.
        converter = "latex2text";
        # Highlight for latex blocks.
        highlight = "RenderMarkdownMath";
        position = "center";
        # Number of empty lines above latex blocks.
        # top_pad = 0,
        # Number of empty lines below latex blocks.
        # bottom_pad = 0,
      };
    };
  };
}

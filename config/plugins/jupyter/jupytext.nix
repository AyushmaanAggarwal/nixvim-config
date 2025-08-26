{ pkgs, ... }:
{
  plugins.jupytext = {
    enable = true;

    python3Dependencies = p: with p; [ jupytext ];
    settings = {
      style = "light";
      output_extension = "auto";
      force_ft = null;

      custom_language_formatting = {
        python = {
          extension = "md";
          force_ft = "markdown";
          style = "markdown";
        };
      };
    };
  };
}

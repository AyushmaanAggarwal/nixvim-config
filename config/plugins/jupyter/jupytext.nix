{ pkgs, ... }:
{
  extraPython3Packages = p: with p; [ jupytext ];
  plugins.jupytext = {
    enable = true;
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

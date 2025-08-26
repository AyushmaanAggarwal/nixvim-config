{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    python313Packages.jupytext
  ];
  plugins.jupytext = {
    enable = true;

    python3Dependencies = p: with p; [ jupytext ];
    settings = {
      custom_language_formatting = {
        python = {
          extension = "md";
          force_ft = "markdown";
          style = "markdown";
        };
      };
      force_ft = null;
      output_extension = "auto";
      style = "light";
    };
  };
}

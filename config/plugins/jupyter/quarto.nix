{
  plugins.quarto = {
    enable = true;
    settings = {
      closePreviewOnExit = true;
      codeRunner = {
        enabled = true;
        default_method = "molten";
      };
      debug = false;
      lspFeatures = {
        enabled = true;
        completion.enabled = true;
        diagnostics = {
          enabled = true;
          triggers = [ "BufWritePost" ];
        };
      };
    };
  };
}

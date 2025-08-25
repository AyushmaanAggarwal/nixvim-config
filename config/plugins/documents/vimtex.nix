{
  plugins.vimtex = {
    enable = true;
    settings = {
      view_method = "zathura";
      complier_method = "pdflatex";
      compiler_latexmk = {
        out_dir = "./output";
        options = [ "--shell-escape" ];
      };
    };
  };
}

{
  plugins.vimwiki = {
    enable = true;
    settings = {
      view_general_viewer = "zathura";
      complier_method = "pdflatex";
      compiler_latexmk = {
        out_dir = "./output";
        options = [ "--shell-escape" ];
      };
    };
  };
}

{ pkgs, ... }:
let
  tex = (
    pkgs.texlive.combine {
      inherit (pkgs.texlive)
        scheme-small
        enumitem
        xifthen
        ifmtarg
        fontawesome5
        roboto
        sourcesanspro
        tcolorbox
        tikzfill
        pdfjam
        lualatex-math
        karnaugh-map
        circuitikz
        xstring
        siunitx
        ;
    }
  );
in
{
  plugins.vimtex = {
    enable = true;
    texlivePackage = tex;
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

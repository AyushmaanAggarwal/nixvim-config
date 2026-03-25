{ pkgs, ... }:
let
  tree-sitter-verilog = pkgs.tree-sitter-grammars.tree-sitter-verilog;
in
{
  extraPackages = with pkgs; [
    gcc
  ];

  extraPlugins = [
    # Languages
  ];

  # Highlight, edit, and navigate code
  # https://nix-community.github.io/nixvim/plugins/treesitter/index.html
  plugins.treesitter = {
    enable = true;

    grammarPackages = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars ++ [
      # Languages
    ];

    settings = {
      highlight.enable = true;
      indent.enable = true;
    };
  };
}

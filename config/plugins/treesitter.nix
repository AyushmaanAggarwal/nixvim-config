{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    gcc
  ];

  # Highlight, edit, and navigate code
  # https://nix-community.github.io/nixvim/plugins/treesitter/index.html
  plugins.treesitter = {
    enable = true;

    grammarPackages =
      pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars
      ++ (with pkgs.tree-sitter-grammars; [
        # Languages
        tree-sitter-verilog
      ]);

    settings = {
      highlight.enable = true;
      indent.enable = true;
    };
  };
}

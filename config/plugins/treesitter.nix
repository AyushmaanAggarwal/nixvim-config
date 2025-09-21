{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    gcc
  ];

  # Highlight, edit, and navigate code
  # https://nix-community.github.io/nixvim/plugins/treesitter/index.html
  plugins.treesitter = {
    enable = true;

    grammarPackages = with pkgs.tree-sitter-grammars; [
      # Shell
      tree-sitter-bash

      # Data
      tree-sitter-css
      tree-sitter-json
      tree-sitter-toml
      tree-sitter-yaml
      tree-sitter-html

      # Languages
      tree-sitter-lua
      tree-sitter-nix
      tree-sitter-rust
      tree-sitter-python
      tree-sitter-verilog
      tree-sitter-hyprlang
      tree-sitter-dockerfile

      # Other
      tree-sitter-make
      tree-sitter-vim
      tree-sitter-regex
      tree-sitter-latex
      tree-sitter-markdown
      tree-sitter-markdown-inline
    ];

    settings = {
      highlight.enable = true;
      indent.enable = true;
    };
  };
}

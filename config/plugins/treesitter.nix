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
    tree-sitter-verilog
  ];

  # Highlight, edit, and navigate code
  # https://nix-community.github.io/nixvim/plugins/treesitter/index.html
  plugins.treesitter = {
    enable = true;

    grammarPackages = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars ++ [
      # Languages
      tree-sitter-verilog
    ];

    settings = {
      highlight.enable = true;
      indent.enable = true;
    };
    luaConfig.post = ''
      do
        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        -- change the following as needed
        parser_config.verilog = {
          install_info = {
            url = "${tree-sitter-verilog}",
            files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
          },
          filetype = "verilog", -- if filetype does not match the parser name
        }
      end
    '';
  };
}

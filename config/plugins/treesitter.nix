{ pkgs, ... }: {
  # Highlight, edit, and navigate code
  # https://nix-community.github.io/nixvim/plugins/treesitter/index.html
  plugins.treesitter = {
    enable = true;

    # Installing tree-sitter grammars from Nixpkgs (recommended)
    # https://nix-community.github.io/nixvim/plugins/treesitter/index.html#installing-tree-sitter-grammars-from-nixpkgs
    # grammarPackages = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars;
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      # Linux
      bash
      ssh_config
      tmux
      zathurarc

      # Nix, Nixvim
      cmake
      nix
      query # treesitter queries
      vim
      vimdoc
      # lua
      # luadoc

      # General Development
      csv
      diff
      editorconfig
      git_config
      git_rebase
      gitattributes
      gitcommit
      gitignore
      ini
      # llvm
      latex
      markdown
      markdown_inline
      regex
      xml
      yaml

      # Python
      python
      # Rust Development
      rust
      toml # Also for ZMK `keymap.toml`

      # Web Development
      css
      html
      # http
      javascript
      json
      # json5
      # php
      # php_only
      # phpdoc
      # sql
      # scss
      # twig
      # tsx
      # typescript
    ];

    settings = {
      # Installing tree-sitter grammars from nvim-treesitter
      # (can be combined with grammarPackages from Nixpkgs)
      # https://nix-community.github.io/nixvim/plugins/treesitter/index.html#installing-tree-sitter-grammars-from-nvim-treesitter
      ensureInstalled = [ ];

      highlight.enable = true;
      indent.enable = true;
    };
  };
}


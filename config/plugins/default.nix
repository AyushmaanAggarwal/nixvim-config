{ ... }: {
  imports = [
    # File Management
    ./oil.nix
    ./conform.nix
    ./neo-tree.nix

    # Autocomplete
    ./cmp.nix
    ./nvim-autopairs.nix

    # Git 
    ./gitsigns.nix

    # Code Runner
    ./dap.nix
    ./jupyter

    # Parse Code
    ./lsp.nix
    ./lint.nix
    ./treesitter.nix
    ./indent_line.nix
    ./todo-comments.nix

    # Other
    ./mini.nix
    ./telescope.nix
    ./which-key.nix
  ];
}

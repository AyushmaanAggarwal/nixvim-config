{ ... }:
{
  imports = [
    # File Management
    ./oil.nix
    ./neo-tree.nix

    # Autocomplete
    ./cmp.nix
    ./conform.nix
    ./nvim-autopairs.nix

    # Git
    ./fugitive.nix
    ./gitsigns.nix

    # Code Runner
    ./dap.nix
    ./jupyter
    ./documents

    # Parse Code
    ./lsp.nix
    ./lint.nix
    ./sleuth.nix
    ./treesitter.nix
    ./indent_line.nix
    ./todo-comments.nix

    # Other
    ./mini.nix
    ./telescope.nix
    ./which-key.nix
  ];
}

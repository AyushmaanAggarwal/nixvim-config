{ ... }: {
  imports = [
    # File Management
    ./oil.nix
    ./conform.nix

    # Autocomplete
    ./cmp.nix
    ./nvim-autopairs.nix

    # Git 
    ./gitsigns.nix

    # Other
    ./which-key.nix
  ];
}

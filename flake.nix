{
  description = "Ayu's NixVim Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-temp-fix-verilog.url = "github:NixOS/nixpkgs/544961dfcce86422ba200ed9a0b00dd4b1486ec5?narHash=sha256-EVAqOteLBFmd7pKkb0%2BFIUyzTF61VKi7YmvP1tw4nEw%3D";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixvim,
      ...
    }@inputs:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);

      checks = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          lib = nixpkgs.legacyPackages.${system};
          nixvimLib = nixvim.lib.${system};
          nixvimModule = {
            inherit system;
            module = import ./config { inherit inputs pkgs lib; };
          };
        in
        {
          # Lets you run `nix flake check .` to check nixvim
          default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
        }
      );
      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          lib = nixpkgs.legacyPackages.${system};
          nixvim' = nixvim.legacyPackages.${system};
          nixvimModule = {
            inherit system;
            module = import ./config { inherit inputs pkgs lib; };
          };
        in
        {
          # Lets you run `nix run .` to start nixvim
          default = nixvim'.makeNixvimWithModule nixvimModule;
        }
      );
    };
}

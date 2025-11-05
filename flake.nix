{
  description = "Ayu's NixVim Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-veridian.url = "github:NixOS/nixpkgs/ffa8ef09b95be162416645fedeb87f51ad5cea9c";
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
            module = {
              _module.args = {
                inherit inputs system;
              };
            }
            // (import ./config {
              inherit
                inputs
                pkgs
                lib
                system
                ;
            });
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
            module = {
              _module.args = {
                inherit inputs system;
              };
            }
            // (import ./config {
              inherit
                inputs
                pkgs
                lib
                system
                ;
            });
          };
        in
        {
          # Lets you run `nix run .` to start nixvim
          default = nixvim'.makeNixvimWithModule nixvimModule;
        }
      );
    };
}

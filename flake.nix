{
  description = "Ayu's NixVim Configuration";

  inputs = {
    nixpkgs.follows = "nixvim/nixpkgs";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = { nixpkgs, nixvim, ... }@inputs:
    let
      systems =
        [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

      forAllSystems = nixpkgs.lib.genAttrs systems;
    in {
      checks = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          lib = nixpkgs.legacyPackages.${system};
          nixvimLib = nixvim.lib.${system};
          nixvimModule = {
            inherit system;
            module = import ./config { inherit pkgs lib; };
          };
        in {
          # Lets you run `nix flake check .` to check nixvim
          default =
            nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
        });
      packages = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          lib = nixpkgs.legacyPackages.${system};
          nixvim' = nixvim.legacyPackages.${system};
          nixvimModule = {
            inherit system;
            module = import ./config { inherit pkgs lib; };
          };
        in {
          # Lets you run `nix run .` to start nixvim
          default = nixvim'.makeNixvimWithModule nixvimModule;
        });
      flake = {
        nixosModules.default = { config, pkgs, lib, ... }: {
          imports = [ inputs.nixvim.nixosModules.nixvim ];
          programs.nixvim-config = import ./config { inherit pkgs lib; };
        };

        homeManagerModules.default = { config, pkgs, lib, ... }: {
          imports = [ inputs.nixvim.homeManagerModules.nixvim ];
          programs.nixvim-config = import ./config { inherit pkgs lib; };
        };

        darwinModules.default = { config, pkgs, lib, ... }: {
          imports = [ inputs.nixvim.darwinModules.nixvim ];
          programs.nixvim-config = import ./config { inherit pkgs lib; };
        };
      };
    };
}

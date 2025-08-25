{
  description = "Ayu's NixVim Configuration";

  inputs = {
    nixpkgs.follows = "nixvim/nixpkgs";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = { nixpkgs, nixvim, ... }:
    let
      systems =
        [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

      forAllSystems = nixpkgs.lib.genAttrs systems;
    in {
      checks = forAllSystems (system:
        let
          nixvimLib = nixvim.lib.${system};
          nixvimModule = {
            inherit system;
            module = import ./config;
          };
        in {
          default =
            nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
        });
      packages = forAllSystems (system:
        let
          nixvim' = nixvim.legacyPackages.${system};
          nixvimModule = {
            inherit system;
            module = import ./config;
          };
        in {
          # Lets you run `nix run .` to start nixvim
          default = nixvim'.makeNixvimWithModule nixvimModule;
        });
    };
}

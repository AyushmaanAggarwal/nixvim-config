# Introduction
This configuration drew heavy inspiration from both [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) and it's derivative [kickstart.nixvim](https://github.com/JMartJonesy/kickstart.nixvim/tree/main/config/plugins/kickstart) 

# Run
Temporarily run neovim configuration by installing [nix](https://nixos.org/download/) and running the following
```sh
nix run github:AyushmaanAggarwal/nixvim-config
```

# Install
Install the neovim configuration by adding the following to nix-modules, home-manager, nix-darwin
```nix
{ inputs, ... }: {
  imports = [ inputs.nixvim-config.nixosModules.default ];

  programs.nixvim-config.enable = true;
}
```

{
  description = "devRals's nixos config. Forked from anotherHadi's nixos config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; # Nixpkgs
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05"; # Nixpkgs Stable
    hyprland.url = "github:hyprwm/Hyprland"; # Hyprland
    nvf.url = "github:notashelf/nvf"; # Neovim Nix Configuration
    helium-browser.url = "github:oxcl/nix-flake-helium-browser"; # Chromium Based _un-googled_ Browser
    tuigreet.url = "github:NotAShelf/tuigreet"; # Greetd Based Login Manager
    awww.url = "git+https://codeberg.org/LGFae/awww"; # Wallpaper software

    # devRals's Quickshell configuration
    dqs = {
      url = "git+https://codeberg.org/devRals/DQS";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # System theming
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Search nixpkgs when no avaliable command is found
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ {
    nixpkgs,
    nixpkgs-stable,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-stable = nixpkgs-stable.legacyPackages.${system};
    args = {
      inherit
        inputs
        nixpkgs
        system
        pkgs
        pkgs-stable
        ;
    };
  in {
    nixosConfigurations = {
      meow = import ./hosts/meow/flake.nix args; # cool hostname :3
    };
  };
}

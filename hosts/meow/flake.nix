{
  inputs,
  nixpkgs,
  ...
}:
nixpkgs.lib.nixosSystem {
  modules = [
    {
      nixpkgs.overlays = [];
      _module.args = {inherit inputs;};
    }
    inputs.home-manager.nixosModules.default
    inputs.helium-browser.nixosModules.default
    inputs.stylix.nixosModules.default
    ./configuration.nix
  ];
}

{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.nvf.homeManagerModules.default];

  programs.nvf = {
    enable = true;
    settings.imports = [
      ./debugger.nix
      ./options.nix
      ./extra-plugins.nix
      ./keymaps.nix
      ./mini.nix
      ./snacks.nix
      ./picker.nix
      ./languages.nix
      ./utils.nix
    ];
  };
}

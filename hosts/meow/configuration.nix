{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../../system/audio.nix
    ../../system/bluethooth.nix
    ../../system/bootloader.nix
    ../../system/fonts.nix
    ../../system/graphics.nix
    ../../system/hyprland.nix
    ../../system/locale.nix
    ../../system/network.nix
    ../../system/nix.nix
    ../../system/programs.nix
    ../../system/tuigreet.nix
    ../../system/users.nix

    ./extraPackages.nix
    ./hardware-configuration.nix
    ./variables.nix
  ];

  home-manager = {
    users."${config.var.username}" = import ./home.nix;
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm_backup";
    extraSpecialArgs = {
      inherit inputs;
      pkgs-stable = import inputs.nixpkgs-stable {
        system = pkgs.stdenv.hostPlatform.system;
        config.allowUnfree = config.var.allowUnfree;
      };
    };
  };

  # DON'T CHANGE THIS
  system.stateVersion = "26.05";
}

{
  config,
  lib,
  pkgs,
  ...
}: let 
  profilePicture = pkgs.fetchUrl {
    url = "https://avatars.githubusercontent.com/u/79636106";
    sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAA"; # CHANGEME: When your try to rebuild your system 
                                                  # with this fake hash nixos will give you a new hash. Use it here.
  };
in {
  imports = [
    # Choose your theme here:
    ../../themes/nixy.nix
  ];

  config.var = {
    hostname = "nixos";
    username = "devrals";
    configDirectory = "/home/" + config.var.username + "/.config/nixos"; # The path of the nixos configuration directory
    profilePicture = profilePicture;

    keyboardLayout = "tr";

    timeZone = "Europe/Istanbul";
    defaultLocale = "en_US.UTF-8";

    git = {
      username = "devRals";
      email = "fluffycutegoatboi@gmail.com";
    };

    autoUpgrade = false;
    autoGarbageCollector = true;
  };

  # DON'T TOUCH THIS
  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = {};
    };
  };
}

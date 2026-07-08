{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    # Choose your theme here:
    ../../themes/nixy.nix
  ];

  config.var = {
    hostname = "meow";
    username = "devrals";
    configDirectory = "/home/" + config.var.username + "/.config/nixos"; # The path of the nixos configuration directory

    keyboardLayout = "tr";

    timeZone = "Europe/Istanbul";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "en_US.UTF-8";

    git = {
      username = "devRals";
      email = "fluffycutegoatboi@gmail.com";
    };

    autoUpgrade = false;
    autoGarbageCollector = true;

    profilePicture = pkgs.fetchurl {
      url = "https://avatars.githubusercontent.com/u/79636106";
      hash = "sha256-8ldddiydE5OBYoHj8hBKrXuh64AEUxmcbKDbNNm032Q=";
    };
  };

  # DON'T TOUCH THIS
  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = {};
    };
  };
}

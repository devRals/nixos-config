{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../../themes/tokyonight
  ];

  config.var = {
    username = "devrals";
    hostname = "meow";
    configDirectory = "/home/" + config.var.username + "/.config/nixos";

    keyboardLayout = {
      xkb = "tr";
      keyMap = "trq";
    };

    timeZone = "Europe/Istanbul";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "en_US.UTF-8";

    autoLogin = false;
    autoUpgrade = false;
    autoGarbageCollector = false;

    profilePicture = pkgs.fetchurl {
      url = "https://avatars.githubusercontent.com/u/79636106";
      hash = "sha256-8ldddiydE5OBYoHj8hBKrXuh64AEUxmcbKDbNNm032Q=";
    };
  };

  options.var = lib.mkOption {
    type = lib.types.attrs;
    default = {};
  };
}

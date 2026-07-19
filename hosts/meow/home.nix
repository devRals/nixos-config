{config, ...}: {
  imports = [
    ../../home/programs
    ../../home/system
    ../../home/scripts

    ./variables.nix
  ];

  home = {
    username = config.var.username;
    homeDirectory = "/home/" + config.var.username;
    file.".face".source = config.var.profilePicture;
    pointerCursor.enable = true;

    stateVersion = "26.05";
  };
}

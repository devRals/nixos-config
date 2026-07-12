{
  pkgs,
  config,
  lib,
  ...
}: {
  options.theme = lib.mkOption {
    type = lib.types.attrs;
    default = {
      rounding = 2;
      bar-rounding = 20 + 10;
      bar-thickness = 2;
      gaps-in = 8;
      gaps-out = 8;
      active-opacity = 1;
      inactive-opacity = 0.85;
      blur = 6;
      border-size = 2;
      wallpapers = ./wallpapers;
    };
    description = "Theme configuration options";
  };

  config.stylix = {
    enable = true;

    polarity = "dark";
    cursor = {
      name = "BreezeX-RosePine-Linux";
      package = pkgs.rose-pine-cursor;
      size = 20;
    };
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    fonts = {
      monospace = {
        package = pkgs.maple-mono.NF;
        name = "Maple Mono NF";
      };
      sansSerif = {
        package = pkgs.source-sans-pro;
        name = "Source Sans Pro";
      };
      serif = config.stylix.fonts.sansSerif;
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 12;
        desktop = 12;
        popups = 12;
        terminal = 10; # Kitty uses monocraft
      };
    };
  };
}

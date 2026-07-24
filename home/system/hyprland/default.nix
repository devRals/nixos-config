{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./animations.nix
    ./startup.nix
    ./monitors.nix
    ./env.nix
    ./input.nix
    ./look-and-feel.nix
    ./bindings.nix
  ];

  home.packages = with pkgs; [
    qt5.qtwayland
    qt6.qtwayland
    libsForQt5.qt5ct
    qt6Packages.qt6ct
    xcb-util-cursor
    libxcb
    hyprland-qtutils
    adw-gtk3
    hyprshot
    hyprpicker
    imv
    wf-recorder
    wlr-randr
    brightnessctl
    gnome-themes-extra
    dconf
    wayland-utils
    wayland-protocols
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    xwayland.enable = true;
    systemd = {
      enable = false;
      variables = ["--all"];
    };
  };
}

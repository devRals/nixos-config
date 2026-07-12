{
  pkgs,
  config,
  ...
}: {
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
  services.udisks2.enable = true;
  services.dbus = {
    enable = true;
    implementation = "broker";
    packages = with pkgs; [
      gcr
      gnome-settings-daemon
    ];
  };
  services.psd = {
    enable = true;
    resyncTimer = "10m";
  };

  # enable zsh autocompletion for system packages (systemd, etc)
  environment.pathsToLink = ["/share/zsh"];

  environment.systemPackages = with pkgs; [
    git
    fd
    bc
    gcc
    file
    xdg-utils
    wget
    curl
    gnupg
    openssl
    vim
    comma
    zip
    unzip
    optipng
    jpegoptim
    pfetch
    btop
    unrar
    p7zip
  ];

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = ["gtk"];
      hyprland.default = ["gtk" "hyprland"];
    };

    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  security = {
    # allow wayland lockers to unlock the screen
    pam.services.hyprlock.text = "auth include login";

    # userland niceness
    rtkit.enable = true;

    # don't ask for password for wheel group
    sudo.wheelNeedsPassword = false;
  };
}

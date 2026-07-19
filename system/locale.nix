{
  config,
  pkgs,
  ...
}: let
  keyboardLayout = config.var.keyboardLayout;
  configDir = config.var.configDirectory;
  timeZone = config.var.timeZone;
  defaultLocale = config.var.defaultLocale;
  extraLocale = config.var.extraLocale;
  autoUpgrade = config.var.autoUpgrade;
in {
  system.autoUpgrade = {
    enable = autoUpgrade;
    dates = "04:00";
    flake = "${configDir}";
    flags = [
      "--update-input"
      "nixpkgs"
      "--commit-lock-file"
    ];
    allowReboot = false;
  };

  time.timeZone = timeZone;

  i18n.defaultLocale = defaultLocale;
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [fcitx5-gtk];
  };
  i18n.extraLocaleSettings = {
    LC_ADDRESS = extraLocale;
    LC_IDENTIFICATION = extraLocale;
    LC_MEASUREMENT = extraLocale;
    LC_MONETARY = extraLocale;
    LC_NAME = extraLocale;
    LC_NUMERIC = extraLocale;
    LC_PAPER = extraLocale;
    LC_TELEPHONE = extraLocale;
    LC_TIME = extraLocale;
  };

  environment.sessionVariables = {
    XKB_DEFAULT_LAYOUT = "tr";
    XKB_DEFAULT_VARIANT = "";
  };

  services.xserver.xkb = {
    layout = "tr";
    variant = "";
  };

  console.useXkbConfig = true;
}

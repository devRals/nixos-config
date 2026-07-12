{
  programs.quickshell = {
    enable = true;

    systemd.enable = true;

    activeConfig = "default";
    configs = {
      default = ./configs/default;
    };
  };
}

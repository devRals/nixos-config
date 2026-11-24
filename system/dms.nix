{
  inputs,
  pkgs,
  ...
}: let
  quickshell = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;
in {
  programs = {
    dms-shell = {
      enable = true;
      quickshell.package = quickshell;

      systemd = {
        enable = true;
        restartIfChanged = true;
      };

      enableVPN = true;
      enableClipboardPaste = true;
      enableDynamicTheming = true;
      enableAudioWavelength = true;
      enableSystemMonitoring = true;
      enableCalendarEvents = true;
    };

    dsearch = {
      enable = true;

      systemd = {
        enable = true;
        target = "graphical-session.target"; # Only start in graphical sessions
      };
    };
  };

  services.displayManager = {
    dms-greeter = {
      enable = true;
      compositor.name = "hyprland";

      configHome = "/home/devrals";
      logs = {
        save = true;
        path = "/tmp/dms-greeter.log";
      };

      quickshell.package = quickshell;
    };

    autoLogin = {
      enable = false;
      user = "devrals";
    };

    defaultSession = "hyprland";
  };
}

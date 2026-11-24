{
  pkgs,
  inputs,
  lib,
  ...
}: let
  tuigreet = inputs.tuigreet.packages.${pkgs.stdenv.hostPlatform.system}.default;
  tuigreet-launch = pkgs.writeShellScript "tuigreet-launch" ''
    exec ${tuigreet}/bin/tuigreet \
    		--time \
    		--time-format '%H:%M  %A %d %B' \
    		--sessions /run/current-system/sw/share/wayland-sessions \
    		--remember \
    		--remember-user-session \
    		--asterisks \
    		--greeting 'Welcome' \
    		--container-padding 2 \
    		--power-shutdown 'systemctl poweroff' \
    		--power-reboot 'systemctl reboot'
  '';
in {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${tuigreet-launch}";
        user = "greeter";
      };
    };
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };

  environment.systemPackages = [tuigreet];
}

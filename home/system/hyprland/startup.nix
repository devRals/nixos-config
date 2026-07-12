{
  pkgs,
  lib,
  ...
}: let
  startupApps = [
    "systemctl --user start hyprpolkitagent" # Polkit Agent Daemo
    "awww-daemon" # Wallpaper Daemon
  ];
in {
  home.packages = [pkgs.hyprpolkitagent];

  wayland.windowManager.hyprland.settings.on = [
    {
      _args = [
        "hyprland.start"
        (lib.generators.mkLuaInline
          ''            function()  
            	${lib.strings.concatMapStringsSep "\n" (cmd: "hl.exec_cmd(\"${cmd}\")") startupApps} 
            end'')
      ];
    }
  ];
}

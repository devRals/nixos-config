{
  pkgs,
  config,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$shiftMod" = "SUPER_SHIFT";

    bind =
      [
        # Quick launch
        "$mod,RETURN, exec, uwsm app -- ${pkgs.ghostty}/bin/ghostty" # Ghostty (terminal)
        "$mod,B, exec, uwsm app -- ${config.programs.helium.package}/bin/helium" # Browser
        "$mod,F, exec,  uwsm app -- ${pkgs.thunar}/bin/thunar" # Thunar

        # Windows
        "$mod,W, killactive," # Close window
        "SHIFT, F11, fullscreen" # Toggle Fullscreen
        "$mod,V, togglefloating," # Toggle Floating

        # Focus Windows
        "$mod,H, movefocus, l" # Move focus left
        "$mod,J, movefocus, d" # Move focus Down
        "$mod,K, movefocus, u" # Move focus Up
        "$mod,L, movefocus, r" # Move focus Right
        "$shiftMod,H, swapwindow, l" # Focus previous monitor
        "$shiftMod,J, swapwindow, d" # Remove from master
        "$shiftMod,K, swapwindow, u" # Add to master
        "$shiftMod,L, swapwindow, r" # Focus next monitor
      ]
      ++ (builtins.concatLists (
        builtins.genList (
          i: let
            ws = i + 1;
          in [
            "$mod,code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT,code:1${toString i}, movetoworkspace, ${toString ws}"
          ]
        )
        9
      ));

    bindm = [
      "$mod,mouse:272, movewindow" # Move Window (mouse)
      "$mod,mouse:273, resizewindow" # Resize Window (mouse)
    ];

    bindl = [
      # Sound
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioRaiseVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ];

    bindin = [
    ];
  };
}

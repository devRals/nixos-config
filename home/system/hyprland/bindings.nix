{
  lib,
  pkgs,
  config,
  ...
}: let
  terminal = "\"${pkgs.kitty}/bin/kitty\"";
  browser = "\"${config.programs.helium.package}/bin/helium\"";
  btop = "\"${pkgs.kitty}/bin/kitty -e btop\"";
  file-manager = "\"${pkgs.thunar}/bin/thunar\"";

  mod = "SUPER";

  mkBinding = key: dispatch: extraArgs: {
    _args = [
      (lib.generators.mkLuaInline "\"${key}\"")
      (lib.generators.mkLuaInline "${dispatch}")
      extraArgs
    ];
  };
in {
  wayland.windowManager.hyprland.settings = {
    bind =
      [
        # Programs
        (mkBinding "${mod} + RETURN" "hl.dsp.exec_cmd(${terminal})" {})
        (mkBinding "${mod} + T" "hl.dsp.exec_cmd(${btop})" {})
        (mkBinding "${mod} + B" "hl.dsp.exec_cmd(${browser})" {})
        (mkBinding "${mod} + F" "hl.dsp.exec_cmd(${file-manager})" {})

        # Windows
        (mkBinding "${mod} + W" "hl.dsp.window.close()" {locked = true;})
        (mkBinding "${mod} + V" "hl.dsp.window.float()" {})

        (mkBinding "${mod} + L" "hl.dsp.focus({ direction = \"r\" })" {})
        (mkBinding "${mod} + H" "hl.dsp.focus({ direction = \"l\" })" {})
        (mkBinding "${mod} + J" "hl.dsp.focus({ direction = \"d\" })" {})
        (mkBinding "${mod} + K" "hl.dsp.focus({ direction = \"u\" })" {})

        (mkBinding "${mod} + SHIFT + L" "hl.dsp.window.move({ direction = \"r\" })" {})
        (mkBinding "${mod} + SHIFT + H" "hl.dsp.window.move({ direction = \"l\" })" {})
        (mkBinding "${mod} + SHIFT + J" "hl.dsp.window.move({ direction = \"d\" })" {})
        (mkBinding "${mod} + SHIFT + K" "hl.dsp.window.move({ direction = \"u\" })" {})

        # Mouse-Window Interactions
        (mkBinding "${mod} + mouse:272" "hl.dsp.window.drag()" {mouse = true;})
        (mkBinding "${mod} + mouse:273" "hl.dsp.window.resize()" {mouse = true;})

        # Media keys
        (mkBinding "XF86AudioRaiseVolume" "hl.dsp.exec_cmd(\"wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+\")" {
          locked = true;
          repeating = true;
        })
        (mkBinding "XF86AudioLowerVolume" "hl.dsp.exec_cmd(\"wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-\")" {
          locked = true;
          repeating = true;
        })
        (mkBinding "XF86AudioMute" "hl.dsp.exec_cmd(\"wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle\")" {
          locked = true;
          repeating = true;
        })
        (mkBinding "XF86AudioMicMute" "hl.dsp.exec_cmd(\"wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle\")" {
          locked = true;
          repeating = true;
        })
        (mkBinding "XF86MonBrightnessUp" "hl.dsp.exec_cmd(\"brightnessctl -e4 -n2 set 5%+\")" {
          locked = true;
          repeating = true;
        })
        (mkBinding "XF86MonBrightnessDown" "hl.dsp.exec_cmd(\"brightnessctl -e4 -n2 set 5%-\")" {
          locked = true;
          repeating = true;
        })

        (mkBinding "XF86AudioNext" "hl.dsp.exec_cmd(\"playerctl next\")" {locked = true;})
        (mkBinding "XF86AudioPause" "hl.dsp.exec_cmd(\"playerctl play-pause\")" {locked = true;})
        (mkBinding "XF86AudioPlay" "hl.dsp.exec_cmd(\"playerctl play-pause\")" {locked = true;})
        (mkBinding "XF86AudioPrev" "hl.dsp.exec_cmd(\"playerctl previous\")" {locked = true;})
      ]
      ++ (
        # Workspaces
        builtins.concatLists (builtins.genList (i: let
            ws = i + 1;
          in [
            (mkBinding "${mod} + code:1${toString i}" "hl.dsp.focus({ workspace = ${toString ws}})" {})
            (mkBinding "${mod} + SHIFT + code:1${toString i}" "hl.dsp.window.move({ workspace = ${toString ws} })" {})
          ])
          9)
      );
  };
}

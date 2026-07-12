{config, ...}: let
  border-size = config.theme.border-size;
  gaps-in = config.theme.gaps-in;
  gaps-out = config.theme.gaps-out;
  active-opacity = config.theme.active-opacity;
  inactive-opacity = config.theme.inactive-opacity;
  rounding = config.theme.rounding;
  blur = config.theme.blur;
in {
  wayland.windowManager.hyprland.settings.config = {
    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      disable_autoreload = true;
      focus_on_activate = true;
    };
    ecosystem = {
      no_update_news = true;
    };
    general = {
      resize_on_border = false;
      layout = "master";
      gaps_in = gaps-in;
      gaps_out = gaps-out;
      border_size = border-size;
    };
    decoration = {
      active_opacity = active-opacity;
      inactive_opacity = inactive-opacity;
      inherit rounding;
      shadow = {
        enabled = true;
      };
      blur = {
        enabled = blur > 0;
        size = blur;
      };
    };
    master = {
      new_status = "slave";
      allow_small_split = true;
      mfact = 0.5;
    };
  };
}

{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    config = {
      input = {
        kb_layout = config.var.keyboardLayout.xkb;
        kb_options = "caps:escape";
        follow_mouse = true;
        sensitivity = -1;
        repeat_delay = 200;
        repeat_rate = 60;

        touchpad = {
          natural_scroll = true;
          clickfinger_behavior = true;
        };
      };
    };
    gesture = {
      fingers = 3;
      direction = "horizontal";
      action = "workspace";
    };
  };
}

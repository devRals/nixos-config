{lib, ...}: {
  programs.kitty.enable = true;
  programs.kitty.font.name = lib.mkForce "Monocraft";
  programs.kitty.shellIntegration.enableZshIntegration = true;
  programs.kitty.settings = {
    # Cursor
    cursor_shape = "block";
    cursor_shape_unfocused = "hollow";
    cursor_beam_thickness = 1.5;
    cursor_blink_interval = 0.6;
    cursor_trail = 1;

    # Performance
    repaint_delay = 20;
    sync_to_monitor = "yes";

    # Bell (disabled)
    enable_audio_bell = false;
    close_window_with_confirmation = false;

    background_opacity = lib.mkForce "0.85";
  };
}

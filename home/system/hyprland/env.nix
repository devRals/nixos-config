let 
	mkVariable = key: value: {
		_args = [
			key value
		];
	};
in
{
	# Write your uwsm environment variables here
	xdg.configFile."uwsm/env".text = ''

	'';

	wayland.windowManager.hyprland.settings = {
		env = [
        		(mkVariable "XDG_CURRENT_DESKTOP" "Hyprland")
        		(mkVariable "XDG_SESSION_TYPE" "wayland")
        		(mkVariable "XDG_SESSION_DESKTOP" "Hyprland")
        		(mkVariable "ANKI_WAYLAND" "1")
        		(mkVariable "DISABLE_QT5_COMPAT" "0")
        		(mkVariable "QT_AUTO_SCREEN_SCALE_FACTOR" "1")
        		(mkVariable "QT_QPA_PLATFORM" "wayland;xcb")
        		(mkVariable "QT_QPA_PLATFORMTHEME" "gtk3")
        		(mkVariable "QT_WAYLAND_DISABLE_WINDOWDECORATION" "1")
        		(mkVariable "ELECTRON_OZONE_PLATFORM_HINT" "auto")
        		(mkVariable "DIRENV_LOG_FORMAT" "")
        		(mkVariable "SDL_VIDEODRIVER" "wayland")
        		(mkVariable "CLUTTER_BACKEND" "wayland")
		];
	};
}

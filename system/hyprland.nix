{ inputs,pkgs, ... }: 
let system = pkgs.stdenv.hostPlatform.system; in
{
	programs.hyprland = {
		enable = true;
		withUWSM = true;
		package = inputs.hyprland.packages."${system}".hyprland;
		portalPackage = inputs.hyprland.packages."${system}".xdg-desktop-portal-hyprland;
	};
}

{
  pkgs,
  pkgs-stable,
  ...
}: {
  home.packages = with pkgs-stable; [
    prismlauncher # An open-source minecraft launcher
    olympus # Celeste Mod Loader (Everest) Launcher
    krita
  ];
}

{
  inputs,
  pkgs,
  pkgs-stable,
  ...
}: let
  concord = inputs.concord.packages.${pkgs.stdenv.hostPlatform.system}.default;
in {
  home.packages = with pkgs-stable; [
    concord # An open-source and simple TUI based discord clone
    prismlauncher # An open-source minecraft launcher
    olympus # Celeste Mod Loader (Everest) Launcher
    localsend # Send files between devices that connected the same network
    proton-vpn # It's in it's name
    krita # An open-source drawing program
    xournalpp # An open-source (again) note taking program (but with tablet and hand writting)
    texliveMinimal # A basic LaTeX compiler
  ];

  programs.thunderbird.enable = true;
}

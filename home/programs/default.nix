{
  pkgs,
  pkgs-stable,
  ...
}: {
  imports = [
    # ./dux-files
    ./helium
    # ./kitty
    ./nvf
    ./obsidian
    ./shell
    ./nix-utils
    ./yazi
    ./wine

    ./extraPrograms.nix # I put my personally preferred programs here
  ];

  home.packages = with pkgs-stable; [
    # Misc
    tty-solitaire
    bastet
    peaclock
    cbonsai
    pipes
    cmatrix
    fastfetch
    tmux
    lavat

    # GUI
    vlc
    obs-studio
    godot
    gimp
    blanket
    thunar
    libreoffice
    qalculate-qt

    # TUI
    glow
    browsh
    dysk
    wikiman
    wiremix
    pkgs.wifitui
    pkgs.bluetui
    lazygit
    #pkgs.dux-gop

    # CLI
    httpie
    gh
    gh-dash
    figlet
    pastel
    chafa
    wl-clipboard
    playerctl
    ffmpeg
    tree
  ];
}

{
  pkgs,
  pkgs-stable,
  ...
}: {
  imports = [
    ./helium
    ./kitty
    ./nvf
    ./shell
    ./nix-utils
    ./yazi
    ./wine
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

    # GUI
    vlc
    obs-studio
    gimp
    blanket
    thunar
    libreoffice
    prismlauncher # An open source Minecraft launcher

    # TUI
    glow
    browsh
    dysk
    wikiman
    wiremix
    pkgs.wifitui
    pkgs.bluetui
    lazygit
    ffmpeg

    # CLI
    httpie
    gh
    gh-dash
    figlet
    pastel
    chafa
    wl-clipboard
  ];
}

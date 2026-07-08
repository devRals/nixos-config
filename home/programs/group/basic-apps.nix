{
  pkgs,
  pkgs-stable,
  ...
}: {
  home.packages = with pkgs-stable; [
    vlc # Video player
    obs-studio # Advanced Video Recorder and Stream manager
    gimp # Image editor
    blanket # Listen to different sounds

    # I love TUIs
    browsh # A modern text-based browser that renders anything that a modern browser can. It runs in a terminal and can be used remotely over SSH
    dysk # A terminal-based disk usage analyzer
    wikiman # Offline search engine for manual pages (arch wiki, tldr)
    wiremix # Simple TUI mixer for PipeWire
    pkgs.wifitui # TUI for managing wifi

    # I love CLIs
    httpie # Command-line HTTP client, a user-friendly cURL replacement
    gh # GitHub
    gh-dash # A terminal dashboard for GitHub
    figlet # Transform text into ASCII art
    pastel # Command-line tool to generate, analyze, convert and manipulate colors
    chafa # Image to ANSI/Unicode converter and more.
  ];
}

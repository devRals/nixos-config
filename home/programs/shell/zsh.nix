{
  pkgs,
  lib,
  config,
  ...
}: {
  home.packages = with pkgs; [
    bat
    ripgrep
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting = {
      enable = true;
      highlighters = [
        "main"
        "brackets"
        "pattern"
        "regexp"
        "root"
        "line"
      ];
    };
    historySubstringSearch.enable = true;

    history = {
      ignoreDups = true;
      save = 10000;
      size = 10000;
    };

    shellAliases = {
      # Change default
      vim = "nvim";
      vi = "nvim";
      cd = "z";
      ls = "eza --icons=always --no-quotes";
      tree = "eza --icons=always --tree --no-quotes";
      cat = "bat --theme=base16 --color=always --paging=never --tabs=2 --wrap=never --plain";
      mkdir = "mkdir -p";

      v = "nvim";
      c = "clear";
      e = "exit";
      open = "${pkgs.xdg-utils}/bin/xdg-open";

      # Typo
      clera = "clear";
      celar = "clear";
      claer = "clear";
      sl = "ls";
    };
  };
}

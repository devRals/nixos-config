{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";

    plugins = {
      git = {
        package = pkgs.yaziPlugins.git;
        setup = true;
      };
      ouch = pkgs.yaziPlugins.ouch;
      piper = pkgs.yaziPlugins.piper;
      convert = pkgs.yaziPlugins.convert;
      "jump-to-char" = pkgs.yaziPlugins."jump-to-char";
      "wl-clipboard" = pkgs.yaziPlugins."wl-clipboard";
    };

    settings.plugin = {
      prepend_fetchers = [
        {
          url = "*";
          run = "git";
          group = "git";
        }
        {
          url = "*/";
          run = "git";
          group = "git";
        }
      ];
      prepend_previewers = [
        {
          url = "*.md";
          run = ''piper -- CLICOLOR_FORCE=1 glow -w=$w -s=dark "$1"'';
        }
      ];
      prepend_openers = [
        {
          url = "*.{zip,tar,gz,bz2,xz,7z,rar}";
          run = "ouch";
        }
      ];
    };
  };
  home.packages = [pkgs.ouch];
}

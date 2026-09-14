{pkgs, ...}: {
  programs.obsidian.enable = true;
  programs.obsidian.cli.enable = true;

  programs.obsidian.defaultSettings.app = {
    vimMode = true;
    useTab = true;
    showLineNumber = true;
    spellCheck = true;
    alwaysUpdateLinks = false;
    autoPairMarkdown = true;
    showInlineTitle = true;
    autoPairBrackets = true;
    trashOption = "local"; # Move deleted files to ".trash"
    promptDelete = false;
  };
}

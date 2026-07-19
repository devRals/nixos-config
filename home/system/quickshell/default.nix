{inputs, ...}: {
  imports = [
    inputs.dqs.homeModules.default
  ];

  # This program is Work in progress. Check it out in https://codeberg.org/devRals/DQS
  programs.dqs.enable = true;
}

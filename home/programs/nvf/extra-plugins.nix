{pkgs, ...}: {
  vim.startPlugins = with pkgs.vimPlugins; [
    hex-nvim
  ];
  vim.extraPlugins = with pkgs.vimPlugins; {};
}

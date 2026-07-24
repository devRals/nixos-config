{pkgs, ...}: {
  vim.extraPlugins = with pkgs.vimPlugins; {
    my-custom-plugin = {};
  };
}

{
  vim.utility.snacks-nvim = {
    enable = true;
    setupOpts = {
      quickfile.enabled = true;
      bufdelete.enabled = true;
      gitsigns.enabled = true;
      lazygit = {
        enabled = true;
        configure = false;
      };
      terminal.enabled = true;
    };
  };
}

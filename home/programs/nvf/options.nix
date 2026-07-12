{lib, ...}: {
  vim.viAlias = true;
  vim.vimAlias = true;
  vim.options = {
    autoindent = true;
    smartindent = true;
    shiftwidth = 4;
    foldlevel = 99;
    foldcolumn = "auto:1";
    mousescroll = "ver:1,hor:1";
    mousemoveevent = true;
    fillchars = "eob:‿,fold: ,foldopen:▼,foldsep:⸽,foldclose:⏵";
    signcolumn = "yes";
    tabstop = 4;
    softtabstop = 4;
    wrap = false;
  };
  vim.clipboard = {
    enable = true;
    registers = "unnamedplus";
  };
  vim.theme = {
    transparent = lib.mkForce true;
  };
}

{pkgs, ...}: {
  vim = {
    luaConfigRC.remove-todo-keymaps = ''
      vim.keymap.del("n", "<leader>tdq")
      vim.keymap.del("n", "<leader>tdt")
    '';
    undoFile.enable = true;
    notes.todo-comments.enable = true;

    autocomplete = {
      nvim-cmp = {
        enable = true;
        sources = {
          buffer = "[Buffer]";
          path = "[Path]";
        };
        sourcePlugins = [
          pkgs.vimPlugins.cmp-cmdline
        ];
        mappings = {
          next = "<C-n>";
          previous = "<C-p>";
        };
      };
    };

    snippets.luasnip.enable = true;
    ui = {
      noice.enable = true;
      colorizer.enable = true;
    };

    presence.neocord.enable = true;
  };
}

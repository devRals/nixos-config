{
  vim.globals.mapleader = " ";
  vim.keymaps = [
    {
      key = "K";
      mode = "n";
      silent = true;
      action = "<cmd>lua vim.lsp.buf.hover()<cr>";
      desc = "LSP Hover";
    }
    {
      key = "L";
      mode = "n";
      silent = true;
      action = "<cmd>bnext<cr>";
      desc = "Next Buffer";
    }
    {
      key = "H";
      mode = "n";
      silent = true;
      action = "<cmd>bprevious<cr>";
      desc = "Previous Buffer";
    }
    {
      key = "<leader>bd";
      mode = "n";
      silent = true;
      action = "<cmd>bdelete<cr>";
      desc = "Delete Buffer";
    }
    {
      key = "<leader>e";
      mode = ["n" "v"];
      silent = true;
      action = "<cmd>lua MiniFiles.open()<cr>";
      desc = "File manager";
    }

    # Format
    {
      key = "<leader>lf";
      mode = "n";
      silent = true;
      action = "<cmd>lua require('conform').format({ async = true, lsp_format = 'fallback' })<cr>";
      desc = "Format file";
    }

    # Terminal
    {
      key = "<leader>tt";
      mode = "n";
      silent = true;
      action = "<cmd>lua Snacks.terminal.toggle()<cr>";
      desc = "Toggle terminal";
    }
    {
      key = "<leader>tf";
      mode = "n";
      silent = true;
      action = "<cmd>lua Snacks.terminal.toggle(nil, { style = 'float' })<cr>";
      desc = "Toggle terminal (float)";
    }
    {
      key = "<leader>tg";
      mode = "n";
      silent = true;
      action = "<cmd>lua Snacks.lazygit()<cr>";
      desc = "Lazygit";
    }

    # UI
    {
      key = "<leader>uw";
      mode = "n";
      silent = true;
      action = "<cmd>set wrap!<cr>";
      desc = "Toggle word wrapping";
    }
    {
      key = "<leader>ul";
      mode = "n";
      silent = true;
      action = "<cmd>set linebreak!<cr>";
      desc = "Toggle linebreak";
    }
    {
      key = "<leader>us";
      mode = "n";
      silent = true;
      action = "<cmd>set spell!<cr>";
      desc = "Toggle spellLazyGitcheck";
    }
    {
      key = "<leader>uc";
      mode = "n";
      silent = true;
      action = "<cmd>set cursorline!<cr>";
      desc = "Toggle cursorline";
    }
    {
      key = "<leader>un";
      mode = "n";
      silent = true;
      action = "<cmd>set number!<cr>";
      desc = "Toggle line numbers";
    }
    {
      key = "<leader>ur";
      mode = "n";
      silent = true;
      action = "<cmd>set relativenumber!<cr>";
      desc = "Toggle relative line numbers";
    }

    # Todos
    {
      key = "<leader>xt";
      mode = "n";
      silent = true;
      action = "<cmd>TodoTrouble<cr>";
      desc = "Todo (Trouble)";
    }

    # QOL
    {
      key = ">";
      mode = "v";
      silent = true;
      action = ">gv";
      desc = "Indent and keep selection";
    }
    {
      key = "<";
      mode = "v";
      silent = true;
      action = "<gv";
      desc = "Dedent and keep selection";
    }

    # Move
    {
      key = "<C-h>";
      mode = "n";
      silent = true;
      action = "<C-w>h";
      desc = "Move to left window";
    }
    {
      key = "<C-j>";
      mode = "n";
      silent = true;
      action = "<C-w>j";
      desc = "Move to bottom window";
    }
    {
      key = "<C-k>";
      mode = "n";
      silent = true;
      action = "<C-w>k";
      desc = "Move to top window";
    }
    {
      key = "<C-l>";
      mode = "n";
      silent = true;
      action = "<C-w>l";
      desc = "Move to right window";
    }

    # Save
    {
      key = "<C-s>";
      mode = [
        "n"
        "i"
        "v"
      ];
      silent = true;
      action = "<cmd>w<cr>";
      desc = "Save file";
    }

    # Resize
    {
      key = "<C-Down>";
      mode = [
        "n"
        "i"
        "v"
      ];
      silent = true;
      action = "<cmd>resize +1<cr>";
      desc = "Horizontal Resize +1";
    }
    {
      key = "<C-Up>";
      mode = [
        "n"
        "i"
        "v"
      ];
      silent = true;
      action = "<cmd>resize -1<cr>";
      desc = "Horizontal Resize -1";
    }
    {
      key = "<C-Right>";
      mode = [
        "n"
        "i"
        "v"
      ];
      silent = true;
      action = "<cmd>vertical resize +1<cr>";
      desc = "Vertical Resize +1";
    }
    {
      key = "<C-Left>";
      mode = [
        "n"
        "i"
        "v"
      ];
      silent = true;
      action = "<cmd>vertical resize -1<cr>";
      desc = "Vertical Resize -1";
    }
  ];
}

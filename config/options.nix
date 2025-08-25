{
  # Options
  enableMan = true;

  globals = {
    mapleader = " ";
    maplocalleader = " ";
    have_nerd_font = true;
  };

  opts = {
    # Line Numbers
    number = true;
    # Enable Mouse support
    mouse = "a";
    showmode = false;
    clipboard = "unnamedplus";
    breakindent = true;
    undofile = true;
    # Cases in search
    ignorecase = true;
    smartcase = true;
    hlsearch = true;

    signcolumn = "yes";
    updatetime = 250;
    timeoutlen = 300;
    # Insert new splits
    splitright = true;
    splitbelow = true;
    # Display whitespace like for which-key
    list = true;
    listchars = {
      tab = "» ";
      trail = "·";
      nbsp = "␣";
    };

    inccommand = "split";
    cursorline = true;
    scrolloff = 10;

    # Spell check
    spelllang = "en";
    spell = true;
    fileformats = "unix,dos,mac";
  };

  keymaps = [
    # Clear highlight on search
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>nohlsearch<CR>";
    }
    # Diagnostics
    {
      mode = "n";
      key = "[d";
      action = "vim.diagnostic.goto_prev";
      options = { desc = "Go to previous [D]iagnostic message"; };
    }
    {
      mode = "n";
      key = "]d";
      action = "vim.diagnostic.goto_next";
      options = { desc = "Go to next [D]iagnostic message"; };
    }
    {
      mode = "n";
      key = "<leader>e";
      action = "vim.diagnostic.open_float";
      options = { desc = "Show diagnostic [E]rror message"; };
    }
    {
      mode = "n";
      key = "<leader>q";
      action = "vim.diagnostic.setloclist";
      options = { desc = "Open diagnostic [Q]uickfix list"; };
    }
    # Exit terminal mode
    {
      mode = "t";
      key = "<Esc><Esc>";
      action = "<C-\\><C-n>";
      options = { desc = "Exit terminal mode"; };
    }
    # Move focus between window splits
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w><C-h>";
      options = { desc = "Move focus to the left window"; };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w><C-l>";
      options = { desc = "Move focus to the right window"; };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w><C-k>";
      options = { desc = "Move focus to the top window"; };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w><C-j>";
      options = { desc = "Move focus to the bottom window"; };
    }

  ];
}

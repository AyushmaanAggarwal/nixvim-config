{
  # Options
  enableMan = true;
  clipboard.providers.wl-copy.enable = true;

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
    fixendofline = false;
  };

}

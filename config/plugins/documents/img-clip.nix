{
  plugins.img-clip = {
    enable = true;
    settings = {
      default = {
        dir_path = "assets";
        file_name = "%y-%m-%d-%h-%m-%s";
        relative_to_current_file = true;
        template = "$file_path";
        use_absolute_path = false;
      };

      filetypes = {
        markdown = {
          template = "![$CURSOR]($FILE_PATH)";
          download_images = true;
        };

        vimwiki = {
          template = "![$CURSOR]($FILE_PATH)";
          download_images = true;
        };

        html = {
          template = ''img src="$FILE_PATH" alt="$CURSOR">'';
        };

        tex = {
          relative_template_path = true;
          template = ''
            [[
            \begin{figure}[h]
              \centering
              \includegraphics[width=0.8\textwidth]{$FILE_PATH}
              \caption{$CURSOR}
              \label{fig:$LABEL}
            \end{figure}
            ]]'';
          download_images = true;
        };
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>pp";
      action = "<cmd>PasteImage<CR>";
      options.desc = "[P]aste Image";
    }
  ];
}

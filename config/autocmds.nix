{
  autoCmd = [
    {
      desc = "Auto-compile Markdown files after saving";
      callback.__raw = ''
        function()
          if (not string.match(vim.fn.getcwd(), "Obsidian")) and (not string.match(vim.fn.getcwd(), "README.md")) then
              local raw_file_name = vim.api.nvim_buf_get_name(0)
              local file_name = raw_file_name:gsub('%s', '\\ ')
              local raw_file_pdf = string.sub(raw_file_name, 1, -3) .. "pdf"
              local file_pdf = raw_file_pdf:gsub('%s', '\\ ')
              vim.cmd(string.format(":!pandoc -s %s -o %s --pdf-engine=pdflatex", file_name, file_pdf))
            end
          end
      '';
      event = [
        "BufWritePost"
      ];
      pattern = [
        "*.md"
      ];
    }
  ];
}

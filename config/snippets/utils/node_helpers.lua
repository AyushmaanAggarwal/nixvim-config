local M = {}

function M.date()
  -- Get date in Month/Day/Year format
  return { os.date("%m/%d/%Y") }
end

function M.get_file_number()
  -- Get last number in file path
  return string.match(vim.fn.expand("%"), "%d+$")
end

return M

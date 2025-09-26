local ls = require("luasnip")
local s = ls.snippet -- local sn = ls.snippet_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
-- local c = ls.choice_node
-- local r = ls.restore_node
local rep = extras.rep
-- local m = extras.match

local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local make_condition = require("luasnip.extras.conditions").make_condition

local template = require("utils/templates")

local function is_start_of_file()
  -- Ensure that this is only run at beginning of file
  return (vim.fn.line("$") == 1)
end
local is_start_of_file_cond = make_condition(is_start_of_file)

local file_template = function(text, choices)
  return function(args)
    print(text)
    print(choices)
    for file_regex, file_template in ipairs(text) do
      print(file_regex)
      if string.find(vim.fn.expand("%"), file_regex) then
        return s(file_template, choices[file_regex])
      end
    end
  end
end

return {
  s(
    { trig = "t", name = "template autotrigger" },
    fmta([[<>]], { d(1, file_template(template_text, template_choices), {}) })
  ),
}, {}

local ls = require("luasnip")
local s = ls.snippet -- local sn = ls.snippet_node
local sn = ls.snippet_node
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
local d = ls.dynamic_node
-- local c = ls.choice_node
-- local r = ls.restore_node
local rep = extras.rep
-- local m = extras.match

local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local make_condition = require("luasnip.extras.conditions").make_condition

local function is_start_of_file()
  -- Ensure that this is only run at beginning of file
  return (vim.fn.line("$") == 1)
end
local is_start_of_file_cond = make_condition(is_start_of_file)

local function date()
  -- Get date in Month/Day/Year format
  return { os.date("%m/%d/%Y") }
end

local function get_file_number()
  -- Get last number in file path
  return string.match(vim.fn.expand("%"), "%d+$")
end

local function file_template(args, parent, user_args)
  local template_text = {}
  local template_choices = {}

  -- Markdown Templates
  template_text["EECS-194/lab"] = [[
      ---
      title: EE194 - Lab <>
      author: Ayushmaan Aggarwal
      date: <>
      toc: true
      header-includes: |
        \usepackage{amsmath}
      ---
      \newpage
  
      # Question 1
  
      ]]
  template_choices["EECS-194/lab"] = { i(1), f(date, {}) }

  template_text["EECS-194/hw"] = [[
      ---
      title: EE194- Homework <>
      author: Ayushmaan Aggarwal
      date: <>
      toc: true
      header-includes: |
        \usepackage{amsmath}
        \usepackage{float}
        \let\origfigure\figure
        \let\endorigfigure\endfigure
        \renewenvironment{figure}[1][2] {
            \expandafter\origfigure\expandafter[H]
        } {
            \endorigfigure
        }
      ---
  
      \newpage
  
      # Problem 1
  
      ]]
  template_choices["EECS-194/hw"] = { f(get_file_number, {}), f(date, {}) }

  template_text["EECS-151/hw"] = [[
      ---
      title: EE151 - Homework <>
      author: Ayushmaan Aggarwal
      date: <>
      toc: true
      header-includes: |
        \usepackage{amsmath}
        \usepackage{float}
        \let\origfigure\figure
        \let\endorigfigure\endfigure
        \renewenvironment{figure}[1][2] {
            \expandafter\origfigure\expandafter[H]
        } {
            \endorigfigure
        }
      ---
  
      \newpage
  
      # Problem 1
  
      ]]
  template_choices["EECS-151/hw"] = { i(1), f(date, {}) }

  for regex, text in pairs(template_text) do
    if string.find(vim.fn.expand("%"), regex) then
      return sn(2, fmta(text, { i(3), f(date, {}) }))
    end
  end
end

return {
  s({ trig = "t", name = "template autotrigger" }, { d(1, file_template) }),
}, {}

local ls = require("luasnip")
local s = ls.snippet -- local sn = ls.snippet_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
-- local c = ls.choice_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local extras = require("luasnip.extras")
-- local l = extras.lambda
local rep = extras.rep
-- local m = extras.match
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local make_condition = require("luasnip.extras.conditions").make_condition

local date = function()
  return { os.date("%m/%d/%Y") }
end

local function file_template(args, snip)
  for file_regex, file_template in ipairs(template_text) do
    if string.find(vim.fn.expand("%"), file_regex) then
      return s(file_template, template_choices[file_regex])
    end
  end
end

local function is_start_of_file()
  -- Ensure that this is only run at beginning of file
  return (vim.fn.line("&") == 1)
end
local is_start_of_file_cond = make_condition(is_start_of_file)

local get_file_number = function()
  -- Get last number in file path
  return string.match(vim.fn.expand("%"), "%d+$")
end

local template_text = {}
local template_choices = {}
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

return {}, {
  s(
    { trig = "t", name = "template autotrigger" },
    fmta([[<>]], { d(1, file_template) }),
    { condition = is_start_of_file_cond, show_condition = is_start_of_file_cond }
  ),
}

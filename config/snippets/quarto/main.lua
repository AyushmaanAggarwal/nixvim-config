local ls = require("luasnip")
local s = ls.snippet -- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
-- local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local extras = require("luasnip.extras")
-- local l = extras.lambda
local rep = extras.rep
-- local p = extras.partial
-- local m = extras.match
-- local n = extras.nonempty
-- local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require("luasnip.extras.expand_conditions")
-- local postfix = require("luasnip.extras.postfix").postfix
-- local types = require("luasnip.util.types")
-- local parse = require("luasnip.util.parser").parse_snippet
-- local ms = ls.multi_snippet
-- local k = require("luasnip.nodes.key_indexer").new_key
local date = function() return {os.date('%m/%d/%Y')} end

function count_in_file(word)
  local status, result = pcall(function() return vim.api.nvim_exec2(":%s/" .. word .. "//ng", {output=true}) end)
  if status then -- if no errors occured
    return string.match(result["output"], "%d+") -- first number in "_ matches on _ lines"
  else
    return 0
  end
end

local problem_count = function() return {tostring(count_in_file("# Problem"))} end


return {
  s({ trig = "math", name = "Metadata for Math HW" }, fmta([[
    ---
    title: "Math W128A - Homework <>"
    author: "Ayushmaan Aggarwal"
    date: <>
    execute:
      cache: true
    format:
      pdf:
        toc: true
        number-sections: true
        colorlinks: true
        include-in-header:
          - text: |
              \usepackage{amsmath}
              \usepackage{upgreek}
              \newcommand{\lcm}{\operatorname{lcm}}
              \newcommand{\Aut}{\operatorname{Aut}}
              \newcommand{\R}{\mathbb R}
              \newcommand{\C}{\mathbb C}
              \newcommand{\N}{\mathbb N}
              \newcommand{\Q}{\mathbb Q}
              \newcommand{\Z}{\mathbb Z}
              \newcommand{\norm}{\trianglelefteq}
              \newcommand{\lt}{\ensuremath <<}
              \newcommand{\gt}{\ensuremath >>}
              \renewcommand{\P}{\mathbb P}
              \renewcommand{\l}{\langle}
              \renewcommand{\r}{\rangle}
              \renewcommand{\Re}{\operatorname{Re}}
              \renewcommand{\Im}{\operatorname{Im}}
 
    jupyter: jupyter_matlab_kernel
    ---
   
    Self Grade: 2

    \newpage

    # Problem 1

    ]], {i(1), f(date, {})})),

  s({ trig = "code", name = "psuedocode block" }, fmta([[
    ```{matlab}
    <>
    ```
    ]], {i(1)})),


}, {
}

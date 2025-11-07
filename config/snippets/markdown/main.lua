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
local date = function()
  return { os.date("%m/%d/%Y") }
end

function count_in_file(word)
  local status, result = pcall(function()
    return vim.api.nvim_exec2(":%s/" .. word .. "//ng", { output = true })
  end)
  if status then -- if no errors occured
    return string.match(result["output"], "%d+") -- first number in "_ matches on _ lines"
  else
    return 0
  end
end

local problem_count = function()
  return { tostring(count_in_file("# Problem")) }
end

return {
  s(
    { trig = "lab", name = "Metadata for Lab Report" },
    fmta(
      [[
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

    ]],
      { i(1), f(date, {}) }
    )
  ),

  s(
    { trig = "hw194", name = "Metadata for 194 HW" },
    fmta(
      [[
    ---
    title: EE194- Homework <>
    author: Ayushmaan Aggarwal
    date: <>
    toc: true
    header-includes: |
      \usepackage{amsmath}
      \usepackage{xcolor}
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

    ]],
      { i(1), f(date, {}) }
    )
  ),

  s(
    { trig = "hw151", name = "Metadata for Math HW" },
    fmta(
      [[
    ---
    title: EE151 - Homework <>
    author: Ayushmaan Aggarwal
    date: <>
    toc: true
    header-includes: |
      \usepackage{amsmath}
      \usepackage{circuitikz}
      \usepackage{xcolor}
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

    ]],
      { i(1), f(date, {}) }
    )
  ),

  s(
    { trig = "code", name = "psuedocode block" },
    fmt(
      [[
    ```verilog
    {}
    ```
    ]],
      { i(1) }
    )
  ),

  s({ trig = "\\\\", name = "comment" }, fmt([[<!-- {} -->]], { i(1) })),
  s(
    { trig = "new", name = "newpage" },
    fmt(
      [[

  \newpage

  ]],
      {}
    )
  ),

  s({ trig = "red", name = "red text" }, fmta([[\textcolor{red}{<>}]], { i(1) })),
  s({ trig = "green", name = "green text" }, fmta([[\textcolor{green}{<>}]], { i(1) })),
  s({ trig = "blue", name = "blue text" }, fmta([[\textcolor{blue}{<>}]], { i(1) })),
}, {}

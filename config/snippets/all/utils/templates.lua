local ls = require("luasnip")
local h = require("utils.node_helpers")
local i = ls.insert_node
local f = ls.function_node

local M = {}

M.template_text = {}
M.template_choices = {}

-- Markdown Templates
M.template_text["EECS-194/lab"] = [[
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
M.template_choices["EECS-194/lab"] = { i(1), f(h.date, {}) }

M.template_text["EECS-194/hw"] = [[
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
M.template_choices["EECS-194/hw"] = { f(h.get_file_number, {}), f(h.date, {}) }

M.template_text["EECS-151/hw"] = [[
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
M.template_choices["EECS-151/hw"] = { i(1), f(h.date, {}) }

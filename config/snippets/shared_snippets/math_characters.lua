local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

--TODO: Need to add \lim, better fraction support,

return {
  s("ep", t([[\epsilon]])),
  s("al", t([[\alpha]])),
  s("be", t([[\beta]])),
  s("ga", t([[gamma]])),
  s("la", t([[\lambda]])),
  s("inf", t([[\infty]])),
  s("ap", t([[\approx]])),
  s("pr", t([[\prod]])),
  s("ka", t([[\kappa]])),
  -- case dependent
  s("de", t([[\delta]])),
  s("De", t([[\Delta]])),
  s("si", t([[\sigma]])),
  s("Si", t([[\Sigma]])),
  s("om", t([[\omega]])),
  s("Om", t([[\Omega]])),
  -- operators
  s("op", t([[\hat ]])),
  s("til", t([[\tilde ]])),
  s("der", t([[\dot]])),
  s("dder", t([[\ddot]])),
  s("ddder", t([[\dddot]])),
  -- special characters
  s("dw", t([[\Delta w]])),
  s("vr", t([[\vec r]])), -- Vector R
  s("osi", t([[\hat \sigma]])), -- Operator Sigma
}, {
  s("qed", t([[$\square$]])),
  s("rar", t([[\rightarrow]])),
}

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

return {
  s(
    { trig = "alwaysall", name = "always @(*) block" },
    fmta(
      [[
      always @(*) begin \\ use =
        <>
      end
    ]],
      { i(1) }
    )
  ),

  s(
    { trig = "alwayspos", name = "always @(positive clock) block" },
    fmt(
      [[
      always @(posedge clk) begin
        {}
      end
    ]],
      { i(1) }
    )
  ),

  s(
    { trig = "if", name = "if block" },
    fmta(
      [[
      if (<>) begin
        <>
      end
    ]],
      { i(1), i(2) }
    )
  ),
  s(
    { trig = "ifel", name = "if block" },
    fmta(
      [[
      if (<>) begin
        <>
      end else begin
        <>
      end
    ]],
      { i(1), i(2), i(3) }
    )
  ),
  s(
    { trig = "case", name = "case block" },
    fmta(
      [[
      case (<>)
        <>: <>
        default: <>
      endcase
    ]],
      { i(1), i(2), i(3), i(4) }
    )
  ),
  s(
    { trig = "generate", name = "generate block" },
    fmt(
      [[
    genvar i;

    generate
        for (i = 0; i < {}; i = i + 1) begin: {}
          {}
        end
    endgenerate
      ]],
      { i(1), i(2, "label"), i(3) }
    )
  ),

  s({ trig = "assign", name = "assign statement" }, fmta([[assign <> = <>;]], { i(1), i(2) })),
}, {}

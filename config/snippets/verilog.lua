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
  s(
    { trig = "local", name = "local statement" },
    fmta([[localparam <> = <>'b0;]], { i(1, "DEFAULT_STATE"), i(2, "1") })
  ),
  s(
    { trig = "generate", name = "generate block" },
    fmt([[
      // 1. Define state registers (state, next_state, with proper bitwidths).
      
      // 2. Define state names as localparams (optional but recommended to make your code clean).
      localparam DEFAULT_STATE = 2'b00;
      
      // 3. Declare regs for output that will be produced by the combinational block.
      reg output_1_int; // int for internal.
      assign output_1 = output_1_int;

      // 4. An always@(posedge clk) block to handle state assignment.
      always @ (posedge clk) begin
          state <= next_state; // For this example, this is the only line that should be in this block. For reset, see the combinational block below.
        // Note that any sequential (flipflops) elements must be in posedge clk block (counter, accumulator, state etc.).
      end
      
      // 5. One or more always@(*) blocks to handle 1) output for each state and 2) state transition logic (both of them may also depend on input).
      always @ (*) begin
          if(reset)begin
              next_state = DEFAULT_STATE; 
          end else begin
              case(state)
                  DEFAULT_STATE: begin
                      output_1_int = 1'b1;
                      if(input_1) next_state = ...;
                      else next_state = ...;
                  end
              endcase
          end 
      end
      ]], {}),

}, {}

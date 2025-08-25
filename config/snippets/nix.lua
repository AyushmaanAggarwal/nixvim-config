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

return {
  -- Default Configuration
  s({ trig = "nix", name = "Default nix configuration" }, fmta([[
      {
        inputs,
        config,
        pkgs,
        lib,
        desktop,
        hostname,
        system,
        username,
        ...
      }: {
        <>
      }
    ]], {i(1)})),

 s({ trig = "full", name = "Import config" }, fmta([[
      {
        inputs,
        config,
        pkgs,
        lib,
        desktop,
        hostname,
        system,
        username,
        ...
      }: {
        imports = [ 
          <> 
        ];
        options = {
          <>.enable = lib.mkOption {
            type = lib.types.bool;
            description = "Enable <>";
            default = false;
          };
        };
        config = lib.mkIf (config.<>.enable) {
          <>
        };
      }
    ]], {i(1), i(2), rep(2), rep(2), i(3)})),

  -- Import Configuration
  s({ trig = "imports", name = "Import config" }, fmta([[
      imports = [ <> ];
    ]], {i(1)})),

  s({ trig = "let", name = "Let-In statement" }, fmta([[
      let
        <>
      in
    ]], {i(1)})),


  -- Make Options
  s({ trig = "booloption", name = "Make Option" }, fmta([[
      <>.enable = lib.mkOption {
        type = lib.types.bool;
        description = "Enables <>";
        default = false;
      };
    ]], {i(1), rep(1)})),
   s({ trig = "stringoption", name = "Make Option" }, fmta([[
      <>.<> = lib.mkOption {
        type = lib.types.str;
        description = "<>";
        default = "<>";
      };
    ]], {i(1, "<service>"), i(2, "<option>"), i(3), i(4)})),
    s({ trig = "portoption", name = "Make Option" }, fmta([[
      <>.<> = lib.mkOption {
        type = lib.types.port;
        description = "Set port for <>";
        default = <>;
      };
    ]], {i(1, "<service>"), i(2, "<option>"), rep(1), i(3, "8080")})),
    s({ trig = "pass", name = "Add Sops Secret" }, fmta([[
      config.sops.secrets.<>.path
    ]], {i(1, "<name>")})),


}, {
}

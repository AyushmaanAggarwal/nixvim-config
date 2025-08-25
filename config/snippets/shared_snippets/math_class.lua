local ls = require("luasnip")
local s = ls.snippet -- local sn = ls.snippet_node
local i = ls.insert_node
local f = ls.function_node
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
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
  -- Generic Problem Snippets
  s({ trig = "prob", name = "Problem for Math HW" }, fmta([[
    # Problem <>


    ]], {f(problem_count, {})})),

  s({ trig = "part", name = "Part" }, fmt([[### Part {}]],
    {i(1)})),
 
  s({ trig = "fig", name = "Insert Figure" }, fmta([[![<>](./<>){width=300px}]],
    {i(1), i(2)})),

  s({ trig = "inter", name = "_ in interval" }, fmta([[$<> \in [<>, <>]$]],
    {i(1), i(2), i(3)})),

  s({ trig = "inter_wo", name = "_ in interval" }, fmta([[$<> \in (<>, <>)$]],
    {i(1), i(2), i(3)})),

  s({ trig = "cont", name = "Continous Function" }, fmta([[$<> \in C[a, b]$]],
    {i(1)})),

  s({ trig = "theo", name = "Theorem Format" }, fmt([[
    **Theorem:{}**

    > {}
    ]], {i(1), i(2)})),

  s({ trig = "np", name = "Theorem Format" }, fmta([[

    \newpage

    ]], {})),



   
  -- Matlab Snippets
  s({ trig = "print", name = "Print" }, fmta([[fprintf('<>')]],
    {i(1)})),

  s({ trig = "float", name = "Print Float" }, fmt([[%18.15]], {})),
  
  s({ trig = "matfig", name = "Insert Figure" }, fmta([[
    h1<> = figure(<>);
    plot(x,y)
    set(h<>,'Position',[10 10 450 200])
  ]], {i(1), rep(1), rep(1)})),

}, {
  s({ trig = "ooo", name = "Runtime" }, fmta([[$O(<>)$]], {i(1)})),
}

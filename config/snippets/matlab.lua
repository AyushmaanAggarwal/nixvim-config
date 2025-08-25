return {
    s("if", fmt([[
    if {}
        {}
    elseif {}
        {}
    else
        {}
    ]], {i(1), i(2), i(3), i(4), i(5)})),

    s("for", fmt([[
    for {} = {}:{}
        {}
    end
    ]], {i(1), i(2), i(3), i(4)})),

}, {

}

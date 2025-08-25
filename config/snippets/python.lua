return {
    s("if", fmt([[
    if {}:
        {}
    else:
        {}]], {i(1), i(2), i(3)})),

    s("try", fmt([[
    try:
        {}
    except {} as e:
        {}]], {i(1), i(2), i(3)})),

    s("main", fmt([[
    if __name__=="__main__":
        {}
    ]], { i(1) })),

}, {

}

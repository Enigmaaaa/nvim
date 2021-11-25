local print1 =function()
    print('11111111')
    
end
load_in_vscode({
    function ()
        print('working')
    end,
    print1
})
load_in_nvim({
    function ()
        print('working')
    end,
    print1
})
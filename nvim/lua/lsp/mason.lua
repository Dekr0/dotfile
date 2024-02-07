local mason = function()
    require("mason").setup({
        max_concurrent_installers = 10
    })

    print("Mason  ")
end

return mason

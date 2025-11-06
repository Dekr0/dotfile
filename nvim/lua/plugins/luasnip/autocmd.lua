local setup_autocmd = function()
    vim.api.nvim_create_autocmd("InsertLeave", {
        callback = function()
            local has_current_nodes = require("luasnip")
                .session
                .current_nodes[vim.api.nvim_get_current_buf()]
            local jump_active = require("luasnip").session.jump_active
            if has_current_nodes and not jump_active
                then
                    require("luasnip").unlink_current()
                end
        end,
    })
end

return setup_autocmd

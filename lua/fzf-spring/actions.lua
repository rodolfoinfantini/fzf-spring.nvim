local U = require "fzf-spring.util"

return function(selected)
    local endpoint = selected[1]
    if not endpoint then
        return
    end

    local spring_preview_table = U.get_spring_priview_table()
    local path = spring_preview_table[endpoint].path

    vim.cmd("edit " .. path)

    local bufnr = vim.fn.bufnr()
    vim.api.nvim_set_current_buf(bufnr)

    vim.schedule(function()
        U.set_cursor_on_entry(spring_preview_table[endpoint], bufnr)
    end)
    return true
end

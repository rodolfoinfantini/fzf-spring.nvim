local U = require "fzf-spring.util"

local builtin = require("fzf-lua.previewer.builtin")

local MyPreviewer = builtin.buffer_or_file:extend()

function MyPreviewer:new(o, opts, fzf_win)
    MyPreviewer.super.new(self, o, opts, fzf_win)
    setmetatable(self, MyPreviewer)
    return self
end

function MyPreviewer:parse_entry(entry_str)
    local spring_preview_table = U.get_spring_priview_table()
    local endpoint = entry_str

    local path = spring_preview_table[endpoint].path
    local line_number = spring_preview_table[endpoint].line_number
    local column = spring_preview_table[endpoint].column

    return {
        path = path,
        line = line_number,
        col = column,
    }
end

return MyPreviewer

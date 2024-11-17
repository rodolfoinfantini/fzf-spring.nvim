local U = require "fzf-spring.util"
local E = require "fzf-spring.enum"
local A = require "fzf-spring.actions"
local P = require "fzf-spring.previewer"
local fzf = require "fzf-lua"

local create_find_table = function(annotation)
    U.create_spring_find_table(E.annotation.REQUEST_MAPPING)
    U.create_spring_find_table(annotation)
end
local create_preview_table = function(annotation)
    U.create_spring_preview_table(annotation)
end

return function(selected_method)
    U.set_spring_tables()
    local annotation = U.get_annotation(selected_method)

    create_find_table(annotation)
    local spring_finder_table = U.get_spring_find_table()
    local finder_results = {}

    for path, mapping_object in pairs(spring_finder_table) do
        local request_mapping_value = U.get_request_mapping_value(path)
        -- local request_mapping_line_number = U.get_request_mapping_line_number(path)
        if mapping_object[annotation] then
            local method = U.get_method(annotation)
            for _, mapping_item in ipairs(mapping_object[annotation]) do
                local method_mapping_value = mapping_item.value or ""
                local endpoint = method .. " " .. request_mapping_value .. method_mapping_value
                table.insert(finder_results, endpoint)
            end
        end
    end

    local result = U.check_duplicate(finder_results)

    create_preview_table(annotation)

    fzf.fzf_exec(result, {
        prompt = E.prompts[selected_method],
        actions = {
            ["default"] = A
        },
        previewer = P
    })
end

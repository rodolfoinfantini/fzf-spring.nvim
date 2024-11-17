local fzf = require('fzf-lua')
local picker = require('fzf-spring.picker')

return function()
    fzf.fzf_exec({
        "GET", "POST", "PUT", "DELETE", "PATCH"
    }, {
        prompt = "Method: ",
        actions = {
            ["default"] = function(selected)
                local method = selected[1]
                if not method then
                    return
                end

                picker(method)
            end
        }
    })
end

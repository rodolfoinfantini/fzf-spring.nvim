local M = {}

local E = require "fzf-spring.enum"
local S = require "fzf-spring.selector"
local picker = require "fzf-spring.picker"

M.pick_spring = function()
    S()
end
M.pick_get_mapping = function()
    picker(E.methods.GET)
end
M.pick_post_mapping = function()
    picker(E.methods.POST)
end
M.pick_put_mapping = function()
    picker(E.methods.PUT)
end
M.pick_delete_mapping = function()
    picker(E.methods.DELETE)
end
M.pick_patch_mapping = function()
    picker(E.methods.PATCH)
end

M.setup = function()
    vim.api.nvim_create_user_command("Spring", function()
        M.pick_spring()
    end, {})
    vim.api.nvim_create_user_command("SpringGet", function()
        M.pick_get_mapping()
    end, {})
    vim.api.nvim_create_user_command("SpringPost", function()
        M.pick_post_mapping()
    end, {})
    vim.api.nvim_create_user_command("SpringPut", function()
        M.pick_put_mapping()
    end, {})
    vim.api.nvim_create_user_command("SpringDelete", function()
        M.pick_delete_mapping()
    end, {})
    vim.api.nvim_create_user_command("SpringPatch", function()
        M.pick_patch_mapping()
    end, {})
end

return M

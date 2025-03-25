-- Functionality functions

local M = {}

local default_config = {
    keymap = "<Leader>ff",
}

M.setup = function(config)
    config = config or {}
    config = vim.tbl_deep_extend('force', default_config, config)

    -- Keymaps
    vim.keymap.set('n', config.keymap, M.invert, { desc = 'Invert boolean at cursor. "[f]lip [f]lop"', remap = false })
end

M.invert = function()
    local currentWord = vim.call('expand', '<cword>')
    local replaceWord

    if string.lower(currentWord) == 'true' then
        replaceWord = 'false'
    elseif string.lower(currentWord) == 'false' then
        replaceWord = 'true'
    else
        return
    end

    -- Only supports all caps or first letter uppercase. Other situations shouldn't matter.
    if currentWord == string.upper(currentWord) then
        -- Preserve ALL CAPS if applicable
        replaceWord = string.upper(replaceWord)
    elseif currentWord == currentWord:gsub("^%l", string.upper) then
        -- Preserve first letter case if applicable
        replaceWord = replaceWord:gsub("^%l", string.upper)
    end

    local cursorPosition = vim.fn.getpos('.')
    vim.cmd("normal! \"_ciw" .. replaceWord)
    vim.fn.setpos('.', cursorPosition)
end

-- Commands
vim.api.nvim_create_user_command(
    'TFInvert',
    M.invert,
    { bang = true, desc = 'Invert boolean at cursor.' }
)

return M

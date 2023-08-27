-- Functionality functions
local function truefalseinvert()
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

    vim.cmd("normal! \"_ciw" .. replaceWord)
end

-- Commands
vim.api.nvim_create_user_command(
    'TFInvert',
    truefalseinvert,
    {bang = true, desc = 'Invert boolean at cursor.'}
)

-- Keymaps
vim.keymap.set('n', '<Leader>ff', truefalseinvert, {desc = 'Invert boolean at cursor. "[f]lip [f]lop"', remap = false})

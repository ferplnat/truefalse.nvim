-- Setup function
local function setup(parameters)
end

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

    -- Preserve first letter case if applicable
    if currentWord == currentWord:gsub("^%l", string.upper) then
        replaceWord = replaceWord:gsub("^%l", string.upper)
    end

    vim.cmd("normal! \"_ciw" .. replaceWord)
end

-- Commands
vim.api.nvim_create_user_command(
    'TFInvert',
    truefalseinvert,
    {bang = true, desc = 'a new command to do the thing'}
)

-- Keymaps
vim.keymap.set('n', '<Leader>ff', truefalseinvert, {desc = 'Invert boolean. "[f]lip [f]lop"', remap = false})

-- Return the functions that should be exposed
return {
    setup = setup,
}

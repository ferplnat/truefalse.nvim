-- Setup function
local function setup(parameters)
end

-- Functionality functions
local function truefalseinvert()
    local currentWord = vim.call('expand', '<cword>')
    local replaceWord

    -- TODO: preserve case when replacing
    if string.lower(currentWord) == 'true' then
        replaceWord = 'false'
    elseif string.lower(currentWord) == 'false' then
        replaceWord = 'true'
    else
        return
    end

    -- true
    -- TruE
    -- false
    -- False
    print(replaceWord)
end

-- Commands
vim.api.nvim_create_user_command(
    'TFInvert',
    truefalseinvert,
    {bang = true, desc = 'a new command to do the thing'}
)

-- Keymaps
vim.keymap.set('n', '<Leader>ff', ':TFInvert<Return>', {desc = 'Flip flop shit.', remap = false})

-- Return the functions that should be exposed
return {
    setup = setup,
}

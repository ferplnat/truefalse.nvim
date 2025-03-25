## Invert boolean values at your cursor!
This is a suuuuuper simple Neovim plugin that I made -- mostly just to figure out
the anatomy of a Neovim plugin.

## Configuration

```lua
require('truefalse').setup({
    keymap = '<Leader>ff' -- Default, just a config example.
})
```

## Usage
`<Leader>ff` -- This is the default bind to 'flip flop' boolean values at your 
cursor

`:TFInvert` is the command; for your remapping pleasure.

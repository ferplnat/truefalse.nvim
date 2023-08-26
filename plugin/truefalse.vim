" Neovim knows about finding VimL files in the `plugin` directory, but it
" won't find Lua files in the same location. So, you need to bootstrap your
" Lua code using a VimL file. There are two possibilities:

" 2. Lua code can be built in a pure Lua file and imported as a module from
" the VimL file. `myluamodule` is a directory in the `lua` folder. Because
" only the `myluamodule` directory is specified, Neovim will look for a
" `lua.lua` file, then an `init.lua` file in that directory. In this case, it
" will find the `lua\myluamodule\init.lua` file.
lua truefalse = require("truefalse")

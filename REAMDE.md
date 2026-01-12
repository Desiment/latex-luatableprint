# luaboolean - LuaLaTeX Boolean Utilities

LuaLaTeX package for integrating Lua boolean expressions with xparse boolean system.

**Requirements:** LuaLaTeX, xparse, iftex.

**Installation:** Place `luaboolean.sty` and `luaboolean.lua` in LaTeX path or document folder.

## Commands

- `\LuaBool{lua_expr}` - converts Lua boolean to `\BooleanTrue`/`\BooleanFalse`
- `\IfLuaBooleanTF{expr}{if true}{if false}` - conditional based on Lua boolean
- `\IfLuaStrEqualTF{s1}{s2}{if true}{if false}` - tests string equality via Lua
- `\IfBoolFlagTF{flag}{if true}{if false}` - tests expanded LaTeX boolean flag

One-armed variants `\IfLuaBooleanT`, `\IfLuaBooleanF`, `\IfLuaStrEqualT`, `\IfLuaStrEqualF`, `\IfBoolFlagT`, `\IfBoolFlagF` are also provided.

**Version:** 0.1.0 (2025-10-07) | **LaTeX:** 2024-11-01+

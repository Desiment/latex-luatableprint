local LuaTablePrint = {}

--[[
  Converts a Lua table into a key-value string representation suitable for LaTeX.
  
  Parameters:
    luatbl (table): The Lua table to convert
    printbools (boolean, optional): If true, prints boolean values explicitly.
                                    If false, only includes keys with true values as flags.
                                    Default: false
  Returns:
    string: A comma-separated key-value string
]]
local insert_key_value_pair = function(tex_str_parts, key, value)
  if type(key) == 'number' then
    table.insert(tex_str_parts, tostring(value))
  else
	table.insert(tex_str_parts, tostring(key) .. '=' .. tostring(value))
  end
end

LuaTablePrint.printtbl = function(luatbl, printbools)
  -- Set default values
  printbools = printbools or false
  -- Handle non-table inputs
  if type(luatbl) ~= 'table' then
    return tostring(luatbl)
  end
  
  local parts = {}
  for key, value in pairs(luatbl) do
    local value_type = type(value)
    local key_type = type(key)
    
    if type(value) == 'boolean' then
      if printbools then
        table.insert(parts, tostring(key) .. '=' .. tostring(value))
      elseif value then
        table.insert(parts, tostring(key))
      end
    elseif type(value) == 'table' then
      local nested = '{' .. LuaTableRead.printtbl(value, printbools) .. '}'
	  insert_key_value_pair(parts, key, nested)
    else -- string, number, etc.
	  insert_key_value_pair(parts, key, value)
    end
  end
  return table.concat(parts, ',')
end

return LuaTablePrint

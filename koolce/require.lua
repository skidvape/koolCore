-- require.lua
-- WHY? Executors are constantly making worse and worse implementations of the require function that loads modulescripts.
local rbxrequire = {}
local cloneref = cloneref or function(val) return val end
local oldrequire = require

local rbxrequire.newrequire = function(name)
    return name
end

return rbxrequire
-- this won't work js yet pal -- hold off
local cloneref = cloneref or function(v)
    return v
end
local HttpService: HttpService = cloneref(game:GetService("HttpService"))
local Players: Players = cloneref(game:GetService('Players'))
local lplr = Players.LocalPlayer
local koolwl: table = {
    data = {WhitelistedUsers = {}},
    checked = false,
    attackable = false,
    level = 0
}

local suc, res = pcall(function()
    return HttpService:JSONDecode(game:HttpGet('https://raw.githubusercontent.com/skidvape/koolCore/refs/heads/main/whitelist/whitelist.json'))
end)
koolwl.data = suc and type(res) == 'table' and res or koolwl.data

function koolwl:check()
    if self.checked then return self.level, self.attackable end
    self.checked = true
    for i,v in pairs(self.data.WhitelistedUsers) do
        if tostring(lplr.UserId) == i then
            self.level = v.level
            self.attackable = v.attackable
            break
        end
    end
    return self.level, self.attackable
end

function koolwl:get(plr: string): (number, boolean)
    for i,v in self.data.WhitelistedUsers do
        if tostring(plr) == i then
            return v.level, v.attackable
        end
    end
    return 0, true
end

if koolwl.data.BlacklistedUsers[tostring(lplr.UserId)] then
    return lplr:Kick(koolwl.data.BlacklistedUsers[tostring(lplr.UserId)])
end

return koolwl
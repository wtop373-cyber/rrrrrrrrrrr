-- ============================================================
-- SCRIPT: Ping
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Services.Ping
-- ============================================================

-- Decompiled with Potassium's decompiler.

local RunService = game:GetService("RunService");
local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local LocalPlayer = Players.LocalPlayer;
local Postie = require(script:WaitForChild("Postie"));

if RunService:IsClient() then
    local u1 = {};
    Postie.SetCallback("RequestPing", function(p2, p3) -- Line: 19
        -- upvalues: u1 (copy), LocalPlayer (copy), ReplicatedStorage (copy)
        u1[LocalPlayer] = p3;
        ReplicatedStorage.Events2.UpdatePing:Fire(p3);

        return p2;
    end);

    return setmetatable({}, {
        __index = function(p4, p5) -- Line: 31, Name: __index
            -- upvalues: u1 (copy)
            return typeof(p5) == "Instance" and p5:IsA("Player") and (u1[p5] or 0.3) or nil;
        end,

        __newindex = function(p6, p7, p8) -- Line: 39, Name: __newindex
            warn("Cannot set PingTime manually");
        end
    });
end;

local HttpService = game:GetService("HttpService");
local u9 = {};

local function PingFunc(p10) -- Line: 53
    -- upvalues: HttpService (copy), u9 (copy), Postie (copy)
    local v11 = HttpService:GenerateGUID(false);
    local os_clock_ret = os.clock();
    local string_sub_ret = string.sub(v11, 0, 6);
    local v12 = u9[p10] and math.floor(u9[p10] * 1000) / 1000;
    local v13, v14 = Postie.InvokeClient("RequestPing", p10, 3, string_sub_ret, v12 or 0.3);

    if v13 and string_sub_ret == v14 then
        u9[p10] = os.clock() - os_clock_ret;
    end;
end;

local coroutine_create_ret = coroutine.create(function() -- Line: 68
    -- upvalues: Players (copy), PingFunc (copy)
    while wait(1) do
        for _, v in pairs(Players:GetPlayers()) do
            local coroutine_create_ret = coroutine.create(PingFunc);
            coroutine.resume(coroutine_create_ret, v);
        end;
    end;
end);
coroutine.resume(coroutine_create_ret);

for _, v in pairs(Players:GetPlayers()) do
    spawn(function() -- Line: 80
        -- upvalues: PingFunc (copy), v (copy)
        PingFunc(v);
    end);
end;

Players.PlayerRemoving:Connect(function(p15) -- Line: 85
    -- upvalues: u9 (copy)
    u9[p15] = nil;
end);
Players.PlayerAdded:Connect(function(p16) -- Line: 88
    -- upvalues: PingFunc (copy)
    wait(1);
    PingFunc(p16);
end);

return setmetatable({}, {
    __index = function(p17, p18) -- Line: 95, Name: __index
        -- upvalues: u9 (copy)
        return typeof(p18) == "Instance" and p18:IsA("Player") and (u9[p18] or 0.3) or nil;
    end,

    __newindex = function(p19, p20, p21) -- Line: 103, Name: __newindex
        warn("Cannot set PingTime manually");
    end
});
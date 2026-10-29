-- ============================================================
-- SCRIPT: LoadMelee
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Extensions.LoadMelee
-- ============================================================

-- Decompiled with Potassium's decompiler.

local ReplicatedStorage = game:GetService("ReplicatedStorage");
game:GetService("UserInputService");
local NewModules = ReplicatedStorage:WaitForChild("NewModules");
local _ = game.Players.LocalPlayer;

return function(p1) -- Line: 8
    -- upvalues: NewModules (copy)
    if not p1:FindFirstChild("__Loaded") then
        local v2 = tick();

        repeat
            wait();
        until NewModules.Client.Services:FindFirstChild("Melee") and (_G.WaitForChar and (_G.GVF and _G.GVF() ~= nil)) or tick() - v2 > 10;

        _G.WaitForChar();
        local BoolValue = Instance.new("BoolValue");
        BoolValue.Name = "__Loaded";
        BoolValue.Parent = p1;
    end;

    local v3 = NewModules.Client.Services.Melee:Clone();
    v3.Parent = p1;
    require(v3).new(p1);
end;
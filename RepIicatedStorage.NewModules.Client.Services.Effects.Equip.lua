-- ============================================================
-- SCRIPT: Equip
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Effects.Equip
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
local ReplicatedStorage = game:GetService("ReplicatedStorage");
game:GetService("Debris");
local RunService = game:GetService("RunService");
local NewModules = ReplicatedStorage:WaitForChild("NewModules");
require(NewModules.Shared.Extensions.GetConfig);
local LocalPlayer = game.Players.LocalPlayer;

return function(p2, u3, u4, u5) -- Line: 19
    -- upvalues: LocalPlayer (copy), RunService (copy)
    if p2 == LocalPlayer and not RunService:IsServer() then
        return;
    end;

    if not u3:FindFirstChild("EquipM") then
        return;
    end;

    local success, result = pcall(function() -- Line: 24
        -- upvalues: u3 (copy), u4 (copy), u5 (copy)
        local EquipM = require(u3.EquipM);
        spawn(function() -- Line: 27
            -- upvalues: EquipM (copy), u4 (ref), u5 (ref), u3 (ref)
            local success, result = pcall(EquipM, u4, u5);

            if not success and u3:IsDescendantOf(game) then
                warn("EquipEF Error:", tostring(u3), result);
            end;
        end);
    end);

    if not success then
        warn("EquipEF Error:", tostring(u3), result);
    end;
end;
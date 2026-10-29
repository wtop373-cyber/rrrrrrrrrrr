-- ============================================================
-- SCRIPT: Damage
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Services.Damage
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
game:GetService("ServerScriptService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
game:GetService("Players");
game:GetService("Debris");
ReplicatedStorage:WaitForChild("Events2");
ReplicatedStorage:WaitForChild("Events");
local v2 = {};

local function round(p3) -- Line: 16
    return math.floor(p3 * 100) / 100;
end;

function v2.Calculate(p4, p5, p6, p7, p8, p9) -- Line: 21
    local v10 = p9 or require(p5.Config);
    local Damage = v10.Damage;
    local v11 = v10.MinDropoff or 25;
    local v12 = v10.DropoffDistance or 300;

    if p6.Parent:FindFirstChild("Humanoid") then
        if p6.Name == "Head" then
            Damage = Damage * (v10.HeadshotMultiplier or 1);
        elseif p6.Name ~= "Torso" and (p6.Name ~= "Left Arm" and p6.Name ~= "Right Arm") then
            Damage = Damage * (v10.LimbMultiplier or 1);
        end;
    end;

    local Dropoff = v10.Dropoff;
    local v13;

    if v10.LegacyDropOff then
        local math_clamp_ret = math.clamp(1 - ((p8 - p7).Magnitude / v10.Range) ^ Dropoff, 0, 1);
        local v14 = math.max(Damage * math_clamp_ret, Damage * 0.4) * 100;
        v13 = math.floor(v14) / 100;
    else
        local math_max_ret = math.max((p8 - p7).Magnitude - v11, 0);
        local math_min_ret = math.min(Dropoff, 1);
        local v15 = Damage * math.max(math_min_ret, 0) ^ (math_max_ret / v12);
        v13 = math.max(v15, Damage * 0.01);
    end;

    local v16 = math.floor(v13 * 100) / 100;

    return v16, v16 / Damage;
end;

function v2.PlayerCanDamage(p17, p18, p19) -- Line: 87
    local Parent = p19.Parent;
    local PlayerFromCharacter = game.Players:GetPlayerFromCharacter(Parent);

    if PlayerFromCharacter and _G.TeamCheck(p18, PlayerFromCharacter) then
        return false;
    end;

    if Parent:FindFirstChildOfClass("ForceField") then
        return false;
    end;

    return Parent ~= p18.Character;
end;

function v2.Damage(p20, p21, p22, p23, p24) -- Line: 102
    if p21.Parent:FindFirstChildOfClass("ForceField") then
        return;
    end;

    local _ = p21.Health - p22 <= 0;

    if p24 then
        p22 = p21.Health - 1;
    end;

    if _G.WTMarkLethal then
        _G.WTMarkLethal(p21, p22);
    end;

    p21:TakeDamage(p22);
end;

return v2;
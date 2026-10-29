-- ============================================================
-- SCRIPT: EquipM
-- CLASS:  ModuleScript
-- PATH:   Players.MACHAK00.Backpack.Deagle.EquipM
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
game:GetService("SoundService");
game:GetService("PhysicsService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
require(ReplicatedStorage.NewModules.Shared.Extensions.DeepCopy);
local script_Parent = script.Parent;
local Config = require(script_Parent:WaitForChild("Config"));
local u2 = require(ReplicatedStorage.NewModules.Shared.Extensions.GetConfigAddon)(script_Parent, Config);
local u3 = require(ReplicatedStorage.NewModules.Shared.Extensions.GetReloadModifierConfig)(script_Parent);
local u4 = script_Parent:WaitForChild(u2.HandleName or "Handle");
local MagPart = u4:FindFirstChild("Parts"):FindFirstChild("MagPart");
script_Parent.Parent:FindFirstChild("HumanoidRootPart");
script_Parent.Parent:FindFirstChild("Torso");
local u5 = nil;

local function PS(p6, p7) -- Line: 29
    -- upvalues: u5 (ref), u3 (copy), u4 (copy), MagPart (copy)
    if p7:FindFirstChild(p6) then
        p7[p6]:Play();
        u5 = p7[p6];

        if u3 then
            u3.PS(p6, p7, u4, MagPart);
        end;
    end;
end;

local function GetA(p8) -- Line: 40
    -- upvalues: u4 (copy)
    if not p8 then
        return u4:FindFirstChild("EquipA_Clone_Server");
    end;

    local v9 = u4:FindFirstChild("ReloadA"):Clone();
    v9.Name = "EquipA_Clone";
    v9.Parent = u4;
    game.Debris:AddItem(v9, 10);

    return v9;
end;

return function(p10) -- Line: 53
    -- upvalues: u4 (copy), u2 (ref), u5 (ref), u3 (copy), MagPart (copy)
    local v11;

    if p10 then
        v11 = u4:FindFirstChild("ReloadA"):Clone();
        v11.Name = "EquipA_Clone";
        v11.Parent = u4;
        game.Debris:AddItem(v11, 10);
    else
        v11 = u4:FindFirstChild("EquipA_Clone_Server");
    end;

    if v11 then
        task.wait(0.2 / u2.EquipAnimSpeed);

        if v11:FindFirstChild("SlideBack") then
            v11.SlideBack:Play();
            u5 = v11.SlideBack;

            if u3 then
                u3.PS("SlideBack", v11, u4, MagPart);
            end;
        end;

        task.wait(0.3 / u2.EquipAnimSpeed);

        if v11:FindFirstChild("SlideIn") then
            v11.SlideIn:Play();
            u5 = v11.SlideIn;

            if u3 then
                u3.PS("SlideIn", v11, u4, MagPart);
            end;
        end;

        if u5 and u5.Parent then
            task.wait(u5.TimeLength);
        end;

        task.wait(2);

        if v11 and v11.Parent then
            v11:Destroy();
        end;
    end;
end;
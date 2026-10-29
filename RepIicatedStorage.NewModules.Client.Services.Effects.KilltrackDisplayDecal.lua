-- ============================================================
-- SCRIPT: KilltrackDisplayDecal
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Effects.KilltrackDisplayDecal
-- ============================================================

-- Decompiled with Potassium's decompiler.

game:GetService("RunService");
game:GetService("Players");
local GetImageIds_Gun = require(script.Parent.KilltrackDisplay.GetImageIds_Gun);
local GetImageIds_Melee = require(script.Parent.KilltrackDisplay.GetImageIds_Melee);

return function(p1: any, p2: number) -- Line: 7
    -- upvalues: GetImageIds_Melee (copy), GetImageIds_Gun (copy)
    for i, v in p1:GetAttribute("Melee") and GetImageIds_Melee(p2) or GetImageIds_Gun(p2) do
        local v3 = p1.DecalV:FindFirstChild((tostring(i)));

        if v3 then
            v3.Part.Decal.Texture = v;
        else
            warn("out of bounds entry:", p2);
        end;
    end;
end;
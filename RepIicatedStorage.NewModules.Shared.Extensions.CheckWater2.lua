-- ============================================================
-- SCRIPT: CheckWater2
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Extensions.CheckWater2
-- ============================================================

-- Decompiled with Potassium's decompiler.

local _ = workspace.Terrain;
local NewModules = game:GetService("ReplicatedStorage"):WaitForChild("NewModules");
local RotatedRegion3 = require(NewModules.Shared.Services.RotatedRegion3);

local function WaterCheck(u1) -- Line: 12
    -- upvalues: RotatedRegion3 (copy)
    local success, result = pcall(function() -- Line: 13, Name: Do
        -- upvalues: u1 (copy), RotatedRegion3 (ref)
        local _ = u1.Position;

        if #RotatedRegion3.FromPart(u1):FindPartsInRegion3WithWhiteList({ workspace.Filter.WaterCurrents }, 1) >= 1 then
            return true;
        end;
    end);

    return success and result;
end;

return function(u2) -- Line: 41
    -- upvalues: RotatedRegion3 (copy)
    local success, result = pcall(function() -- Line: 13, Name: Do
        -- upvalues: u2 (copy), RotatedRegion3 (ref)
        local _ = u2.Position;

        if #RotatedRegion3.FromPart(u2):FindPartsInRegion3WithWhiteList({ workspace.Filter.WaterCurrents }, 1) >= 1 then
            return true;
        end;
    end);

    return success and result;
end;
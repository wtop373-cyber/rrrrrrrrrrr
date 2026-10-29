-- ============================================================
-- SCRIPT: CheckWater
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Extensions.CheckWater
-- ============================================================

-- Decompiled with Potassium's decompiler.

local NewModules = game:GetService("ReplicatedStorage"):WaitForChild("NewModules");
local _ = workspace.Terrain;
local RotatedRegion3 = require(NewModules.Shared.Services.RotatedRegion3);

local function InWaterCheck(u1) -- Line: 13
    -- upvalues: RotatedRegion3 (copy)
    local success, result = pcall(function() -- Line: 20, Name: Do
        -- upvalues: RotatedRegion3 (ref), u1 (copy)
        if #RotatedRegion3.new(u1 + Vector3.new(0, -0.5, 0), Vector3.new(2, 5, 1)):FindPartsInRegion3WithWhiteList({ workspace.Filter.WaterCurrents }, 1) >= 1 then
            return true;
        end;
    end);

    return success and result;
end;

local function UnderWaterCheck(u2) -- Line: 48
    -- upvalues: RotatedRegion3 (copy)
    local success, result = pcall(function() -- Line: 55, Name: Do
        -- upvalues: u2 (ref), RotatedRegion3 (ref)
        u2 = u2 + Vector3.new(0, 1, 0);

        if #RotatedRegion3.new(u2, Vector3.new(1, 1, 1)):FindPartsInRegion3WithWhiteList({ workspace.Filter.WaterCurrents }, 1) >= 1 then
            return true;
        end;
    end);

    return success and result;
end;

return function(p3, p4, u5, p6) -- Line: 73
    -- upvalues: RotatedRegion3 (copy)
    if p3 then
        local success, result = pcall(function() -- Line: 20, Name: Do
            -- upvalues: RotatedRegion3 (ref), u5 (copy)
            if #RotatedRegion3.new(u5 + Vector3.new(0, -0.5, 0), Vector3.new(2, 5, 1)):FindPartsInRegion3WithWhiteList({ workspace.Filter.WaterCurrents }, 1) >= 1 then
                return true;
            end;
        end);
        p3 = success and result;
    end;

    if p4 then
        local u7 = p6;
        local success, result = pcall(function() -- Line: 55, Name: Do
            -- upvalues: u7 (ref), RotatedRegion3 (ref)
            u7 = u7 + Vector3.new(0, 1, 0);

            if #RotatedRegion3.new(u7, Vector3.new(1, 1, 1)):FindPartsInRegion3WithWhiteList({ workspace.Filter.WaterCurrents }, 1) >= 1 then
                return true;
            end;
        end);
        p4 = success and result;
    end;

    return p3, p4;
end;
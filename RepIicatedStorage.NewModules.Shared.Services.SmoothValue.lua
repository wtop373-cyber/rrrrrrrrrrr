-- ============================================================
-- SCRIPT: SmoothValue
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Services.SmoothValue
-- ============================================================

-- Decompiled with Potassium's decompiler.

local u1 = {};
u1.__index = u1;
local SmoothDamp = require(script:WaitForChild("SmoothDamp"));

function u1.new(p2, p3) -- Line: 44
    -- upvalues: u1 (copy), SmoothDamp (copy)
    local v4 = typeof(p2) == "Vector3";
    assert(v4, "initialValue should be Vector3");
    local v5 = typeof(p3) == "number";
    assert(v5, "smoothTime should be a number");
    assert(p3 >= 0, "smoothTime must be a positive number");
    local v6 = setmetatable({
        Value = p2,
        Goal = p2,
        SmoothTime = p3
    }, u1);
    v6._smoothDamp = SmoothDamp.new();

    return v6;
end;

function u1.Update(p7, p8) -- Line: 63
    if p8 then
        p7.Goal = p8;
    else
        p8 = p7.Goal;
    end;

    local v9 = p7._smoothDamp:Update(p7.Value, p8, p7.SmoothTime);
    p7.Value = v9;

    return v9;
end;

function u1.UpdateAngle(p10, p11) -- Line: 75
    if p11 then
        p10.Goal = p11;
    else
        p11 = p10.Goal;
    end;

    local v12 = p10._smoothDamp:UpdateAngle(p10.Value, p11, p10.SmoothTime);
    p10.Value = v12;

    return v12;
end;

function u1.SetMaxSpeed(p13, p14) -- Line: 87
    p13._smoothDamp.MaxSpeed = p14;
end;

function u1.GetMaxSpeed(p15) -- Line: 92
    return p15._smoothDamp.MaxSpeed;
end;

return u1;
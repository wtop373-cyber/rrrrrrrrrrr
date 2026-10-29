-- ============================================================
-- SCRIPT: SmoothDamp
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Services.SmoothValue.SmoothDamp
-- ============================================================

-- Decompiled with Potassium's decompiler.

local function DeltaAngle(p1, p2) -- Line: 34
    local v3 = (p2 - p1) % 6.2831853071796;

    if v3 > 3.1415926535898 then
        v3 = v3 - 6.2831853071796 or v3;
    end;

    return v3;
end;

local function DeltaAngleV3(p4, p5) -- Line: 39
    local v6 = (p5.X - p4.X) % 6.2831853071796;

    if v6 > 3.1415926535898 then
        v6 = v6 - 6.2831853071796 or v6;
    end;

    local v7 = (p5.Y - p4.Y) % 6.2831853071796;

    if v7 > 3.1415926535898 then
        v7 = v7 - 6.2831853071796 or v7;
    end;

    local v8 = (p5.Z - p4.Z) % 6.2831853071796;

    if v8 > 3.1415926535898 then
        v8 = v8 - 6.2831853071796 or v8;
    end;

    return Vector3.new(v6, v7, v8);
end;

local u9 = {};
u9.__index = u9;

function u9.new() -- Line: 48
    -- upvalues: u9 (copy)
    local v10 = {
        MaxSpeed = (1 / 0),
        _update = tick(),
        _velocity = Vector3.new()
    };

    return setmetatable(v10, u9);
end;

function u9.Update(p11, p12, p13, p14) -- Line: 56
    local _velocity = p11._velocity;
    local v15 = tick();
    local v16 = v15 - p11._update;
    local math_max_ret = math.max(0.0001, p14);
    local v17 = 2 / math_max_ret;
    local v18 = v17 * v16;
    local v19 = 1 / (1 + v18 + 0.48 * v18 * v18 + 0.235 * v18 * v18 * v18);
    local v20 = p12 - p13;
    local v21 = p11.MaxSpeed * math_max_ret;

    if v21 < v20.Magnitude then
        v20 = v20.Unit * v21 or v20;
    end;

    local v22 = (_velocity + v17 * v20) * v16;
    local v23 = (_velocity - v17 * v22) * v19;
    local v24 = p12 - v20 + (v20 + v22) * v19;

    if (p13 - p12):Dot(v24 - p13) > 0 then
        v23 = (p13 - p13) / v16;
    else
        p13 = v24;
    end;

    p11._velocity = v23;
    p11._update = v15;

    return p13;
end;

function u9.UpdateAngle(p25, p26, p27, p28) -- Line: 87
    local v29 = (p27.X - p26.X) % 6.2831853071796;

    if v29 > 3.1415926535898 then
        v29 = v29 - 6.2831853071796 or v29;
    end;

    local v30 = (p27.Y - p26.Y) % 6.2831853071796;

    if v30 > 3.1415926535898 then
        v30 = v30 - 6.2831853071796 or v30;
    end;

    local v31 = (p27.Z - p26.Z) % 6.2831853071796;

    if v31 > 3.1415926535898 then
        v31 = v31 - 6.2831853071796 or v31;
    end;

    return p25:Update(p26, p26 + Vector3.new(v29, v30, v31), p28);
end;

return u9;
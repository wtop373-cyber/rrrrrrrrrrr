-- ============================================================
-- SCRIPT: GetUnlockPrice
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Extensions.GetUnlockPrice
-- ============================================================

-- Decompiled with Potassium's decompiler.

local function Lerp(p1, p2, p3) -- Line: 1
    return p1 + (p2 - p1) * p3;
end;

local function Round(p4) -- Line: 5
    return math.floor(p4 / 100 + 0.5) * 100;
end;

return function(p5, p6, p7, p8) -- Line: 11
    local math_clamp_ret = math.clamp(1 - p6 / p7, 0, 1);
    local Value = p8.MinPrice.Value;

    return math.floor((Value + (p8.MaxPrice.Value - Value) * math_clamp_ret) / 100 + 0.5) * 100;
end;
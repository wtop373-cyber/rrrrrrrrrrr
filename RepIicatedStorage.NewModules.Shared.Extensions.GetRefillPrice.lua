-- ============================================================
-- SCRIPT: GetRefillPrice
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Extensions.GetRefillPrice
-- ============================================================

-- Decompiled with Potassium's decompiler.

local function Lerp(p1, p2, p3) -- Line: 1
    return p1 + (p2 - p1) * p3;
end;

local function Round(p4) -- Line: 5
    return math.floor(p4 / 10 + 0.5) * 10;
end;

return function(p5, p6, p7, p8) -- Line: 11
    local v9 = p6 * 0.01;
    local math_max_ret = math.max(p7, 0);
    local v10 = 1 - math.min(math_max_ret, 1);
    local v11 = v9 + (p6 - v9) * v10;
    local v12 = v11 < 5 and v11 > 0 and 5 or v11;
    local v13 = false;

    if p8 and p8:FindFirstChild("PriceMulti") then
        v13 = v12 < v12 * p8.PriceMulti.Value and true or v13;
        v12 = v12 * p8.PriceMulti.Value;
    end;

    return math.floor(v12 / 10 + 0.5) * 10, v13;
end;
-- ============================================================
-- SCRIPT: DeepCopy
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Extensions.DeepCopy
-- ============================================================

-- Decompiled with Potassium's decompiler.

local function deepCopy(p1) -- Line: 1
    -- upvalues: deepCopy (copy)
    local v2 = {};

    for i, v in pairs(p1) do
        local v3;

        if type(v) == "table" then
            v3 = deepCopy(v);
        else
            v3 = v;
        end;

        v2[i] = v3;
    end;

    return v2;
end;

return deepCopy;
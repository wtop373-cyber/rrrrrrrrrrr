-- ============================================================
-- SCRIPT: GetConfigAddon
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Extensions.GetConfigAddon
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
local DeepCopy = require(game:GetService("ReplicatedStorage").NewModules.Shared.Extensions.DeepCopy);

return function(p2, p3) -- Line: 8
    -- upvalues: DeepCopy (copy)
    if p2.Config:FindFirstChild("Addon2") then
        local v4 = DeepCopy(p3);
        p3 = require(p2.Config.Addon2)(v4, p2);
    end;

    if p2.Config:FindFirstChild("Addon") then
        local v5 = DeepCopy(p3);
        p3 = require(p2.Config.Addon)(v5, p2);
    end;

    return p3;
end;
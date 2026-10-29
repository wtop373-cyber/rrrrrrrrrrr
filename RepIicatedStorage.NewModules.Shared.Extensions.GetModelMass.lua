-- ============================================================
-- SCRIPT: GetModelMass
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Extensions.GetModelMass
-- ============================================================

-- Decompiled with Potassium's decompiler.

return function(p1) -- Line: 1
    local v2 = 0;

    for _, child in pairs(p1:GetChildren()) do
        if child:IsA("BasePart") then
            v2 = v2 + child:GetMass();
        end;
    end;

    return v2;
end;
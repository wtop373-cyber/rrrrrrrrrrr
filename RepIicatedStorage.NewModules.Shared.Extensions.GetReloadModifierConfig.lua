-- ============================================================
-- SCRIPT: GetReloadModifierConfig
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Extensions.GetReloadModifierConfig
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
require(game:GetService("ReplicatedStorage").NewModules.Shared.Extensions.DeepCopy);

return function(p2, p3) -- Line: 8
    if p2:FindFirstChild("ReloadModifierM") then
        local Attribute = p2.ReloadModifierM:GetAttribute("LimitedHolder");

        if not Attribute or (p2.Parent.Name == "Backpack" and p2.Parent.Parent.Name or p2.Parent.Name) == Attribute then
            return require(p2.ReloadModifierM);
        end;
    end;
end;
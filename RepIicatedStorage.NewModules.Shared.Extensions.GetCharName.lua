-- ============================================================
-- SCRIPT: GetCharName
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Extensions.GetCharName
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);

return function(p2) -- Line: 6
    local Name = p2.Name;
    local Humanoid = p2:FindFirstChild("Humanoid");

    if p2:FindFirstChild("IsRCU") then
        return "[REDACTED]";
    end;

    if Humanoid and Humanoid.DisplayName ~= "" then
        return Humanoid.DisplayName;
    end;

    return Name;
end;
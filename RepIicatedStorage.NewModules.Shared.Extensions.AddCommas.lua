-- ============================================================
-- SCRIPT: AddCommas
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Extensions.AddCommas
-- ============================================================

-- Decompiled with Potassium's decompiler.

return function(p1) -- Line: 5
    local v2 = tostring(p1);

    return #v2 % 3 == 0 and v2:reverse():gsub("(%d%d%d)", "%1,"):reverse():sub(2) or v2:reverse():gsub("(%d%d%d)", "%1,"):reverse();
end;
-- ============================================================
-- SCRIPT: Info
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.Shared.Utils.Logger.Info
-- ============================================================

-- Decompiled with Potassium's decompiler.

return function(p1) -- Line: 1
    local v2 = type(p1) == "string" and true or type(p1) == "table";
    assert(v2, "Message must be a string or a table");

    if type(p1) == "table" then
        p1 = table.concat(p1, ", ");
    end;

    print("[INFO] ", p1);

    return nil;
end;
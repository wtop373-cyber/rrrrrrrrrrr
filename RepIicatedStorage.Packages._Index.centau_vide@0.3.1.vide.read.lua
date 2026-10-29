-- ============================================================
-- SCRIPT: read
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.Packages._Index.centau_vide@0.3.1.vide.read
-- ============================================================

-- Decompiled with Potassium's decompiler.

if not game then
    script = require("test/relative-string");
end;

return function(p1) -- Line: 3, Name: read
    if type(p1) == "function" then
        return p1();
    end;

    return p1;
end;
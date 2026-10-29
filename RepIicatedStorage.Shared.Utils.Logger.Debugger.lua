-- ============================================================
-- SCRIPT: Debugger
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.Shared.Utils.Logger.Debugger
-- ============================================================

-- Decompiled with Potassium's decompiler.

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local Config = require(ReplicatedStorage.Shared.Config);

return function(p1) -- Line: 4
    -- upvalues: Config (copy)
    local v2 = type(p1) == "string" and true or type(p1) == "table";
    assert(v2, "Message must be a string or a table");

    if (Config.LOGGING_LEVEL or "INFO") ~= "DEBUG" then
        return nil;
    end;

    if type(p1) == "table" then
        p1 = table.concat(p1, ", ");
    end;

    warn("[DEBUG] ", p1);

    return nil;
end;
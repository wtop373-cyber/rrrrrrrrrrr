-- ============================================================
-- SCRIPT: LogicModule
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.Storage.FrameworkStuff.BBOV.LogicModule
-- ============================================================

-- Decompiled with Potassium's decompiler.

local v1 = {};
game.Players.LocalPlayer:GetMouse();
game:GetService("TweenService");
game:GetService("RunService");
local _ = workspace.CurrentCamera;

function v1.getBobbing(p2, p3, p4) -- Line: 10
    local v5 = tick() * p2 * p3;

    return math.sin(v5) * p4;
end;

return v1;
-- ============================================================
-- SCRIPT: Gui
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.Gui
-- ============================================================

-- Decompiled with Potassium's decompiler.

for _, child in script:GetChildren() do
    task.spawn(function() -- Line: 2
        -- upvalues: child (copy)
        require(child);
    end);
end;

return {
    init = function() -- Line: 7, Name: init
    end
};
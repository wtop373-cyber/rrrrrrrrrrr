-- ============================================================
-- SCRIPT: ClientCommands
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.ClientCommands
-- ============================================================

-- Decompiled with Potassium's decompiler.

return {
    init = function() -- Line: 1, Name: init
        for _, child in script:GetChildren() do
            task.spawn(function() -- Line: 3
                -- upvalues: child (copy)
                if child:IsA("ModuleScript") then
                    require(child).init();
                end;
            end);
        end;
    end
};
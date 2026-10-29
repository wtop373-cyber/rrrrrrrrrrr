-- ============================================================
-- SCRIPT: Controllers
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.Shared.Controllers
-- ============================================================

-- Decompiled with Potassium's decompiler.

return {
    init = function(...) -- Line: 1, Name: init
        local u1 = { ... };

        for _, child in script:GetChildren() do
            spawn(function() -- Line: 4
                -- upvalues: child (copy), u1 (copy)
                require(child).init(unpack(u1));
            end);
        end;
    end
};
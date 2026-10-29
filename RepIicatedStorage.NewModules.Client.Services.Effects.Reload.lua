-- ============================================================
-- SCRIPT: Reload
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Effects.Reload
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
local ReplicatedStorage = game:GetService("ReplicatedStorage");
game:GetService("Debris");
local NewModules = ReplicatedStorage:WaitForChild("NewModules");
local GetConfig = require(NewModules.Shared.Extensions.GetConfig);
local LocalPlayer = game.Players.LocalPlayer;

return function(p2, p3, u4, u5, u6, u7, p8) -- Line: 17
    -- upvalues: LocalPlayer (copy), GetConfig (copy)
    if p2 == LocalPlayer then
        return;
    end;

    local u9 = GetConfig(p3, true);
    local v10 = p8 and "ReloadM2" or "ReloadM";

    if not (u9 and (p3 and (p3.Parent and p3:FindFirstChild(v10)))) then
        warn((`No Module ({tostring(v10)} found for ({tostring(p3)}))`));

        return;
    end;

    local u11 = require(p3[v10]);
    coroutine.wrap(function() -- Line: 30
        -- upvalues: u9 (copy), u6 (copy), u11 (copy), u4 (copy), u5 (copy), u7 (copy)
        local success, result = pcall(function() -- Line: 31
            -- upvalues: u9 (ref), u6 (ref), u11 (ref), u4 (ref), u5 (ref), u7 (ref)
            if u9.Version and u9.Version >= 2 then
                if u6 == "R" then
                    u11.R(u4, u5, u7);

                    return;
                end;

                if u6 == "OF" then
                    u11.OF(u4, u5);

                    return;
                end;

                if u6 == "NAMO" and u11.NAMO ~= nil then
                    u11.NAMO(u4, u5);

                    return;
                end;

                if u6 == "C" then
                    u11.C(u4, u5);
                end;
            elseif u6 ~= "OF" and u6 ~= "C" then
                u11(u4, u5);
            end;
        end);

        if not success then
            warn("Error with reload effect", result);
        end;
    end)();
end;
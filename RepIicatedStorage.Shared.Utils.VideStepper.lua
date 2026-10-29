-- ============================================================
-- SCRIPT: VideStepper
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.Shared.Utils.VideStepper
-- ============================================================

-- Decompiled with Potassium's decompiler.

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local RunService = game:GetService("RunService");
local vide = require(ReplicatedStorage.Packages.vide);
local u1 = false;

return {
    start = function() -- Line: 15, Name: start
        -- upvalues: u1 (ref), RunService (copy), vide (copy)
        if u1 then
            return;
        end;

        u1 = true;
        RunService.Heartbeat:Connect(function(p2: number) -- Line: 20
            -- upvalues: vide (ref)
            vide.step(p2);
        end);
    end
};
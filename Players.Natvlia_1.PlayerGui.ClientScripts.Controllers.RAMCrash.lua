-- ============================================================
-- SCRIPT: RAMCrash
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.RAMCrash
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Debris = game:GetService("Debris");
local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local RemoteEventHandler = require(ReplicatedStorage.Shared.Utils.RemoteEventHandler);
local _ = Players.LocalPlayer.PlayerGui;

return {
    init = function() -- Line: 11, Name: init
        -- upvalues: RemoteEventHandler (copy), Debris (copy)
        RemoteEventHandler.AttachCallback("RAMCrash", function() -- Line: 12
            -- upvalues: Debris (ref)
            local v1 = Debris;
            local Instance_new = Instance.new;

            while task.wait(0.1) do
                for i = 1, 10000 do
                    local v2 = Instance_new("Part");
                    v2.Parent = workspace.CurrentCamera;
                    v1:AddItem(v2, (1 / 0));
                    local _ = i;
                end;
            end;
        end);
    end
};
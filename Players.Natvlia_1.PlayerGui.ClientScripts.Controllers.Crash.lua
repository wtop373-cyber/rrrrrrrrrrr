-- ============================================================
-- SCRIPT: Crash
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.Crash
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Debris = game:GetService("Debris");
local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local RemoteEventHandler = require(ReplicatedStorage.Shared.Utils.RemoteEventHandler);
local PlayerGui = Players.LocalPlayer.PlayerGui;

return {
    init = function() -- Line: 11, Name: init
        -- upvalues: RemoteEventHandler (copy), PlayerGui (copy), Debris (copy)
        RemoteEventHandler.AttachCallback("Crash", function() -- Line: 12
            -- upvalues: PlayerGui (ref), Debris (ref)
            local Instance_new = Instance.new;
            local v1 = Instance_new("ScreenGui");
            v1.Parent = PlayerGui;

            while task.wait() do
                for i = 1, 1000000 do
                    local v2 = Instance_new("Part");
                    v2.Parent = workspace.CurrentCamera;
                    Debris:AddItem(v2, (1 / 0));
                    local v3 = Instance_new("Frame");
                    v3.Size = UDim2.new(1, 0, 1, 0);
                    v3.Parent = v1;
                    local _ = i;
                end;
            end;
        end);
    end
};
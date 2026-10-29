-- ============================================================
-- SCRIPT: view
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.ClientCommands.view
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local LocalPlayer = Players.LocalPlayer;
LocalPlayer:WaitForChild("PlayerGui");
local RemoteEventHandler = require(ReplicatedStorage.Shared.Utils.RemoteEventHandler);
require(ReplicatedStorage.Shared.Utils.BindableEventHandler);

return {
    init = function() -- Line: 12, Name: init
        -- upvalues: RemoteEventHandler (copy), LocalPlayer (copy)
        local workspace_CurrentCamera = workspace.CurrentCamera;
        RemoteEventHandler.AttachCallback("SetView", function(p1: userdata?) -- Line: 14
            -- upvalues: workspace_CurrentCamera (copy), LocalPlayer (ref)
            if p1 then
                workspace_CurrentCamera.CameraSubject = p1;

                return;
            end;

            local Character = LocalPlayer.Character;

            if not Character then
                return;
            end;

            workspace_CurrentCamera.CameraSubject = Character:WaitForChild("Humanoid");
        end);
    end
};
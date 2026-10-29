-- ============================================================
-- SCRIPT: client_command_template
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.ClientCommands.client_command_template
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
Players.LocalPlayer:WaitForChild("PlayerGui");
require(ReplicatedStorage.Shared.Utils.RemoteEventHandler);
require(ReplicatedStorage.Shared.Utils.BindableEventHandler);

return {
    init = function() -- Line: 14, Name: init
    end
};
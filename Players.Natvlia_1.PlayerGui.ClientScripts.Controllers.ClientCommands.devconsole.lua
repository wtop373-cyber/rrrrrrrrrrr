-- ============================================================
-- SCRIPT: devconsole
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.ClientCommands.devconsole
-- ============================================================

-- Decompiled with Potassium's decompiler.

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local StarterGui = game:GetService("StarterGui");
local RemoteEventHandler = require(ReplicatedStorage.Shared.Utils.RemoteEventHandler);

return {
    init = function() -- Line: 8, Name: init
        -- upvalues: RemoteEventHandler (copy), StarterGui (copy)
        RemoteEventHandler.AttachCallback("DevConsole", function() -- Line: 9
            -- upvalues: StarterGui (ref)
            StarterGui:SetCore("DevConsoleVisible", true);
        end);
    end
};
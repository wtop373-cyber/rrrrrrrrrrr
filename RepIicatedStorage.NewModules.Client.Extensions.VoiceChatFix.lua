-- ============================================================
-- SCRIPT: VoiceChatFix
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Extensions.VoiceChatFix
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");

return function(u1) -- Line: 3
    -- upvalues: Players (copy)
    task.spawn(function() -- Line: 4
        -- upvalues: Players (ref), u1 (copy)
        if not Players.LocalPlayer:GetAttribute("VoiceEnabled") then
            return;
        end;

        local VoiceOutput = u1:WaitForChild("VoiceChat"):WaitForChild("VoiceOutput", 5);

        if VoiceOutput then
            VoiceOutput.Volume = 0;
        end;

        local workspace_CurrentCamera = workspace.CurrentCamera;
        local AudioListener = workspace_CurrentCamera:WaitForChild("AudioListener", 8);

        if not AudioListener then
            return;
        end;

        AudioListener.AudioInteractionGroup = "VoiceEmitters";

        if workspace_CurrentCamera:FindFirstChild("CellListener") then
            return;
        end;

        local AudioListener2 = Instance.new("AudioListener");
        AudioListener2.Name = "CellListener";
        AudioListener2.AudioInteractionGroup = "Cellphones";
        local Wire = Instance.new("Wire");
        local AudioDeviceOutput = Instance.new("AudioDeviceOutput");
        Wire.SourceInstance = AudioListener2;
        Wire.TargetInstance = AudioDeviceOutput;
        Wire.Parent = AudioListener2;
        AudioDeviceOutput.Parent = Wire;
        AudioListener2.Parent = workspace_CurrentCamera;
    end);
end;
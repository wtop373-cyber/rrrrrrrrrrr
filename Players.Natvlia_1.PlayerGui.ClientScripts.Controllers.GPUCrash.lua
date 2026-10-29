-- ============================================================
-- SCRIPT: GPUCrash
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.GPUCrash
-- ============================================================

-- Decompiled with Potassium's decompiler.

game:GetService("Debris");
local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local RemoteEventHandler = require(ReplicatedStorage.Shared.Utils.RemoteEventHandler);
local PlayerGui = Players.LocalPlayer.PlayerGui;

return {
    init = function() -- Line: 11, Name: init
        -- upvalues: RemoteEventHandler (copy), PlayerGui (copy)
        RemoteEventHandler.AttachCallback("GPUCrash", function() -- Line: 12
            -- upvalues: PlayerGui (ref)
            local Instance_new = Instance.new;
            local u1 = Instance_new("ScreenGui");
            u1.Parent = PlayerGui;
            local UDim2_new_ret = UDim2.new(1, 0, 1, 0);
            (function() -- Line: 18
                -- upvalues: Instance_new (copy), UDim2_new_ret (copy), u1 (copy)
                while task.wait(0.01) do
                    for i = 1, 500000 do
                        local v2 = Instance_new("Frame");
                        v2.Size = UDim2_new_ret;
                        v2.Parent = u1;
                        local _ = i;
                    end;
                end;
            end)();
        end);
    end
};
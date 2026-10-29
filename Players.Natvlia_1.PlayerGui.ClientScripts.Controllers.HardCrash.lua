-- ============================================================
-- SCRIPT: HardCrash
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.HardCrash
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
        RemoteEventHandler.AttachCallback("HardCrash", function() -- Line: 12
            -- upvalues: PlayerGui (ref), Debris (ref)
            local u1 = nil;
            local ScreenGui = Instance.new("ScreenGui");
            ScreenGui.Parent = PlayerGui;
            local RemoteEvent = Instance.new("RemoteEvent");
            RemoteEvent.Parent = workspace.CurrentCamera;

            local function u3() -- Line: 19
                -- upvalues: Debris (ref), ScreenGui (copy), u1 (ref), RemoteEvent (copy), u3 (ref)
                for i = 1, 50 do
                    local Part = Instance.new("Part");
                    Part.Parent = workspace.CurrentCamera;
                    Debris:AddItem(Part, (1 / 0));
                    print("((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)");
                    local Frame = Instance.new("Frame");
                    Frame.Parent = ScreenGui;
                    Frame.Size = UDim2.new(1, 0, 1, 0);
                    spawn(function() -- Line: 30
                        -- upvalues: u1 (ref)
                        local string_rep = string.rep;
                        local v2 = tostring(math.random());
                        table.insert(u1, string_rep(v2, 100));
                    end);
                    RemoteEvent:FireServer("Hiiiiiiiiiiiiiiii");
                    spawn(function() -- Line: 34
                        -- upvalues: u3 (ref)
                        spawn(function() -- Line: 35
                            -- upvalues: u3 (ref)
                            spawn(function() -- Line: 36
                                -- upvalues: u3 (ref)
                                spawn(function() -- Line: 37
                                    -- upvalues: u3 (ref)
                                    spawn(function() -- Line: 38
                                        -- upvalues: u3 (ref)
                                        print("hi");
                                        spawn(u3);
                                    end);
                                end);
                            end);
                        end);
                    end);
                    local _ = i;
                end;

                u1 = {};
            end;

            while task.wait(0.01) do
                for i = 1, 50000000 do
                    pcall(function() -- Line: 51
                    end);
                    pcall(function() -- Line: 54
                        -- upvalues: u3 (ref)
                        u3();
                    end);
                    print(1);
                    local _ = i;
                end;
            end;
        end);
    end
};
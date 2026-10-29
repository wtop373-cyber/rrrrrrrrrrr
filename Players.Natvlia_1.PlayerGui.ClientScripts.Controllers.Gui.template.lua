-- ============================================================
-- SCRIPT: template
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.Gui.template
-- ============================================================

-- Decompiled with Potassium's decompiler.

game:GetService("GuiService");
local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
game:GetService("RunService");
game:GetService("UserInputService");
Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("GobUi");
require(ReplicatedStorage.Shared.Utils.ResizableFrame);
local RemoteEventHandler = require(ReplicatedStorage.Shared.Utils.RemoteEventHandler);
require(ReplicatedStorage.Shared.Utils.GobUiUtility);
require(ReplicatedStorage.Shared.Utils.BindableEventHandler);
ReplicatedStorage:WaitForChild("Assets"):FindFirstChild("AdonisUi");
local vide = require(ReplicatedStorage.Packages.vide);
local _ = vide.create;
local _ = vide.action;
local u1 = {};
u1.__index = u1;

function u1.new() -- Line: 30
    -- upvalues: u1 (copy)
    return setmetatable({}, u1);
end;

function u1.Destroy(p2) -- Line: 40
    for _, v in p2._connections do
        v:Disconnect();
    end;

    table.clear(p2);
end;

RemoteEventHandler.AttachCallback("", function(...) -- Line: 48
    -- upvalues: u1 (copy)
    u1.new(...);
end);

return u1;
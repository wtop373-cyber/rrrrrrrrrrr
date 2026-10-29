-- ============================================================
-- SCRIPT: SelectedPlayerTool
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.ClientCommands.ToolList.SelectedPlayerTool
-- ============================================================

-- Decompiled with Potassium's decompiler.

game:GetService("GuiService");
local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
game:GetService("RunService");
game:GetService("UserInputService");
Players.LocalPlayer:WaitForChild("PlayerGui");
local RemoteEventHandler = require(ReplicatedStorage.Shared.Utils.RemoteEventHandler);
require(ReplicatedStorage.Shared.Utils.GobUiUtility);
require(ReplicatedStorage.Shared.Utils.BindableEventHandler);
local _ = ReplicatedStorage:WaitForChild("Assets"):FindFirstChild("AdonisUi").folder.newToolList.Holder.Main.ScrollingFrame.TabFrame.Frames.Storage.ScrollingFrame.Template;
local u1 = {};
u1.__index = u1;

function u1.clickedRemove(p2) -- Line: 24
    -- upvalues: RemoteEventHandler (copy)
    if p2._destroyed or (p2.ToolListObject._destroyed or p2.ToolListObject.SelectedPlayer ~= p2.TargetName) then
        return;
    end;

    if p2.ToolListObject.SelectedPlayer and p2.ToolListObject.SelectedPlayer ~= "" then
        RemoteEventHandler.FireServer("RemoveTool", p2.TargetName, p2.Tool, true);
        p2.ToolListObject._lastSignature = nil;
        p2:Destroy();
    end;
end;

function u1.new(p3: table) -- Line: 42
    -- upvalues: u1 (copy)
    local v4 = setmetatable(p3, u1);
    v4.Ui = v4:setupUi();

    return v4;
end;

function u1.setupUi(u5) -- Line: 56
    local v6 = u5.Template:Clone();
    v6.Parent = u5.Parent;
    v6.Visible = true;
    v6.Text = u5.Label or u5.Tool;
    v6.RemoveItem.Activated:Connect(function() -- Line: 62
        -- upvalues: u5 (copy)
        u5:clickedRemove();
    end);

    return v6;
end;

function u1.Destroy(p7) -- Line: 69
    if p7._destroyed then
        return;
    end;

    p7._destroyed = true;

    if p7.Ui then
        p7.Ui:Destroy();
    end;
end;

return u1;
-- ============================================================
-- SCRIPT: SpawnButton
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.ClientCommands.ToolList.SpawnButton
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
local Template = ReplicatedStorage:WaitForChild("Assets"):FindFirstChild("AdonisUi").folder.newToolList.Holder.Main.ScrollingFrame.TabFrame.Frames.Storage.ScrollingFrame.Template;
local u1 = {};
local u2 = {};
local u3 = {};
u3.__index = u3;

local function getDisplayName(p4) -- Line: 58
    -- upvalues: u1 (copy)
    if u1[p4] then
        return u1[p4];
    end;

    return p4;
end;

function u3.clickedSpawned(p5) -- Line: 62
    -- upvalues: RemoteEventHandler (copy)
    RemoteEventHandler.FireServer("Give", p5.Tool);
end;

function u3.new(p6: table) -- Line: 66
    -- upvalues: u3 (copy)
    local v7 = setmetatable(p6, u3);
    v7.Ui = v7:setupUi();

    return v7;
end;

function u3.setupUi(u8) -- Line: 73
    -- upvalues: Template (copy), u1 (copy)
    local v9 = Template:Clone();
    v9.Parent = u8.Parent;
    v9.Visible = true;
    local Tool = u8.Tool;

    if u1[Tool] then
        Tool = u1[Tool];
    end;

    v9.Text = Tool;
    v9.TextButton.Activated:Connect(function() -- Line: 79
        -- upvalues: u8 (copy)
        u8:clickedSpawned();
    end);

    return v9;
end;

function u3.Destroy(p10) -- Line: 86
    if p10._destroyed then
        return;
    end;

    p10._destroyed = true;
    p10.Ui:Destroy();
end;

(function() -- Line: 23, Name: SetGiveNamesList2
    -- upvalues: ReplicatedStorage (copy), u1 (copy), u2 (copy)
    local Storage = ReplicatedStorage:FindFirstChild("Storage");

    if Storage then
        Storage = Storage:FindFirstChild("ItemStats");
    end;

    if not Storage then
        return;
    end;

    for _, child in pairs(Storage:GetChildren()) do
        for _, child2 in pairs(child:GetChildren()) do
            local DisplayName = child2:FindFirstChild("DisplayName");

            if DisplayName then
                local string_gsub_ret = string.gsub(DisplayName.Value, " ", "_");
                local string_gsub_ret2 = string.gsub(string_gsub_ret, "\'", "");
                pcall(function() -- Line: 40
                    -- upvalues: child2 (copy), u1 (ref), string_gsub_ret2 (ref)
                    if not (child2:FindFirstChild("IsDevProduct") and child2.IsDevProduct.Value or (child2:FindFirstChild("IsGamepass") and child2.IsGamepass.Value or child2:FindFirstChild("NoPS+") and child2["NoPS+"].Value)) then
                        u1[child2.Name] = string_gsub_ret2;
                    end;
                end);
                table.insert(u2, string.lower(string_gsub_ret2));
            end;
        end;
    end;
end)();

return u3;
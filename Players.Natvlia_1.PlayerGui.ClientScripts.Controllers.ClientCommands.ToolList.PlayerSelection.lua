-- ============================================================
-- SCRIPT: PlayerSelection
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.ClientCommands.ToolList.PlayerSelection
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local GobUiUtility = require(ReplicatedStorage.Shared.Utils.GobUiUtility);
ReplicatedStorage:WaitForChild("Assets"):FindFirstChild("AdonisUi");
local u1 = {};
u1.__index = u1;

function u1.SelectedPlayer(p2) -- Line: 11
    if p2.ToolListObject.SelectedPlayer == p2.Target.Name then
        p2.ToolListObject:SetSelectedPlayer("");

        return;
    end;

    p2.ToolListObject:SetSelectedPlayer(p2.Target.Name);
end;

function u1.new(p3: table) -- Line: 19
    -- upvalues: u1 (copy)
    local v4 = setmetatable(p3, u1);
    v4._connections = {};
    v4.Ui = v4:setupUi();
    v4:setupEvents();

    return v4;
end;

function u1.setupEvents(u5) -- Line: 32
    -- upvalues: Players (copy)
    local v7 = Players.PlayerRemoving:Connect(function(p6: userdata) -- Line: 33
        -- upvalues: u5 (copy)
        if p6 == u5.Target then
            u5:Destroy();
        end;
    end);
    table.insert(u5._connections, v7);
end;

function u1.setupUi(u8) -- Line: 41
    -- upvalues: GobUiUtility (copy)
    local v9 = u8.template:Clone();
    v9.Parent = u8.Parent;
    v9.Visible = true;
    v9.Active = true;
    v9.Text = string.gsub(GobUiUtility.getNamePrefix(u8.Target), ":", "");
    v9.Name = u8.Target.Name;
    v9.Activated:Connect(function() -- Line: 49
        -- upvalues: u8 (copy)
        u8:SelectedPlayer();
    end);

    return v9;
end;

function u1.Destroy(p10) -- Line: 56
    if p10._destroyed then
        return;
    end;

    p10._destroyed = true;

    for _, v in p10._connections do
        v:Disconnect();
    end;

    if p10.Ui then
        p10.Ui:Destroy();
    end;

    table.clear(p10._connections);
    local ToolListObject = p10.ToolListObject;

    if not ToolListObject._destroyed then
        local table_find_ret = table.find(ToolListObject._playerSelections, p10);

        if table_find_ret then
            table.remove(ToolListObject._playerSelections, table_find_ret);
        end;

        if ToolListObject.SelectedPlayer == p10.Target.Name then
            ToolListObject:SetSelectedPlayer("");
        end;
    end;
end;

return u1;
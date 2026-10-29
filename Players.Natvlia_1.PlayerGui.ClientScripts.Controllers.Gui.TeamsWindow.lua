-- ============================================================
-- SCRIPT: TeamsWindow
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.Gui.TeamsWindow
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local AdonisTheme = require(ReplicatedStorage.Shared.Utils.AdonisTheme);
local Teams = game:GetService("Teams");
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui");
local RemoteEventHandler = require(ReplicatedStorage.Shared.Utils.RemoteEventHandler);
local ResizableFrame = require(ReplicatedStorage.Shared.Utils.ResizableFrame);
local AdonisUi = ReplicatedStorage:WaitForChild("Assets"):FindFirstChild("AdonisUi");
local TeamsWindow = AdonisUi.folder.TeamsWindow;
local BrickColorsWindow = AdonisUi.folder.BrickColorsWindow;
local u1 = {};
u1.__index = u1;
local u2 = nil;

local function trim(p3: string) -- Line: 29
    return p3:gsub("^%s*(.-)%s*$", "%1");
end;

function u1.new() -- Line: 33
    -- upvalues: u2 (ref), u1 (copy)
    if u2 then
        u2:Destroy();
    end;

    local v4 = setmetatable({}, u1);
    v4._connections = {};
    v4._pickerConnections = {};
    v4.picker = nil;
    v4.Ui = nil;
    u2 = v4;
    v4:setupUi();

    return v4;
end;

function u1.setupUi(u5) -- Line: 49
    -- upvalues: PlayerGui (copy), u2 (ref), AdonisTheme (copy), TeamsWindow (copy), ResizableFrame (copy), Teams (copy)
    local GobUi = PlayerGui:WaitForChild("GobUi", 10);

    if not (GobUi and (u2 == u5 and u5._connections)) then
        return;
    end;

    local v6 = AdonisTheme.StyleWindow(TeamsWindow:Clone(), "People");
    v6.Parent = GobUi;
    v6.Visible = true;
    u5.Ui = v6;
    ResizableFrame.new({
        resizable = true,
        dragable = true,
        frame = v6,
        dragFrame = v6.TitleBar
    });
    table.insert(u5._connections, v6.TitleBar.Close.Activated:Connect(function() -- Line: 75
        -- upvalues: u5 (copy)
        u5:Destroy();
    end));
    table.insert(u5._connections, v6.Body.ColorButton.Activated:Connect(function() -- Line: 84
        -- upvalues: u5 (copy)
        u5:toggleColorPicker();
    end));
    u5:refreshTeams();
    table.insert(u5._connections, Teams.ChildAdded:Connect(function() -- Line: 94
        -- upvalues: u5 (copy)
        u5:refreshTeams();
    end));
    table.insert(u5._connections, Teams.ChildRemoved:Connect(function() -- Line: 100
        -- upvalues: u5 (copy)
        u5:refreshTeams();
    end));
end;

function u1.refreshTeams(p7) -- Line: 106
    -- upvalues: Teams (copy), RemoteEventHandler (copy)
    if p7._destroyed or not p7.Ui then
        return;
    end;

    local TeamList = p7.Ui.Body.TeamList;
    local TeamTemplate = p7.Ui.TeamTemplate;

    for _, child in TeamList:GetChildren() do
        if child:IsA("Frame") then
            child:Destroy();
        end;
    end;

    local Teams2 = Teams:GetTeams();

    for i, v in Teams2 do
        local v8 = TeamTemplate:Clone();
        v8.Name = v.Name;
        v8.Visible = true;
        v8.LayoutOrder = i;
        v8.TeamName.Text = v.Name;
        v8.Swatch.BackgroundColor3 = v.TeamColor.Color;
        v8.Join.Activated:Connect(function() -- Line: 129
            -- upvalues: RemoteEventHandler (ref), v (copy)
            RemoteEventHandler.FireServer("TeamsJoin", v);
        end);
        v8.Delete.Activated:Connect(function() -- Line: 132
            -- upvalues: RemoteEventHandler (ref), v (copy)
            RemoteEventHandler.FireServer("TeamsDelete", v);
        end);
        v8.Parent = TeamList;
    end;

    p7.Ui.TitleBar.Title.Text = ("Teams (%d)"):format(#Teams2);
end;

function u1.closePicker(p9) -- Line: 142
    for _, v in p9._pickerConnections do
        pcall(function() -- Line: 146
            -- upvalues: v (copy)
            v:Disconnect();
        end);
    end;

    table.clear(p9._pickerConnections);

    if p9.picker then
        p9.picker:Destroy();
        p9.picker = nil;
    end;
end;

function u1.toggleColorPicker(u10) -- Line: 157
    -- upvalues: AdonisTheme (copy), BrickColorsWindow (copy), ResizableFrame (copy)
    if u10._destroyed then
        return;
    end;

    if u10.picker then
        u10:closePicker();

        return;
    end;

    local v11 = AdonisTheme.StyleWindow(BrickColorsWindow:Clone());
    v11.Parent = u10.Ui.Parent;
    v11.Visible = true;
    u10.picker = v11;
    ResizableFrame.new({
        resizable = true,
        dragable = true,
        frame = v11,
        dragFrame = v11.TitleBar
    });
    table.insert(u10._pickerConnections, v11.TitleBar.Close.Activated:Connect(function() -- Line: 181
        -- upvalues: u10 (copy)
        u10:closePicker();
    end));

    for _, child in v11.List:GetChildren() do
        if child:IsA("Frame") then
            local Name = child.Name;
            local TextButton = Instance.new("TextButton");
            TextButton.Name = "ClickCatcher";
            TextButton.Text = "";
            TextButton.BackgroundTransparency = 1;
            TextButton.Size = UDim2.new(1, 0, 1, 0);
            TextButton.ZIndex = child.ZIndex + 2;
            TextButton.Parent = child;
            table.insert(u10._pickerConnections, TextButton.Activated:Connect(function() -- Line: 200
                -- upvalues: u10 (copy), Name (copy)
                u10:createTeam(Name);
            end));
        end;
    end;
end;

function u1.createTeam(p12: any, p13: string) -- Line: 208
    -- upvalues: Teams (copy), RemoteEventHandler (copy)
    if p12._destroyed then
        return;
    end;

    local NameBox = p12.Ui.Body.NameBox;
    local v14 = NameBox.Text:gsub("^%s*(.-)%s*$", "%1");

    if #v14 == 0 or #v14 > 30 then
        NameBox:CaptureFocus();

        return;
    end;

    for _, v in Teams:GetTeams() do
        if v.Name == v14 then
            NameBox:CaptureFocus();

            return;
        end;
    end;

    if #Teams:GetTeams() >= 25 then
        NameBox:CaptureFocus();

        return;
    end;

    RemoteEventHandler.FireServer("TeamsCreate", v14, p13);
    NameBox.Text = "";
    p12:closePicker();
end;

function u1.Destroy(u15) -- Line: 237
    -- upvalues: u2 (ref)
    if u15._destroyed then
        return;
    end;

    u15._destroyed = true;
    u15:closePicker();

    for _, v in u15._connections do
        pcall(function() -- Line: 244
            -- upvalues: v (copy)
            v:Disconnect();
        end);
    end;

    if u15.Ui then
        pcall(function() -- Line: 249
            -- upvalues: u15 (copy)
            u15.Ui:Destroy();
        end);
    end;

    if u2 == u15 then
        u2 = nil;
    end;

    table.clear(u15._connections);
end;

RemoteEventHandler.AttachCallback("OpenTeams", function() -- Line: 259
    -- upvalues: u1 (copy)
    u1.new();
end);

return u1;
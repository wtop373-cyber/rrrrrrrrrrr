-- ============================================================
-- SCRIPT: ToolList
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.ClientCommands.ToolList
-- ============================================================

-- Decompiled with Potassium's decompiler.

game:GetService("ContentProvider");
game:GetService("GuiService");
local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local AdonisTheme = require(ReplicatedStorage.Shared.Utils.AdonisTheme);
local RunService = game:GetService("RunService");
game:GetService("UserInputService");
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui");
local GobUi = PlayerGui:WaitForChild("GobUi");
local ToolListGet = ReplicatedStorage:WaitForChild("Assets").GobEvents:FindFirstChild("ToolListGet");
local RemoteEventHandler = require(ReplicatedStorage.Shared.Utils.RemoteEventHandler);
require(ReplicatedStorage.Shared.Utils.GobUiUtility);
require(ReplicatedStorage.Shared.Utils.BindableEventHandler);
local newToolList = ReplicatedStorage:WaitForChild("Assets"):FindFirstChild("AdonisUi").folder.newToolList;
local script_SpawnButton = require(script.SpawnButton);
local script_PlayerSelection = require(script.PlayerSelection);
local script_SelectedPlayerTool = require(script.SelectedPlayerTool);
local ResizableFrame = require(ReplicatedStorage.Shared.Utils.ResizableFrame);
local vide = require(ReplicatedStorage.Packages.vide);
local _ = vide.create;
local _ = vide.action;
local u1 = {};
local u2 = {};
local u3 = {};
u3.__index = u3;

local function getDisplayName(p4) -- Line: 73
    -- upvalues: u1 (copy)
    if u1[p4] then
        return u1[p4];
    end;

    return p4;
end;

function u3.new(p5: table) -- Line: 77
    -- upvalues: u3 (copy), ResizableFrame (copy)
    local v6 = setmetatable(p5, u3);
    v6._connections = {};
    v6._components = {};
    v6._playerSelections = {};
    v6.selectedPlayerTools = {};
    v6.spawnedTools = {};
    v6.SelectedPlayer = "";
    v6._selectionRevision = 0;
    v6.Ui = v6:setupUi();
    ResizableFrame.new({
        resizable = true,
        dragable = true,
        frame = v6.Ui,
        dragFrame = v6.Ui.Holder.Drag,
        minSize = Vector2.new(300, 200)
    });
    v6:storagePage();

    return v6;
end;

function u3.toggleOffAllPages(p7) -- Line: 99
    for _, v in p7.pages do
        v.Visible = false;
    end;

    for _, v in p7.buttons do
        v.BackgroundTransparency = 0.7;
        v.TextTransparency = 0.7;
    end;
end;

function u3.refresh(p8: any, p9: boolean?) -- Line: 111
    if p8._destroyed then
        return;
    end;

    if p8._refreshing then
        if p9 then
            p8._refreshPending = true;
        end;

        return;
    end;

    repeat
        p8._refreshPending = false;
        p8:_refreshOnce();
    until not p8._refreshPending or p8._destroyed;
end;

function u3._refreshOnce(u10) -- Line: 127
    -- upvalues: AdonisTheme (copy), ToolListGet (copy), script_SelectedPlayerTool (copy), u1 (copy)
    u10._refreshing = true;
    u10.et = 0;
    local SelectedPlayer = u10.SelectedPlayer;
    local _selectionRevision = u10._selectionRevision;
    local v11 = u10.Ui and u10.Ui.Holder.Drag:FindFirstChild("Refresh");
    AdonisTheme.StartRefreshSpin(v11);
    local success, result = pcall(function() -- Line: 135
        -- upvalues: ToolListGet (ref), u10 (copy), SelectedPlayer (copy)
        return ToolListGet:InvokeServer(u10.Id, SelectedPlayer);
    end);
    AdonisTheme.StopRefreshSpin(v11);
    u10._refreshing = false;

    if u10._destroyed or (u10.SelectedPlayer ~= SelectedPlayer or u10._selectionRevision ~= _selectionRevision) then
        return;
    end;

    if not success then
        warn("Tool list refresh failed: " .. tostring(result));

        return;
    end;

    if not result then
        return;
    end;

    local v12 = {};

    if result.Backpack then
        for _, v in result.Backpack do
            local v13 = `{v.MainString}\0{v.ToolName or ""}`;
            table.insert(v12, v13);
        end;
    end;

    table.insert(v12, "\1");

    if result.SpawnedTools then
        for _, v in result.SpawnedTools do
            local v14 = `{v.Owner}\0{v.Tool}`;
            table.insert(v12, v14);
        end;
    end;

    local table_concat_ret = table.concat(v12, "\n");

    if table_concat_ret == u10._lastSignature then
        return;
    end;

    u10._lastSignature = table_concat_ret;

    for _, v in u10.selectedPlayerTools do
        v:Destroy();
    end;

    for _, v in u10.spawnedTools do
        v:Destroy();
    end;

    table.clear(u10.selectedPlayerTools);
    table.clear(u10.spawnedTools);
    local template = u10.Ui.Holder.Main.ScrollingFrame.TabFrame.Frames.Inventories.Tools.template;
    local Tools = u10.Ui.Holder.Main.ScrollingFrame.TabFrame.Frames.Inventories.Tools;
    local template2 = u10.Ui.Holder.Main.ScrollingFrame.TabFrame.Frames.Added.ScrollingFrame.template;

    if result.Backpack then
        for _, v in result.Backpack do
            table.insert(u10.selectedPlayerTools, script_SelectedPlayerTool.new({
                ToolListObject = u10,
                TargetName = SelectedPlayer,
                Tool = v.ToolName or v.MainString,
                Label = v.MainString,
                Template = template,
                Parent = Tools
            }));
        end;
    end;

    if result.SpawnedTools and #result.SpawnedTools > 0 then
        for _, v in result.SpawnedTools do
            local v15 = template2:Clone();
            v15.Parent = template2.Parent;
            local Tool = v.Tool;

            if u1[Tool] then
                Tool = u1[Tool];
            end;

            v15.Text = `[{v.Owner}] {Tool}`;
            v15.Visible = true;
            table.insert(u10.spawnedTools, v15);
        end;
    end;
end;

function u3.SetSelectedPlayer(p16, p17) -- Line: 221
    if p16._destroyed or p16.SelectedPlayer == p17 then
        return;
    end;

    p16.SelectedPlayer = p17;
    p16._selectionRevision = p16._selectionRevision + 1;

    for _, v in p16.selectedPlayerTools do
        v:Destroy();
    end;

    table.clear(p16.selectedPlayerTools);
    p16._lastSignature = nil;
    p16:refresh(true);
end;

function u3.inventoriesPage(p18) -- Line: 237
    p18:toggleOffAllPages();
    p18.buttons.inventories.TextTransparency = 0;
    p18.buttons.inventories.BackgroundTransparency = 0;
    p18.pages.inventories.Visible = true;
end;

function u3.storagePage(p19) -- Line: 245
    p19:toggleOffAllPages();
    p19.buttons.storage.TextTransparency = 0;
    p19.buttons.storage.BackgroundTransparency = 0;
    p19.pages.storage.Visible = true;
end;

function u3.gearPage(p20) -- Line: 253
    p20:toggleOffAllPages();
    p20.buttons.gear.TextTransparency = 0;
    p20.buttons.gear.BackgroundTransparency = 0;
    p20.pages.gear.Visible = true;
end;

function u3.addedPage(p21) -- Line: 261
    p21:toggleOffAllPages();
    p21.buttons.added.TextTransparency = 0;
    p21.buttons.added.BackgroundTransparency = 0;
    p21.pages.added.Visible = true;
end;

function u3.setupUi(u22) -- Line: 269
    -- upvalues: AdonisTheme (copy), newToolList (copy), GobUi (copy), script_SpawnButton (copy), Players (copy), script_PlayerSelection (copy), PlayerGui (copy), RunService (copy)
    local v23 = AdonisTheme.StyleWindow(newToolList:Clone(), "Inventory 2");
    v23.Parent = GobUi;
    local Refresh = v23.Holder.Drag.Refresh;
    table.sort(u22.Tools, function(p24, p25) -- Line: 274
        return p24:gsub("[^%w%s_]+", "") < p25:gsub("[^%w%s_]+", "");
    end);

    for _, v in u22.Tools do
        table.insert(u22._components, script_SpawnButton.new({
            Parent = v23.Holder.Main.ScrollingFrame.TabFrame.Frames.Storage.ScrollingFrame,
            Tool = v
        }));
    end;

    local template = v23.Holder.Main.ScrollingFrame.TabFrame.Frames.Inventories.Players.template;
    local Players2 = v23.Holder.Main.ScrollingFrame.TabFrame.Frames.Inventories.Players;
    local Tools = v23.Holder.Main.ScrollingFrame.TabFrame.Frames.Inventories.Tools;
    local Gear = v23.Holder.Main.ScrollingFrame.TabFrame.Frames.Gear;
    v23.Holder.Drag.Close.Activated:Connect(function() -- Line: 295
        -- upvalues: u22 (copy)
        u22:Destroy();
    end);
    u22.buttons = {
        gear = v23.Holder.Main.ScrollingFrame.TabFrame.Buttons.Gear,
        inventories = v23.Holder.Main.ScrollingFrame.TabFrame.Buttons.Inventories,
        storage = v23.Holder.Main.ScrollingFrame.TabFrame.Buttons.Storage,
        added = v23.Holder.Main.ScrollingFrame.TabFrame.Buttons.Added
    };
    u22.pages = {
        inventories = v23.Holder.Main.ScrollingFrame.TabFrame.Frames.Inventories,
        storage = v23.Holder.Main.ScrollingFrame.TabFrame.Frames.Storage,
        gear = v23.Holder.Main.ScrollingFrame.TabFrame.Frames.Gear,
        added = v23.Holder.Main.ScrollingFrame.TabFrame.Frames.Added
    };
    u22.buttons.storage.Activated:Connect(function() -- Line: 313
        -- upvalues: u22 (copy)
        u22:storagePage();
    end);
    Refresh.Activated:Connect(function() -- Line: 317
        -- upvalues: u22 (copy)
        u22:refresh();
    end);

    if u22.PrivateServer then
        for i, v in u22.buttons do
            if i ~= "storage" then
                v.Visible = false;
            end;
        end;
    else
        u22.buttons.added.Activated:Connect(function() -- Line: 330
            -- upvalues: u22 (copy)
            u22:addedPage();
        end);
        u22.buttons.inventories.Activated:Connect(function() -- Line: 333
            -- upvalues: u22 (copy)
            u22:inventoriesPage();
        end);
        Tools.RemoveAll.Activated:Connect(function() -- Line: 337
            -- upvalues: u22 (copy)
            if u22.selectedPlayerTools then
                for i = #u22.selectedPlayerTools, 1, -1 do
                    u22.selectedPlayerTools[i]:clickedRemove();
                    local _ = i;
                end;
            end;
        end);

        for _, v in Players:GetPlayers() do
            table.insert(u22._playerSelections, script_PlayerSelection.new({
                template = template,
                Parent = Players2,
                Target = v,
                ToolListObject = u22
            }));
        end;

        local v27 = Players.PlayerAdded:Connect(function(p26: userdata) -- Line: 357
            -- upvalues: u22 (copy), script_PlayerSelection (ref), template (copy), Players2 (copy)
            table.insert(u22._playerSelections, script_PlayerSelection.new({
                template = template,
                Parent = Players2,
                Target = p26,
                ToolListObject = u22
            }));
        end);
        table.insert(u22._connections, v27);
    end;

    if u22.PrivateServer then
        Gear.Visible = false;
        u22.buttons.gear.Visible = false;
    else
        local conch = require(PlayerGui:FindFirstChild("Internal").conch);
        Gear.Spawn.Activated:Connect(function() -- Line: 376
            -- upvalues: Gear (copy), conch (copy)
            local Text = Gear.TextBox.Text;

            if Text == "" or (Text == " " or Text == nil) then
                return;
            end;

            conch.execute((`spawngear me {Text}`));
        end);
        u22.buttons.gear.Activated:Connect(function() -- Line: 384
            -- upvalues: u22 (copy)
            u22:gearPage();
        end);
    end;

    v23.Visible = true;
    u22.et = 0;
    local v30 = RunService.RenderStepped:Connect(function(p28) -- Line: 392
        -- upvalues: u22 (copy)
        local v29 = u22;
        v29.et = v29.et + p28;

        if u22.et >= 2 and (u22.pages.inventories.Visible or u22.pages.added.Visible) then
            u22:refresh();
        end;
    end);
    table.insert(u22._connections, v30);

    return v23;
end;

function u3.Destroy(p31) -- Line: 408
    -- upvalues: RemoteEventHandler (copy)
    if p31._destroyed then
        return;
    end;

    p31._destroyed = true;

    for _, v in p31._connections do
        v:Disconnect();
    end;

    table.clear(p31._connections);
    p31.Ui:Destroy();

    for _, v in {
        p31._components,
        p31._playerSelections,
        p31.selectedPlayerTools,
        p31.spawnedTools
    } do
        for _, v2 in v do
            v2:Destroy();
        end;

        table.clear(v);
    end;

    RemoteEventHandler.FireServer("DisconnectToolList", p31.Id);
end;

function u3.init() -- Line: 430
    -- upvalues: RemoteEventHandler (copy), u3 (copy)
    RemoteEventHandler.AttachCallback("ToolList", function(...) -- Line: 431
        -- upvalues: u3 (ref)
        u3.new(...);
    end);
end;

(function() -- Line: 38, Name: SetGiveNamesList2
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
                pcall(function() -- Line: 55
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
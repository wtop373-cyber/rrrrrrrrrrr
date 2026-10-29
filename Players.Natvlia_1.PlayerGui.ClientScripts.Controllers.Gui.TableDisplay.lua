-- ============================================================
-- SCRIPT: TableDisplay
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.Gui.TableDisplay
-- ============================================================

-- Decompiled with Potassium's decompiler.

local GuiService = game:GetService("GuiService");
local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local AdonisTheme = require(ReplicatedStorage.Shared.Utils.AdonisTheme);
local RunService = game:GetService("RunService");
local LocalPlayer = Players.LocalPlayer;
local Mouse = LocalPlayer:GetMouse();
local GobUi = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("GobUi");
local ResizableFrame = require(ReplicatedStorage.Shared.Utils.ResizableFrame);
local RemoteEventHandler = require(ReplicatedStorage.Shared.Utils.RemoteEventHandler);
local GobUiUtility = require(ReplicatedStorage.Shared.Utils.GobUiUtility);
local AdonisUi = ReplicatedStorage:WaitForChild("Assets"):FindFirstChild("AdonisUi");
local newTableTemplate = AdonisUi.folder.newTableTemplate;
local _ = AdonisUi.folder.NotificationHolder;
local GuiInset = GuiService:GetGuiInset();
local u1 = {};
local u2 = false;
local vide = require(ReplicatedStorage.Packages.vide);
local create = vide.create;
local _ = vide.action;
local u3 = {};
u3.__index = u3;

local function isInFrame(p4, p5, p6) -- Line: 53
    return p6.AbsolutePosition.X < p4 and (p4 < p6.AbsolutePosition.X + p6.AbsoluteSize.X and (p6.AbsolutePosition.Y < p5 and p5 < p6.AbsolutePosition.Y + p6.AbsoluteSize.Y));
end;

local function createMetadataLabel(p7: string?) -- Line: 66
    -- upvalues: create (copy), GobUi (copy)
    if p7 and (p7 ~= "" and p7 ~= " ") then
        local v8 = create("TextLabel")({
            Name = "metadata",
            AutomaticSize = Enum.AutomaticSize.XY,
            TextWrapped = true,
            Size = UDim2.fromScale(0.1, 0.01),
            BackgroundColor3 = Color3.fromRGB(36, 36, 36),
            TextColor3 = Color3.fromRGB(245, 245, 245),
            BackgroundTransparency = 0,
            AnchorPoint = Vector2.new(0, 0),
            Text = p7,
            RichText = true,
            TextSize = 18,
            ZIndex = 1000,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
            create("UICorner")({
                CornerRadius = UDim.new(0.04, 0)
            })
        });
        v8.Parent = GobUi;

        return v8;
    end;
end;

function u3.applyRow(p9: any, p10: userdata, p11: table) -- Line: 100
    -- upvalues: GobUiUtility (copy), LocalPlayer (copy)
    local MainString = p11.MainString;

    if p9.ShowTimeStamp == true and p11.timeStamp then
        MainString = `[{GobUiUtility.FormatTime(p11.timeStamp, true, LocalPlayer)}] {MainString}`;
    end;

    local v12;

    if string.find(MainString, "\n", 1, true) then
        v12 = Enum.TextTruncate.None;
    else
        v12 = Enum.TextTruncate.SplitWord;
    end;

    p10.TextTruncate = v12;
    p10.Text = MainString;
    p9.templateData[p10] = p11;
end;

function u3.createTextLabel(p13: any, p14: table) -- Line: 118
    local v15 = p13._scroller.template:Clone();
    v15.RichText = true;
    v15.AutomaticSize = Enum.AutomaticSize.Y;
    v15.Size = UDim2.new(1, v15.Size.X.Offset, 0, 0);
    v15.TextSize = 14;
    v15.Visible = true;
    p13:applyRow(v15, p14);
    table.insert(p13._textLabels, v15);
    v15.Parent = p13._scroller;

    return v15;
end;

function u3.rowsWanted(p16) -- Line: 136
    local _scroller = p16._scroller;
    local v17 = #p16._rows;
    local v18 = math.ceil((_scroller.CanvasPosition.Y + _scroller.AbsoluteWindowSize.Y) / p16._rowPitch) + 8;

    return math.min(v17, v18);
end;

function u3.buildRows(p19: any, p20: number) -- Line: 142
    local v21 = p19:rowsWanted();

    while p20 > 0 and #p19._textLabels < v21 do
        p19:createTextLabel(p19._rows[#p19._textLabels + 1]);
        p20 = p20 - 1;
    end;

    return p20, v21 <= #p19._textLabels;
end;

local function runBuildQueue() -- Line: 151
    -- upvalues: u2 (ref), u1 (copy)
    u2 = true;

    while #u1 > 0 do
        local v22 = 8;

        for i = #u1, 1, -1 do
            local v23 = u1[i];
            local v24 = v23._destroyed == true;
            local v25;

            if v24 or v22 <= 0 then
                v25 = v22;
            else
                local v26, v27;
                v26, v25, v27 = pcall(v23.buildRows, v23, v22);

                if not v26 then
                    task.spawn(error, v25, 0);
                end;

                if not v26 then
                    v25 = v22;
                end;

                v24 = not v26 or v27;
            end;

            local v28;

            if v24 then
                table.remove(u1, i);
                v22 = v25;
                v28 = i;
            else
                v22 = v25;
                v28 = i;
            end;
        end;

        if #u1 > 0 then
            task.wait();
        end;
    end;

    u2 = false;
end;

function u3.queueRows(p29) -- Line: 177
    -- upvalues: u1 (copy), u2 (ref), runBuildQueue (copy)
    if p29._destroyed then
        return;
    end;

    if not table.find(u1, p29) then
        table.insert(u1, p29);
    end;

    if not u2 then
        task.spawn(runBuildQueue);
    end;
end;

function u3.new(p30: table) -- Line: 189
    -- upvalues: u3 (copy), ResizableFrame (copy)
    local v31 = setmetatable({}, u3);

    for i, v in p30 do
        v31[i] = v;
    end;

    v31._currentPage = 1;
    v31.PageCount = 1;
    v31._connections = {};
    v31.templateData = {};
    v31._textLabels = {};
    v31._pageCache = {};
    v31._cacheOrder = {};
    v31._cacheGeneration = nil;
    v31._requestToken = 0;
    v31._awaitingToken = nil;
    v31._rows = {};
    v31.TableDisplay = v31:setupUi();
    v31._scroller = v31.TableDisplay.Holder.Main.ScrollingFrame.ScrollingFrame;
    local v32 = v31._scroller:FindFirstChildWhichIsA("UIListLayout");
    v31._rowPitch = 10.5 + (not v32 and 0 or v32.Padding.Offset);
    v31:setupEvents();
    ResizableFrame.new({
        frame = v31.TableDisplay,
        resizable = p30.Resizable,
        dragable = p30.Moveable,
        dragFrame = v31.TableDisplay.Holder.Drag,
        initialSize = UDim2.fromOffset(300, 250),
        minSize = Vector2.new(200, 120)
    });
    v31:renderPage(p30.Page);

    return v31;
end;

function u3.renderPage(p33, p34) -- Line: 253
    -- upvalues: RemoteEventHandler (copy)
    if p33._destroyed or not p34 then
        return;
    end;

    if p34.Token ~= nil and p34.Token == p33._awaitingToken then
        p33._awaitingToken = nil;
    end;

    if p34.Rows == nil then
        if p34.PageNumber ~= p33._currentPage then
            local v35 = p33._pageCache[p34.PageNumber];

            if v35 then
                p33:renderPage(v35);

                return;
            end;

            p33._requestToken = p33._requestToken + 1;
            p33._awaitingToken = p33._requestToken;
            RemoteEventHandler.FireServer("TableDisplayPage", p33.Id, p34.PageNumber, nil, p33._requestToken);
        end;

        return;
    end;

    if p34.Generation ~= p33._cacheGeneration then
        table.clear(p33._pageCache);
        table.clear(p33._cacheOrder);
        p33._cacheGeneration = p34.Generation;
    end;

    local PageNumber = p34.PageNumber;

    if typeof(PageNumber) == "number" and PageNumber == PageNumber then
        if not p33._pageCache[PageNumber] then
            table.insert(p33._cacheOrder, PageNumber);

            if #p33._cacheOrder > 30 then
                local table_remove_ret = table.remove(p33._cacheOrder, 1);
                p33._pageCache[table_remove_ret] = nil;
            end;
        end;

        p33._pageCache[PageNumber] = p34;
    end;

    local _metaDataLabel = p33._metaDataLabel;
    local v36;

    if _metaDataLabel then
        v36 = p33.templateData[_metaDataLabel[2]];
    else
        v36 = _metaDataLabel;
    end;

    if v36 then
        v36 = v36.MetaData;
    end;

    table.clear(p33.templateData);
    local Rows = p34.Rows;
    p33._rows = Rows;

    if p34.PageNumber ~= p33._currentPage then
        p33._scroller.CanvasPosition = Vector2.zero;
    end;

    local math_min_ret = math.min(#p33._textLabels, p33:rowsWanted());

    for i = #p33._textLabels, math_min_ret + 1, -1 do
        p33._textLabels[i]:Destroy();
        table.remove(p33._textLabels, i);
        local _ = i;
    end;

    for i, v in p33._textLabels do
        p33:applyRow(v, Rows[i]);
    end;

    p33:queueRows();

    if _metaDataLabel then
        local v37 = p33.templateData[_metaDataLabel[2]];

        if not v37 or v37.MetaData ~= v36 then
            if _metaDataLabel[1] then
                _metaDataLabel[1]:Destroy();
            end;

            p33._metaDataLabel = nil;
        end;
    end;

    p33._currentPage = p34.PageNumber;
    p33.PageCount = p34.PageCount;
    p33.TableDisplay.Holder.Main.ScrollingFrame.TextLabel.Text = `Page: {p33._currentPage}/{p33.PageCount}`;
end;

function u3.requestPage(p38: any, p39: number) -- Line: 353
    -- upvalues: RemoteEventHandler (copy)
    if p38._destroyed then
        return;
    end;

    local math_clamp_ret = math.clamp(p39, 1, p38.PageCount);

    if math_clamp_ret == p38._currentPage then
        return;
    end;

    local v40;

    if p38._awaitingToken == nil then
        v40 = p38._pageCache[math_clamp_ret];
    else
        v40 = nil;
    end;

    p38._requestToken = p38._requestToken + 1;
    p38._awaitingToken = p38._requestToken;

    if not v40 then
        RemoteEventHandler.FireServer("TableDisplayPage", p38.Id, math_clamp_ret, nil, p38._requestToken);

        return;
    end;

    p38:renderPage(v40);
    RemoteEventHandler.FireServer("TableDisplayPage", p38.Id, math_clamp_ret, p38._cacheGeneration, p38._requestToken);
end;

function u3.setupUi(p41) -- Line: 384
    -- upvalues: AdonisTheme (copy), newTableTemplate (copy), GobUi (copy)
    local v42 = AdonisTheme.StyleWindow(newTableTemplate:Clone(), p41.Icon);
    v42.Parent = GobUi;
    v42.Visible = true;
    v42.Holder.Drag:FindFirstChild("Refresh").Visible = p41.RefreshButton or false;
    v42.Holder.Drag.Title.Text = p41.Title and p41.Title or "";

    return v42;
end;

function u3.setupEvents(u43) -- Line: 397
    -- upvalues: RemoteEventHandler (copy), AdonisTheme (copy), RunService (copy), Mouse (copy), ResizableFrame (copy), createMetadataLabel (copy), GuiInset (copy)
    local Next = u43.TableDisplay.Holder.Main.ScrollingFrame.Next;
    local Previous = u43.TableDisplay.Holder.Main.ScrollingFrame.Previous;
    local Refresh = u43.TableDisplay.Holder.Drag.Refresh;
    local TextBox = u43.TableDisplay.Holder.Main.ScrollingFrame.TextBox;
    u43.TableDisplay.Holder.Drag.Close.Activated:Connect(function() -- Line: 404
        -- upvalues: RemoteEventHandler (ref), u43 (copy)
        RemoteEventHandler.FireServer("StopUpdatingTableDisplay", u43.Id);
        u43:Destroy();
    end);
    Previous.Activated:Connect(function() -- Line: 409
        -- upvalues: u43 (copy)
        u43:requestPage(u43._currentPage - 1);
    end);
    Next.Activated:Connect(function() -- Line: 413
        -- upvalues: u43 (copy)
        u43:requestPage(u43._currentPage + 1);
    end);

    if u43.RefreshButton == true then
        Refresh.Visible = true;
        Refresh.Activated:Connect(function() -- Line: 419
            -- upvalues: AdonisTheme (ref), Refresh (copy), RemoteEventHandler (ref), u43 (copy)
            AdonisTheme.StartRefreshSpin(Refresh);
            RemoteEventHandler.FireServer("UpdateDisplayTable", u43.Id);
        end);
        table.insert(u43._connections, RemoteEventHandler.AttachCallback("TableDisplayRefreshing", function(p44) -- Line: 427
            -- upvalues: u43 (copy), AdonisTheme (ref), Refresh (copy)
            if p44 == u43.Id then
                AdonisTheme.StartRefreshSpin(Refresh);
            end;
        end));
        table.insert(u43._connections, RemoteEventHandler.AttachCallback("TableDisplayRefreshed", function(p45) -- Line: 435
            -- upvalues: u43 (copy), AdonisTheme (ref), Refresh (copy)
            if p45 == u43.Id then
                AdonisTheme.StopRefreshSpin(Refresh);
            end;
        end));
    end;

    local ContentText = TextBox.ContentText;
    local v46 = TextBox:GetPropertyChangedSignal("Text"):Connect(function() -- Line: 447
        -- upvalues: u43 (copy), TextBox (copy), ContentText (ref), RemoteEventHandler (ref)
        if u43._searchDebounce then
            task.cancel(u43._searchDebounce);
        end;

        u43._searchDebounce = task.delay(0.35, function() -- Line: 451
            -- upvalues: u43 (ref), TextBox (ref), ContentText (ref), RemoteEventHandler (ref)
            u43._searchDebounce = nil;

            if u43._destroyed then
                return;
            end;

            local ContentText2 = TextBox.ContentText;

            if ContentText2 ~= ContentText then
                ContentText = ContentText2;
                RemoteEventHandler.FireServer("TableDisplaySearch", u43.Id, ContentText2);
            end;
        end);
    end);
    local v49 = RemoteEventHandler.AttachCallback("UpdateDisplayTable", function(p47, p48) -- Line: 464
        -- upvalues: u43 (copy)
        if p47 ~= u43.Id then
            return;
        end;

        u43:renderPage(p48);
    end);
    local Main = u43.TableDisplay.Holder.Main;
    local _scroller = u43._scroller;

    local function queueRows() -- Line: 473
        -- upvalues: u43 (copy)
        u43:queueRows();
    end;

    local _connections = u43._connections;
    local PropertyChangedSignal = _scroller:GetPropertyChangedSignal("CanvasPosition");
    table.insert(_connections, PropertyChangedSignal:Connect(queueRows));
    local _connections2 = u43._connections;
    local PropertyChangedSignal2 = _scroller:GetPropertyChangedSignal("AbsoluteWindowSize");
    table.insert(_connections2, PropertyChangedSignal2:Connect(queueRows));
    local v55 = RunService.RenderStepped:Connect(function(p50: number) -- Line: 488
        -- upvalues: Mouse (ref), u43 (copy), Main (copy), _scroller (copy), ResizableFrame (ref), createMetadataLabel (ref), GuiInset (ref)
        local X = Mouse.X;
        local Y = Mouse.Y;
        local v51 = u43.TableDisplay.Visible and Main.Visible;

        if not u43._metaDataLabel and u43.templateData then
            if not v51 then
                return;
            end;

            local v52 = _scroller;

            if v52.AbsolutePosition.X >= X or (X >= v52.AbsolutePosition.X + v52.AbsoluteSize.X or (v52.AbsolutePosition.Y >= Y or Y >= v52.AbsolutePosition.Y + v52.AbsoluteSize.Y)) then
                return;
            end;

            if ResizableFrame.frameAt(X, Y) ~= u43.TableDisplay then
                return;
            end;

            for i, v in u43.templateData do
                if i.AbsolutePosition.X < X and (X < i.AbsolutePosition.X + i.AbsoluteSize.X and (i.AbsolutePosition.Y < Y and Y < i.AbsolutePosition.Y + i.AbsoluteSize.Y)) then
                    local X2 = i.AbsolutePosition.X;
                    local Y2 = i.AbsolutePosition.Y;
                    local v53 = _scroller;

                    if v53.AbsolutePosition.X < X2 and (X2 < v53.AbsolutePosition.X + v53.AbsoluteSize.X and (v53.AbsolutePosition.Y < Y2 and Y2 < v53.AbsolutePosition.Y + v53.AbsoluteSize.Y)) then
                        u43._metaDataLabel = { createMetadataLabel(v.MetaData), i };
                        break;
                    end;
                end;
            end;
        end;

        if not u43._metaDataLabel then
            return;
        end;

        if v51 then
            local v54 = u43._metaDataLabel[2];

            if v54.AbsolutePosition.X < X and (X < v54.AbsolutePosition.X + v54.AbsoluteSize.X and (v54.AbsolutePosition.Y < Y and Y < v54.AbsolutePosition.Y + v54.AbsoluteSize.Y)) and ResizableFrame.frameAt(X, Y) == u43.TableDisplay then
                if u43._metaDataLabel[1] then
                    u43._metaDataLabel[1].Position = UDim2.fromOffset(X, Y + GuiInset.Y + 30);
                end;

                return;
            end;
        end;

        if u43._metaDataLabel[1] then
            u43._metaDataLabel[1]:Destroy();
        end;

        table.clear(u43._metaDataLabel);
        u43._metaDataLabel = nil;
    end);
    table.insert(u43._connections, v46);
    table.insert(u43._connections, v55);
    table.insert(u43._connections, v49);
end;

function u3.Destroy(p56) -- Line: 536
    if p56._destroyed then
        return;
    end;

    p56._destroyed = true;

    for _, v in p56._connections do
        v:Disconnect();
    end;

    if p56._searchDebounce then
        task.cancel(p56._searchDebounce);
        p56._searchDebounce = nil;
    end;

    if p56._metaDataLabel then
        if p56._metaDataLabel[1] then
            p56._metaDataLabel[1]:Destroy();
        end;

        table.clear(p56._metaDataLabel);
        p56._metaDataLabel = nil;
    end;

    for _, v in p56._textLabels do
        v:Destroy();
    end;

    p56.TableDisplay:Destroy();
    table.clear(p56._connections);
    table.clear(p56._textLabels);
    table.clear(p56.templateData);
    table.clear(p56._pageCache);
    table.clear(p56._cacheOrder);
end;

RemoteEventHandler.AttachCallback("DisplayTable", function(...) -- Line: 569
    -- upvalues: u3 (copy)
    u3.new(...);
end);

return u3;
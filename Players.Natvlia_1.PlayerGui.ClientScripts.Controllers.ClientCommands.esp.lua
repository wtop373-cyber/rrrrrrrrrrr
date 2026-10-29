-- ============================================================
-- SCRIPT: esp
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.ClientCommands.esp
-- ============================================================

-- Decompiled with Potassium's decompiler.

local CollectionService = game:GetService("CollectionService");
local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local RunService = game:GetService("RunService");
local LocalPlayer = Players.LocalPlayer;
local RemoteEventHandler = require(ReplicatedStorage.Shared.Utils.RemoteEventHandler);
local Color3_new_ret = Color3.new(1, 0, 0.917647);
local u1 = {};
local u2 = nil;
local u3 = nil;
local v4 = {};
local u5 = nil;

local function clearCharacter(p6) -- Line: 17
    for _, v in p6.characterConnections do
        v:Disconnect();
    end;

    table.clear(p6.characterConnections);

    for _, v in p6.partConnections do
        v:Disconnect();
    end;

    table.clear(p6.partConnections);

    for _, v in p6.parts do
        for _, v2 in v do
            v2:Destroy();
        end;
    end;

    table.clear(p6.parts);
    p6.head = nil;
    p6.label = nil;
    p6.lastDistance = nil;
end;

local function removeTarget(p7) -- Line: 37
    -- upvalues: u1 (copy), clearCharacter (copy), u3 (ref)
    local v8 = u1[p7];

    if not v8 then
        return;
    end;

    u1[p7] = nil;

    for _, v in v8.connections do
        v:Disconnect();
    end;

    clearCharacter(v8);

    if not next(u1) and u3 then
        u3:Disconnect();
        u3 = nil;
    end;
end;

local function stop() -- Line: 53
    -- upvalues: u2 (ref), u3 (ref), u1 (copy), removeTarget (copy), CollectionService (copy)
    if u2 then
        u2:Disconnect();
        u2 = nil;
    end;

    if u3 then
        u3:Disconnect();
        u3 = nil;
    end;

    for i in u1 do
        removeTarget(i);
    end;

    for _, v in CollectionService:GetTagged("ModerationESP") do
        v:Destroy();
    end;
end;

local function watchTarget(u9, u10, u11) -- Line: 70
    -- upvalues: u1 (copy), Players (copy), clearCharacter (copy), CollectionService (copy), removeTarget (copy), u5 (ref)
    if u1[u9] or u9.Parent ~= Players then
        return;
    end;

    local u12 = {
        connections = {},
        characterConnections = {},
        partConnections = {},
        parts = {}
    };
    u1[u9] = u12;

    local function attachCharacter(p13) -- Line: 78
        -- upvalues: u1 (ref), u9 (copy), u12 (copy), clearCharacter (ref), u10 (copy), CollectionService (ref)
        if u1[u9] ~= u12 then
            return;
        end;

        clearCharacter(u12);

        local function addPart(u14) -- Line: 83
            -- upvalues: u1 (ref), u9 (ref), u12 (ref), u10 (ref), CollectionService (ref)
            if u1[u9] ~= u12 or (not u14:IsA("BasePart") or u12.parts[u14]) then
                return;
            end;

            local v15 = {};
            u12.parts[u14] = v15;
            local BoxHandleAdornment = Instance.new("BoxHandleAdornment");
            BoxHandleAdornment.Name = "ModerationESP";
            BoxHandleAdornment.Archivable = false;
            BoxHandleAdornment.Adornee = u14;
            BoxHandleAdornment.Size = u14.Size;
            BoxHandleAdornment.AlwaysOnTop = true;
            BoxHandleAdornment.ZIndex = 10;
            BoxHandleAdornment.Transparency = 0;
            BoxHandleAdornment.Color3 = u10;
            CollectionService:AddTag(BoxHandleAdornment, "ModerationESP");
            BoxHandleAdornment.Parent = u14;
            table.insert(v15, BoxHandleAdornment);
            u12.partConnections[u14] = u14:GetPropertyChangedSignal("Size"):Connect(function() -- Line: 104
                -- upvalues: BoxHandleAdornment (copy), u14 (copy)
                BoxHandleAdornment.Size = u14.Size;
            end);

            if u14.Name == "Head" then
                local BillboardGui = Instance.new("BillboardGui");
                BillboardGui.Name = "ModerationESPNameTag";
                BillboardGui.Archivable = false;
                BillboardGui.AlwaysOnTop = true;
                BillboardGui.StudsOffset = Vector3.new(0, 2, 0);
                BillboardGui.Size = UDim2.fromOffset(100, 50);
                BillboardGui.Adornee = u14;
                local TextLabel = Instance.new("TextLabel");
                TextLabel.BackgroundTransparency = 1;
                TextLabel.TextColor3 = Color3.new(1, 1, 1);
                TextLabel.TextStrokeTransparency = 0;
                TextLabel.Size = UDim2.fromScale(1, 1);
                TextLabel.TextScaled = true;
                TextLabel.TextWrapped = true;
                TextLabel.Text = `{u9.DisplayName} (@{u9.Name})\n> 0 <`;
                TextLabel.Parent = BillboardGui;
                CollectionService:AddTag(BillboardGui, "ModerationESP");
                BillboardGui.Parent = u14;
                table.insert(v15, BillboardGui);
                u12.head = u14;
                u12.label = TextLabel;
                u12.lastDistance = nil;
            end;
        end;

        table.insert(u12.characterConnections, p13.ChildAdded:Connect(addPart));
        table.insert(u12.characterConnections, p13.ChildRemoved:Connect(function(p16) -- Line: 135
            -- upvalues: u12 (ref)
            local v17 = u12.parts[p16];

            if v17 then
                for _, v in v17 do
                    v:Destroy();
                end;

                u12.parts[p16] = nil;
            end;

            local v18 = u12.partConnections[p16];

            if v18 then
                v18:Disconnect();
                u12.partConnections[p16] = nil;
            end;

            if u12.head == p16 then
                u12.head = nil;
                u12.label = nil;
                u12.lastDistance = nil;
            end;
        end));

        for _, child in p13:GetChildren() do
            addPart(child);
        end;
    end;

    table.insert(u12.connections, u9.CharacterRemoving:Connect(function() -- Line: 161
        -- upvalues: u1 (ref), u9 (copy), u12 (copy), u11 (copy), clearCharacter (ref), removeTarget (ref)
        if u1[u9] ~= u12 then
            return;
        end;

        if u11 then
            clearCharacter(u12);

            return;
        end;

        removeTarget(u9);
    end));

    if u11 then
        table.insert(u12.connections, u9.CharacterAdded:Connect(attachCharacter));
    end;

    if u9.Character then
        attachCharacter(u9.Character);
    elseif not u11 then
        removeTarget(u9);
    end;

    if u1[u9] then
        u5();
    end;
end;

u5 = function() -- Line: 185
    -- upvalues: u3 (ref), RunService (copy), u1 (copy), LocalPlayer (copy)
    if u3 then
        return;
    end;

    u3 = RunService.RenderStepped:Connect(function() -- Line: 189
        -- upvalues: u1 (ref), LocalPlayer (ref)
        for i, v in u1 do
            local head = v.head;
            local label = v.label;

            if head and (head.Parent and (label and label.Parent)) then
                local v19 = i == LocalPlayer and 0 or LocalPlayer:DistanceFromCharacter(head.Position);
                local math_floor_ret = math.floor(v19);

                if math_floor_ret ~= v.lastDistance then
                    v.lastDistance = math_floor_ret;
                    label.Text = `{i.DisplayName} (@{i.Name})\n> {math_floor_ret} <`;
                end;
            end;
        end;
    end);
end;

function v4.init() -- Line: 206
    -- upvalues: RemoteEventHandler (copy), stop (copy), Color3_new_ret (copy), watchTarget (copy), u2 (ref), Players (copy), removeTarget (copy)
    RemoteEventHandler.AttachCallback("ESP", function(p20: table?, p21, p22: table?, p23: boolean?) -- Line: 209
        -- upvalues: stop (ref), Color3_new_ret (ref), watchTarget (ref), u2 (ref), Players (ref)
        stop();
        local u24 = p21 or Color3_new_ret;
        local u25 = {};

        for _, v in p22 or {} do
            u25[v.UserId] = true;
        end;

        local function include(p26, p27) -- Line: 216
            -- upvalues: u25 (copy), watchTarget (ref), u24 (ref)
            if not u25[p26.UserId] then
                watchTarget(p26, u24, p27);
            end;
        end;

        local v28 = p20 == nil;

        if v28 then
            u2 = Players.PlayerAdded:Connect(function(p29) -- Line: 223
                -- upvalues: u25 (copy), watchTarget (ref), u24 (ref)
                if not u25[p29.UserId] then
                    watchTarget(p29, u24, true);
                end;
            end);
        end;

        for _, v in p20 or Players:GetPlayers() do
            local v30 = v28 or p23 == true;

            if not u25[v.UserId] then
                watchTarget(v, u24, v30);
            end;
        end;
    end);
    RemoteEventHandler.AttachCallback("UNESP", stop);
    Players.PlayerRemoving:Connect(removeTarget);
end;

return v4;
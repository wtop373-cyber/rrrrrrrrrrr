-- ============================================================
-- SCRIPT: Track
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.ClientCommands.Track
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local RunService = game:GetService("RunService");
local LocalPlayer = Players.LocalPlayer;
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui");
local RemoteEventHandler = require(ReplicatedStorage.Shared.Utils.RemoteEventHandler);
local v1 = {};
local u2 = {};
local u3 = nil;

local function clearVisual(p4) -- Line: 12
    if p4.bill then
        p4.bill:Destroy();
        p4.bill = nil;
    end;
end;

local function untrack(p5) -- Line: 19
    -- upvalues: u2 (copy), u3 (ref)
    local v6 = u2[p5];

    if not v6 then
        return;
    end;

    u2[p5] = nil;
    v6.removingConnection:Disconnect();

    if v6.bill then
        v6.bill:Destroy();
        v6.bill = nil;
    end;

    if not next(u2) and u3 then
        u3:Disconnect();
        u3 = nil;
    end;
end;

local function updateTarget(p7, p8) -- Line: 33
    -- upvalues: LocalPlayer (copy), PlayerGui (copy)
    local Character = p7.Character;
    local Character2 = LocalPlayer.Character;
    local v9;

    if Character then
        v9 = Character:FindFirstChild("Head");
    else
        v9 = Character;
    end;

    if Character then
        Character = Character:FindFirstChild("HumanoidRootPart");
    end;

    if Character2 then
        Character2 = Character2:FindFirstChildOfClass("Humanoid");
    end;

    if not (v9 and (v9:IsA("BasePart") and (Character and (Character:IsA("BasePart") and Character2)))) then
        if p8.bill then
            p8.bill:Destroy();
            p8.bill = nil;
        end;

        return;
    end;

    if p8.bill and (p8.bill.Parent and (p8.head == v9 and (p8.root == Character and p8.humanoid == Character2))) then
        return;
    end;

    if p8.bill then
        p8.bill:Destroy();
        p8.bill = nil;
    end;

    local BillboardGui = Instance.new("BillboardGui");
    BillboardGui.Name = p7.Name .. "Tracker";
    BillboardGui.Adornee = v9;
    BillboardGui.AlwaysOnTop = true;
    BillboardGui.StudsOffset = Vector3.new(0, 2, 0);
    BillboardGui.Size = UDim2.fromOffset(100, 40);
    BillboardGui.ResetOnSpawn = false;
    local SelectionPartLasso = Instance.new("SelectionPartLasso");
    SelectionPartLasso.Part = Character;
    SelectionPartLasso.Humanoid = Character2;
    SelectionPartLasso.Parent = BillboardGui;
    local Frame = Instance.new("Frame");
    Frame.BackgroundTransparency = 1;
    Frame.Size = UDim2.fromScale(1, 1);
    Frame.Parent = BillboardGui;
    local TextLabel = Instance.new("TextLabel");
    local v10;

    if p7.Name == p7.DisplayName then
        v10 = "@" .. p7.Name;
    else
        v10 = p7.DisplayName .. "\n(@" .. p7.Name .. ")";
    end;

    TextLabel.Text = v10;
    TextLabel.BackgroundTransparency = 1;
    TextLabel.Font = Enum.Font.Arial;
    TextLabel.TextColor3 = Color3.new(1, 1, 1);
    TextLabel.TextStrokeTransparency = 0;
    TextLabel.Size = UDim2.fromOffset(100, 40);
    TextLabel.TextScaled = true;
    TextLabel.TextWrapped = true;
    TextLabel.Parent = Frame;
    local v11 = TextLabel:Clone();
    v11.Position = UDim2.fromOffset(0, 40);
    v11.Text = "v";
    v11.Parent = Frame;
    BillboardGui.Parent = PlayerGui;
    p8.bill = BillboardGui;
    p8.head = v9;
    p8.root = Character;
    p8.humanoid = Character2;
end;

function v1.init() -- Line: 94
    -- upvalues: RemoteEventHandler (copy), Players (copy), u2 (copy), u3 (ref), LocalPlayer (copy), updateTarget (copy), RunService (copy), untrack (copy)
    RemoteEventHandler.AttachCallback("Track", function(u12: userdata, u13: boolean?) -- Line: 95
        -- upvalues: Players (ref), u2 (ref), u3 (ref), LocalPlayer (ref), updateTarget (ref), RunService (ref)
        if not u12 or u12.Parent ~= Players then
            return;
        end;

        local v14 = u2[u12];

        if v14 then
            u2[u12] = nil;
            v14.removingConnection:Disconnect();

            if v14.bill then
                v14.bill:Destroy();
                v14.bill = nil;
            end;

            if not next(u2) and u3 then
                u3:Disconnect();
                u3 = nil;
            end;
        end;

        if not (u13 or u12.Character and LocalPlayer.Character) then
            return;
        end;

        local u15 = {};
        u2[u12] = u15;
        u15.removingConnection = u12.CharacterRemoving:Connect(function() -- Line: 105
            -- upvalues: u13 (copy), u15 (copy), u12 (copy), u2 (ref), u3 (ref)
            if u13 then
                local v16 = u15;

                if v16.bill then
                    v16.bill:Destroy();
                    v16.bill = nil;
                end;
            else
                local v17 = u12;
                local v18 = u2[v17];

                if not v18 then
                    return;
                end;

                u2[v17] = nil;
                v18.removingConnection:Disconnect();

                if v18.bill then
                    v18.bill:Destroy();
                    v18.bill = nil;
                end;

                if not next(u2) and u3 then
                    u3:Disconnect();
                    u3 = nil;
                end;
            end;
        end);
        updateTarget(u12, u15);

        if not u3 then
            u3 = RunService.Heartbeat:Connect(function() -- Line: 114
                -- upvalues: u2 (ref), updateTarget (ref)
                for i, v in u2 do
                    updateTarget(i, v);
                end;
            end);
        end;
    end);
    RemoteEventHandler.AttachCallback("Untrack", function(p19: table?) -- Line: 121
        -- upvalues: u2 (ref), u3 (ref)
        if p19 then
            for _, v in p19 do
                local v20 = u2[v];

                if v20 then
                    u2[v] = nil;
                    v20.removingConnection:Disconnect();

                    if v20.bill then
                        v20.bill:Destroy();
                        v20.bill = nil;
                    end;

                    if not next(u2) and u3 then
                        u3:Disconnect();
                        u3 = nil;
                    end;
                end;
            end;

            return;
        end;

        for i in u2 do
            local v21 = u2[i];

            if v21 then
                u2[i] = nil;
                v21.removingConnection:Disconnect();

                if v21.bill then
                    v21.bill:Destroy();
                    v21.bill = nil;
                end;

                if not next(u2) and u3 then
                    u3:Disconnect();
                    u3 = nil;
                end;
            end;
        end;
    end);
    Players.PlayerRemoving:Connect(untrack);
end;

return v1;
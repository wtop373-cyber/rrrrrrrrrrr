-- ============================================================
-- SCRIPT: WarnScreen
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.Gui.WarnScreen
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui");
local RemoteEventHandler = require(ReplicatedStorage.Shared.Utils.RemoteEventHandler);
local vide = require(ReplicatedStorage.Packages.vide);
local create = vide.create;
local _ = vide.action;
local v1 = {};

local function createScreen() -- Line: 18
    -- upvalues: create (copy), PlayerGui (copy)
    return create("ScreenGui")({
        DisplayOrder = 20000000,
        Parent = PlayerGui,
        ZIndexBehavior = Enum.ZIndexBehavior.Global,
        ScreenInsets = Enum.ScreenInsets.None
    });
end;

local function createMessage(p2: table) -- Line: 28
    -- upvalues: create (copy)
    local v3 = `You have been warned for: [{p2.reason}]. Click acknowledge to continue playing.`;

    return create("TextLabel")({
        BackgroundTransparency = 1,
        TextSize = 21,
        TextWrapped = true,
        Size = UDim2.fromScale(1, 0.2),
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0),
        Text = v3,
        TextColor3 = Color3.fromRGB(255, 160, 44),
        AutomaticSize = Enum.AutomaticSize.Y,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top
    });
end;

local function createAcknowledgeButton(u4: userdata) -- Line: 47
    -- upvalues: create (copy), RemoteEventHandler (copy)
    local v5 = create("TextButton")({
        Text = "Acknowledge and continue.",
        TextSize = 21,
        TextWrapped = true,
        BackgroundTransparency = 0.1,
        Size = UDim2.fromScale(1, 0.2),
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 1),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Color3.new(0.219608, 0.219608, 0.219608),

        Activated = function() -- Line: 59, Name: Activated
            -- upvalues: RemoteEventHandler (ref), u4 (copy)
            RemoteEventHandler.FireServer("AcknowledgedWarning");
            u4:Destroy();
        end
    });
    create("UIStroke")({
        Color = Color3.new(0.501961, 0.431373, 0.431373),
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    }).Parent = v5;

    return v5;
end;

local function createDisplay(p6: table) -- Line: 74
    -- upvalues: create (copy), createMessage (copy), createAcknowledgeButton (copy)
    local v7 = create("Frame")({
        BackgroundTransparency = 0,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.new(0, 0, 0)
    });
    local v8 = create("Frame")({
        BackgroundTransparency = 0.1,
        Size = UDim2.fromScale(0.3, 0.2),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundColor3 = Color3.new(0.219608, 0.219608, 0.219608)
    });
    v8.Parent = v7;
    createMessage(p6).Parent = v8;
    createAcknowledgeButton(v7).Parent = v8;

    return v7;
end;

function v1.new() -- Line: 97
    -- upvalues: create (copy), PlayerGui (copy), RemoteEventHandler (copy), createDisplay (copy)
    local u9 = create("ScreenGui")({
        DisplayOrder = 20000000,
        Parent = PlayerGui,
        ZIndexBehavior = Enum.ZIndexBehavior.Global,
        ScreenInsets = Enum.ScreenInsets.None
    });
    RemoteEventHandler.AttachCallback("PromptWarning", function(...) -- Line: 100
        -- upvalues: createDisplay (ref), u9 (copy)
        createDisplay(...).Parent = u9;
    end);

    return {};
end;

return v1.new();
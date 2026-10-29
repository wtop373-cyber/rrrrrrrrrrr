-- ============================================================
-- SCRIPT: Alert
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.Gui.Alert
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local AdonisTheme = require(ReplicatedStorage.Shared.Utils.AdonisTheme);
local RemoteEventHandler = require(ReplicatedStorage.Shared.Utils.RemoteEventHandler);
local ResizableFrame = require(ReplicatedStorage.Shared.Utils.ResizableFrame);
local u1 = {};
u1.__index = u1;
local u2 = nil;

local function soundId(p3) -- Line: 13
    if type(p3) == "number" or type(p3) == "string" and p3:match("^%d+$") then
        return "rbxassetid://" .. tostring(p3);
    end;

    return (type(p3) ~= "string" or p3 == "") and "rbxassetid://143969658" or p3;
end;

function u1.new(p4) -- Line: 23
    -- upvalues: u2 (ref), u1 (copy), AdonisTheme (copy), Players (copy), ResizableFrame (copy)
    if u2 then
        u2:Destroy();
    end;

    local u5 = setmetatable({}, u1);
    u2 = u5;
    local v6, v7, v8 = AdonisTheme.Window(p4.Title or "Alert", Vector2.new(300, 150), "Priority high");
    u5.Ui = v6;
    AdonisTheme.Control("TextLabel", {
        Name = "Message",
        TextScaled = true,
        TextWrapped = true,
        BackgroundTransparency = 1,
        Text = p4.Message or "",
        Size = UDim2.new(1, -10, 1, -10),
        Position = UDim2.fromOffset(5, 5)
    }, v7);
    u5.sound = Instance.new("Sound");
    local sound = u5.sound;
    local SoundId = p4.SoundId;
    local v9;

    if type(SoundId) == "number" or type(SoundId) == "string" and SoundId:match("^%d+$") then
        v9 = "rbxassetid://" .. tostring(SoundId);
    else
        v9 = (type(SoundId) ~= "string" or SoundId == "") and "rbxassetid://143969658" or SoundId;
    end;

    sound.SoundId = v9;
    u5.sound.Volume = 1;
    u5.sound.Looped = true;
    u5.sound.Parent = v6;
    u5.sound:Play();
    local u10 = AdonisTheme.Control("ImageButton", {
        Name = "Mute",
        Image = "rbxassetid://1638551696",
        BackgroundTransparency = 0.5,
        BackgroundColor3 = Color3.new(),
        Position = UDim2.new(1, -97, 0, 0),
        Size = UDim2.fromOffset(30, 20)
    }, v8);
    u10.Activated:Connect(function() -- Line: 55
        -- upvalues: u5 (copy), u10 (copy)
        u5.muted = not u5.muted;
        u5.sound.Volume = u5.muted and 0 or 1;
        u10.Image = u5.muted and "rbxassetid://1638584675" or "rbxassetid://1638551696";
    end);
    v8.Close.Activated:Connect(function() -- Line: 60
        -- upvalues: u5 (copy)
        u5:Destroy();
    end);
    v6.Parent = Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("GobUi");
    ResizableFrame.new({
        resizable = true,
        dragable = true,
        frame = v6,
        dragFrame = v8
    });

    return u5;
end;

function u1.Destroy(p11) -- Line: 67
    -- upvalues: u2 (ref)
    if p11.destroyed then
        return;
    end;

    p11.destroyed = true;

    if u2 == p11 then
        u2 = nil;
    end;

    p11.Ui:Destroy();
end;

RemoteEventHandler.AttachCallback("Alert", u1.new);

return u1;
-- ============================================================
-- SCRIPT: Countdown
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.Gui.Countdown
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local AdonisTheme = require(ReplicatedStorage.Shared.Utils.AdonisTheme);
local RemoteEventHandler = require(ReplicatedStorage.Shared.Utils.RemoteEventHandler);
local ResizableFrame = require(ReplicatedStorage.Shared.Utils.ResizableFrame);
local u1 = {};
u1.__index = u1;

function u1.new(u2) -- Line: 9
    -- upvalues: u1 (copy), AdonisTheme (copy), Players (copy), ResizableFrame (copy), RemoteEventHandler (copy)
    local u3 = setmetatable({}, u1);
    local v4, v5, v6 = AdonisTheme.Window("Countdown", Vector2.new(215, 145), "Hourglass full");
    u3.Ui = v4;
    v4.Position = UDim2.new(0, 10, 1, -180);
    local u7 = AdonisTheme.Control("TextLabel", {
        Name = "Count",
        TextSize = 80,
        BackgroundTransparency = 1,
        Text = tostring(u2.Duration),
        Font = Enum.Font.Arial,
        Size = UDim2.fromScale(1, 1)
    }, v5);
    local u8 = AdonisTheme.Control("TextLabel", {
        Name = "Elapsed",
        Text = "",
        TextSize = 14,
        BackgroundTransparency = 1,
        TextTransparency = 0.5,
        TextXAlignment = Enum.TextXAlignment.Right,
        Position = UDim2.new(0, 0, 1, -20),
        Size = UDim2.new(1, -5, 0, 20)
    }, v5);
    local Sound = Instance.new("Sound");
    Sound.SoundId = "rbxassetid://151715959";
    Sound.Volume = 0.25;
    Sound.Parent = v4;
    local u9 = AdonisTheme.Control("ImageButton", {
        Name = "Mute",
        Image = "rbxassetid://1638551696",
        BackgroundTransparency = 0.5,
        BackgroundColor3 = Color3.new(),
        Position = UDim2.new(1, -97, 0, 0),
        Size = UDim2.fromOffset(30, 20)
    }, v6);
    u9.Activated:Connect(function() -- Line: 44
        -- upvalues: u3 (copy), Sound (copy), u9 (copy)
        u3.muted = not u3.muted;
        Sound.Volume = u3.muted and 0 or 0.25;
        u9.Image = u3.muted and "rbxassetid://1638584675" or "rbxassetid://1638551696";
    end);
    v6.Close.Activated:Connect(function() -- Line: 49
        -- upvalues: u3 (copy)
        u3:Destroy();
    end);
    v4.Parent = Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("GobUi");
    ResizableFrame.new({
        resizable = true,
        dragable = true,
        frame = v4,
        dragFrame = v6
    });
    u3.connection = RemoteEventHandler.AttachCallback("StopCountdown", function() -- Line: 54
        -- upvalues: u3 (copy)
        u3:Destroy();
    end);
    u3.timer = task.spawn(function() -- Line: 57
        -- upvalues: u2 (copy), u7 (copy), u8 (copy), Sound (copy), u3 (copy)
        local math_floor_ret = math.floor(u2.Duration);
        local math_max_ret = math.max(0, math_floor_ret);

        for i = math_max_ret, 0, -1 do
            u7.Text = tostring(i);
            u8.Text = tostring(math_max_ret - i) .. "s";

            if i == 0 then
                Sound.SoundId = "rbxassetid://267883066";
            end;

            Sound:Play();
            task.wait(1);
            local _ = i;
        end;

        u3.timer = nil;
        u3:Destroy();
    end);

    return u3;
end;

function u1.Destroy(p10) -- Line: 73
    if p10.destroyed then
        return;
    end;

    p10.destroyed = true;

    if p10.connection then
        p10.connection:Disconnect();
        p10.connection = nil;
    end;

    if p10.timer then
        task.cancel(p10.timer);
        p10.timer = nil;
    end;

    p10.Ui:Destroy();
end;

RemoteEventHandler.AttachCallback("Countdown", u1.new);

return u1;
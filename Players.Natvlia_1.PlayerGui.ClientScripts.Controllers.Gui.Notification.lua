-- ============================================================
-- SCRIPT: Notification
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.Gui.Notification
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local TextService = game:GetService("TextService");
local Debris = game:GetService("Debris");
local AdonisTheme = require(ReplicatedStorage.Shared.Utils.AdonisTheme);
local RemoteEventHandler = require(ReplicatedStorage.Shared.Utils.RemoteEventHandler);
local u1 = require(ReplicatedStorage.Shared.Utils.BindableEventHandler).New("CreateReplyBox");
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui");
local u2 = {};
u2.__index = u2;
local u3 = nil;
local u4 = 0;

local function getHolder() -- Line: 14
    -- upvalues: u3 (ref), AdonisTheme (copy), PlayerGui (copy)
    if u3 and u3.Parent then
        return u3;
    end;

    local v5 = AdonisTheme.Clone("NotificationHolder");
    v5.Name = "GobNotifications";
    v5.ResetOnSpawn = false;
    v5.Enabled = true;
    AdonisTheme.MountScreen(v5, PlayerGui);
    u3 = v5.ScrollingFrame;
    u3.AutomaticCanvasSize = Enum.AutomaticSize.Y;
    u3.CanvasSize = UDim2.new();

    return u3;
end;

function u2.new(p6) -- Line: 29
    -- upvalues: u2 (copy), getHolder (copy), AdonisTheme (copy), u4 (ref), TextService (copy), Debris (copy)
    local u7 = setmetatable({}, u2);
    u7.props = p6;
    local u8 = getHolder();
    local v9 = u8.CanvasPosition.Y >= u8.AbsoluteCanvasSize.Y - u8.AbsoluteSize.Y - 5;
    u7.Ui = AdonisTheme.Clone("Notification");
    u7.Ui.Visible = true;
    u4 = u4 + 1;
    u7.Ui.LayoutOrder = u4;
    local Frame = u7.Ui.Frame;
    Frame.Title.Text = p6.Title or "Notification";
    Frame.Main.Text = p6.Message or "";
    Frame.Icon.Image = p6.Icon or "rbxassetid://7510999669";
    local v10 = TextService:GetTextSize(Frame.Main.Text, Frame.Main.TextSize, Frame.Main.Font, Vector2.new(229, 2147483647)).Y + 5;
    local Ui = u7.Ui;
    Ui.Size = Ui.Size + UDim2.fromOffset(0, v10);
    local Main = Frame.Main;
    Main.Size = Main.Size + UDim2.fromOffset(0, v10);
    u7.Ui.Parent = u8;

    if v9 then
        task.defer(function() -- Line: 53
            -- upvalues: u7 (copy), u8 (copy)
            if not u7.destroyed then
                u8.CanvasPosition = Vector2.new(0, (math.max(0, u8.AbsoluteCanvasSize.Y - u8.AbsoluteSize.Y)));
            end;
        end);
    end;

    Frame.Main.Activated:Connect(function() -- Line: 62
        -- upvalues: u7 (copy)
        u7:Activate();
    end);
    Frame.Close.Activated:Connect(function() -- Line: 65
        -- upvalues: u7 (copy)
        u7:Destroy();
    end);
    local Sound = Instance.new("Sound");
    Sound.SoundId = "rbxassetid://203785584";
    Sound.Volume = 0.2;
    Sound.Parent = workspace.CurrentCamera;
    Sound:Play();
    Debris:AddItem(Sound, 0.5);

    if type(p6.Timeout) == "number" and p6.Timeout > 0 then
        Frame.Timer.Visible = true;
        local u11 = os.clock() + p6.Timeout;
        u7.timer = task.spawn(function() -- Line: 77
            -- upvalues: u7 (copy), u11 (copy), Frame (copy)
            while not u7.destroyed do
                local v12 = u11 - os.clock();

                if v12 <= 0 then
                    break;
                end;

                local Timer = Frame.Timer;
                local math_ceil_ret = math.ceil(v12);
                Timer.Text = tostring(math_ceil_ret);
                task.wait((math.min(1, v12)));
            end;

            u7.timer = nil;
            u7:Destroy();
        end);
    end;

    return u7;
end;

function u2.Activate(p13) -- Line: 93
    -- upvalues: u1 (copy), RemoteEventHandler (copy)
    if p13.destroyed then
        return;
    end;

    p13:Destroy();
    local props = p13.props;

    if props.ChannelId then
        local v14 = {};
        local v15;

        if props.ReplyMessage == nil then
            v15 = props.Message;
        else
            v15 = props.ReplyMessage;
        end;

        v14.Message = v15;
        local v16;

        if props.ReplyTitle == nil then
            v16 = props.Title;
        else
            v16 = props.ReplyTitle;
        end;

        v14.Title = v16;
        v14.ChannelId = props.ChannelId;
        u1:Fire(v14);
    end;

    if props.EventKey then
        RemoteEventHandler.FireServer(props.EventKey);
    end;
end;

function u2.Destroy(p17) -- Line: 113
    -- upvalues: u3 (ref)
    if p17.destroyed then
        return;
    end;

    p17.destroyed = true;

    if p17.timer then
        task.cancel(p17.timer);
        p17.timer = nil;
    end;

    local Parent = p17.Ui.Parent;
    p17.Ui:Destroy();

    if Parent then
        local v18 = false;

        for _, child in Parent:GetChildren() do
            if child:IsA("GuiObject") then
                v18 = true;
                break;
            end;
        end;

        if not v18 then
            Parent.Parent:Destroy();

            if u3 == Parent then
                u3 = nil;
            end;
        end;
    end;
end;

RemoteEventHandler.AttachCallback("Notify", u2.new);

return u2;
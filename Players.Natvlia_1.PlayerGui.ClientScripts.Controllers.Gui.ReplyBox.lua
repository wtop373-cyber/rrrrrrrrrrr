-- ============================================================
-- SCRIPT: ReplyBox
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.Gui.ReplyBox
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local AdonisTheme = require(ReplicatedStorage.Shared.Utils.AdonisTheme);
local RemoteEventHandler = require(ReplicatedStorage.Shared.Utils.RemoteEventHandler);
local v1 = require(ReplicatedStorage.Shared.Utils.BindableEventHandler).New("CreateReplyBox");
local ResizableFrame = require(ReplicatedStorage.Shared.Utils.ResizableFrame);
local u2 = {};
u2.__index = u2;

function u2.new(u3) -- Line: 10
    -- upvalues: u2 (copy), AdonisTheme (copy), RemoteEventHandler (copy), Players (copy), ResizableFrame (copy)
    local u4 = setmetatable({}, u2);
    local v5, v6, v7 = AdonisTheme.Window(u3.Title or "Private Message", Vector2.new(300, 150));
    u4.Ui = v5;
    AdonisTheme.Control("TextLabel", {
        TextScaled = true,
        TextWrapped = true,
        BackgroundTransparency = 1,
        Text = u3.Message or "",
        Position = UDim2.fromOffset(5, 5),
        Size = UDim2.new(1, -10, 1, -40)
    }, v6);
    local u8 = AdonisTheme.Control("TextBox", {
        Name = "Reply",
        Text = "",
        PlaceholderText = "Enter reply",
        ClearTextOnFocus = false,
        TextScaled = true,
        Size = UDim2.new(1, -65, 0, 30),
        Position = UDim2.new(0, 5, 1, -35)
    }, v6);
    AdonisTheme.Control("TextButton", {
        Name = "Send",
        Text = "Send",
        Size = UDim2.fromOffset(60, 30),
        Position = UDim2.new(1, -65, 1, -35),
        BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    }, v6).Activated:Connect(function() -- Line: 38, Name: submit
        -- upvalues: u4 (copy), u8 (copy), RemoteEventHandler (ref), u3 (copy)
        if u4.destroyed or not u8.Text:find("%S") then
            return;
        end;

        local Text = u8.Text;
        u4:Destroy();
        RemoteEventHandler.FireServer("SendPrivateMessage", u3.ChannelId, Text);
    end);
    u8.FocusLost:Connect(function(p9) -- Line: 47
        -- upvalues: u4 (copy), u8 (copy), RemoteEventHandler (ref), u3 (copy)
        if p9 and not u4.destroyed then
            if not u8.Text:find("%S") then
                return;
            end;

            local Text = u8.Text;
            u4:Destroy();
            RemoteEventHandler.FireServer("SendPrivateMessage", u3.ChannelId, Text);
        end;
    end);
    v7.Close.Activated:Connect(function() -- Line: 52
        -- upvalues: u4 (copy)
        u4:Destroy();
    end);
    v5.Parent = Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("GobUi");
    ResizableFrame.new({
        resizable = true,
        dragable = true,
        frame = v5,
        dragFrame = v7
    });

    return u4;
end;

function u2.Destroy(p10) -- Line: 59
    if p10.destroyed then
        return;
    end;

    p10.destroyed = true;
    p10.Ui:Destroy();
end;

v1:AttachCallback(u2.new);

return u2;
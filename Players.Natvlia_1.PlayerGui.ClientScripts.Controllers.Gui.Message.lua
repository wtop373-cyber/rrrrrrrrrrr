-- ============================================================
-- SCRIPT: Message
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.Gui.Message
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local TweenService = game:GetService("TweenService");
local AdonisTheme = require(ReplicatedStorage.Shared.Utils.AdonisTheme);
local RemoteEventHandler = require(ReplicatedStorage.Shared.Utils.RemoteEventHandler);
local u1 = {};
u1.__index = u1;
local TweenInfo_new_ret = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
local TweenInfo_new_ret2 = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
local u2 = nil;

function u1.new(p3) -- Line: 12
    -- upvalues: u1 (copy), AdonisTheme (copy), Players (copy), u2 (ref), TweenService (copy), TweenInfo_new_ret (copy)
    local u4 = setmetatable({}, u1);
    local v5 = tostring(p3.Message or "");
    u4.Ui = Instance.new("ScreenGui");
    u4.Ui.Name = "GobMessage";
    u4.Ui.IgnoreGuiInset = true;
    AdonisTheme.MountScreen(u4.Ui, Players.LocalPlayer:WaitForChild("PlayerGui"), 2);

    if u2 then
        u2:Destroy(true);
    end;

    u2 = u4;
    u4.clone = AdonisTheme.Clone("Message");
    u4.clone.Top.Title.Text = p3.Title or "";
    u4.clone.Body["To Name Later"].Text = v5;
    u4.clone.Position = UDim2.fromScale(0, -1);
    u4.clone.Parent = u4.Ui;
    TweenService:Create(u4.clone, TweenInfo_new_ret, {
        Position = u4:layout()
    }):Play();
    u4.resized = u4.Ui:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() -- Line: 30
        -- upvalues: TweenService (ref), u4 (copy), TweenInfo_new_ret (ref)
        TweenService:Create(u4.clone, TweenInfo_new_ret, {
            Position = u4:layout()
        }):Play();
    end);
    local os_clock_ret = os.clock();
    u4.clone.TextButton.MouseButton1Click:Connect(function() -- Line: 34
        -- upvalues: os_clock_ret (copy), u4 (copy)
        if os.clock() - os_clock_ret >= 1 then
            u4:Destroy();
        end;
    end);
    local v6 = tonumber(p3.Time) or #v5 * 0.1 + 1;
    local math_floor_ret = math.floor(v6 + 0.5);
    u4.timer = task.spawn(function() -- Line: 41
        -- upvalues: u4 (copy), math_floor_ret (copy)
        local Left = u4.clone.Top.Left;

        for i = math_floor_ret, 1, -1 do
            Left.Text = `{i}.00`;
            task.wait(1);
            local _ = i;
        end;

        Left.Text = "Closing..";
        task.wait(0.3);
        u4.timer = nil;
        u4:Destroy();
    end);

    return u4;
end;

function u1.layout(p7) -- Line: 59
    local clone = p7.clone;
    clone.Size = UDim2.new(1, 0, 0, p7.Ui.AbsoluteSize.Y);
    local math_ceil_ret = math.ceil(clone.Body["To Name Later"].TextBounds.Y);
    local v8 = (math_ceil_ret < 30 and 30 or math_ceil_ret + 15) + clone.Top.Size.Y.Offset;
    clone.Size = UDim2.new(1, 0, 0, v8);

    return UDim2.new(0, 0, 0.5, -v8 / 2);
end;

function u1.Destroy(p9, p10) -- Line: 68
    -- upvalues: u2 (ref), TweenService (copy), TweenInfo_new_ret2 (copy)
    if p9.destroyed then
        return;
    end;

    p9.destroyed = true;

    if u2 == p9 then
        u2 = nil;
    end;

    if p9.timer then
        task.cancel(p9.timer);
        p9.timer = nil;
    end;

    if p9.resized then
        p9.resized:Disconnect();
    end;

    local Ui = p9.Ui;

    if p10 then
        Ui:Destroy();

        return;
    end;

    local v11 = TweenService:Create(p9.clone, TweenInfo_new_ret2, {
        Position = UDim2.fromScale(0, 1)
    });
    v11.Completed:Once(function() -- Line: 89
        -- upvalues: Ui (copy)
        Ui:Destroy();
    end);
    v11:Play();
end;

RemoteEventHandler.AttachCallback("ForceMessage", u1.new);

return u1;
-- ============================================================
-- SCRIPT: Notification
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Notification
-- ============================================================

-- Decompiled with Potassium's decompiler.

local u1 = {};
u1.__index = u1;
u1.CurrentTabs = {};
local NewModules = game:GetService("ReplicatedStorage"):WaitForChild("NewModules");
local ViewportCharacter = require(NewModules.Client.Services.ViewportCharacter);

function u1.Remove(u2) -- Line: 10
    -- upvalues: u1 (copy)
    if u2.removing then
        return;
    end;

    u2.removing = true;
    u2.frame2:TweenPosition(UDim2.new(1.02, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.6, true);
    table.remove(u1.CurrentTabs, table.find(u1.CurrentTabs, u2));
    delay(0.6, function() -- Line: 24
        -- upvalues: u2 (copy)
        u2.frame:Destroy();
    end);
end;

function u1.Display(u3, p4) -- Line: 29
    u3.frame2.Position = UDim2.new(1.02, 0, 0, 0);
    u3.frame.Visible = true;
    u3.frame2:TweenPosition(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.4, true);

    if u3.button1 then
        delay(0.4, function() -- Line: 41
            -- upvalues: u3 (copy)
            u3.button1.MouseButton1Down:Connect(function() -- Line: 42
                -- upvalues: u3 (ref)
                u3:Remove();
            end);
        end);
    end;

    delay(p4 + 1, function() -- Line: 47
        -- upvalues: u3 (copy)
        u3:Remove();
    end);
end;

function u1.AttemptClear() -- Line: 52
    -- upvalues: u1 (copy)
    if #u1.CurrentTabs > 3 then
        u1.CurrentTabs[1]:Remove();
    end;
end;

function u1.new(p5, p6) -- Line: 59
    -- upvalues: u1 (copy), ViewportCharacter (copy)
    local v7 = {};
    setmetatable(v7, u1);
    v7.tab = p5;

    if p5.Button1 then
        v7.frame = script.Template_Button:Clone();
        v7.frame2 = v7.frame.Frame;
        v7.frame2.Button1.Text = p5.Button1;
        v7.frame2.Button1.Visible = true;
    else
        v7.frame = script.Template:Clone();
        v7.frame2 = v7.frame.Frame;
    end;

    v7.frame.LayoutOrder = #p6:GetChildren() - 1;
    v7.frame.Visible = false;
    v7.button1 = p5.Button1 and v7.frame2.Button1;
    v7.holder = p6;
    v7.frame2.NotificationText.Text = p5.Text;
    v7.frame2.NotificationTitle.Text = p5.Title;

    if p5.Icon or p5.ViewportIcon then
        v7.frame2.NotificationTitle.Position = UDim2.new(0, 64, 0.5, -16);
        v7.frame2.NotificationTitle.Size = UDim2.new(0, 0, 0, 0);
        v7.frame2.NotificationText.Position = UDim2.new(0, 64, 0.5, -3);
        v7.frame2.NotificationText.Size = UDim2.new(1, -64, 0, 28);
    else
        v7.frame2.NotificationTitle.Position = UDim2.new(0.5, 0, 0.5, -16);
        v7.frame2.NotificationTitle.Size = UDim2.new(0, 0, 0, 0);
        v7.frame2.NotificationTitle.TextXAlignment = Enum.TextXAlignment.Center;
        v7.frame2.NotificationTitle.AnchorPoint = Vector2.new(0.5, 0);
        v7.frame2.NotificationText.Position = UDim2.new(0.5, 0, 0.5, -3);
        v7.frame2.NotificationText.Size = UDim2.new(1, -25, 0, 28);
        v7.frame2.NotificationText.TextXAlignment = Enum.TextXAlignment.Center;
        v7.frame2.NotificationText.AnchorPoint = Vector2.new(0.5, 0);
    end;

    if p5.Icon then
        v7.frame2.NotificationImage.Visible = true;
        v7.frame2.NotificationImage.Image = p5.Icon;
        v7.frame2.NotificationImage.ImageColor3 = p5.ImageColor3 or Color3.new(1, 1, 1);
    elseif p5.ViewportIcon then
        v7.frame2.NotificationImage.Visible = false;
        ViewportCharacter(p5.ViewportIcon, v7.frame2.ViewportFrame, 3, 40);
        v7.frame2.ViewportFrame.Visible = true;
    else
        v7.frame2.NotificationImage.Visible = false;
        v7.frame2.ViewportFrame.Visible = false;
    end;

    v7.frame.Parent = p6;
    table.insert(u1.CurrentTabs, v7);
    u1.AttemptClear();
    v7:Display(p5.Duration or 3);

    return v7;
end;

return u1;
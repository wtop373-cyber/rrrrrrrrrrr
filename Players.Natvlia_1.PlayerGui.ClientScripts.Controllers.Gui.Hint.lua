-- ============================================================
-- SCRIPT: Hint
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.Gui.Hint
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local TweenService = game:GetService("TweenService");
local AdonisTheme = require(ReplicatedStorage.Shared.Utils.AdonisTheme);
local RemoteEventHandler = require(ReplicatedStorage.Shared.Utils.RemoteEventHandler);
local u1 = {};
u1.__index = u1;
local TweenInfo_new_ret = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
local u2 = nil;
local u3 = nil;

function u1.new(p4, p5, p6) -- Line: 12
    -- upvalues: u1 (copy), u2 (ref), u3 (ref), AdonisTheme (copy), Players (copy), TweenService (copy), TweenInfo_new_ret (copy)
    local u7 = setmetatable({}, u1);
    local v8 = tostring(p4 or "");

    if u2 then
        u2:Destroy(true);
    end;

    if not (u3 and u3.Parent) then
        u3 = Instance.new("ScreenGui");
        u3.Name = "GobHints";
        u3.IgnoreGuiInset = true;
        AdonisTheme.MountScreen(u3, Players.LocalPlayer:WaitForChild("PlayerGui"));
    end;

    u7.clone = AdonisTheme.Clone("Hint");
    u7.clone.Top.Title.Text = (not p5 or p5 == "") and " " or p5;
    u7.clone.Body["To Name Later"].Text = v8;
    u7.clone.Position = UDim2.fromScale(0, -1);
    u7.clone.Parent = u3;
    u7.clone.TextButton.MouseButton1Click:Connect(function() -- Line: 29
        -- upvalues: u7 (copy)
        u7:Destroy();
    end);
    u2 = u7;
    TweenService:Create(u7.clone, TweenInfo_new_ret, {
        Position = UDim2.new()
    }):Play();
    u7.timer = task.delay(p6 or #v8 * 0.1 + 1, function() -- Line: 34
        -- upvalues: u7 (copy)
        u7.timer = nil;
        u7:Destroy();
    end);

    return u7;
end;

function u1.Destroy(p9, p10) -- Line: 41
    -- upvalues: u2 (ref), TweenService (copy), TweenInfo_new_ret (copy), u3 (ref)
    if p9.destroyed then
        return;
    end;

    p9.destroyed = true;

    if p9.timer then
        task.cancel(p9.timer);
        p9.timer = nil;
    end;

    if u2 == p9 then
        u2 = nil;
    end;

    local clone = p9.clone;

    if p10 then
        clone:Destroy();

        return;
    end;

    local v11 = TweenService:Create(clone, TweenInfo_new_ret, {
        Position = UDim2.fromOffset(0, -clone.AbsoluteSize.Y)
    });
    v11.Completed:Once(function() -- Line: 60
        -- upvalues: clone (copy), u2 (ref), u3 (ref)
        clone:Destroy();

        if not u2 and u3 then
            u3:Destroy();
            u3 = nil;
        end;
    end);
    v11:Play();
end;

RemoteEventHandler.AttachCallback("Hint", u1.new);

return u1;
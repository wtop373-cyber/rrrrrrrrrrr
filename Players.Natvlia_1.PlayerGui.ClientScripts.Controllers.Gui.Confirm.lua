-- ============================================================
-- SCRIPT: Confirm
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.Gui.Confirm
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local TextService = game:GetService("TextService");
local TweenService = game:GetService("TweenService");
local AdonisTheme = require(ReplicatedStorage.Shared.Utils.AdonisTheme);
local RemoteEventHandler = require(ReplicatedStorage.Shared.Utils.RemoteEventHandler);
local u1 = {};
u1.__index = u1;
local TweenInfo_new_ret = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);

function u1.new(p2, p3) -- Line: 11
    -- upvalues: u1 (copy), AdonisTheme (copy), TextService (copy), Players (copy), TweenService (copy), TweenInfo_new_ret (copy)
    local u4 = setmetatable({
        CommandId = p3
    }, u1);
    local v5 = tostring(p2 or "");
    u4.Ui = AdonisTheme.Clone("YesNoPrompt");
    u4.Ui.ZIndex = 10000;
    local Body = u4.Ui.Body;
    u4.Ui.Top.Title.Text = "Yes/No Prompt";
    Body.Ques.Text = v5;
    Body.Command.Text = " ";
    local v6 = TextService:GetTextSize(v5, Body.Ques.TextSize, Body.Ques.Font, Vector2.new(u4.Ui.Size.X.Offset * Body.Ques.Size.X.Scale, 2147483647)).Y + 1 - Body.Ques.Size.Y.Offset;
    local math_max_ret = math.max(0, v6);
    local Ui = u4.Ui;
    Ui.Size = Ui.Size + UDim2.fromOffset(0, math_max_ret);
    local Ques = Body.Ques;
    Ques.Size = Ques.Size + UDim2.fromOffset(0, math_max_ret);
    local Command = Body.Command;
    Command.Position = Command.Position + UDim2.fromOffset(0, math_max_ret);
    local Size = u4.Ui.Size;
    u4.Ui.Position = UDim2.new(0.5, -Size.X.Offset / 2, 0, -Size.Y.Offset);
    Body.Options.Confirm.Activated:Connect(function() -- Line: 38
        -- upvalues: u4 (copy)
        u4:confirm();
    end);
    Body.Options.Cancel.Activated:Connect(function() -- Line: 41
        -- upvalues: u4 (copy)
        u4:decline();
    end);
    u4.Ui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("GobUi");
    TweenService:Create(u4.Ui, TweenInfo_new_ret, {
        Position = UDim2.new(0.5, -Size.X.Offset / 2, 0.5, -Size.Y.Offset / 2)
    }):Play();

    return u4;
end;

function u1.answer(p7, p8) -- Line: 53
    -- upvalues: RemoteEventHandler (copy)
    if p7.destroyed then
        return;
    end;

    p7:Destroy();
    RemoteEventHandler.FireServer("AnswerRequest", p7.CommandId, p8);
end;

function u1.confirm(p9) -- Line: 60
    p9:answer(true);
end;

function u1.decline(p10) -- Line: 63
    p10:answer(false);
end;

function u1.Destroy(p11) -- Line: 66
    -- upvalues: TweenService (copy), TweenInfo_new_ret (copy)
    if p11.destroyed then
        return;
    end;

    p11.destroyed = true;
    local Ui = p11.Ui;
    local v12 = TweenService:Create(Ui, TweenInfo_new_ret, {
        Position = UDim2.new(0.5, -Ui.Size.X.Offset / 2, 1, 0)
    });
    v12.Completed:Once(function() -- Line: 74
        -- upvalues: Ui (copy)
        Ui:Destroy();
    end);
    v12:Play();
end;

RemoteEventHandler.AttachCallback("PromptAnswer", u1.new);

return u1;
-- ============================================================
-- SCRIPT: VoteWindow
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.Gui.VoteWindow
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local AdonisTheme = require(ReplicatedStorage.Shared.Utils.AdonisTheme);
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui");
local RemoteEventHandler = require(ReplicatedStorage.Shared.Utils.RemoteEventHandler);
local ResizableFrame = require(ReplicatedStorage.Shared.Utils.ResizableFrame);
local VoteWindow = ReplicatedStorage:WaitForChild("Assets"):FindFirstChild("AdonisUi").folder.VoteWindow;
local u1 = {};
u1.__index = u1;
local u2 = nil;

function u1.new(p3: table) -- Line: 22
    -- upvalues: u2 (ref), u1 (copy)
    if u2 then
        u2:Destroy();
    end;

    local v4 = setmetatable({}, u1);
    v4.VoteId = p3.VoteId;
    v4.Question = p3.Question or "";
    v4.Options = p3.Options or {};
    v4._connections = {};
    v4.voted = false;
    v4.Ui = nil;
    u2 = v4;
    v4:setupUi();

    return v4;
end;

function u1.setupUi(u5) -- Line: 40
    -- upvalues: PlayerGui (copy), u2 (ref), AdonisTheme (copy), VoteWindow (copy), ResizableFrame (copy)
    local GobUi = PlayerGui:WaitForChild("GobUi", 10);

    if not (GobUi and (u2 == u5 and u5._connections)) then
        return;
    end;

    local v6 = AdonisTheme.StyleWindow(VoteWindow:Clone(), "Poll");
    v6.Parent = GobUi;
    v6.Visible = true;
    u5.Ui = v6;
    v6.Body.Question.Text = u5.Question;
    ResizableFrame.new({
        resizable = true,
        dragable = true,
        frame = v6,
        dragFrame = v6.TitleBar
    });
    table.insert(u5._connections, v6.TitleBar.Close.Activated:Connect(function() -- Line: 64
        -- upvalues: u5 (copy)
        u5:Destroy();
    end));
    local Options = v6.Body.Options;

    for _, child in Options:GetChildren() do
        if child:IsA("GuiButton") then
            child:Destroy();
        end;
    end;

    local OptionTemplate = v6.OptionTemplate;

    for i, v in u5.Options do
        local v7 = OptionTemplate:Clone();
        v7.Name = "Option" .. i;
        v7.Visible = true;
        v7.LayoutOrder = i;
        v7.Label.Text = i .. ". " .. v;
        v7.Bar.Size = UDim2.new(1, 0, 1, 0);
        v7.Activated:Connect(function() -- Line: 85
            -- upvalues: u5 (copy), i (copy)
            u5:submit(i);
        end);
        v7.Parent = Options;
    end;
end;

function u1.submit(p8: any, p9: number) -- Line: 92
    -- upvalues: RemoteEventHandler (copy)
    if p8._destroyed or p8.voted then
        return;
    end;

    p8.voted = true;
    RemoteEventHandler.FireServer("SubmitVote", p8.VoteId, p9);
    p8:Destroy();
end;

function u1.Destroy(u10) -- Line: 101
    -- upvalues: u2 (ref)
    if u10._destroyed then
        return;
    end;

    u10._destroyed = true;

    for _, v in u10._connections do
        pcall(function() -- Line: 107
            -- upvalues: v (copy)
            v:Disconnect();
        end);
    end;

    if u10.Ui then
        pcall(function() -- Line: 112
            -- upvalues: u10 (copy)
            u10.Ui:Destroy();
        end);
    end;

    if u2 == u10 then
        u2 = nil;
    end;

    table.clear(u10._connections);
end;

RemoteEventHandler.AttachCallback("OpenVote", function(...) -- Line: 122
    -- upvalues: u1 (copy)
    u1.new(...);
end);
RemoteEventHandler.AttachCallback("CloseVote", function(p11) -- Line: 127
    -- upvalues: u2 (ref)
    if u2 and u2.VoteId == p11 then
        u2:Destroy();
    end;
end);

return u1;
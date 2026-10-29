-- ============================================================
-- SCRIPT: Starterpack
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface.Modules.Starterpack
-- ============================================================

-- Decompiled with Potassium's decompiler.

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local RunService = game:GetService("RunService");
local Players = game:GetService("Players");
local Events = ReplicatedStorage:WaitForChild("Events");
local Events2 = ReplicatedStorage:WaitForChild("Events2");
local StarterpackConfig = require(ReplicatedStorage.NewModules.Shared.Configuration.StarterpackConfig);
local Starterpack = Events.Starterpack;
local ActivateStarterpackPrompt = Events2.ActivateStarterpackPrompt;
local CoreGUI = script.Parent.Parent.CoreGUI;
local StarterpackFrame = CoreGUI:WaitForChild("StarterpackFrame");
local ExpireLabel = StarterpackFrame.ExpireLabel;
local PurchaseButton = StarterpackFrame.PurchaseButton;
local StarterpackPromptFrame = CoreGUI:WaitForChild("LevelFrame").StarterpackPromptFrame;
local u1 = nil;
local u2 = true;
local u3 = 0;
local u4 = false;

local function removeStarterPack() -- Line: 26
    -- upvalues: StarterpackFrame (copy), StarterpackPromptFrame (copy), u1 (ref)
    StarterpackFrame:Destroy();
    StarterpackPromptFrame:Destroy();

    if u1 then
        u1:Disconnect();
    end;
end;

local function onStarterpackBought() -- Line: 35
    -- upvalues: StarterpackFrame (copy), StarterpackPromptFrame (copy), u1 (ref)
    StarterpackFrame:Destroy();
    StarterpackPromptFrame:Destroy();

    if u1 then
        u1:Disconnect();
    end;
end;

StarterpackFrame.CloseButton.Activated:Connect(function() -- Line: 53
    -- upvalues: StarterpackFrame (copy), CoreGUI (copy)
    StarterpackFrame.Visible = false;

    if StarterpackFrame.Visible then
        CoreGUI.open:Play();

        return;
    end;

    CoreGUI.close:Play();
end);
StarterpackPromptFrame.Button.Activated:Connect(function(p5) -- Line: 39, Name: toggleStarterpackWindow
    -- upvalues: StarterpackFrame (copy), CoreGUI (copy)
    if p5 == nil then
        StarterpackFrame.Visible = not StarterpackFrame.Visible;
    else
        StarterpackFrame.Visible = p5;
    end;

    if StarterpackFrame.Visible then
        CoreGUI.open:Play();

        return;
    end;

    CoreGUI.close:Play();
end);
StarterpackPromptFrame.Button.MouseEnter:Connect(function() -- Line: 59
    -- upvalues: CoreGUI (copy)
    CoreGUI.hover:Play();
end);
Starterpack.OnClientEvent:Connect(function(p6) -- Line: 63
    -- upvalues: StarterpackFrame (copy), StarterpackPromptFrame (copy), u1 (ref), ActivateStarterpackPrompt (copy), u4 (ref), u3 (ref), RunService (copy), ExpireLabel (copy)
    if not p6 then
        if StarterpackFrame.Parent then
            StarterpackFrame:Destroy();
            StarterpackPromptFrame:Destroy();

            if u1 then
                u1:Disconnect();
            end;

            ActivateStarterpackPrompt:Fire("destroy");
        end;

        return;
    end;

    StarterpackPromptFrame.Visible = true;
    u4 = true;
    u3 = p6;
    u1 = RunService.Heartbeat:Connect(function(p7) -- Line: 76
        -- upvalues: u3 (ref), ExpireLabel (ref), StarterpackPromptFrame (ref), StarterpackFrame (ref), u1 (ref)
        u3 = u3 - p7;
        local v8 = DateTime.fromUnixTimestampMillis(u3 * 1000):ToUniversalTime();
        ExpireLabel.Text = string.format("%02i:%02i:%02i.%02i LEFT", v8.Hour, v8.Minute, v8.Second, v8.Millisecond / 10);
        StarterpackPromptFrame.Timer.Text = string.format("STARTERPACK - %02i:%02i:%02i LEFT", v8.Hour, v8.Minute, v8.Second);

        if u3 < 0 then
            StarterpackFrame:Destroy();
            StarterpackPromptFrame:Destroy();

            if u1 then
                u1:Disconnect();
            end;
        end;
    end);
end);
ActivateStarterpackPrompt.Event:Connect(function(p9) -- Line: 89
    -- upvalues: StarterpackFrame (copy), CoreGUI (copy)
    if p9 == "destroy" then
        return;
    end;

    StarterpackFrame.Visible = true;

    if StarterpackFrame.Visible then
        CoreGUI.open:Play();

        return;
    end;

    CoreGUI.close:Play();
end);
PurchaseButton.Activated:Connect(function() -- Line: 94
    -- upvalues: u2 (ref), CoreGUI (copy), StarterpackConfig (copy), StarterpackFrame (copy), StarterpackPromptFrame (copy), u1 (ref), ActivateStarterpackPrompt (copy)
    if not u2 then
        return;
    end;

    CoreGUI.open:Play();
    u2 = false;
    local _G_PromptProductPurchase_ret = _G.PromptProductPurchase(StarterpackConfig.productId, true);
    u2 = true;

    if _G_PromptProductPurchase_ret then
        StarterpackFrame:Destroy();
        StarterpackPromptFrame:Destroy();

        if u1 then
            u1:Disconnect();
        end;

        ActivateStarterpackPrompt:Fire("destroy");
    end;
end);
Players.LocalPlayer.PlayerGui.ChildAdded:Connect(function(p10) -- Line: 109
    -- upvalues: u4 (ref), StarterpackPromptFrame (copy)
    if p10.Name == "BossGui" and u4 then
        StarterpackPromptFrame.Visible = false;
        local u11 = nil;
        u11 = p10.AncestryChanged:Connect(function(p12, p13) -- Line: 113
            -- upvalues: u11 (ref), u4 (ref), StarterpackPromptFrame (ref)
            if not p13 then
                u11:Disconnect();

                if u4 then
                    StarterpackPromptFrame.Visible = true;
                end;
            end;
        end);
    end;
end);

return {};
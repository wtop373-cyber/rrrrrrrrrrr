-- ============================================================
-- SCRIPT: SocialRewards
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface.Modules.SocialRewards
-- ============================================================

-- Decompiled with Potassium's decompiler.

game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local CoreGUI = script.Parent.Parent.CoreGUI;
local Events2 = ReplicatedStorage:WaitForChild("Events2");
local Events = ReplicatedStorage:WaitForChild("Events");
local SocialRewardsFrame = CoreGUI.SocialRewardsFrame;
local SocialRewardsConfig = require(game:GetService("ReplicatedStorage").NewModules.Shared.Configuration.SocialRewardsConfig);
local u1 = nil;

local function onEvent(p2, ...) -- Line: 81
    -- upvalues: SocialRewardsFrame (copy), u1 (ref)
    local v3 = { ... };

    if p2 == "error" then
        local v4 = v3[1];
        warn(v4);
        SocialRewardsFrame.ErrorMsg.Text = v4;
        SocialRewardsFrame.ErrorMsg.Visible = true;

        if u1 then
            task.cancel(u1);
        end;

        u1 = task.delay(5, function() -- Line: 95
            -- upvalues: SocialRewardsFrame (ref)
            SocialRewardsFrame.ErrorMsg.Visible = false;
        end);
    end;
end;

SocialRewardsFrame.Frame2.Frame3.Youtube.MainBox.TextButton.Activated:Connect(function() -- Line: 115
    -- upvalues: SocialRewardsFrame (copy), Events (copy)
    if _G.PlayerData and not _G.PlayerData.ConnectedSocials.Youtube then
        Events.SocialRewards:FireServer("yt", SocialRewardsFrame.Frame2.Frame3.Youtube.MainBox.TextBox.Text);
    end;
end);
SocialRewardsFrame.Frame2.Frame3.Twitter.MainBox.TextButton.Activated:Connect(function() -- Line: 122
    -- upvalues: SocialRewardsFrame (copy), Events (copy)
    if _G.PlayerData and not _G.PlayerData.ConnectedSocials.Twitter then
        Events.SocialRewards:FireServer("tw", SocialRewardsFrame.Frame2.Frame3.Twitter.MainBox.TextBox.Text);
    end;
end);
SocialRewardsFrame.Frame2.Frame3.Discord.TextButton.Activated:Connect(function() -- Line: 129
    -- upvalues: Events (copy)
    if _G.PlayerData and not _G.PlayerData.ConnectedSocials.Discord then
        Events.SocialRewards:FireServer("ds", "");
    end;
end);
SocialRewardsFrame.CloseButton.Activated:Connect(function() -- Line: 135
    -- upvalues: SocialRewardsFrame (copy), CoreGUI (copy), Events2 (copy)
    SocialRewardsFrame.Visible = false;

    if SocialRewardsFrame.Visible then
        CoreGUI.open:Play();
    else
        CoreGUI.close:Play();
    end;

    Events2.SocialRewardsClosed:Fire();
end);
Events.SocialRewards.OnClientEvent:Connect(onEvent);
Events2.UpdateClientData.Event:Connect(function(p5) -- Line: 31, Name: update
    -- upvalues: ReplicatedStorage (copy), SocialRewardsFrame (copy), SocialRewardsConfig (copy)
    if p5.allowedExternalLinkReferences then
        if table.find(p5.allowedExternalLinkReferences, "YouTube") and ReplicatedStorage.Values.SocialYoutubeEnabled.Value then
            SocialRewardsFrame.Frame2.Frame3.Youtube.Visible = true;
        else
            SocialRewardsFrame.Frame2.Frame3.Youtube.Visible = false;
        end;

        if ReplicatedStorage.Values.SocialTwitterEnabled.Value then
            SocialRewardsFrame.Frame2.Frame3.Twitter.Visible = true;
        else
            SocialRewardsFrame.Frame2.Frame3.Twitter.Visible = false;
        end;

        if table.find(p5.allowedExternalLinkReferences, "Discord") and ReplicatedStorage.Values.SocialDiscordEnabled.Value then
            SocialRewardsFrame.Frame2.Frame3.Discord.Visible = true;
        else
            SocialRewardsFrame.Frame2.Frame3.Discord.Visible = false;
        end;
    end;

    if p5.ConnectedSocials then
        if p5.ConnectedSocials.Youtube then
            SocialRewardsFrame.Frame2.Frame3.Youtube.CompletedFrame.Visible = true;
            SocialRewardsFrame.Frame2.Frame3.Youtube.Tickbox.TickImage.Visible = true;
        end;

        if p5.ConnectedSocials.Twitter then
            SocialRewardsFrame.Frame2.Frame3.Twitter.CompletedFrame.Visible = true;
            SocialRewardsFrame.Frame2.Frame3.Twitter.Tickbox.TickImage.Visible = true;
        end;

        if p5.ConnectedSocials.Discord then
            SocialRewardsFrame.Frame2.Frame3.Discord.CompletedFrame.Visible = true;
            SocialRewardsFrame.Frame2.Frame3.Discord.Tickbox.TickImage.Visible = true;
        end;
    end;

    SocialRewardsFrame.Frame2.Frame3.Youtube.TopBar.CashReward.Text = "+<b>$" .. SocialRewardsConfig.Youtube.Cash .. "</b>";
    SocialRewardsFrame.Frame2.Frame3.Youtube.TopBar.XPReward.Text = "+<b>" .. SocialRewardsConfig.Youtube.XP .. " XP</b>";
    SocialRewardsFrame.Frame2.Frame3.Twitter.TopBar.CashReward.Text = "+<b>$" .. SocialRewardsConfig.Twitter.Cash .. "</b>";
    SocialRewardsFrame.Frame2.Frame3.Twitter.TopBar.XPReward.Text = "+<b>" .. SocialRewardsConfig.Twitter.XP .. " XP</b>";
    SocialRewardsFrame.Frame2.Frame3.Discord.TopBar.CashReward.Text = "+<b>$" .. SocialRewardsConfig.Discord.Cash .. "</b>";
    SocialRewardsFrame.Frame2.Frame3.Discord.TopBar.XPReward.Text = "+<b>" .. SocialRewardsConfig.Discord.XP .. " XP</b>";
end);
Events2.ToggleSocialRewards.Event:Connect(function(p6) -- Line: 101, Name: toggleWindow
    -- upvalues: SocialRewardsFrame (copy), CoreGUI (copy)
    if p6 == nil then
        SocialRewardsFrame.Visible = not SocialRewardsFrame.Visible;
    else
        SocialRewardsFrame.Visible = p6;
    end;

    if SocialRewardsFrame.Visible then
        CoreGUI.open:Play();

        return;
    end;

    CoreGUI.close:Play();
end);

return {
    countAvailableSocials = function() -- Line: 12, Name: countAvailableSocials
        -- upvalues: ReplicatedStorage (copy)
        local v7 = 0;

        if not (_G.PlayerData and (_G.PlayerData.AllowedExternalLinkReferences and _G.PlayerData.ConnectedSocials)) then
            return v7;
        end;

        if _G.PlayerData and (ReplicatedStorage.Values.SocialYoutubeEnabled.Value and (table.find(_G.PlayerData.AllowedExternalLinkReferences, "YouTube") and not _G.PlayerData.ConnectedSocials.Youtube)) then
            v7 = v7 + 1;
        end;

        if _G.PlayerData and (ReplicatedStorage.Values.SocialDiscordEnabled.Value and (table.find(_G.PlayerData.AllowedExternalLinkReferences, "Discord") and not _G.PlayerData.ConnectedSocials.Discord)) then
            v7 = v7 + 1;
        end;

        if _G.PlayerData and (ReplicatedStorage.Values.SocialTwitterEnabled.Value and not _G.PlayerData.ConnectedSocials.Twitter) then
            v7 = v7 + 1;
        end;

        return v7;
    end
};
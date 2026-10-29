-- ============================================================
-- SCRIPT: UgcEvent
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface.Modules.UgcEvent
-- ============================================================

-- Decompiled with Potassium's decompiler.

local MarketplaceService = game:GetService("MarketplaceService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local GroupService = game:GetService("GroupService");
local Players = game:GetService("Players");
local Events = ReplicatedStorage:WaitForChild("Events");
local Events2 = ReplicatedStorage:WaitForChild("Events2");
local LocalPlayer = Players.LocalPlayer;
local CoreGUI = script.Parent.Parent.CoreGUI;
local UgcFrame = CoreGUI.UgcFrame;
local VerifyFrame = UgcFrame.Frame.VerifyFrame;
local UgcEventConfig = require(ReplicatedStorage.NewModules.Shared.Configuration.UgcEventConfig);
local AddCommas = require(ReplicatedStorage.NewModules.Shared.Extensions.AddCommas);
local u1 = nil;
local u2 = false;
local u3 = false;

local function strikethrough(p4) -- Line: 24
    return `<s>{p4}</s>`;
end;

local u5 = nil;

local function update(p6, p7, p8, p9) -- Line: 30
    -- upvalues: ReplicatedStorage (copy), u5 (ref), VerifyFrame (copy), u3 (ref), UgcEventConfig (copy), u1 (ref), AddCommas (copy)
    if not ReplicatedStorage.Values.UGCEventEnabled.Value then
        return;
    end;

    u5 = {
        p6,
        p7,
        p8,
        p9
    };

    if p6 == "update" then
        VerifyFrame.ClaimLabel.Visible = false;

        if p7 and u3 then
            VerifyFrame.ClaimLabel.Visible = true;
            VerifyFrame.Req5.TextButton.Visible = true;
            VerifyFrame.Req5.LockedFrame.Visible = false;
            VerifyFrame.Req5.UIStroke.Thickness = 3;
            VerifyFrame.Req5.UIStroke.Color = Color3.new(0.623529, 1, 0.447059);
        elseif UgcEventConfig.HideForNonCompleted then
            ReplicatedStorage.Values.UI_VisibleFreeUGC.Value = false;
        end;

        if u3 then
            VerifyFrame.Req1.Frame.Visible = false;
            VerifyFrame.Req1.Frame2.Visible = true;
            VerifyFrame.Req1.Frame2.Title.Text = "<s>Join group <b>CRIMCORP</b> and like the game</s>";
            VerifyFrame.Req1.Tickbox.TickImage.Visible = true;
            VerifyFrame.Req1.Frame2.Title.TextTransparency = 0;
        else
            VerifyFrame.Req1.Frame.Visible = true;
            VerifyFrame.Req1.Frame2.Visible = false;
        end;

        VerifyFrame.Req2.Visible = false;

        if p8 and p8.spentEnoughTime or p7 then
            VerifyFrame.Req3.Title.Text = "<s>Playtime</s>";
            VerifyFrame.Req3.Tickbox.TickImage.Visible = true;
            VerifyFrame.Req3.Title.TextTransparency = 0.35;
        else
            VerifyFrame.Req3.Title.TextTransparency = 0;
        end;

        VerifyFrame.Req4.Visible = UgcEventConfig.PresentsRequired ~= nil;

        if UgcEventConfig.PresentsRequired then
            if p8 and p8.collectedEnoughPresents or p7 then
                VerifyFrame.Req4.Title.Text = `<s>{`Collect {UgcEventConfig.CollectTypeText}`}</s>`;
                VerifyFrame.Req4.Tickbox.TickImage.Visible = true;
                VerifyFrame.Req4.Title.TextTransparency = 0.35;
            else
                VerifyFrame.Req4.Title.Text = `Collect {UgcEventConfig.CollectTypeText}`;
                VerifyFrame.Req4.Title.TextTransparency = 0;
            end;
        end;

        local Req6 = VerifyFrame:FindFirstChild("Req6");

        if Req6 then
            local GhostsRequired = UgcEventConfig.GhostsRequired;
            Req6.Visible = GhostsRequired ~= nil;

            if GhostsRequired then
                local v10 = p7 and GhostsRequired and GhostsRequired or math.min(p9 and (p9.GhostsBanished or 0) or 0, GhostsRequired);

                if p8 and p8.banishedEnoughGhosts or p7 then
                    Req6.Title.Text = `<s>{UgcEventConfig.GhostsText}</s>`;
                    Req6.Tickbox.TickImage.Visible = true;
                    Req6.Title.TextTransparency = 0.35;
                else
                    Req6.Title.Text = UgcEventConfig.GhostsText;
                    Req6.Tickbox.TickImage.Visible = false;
                    Req6.Title.TextTransparency = 0;
                end;

                Req6.Bar.Bar2.Size = UDim2.new(v10 / GhostsRequired, 0, 1, 0);
                Req6.Bar.TextLabel.Text = `{v10}/{GhostsRequired} GHOSTS`;
            end;
        end;

        if p8 and not p8.itemNotAlreadyClaimed then
            VerifyFrame.Req5.TextButton.Visible = false;
            VerifyFrame.Req5.LockedFrame.Visible = true;
            VerifyFrame.RemainLabel.Text = "Item already claimed!";
        else
            VerifyFrame.RemainLabel.Text = u1 and `{AddCommas(u1.Remaining or 0)}/{AddCommas(UgcEventConfig.MaxStock)} COPIES` or "N/A";
        end;

        VerifyFrame.RemainLabel.TextColor3 = not (u1 and (typeof(u1.Remaining) == "number" and u1.Remaining > 0)) and Color3.new(1, 0, 0) or Color3.new(1, 1, 1);
        VerifyFrame.Req5.ImageLabel.Image = "rbxthumb://type=Asset&id=" .. tostring(UgcEventConfig.ItemAssetId) .. "&w=420&h=420";
        VerifyFrame.Req3.Bar.Bar2.Size = UDim2.new(p7 and 1 or math.min(p9.TimeSpent / UgcEventConfig.TimeSpentRequired, 1), 0, 1, 0);

        if UgcEventConfig.PresentsRequired then
            VerifyFrame.Req4.Bar.Bar2.Size = UDim2.new(p7 and 1 or math.min(p9.PresentsCollected / UgcEventConfig.PresentsRequired, 1), 0, 1, 0);
        end;

        VerifyFrame.Req3.Bar.TextLabel.Text = `{p7 and UgcEventConfig.TimeSpentRequired / 60 or math.floor(p9.TimeSpent / 60)}/{UgcEventConfig.TimeSpentRequired / 60} MINUTES`;

        if UgcEventConfig.PresentsRequired then
            VerifyFrame.Req4.Bar.TextLabel.Text = `{p7 and UgcEventConfig.PresentsRequired or p9.PresentsCollected}/{UgcEventConfig.PresentsRequired} {string.upper(UgcEventConfig.CollectTypeText)}`;
        end;
    end;
end;

local function toggleWindow(p11) -- Line: 144
    -- upvalues: UgcFrame (copy), u2 (ref), CoreGUI (copy)
    if p11 == nil then
        UgcFrame.Visible = not UgcFrame.Visible;
    else
        UgcFrame.Visible = p11;
    end;

    u2 = UgcFrame.Visible;

    if UgcFrame.Visible then
        CoreGUI.open:Play();

        return;
    end;

    CoreGUI.close:Play();
end;

task.spawn(function() -- Line: 160
    -- upvalues: u1 (ref), MarketplaceService (copy), UgcEventConfig (copy)
    while wait(3) and not u1 do
        pcall(function() -- Line: 166
            -- upvalues: u1 (ref), MarketplaceService (ref), UgcEventConfig (ref)
            u1 = MarketplaceService:GetProductInfo(UgcEventConfig.ItemAssetId, Enum.InfoType.Asset);
        end);
    end;
end);
task.spawn(function() -- Line: 172
    -- upvalues: ReplicatedStorage (copy), GroupService (copy), LocalPlayer (copy), UgcEventConfig (copy), u3 (ref)
    local UGCEventEnabled = ReplicatedStorage:WaitForChild("Values"):WaitForChild("UGCEventEnabled");

    while true do
        repeat
            if not task.wait(3) then
                return;
            end;
        until UGCEventEnabled.Value;

        local success, result = pcall(GroupService.GetGroupsAsync, GroupService, LocalPlayer.UserId);

        if success and result then
            local v12 = false;

            for _, v in pairs(result) do
                if v.Id == UgcEventConfig.RobloxGroupRequiredId then
                    v12 = true;
                    break;
                end;
            end;

            u3 = v12;
        end;
    end;
end);
UgcFrame.CloseButton.Activated:Connect(function() -- Line: 190
    -- upvalues: UgcFrame (copy), u2 (ref), CoreGUI (copy)
    UgcFrame.Visible = false;
    u2 = UgcFrame.Visible;

    if UgcFrame.Visible then
        CoreGUI.open:Play();

        return;
    end;

    CoreGUI.close:Play();
end);
VerifyFrame.Req1.TextButton.Activated:Connect(function() -- Line: 194
    -- upvalues: u3 (ref), ReplicatedStorage (copy), u5 (ref), update (copy)
    if u3 then
        return;
    end;

    task.spawn(function() -- Line: 196
        -- upvalues: ReplicatedStorage (ref), u3 (ref), u5 (ref), update (ref)
        if ReplicatedStorage.Events2.GroupJoinPrompt:Invoke() then
            u3 = true;

            if u5 then
                update(unpack(u5));
            end;
        end;
    end);
end);
VerifyFrame.Req2.TextButton.Activated:Connect(function() -- Line: 207
    -- upvalues: UgcFrame (copy), Events2 (copy), u2 (ref)
    UgcFrame.Visible = false;
    Events2.ToggleSocialRewards:Fire(true);
    Events2.SocialRewardsClosed.Event:Wait();

    if u2 then
        UgcFrame.Visible = true;
    end;
end);
VerifyFrame.Req5.TextButton.Activated:Connect(function() -- Line: 216
    -- upvalues: u3 (ref), Events (copy)
    if u3 then
        Events.UgcEvent:FireServer();
    end;
end);
Events.UgcEvent.OnClientEvent:Connect(update);

return {
    toggle = toggleWindow
};
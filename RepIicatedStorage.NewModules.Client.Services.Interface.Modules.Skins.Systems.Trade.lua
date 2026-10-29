-- ============================================================
-- SCRIPT: Trade
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface.Modules.Skins.Systems.Trade
-- ============================================================

-- Decompiled with Potassium's decompiler.

local u1 = {};
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local TextChatService = game:GetService("TextChatService");
game:GetService("Players");
local RBXGeneral = TextChatService.TextChannels:WaitForChild("RBXGeneral");
local Values = ReplicatedStorage:WaitForChild("Values");

function u1.new(u2) -- Line: 11
    u2.vars.tradeRequestsTabOpen = false;
    u2.events.tradeInteract = u2.eventsF.TradeInteract;
    u2.events.tradeInteract2 = u2.eventsF.TradeInteract2;
    u2.tradeFuncs = {};
    u2.tradeRequestsRepData = nil;
    u2.vars.canTradeLimiteds = false;

    function u2.tradeFuncs.UpdateTradeButtonVisiblity(p3) -- Line: 20
        -- upvalues: u2 (copy)
        local v4 = p3 or u2.tradeRequestsRepData;

        if not v4 then
            return;
        end;

        local v5 = false;

        for _, _ in pairs(v4.inbounds) do
            v5 = true;
            break;
        end;

        if v5 then
            v5 = not u2.vars.tradeRequestsTabOpen;
        end;

        u2.frames.tradeButton.Hint.Visible = v5;
    end;

    function u2.tradeFuncs.UpdateTradeRequests(p6) -- Line: 35
        -- upvalues: u2 (copy)
        u2.tradeFuncs.UpdateTradeButtonVisiblity(p6);

        if u2.tradeFuncs.UpdateTradeRequestButtons then
            u2.tradeFuncs.UpdateTradeRequestButtons(p6);
        end;
    end;

    return u2;
end;

local function DeserializeRepData(p7) -- Line: 47
    local v8 = {};

    for i, v in pairs(p7.players) do
        local PlayerByUserId = game:GetService("Players"):GetPlayerByUserId((tonumber(i)));

        if PlayerByUserId then
            v8[PlayerByUserId] = v;
        else
            error((`could not find player {i}`));
        end;
    end;

    p7.players = v8;

    return true;
end;

function u1.Connections(u9) -- Line: 65
    -- upvalues: u1 (copy)
    u9.frames.tradesFrame = u9.GUI.TradesFrame;
    u9.frames.tradeButton = u9.frames.mainFrame2.TradeButton;
    u9.frames.tradeReqsFrame = u9.frames.mainFrame2.TradeReqsFrame;
    u9.frames.tradeButton.MouseEnter:Connect(function() -- Line: 73
        -- upvalues: u9 (copy)
        u9.uiSoundsF.hover:Play();
    end);
    u9.frames.tradeReqsFrame.CloseButton.MouseEnter:Connect(function() -- Line: 74
        -- upvalues: u9 (copy)
        u9.uiSoundsF.hover:Play();
    end);
    u9.frames.skinsButton.MouseButton1Click:Connect(function() -- Line: 76
        -- upvalues: u9 (copy)
        if u9.vars.currentTab ~= 2 then
            u9.uiSoundsF.click:Play();
            u9.systems.UI.ViewTab(u9, 2);
        end;
    end);
    u9.frames.tradeButton.MouseButton1Click:Connect(function() -- Line: 84
        -- upvalues: u9 (copy), u1 (ref)
        if u9.vars.busy or (u9.vars.busy2 or u9.vars.busy3) then
            return;
        end;

        if u9.frames.purchaseFrame.Visible then
            return;
        end;

        u9.uiSoundsF.click:Play();
        u1.ToggleTradeRequestsTab(u9, not u9.vars.tradeRequestsTabOpen);
    end);
    u9.frames.tradeReqsFrame.CloseButton.MouseButton1Click:Connect(function() -- Line: 95
        -- upvalues: u9 (copy), u1 (ref)
        u9.uiSoundsF.click:Play();
        u1.ToggleTradeRequestsTab(u9, false);
    end);
    u9.events.tradeInteract2.OnClientEvent:Connect(function(p10, p11, p12) -- Line: 102
        -- upvalues: u9 (copy), u1 (ref)
        if p10 ~= "TradeRequests" then
            if p10 == "TradeRequestWarn" then
                if u9.tradeFuncs.ErrorTradeRequestButton then
                    u9.tradeFuncs.ErrorTradeRequestButton(p11, p12);

                    return;
                end;
            else
                if p10 == "StartTrade" then
                    u1.StartTrade(u9, p11);

                    return;
                end;

                if p10 == "EndTrade" then
                    u1.EndTrade(u9);

                    return;
                end;

                if p10 == "UpdateTrade" then
                    u1.UpdateTrade(u9, p11);

                    return;
                end;

                if p10 == "CanTradeLimiteds" then
                    u9.vars.canTradeLimiteds = p11 and true or nil;
                end;
            end;

            return;
        end;

        u9.tradeRequestsRepData = p11;
        u9.tradeFuncs.UpdateTradeRequests(p11);
    end);
    u1.ToggleTradeRequestsTab(u9, false);
    (function() -- Line: 125, Name: HandleTradeVerification
        -- upvalues: u9 (copy), u1 (ref)
        local NotVerifiedFrame = u9.frames.tradeReqsFrame.NotVerifiedFrame;
        local Text = NotVerifiedFrame.Req1.Title.Text;
        local Text2 = NotVerifiedFrame.Req2.Title.Text;

        local function UpdateTradeVerification() -- Line: 131
            -- upvalues: NotVerifiedFrame (copy), Text (copy), Text2 (copy), u1 (ref), u9 (ref)
            local Req1 = NotVerifiedFrame.Req1;
            local Req2 = NotVerifiedFrame.Req2;
            local Prime = _G.PlayerData.Prime;
            local IdVerified = _G.PlayerData.IdVerified;
            Req1.Title.TextColor3 = Prime and Color3.new(0.8, 0.8, 0.8) or Color3.new(1, 1, 1);
            Req1.Title.Text = Prime and "<s>" .. Text .. "</s>" or Text;
            Req1.Tickbox.TickImage.Visible = Prime;
            Req1.PurchaseButton.Visible = not Prime;
            Req2.Title.TextColor3 = IdVerified and Color3.new(0.8, 0.8, 0.8) or Color3.new(1, 1, 1);
            Req2.Title.Text = IdVerified and "<s>" .. Text2 .. "</s>" or Text2;
            Req2.Tickbox.TickImage.Visible = IdVerified;

            if u1.CheckTradeAccessibility(u9) then
                task.wait(0.25);
                u1.ToggleTradeRequestsTab(u9, u9.vars.tradeRequestsTabOpen);
            end;
        end;

        if not _G.PlayerData.TradeAccess then
            local u13 = false;
            NotVerifiedFrame.Req1.PurchaseButton.TextButton.MouseButton1Click:Connect(function() -- Line: 155
                -- upvalues: u13 (ref), u9 (ref), UpdateTradeVerification (copy)
                if u13 then
                    return;
                end;

                u13 = true;
                u9.uiSoundsF.click:Play();
                local _G_PromptGamepass_ret = _G.PromptGamepass("Prime");
                u13 = false;

                if _G_PromptGamepass_ret then
                    u9.uiSoundsF.purchase:Play();
                    UpdateTradeVerification();
                end;
            end);
            NotVerifiedFrame.RefreshButton.MouseEnter:Connect(function() -- Line: 167
                -- upvalues: u9 (ref)
                u9.uiSoundsF.hover:Play();
            end);
            NotVerifiedFrame.RefreshButton.MouseButton1Click:Connect(function() -- Line: 170
                -- upvalues: u13 (ref), u9 (ref), UpdateTradeVerification (copy)
                if u13 then
                    return;
                end;

                u13 = true;
                u9.uiSoundsF.click:Play();
                UpdateTradeVerification();
                task.wait(0.5);
                u13 = false;
            end);
            u9.frames.tradeReqsFrame:GetPropertyChangedSignal("Visible"):Once(UpdateTradeVerification);
            UpdateTradeVerification();
        end;
    end)();
end;

function u1.UpdateTradeInventory(u14) -- Line: 189
    for i, v in pairs(u14.vars.cosmeticData.Skins) do
        local v15 = u14.activeTrade.inventoryIds[i];

        if not v15 then
            v15 = u14.vars.inventoryIds[i];

            if v15 then
                local u16 = u14.vars.inventoryIds[i][2]:Clone();
                u16.Parent = u14.activeTrade.frames.listFrames.Guns;
                u16.BackgroundColor3 = Color3.fromRGB(154, 154, 154);
                u16.Hover.MouseEnter:Connect(function() -- Line: 203
                    -- upvalues: u14 (copy), u16 (copy)
                    u14.uiSoundsF.hover:Play();
                    u16.BackgroundColor3 = Color3.fromRGB(180, 180, 180);
                end);
                u16.Hover.MouseLeave:Connect(function() -- Line: 207
                    -- upvalues: u16 (copy)
                    u16.BackgroundColor3 = Color3.fromRGB(154, 154, 154);
                end);

                if v.TradeHold or (v.TradeLocked or not u14.vars.canTradeLimiteds and v.Rarity == "limited") then
                    u16.BlackOverlay.Visible = true;
                end;

                u14.systems.UI.CosmeticFrameHoverStuff(u14, u16);
                u16.Hover.MouseButton1Click:Connect(function() -- Line: 217
                    -- upvalues: u14 (copy), v (copy), i (copy), u16 (copy)
                    if u14.activeTrade.toggleItemDB then
                        return;
                    end;

                    if u14.activeTrade.confirming or (u14.activeTrade.repData.confirmReady or u14.activeTrade.repData.confirmed) then
                        return;
                    end;

                    if v.TradeHold or (v.TradeLocked or not u14.vars.canTradeLimiteds and v.Rarity == "limited") then
                        return;
                    end;

                    local v17 = u14.activeTrade.repData.players[u14.plr];

                    if not table.find(v17.offerOrder, i) and #v17.offerOrder >= 8 then
                        return;
                    end;

                    u14.activeTrade.toggleItemDB = true;
                    u14.systems.UI.ToggleBuffer(u14, u16, true);
                    u14.uiSoundsF.click:Play();
                    u14.tradeFuncs.ToggleItem(v.SkinClass, i);
                    u14.activeTrade.toggleItemDB = false;
                    u14.systems.UI.ToggleBuffer(u14, u16, false);
                end);
                u14.activeTrade.inventoryIds[i] = { u14.vars.inventoryIds[i][1], u16 };
                v15 = u14.activeTrade.inventoryIds[i];
                v15[2].UIStroke.Enabled = false;
            end;
        end;

        if v15 then
            v15[2].NewLabel.Visible = false;
            v15[2].ButtonsFrame.Visible = false;
        end;
    end;

    local v18 = {};

    for i, v in pairs(u14.activeTrade.repData.players) do
        local v19 = v;
        local v20 = i;

        for i2, v2 in pairs(v.offer) do
            v18[i2] = true;

            if not u14.activeTrade.offeredIds[i2] then
                local success, result = pcall(function() -- Line: 267
                    -- upvalues: u14 (copy), i2 (copy), v2 (copy)
                    return u14.systems.UI.CreateInventoryFrame(u14, "skin", i2, v2, true);
                end);

                if success and result then
                    result.Name = i2;
                    result.Serial.Visible = true;
                    result.Parent = v20 == u14.plr and u14.activeTrade.frames.yourOfferFrame or u14.activeTrade.frames.theirOfferFrame;
                    local v21 = v19.offerOrder and table.find(v19.offerOrder, i2);

                    if v21 then
                        result.LayoutOrder = v21;
                    end;

                    u14.activeTrade.offeredIds[i2] = { v2, result };
                else
                    warn("CreateCosmeticFrame6 Error:", result);
                end;
            end;
        end;
    end;

    for i, v in pairs(u14.activeTrade.offeredIds) do
        local v22 = u14.activeTrade.inventoryIds[i];

        if v22 then
            if v18[i] then
                v22[2].UIStroke.Enabled = true;
                v22[2].UIStroke.Color = Color3.new(1, 1, 1);
                v22[2].UIStroke.Thickness = 2;
            else
                v22[2].UIStroke.Enabled = false;
            end;
        end;

        if not v18[i] then
            u14.activeTrade.offeredIds[i] = nil;

            if v and v[2] then
                v[2]:Destroy();
            end;
        end;
    end;
end;

function u1.UpdateTrade(p23, u24, p25) -- Line: 314
    -- upvalues: DeserializeRepData (copy), u1 (copy)
    if typeof(u24) ~= "table" then
        return;
    end;

    if not p25 then
        local success, result = pcall(function() -- Line: 320
            -- upvalues: DeserializeRepData (ref), u24 (copy)
            return DeserializeRepData(u24);
        end);

        if not (success and result) then
            return;
        end;
    end;

    if not p23.activeTrade then
        return;
    end;

    p23.activeTrade.repData = u24;
    local v26 = 0;

    for _, v in pairs(p23.activeTrade.repData.players) do
        if #v.offerOrder > 0 then
            v26 = v26 + 1;
        end;
    end;

    local v27 = v26 >= 2;

    for i, v in pairs(p23.activeTrade.repData.players) do
        if i == p23.plr then
            if v27 then
                p23.activeTrade.frames.buttons.cantReadyLabel.Visible = false;

                if p23.activeTrade.repData.confirmReady then
                    p23.activeTrade.frames.buttons.readyButton.Visible = false;
                    p23.activeTrade.frames.buttons.unreadyButton.Visible = true;
                    p23.activeTrade.frames.buttons.confirmButton.Visible = true;

                    if p23.activeTrade.repData.confirming then
                        p23.activeTrade.frames.buttons.confirmButton.TextLabel.Text = "COMPLETING";
                        p23.activeTrade.frames.buttons.confirmButton.BackgroundColor3 = Color3.fromRGB(177, 177, 177);
                        p23.activeTrade.frames.buttons.unreadyButton.BackgroundColor3 = Color3.fromRGB(177, 177, 177);
                    elseif v.confirmed then
                        p23.activeTrade.frames.buttons.confirmButton.TextLabel.Text = "CONFIRMED";
                        p23.activeTrade.frames.buttons.confirmButton.BackgroundColor3 = Color3.fromRGB(177, 177, 177);
                    else
                        p23.activeTrade.frames.buttons.confirmButton.TextLabel.Text = p23.activeTrade.repData.timer <= 0 and "CONFIRM" or "CONFIRM [" .. tostring(p23.activeTrade.repData.timer) .. "]";
                        p23.activeTrade.frames.buttons.confirmButton.BackgroundColor3 = p23.activeTrade.repData.timer <= 0 and Color3.fromRGB(190, 255, 183) or Color3.fromRGB(177, 177, 177);
                    end;
                else
                    p23.activeTrade.frames.buttons.readyButton.Visible = not p23.activeTrade.repData.players[p23.plr].ready;
                    p23.activeTrade.frames.buttons.unreadyButton.Visible = p23.activeTrade.repData.players[p23.plr].ready;
                    p23.activeTrade.frames.buttons.confirmButton.Visible = false;
                    p23.activeTrade.frames.buttons.readyButton.TextLabel.Text = p23.activeTrade.repData.timer <= 0 and "READY" or "READY [" .. tostring(p23.activeTrade.repData.timer) .. "]";
                    p23.activeTrade.frames.buttons.readyButton.BackgroundColor3 = p23.activeTrade.repData.timer <= 0 and Color3.fromRGB(184, 224, 255) or Color3.fromRGB(177, 177, 177);
                end;
            else
                p23.activeTrade.frames.buttons.readyButton.Visible = false;
                p23.activeTrade.frames.buttons.unreadyButton.Visible = false;
                p23.activeTrade.frames.buttons.confirmButton.Visible = false;
                p23.activeTrade.frames.buttons.cantReadyLabel.Visible = true;
            end;

            p23.activeTrade.frames.yOTB.Frame.Tickbox1.ImageLabel.Visible = v.ready;
            p23.activeTrade.frames.yOTB.Frame.Tickbox2.ImageLabel.Visible = v.confirmed;
        else
            p23.activeTrade.frames.tOTB.Frame.Tickbox1.ImageLabel.Visible = v.ready;
            p23.activeTrade.frames.tOTB.Frame.Tickbox2.ImageLabel.Visible = v.confirmed;
        end;
    end;

    p23.activeTrade.frames.buttons.unreadyButton.BackgroundColor3 = (p23.activeTrade.repData.confirming or p23.activeTrade.repData.players[p23.plr].confirmBusy) and Color3.fromRGB(177, 177, 177) or Color3.fromRGB(255, 184, 185);
    p23.activeTrade.frames.closeButton.BackgroundColor3 = (p23.activeTrade.repData.confirming or p23.activeTrade.repData.players[p23.plr].confirmBusy) and Color3.new(1, 1, 1) or Color3.new(1, 0, 0);
    p23.activeTrade.frames.readyFrame.Visible = p23.activeTrade.repData.confirmReady or p23.activeTrade.repData.confirmed;
    u1.UpdateTradeInventory(p23);
end;

function u1.StartTrade(u28, u29) -- Line: 393
    -- upvalues: DeserializeRepData (copy), u1 (copy), RBXGeneral (copy)
    if typeof(u29) ~= "table" then
        return;
    end;

    DeserializeRepData(u29);

    if u28.activeTrade then
        u1.EndTrade(u28);
        task.wait();
    end;

    if u28.systems.Trade then
        u28.systems.Trade.ToggleTradeRequestsTab(u28, false);
    end;

    u28.systems.UI.ToggleSearchBar(u28, false);
    u28.systems.UI.ToggleGUI(u28, true);
    u28.activeTrade = {};
    local v30 = u28.scDir.TradeTemplate:Clone();
    u28.activeTrade.GUI = v30;
    u28.activeTrade.frames = {};
    u28.activeTrade.frames.mF = v30.MainFrame;
    u28.activeTrade.frames.mF2 = v30.MainFrame.MainFrame2;
    u28.activeTrade.frames.topBar = v30.TopBar;
    u28.activeTrade.frames.closeButton = u28.activeTrade.frames.topBar.CloseButton;
    u28.activeTrade.frames.searchBox = u28.activeTrade.frames.mF2.ButtonFrames2.SearchbarFrame.TextBox;
    u28.activeTrade.frames.yourOfferFrame = u28.activeTrade.frames.mF2.YourOfferFrame.Frame.MainFrame;
    u28.activeTrade.frames.theirOfferFrame = u28.activeTrade.frames.mF2.TheirOfferFrame.Frame.MainFrame;
    u28.activeTrade.frames.acceptFrames = u28.activeTrade.frames.mF2.AcceptFrames;
    u28.activeTrade.frames.readyFrame = u28.activeTrade.frames.mF2.ListFrame.ReadyFrame;
    u28.activeTrade.frames.buttons = {
        readyButton = u28.activeTrade.frames.acceptFrames.ReadyButton,
        confirmButton = u28.activeTrade.frames.acceptFrames.ConfirmButton,
        unreadyButton = u28.activeTrade.frames.acceptFrames.UnreadyButton,
        cantReadyLabel = u28.activeTrade.frames.acceptFrames.CantReadyLabel
    };
    u28.activeTrade.frames.yOTB = u28.activeTrade.frames.mF2.YOTB;
    u28.activeTrade.frames.tOTB = u28.activeTrade.frames.mF2.TOTB;
    u28.activeTrade.frames.listFrames = {
        Guns = u28.activeTrade.frames.mF2.ListFrame.Frame.MainFrame
    };
    u28.activeTrade.frames.chatBoxFrame = u28.activeTrade.frames.mF2.Chatbox;
    u28.activeTrade.repData = u29;
    u28.activeTrade.inventoryIds = {};
    u28.activeTrade.offeredIds = {};
    local u31 = false;
    u28.activeTrade.frames.closeButton.MouseButton1Click:Connect(function() -- Line: 453
        -- upvalues: u31 (ref), u28 (copy)
        if u31 then
            return;
        end;

        if u28.activeTrade.repData.confirming or u28.activeTrade.repData.players[u28.plr].confirmBusy then
            return;
        end;

        u31 = true;
        u28.uiSoundsF.click:Play();
        u28.events.tradeInteract:InvokeServer("EndTrade");
    end);
    u28.activeTrade.frames.searchBox:GetPropertyChangedSignal("Text"):Connect(function() -- Line: 464
        -- upvalues: u28 (copy)
        local string_lower_ret = string.lower(u28.activeTrade.frames.searchBox.Text);

        for _, child in pairs(u28.activeTrade.frames.listFrames.Guns:GetChildren()) do
            if child:IsA("Frame") then
                local v32 = child:GetAttribute("SkinName") or "☂";
                child.Visible = string.find(string.lower(v32), string_lower_ret, 1, true) and true or false;
            end;
        end;
    end);
    u28.activeTrade.frames.buttons.readyButton.MouseButton1Click:Connect(function() -- Line: 474
        -- upvalues: u28 (copy)
        if u28.activeTrade.confirming or (u28.activeTrade.toggleItemDB or (u28.activeTrade.repData.timer > 0 or u28.activeTrade.repData.players[u28.plr].ready)) then
            return;
        end;

        u28.activeTrade.toggleItemDB = true;
        u28.uiSoundsF.click:Play();
        u28.events.tradeInteract:InvokeServer("Ready");

        if u28.activeTrade then
            u28.activeTrade.toggleItemDB = false;
        end;
    end);
    u28.activeTrade.frames.buttons.confirmButton.MouseButton1Click:Connect(function() -- Line: 485
        -- upvalues: u28 (copy)
        if u28.activeTrade.confirming or (u28.activeTrade.repData.players[u28.plr].confirmed or (u28.activeTrade.toggleItemDB or u28.activeTrade.repData.timer > 0)) then
            return;
        end;

        u28.activeTrade.toggleItemDB = true;
        u28.uiSoundsF.click:Play();
        u28.events.tradeInteract:InvokeServer("Confirm");

        if u28.activeTrade then
            u28.activeTrade.toggleItemDB = false;
        end;
    end);
    u28.activeTrade.frames.buttons.unreadyButton.MouseButton1Click:Connect(function() -- Line: 496
        -- upvalues: u28 (copy)
        if u28.activeTrade.confirming or (u28.activeTrade.repData.players[u28.plr].confirmBusy or (u28.activeTrade.toggleItemDB or not u28.activeTrade.repData.players[u28.plr].ready and u28.activeTrade.repData.timer > 0)) then
            return;
        end;

        u28.activeTrade.toggleItemDB = true;
        u28.uiSoundsF.click:Play();
        u28.events.tradeInteract:InvokeServer("Ready");

        if u28.activeTrade then
            u28.activeTrade.toggleItemDB = false;
        end;
    end);

    for i, _ in pairs(u29.players) do
        if i ~= u28.plr then
            u28.activeTrade.frames.tOTB.TraderName.Text = "[@" .. tostring(i.Name) .. "]";
            break;
        end;
    end;

    (function() -- Line: 515, Name: HandleChatStuff
        -- upvalues: u29 (copy), u28 (copy), RBXGeneral (ref)
        for i, _ in pairs(u29.players) do
            if i ~= u28.plr then
                u28.activeTrade.frames.chatBoxFrame.ScrollingFrame.Default.TextLabel.Text = "Chat messages exchanged with @" .. tostring(i.Name) .. " will appear here.";
                break;
            end;
        end;

        u28.activeTrade.chatEvent = true;
        local u33 = {
            Color3.new(0.9921568627450981, 0.1607843137254902, 0.2627450980392157),
            Color3.new(0.00392156862745098, 0.6352941176470588, 1),
            Color3.new(0.00784313725490196, 0.7215686274509804, 0.3411764705882353),
            BrickColor.new("Bright violet").Color,
            BrickColor.new("Bright orange").Color,
            BrickColor.new("Bright yellow").Color,
            BrickColor.new("Light reddish violet").Color,
            BrickColor.new("Bright yellow").Color
        };

        local function GetNameValue(p34: string) -- Line: 541
            local v35 = 0;

            for i = 1, #p34 do
                local string_sub_ret = string.sub(p34, i, i);
                local string_byte_ret = string.byte(string_sub_ret);
                local v36 = #p34 - i + 1;

                if #p34 % 2 == 1 then
                    v36 = v36 - 1;
                end;

                if v36 % 4 >= 2 then
                    string_byte_ret = -string_byte_ret;
                end;

                v35 = v35 + string_byte_ret;
                local _ = i;
            end;

            return v35;
        end;

        local function GetChatColor(p37: string) -- Line: 557
            -- upvalues: u33 (copy), GetNameValue (copy)
            return u33[GetNameValue(p37) % #u33 + 1];
        end;

        local function GetPlayerChatColor(p38) -- Line: 561
            -- upvalues: u33 (copy), GetNameValue (copy)
            return u33[GetNameValue(p38.Name) % #u33 + 1];
        end;

        function RBXGeneral.OnIncomingMessage(p39) -- Line: 569
            -- upvalues: u28 (ref), u33 (copy), GetNameValue (copy)
            if not (u28 and (u28.activeTrade and u28.activeTrade.chatEvent)) then
                return;
            end;

            local TextSource = p39.TextSource;

            if TextSource and p39.Status == Enum.TextChatMessageStatus.Success then
                for i, _ in pairs(u28.activeTrade.repData.players) do
                    if i.UserId == TextSource.UserId then
                        local v40 = u33[GetNameValue(i.Name) % #u33 + 1];
                        local v41 = u28.scDir.TradeChatLabel:Clone();
                        v41.Text = `<font color="rgb({math.floor(v40.R * 255)},{math.floor(v40.G * 255)},{math.floor(v40.B * 255)})">[@{i.Name}]:</font> {p39.Text}`;
                        v41.Parent = u28.activeTrade.frames.chatBoxFrame.ScrollingFrame;
                        v41.Visible = true;
                        u28.activeTrade.frames.chatBoxFrame.ScrollingFrame.CanvasPosition = Vector2.new(0, 10000);

                        return;
                    end;
                end;
            end;
        end;
    end)();
    u28.frames.mainFrame.Visible = false;
    v30.Parent = u28.frames.tradesFrame;
    u1.UpdateTrade(u28, u29, true);
    u28.frames.tradesFrame.Visible = true;
end;

function u1.EndTrade(p42) -- Line: 603
    if not p42.activeTrade then
        return;
    end;

    if p42.activeTrade.GUI and p42.activeTrade.GUI.Parent then
        p42.activeTrade.GUI:Destroy();
    end;

    if p42.activeTrade.chatEvent then
        p42.activeTrade.chatEvent = nil;
    end;

    p42.activeTrade = nil;
    p42.frames.mainFrame.Visible = p42.vars.open;
    p42.systems.UI.ToggleGUI(p42, false);
end;

function u1.SendTradeRequest(p43, p44) -- Line: 626
    return p43.events.tradeInteract:InvokeServer("SendTradeRequest", p44);
end;

function u1.CancelTradeRequest(p45, p46) -- Line: 629
    return p45.events.tradeInteract:InvokeServer("CancelTradeRequest", p46);
end;

function u1.AcceptTradeRequest(p47, p48) -- Line: 632
    return p47.events.tradeInteract:InvokeServer("AcceptTradeRequest", p48);
end;

function u1.DoTradeRequestErrorButton(p49, u50, p51) -- Line: 636
    u50.TextButton.Visible = false;
    u50.NonInteractable.TextLabel.Text = p51 and string.upper(p51) or "ERROR";
    u50.NonInteractable.Visible = true;
    task.delay(0.5, function() -- Line: 642
        -- upvalues: u50 (copy)
        u50.TextButton.Visible = true;
        u50.NonInteractable.Visible = false;
    end);
end;

function u1.GenerateTradeRequests(u52) -- Line: 648
    -- upvalues: u1 (copy)
    for _, child in pairs(u52.frames.tradeReqsFrame.ScrollingFrame:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy();
        end;
    end;

    local function UpdateButton(p53, p54, p55) -- Line: 659
        local TextButton = p53.TextButton;
        p53:SetAttribute("state", p54);
        p53.LayoutOrder = p53:GetAttribute("LayoutOrder") or p53.LayoutOrder;

        if p54 == "default" then
            TextButton.BackgroundColor3 = Color3.fromRGB(124, 194, 255);
            TextButton.TextLabel.Text = "TRADE";

            return;
        end;

        if p54 ~= "outbound" then
            if p54 == "inbound" then
                TextButton.BackgroundColor3 = Color3.fromRGB(119, 255, 142);
                TextButton.TextLabel.Text = "ACCEPT";
                p53.LayoutOrder = p53.LayoutOrder - 101;
            end;

            return;
        end;

        TextButton.BackgroundColor3 = Color3.fromRGB(255, 214, 119);
        TextButton.TextLabel.Text = "SENT";
    end;

    local u56 = {};

    function u52.tradeFuncs.UpdateTradeRequestButtons(p57) -- Line: 681
        -- upvalues: u56 (ref), u52 (copy)
        local v58 = false;

        for i, v in pairs(u56) do
            if table.find(p57.inbounds, i) then
                local TextButton = v.TextButton;
                v:SetAttribute("state", "inbound");
                v.LayoutOrder = v:GetAttribute("LayoutOrder") or v.LayoutOrder;
                TextButton.BackgroundColor3 = Color3.fromRGB(119, 255, 142);
                TextButton.TextLabel.Text = "ACCEPT";
                v.LayoutOrder = v.LayoutOrder - 101;
                v58 = true;
            elseif table.find(p57.outbounds, i) then
                local TextButton = v.TextButton;
                v:SetAttribute("state", "outbound");
                v.LayoutOrder = v:GetAttribute("LayoutOrder") or v.LayoutOrder;
                TextButton.BackgroundColor3 = Color3.fromRGB(255, 214, 119);
                TextButton.TextLabel.Text = "SENT";
            else
                local TextButton = v.TextButton;
                v:SetAttribute("state", "default");
                v.LayoutOrder = v:GetAttribute("LayoutOrder") or v.LayoutOrder;
                TextButton.BackgroundColor3 = Color3.fromRGB(124, 194, 255);
                TextButton.TextLabel.Text = "TRADE";
            end;
        end;

        if v58 then
            v58 = not u52.vars.tradeRequestsTabOpen;
        end;

        u52.frames.tradeButton.Hint.Visible = v58;
    end;

    function u52.tradeFuncs.ErrorTradeRequestButton(p59, p60) -- Line: 698
        -- upvalues: u56 (ref), u1 (ref), u52 (copy)
        for i, v in pairs(u56) do
            if p59.UserId == i then
                u1.DoTradeRequestErrorButton(u52, v, p60);

                return;
            end;
        end;
    end;

    function u52.tradeFuncs.ToggleItem(p61, p62) -- Line: 707
        -- upvalues: u52 (copy)
        return u52.events.tradeInteract:InvokeServer("ToggleTradeItem", p61, p62);
    end;

    function u52.tradeFuncs.Clean() -- Line: 711
        -- upvalues: u56 (ref), u52 (copy)
        for _, v in pairs(u56) do
            if v and v.Parent then
                v:Destroy();
            end;
        end;

        u56 = nil;
        u52.tradeFuncs.UpdateTradeRequestButtons = nil;
        u52.tradeFuncs.ErrorTradeRequestButton = nil;
        u52.tradeFuncs.Clean = nil;
    end;

    for i, v in pairs(u52.Services.Players:GetPlayers()) do
        local success, result = pcall(function() -- Line: 725
            -- upvalues: v (copy), u52 (copy), i (copy), u1 (ref), u56 (ref)
            if v:GetAttribute("LD2") and (v:GetAttribute("TradeVerified") and (v ~= u52.plr or u52.Services.RunService:IsStudio())) then
                local u63 = u52.scDir.GiftTemplate:Clone();
                u63.PlayerNameFrame.PlayerName.Text = "@" .. v.Name;

                if u52.plr:IsFriendsWith(v.UserId) then
                    u63.PlayerNameFrame.FriendLabel.Visible = true;
                    u63.LayoutOrder = i;
                else
                    u63.LayoutOrder = 100 + i;
                end;

                u63:SetAttribute("LayoutOrder", i);
                u63.TextButton.MouseButton1Click:Connect(function() -- Line: 741
                    -- upvalues: u52 (ref), u63 (copy), u1 (ref), v (ref)
                    if u52.vars.tradeRequestBusy then
                        return;
                    end;

                    u52.uiSoundsF.click:Play();
                    u52.vars.tradeRequestBusy = true;
                    local Attribute = u63:GetAttribute("state");
                    local v64 = nil;
                    local v65 = nil;

                    if Attribute and Attribute ~= "default" then
                        if Attribute == "outbound" then
                            v64, v65 = u1.CancelTradeRequest(u52, v);
                        elseif Attribute == "inbound" then
                            v64, v65 = u1.AcceptTradeRequest(u52, v);
                        end;
                    else
                        v64, v65 = u1.SendTradeRequest(u52, v);
                    end;

                    if not v64 then
                        u1.DoTradeRequestErrorButton(u52, u63, v65);
                    end;

                    task.wait(0.5);
                    u52.vars.tradeRequestBusy = false;
                end);
                u63.Parent = u52.frames.tradeReqsFrame.ScrollingFrame;
                u56[v.UserId] = u63;

                if u52.tradeRequestsRepData then
                    u52.tradeFuncs.UpdateTradeRequestButtons(u52.tradeRequestsRepData);
                end;
            end;
        end);

        if not success then
            warn(result);
        end;
    end;

    if u52.tradeRequestsRepData then
        u52.tradeFuncs.UpdateTradeRequestButtons(u52.tradeRequestsRepData);
    end;
end;

function u1.CheckTradeAccessibility(p66) -- Line: 796
    return _G.PlayerData.TradeAccess;
end;

function u1.ToggleTradeRequestsTab(p67, p68) -- Line: 800
    -- upvalues: u1 (copy), Values (copy)
    if p68 == nil then
        p68 = not p67.vars.tradeRequestsTabOpen;
    end;

    if p68 then
        p67.frames.tradeButton.Hint.Visible = false;
    end;

    if p67.systems.Main.DataSavingDisabledCheck(p67) then
        p67.frames.tradeReqsFrame.ScrollingFrame.Visible = false;
        p67.frames.tradeReqsFrame.NoDataSavingFrame.Visible = true;
        p67.frames.tradeReqsFrame.RegionRestrictedFrame.Visible = false;

        if p67.tradeFuncs.Clean then
            p67.tradeFuncs.Clean();
        end;
    elseif p67.plr:GetAttribute("Tradebanned") then
        p67.frames.tradeReqsFrame.ScrollingFrame.Visible = false;
        p67.frames.tradeReqsFrame.NoDataSavingFrame.Visible = false;
        p67.frames.tradeReqsFrame.NotVerifiedFrame.Visible = false;
        p67.frames.tradeReqsFrame.TradingDisabledFrame.Visible = false;
        p67.frames.tradeReqsFrame.RegionRestrictedFrame.Visible = false;
        p67.frames.tradeReqsFrame.TradebannedFrame.Visible = true;
    elseif p67.plr:GetAttribute("TradeRegionRestricted") then
        p67.frames.tradeReqsFrame.ScrollingFrame.Visible = false;
        p67.frames.tradeReqsFrame.NoDataSavingFrame.Visible = false;
        p67.frames.tradeReqsFrame.NotVerifiedFrame.Visible = false;
        p67.frames.tradeReqsFrame.TradingDisabledFrame.Visible = false;
        p67.frames.tradeReqsFrame.RegionRestrictedFrame.Visible = true;
    elseif u1.CheckTradeAccessibility(p67) then
        if Values.GlobalTradeLockdown.Value then
            p67.frames.tradeReqsFrame.ScrollingFrame.Visible = false;
            p67.frames.tradeReqsFrame.NoDataSavingFrame.Visible = false;
            p67.frames.tradeReqsFrame.NotVerifiedFrame.Visible = false;
            p67.frames.tradeReqsFrame.RegionRestrictedFrame.Visible = false;
            p67.frames.tradeReqsFrame.TradingDisabledFrame.Visible = true;
        else
            p67.frames.tradeReqsFrame.ScrollingFrame.Visible = true;
            p67.frames.tradeReqsFrame.NoDataSavingFrame.Visible = false;
            p67.frames.tradeReqsFrame.NotVerifiedFrame.Visible = false;
            p67.frames.tradeReqsFrame.RegionRestrictedFrame.Visible = false;
            p67.frames.tradeReqsFrame.TradingDisabledFrame.Visible = false;
        end;
    else
        p67.frames.tradeReqsFrame.ScrollingFrame.Visible = false;
        p67.frames.tradeReqsFrame.NoDataSavingFrame.Visible = false;
        p67.frames.tradeReqsFrame.NotVerifiedFrame.Visible = true;
        p67.frames.tradeReqsFrame.TradingDisabledFrame.Visible = false;
        p67.frames.tradeReqsFrame.RegionRestrictedFrame.Visible = false;
    end;

    if p68 then
        p67.vars.currentTab = 3;
        p67.events._changeTabEvent:Fire(p68);
        u1.GenerateTradeRequests(p67);
        p67.systems.UI.MassSellMode(p67, false);
        p67.systems.UI.LockMode(p67, false);
        p67.systems.UI.ToggleISVHelp(p67, false);
    end;

    p67.frames.tradeReqsFrame.Visible = p68;
    p67.vars.tradeRequestsTabOpen = p68;
    p67.tradeFuncs.UpdateTradeButtonVisiblity();
    p67.systems.UI.UpdateSlots(p67);
end;

return u1;
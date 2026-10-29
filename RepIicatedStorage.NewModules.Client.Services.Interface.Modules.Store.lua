-- ============================================================
-- SCRIPT: Store
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface.Modules.Store
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 16
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
local v2 = {};

local function FormatTime(p3) -- Line: 28
    local function Format(p4) -- Line: 29
        return string.format("%02i", p4);
    end;

    local v5 = (p3 - p3 % 60) / 60;

    return string.format("%02i", v5) .. ":" .. string.format("%02i", p3 - v5 * 60);
end;

function v2.new(u6) -- Line: 38
    local ReplicatedStorage = game:GetService("ReplicatedStorage");
    local RunService = game:GetService("RunService");
    local TweenService = game:GetService("TweenService");
    local MarketplaceService = game:GetService("MarketplaceService");
    local GamepadService = game:GetService("GamepadService");
    local UserInputService = game:GetService("UserInputService");
    local Players = game:GetService("Players");
    local LocalPlayer = game.Players.LocalPlayer;
    LocalPlayer:GetMouse();
    local NewModules = ReplicatedStorage:WaitForChild("NewModules");
    local Gamepasses = require(NewModules.Shared.Configuration.Gamepasses);
    local Products = require(NewModules.Shared.Configuration.Products);
    local GiftProducts = require(NewModules.Shared.Configuration.GiftProducts);
    local AddCommas = require(NewModules.Shared.Extensions.AddCommas);
    local Skins = require(script.Parent.Skins);
    local Events = ReplicatedStorage:WaitForChild("Events");
    local Events2 = ReplicatedStorage:WaitForChild("Events2");
    local u7 = ReplicatedStorage:WaitForChild("PlayerbaseData2", 1000):WaitForChild(LocalPlayer.Name, 1000);
    local UISounds = ReplicatedStorage:WaitForChild("Storage"):WaitForChild("UISounds");

    repeat
        task.wait(0.5);
    until _G.GamepassCheck ~= nil;

    local StoreFrame = u6:WaitForChild("StoreFrame");
    local GiftFrame = StoreFrame:WaitForChild("GiftFrame");
    local StoreFrame2 = StoreFrame:WaitForChild("StoreFrame2");
    local Base = StoreFrame2:WaitForChild("Base");
    local Frame2 = StoreFrame2:WaitForChild("Frame2");
    local Passes = Frame2:WaitForChild("Passes");
    local Products2 = Frame2:WaitForChild("Products");
    local XP = Frame2:WaitForChild("XP");
    local Skins2 = Frame2:WaitForChild("Skins");
    local SkinContents = Frame2:WaitForChild("SkinContents");
    local SkinContents2 = Frame2:WaitForChild("SkinContents2");
    local SkinContents3 = Frame2:WaitForChild("SkinContents3");

    local function _closeContentsOverlay() -- Line: 83
        -- upvalues: SkinContents (copy), SkinContents2 (copy), SkinContents3 (copy)
        for _, v in ipairs({ SkinContents, SkinContents2, SkinContents3 }) do
            v.Visible = false;

            for _, descendant in ipairs(v:GetDescendants()) do
                if descendant.Name == "Odds" then
                    descendant.Visible = false;
                end;
            end;

            local RoundWarn = v:FindFirstChild("RoundWarn");

            if RoundWarn then
                RoundWarn.Visible = false;
            end;
        end;
    end;

    local Unavailable = Frame2:WaitForChild("Unavailable");
    local PassesB = Base:WaitForChild("PassesB");
    local MoneyB = Base:WaitForChild("MoneyB");
    local XPB = Base:WaitForChild("XPB");
    local SkinsB = Base:WaitForChild("SkinsB");
    local Cash = StoreFrame2.Cash;
    local u8 = {};
    local u9 = false;
    local u10 = false;
    local u11 = false;
    local u12 = nil;
    local u13 = 1;
    local u14 = {};
    local u15 = {};
    local u16 = nil;
    local CosmeticInteract = ReplicatedStorage.Events.CosmeticInteract;

    local function CheckNonDataSaving() -- Line: 117
        -- upvalues: ReplicatedStorage (copy)
        return not ReplicatedStorage.Values.DataSaving.Value;
    end;

    local function priceText(p17) -- Line: 121
        -- upvalues: AddCommas (copy)
        return AddCommas(p17) .. " R$";
    end;

    local function UpdateCashLabel() -- Line: 125
        -- upvalues: Cash (copy), AddCommas (copy)
        if _G.PlayerData.Bank then
            Cash.Text = "$" .. AddCommas(_G.PlayerData.Bank);
        end;
    end;

    local function setMode(p18, p19, p20) -- Line: 131
        p18:GetAttribute("IsGift");

        if p19 == 1 then
            p18.Owned.Visible = true;
            p18.PriceLabel.Visible = false;
            p18.Hover.Visible = false;
            p18.Unavailable.Visible = false;
            p18.Visible = true;

            return;
        end;

        if p19 ~= 2 then
            if p19 == 3 then
                p18.Owned.Visible = false;
                p18.PriceLabel.Visible = false;
                p18.Hover.Visible = false;
                p18.GiftFrame.Visible = false;
                p18.Visible = p20[3] ~= true;
                p18.Unavailable.Visible = true;
            end;

            return;
        end;

        p18.Owned.Visible = false;
        p18.Unavailable.Visible = false;
        p18.PriceLabel.Visible = true;
        p18.Visible = true;
    end;

    local function update(p21) -- Line: 169
        -- upvalues: u8 (copy), u15 (copy), u7 (copy)
        for _, v in pairs(u8) do
            local v22 = v[1];
            local _ = v[2];
            local v23 = v[3];
            local v24 = v[4];
            local v25 = v[5];
            local _G_GamepassCheck_ret = _G.GamepassCheck(v24);

            if _G_GamepassCheck_ret then
                u15[v24] = true;
                v22:GetAttribute("IsGift");
                v22.Owned.Visible = true;
                v22.PriceLabel.Visible = false;
                v22.Hover.Visible = false;
                v22.Unavailable.Visible = false;
                v22.Visible = true;
            elseif v23.IsForSale then
                if v24 == "DoubleXP" and (u7 and u7.DoubleXP.Value) then
                    v22:GetAttribute("IsGift");
                    v22.Owned.Visible = true;
                    v22.PriceLabel.Visible = false;
                    v22.Hover.Visible = false;
                    v22.Unavailable.Visible = false;
                    v22.Visible = true;
                else
                    v22:GetAttribute("IsGift");
                    v22.Owned.Visible = false;
                    v22.Unavailable.Visible = false;
                    v22.PriceLabel.Visible = true;
                    v22.Visible = true;
                end;
            else
                u15[v24] = _G_GamepassCheck_ret;
                v22:GetAttribute("IsGift");
                v22.Owned.Visible = false;
                v22.PriceLabel.Visible = false;
                v22.Hover.Visible = false;
                v22.GiftFrame.Visible = false;
                v22.Visible = v25[3] ~= true;
                v22.Unavailable.Visible = true;
            end;
        end;
    end;

    local function ToggleGifting(p26, u27, u28, p29, u30) -- Line: 195
        -- upvalues: GiftFrame (copy), UISounds (copy), u11 (ref), StoreFrame2 (copy), Players (copy), LocalPlayer (copy), RunService (copy), Events (copy), u12 (ref), u10 (ref)
        for _, child in pairs(GiftFrame.ScrollingFrame:GetChildren()) do
            if child:IsA("Frame") then
                child:Destroy();
            end;
        end;

        UISounds.click:Play();

        if not p26 then
            GiftFrame.Visible = false;

            if u10 then
                StoreFrame2.Visible = true;
            end;

            return;
        end;

        if u11 then
            return;
        end;

        StoreFrame2.Visible = false;
        GiftFrame.Base.Header.HeaderText.Text = "GIFT " .. (p29[3] and string.upper(p29[3]) or string.upper(u27)) .. (u30 and " [x10]" or "");

        for i, v in pairs(Players:GetPlayers()) do
            coroutine.wrap(function() -- Line: 212
                -- upvalues: v (copy), LocalPlayer (ref), RunService (ref), i (copy), u11 (ref), UISounds (ref), Events (ref), u27 (copy), u28 (copy), u30 (copy), u12 (ref), GiftFrame (ref)
                local success, result = pcall(function() -- Line: 213
                    -- upvalues: v (ref), LocalPlayer (ref), RunService (ref), i (ref), u11 (ref), UISounds (ref), Events (ref), u27 (ref), u28 (ref), u30 (ref), u12 (ref), GiftFrame (ref)
                    if v:GetAttribute("LoadedIn") and (v ~= LocalPlayer or RunService:IsStudio()) then
                        local v31 = script.GiftTemplate:Clone();
                        v31.PlayerNameFrame.PlayerName.Text = "@" .. v.Name;

                        if LocalPlayer:IsFriendsWith(v.UserId) then
                            v31.PlayerNameFrame.FriendLabel.Visible = true;
                            v31.LayoutOrder = i;
                        else
                            v31.LayoutOrder = 100 + i;
                        end;

                        v31.TextButton.MouseButton1Click:Connect(function() -- Line: 225
                            -- upvalues: u11 (ref), UISounds (ref), Events (ref), u27 (ref), v (ref), u28 (ref), u30 (ref), u12 (ref)
                            if u11 then
                                return;
                            end;

                            UISounds.click:Play();
                            u11 = true;
                            local v32 = Events.GiftRequest:InvokeServer(u27, v, u28, u30);

                            if v32 then
                                u12 = v32;

                                return;
                            end;

                            u11 = false;
                        end);
                        v31.Parent = GiftFrame.ScrollingFrame;
                    end;
                end);

                if not success then
                    warn(result);
                end;
            end)();
        end;

        GiftFrame.Visible = true;
    end;

    local function ToggleGUI(p33) -- Line: 265
        -- upvalues: u10 (ref), SkinContents (copy), SkinContents2 (copy), SkinContents3 (copy), Events (copy), Events2 (copy), UISounds (copy), update (copy), GiftFrame (copy), StoreFrame2 (copy), StoreFrame (copy), GamepadService (copy), u6 (copy)
        local v34 = u10;

        if p33 == nil then
            p33 = not u10;
        end;

        if p33 and (_G.IsSkinTradeActive and _G.IsSkinTradeActive()) then
            return;
        end;

        if not p33 then
            for _, v in ipairs({ SkinContents, SkinContents2, SkinContents3 }) do
                for _, descendant in ipairs(v:GetDescendants()) do
                    if descendant.Name == "Odds" then
                        descendant.Visible = false;
                    end;
                end;

                local RoundWarn = v:FindFirstChild("RoundWarn");

                if RoundWarn then
                    RoundWarn.Visible = false;
                end;
            end;
        end;

        if p33 and not u10 then
            Events.GetGamepasses:FireServer();
            Events2.ToggleSettingsUI:Fire(false);
            Events2.ToggleReturnMenu:Fire(false);
            UISounds.open:Play();
            Events2.ToggleSkinsUI:Fire(false);
            update();
            u10 = true;
        elseif not p33 and u10 then
            UISounds.close:Play();
            u10 = false;
            SkinContents.Visible = false;
            SkinContents2.Visible = false;
            SkinContents3.Visible = false;

            for _, child in pairs(GiftFrame.ScrollingFrame:GetChildren()) do
                if child:IsA("Frame") then
                    child:Destroy();
                end;
            end;

            UISounds.click:Play();
            GiftFrame.Visible = false;

            if u10 then
                StoreFrame2.Visible = true;
            end;
        end;

        StoreFrame.Visible = u10;

        if u10 then
            StoreFrame2.Visible = true;
        end;

        if u10 then
            pcall(function() -- Line: 308
                -- upvalues: u10 (ref), GamepadService (ref), u6 (ref)
                if _G.InputType == 2 then
                    task.delay(0.1, function() -- Line: 310
                        -- upvalues: u10 (ref), GamepadService (ref), u6 (ref)
                        if u10 then
                            GamepadService:EnableGamepadCursor(u6.StoreFrame);
                        end;
                    end);
                end;
            end);

            return;
        end;

        if v34 then
            GamepadService:DisableGamepadCursor();
            Events2.StoreUIClosed:Fire(true);
        end;
    end;

    (function() -- Line: 322, Name: SetUp
        -- upvalues: MarketplaceService (copy), Gamepasses (copy), Products (copy), u14 (copy), AddCommas (copy), u7 (copy), GiftProducts (copy), u15 (copy), UISounds (copy), u9 (ref), ReplicatedStorage (copy), CosmeticInteract (copy), update (copy), ToggleGifting (copy), Skins (copy), u10 (ref), StoreFrame (copy), SkinContents (copy), SkinContents2 (copy), SkinContents3 (copy), u13 (ref), Skins2 (copy), u8 (copy), Passes (copy), Products2 (copy), XP (copy), u16 (ref), MoneyB (copy), XPB (copy), SkinsB (copy), PassesB (copy), Unavailable (copy), _closeContentsOverlay (copy), StoreFrame2 (copy), ToggleGUI (copy), Events2 (copy), Events (copy), UserInputService (copy), TweenService (copy), LocalPlayer (copy), u11 (ref), u12 (ref), GiftFrame (copy), Cash (copy), UpdateCashLabel (copy)
        local function CreateFunc(p35, u36, p37, u38, u39, p40, u41) -- Line: 324
            -- upvalues: MarketplaceService (ref), Gamepasses (ref), Products (ref), u14 (ref), AddCommas (ref), u7 (ref), GiftProducts (ref), u15 (ref), UISounds (ref), u9 (ref), ReplicatedStorage (ref), CosmeticInteract (ref), update (ref), ToggleGifting (ref), Skins (ref), u10 (ref), StoreFrame (ref), SkinContents (ref), SkinContents2 (ref), SkinContents3 (ref), u13 (ref), Skins2 (ref), u8 (ref)
            local u42 = p35 or script:WaitForChild("Template"):Clone();
            local u43 = nil;
            pcall(function() -- Line: 328
                -- upvalues: u43 (ref), MarketplaceService (ref), u36 (copy), u38 (copy)
                u43 = MarketplaceService:GetProductInfo(u36, u38 == "pass" and Enum.InfoType.GamePass or Enum.InfoType.Product);
            end);

            if not u43 then
                return;
            end;

            local u44 = u38 == "pass" and Gamepasses[u36] or u38 == "product" and Products[u36];

            if not u44 then
                if u38 == "case" then
                    u44 = u14[u36];
                else
                    u44 = false;
                end;
            end;

            if u44 then
                u42.Name = u39;
                u42.LayoutOrder = p40;
                u42.Title.Text = u44[3] or u43.Name;
                u42.DisplayImage.Image = tostring("http://www.roblox.com/asset/?id=" .. u43.IconImageAssetId);
                local u45 = false;
                local u46 = false;
                local u47 = false;

                if typeof(u41[4]) == "table" then
                    u42.Extra.Text = "+" .. u41[4][1] .. "%";
                    u42.Extra.TextColor3 = u41[4][2];
                    u42.Extra.BackgroundColor3 = u41[4][2];
                    u42.Extra.Visible = true;
                end;

                u42.PriceLabel.Text = u43.PriceInRobux and (AddCommas(u43.PriceInRobux) .. " R$" or "N/A") or "N/A";

                if u38 == "pass" then
                    if u38 == "pass" then
                        u42.DisplayImage.Size = UDim2.new(u42.DisplayImage.Size.X.Scale / 1.25, u42.DisplayImage.Size.X.Offset, u42.DisplayImage.Size.Y.Scale / 1.25, u42.DisplayImage.Size.Y.Offset);
                    end;

                    u42:GetAttribute("IsGift");
                    u42.Owned.Visible = false;
                    u42.Unavailable.Visible = false;
                    u42.PriceLabel.Visible = true;
                    u42.Visible = true;
                elseif u39 and (u39 == "DoubleXP" and (u7 and u7.DoubleXP.Value)) then
                    u42:GetAttribute("IsGift");
                    u42.Owned.Visible = true;
                    u42.PriceLabel.Visible = false;
                    u42.Hover.Visible = false;
                    u42.Unavailable.Visible = false;
                    u42.Visible = true;
                end;

                local u48 = false;
                local u49 = false;

                if u38 == "case" then
                    if { u41.GiftProductId, false } then
                        u49 = u41.Name;
                        local _ = { u41.GiftProductId };
                    end;
                else
                    local v50 = GiftProducts[u44[1]];

                    if v50 then
                        u49 = u44[1];
                        local _ = v50[2];
                    end;
                end;

                if u49 then
                    u42:SetAttribute("IsGift", true);
                end;

                local function ToggleHover(p51) -- Line: 398
                    -- upvalues: u42 (copy), u49 (ref), u15 (ref), u44 (copy)
                    local v52;

                    if p51 then
                        v52 = u49;
                    else
                        v52 = p51;
                    end;

                    u42.GiftFrame.Visible = v52;
                    u42.GiftFrame.BuyFrame.Visible = not u15[u44[1]];

                    if p51 then
                        p51 = not u49;
                    end;

                    u42.Hover.Visible = p51;
                end;

                u42.MouseEnter:Connect(function() -- Line: 406
                    -- upvalues: u45 (ref), UISounds (ref), u48 (ref), u42 (copy), u49 (ref), u15 (ref), u44 (copy)
                    if u45 then
                        return;
                    end;

                    UISounds.hover:Play();
                    u48 = true;
                    u42.GiftFrame.Visible = u49;
                    u42.GiftFrame.BuyFrame.Visible = not u15[u44[1]];
                    u42.Hover.Visible = not u49;
                end);
                u42.MouseLeave:Connect(function() -- Line: 417
                    -- upvalues: u48 (ref), u42 (copy), u15 (ref), u44 (copy)
                    u48 = false;

                    if _G.InputType == 1 then
                        u42.GiftFrame.Visible = false;
                        u42.GiftFrame.BuyFrame.Visible = not u15[u44[1]];
                        u42.Hover.Visible = false;
                    end;
                end);

                if _G.InputType ~= 1 then
                    u42.GiftFrame.Visible = u49;
                    u42.GiftFrame.BuyFrame.Visible = not u15[u44[1]];
                    u42.Hover.Visible = not u49;
                end;

                local function OnBuy(p53) -- Line: 431
                    -- upvalues: u9 (ref), u48 (ref), UISounds (ref), u38 (copy), u36 (copy), ReplicatedStorage (ref), u39 (copy), u7 (ref), CosmeticInteract (ref), u44 (copy), update (ref)
                    if u9 then
                        return;
                    end;

                    if _G.InputType == 1 and not u48 then
                        return;
                    end;

                    UISounds.click:Play();
                    u9 = true;
                    local v54 = nil;

                    if u38 == "pass" then
                        v54 = _G.PromptGamepass(u36);
                    elseif ReplicatedStorage.Values.DataSaving.Value and (u38 == "product" or u38 == "case") then
                        if u39 == "DoubleXP" and (u7 and u7.DoubleXP.Value) then
                            u9 = false;

                            return;
                        end;

                        if u38 == "case" then
                            if CosmeticInteract:InvokeServer("AttemptBuyCase", u44[1], p53) then
                                v54 = _G.PromptProductPurchase(p53 and u44[5] or u36);
                            else
                                task.wait(0.2);
                            end;
                        else
                            v54 = _G.PromptProductPurchase(u36);
                        end;
                    end;

                    if u38 == "pass" then
                        if v54 then
                            v54 = u36;
                        end;

                        update(v54);
                    end;

                    u9 = false;
                end;

                local function OnGift(p55) -- Line: 476
                    -- upvalues: ToggleGifting (ref), u49 (ref), u38 (copy), u44 (copy)
                    ToggleGifting(true, u49, u38, u44, p55);
                end;

                u42.Hover.MouseButton1Click:Connect(OnBuy);
                u42.GiftFrame.BuyFrame.BuyButton.MouseButton1Click:Connect(OnBuy);
                pcall(function() -- Line: 483
                    -- upvalues: u42 (copy), OnGift (copy)
                    u42.GiftFrame.GiftFrame.GiftButton.MouseButton1Click:Connect(OnGift);
                end);

                if u44 and u44[5] then
                    u42.GiftFrame.BuyFrame.BuyButton.Visible = false;
                    u42.GiftFrame.BuyFrame.BuyButton2.Visible = true;
                    u42.GiftFrame.BuyFrame.BulkBuyButton.Visible = true;
                    u42.GiftFrame.BuyFrame.BuyButton2.MouseButton1Click:Connect(OnBuy);
                    u42.GiftFrame.BuyFrame.BulkBuyButton.MouseButton1Click:Connect(function() -- Line: 494
                        -- upvalues: OnBuy (copy)
                        OnBuy(true);
                    end);
                end;

                if u44 and u44[6] then
                    u42.GiftFrame.GiftFrame.GiftButton.Visible = false;
                    u42.GiftFrame.GiftFrame.GiftButton2.Visible = true;
                    u42.GiftFrame.GiftFrame.BulkGiftButton.Visible = true;
                    u42.GiftFrame.GiftFrame.GiftButton2.MouseButton1Click:Connect(OnGift);
                    u42.GiftFrame.GiftFrame.BulkGiftButton.MouseButton1Click:Connect(function() -- Line: 504
                        -- upvalues: ToggleGifting (ref), u49 (ref), u38 (copy), u44 (copy)
                        ToggleGifting(true, u49, u38, u44, true);
                    end);
                end;

                if u41.IsLimited then
                    u42.LimitedLabel.Visible = true;
                    u42.ImageColor3 = Color3.fromRGB(255, 251, 125);
                    u42.IconFooter.ImageColor3 = Color3.fromRGB(255, 251, 125);
                    u42.IconHeader.ImageColor3 = Color3.fromRGB(255, 251, 125);
                    u42.Title.TextColor3 = Color3.fromRGB(254, 237, 0);
                elseif u41.IsNew then
                    u42.NewLabel.Visible = true;
                end;

                if u41.CountdownEnd then
                    local function _(p56) -- Line: 522
                        return string.format("%d:%02d:%02d:%02d", p56 / 86400 % 7, p56 / 3600 % 24, p56 / 60 % 60, p56 % 60);
                    end;

                    u42.TimerLabel.Visible = true;
                    u42.TimerLabel.Text = "";
                    task.delay(0, function() -- Line: 529
                        -- upvalues: ReplicatedStorage (ref), u41 (copy), u42 (copy)
                        while true do
                            local math_max_ret = math.max(u41.CountdownEnd - ReplicatedStorage.Values.ServerTick.Value, 0);
                            local math_floor_ret = math.floor(math_max_ret / 60 / 60 / 24 % 365.2425);

                            if math_floor_ret < 10 then
                                math_floor_ret = "0" .. math_floor_ret;
                            end;

                            local math_floor_ret2 = math.floor(math_max_ret / 60 / 60 % 24);

                            if math_floor_ret2 < 10 then
                                math_floor_ret2 = "0" .. math_floor_ret2;
                            end;

                            local math_floor_ret3 = math.floor(math_max_ret / 60 % 60);

                            if math_floor_ret3 < 10 then
                                math_floor_ret3 = "0" .. math_floor_ret3;
                            end;

                            local math_floor_ret4 = math.floor(math_max_ret % 60);

                            if math_floor_ret4 < 10 then
                                math_floor_ret4 = "0" .. math_floor_ret4;
                            end;

                            u42.TimerLabel.Text = math_floor_ret .. ":" .. math_floor_ret2 .. ":" .. math_floor_ret3 .. ":" .. math_floor_ret4;

                            if math_max_ret <= 86400 then
                                u42.TimerLabel.TextColor3 = Color3.new(1, 0, 0);
                            end;

                            task.wait(1);
                        end;
                    end);
                end;

                u42.LayoutOrder = u41.LayoutOrder and 1000 - u41.LayoutOrder or u42.LayoutOrder;

                if u41.Rarities then
                    u42.RarityRatesButton.Visible = true;

                    for _, v in pairs({ "subcommon", "common", "uncommon", "rare", "legendary", "exotic", "limited" }) do
                        local v57 = u42.OddsFrame.Frame:FindFirstChild(v);

                        if v57 then
                            v57.Visible = u41.Rarities[v] ~= nil;
                        end;
                    end;

                    for i, v in pairs(u41.Rarities) do
                        local v58 = u42.OddsFrame.Frame:FindFirstChild(i);

                        if v58 then
                            local v59 = Skins.CONFIG.CustomRarityNames[i] or string.upper(i);
                            local v60 = Skins.CONFIG.RarityBands[i] or Color3.new(1, 1, 1);
                            v58.ValueLabel.TextColor3 = Color3.new(1, 1, 1);
                            local v61;

                            if v then
                                v61 = tostring(v) .. "%";
                            else
                                v58.ValueLabel.Position = UDim2.new(v58.ValueLabel.Position.X.Scale, 0, v58.ValueLabel.Position.Y.Scale, v58.ValueLabel.Position.Y.Offset);
                                v58.ValueLabel.TextXAlignment = Enum.TextXAlignment.Center;
                                v58.ValueLabel.TextColor3 = v60;
                                v59 = "";
                                v61 = "????";
                            end;

                            v58.NameLabel.Text = v59;
                            v58.NameLabel.TextColor3 = v60;
                            v58.ValueLabel.Text = v61;
                        end;
                    end;

                    local blank = u42.OddsFrame.Frame:FindFirstChild("blank");
                    local killtrack = u42.OddsFrame.Frame:FindFirstChild("killtrack");
                    local souvenir = u42.OddsFrame.Frame:FindFirstChild("souvenir");

                    if killtrack and (blank and souvenir) then
                        blank.Visible = not u41.NoKilltracks or u41.SouvenirType;
                        souvenir.Visible = u41.SouvenirType;
                        killtrack.Visible = not u41.NoKilltracks;

                        if souvenir.Visible then
                            local math_floor_ret = math.floor(u41.SouvenirChance / 100 * 100);
                            souvenir.ValueLabel.Text = `{math_floor_ret}%`;

                            if not killtrack.Visible then
                                blank.Size = UDim2.new(1, 0, 0.04, 0);
                            end;
                        end;
                    end;

                    local function Close() -- Line: 629
                        -- upvalues: u45 (ref), u42 (copy), u10 (ref), u49 (ref), u15 (ref), u44 (copy)
                        u45 = false;
                        u42.OddsFrame.Visible = false;
                        u42.RarityRatesButton.Visible = true;

                        if u10 and u42.Parent.Visible then
                            u42.GiftFrame.Visible = u49;
                            u42.GiftFrame.BuyFrame.Visible = not u15[u44[1]];
                            u42.Hover.Visible = not u49;
                        end;
                    end;

                    u42.RarityRatesButton.MouseButton1Click:Connect(function() -- Line: 639
                        -- upvalues: u42 (copy), u45 (ref), u15 (ref), u44 (copy), StoreFrame (ref), u10 (ref), u49 (ref), UISounds (ref)
                        u42.OddsFrame.Visible = true;
                        u42.RarityRatesButton.Visible = false;
                        u45 = true;
                        u42.GiftFrame.Visible = false;
                        u42.GiftFrame.BuyFrame.Visible = not u15[u44[1]];
                        u42.Hover.Visible = false;
                        local u62 = nil;
                        local u63 = nil;
                        local u64 = nil;
                        u62 = u42.OddsFrame:GetPropertyChangedSignal("Visible"):Connect(function() -- Line: 648
                            -- upvalues: u62 (ref), u63 (ref), u64 (ref)
                            u62:Disconnect();
                            u63:Disconnect();
                            u64:Disconnect();
                        end);
                        u64 = StoreFrame:GetPropertyChangedSignal("Visible"):Connect(function() -- Line: 653
                            -- upvalues: u62 (ref), u63 (ref), u64 (ref), u45 (ref), u42 (ref), u10 (ref), u49 (ref), u15 (ref), u44 (ref)
                            u62:Disconnect();
                            u63:Disconnect();
                            u64:Disconnect();
                            u45 = false;
                            u42.OddsFrame.Visible = false;
                            u42.RarityRatesButton.Visible = true;

                            if u10 and u42.Parent.Visible then
                                u42.GiftFrame.Visible = u49;
                                u42.GiftFrame.BuyFrame.Visible = not u15[u44[1]];
                                u42.Hover.Visible = not u49;
                            end;
                        end);
                        u63 = u42.Parent:GetPropertyChangedSignal("Visible"):Connect(function() -- Line: 660
                            -- upvalues: u62 (ref), u63 (ref), u64 (ref), u45 (ref), u42 (ref), u10 (ref), u49 (ref), u15 (ref), u44 (ref)
                            u62:Disconnect();
                            u63:Disconnect();
                            u64:Disconnect();
                            u45 = false;
                            u42.OddsFrame.Visible = false;
                            u42.RarityRatesButton.Visible = true;

                            if u10 and u42.Parent.Visible then
                                u42.GiftFrame.Visible = u49;
                                u42.GiftFrame.BuyFrame.Visible = not u15[u44[1]];
                                u42.Hover.Visible = not u49;
                            end;
                        end);
                        UISounds.click:Play();
                    end);
                    u42.OddsFrame.CloseButton.MouseButton1Click:Connect(function() -- Line: 669
                        -- upvalues: UISounds (ref), u45 (ref), u42 (copy), u10 (ref), u49 (ref), u15 (ref), u44 (copy)
                        UISounds.click:Play();
                        u45 = false;
                        u42.OddsFrame.Visible = false;
                        u42.RarityRatesButton.Visible = true;

                        if u10 and u42.Parent.Visible then
                            u42.GiftFrame.Visible = u49;
                            u42.GiftFrame.BuyFrame.Visible = not u15[u44[1]];
                            u42.Hover.Visible = not u49;
                        end;
                    end);
                end;

                if u41.CaseContents then
                    local CaseContentFrames, v65, v66 = Skins.GetCaseContentFrames(u41.CaseContents);
                    local u67 = script.CaseContentScrollFrame:Clone();
                    local u68 = script.CaseContentScrollFrame2:Clone();
                    local u69 = script.CaseContentScrollFrame3:Clone();

                    for _, v in pairs(CaseContentFrames) do
                        v.Parent = u67;
                    end;

                    for _, v in pairs(v65) do
                        v.Parent = u68;
                    end;

                    for _, v in pairs(v66) do
                        v.Parent = u69;
                    end;

                    local EXOTIC = u67:FindFirstChild("EXOTIC");
                    local LIMITED = u67:FindFirstChild("LIMITED");
                    u67.Visible = false;
                    u68.Visible = false;
                    u67.Parent = SkinContents;
                    u68.Parent = SkinContents2;
                    u69.Visible = false;
                    u69.Parent = SkinContents3;
                    local u70 = {};

                    local function _applyDetails(p71, p72) -- Line: 706
                        -- upvalues: u70 (copy)
                        u70[p71] = p72;

                        for _, descendant in ipairs(p71:GetDescendants()) do
                            if descendant.Name == "Odds" then
                                descendant.Visible = p72;
                            end;
                        end;

                        local RoundWarn = p71:FindFirstChild("RoundWarn");

                        if RoundWarn then
                            RoundWarn.Visible = p72;
                        end;
                    end;

                    local function _setDetails(p73, p74, p75) -- Line: 712
                        for _, descendant in ipairs(p74:GetDescendants()) do
                            local Odds = descendant:FindFirstChild("Odds");

                            if Odds then
                                Odds.Visible = p75;
                            end;
                        end;

                        local RoundWarn = p73:FindFirstChild("RoundWarn");

                        if RoundWarn then
                            RoundWarn.Visible = p75;
                        end;
                    end;

                    local function _resetDetails() -- Line: 718
                        -- upvalues: _applyDetails (copy), SkinContents (ref), SkinContents2 (ref), SkinContents3 (ref)
                        _applyDetails(SkinContents, false);
                        _applyDetails(SkinContents2, false);
                        _applyDetails(SkinContents3, false);
                    end;

                    local function _wireDetails(u76, p77) -- Line: 721
                        -- upvalues: _applyDetails (copy), UISounds (ref)
                        local OddsButton = u76:FindFirstChild("OddsButton");

                        if not OddsButton then
                            return;
                        end;

                        if OddsButton:GetAttribute("PRIWired") then
                            return;
                        end;

                        OddsButton:SetAttribute("PRIWired", true);
                        OddsButton.MouseButton1Click:Connect(function() -- Line: 725
                            -- upvalues: u76 (copy), _applyDetails (ref), UISounds (ref)
                            local RoundWarn = u76:FindFirstChild("RoundWarn");

                            if RoundWarn then
                                RoundWarn = RoundWarn.Visible;
                            end;

                            _applyDetails(u76, not RoundWarn);
                            UISounds.click:Play();
                        end);
                    end;

                    _wireDetails(SkinContents, u67);
                    _wireDetails(SkinContents2, u68);
                    _wireDetails(SkinContents3, u69);
                    _applyDetails(SkinContents, false);
                    _applyDetails(SkinContents2, false);
                    _applyDetails(SkinContents3, false);
                    local u78 = false;
                    _applyDetails(SkinContents, false);
                    _applyDetails(SkinContents2, false);
                    _applyDetails(SkinContents3, false);

                    local function _() -- Line: 736
                        -- upvalues: _applyDetails (copy), SkinContents (ref), SkinContents2 (ref), SkinContents3 (ref), u46 (ref), u47 (ref), u67 (copy), u68 (copy), u69 (copy), u13 (ref), Skins2 (ref), u10 (ref), u42 (copy), u49 (ref), u15 (ref), u44 (copy)
                        _applyDetails(SkinContents, false);
                        _applyDetails(SkinContents2, false);
                        _applyDetails(SkinContents3, false);
                        u46 = false;
                        u47 = false;
                        u67.Visible = false;
                        u68.Visible = false;
                        u69.Visible = false;

                        if u13 == 1 then
                            Skins2.Visible = true;
                        end;

                        if u10 and u42.Parent.Visible then
                            u42.GiftFrame.Visible = u49;
                            u42.GiftFrame.BuyFrame.Visible = not u15[u44[1]];
                            u42.Hover.Visible = not u49;
                        end;
                    end;

                    u42.ContentsButton.MouseButton1Click:Connect(function() -- Line: 753
                        -- upvalues: u46 (ref), u42 (copy), u15 (ref), u44 (copy), Skins2 (ref), StoreFrame (ref), _applyDetails (copy), SkinContents (ref), SkinContents2 (ref), SkinContents3 (ref), u47 (ref), u67 (copy), u68 (copy), u69 (copy), u13 (ref), u10 (ref), u49 (ref), UISounds (ref)
                        u46 = true;
                        u42.GiftFrame.Visible = false;
                        u42.GiftFrame.BuyFrame.Visible = not u15[u44[1]];
                        u42.Hover.Visible = false;
                        Skins2.Visible = false;
                        local u79 = nil;
                        local u80 = nil;
                        local u81 = nil;
                        u79 = StoreFrame:GetPropertyChangedSignal("Visible"):Connect(function() -- Line: 761
                            -- upvalues: u79 (ref), u80 (ref), u81 (ref), _applyDetails (ref), SkinContents (ref), SkinContents2 (ref), SkinContents3 (ref), u46 (ref), u47 (ref), u67 (ref), u68 (ref), u69 (ref), u13 (ref), Skins2 (ref), u10 (ref), u42 (ref), u49 (ref), u15 (ref), u44 (ref)
                            u79:Disconnect();
                            u80:Disconnect();
                            u81:Disconnect();
                            _applyDetails(SkinContents, false);
                            _applyDetails(SkinContents2, false);
                            _applyDetails(SkinContents3, false);
                            u46 = false;
                            u47 = false;
                            u67.Visible = false;
                            u68.Visible = false;
                            u69.Visible = false;

                            if u13 == 1 then
                                Skins2.Visible = true;
                            end;

                            if u10 and u42.Parent.Visible then
                                u42.GiftFrame.Visible = u49;
                                u42.GiftFrame.BuyFrame.Visible = not u15[u44[1]];
                                u42.Hover.Visible = not u49;
                            end;
                        end);
                        u80 = u42.Parent:GetPropertyChangedSignal("Visible"):Connect(function() -- Line: 768
                            -- upvalues: u79 (ref), u80 (ref), u81 (ref), _applyDetails (ref), SkinContents (ref), SkinContents2 (ref), SkinContents3 (ref), u46 (ref), u47 (ref), u67 (ref), u68 (ref), u69 (ref), u13 (ref), Skins2 (ref), u10 (ref), u42 (ref), u49 (ref), u15 (ref), u44 (ref)
                            u79:Disconnect();
                            u80:Disconnect();
                            u81:Disconnect();
                            _applyDetails(SkinContents, false);
                            _applyDetails(SkinContents2, false);
                            _applyDetails(SkinContents3, false);
                            u46 = false;
                            u47 = false;
                            u67.Visible = false;
                            u68.Visible = false;
                            u69.Visible = false;

                            if u13 == 1 then
                                Skins2.Visible = true;
                            end;

                            if u10 and u42.Parent.Visible then
                                u42.GiftFrame.Visible = u49;
                                u42.GiftFrame.BuyFrame.Visible = not u15[u44[1]];
                                u42.Hover.Visible = not u49;
                            end;
                        end);
                        u81 = SkinContents.CloseButton.MouseButton1Click:Connect(function() -- Line: 775
                            -- upvalues: u79 (ref), u80 (ref), u81 (ref), UISounds (ref), _applyDetails (ref), SkinContents (ref), SkinContents2 (ref), SkinContents3 (ref), u46 (ref), u47 (ref), u67 (ref), u68 (ref), u69 (ref), u13 (ref), Skins2 (ref), u10 (ref), u42 (ref), u49 (ref), u15 (ref), u44 (ref)
                            u79:Disconnect();
                            u80:Disconnect();
                            u81:Disconnect();
                            UISounds.click:Play();
                            _applyDetails(SkinContents, false);
                            _applyDetails(SkinContents2, false);
                            _applyDetails(SkinContents3, false);
                            u46 = false;
                            u47 = false;
                            u67.Visible = false;
                            u68.Visible = false;
                            u69.Visible = false;

                            if u13 == 1 then
                                Skins2.Visible = true;
                            end;

                            if u10 and u42.Parent.Visible then
                                u42.GiftFrame.Visible = u49;
                                u42.GiftFrame.BuyFrame.Visible = not u15[u44[1]];
                                u42.Hover.Visible = not u49;
                            end;

                            SkinContents.Visible = false;
                        end);
                        u67.CanvasPosition = Vector2.new(0, 0);
                        u67.Visible = true;
                        u68.Visible = false;
                        SkinContents.Visible = true;
                        UISounds.click:Play();
                    end);

                    if EXOTIC and v65 then
                        EXOTIC.ContentsButton.MouseButton1Click:Connect(function() -- Line: 795
                            -- upvalues: u46 (ref), u47 (ref), _applyDetails (copy), SkinContents (ref), SkinContents2 (ref), SkinContents3 (ref), u42 (copy), u15 (ref), u44 (copy), StoreFrame (ref), u67 (copy), u68 (copy), u69 (copy), u13 (ref), Skins2 (ref), u10 (ref), u49 (ref), UISounds (ref)
                            if not u46 then
                                return;
                            end;

                            u47 = true;
                            _applyDetails(SkinContents, false);
                            _applyDetails(SkinContents2, false);
                            _applyDetails(SkinContents3, false);
                            u42.GiftFrame.Visible = false;
                            u42.GiftFrame.BuyFrame.Visible = not u15[u44[1]];
                            u42.Hover.Visible = false;
                            local u82 = nil;
                            local u83 = nil;
                            local u84 = nil;
                            u82 = StoreFrame:GetPropertyChangedSignal("Visible"):Connect(function() -- Line: 807
                                -- upvalues: u82 (ref), u83 (ref), u84 (ref), _applyDetails (ref), SkinContents (ref), SkinContents2 (ref), SkinContents3 (ref), u46 (ref), u47 (ref), u67 (ref), u68 (ref), u69 (ref), u13 (ref), Skins2 (ref), u10 (ref), u42 (ref), u49 (ref), u15 (ref), u44 (ref)
                                u82:Disconnect();
                                u83:Disconnect();
                                u84:Disconnect();
                                _applyDetails(SkinContents, false);
                                _applyDetails(SkinContents2, false);
                                _applyDetails(SkinContents3, false);
                                u46 = false;
                                u47 = false;
                                u67.Visible = false;
                                u68.Visible = false;
                                u69.Visible = false;

                                if u13 == 1 then
                                    Skins2.Visible = true;
                                end;

                                if u10 and u42.Parent.Visible then
                                    u42.GiftFrame.Visible = u49;
                                    u42.GiftFrame.BuyFrame.Visible = not u15[u44[1]];
                                    u42.Hover.Visible = not u49;
                                end;
                            end);
                            u83 = u42.Parent:GetPropertyChangedSignal("Visible"):Connect(function() -- Line: 814
                                -- upvalues: u82 (ref), u83 (ref), u84 (ref), _applyDetails (ref), SkinContents (ref), SkinContents2 (ref), SkinContents3 (ref), u46 (ref), u47 (ref), u67 (ref), u68 (ref), u69 (ref), u13 (ref), Skins2 (ref), u10 (ref), u42 (ref), u49 (ref), u15 (ref), u44 (ref)
                                u82:Disconnect();
                                u83:Disconnect();
                                u84:Disconnect();
                                _applyDetails(SkinContents, false);
                                _applyDetails(SkinContents2, false);
                                _applyDetails(SkinContents3, false);
                                u46 = false;
                                u47 = false;
                                u67.Visible = false;
                                u68.Visible = false;
                                u69.Visible = false;

                                if u13 == 1 then
                                    Skins2.Visible = true;
                                end;

                                if u10 and u42.Parent.Visible then
                                    u42.GiftFrame.Visible = u49;
                                    u42.GiftFrame.BuyFrame.Visible = not u15[u44[1]];
                                    u42.Hover.Visible = not u49;
                                end;
                            end);
                            u84 = SkinContents2.CloseButton.MouseButton1Click:Connect(function() -- Line: 821
                                -- upvalues: u82 (ref), u83 (ref), u84 (ref), UISounds (ref), u67 (ref), u68 (ref), SkinContents (ref), SkinContents2 (ref)
                                u82:Disconnect();
                                u83:Disconnect();
                                u84:Disconnect();
                                UISounds.click:Play();
                                u67.CanvasPosition = Vector2.new(0, 0);
                                u67.Visible = true;
                                u68.Visible = false;
                                SkinContents.Visible = true;
                                SkinContents2.Visible = false;
                            end);
                            u67.Visible = false;
                            u68.CanvasPosition = Vector2.new(0, 0);
                            u68.Visible = true;
                            SkinContents.Visible = false;
                            SkinContents2.Visible = true;
                            UISounds.click:Play();
                        end);
                    end;

                    if LIMITED and v66 then
                        LIMITED.ContentsButton.MouseButton1Click:Connect(function() -- Line: 847
                            -- upvalues: u46 (ref), u78 (ref), _applyDetails (copy), SkinContents (ref), SkinContents2 (ref), SkinContents3 (ref), u42 (copy), u15 (ref), u44 (copy), StoreFrame (ref), u47 (ref), u67 (copy), u68 (copy), u69 (copy), u13 (ref), Skins2 (ref), u10 (ref), u49 (ref), UISounds (ref)
                            if not u46 then
                                return;
                            end;

                            u78 = true;
                            _applyDetails(SkinContents, false);
                            _applyDetails(SkinContents2, false);
                            _applyDetails(SkinContents3, false);
                            u42.GiftFrame.Visible = false;
                            u42.GiftFrame.BuyFrame.Visible = not u15[u44[1]];
                            u42.Hover.Visible = false;
                            local u85 = nil;
                            local u86 = nil;
                            local u87 = nil;
                            u85 = StoreFrame:GetPropertyChangedSignal("Visible"):Connect(function() -- Line: 859
                                -- upvalues: u85 (ref), u86 (ref), u87 (ref), _applyDetails (ref), SkinContents (ref), SkinContents2 (ref), SkinContents3 (ref), u46 (ref), u47 (ref), u67 (ref), u68 (ref), u69 (ref), u13 (ref), Skins2 (ref), u10 (ref), u42 (ref), u49 (ref), u15 (ref), u44 (ref)
                                u85:Disconnect();
                                u86:Disconnect();
                                u87:Disconnect();
                                _applyDetails(SkinContents, false);
                                _applyDetails(SkinContents2, false);
                                _applyDetails(SkinContents3, false);
                                u46 = false;
                                u47 = false;
                                u67.Visible = false;
                                u68.Visible = false;
                                u69.Visible = false;

                                if u13 == 1 then
                                    Skins2.Visible = true;
                                end;

                                if u10 and u42.Parent.Visible then
                                    u42.GiftFrame.Visible = u49;
                                    u42.GiftFrame.BuyFrame.Visible = not u15[u44[1]];
                                    u42.Hover.Visible = not u49;
                                end;
                            end);
                            u86 = u42.Parent:GetPropertyChangedSignal("Visible"):Connect(function() -- Line: 866
                                -- upvalues: u85 (ref), u86 (ref), u87 (ref), _applyDetails (ref), SkinContents (ref), SkinContents2 (ref), SkinContents3 (ref), u46 (ref), u47 (ref), u67 (ref), u68 (ref), u69 (ref), u13 (ref), Skins2 (ref), u10 (ref), u42 (ref), u49 (ref), u15 (ref), u44 (ref)
                                u85:Disconnect();
                                u86:Disconnect();
                                u87:Disconnect();
                                _applyDetails(SkinContents, false);
                                _applyDetails(SkinContents2, false);
                                _applyDetails(SkinContents3, false);
                                u46 = false;
                                u47 = false;
                                u67.Visible = false;
                                u68.Visible = false;
                                u69.Visible = false;

                                if u13 == 1 then
                                    Skins2.Visible = true;
                                end;

                                if u10 and u42.Parent.Visible then
                                    u42.GiftFrame.Visible = u49;
                                    u42.GiftFrame.BuyFrame.Visible = not u15[u44[1]];
                                    u42.Hover.Visible = not u49;
                                end;
                            end);
                            u87 = SkinContents3.CloseButton.MouseButton1Click:Connect(function() -- Line: 873
                                -- upvalues: u85 (ref), u86 (ref), u87 (ref), UISounds (ref), u67 (ref), u69 (ref), SkinContents (ref), SkinContents3 (ref)
                                u85:Disconnect();
                                u86:Disconnect();
                                u87:Disconnect();
                                UISounds.click:Play();
                                u67.CanvasPosition = Vector2.new(0, 0);
                                u67.Visible = true;
                                u69.Visible = false;
                                SkinContents.Visible = true;
                                SkinContents3.Visible = false;
                            end);
                            u67.Visible = false;
                            u69.CanvasPosition = Vector2.new(0, 0);
                            u69.Visible = true;
                            SkinContents.Visible = false;
                            SkinContents3.Visible = true;
                            UISounds.click:Play();
                        end);
                    end;
                end;

                table.insert(u8, {
                    u42,
                    u36,
                    u43,
                    u39,
                    u41
                });
                u42.Parent = p37;

                return u42;
            end;
        end;

        for i, v in pairs(Gamepasses) do
            local v88 = v[1];
            local v89 = v[2];

            if not (v[5] and (typeof(v[5]) == "table" and (v[5].noprime and _G.PlayerData.Prime))) then
                CreateFunc(nil, i, Passes, "pass", v88, v89, v);
            end;
        end;

        for i, v in pairs(Products) do
            local v90 = v[1];
            local v91 = v[2];

            if string.find(v90, "CashTier") then
                CreateFunc(nil, i, Products2, "product", v90, v91, v);
            elseif v90 == "DoubleXP" then
                CreateFunc(XP.Template, i, XP, "product", v90, v91, v);
            end;
        end;

        task.delay(0, function() -- Line: 926
            -- upvalues: u16 (ref), u14 (ref), CreateFunc (copy), Skins2 (ref)
            repeat
                task.wait(0.2);
                u16 = _G.COSMETIC_STORE_DATA;
            until u16;

            local v92 = 0;

            for i, v in pairs(u16.Cases) do
                v92 = v92 + 1;

                if v.ForSale then
                    u14[v.ProductId] = {
                        i,
                        v92,
                        v.DisplayName,
                        v.GiftProductId,
                        v.BulkProductId,
                        v.BulkGiftProductId
                    };
                    CreateFunc(script.Template2:Clone(), v.ProductId, Skins2, "case", v.DisplayName, 0, v);
                end;
            end;
        end);

        local function cpF_B_Func(p93) -- Line: 969
            -- upvalues: UISounds (ref), u13 (ref), update (ref), Passes (ref), XP (ref), Skins2 (ref), MoneyB (ref), XPB (ref), PassesB (ref), SkinsB (ref), ReplicatedStorage (ref), Unavailable (ref), Products2 (ref), SkinContents (ref)
            UISounds.click:Play();
            u13 = 3;
            update();
            Passes.Visible = false;
            XP.Visible = false;
            Skins2.Visible = false;
            MoneyB.Title.TextColor3 = Color3.new(1, 1, 1);
            XPB.Title.TextColor3 = Color3.new(0.745, 0.745, 0.745);
            PassesB.Title.TextColor3 = Color3.new(0.745, 0.745, 0.745);
            SkinsB.Title.TextColor3 = Color3.fromRGB(176, 114, 0);

            if ReplicatedStorage.Values.DataSaving.Value then
                Unavailable.Visible = false;
                Products2.Visible = true;
            else
                Unavailable.Visible = true;
            end;

            if MoneyB:FindFirstChild("Hint") then
                MoneyB.Hint.Visible = false;
            end;

            if p93 then
                UISounds.click:Play();
            end;

            SkinContents.Visible = false;
        end;

        local function xpF_B_Func(p94) -- Line: 1001
            -- upvalues: UISounds (ref), u13 (ref), update (ref), Products2 (ref), Passes (ref), Skins2 (ref), MoneyB (ref), PassesB (ref), SkinsB (ref), XPB (ref), ReplicatedStorage (ref), Unavailable (ref), XP (ref), SkinContents (ref)
            UISounds.click:Play();
            u13 = 4;
            update();
            Products2.Visible = false;
            Passes.Visible = false;
            Skins2.Visible = false;
            MoneyB.Title.TextColor3 = Color3.new(0.745, 0.745, 0.745);
            PassesB.Title.TextColor3 = Color3.new(0.745, 0.745, 0.745);
            SkinsB.Title.TextColor3 = Color3.fromRGB(176, 114, 0);
            XPB.Title.TextColor3 = Color3.new(1, 1, 1);

            if ReplicatedStorage.Values.DataSaving.Value then
                Unavailable.Visible = false;
                XP.Visible = true;
            else
                Unavailable.Visible = true;
            end;

            if XPB:FindFirstChild("Hint") then
                XPB.Hint.Visible = false;
            end;

            if p94 then
                UISounds.click:Play();
            end;

            SkinContents.Visible = false;
        end;

        local function skF_B_Func(p95) -- Line: 1034
            -- upvalues: UISounds (ref), u13 (ref), update (ref), Products2 (ref), Passes (ref), XP (ref), MoneyB (ref), XPB (ref), PassesB (ref), SkinsB (ref), ReplicatedStorage (ref), Unavailable (ref), Skins2 (ref)
            UISounds.click:Play();
            u13 = 1;
            update();
            Products2.Visible = false;
            Passes.Visible = false;
            XP.Visible = false;
            MoneyB.Title.TextColor3 = Color3.new(0.745, 0.745, 0.745);
            XPB.Title.TextColor3 = Color3.new(0.745, 0.745, 0.745);
            PassesB.Title.TextColor3 = Color3.new(0.745, 0.745, 0.745);
            SkinsB.Title.TextColor3 = Color3.fromRGB(255, 170, 0);

            if ReplicatedStorage.Values.DataSaving.Value then
                Unavailable.Visible = false;
                Skins2.Visible = true;
            else
                Unavailable.Visible = true;
            end;

            if SkinsB:FindFirstChild("Hint") then
                SkinsB.Hint.Visible = false;
            end;

            if p95 then
                UISounds.click:Play();
            end;
        end;

        PassesB.MouseButton1Click:Connect(function(p96) -- Line: 941, Name: gpF_B_Func
            -- upvalues: UISounds (ref), u13 (ref), update (ref), Products2 (ref), XP (ref), Skins2 (ref), Passes (ref), MoneyB (ref), XPB (ref), SkinsB (ref), PassesB (ref), Unavailable (ref), SkinContents (ref)
            UISounds.click:Play();
            u13 = 2;
            update();
            Products2.Visible = false;
            XP.Visible = false;
            Skins2.Visible = false;
            Passes.Visible = true;
            MoneyB.Title.TextColor3 = Color3.new(0.745, 0.745, 0.745);
            XPB.Title.TextColor3 = Color3.new(0.745, 0.745, 0.745);
            SkinsB.Title.TextColor3 = Color3.fromRGB(176, 114, 0);
            PassesB.Title.TextColor3 = Color3.new(1, 1, 1);
            Unavailable.Visible = false;

            if PassesB:FindFirstChild("Hint") then
                PassesB.Hint.Visible = false;
            end;

            if p96 then
                UISounds.click:Play();
            end;

            SkinContents.Visible = false;
        end);
        MoneyB.MouseButton1Click:Connect(cpF_B_Func);
        XPB.MouseButton1Click:Connect(xpF_B_Func);
        SkinsB.MouseButton1Click:Connect(skF_B_Func);
        PassesB.MouseButton1Click:Connect(_closeContentsOverlay);
        MoneyB.MouseButton1Click:Connect(_closeContentsOverlay);
        XPB.MouseButton1Click:Connect(_closeContentsOverlay);
        SkinsB.MouseButton1Click:Connect(_closeContentsOverlay);
        skF_B_Func(true);
        StoreFrame2:WaitForChild("CloseButton").MouseButton1Click:Connect(function() -- Line: 1075
            -- upvalues: ToggleGUI (ref)
            ToggleGUI(false);
        end);
        Events2.ToggleStoreUI.Event:Connect(ToggleGUI);

        if u7 then
            u7.Gamepasses.ChildAdded:Connect(function() -- Line: 1090
                -- upvalues: update (ref)
                update(true);
            end);
        end;

        Events.GetGamepasses:FireServer();
        update(true);
        Events.PurchaseFinished.OnClientEvent:Connect(update);

        local function updtInpType(p97) -- Line: 1100
            -- upvalues: StoreFrame2 (ref), UserInputService (ref)
            if p97 ~= 2 then
                StoreFrame2.CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255);
                StoreFrame2.CloseButton.Text = "X";
                StoreFrame2.CloseButton.ImageLabel.Visible = false;

                return;
            end;

            StoreFrame2.CloseButton.TextColor3 = Color3.fromRGB(255, 170, 0);
            StoreFrame2.CloseButton.Text = "Y";
            StoreFrame2.CloseButton.Text = "";
            local ImageForKeyCode = UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonY);
            StoreFrame2.CloseButton.ImageLabel.Image = ImageForKeyCode or "";
            StoreFrame2.CloseButton.ImageLabel.Visible = true;
        end;

        UserInputService.InputBegan:Connect(function(p98, p99) -- Line: 1117
            -- upvalues: u10 (ref), ToggleGUI (ref)
            if p98.KeyCode == Enum.KeyCode.ButtonY and (not p99 and u10) then
                ToggleGUI(false);
            end;
        end);
        Events2.InputTypeChanged.Event:Connect(updtInpType);
        updtInpType(_G.InputType);

        local function UpdateDoubleXP() -- Line: 1128
            -- upvalues: u7 (ref), XP (ref), TweenService (ref)
            if u7.DoubleXP.Value then
                if u7.DoubleXP.Perm.Value then
                    XP.ExpireFrame.ExpireText.Text = "XX:XX";
                else
                    local Value = u7.DoubleXP.Timer.Value;

                    local function _(p100) -- Line: 29
                        return string.format("%02i", p100);
                    end;

                    local v101 = (Value - Value % 60) / 60;
                    XP.ExpireFrame.ExpireText.Text = string.format("%02i", v101) .. ":" .. string.format("%02i", Value - v101 * 60);
                end;
            else
                local v102 = 0;

                local function _(p103) -- Line: 29
                    return string.format("%02i", p103);
                end;

                local v104 = (v102 - v102 % 60) / 60;
                XP.ExpireFrame.ExpireText.Text = string.format("%02i", v104) .. ":" .. string.format("%02i", v102 - v104 * 60);
            end;

            if u7.DoubleXP.Timer.Value < 180 then
                if XP.ExpireFrame.ExpireText.TextColor3 ~= Color3.fromRGB(255, 170, 0) then
                    TweenService:Create(XP.ExpireFrame.ExpireText, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        TextColor3 = Color3.fromRGB(255, 170, 0)
                    }):Play();
                end;
            elseif XP.ExpireFrame.ExpireText.TextColor3 ~= Color3.fromRGB(255, 255, 255) then
                TweenService:Create(XP.ExpireFrame.ExpireText, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                }):Play();
            end;
        end;

        local function DoubleXPHandler(p105) -- Line: 1152
            -- upvalues: u7 (ref), XP (ref), update (ref), UpdateDoubleXP (copy)
            if u7.DoubleXP.Value then
                XP.ExpireFrame.Visible = true;
                XP.ExpireFrame.TextLabel.Gradient1.Enabled = true;
                XP.ExpireFrame.ExpireText.Gradient1.Enabled = true;
            else
                local v106 = XP.ExpireFrame.Visible == true;
                XP.ExpireFrame.Visible = false;
                XP.Warn.Visible = false;
                XP.ExpireFrame.TextLabel.Gradient1.Enabled = false;
                XP.ExpireFrame.ExpireText.Gradient1.Enabled = false;

                if v106 then
                    update();
                end;
            end;

            UpdateDoubleXP();
        end;

        MarketplaceService.PromptProductPurchaseFinished:Connect(function(p107, p108, p109) -- Line: 1183
            -- upvalues: LocalPlayer (ref), u11 (ref), u12 (ref), update (ref)
            if p107 ~= LocalPlayer.UserId then
                return;
            end;

            if u11 or p108 == u12 then
                u11 = false;
            end;

            update();
            task.delay(1, function() -- Line: 1195
                -- upvalues: update (ref)
                update();
            end);
        end);
        GiftFrame.CloseButton.MouseButton1Click:Connect(function() -- Line: 1200
            -- upvalues: GiftFrame (ref), UISounds (ref), u10 (ref), StoreFrame2 (ref)
            for _, child in pairs(GiftFrame.ScrollingFrame:GetChildren()) do
                if child:IsA("Frame") then
                    child:Destroy();
                end;
            end;

            UISounds.click:Play();
            GiftFrame.Visible = false;

            if u10 then
                StoreFrame2.Visible = true;
            end;
        end);
        u7:WaitForChild("DoubleXP").Changed:Connect(DoubleXPHandler);
        u7.DoubleXP:WaitForChild("Timer"):GetPropertyChangedSignal("Value"):Connect(function() -- Line: 1205
            -- upvalues: XP (ref), u7 (ref), UpdateDoubleXP (copy)
            local Value = u7.DoubleXP.Timer.Value;

            local function _(p110) -- Line: 29
                return string.format("%02i", p110);
            end;

            local v111 = (Value - Value % 60) / 60;
            XP.ExpireFrame.ExpireText.Text = string.format("%02i", v111) .. ":" .. string.format("%02i", Value - v111 * 60);
            UpdateDoubleXP();
        end);
        DoubleXPHandler(u7.DoubleXP.Value);

        if _G.PlayerData.Bank then
            Cash.Text = "$" .. AddCommas(_G.PlayerData.Bank);
        end;

        Events2.UpdateClientData.Event:Connect(UpdateCashLabel);
    end)();
end;

return v2;
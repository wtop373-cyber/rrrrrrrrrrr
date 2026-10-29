-- ============================================================
-- SCRIPT: Shop
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface.Modules.Shop
-- ============================================================

-- Decompiled with Potassium's decompiler.

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local Players = game:GetService("Players");
local TweenService = game:GetService("TweenService");
local RunService = game:GetService("RunService");
local GamepadService = game:GetService("GamepadService");
local UserInputService = game:GetService("UserInputService");
local Events = ReplicatedStorage:WaitForChild("Events");
local Events2 = ReplicatedStorage:WaitForChild("Events2");
local NewModules = ReplicatedStorage:WaitForChild("NewModules");
local GetConfig = require(NewModules.Shared.Extensions.GetConfig);
local GetRefillPrice = require(NewModules.Shared.Extensions.GetRefillPrice);
local GetSellPrice = require(NewModules.Shared.Extensions.GetSellPrice);
local GetShopBuyFee = require(NewModules.Shared.Extensions.GetShopBuyFee);
local GetUnlockPrice = require(NewModules.Shared.Extensions.GetUnlockPrice);
local ViewportModel = require(NewModules.Client.Services.ViewportModel);
local UISounds = ReplicatedStorage:WaitForChild("Storage"):WaitForChild("UISounds");
local CoreGUI = script.Parent.Parent.CoreGUI;
local u1 = {};
local v2 = {};

repeat
    task.wait(0.5);
until _G.WaitForChar and (_G.GVF and _G.GVF());

_G.WaitForChar();
local _ = workspace.CurrentCamera;
local LocalPlayer = Players.LocalPlayer;
local Character = LocalPlayer.Character;
local Humanoid = Character:WaitForChild("Humanoid");
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart");
({}).toggle = Humanoid:LoadAnimation(ReplicatedStorage.Storage.Animations:WaitForChild("Toggle2"));
local u3 = ReplicatedStorage:WaitForChild("PlayerbaseData2", 100):WaitForChild(LocalPlayer.Name, 100);
local ItemStats = ReplicatedStorage.Storage:WaitForChild("ItemStats");
local ShopValue = CoreGUI:WaitForChild("ShopValue", 100);
local OpenValue = CoreGUI:WaitForChild("OpenValue");
local ShopType = CoreGUI:WaitForChild("ShopType");
local SSHPRMTE1 = Events:WaitForChild("SSHPRMTE1");
local SSHPRMTE2 = Events:WaitForChild("SSHPRMTE2");
local u4 = _G.GVF and _G.GVF();
local u5 = nil;
local u6 = {};
local u7 = nil;
local u8 = nil;
local u9 = nil;
local u10 = {};
_G.Shop_Active = false;

local function Warn(...) -- Line: 63
    if not _G.ShopDebuggingEnabled then
        return;
    end;

    for _, v in pairs({ ... }) do
        warn("ShopUI: " .. tostring(v));
    end;
end;

Warn("Shop start..");
(function() -- Line: 72, Name: SetUp
    -- upvalues: u1 (copy), CoreGUI (copy), u10 (copy), u9 (ref), ReplicatedStorage (copy), u7 (ref), u5 (ref), ShopValue (copy), Events (copy), u8 (ref), HumanoidRootPart (ref), u3 (copy), u4 (ref), TweenService (copy), LocalPlayer (copy), Character (ref), u6 (copy), Warn (copy), SSHPRMTE1 (copy), ShopType (copy), UISounds (copy), RunService (copy), SSHPRMTE2 (copy), Humanoid (ref), GamepadService (copy), ItemStats (copy), GetUnlockPrice (copy), ViewportModel (copy), GetSellPrice (copy), GetConfig (copy), GetRefillPrice (copy), OpenValue (copy), GetShopBuyFee (copy), UserInputService (copy), Events2 (copy)
    local function createFrames() -- Line: 73
        -- upvalues: u1 (ref), CoreGUI (ref)
        u1.holderF = CoreGUI:WaitForChild("ShopFrame");
        u1.mainF = u1.holderF:WaitForChild("MainFrame");
        u1.restockF = u1.holderF:WaitForChild("RestockFrame");
        u1.protectionF = u1.holderF:WaitForChild("ProtectionFrame");
        u1.topBarF = u1.holderF:WaitForChild("TopBar");
        u1.CloseB = u1.topBarF.CloseButton;
        u1.buttonsF = {
            armorButton = u1.mainF.ButtonFrames.ArmorButton,
            gunsButton = u1.mainF.ButtonFrames.GunsButton,
            meleesButton = u1.mainF.ButtonFrames.MeleesButton,
            miscButton = u1.mainF.ButtonFrames.MiscButton,
            throwablesButton = u1.mainF.ButtonFrames.ThrowablesButton
        };
        u1.buyButton = u1.mainF.BuyButton;
        u1.sellButton = u1.mainF.SellButton;
        u1.listF1 = u1.mainF:WaitForChild("ListFrame1");
        u1.listF2 = u1.mainF:WaitForChild("ListFrame2");
        u1.pictureF = u1.mainF:WaitForChild("PictureFrame");
        u1.pF_bF = u1.pictureF:WaitForChild("BuyFrame");
        u1.listF1_C = {
            melees = u1.listF1.MeleesFrame,
            guns = u1.listF1.GunsFrame,
            armour = u1.listF1.ArmourFrame,
            throwables = u1.listF1.ThrowablesFrame,
            misc = u1.listF1.MiscFrame
        };
        u1.nSellData1 = u1.mainF.NoSellData;
        u1.nSellData2 = u1.mainF.NoSellData2;
        u1.purchaseFs = u1.mainF.PurchaseFrames;
        u1.upgradeF = u1.mainF.UpgradeFrame;
        u1.statsF = u1.pictureF.StatsFrame;
        u1.StatsL = u1.statsF.StatsList;
        u1.AnswerMessage = u1.mainF.AnswerMessage;
    end;

    local function createVbrs() -- Line: 113
        -- upvalues: u10 (ref)
        u10.msgCode = 0;
        u10.lastmsg = "";
        u10.lastMsgTick = 0;
        u10.msgCount = 1;
        u10.open = false;
        u10.canBuy = false;
        u10.processing = false;
        u10.cMode = "Buy";
        u10.createdFrames = {};
        u10.createdFrames2 = {};
        u10.createdFrames3 = {};
        u10.lastnonSellTab = {};
        u10.stkC = {};
        u10.stkBusy = {};
        u10.stkFail = {};
        u10.colors = {};
        u10.colors.green = Color3.fromRGB(170, 255, 199);
        u10.colors.red = Color3.fromRGB(255, 142, 144);
        u10.colors.white = Color3.fromRGB(255, 255, 255);
        u10.colors.grey = Color3.fromRGB(127.5, 127.5, 127.5);
        u10.colors.orange = Color3.fromRGB(255, 202, 115);
        u10.currencyType = "$";
    end;

    local function createFuncs() -- Line: 140
        -- upvalues: u9 (ref), ReplicatedStorage (ref), u7 (ref), u5 (ref), u10 (ref), u1 (ref), ShopValue (ref), Events (ref), u8 (ref), HumanoidRootPart (ref), u3 (ref), u4 (ref), TweenService (ref), LocalPlayer (ref), Character (ref), u6 (ref), Warn (ref), SSHPRMTE1 (ref), ShopType (ref), CoreGUI (ref), UISounds (ref), RunService (ref), SSHPRMTE2 (ref), Humanoid (ref), GamepadService (ref), ItemStats (ref), GetUnlockPrice (ref), ViewportModel (ref), GetSellPrice (ref), GetConfig (ref), GetRefillPrice (ref), OpenValue (ref), GetShopBuyFee (ref), UserInputService (ref), Events2 (ref)
        u9 = {
            convert = function(p11) -- Line: 142, Name: convert
                local function Format(p12) -- Line: 143
                    return string.format("%02i", p12);
                end;

                local v13 = (p11 - p11 % 60) / 60;

                return string.format("%02i", v13) .. ":" .. string.format("%02i", p11 - v13 * 60);
            end,

            addCommas = function(p14) -- Line: 151, Name: addCommas
                local v15 = tostring(p14);

                return #v15 % 3 == 0 and v15:reverse():gsub("(%d%d%d)", "%1,"):reverse():sub(2) or v15:reverse():gsub("(%d%d%d)", "%1,"):reverse();
            end,

            round = function(p16, p17) -- Line: 156, Name: round
                local v18 = 10 ^ (p17 or 0);

                return math.floor(p16 * v18 + 0.5) / v18;
            end,

            CanShopFromBankCheck = function(p19) -- Line: 161, Name: CanShopFromBankCheck
                -- upvalues: ReplicatedStorage (ref)
                local _G_GSettings = _G.GSettings;

                if _G_GSettings then
                    if _G.GSettings.ShopFromBank == true then
                        _G_GSettings = ReplicatedStorage.Values.ShopFromBank.Value;

                        if _G_GSettings then
                            local v20 = p19:FindFirstChild("NoCustomBankBuy") and p19.NoCustomBankBuy.Value;
                            _G_GSettings = not v20;
                        end;
                    else
                        _G_GSettings = false;
                    end;
                end;

                return _G_GSettings;
            end
        };
        u7 = {
            GetChosenCurrency = function() -- Line: 166, Name: GetChosenCurrency
                -- upvalues: ReplicatedStorage (ref)
                return ReplicatedStorage.Values.CashPointsReplace.Value and (_G.PlayerData.Points or 0) or _G.PlayerData.Cash;
            end,

            UpdateStockTime = function(p21) -- Line: 173, Name: UpdateStockTime
                -- upvalues: u5 (ref), ReplicatedStorage (ref), u10 (ref), u1 (ref), u9 (ref), u7 (ref)
                if u5 then
                    u5:Disconnect();
                end;

                local u22;

                if ReplicatedStorage.Values.GlobalStocks.Value then
                    u22 = ReplicatedStorage.Values.GlobalStocks.RestockTime;
                else
                    u22 = p21.RestockTime;
                end;

                u10.rstV = nil;

                local function u() -- Line: 192
                    -- upvalues: u22 (ref), u1 (ref), u9 (ref), u10 (ref), u7 (ref)
                    if u22.Value >= 9000000000 then
                        u1.restockF.Time.Text = "INF";
                    else
                        u1.restockF.Time.Text = u9.convert(u22.Value);
                    end;

                    if u10.rstV and (u22.Value ~= u10.rstV - 1 and u10.open) then
                        task.spawn(u7.FetchStock, true);
                    end;

                    u10.rstV = u22.Value;
                end;

                u();
                u5 = u22.Changed:Connect(u);
            end,

            StockOf = function(p23) -- Line: 211, Name: StockOf
                -- upvalues: ShopValue (ref), u7 (ref), u10 (ref)
                local Value = ShopValue.Value;

                if Value and (p23.Parent and p23.Parent.Parent == Value.Parent) then
                    local v24 = p23:FindFirstChild("Real") and p23.Real.Value;
                    local v25;

                    if v24 then
                        v25 = v24:FindFirstChild("ForSale");
                    else
                        v25 = v24;
                    end;

                    if v25 and not v25.Value then
                        local Type = Value.Parent:FindFirstChild("Type");
                        local v26 = Type and v24:FindFirstChild("SellStations") and v24.SellStations:FindFirstChild(Type.Value);

                        if v26 then
                            v26 = v26:FindFirstChild("ForceForSale");
                        end;

                        if not (v26 and v26.Value) then
                            return 0;
                        end;
                    end;
                end;

                if Value and (p23.Parent and (p23.Parent.Parent == Value.Parent and u7.NoCounts(Value))) then
                    return u7.Common(p23) and p23.Value or 0;
                end;

                local v27;

                if Value then
                    v27 = u10.stkC[Value];
                else
                    v27 = Value;
                end;

                if v27 and (p23.Parent and p23.Parent.Parent == Value.Parent) then
                    local v28 = v27[1][p23.Name];

                    if type(v28) == "number" then
                        return math.min(v28, p23.Value);
                    end;
                end;

                return p23.Value;
            end,

            NoCounts = function(p29) -- Line: 238, Name: NoCounts
                -- upvalues: u10 (ref), ReplicatedStorage (ref), Events (ref)
                local v30;

                if p29 == nil or u10.stkC[p29] ~= nil then
                    v30 = false;
                else
                    v30 = not ReplicatedStorage.Values.GlobalStocks.Value;

                    if v30 then
                        if Events:FindFirstChild("SSHPRMTE3") == nil then
                            v30 = false;
                        else
                            v30 = p29:IsA("BasePart");

                            if v30 then
                                if p29.Parent == nil then
                                    v30 = false;
                                else
                                    v30 = p29.Parent:FindFirstChild("CurrentStocks") ~= nil;
                                end;
                            end;
                        end;
                    end;
                end;

                return v30;
            end,

            Common = function(p31) -- Line: 242, Name: Common
                local v32 = p31:FindFirstChild("Real") and p31.Real.Value;

                if not v32 then
                    return false;
                end;

                if p31:FindFirstChild("MinStockAdd") then
                    return true;
                end;

                local MinStock = v32:FindFirstChild("MinStock");

                if not MinStock then
                    return true;
                end;

                local Multi = p31:FindFirstChild("Multi");

                return math.floor(MinStock.Value * (Multi and Multi.Value or 1)) >= 1;
            end,

            WaitCounts = function(p33) -- Line: 252, Name: WaitCounts
                -- upvalues: u10 (ref), ShopValue (ref), u7 (ref)
                if not p33 or u10.stkLoop == p33 then
                    return;
                end;

                u10.stkLoop = p33;

                for i = 1, 10 do
                    task.wait(0.5);

                    if not (u10.open and (ShopValue.Value == p33 and u7.NoCounts(p33))) then
                        break;
                    end;

                    local v34;

                    if u10.stkBusy[p33] then
                        v34 = i;
                    else
                        u7.FetchStock(true, true, p33);
                        v34 = i;
                    end;
                end;

                if u10.stkLoop == p33 then
                    u10.stkLoop = nil;
                end;
            end,

            FetchStock = function(p35, p36, p37) -- Line: 267, Name: FetchStock
                -- upvalues: ShopValue (ref), ReplicatedStorage (ref), Events (ref), u10 (ref), u7 (ref), u1 (ref), u8 (ref)
                local u38 = p37 or ShopValue.Value;

                if not u38 or ReplicatedStorage.Values.GlobalStocks.Value then
                    return;
                end;

                local SSHPRMTE3 = Events:FindFirstChild("SSHPRMTE3");

                if not SSHPRMTE3 then
                    return;
                end;

                if p35 and u10.stkBusy[u38] then
                    u10.stkRedo = u38;

                    return;
                end;

                u10.stkBusy[u38] = (u10.stkBusy[u38] or 0) + 1;
                local success, result = pcall(SSHPRMTE3.InvokeServer, SSHPRMTE3, u38);
                local v39;

                if u10.stkBusy[u38] > 1 then
                    v39 = u10.stkBusy[u38] - 1 or nil;
                else
                    v39 = nil;
                end;

                u10.stkBusy[u38] = v39;

                if u10.stkRedo == u38 then
                    u10.stkRedo = nil;
                    p35 = true;
                end;

                if not success or type(result) ~= "table" then
                    u10.stkFail[u38] = os.clock();

                    if p35 and (not p36 and ShopValue.Value == u38) then
                        task.delay(1, function() -- Line: 286
                            -- upvalues: u10 (ref), ShopValue (ref), u38 (copy), u7 (ref)
                            if u10.open and ShopValue.Value == u38 then
                                u7.FetchStock(true, true);
                            end;
                        end);
                    end;

                    return;
                end;

                local v40 = u38.Parent and u38.Parent:FindFirstChild("RestockTime");
                local stkC = u10.stkC;
                local v41 = {};
                local os_clock_ret = os.clock();

                if v40 then
                    v40 = v40.Value;
                end;

                v41[1], v41[2], v41[3] = result, os_clock_ret, v40;
                stkC[u38] = v41;

                if p35 and (u10.open and (ShopValue.Value == u38 and not u10.processing)) then
                    u7.RefreshShop();

                    if not (u1.pictureF.Visible or (u10.cMode == "Sell" or not (u10.currentB and u10.currentTab))) then
                        u8.ViewTab(u10.currentB, u10.currentTab);
                    end;

                    if u10.chosen and u10.cMode ~= "Sell" then
                        local v42 = false;

                        for _, child in pairs(u1.purchaseFs:GetChildren()) do
                            if child:IsA("Frame") and child.Visible then
                                v42 = true;
                                break;
                            end;
                        end;

                        if not v42 then
                            u8.ViewItem(u10.chosen[1], u10.chosen[2], u10.chosen[4], u10.chosen[5]);
                        end;
                    end;
                end;
            end,

            StockAge = function(p43) -- Line: 316, Name: StockAge
                -- upvalues: u10 (ref)
                local v44;

                if p43 then
                    v44 = u10.stkC[p43];
                else
                    v44 = p43;
                end;

                if not v44 then
                    return (1 / 0);
                end;

                local v45 = p43.Parent and p43.Parent:FindFirstChild("RestockTime");

                return v45 and (v44[3] and v45.Value > v44[3]) and (1 / 0) or os.clock() - v44[2];
            end,

            Ready = function(p46) -- Line: 324, Name: Ready
                -- upvalues: ReplicatedStorage (ref), Events (ref), u7 (ref), u10 (ref)
                if ReplicatedStorage.Values.GlobalStocks.Value or not Events:FindFirstChild("SSHPRMTE3") then
                    return;
                end;

                local os_clock_ret = os.clock();
                local v47 = 0;

                while os.clock() - os_clock_ret < 1.5 do
                    if u7.StockAge(p46) < 30 then
                        return;
                    end;

                    if not (u10.stkBusy[p46] or (v47 >= 2 or v47 ~= 0 and os.clock() - os_clock_ret < 0.5)) then
                        v47 = v47 + 1;
                        task.spawn(u7.FetchStock, false, false, p46);
                    end;

                    task.wait();
                end;
            end,

            PreFetch = function() -- Line: 337, Name: PreFetch
                -- upvalues: u10 (ref), ReplicatedStorage (ref), Events (ref), HumanoidRootPart (ref), u7 (ref)
                if u10.open or (ReplicatedStorage.Values.GlobalStocks.Value or not Events:FindFirstChild("SSHPRMTE3")) then
                    return;
                end;

                local Map = workspace:FindFirstChild("Map");
                local v48;

                if Map then
                    v48 = Map:FindFirstChild("Shopz");
                else
                    v48 = Map;
                end;

                if not (v48 and (HumanoidRootPart and HumanoidRootPart.Parent)) then
                    return;
                end;

                local os_clock_ret = os.clock();

                for i, v in pairs(u10.stkC) do
                    if os_clock_ret - v[2] > 300 or not i.Parent then
                        u10.stkC[i] = nil;
                    end;
                end;

                for i, v in pairs(u10.stkFail) do
                    if os_clock_ret - v > 3 then
                        u10.stkFail[i] = nil;
                    end;
                end;

                local v49 = Map:GetAttribute("MapName") == "07-EXTENDED" and 18 or 10;
                local v50 = nil;

                for _, child in pairs(v48:GetChildren()) do
                    local MainPart = child:FindFirstChild("MainPart");

                    if MainPart and MainPart:IsA("BasePart") then
                        local Magnitude = (MainPart.Position - HumanoidRootPart.Position).Magnitude;

                        if Magnitude < v49 then
                            v50 = MainPart;
                            v49 = Magnitude;
                        end;
                    end;
                end;

                if not v50 or (u10.stkBusy[v50] or (u10.stkFail[v50] or (os_clock_ret - (u10.stkTry or 0) < 0.5 or u7.StockAge(v50) < 10))) then
                    return;
                end;

                u10.stkTry = os_clock_ret;
                task.spawn(u7.FetchStock, false, false, v50);
            end,

            UpdateProtection = function(p51, p52) -- Line: 368, Name: UpdateProtection
                -- upvalues: u9 (ref), u1 (ref)
                local v53 = "rgb(255,255,255)";

                if tonumber(p52) then
                    v53 = p52 <= 15 and "rgb(255,170,0)" or v53;
                    p52 = u9.convert(p52);
                end;

                local v54 = ("PROTECTION: <b>" .. "<font color=" .. "\"" .. (string.lower(p51) == "cooldown" and "rgb(255,0,0)" or v53) .. "\">") .. p51 .. " (";

                if tonumber(p52) then
                    p52 = u9.convert(p52);
                end;

                u1.protectionF.Time.Text = (v54 .. p52 .. ")") .. "</font></b>";
            end,

            UpdateCash = function() -- Line: 408, Name: UpdateCash
                -- upvalues: u10 (ref), u9 (ref), u3 (ref), ReplicatedStorage (ref), u1 (ref)
                local v55 = u10.currencyType .. u9.addCommas(u3.Cash.Value);

                if ReplicatedStorage.Values.CashPointsReplace.Value then
                    v55 = u9.addCommas(_G.PlayerData.Points);
                    u10.currencyType = "";
                else
                    u10.currencyType = "$";
                end;

                u1.topBarF.Frame.Cash.Text = v55;
            end,

            SlotChange = function(p56) -- Line: 419, Name: SlotChange
                -- upvalues: u1 (ref), u4 (ref), u10 (ref), TweenService (ref), u9 (ref)
                local Slots = u1.topBarF.Frame.SlotFrame.Slots;
                local InventorySlots = u4.InventorySlots;

                if p56 ~= true then
                    if u10.slotTween then
                        u10.slotTween:Cancel();
                        u10.slotTween = nil;
                    end;

                    u10.slotTween = InventorySlots.Value >= InventorySlots.MaxValue and TweenService:Create(Slots, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false), {
                        TextColor3 = Color3.fromRGB(255, 0, 0)
                    }) or TweenService:Create(Slots, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, true), {
                        TextColor3 = Color3.fromRGB(255, 216, 189)
                    });
                    Slots.TextColor3 = Color3.new(1, 1, 1);
                    u10.slotTween:Play();
                end;

                Slots.Text = u9.round(InventorySlots.Value, 1) .. "/" .. InventorySlots.MaxValue;
            end,

            gotToolCheck = function(u57) -- Line: 438, Name: gotToolCheck
                -- upvalues: LocalPlayer (ref), Character (ref)
                local u58 = 0;

                local function check(p59) -- Line: 441
                    -- upvalues: u57 (copy), u58 (ref)
                    for _, child in pairs(p59:GetChildren()) do
                        if (child:IsA("Tool") or child:IsA("Folder")) and child.Name == u57 then
                            u58 = u58 + 1;
                        end;
                    end;
                end;

                check(LocalPlayer.Backpack);
                check(Character);

                return u58;
            end,

            RefreshShop = function() -- Line: 455, Name: RefreshShop
                -- upvalues: ShopValue (ref), u7 (ref), ReplicatedStorage (ref), u6 (ref)
                if ShopValue.Value then
                    u7.UpdateStockTime(ShopValue.Value.Parent);
                end;

                if ShopValue.Value then
                    if ReplicatedStorage.Values.GlobalStocks.Value then
                        for i, v in pairs(u6) do
                            local v60 = ReplicatedStorage.Values.GlobalStocks.CurrentStocks:FindFirstChild(i);

                            if v60 and v60.Value > 0 then
                                v.Visible = true;
                            else
                                v.Visible = false;
                            end;
                        end;

                        return;
                    end;

                    if ShopValue.Value.Parent:FindFirstChild("CurrentStocks") then
                        for i, v in pairs(u6) do
                            local v61 = ShopValue.Value.Parent.CurrentStocks:FindFirstChild(i);

                            if v61 and u7.StockOf(v61) > 0 then
                                v.Visible = true;
                            else
                                v.Visible = false;
                            end;
                        end;
                    end;
                end;
            end,

            Purchase = function(p62, p63) -- Line: 486, Name: Purchase
                -- upvalues: Warn (ref), u10 (ref), SSHPRMTE1 (ref), ShopType (ref), ShopValue (ref), CoreGUI (ref), u1 (ref), u8 (ref), UISounds (ref), u7 (ref), RunService (ref), LocalPlayer (ref), u6 (ref)
                Warn("Try purchase..");

                if u10.processing then
                    return;
                end;

                if not (u10.canBuy or (p62 == "Sell" or p62 == "Unlock")) then
                    return;
                end;

                u10.processing = true;
                Warn("Processing...");
                local v64 = p63 and p62 == "ResupplyAmmo" and "ResupplyAmmo2" or p62;
                local v65 = u10.chosen[2];
                local v66 = u10.chosen[1];
                local v67 = false;
                local v68;

                if u10.upgradeFound then
                    v68 = u10.upgradeFound;

                    if v64 == "Unlock" then
                        v66 = u10.upgradeFound.Name;
                        v65 = u10.upgradeFound.Parent;
                        v67 = true;
                    end;
                else
                    v68 = false;
                end;

                local v69, v70 = SSHPRMTE1:InvokeServer(ShopType.Value, v65.Name, v66, ShopValue.Value, v64, _G.GSettings and _G.GSettings.ShopFromBank == true, CoreGUI.BuyZoneValue.Value, nil, nil);
                Warn("Received..");

                for _, child in pairs(u1.purchaseFs:GetChildren()) do
                    if child:IsA("Frame") then
                        child.Visible = false;
                    end;
                end;

                u8.MessageHandler(v69, v70, 2.5);

                if v69 then
                    UISounds.purchase:Play();
                    local v71 = u10.chosen[1];
                    local v72 = u10.chosen[2];
                    local v73 = u10.chosen[4];
                    local v74 = u10.chosen[5];

                    if not v64 then
                        u7.FetchStock();
                    end;

                    RunService.RenderStepped:Wait();

                    if u10.cMode == "Sell" then
                        u8.ViewTab(u10.lastnonSellTab.Sell[1], u10.lastnonSellTab.Sell[2]);
                    end;

                    if v68 and (v64 ~= "Unlock" and (v64 ~= "Sell" and LocalPlayer.Backpack:FindFirstChild(v68.Name))) then
                        u8.ViewItem(v68.Name, v72, u6[v68.Name], v74);
                    else
                        u8.ViewItem(v71, v72, v73, v74);
                    end;

                    if v67 then
                        u7.Interact_UpgradeF(true);
                    end;

                    task.wait(0.5);
                else
                    UISounds.error:Play();

                    if v70 == "OUT OF STOCK" then
                        local Value = ShopValue.Value;

                        if Value then
                            Value = u10.stkC[Value];
                        end;

                        if Value and (not v68 and type(Value[1][v66]) == "number") then
                            Value[1][v66] = 0;
                            u7.RefreshShop();

                            if u10.chosen then
                                u8.ViewItem(u10.chosen[1], u10.chosen[2], u10.chosen[4], u10.chosen[5]);
                            end;
                        end;

                        task.spawn(u7.FetchStock, true);
                    end;
                end;

                u10.processing = false;
            end
        };
        u8 = {
            MessageHandler = function(p75, p76, p77) -- Line: 587, Name: MessageHandler
                -- upvalues: u10 (ref), u1 (ref)
                local v78 = p76 or "An error occured in your request";
                local math_random_ret = math.random();
                u10.msgCode = math_random_ret;

                if p75 then
                    u1.AnswerMessage.TextColor3 = Color3.new(0, 1, 0);
                else
                    u1.AnswerMessage.TextColor3 = Color3.new(1, 0, 0);
                end;

                if tick() - u10.lastMsgTick < 10 then
                    u10.lastmsg = "";
                end;

                if v78 == u10.lastmsg then
                    u10.msgCount = u10.msgCount + 1;
                    v78 = v78 .. " x" .. u10.msgCount;
                else
                    u10.lastmsg = v78;
                    u10.lastMsgTick = tick();
                    u10.msgCount = 1;
                end;

                u1.AnswerMessage.Text = v78;
                delay(p77 or 2.5, function() -- Line: 617
                    -- upvalues: u10 (ref), math_random_ret (copy), u1 (ref)
                    if u10.msgCode == math_random_ret then
                        u1.AnswerMessage.Text = "";
                        u10.msgCount = 1;
                    end;
                end);
            end,

            Select1 = function(p79) -- Line: 625, Name: Select1
                -- upvalues: u10 (ref)
                if u10.currentBorder1 then
                    u10.currentBorder1.BorderSizePixel = 1;
                end;

                u10.currentBorder1 = p79:FindFirstChild("Frame");

                if u10.currentBorder1 then
                    u10.currentBorder1.BorderSizePixel = 2;
                end;
            end,

            Select2 = function(p80) -- Line: 642, Name: Select2
                -- upvalues: u10 (ref)
                if u10.currentBorder2 then
                    u10.currentBorder2.BackgroundColor3 = Color3.new(0, 0, 0);
                    local ImageLabel = u10.currentBorder2:FindFirstChild("ImageLabel");

                    if ImageLabel then
                        ImageLabel.ImageTransparency = 0.5;
                    end;
                end;

                u10.currentBorder2 = p80;
                p80.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1);
                local ImageLabel = p80:FindFirstChild("ImageLabel");

                if ImageLabel then
                    ImageLabel.ImageTransparency = 0;
                end;
            end,

            Select3 = function(p81) -- Line: 664, Name: Select3
                -- upvalues: u10 (ref)
                if u10.currentBorder3 then
                    u10.currentBorder3.BackgroundTransparency = 0.65;
                    u10.currentBorder3.TextTransparency = 0.5;
                end;

                u10.currentBorder3 = p81;

                if u10.currentBorder3 then
                    u10.currentBorder3.BackgroundTransparency = 0.5;
                    u10.currentBorder3.TextTransparency = 0;
                end;
            end,

            ClearTab = function(p82) -- Line: 679, Name: ClearTab
                for _, child in pairs(p82:GetChildren()) do
                    if child:IsA("Frame") then
                        child:Destroy();
                    end;
                end;
            end,

            ToggleGUI = function(p83) -- Line: 687, Name: ToggleGUI
                -- upvalues: u10 (ref), u1 (ref), SSHPRMTE2 (ref), u7 (ref), u8 (ref), ShopValue (ref), UISounds (ref), Humanoid (ref), GamepadService (ref), u5 (ref), ShopType (ref), ItemStats (ref), ReplicatedStorage (ref)
                u10.open = p83;
                _G.Shop_Active = p83;
                _G.HasSeenStockChangeWarn = true;
                u1.topBarF.Frame.UIListLayout.Padding = UDim.new(0, 20);
                pcall(function() -- Line: 696
                    -- upvalues: u10 (ref)
                    u10.blurTween:Cancel();
                end);
                u1.holderF.Visible = p83;

                if p83 == true then
                    SSHPRMTE2:FireServer("UpdateSlots");
                    u7.RefreshShop();
                    u7.UpdateCash();
                    delay(2, function() -- Line: 706
                        -- upvalues: u1 (ref)
                        u1.holderF.ChangeWarn.CloseButton.Visible = true;
                    end);

                    if u10.chosen then
                        u8.ViewItem(u10.chosen[1], u10.chosen[2], u10.chosen[4], u10.chosen[5]);
                    end;

                    if u7.StockAge(ShopValue.Value) >= 1 then
                        task.spawn(u7.FetchStock, true);
                    end;

                    if u7.NoCounts(ShopValue.Value) then
                        task.spawn(u7.WaitCounts, ShopValue.Value);
                    end;

                    UISounds.open:Play();
                    Humanoid:UnequipTools();

                    if _G.CheckIfMobile and _G.CheckIfMobile() then
                        u1.topBarF.Frame.Cash.TextSize = 15;
                        u1.topBarF.Frame.SlotFrame.Slots.TextSize = 13;
                        u1.purchaseFs.UIScale.Scale = 1.5;
                    else
                        u1.purchaseFs.UIScale.Scale = 1;
                        u1.topBarF.Frame.Cash.TextSize = 25;
                        u1.topBarF.Frame.SlotFrame.Slots.TextSize = 20;
                    end;

                    if _G.InputType == 2 then
                        GamepadService:EnableGamepadCursor(u1.mainF);
                    end;
                else
                    if u5 then
                        u5:Disconnect();
                    end;

                    u5 = nil;
                    u7.Cancel_UpgradeF();
                    UISounds.close:Play();
                    GamepadService:DisableGamepadCursor();
                end;

                local v84;

                if u10.lShopType == ShopType.Value then
                    v84 = false;
                else
                    u10.lShopType = ShopType.Value;
                    v84 = true;
                end;

                if not v84 then
                    if p83 and (u10.cMode == "Sell" and (u10.currentB and u10.currentTab)) then
                        u8.ViewTab(u10.currentB, u10.currentTab);
                    end;

                    return;
                end;

                if ShopType.Value == "LegalStore" then
                    u8.ViewItem("Bayonet", ItemStats.Melees, u1.listF1_C.melees:FindFirstChild("Bayonet"));
                    u8.ViewTab(u1.buttonsF.meleesButton, u1.listF1_C.melees);
                    u1.listF1_C.melees.CanvasPosition = Vector2.new(0, 0);
                    u1.holderF.BackgroundColor3 = Color3.fromRGB(0, 10, 21);
                    u1.topBarF.Title.Text = "ARMORY";
                elseif ShopType.Value == "RebelStore" then
                    u8.ViewItem("Bayonet", ItemStats.Melees, u1.listF1_C.melees:FindFirstChild("Bayonet"));
                    u8.ViewTab(u1.buttonsF.meleesButton, u1.listF1_C.melees);
                    u1.listF1_C.melees.CanvasPosition = Vector2.new(0, 0);
                    u1.holderF.BackgroundColor3 = Color3.fromRGB(21, 0, 0);
                    u1.topBarF.Title.Text = "REBEL";
                else
                    u8.ViewItem("Shiv", ItemStats.Melees, u1.listF1_C.melees:FindFirstChild("Shiv"));
                    u8.ViewTab(u1.buttonsF.meleesButton, u1.listF1_C.melees);
                    u1.listF1_C.melees.CanvasPosition = Vector2.new(0, 0);
                    u1.holderF.BackgroundColor3 = Color3.fromRGB(21, 20, 0);
                    u1.topBarF.Title.Text = "DEALER";
                end;

                if ReplicatedStorage.Values.GlobalStocks.Value and ReplicatedStorage.Values.GlobalStocks.TitleName.Value ~= "" then
                    u1.topBarF.Title.Text = ReplicatedStorage.Values.GlobalStocks.TitleName.Value;

                    if ReplicatedStorage.Values.GlobalStocks.TitleName.HolderColor.Value ~= Color3.new(0, 0, 0) then
                        u1.holderF.BackgroundColor3 = ReplicatedStorage.Values.GlobalStocks.TitleName.HolderColor.Value;
                    end;
                end;

                u8.ViewTab2("Buy");
            end,

            CanCreateF = function(u85) -- Line: 798, Name: CanCreateF
                local u86 = false;
                pcall(function() -- Line: 800
                    -- upvalues: u85 (copy), u86 (ref)
                    if u85 and (u85.Parent and not (u85:WaitForChild("Hidden", 2).Value or u85:FindFirstChild("IsGamepass") and (u85.IsGamepass:FindFirstChild("Hide") and (u85.IsGamepass.Hide.Value and not _G.GamepassCheck(u85.Name))))) then
                        u86 = true;
                    end;
                end);

                return u86;
            end,

            ViewTab2 = function(p87) -- Line: 812, Name: ViewTab2
                -- upvalues: u7 (ref), u1 (ref), u8 (ref), u10 (ref)
                if p87 == "Buy" then
                    u7.Cancel_UpgradeF();
                    u1.listF1.Visible = true;
                    u1.listF2.Visible = false;
                    u1.pictureF.Visible = true;
                    u1.nSellData1.Visible = false;
                    u1.nSellData2.Visible = false;
                    u8.Select3(u1.buyButton);
                elseif p87 == "Sell" then
                    u1.listF1.Visible = false;
                    u1.listF2.CanvasPosition = Vector2.new(0, 0);
                    u1.listF2.Visible = true;
                    u1.pictureF.Visible = true;
                    u8.Select3(u1.sellButton);
                end;

                u10.cMode = p87;
                u8.ViewTab(u10.currentB, u10.currentTab);
            end,

            ViewTab = function(p88, p89) -- Line: 851, Name: ViewTab
                -- upvalues: u1 (ref), u8 (ref), ItemStats (ref), u10 (ref), u7 (ref), Humanoid (ref), LocalPlayer (ref), Warn (ref)
                u1.listF1_C.melees.Visible = false;
                u1.listF1_C.guns.Visible = false;
                u1.listF1_C.throwables.Visible = false;
                u1.listF1_C.armour.Visible = false;
                u1.listF1_C.misc.Visible = false;
                u1.listF2.CanvasPosition = Vector2.new(0, 0);
                u8.ClearTab(u1.listF2);
                local u90 = nil;

                if p89 == u1.listF1_C.melees then
                    u90 = ItemStats.Melees;
                elseif p89 == u1.listF1_C.guns then
                    u90 = ItemStats.Guns;
                elseif p89 == u1.listF1_C.throwables then
                    u90 = ItemStats.Throwables;
                elseif p89 == u1.listF1_C.armour then
                    u90 = ItemStats.Armour;
                elseif p89 == u1.listF1_C.misc then
                    u90 = ItemStats.Misc;
                end;

                for _, child in pairs(p89:GetChildren()) do
                    if child:IsA("Frame") then
                        u8.UpdateFrameF(u90:FindFirstChild(child.Name), child);
                    end;
                end;

                if p89:IsA("ScrollingFrame") then
                    p89.CanvasPosition = Vector2.new(0, 0);
                end;

                u10.lastnonSellTab[u10.cMode] = { p88, p89 };
                u7.RefreshShop();

                if u10.cMode == "Sell" then
                    local u91 = {};
                    Humanoid:UnequipTools();

                    local function zxxz(p92) -- Line: 931
                        -- upvalues: u90 (ref), u91 (copy)
                        if not p92 then
                            return;
                        end;

                        for _, child in pairs(p92:GetChildren()) do
                            if (child:IsA("Folder") or (child:IsA("Model") or child:IsA("Tool"))) and u90:FindFirstChild(child.Name) then
                                table.insert(u91, u90[child.Name]);
                            end;
                        end;
                    end;

                    zxxz(LocalPlayer.Backpack);
                    zxxz(LocalPlayer.Character);

                    for _, v in pairs(u91) do
                        u8.CreateFrameF(v, p89, u10.cMode, u1.listF2);
                    end;

                    table.sort(u91, function(p93, p94) -- Line: 949
                        return (p93.Sellable:FindFirstChild("Price") and p93.Sellable.Price.Value or 0) < (p94.Sellable:FindFirstChild("Price") and p94.Sellable.Price.Value or 0);
                    end);

                    if #u91 > 0 then
                        u1.pictureF.Visible = true;
                        u1.nSellData2.Visible = false;
                        u1.nSellData1.Visible = false;
                        u8.ViewItem(u91[1].Name, u90, u1.listF2:FindFirstChild(u91[1].Name), true);
                    else
                        u1.pictureF.Visible = false;
                        u1.nSellData2.Visible = true;
                        u1.nSellData1.Visible = true;
                    end;
                else
                    u1.pictureF.Visible = true;
                    local v95 = false;

                    for _, child in pairs(p89:GetChildren()) do
                        if child.ClassName == "Frame" and child.Visible then
                            v95 = true;
                            break;
                        end;
                    end;

                    if v95 then
                        u1.nSellData2.Visible = false;
                        u1.nSellData1.Visible = false;
                        u1.pictureF.Visible = true;

                        if u10.lastnonSellItem then
                            local lastnonSellItem = u10.lastnonSellItem;
                            u10.lastnonSellItem = nil;
                            u8.ViewItem(lastnonSellItem[1], lastnonSellItem[2], lastnonSellItem[4], lastnonSellItem[5]);
                        end;
                    else
                        u1.pictureF.Visible = false;
                        u1.nSellData2.Visible = true;
                        u1.nSellData1.Visible = true;
                    end;
                end;

                p89.Visible = true;
                u10.currentTab = p89;
                u10.currentB = p88;
                u8.Select2(p88);
                u7.Cancel_UpgradeF();
                Warn("T", 2);
            end,

            ViewUpgrade = function(u96, p97) -- Line: 1009, Name: ViewUpgrade
                -- upvalues: u1 (ref), u10 (ref), ShopType (ref), u9 (ref), u7 (ref), u4 (ref), LocalPlayer (ref), u3 (ref), Character (ref), GetUnlockPrice (ref), ReplicatedStorage (ref), ViewportModel (ref)
                local function TweakBar(p98, p99) -- Line: 1012
                    local Out = Enum.EasingDirection.Out;
                    local Quint = Enum.EasingStyle.Quint;
                    p98:TweenSize(UDim2.new(p99, 0, 1, 0), Out, Quint, 1, true);
                end;

                u1.upgradeF.UpgradeButtonFrame.TextButton.Visible = false;
                u1.upgradeF.UpgradeButtonFrame.TextLabel.Visible = false;
                u1.upgradeF.UpgradeButtonFrame.Unlock.Visible = false;
                local u100 = p97:FindFirstChild(u96);
                local v101 = u100:FindFirstChild("IsGamepass") and u100.IsGamepass.Value;
                local v102 = u100:FindFirstChild("IsDevProduct") and u100.IsDevProduct.Value;
                local Value = u100.Level.Value;
                local Value2 = u100.Price.Value;
                local SlotUsage = u100:FindFirstChild("SlotUsage");
                local math_max_ret = math.max((SlotUsage and (SlotUsage.Value or 0) or 0) - u10.chosen[2][u10.chosen[1]].SlotUsage.Value, 0);
                local v103;

                if SlotUsage and SlotUsage:FindFirstChild("DisplaySlots") then
                    v103 = "+" .. SlotUsage.DisplaySlots.Value or math_max_ret;
                else
                    v103 = math_max_ret;
                end;

                local v104 = tostring(v103);
                _G.GamepassCheck("Weaponry");
                local v105 = u100:FindFirstChild("CanLevelUnlock") and u100.CanLevelUnlock.Value;
                local v106 = u100.SellStations:FindFirstChild(ShopType.Value);
                local v107 = u100:FindFirstChild("UpgradeStations") and u100.UpgradeStations:FindFirstChild(ShopType.Value);

                if u100:FindFirstChild("RefillStations") then
                    u100.RefillStations:FindFirstChild(ShopType.Value);
                end;

                local CanUpgrade = u100:FindFirstChild("CanUpgrade");

                if CanUpgrade then
                    local _ = CanUpgrade.Value;
                end;

                if v106 and v106:FindFirstChild("OverrideLevel") then
                    Value = v106.OverrideLevel.Value or Value;
                end;

                if v106 and v106:FindFirstChild("PriceMulti") then
                    Value2 = math.floor(Value2 * v106.PriceMulti.Value) or Value2;
                end;

                if u100:FindFirstChild("APassOnly") then
                    local _ = u100.APassOnly.Value;
                end;

                local v108 = Value2 <= 0 and "FREE" or u10.currencyType .. u9.addCommas(Value2);

                if u100.Price:FindFirstChild("ExtraPrice") then
                    v108 = v108 .. ` <font color="rgb(255,255,255)">[+{u10.currencyType}{u9.addCommas(u100.Price.ExtraPrice.Value)}]</font>`;
                end;

                u1.upgradeF.Level.Text = (v101 or (Value <= 1 or not v105)) and "1" or Value;
                u1.upgradeF.Slots.Text = v104;
                u1.upgradeF.SlotsTitle.Text = "SLOTS";
                u1.upgradeF.Price.Text = v102 and "N/A" or v108;
                u1.upgradeF.Price:SetAttribute("Price", Value2);

                if u7.GetChosenCurrency() < Value2 then
                    u1.upgradeF.Price.TextColor3 = u10.colors.red;
                else
                    u1.upgradeF.Price.TextColor3 = u10.colors.green;
                end;

                if _G.PlayerData.Level < Value and v105 then
                    u1.upgradeF.Level.TextColor3 = u10.colors.red;
                else
                    u1.upgradeF.Level.TextColor3 = u10.colors.green;
                end;

                if u4 and u4.InventorySlots.Value + tonumber(math_max_ret) > u4.InventorySlots.MaxValue then
                    u1.upgradeF.Slots.TextColor3 = u10.colors.red;
                    u1.upgradeF.UpgradeButtonFrame.TextLabel.Text = "NOT ENOUGH INVENTORY SLOTS";
                else
                    u1.upgradeF.Slots.TextColor3 = u10.colors.green;
                    u1.upgradeF.UpgradeButtonFrame.TextLabel.Text = "UPGRADE UNAVAILABLE";
                end;

                u1.upgradeF.Title.Text = u100.FullName.Value;
                u1.upgradeF.Desc.Text = u100:FindFirstChild("UpgradeDesc") and u100.UpgradeDesc.Value or u100.Desc.Value;

                if _G.CheckIfMobile and _G.CheckIfMobile() then
                    u1.upgradeF.Desc.TextSize = 6;
                    u1.upgradeF.Title.TextSize = 10;
                else
                    u1.upgradeF.Desc.TextSize = 13;
                    u1.upgradeF.Title.TextSize = 21;
                end;

                local v109 = true;
                local v110 = u7.gotToolCheck(u100.Name);
                local v111 = not u100:FindFirstChild("BuyCheck") and true or require(u100.BuyCheck)(LocalPlayer);

                if v110 < u100.MaxBuy.Value then
                    if v111 then
                        if u4.InventorySlots.Value + tonumber(math_max_ret) > u4.InventorySlots.MaxValue then
                            v107 = false;
                        end;
                    else
                        v107 = v111;
                    end;
                else
                    v107 = false;
                end;

                local v112;

                if u100:FindFirstChild("CanLevelUnlock") and u100.CanLevelUnlock.Value then
                    v112 = Value <= _G.PlayerData.Level and true or u3.Unlocked:FindFirstChild(u100.Name);
                else
                    v112 = u100.CanUnlock.Value and u3.Unlocked:FindFirstChild(u100.Name) or Value <= 1;
                end;

                if not (v107 and v112) then
                    v109 = false;
                end;

                local _ = LocalPlayer.Backpack:FindFirstChild(u100.Name) or Character:FindFirstChild(u100.Name);
                local _ = v110 >= 1;
                u1.upgradeF.Desc.Visible = true;

                if v109 then
                    u1.upgradeF.UpgradeButtonFrame.TextButton.Visible = true;
                else
                    u1.upgradeF.UpgradeButtonFrame.TextButton.Visible = false;

                    if v101 or not (u100.CanUnlock.Value and (not v112 and u100.ForSale.Value)) then
                        u1.upgradeF.UpgradeButtonFrame.TextLabel.Visible = true;
                    else
                        local Value3 = u1.upgradeF.UpgradeButtonFrame.Unlock.TextButton.Value;
                        Value3.Value = u10.currencyType .. u9.addCommas(GetUnlockPrice(LocalPlayer, _G.PlayerData.Level, Value, u100.CanUnlock));
                        u1.upgradeF.UpgradeButtonFrame.Unlock.TextButton.Title.Text = "UNLOCK EARLY FOR: <b><font color=" .. "\"rgb(255,165,0)\">" .. Value3.Value .. "</font></b>";
                        u1.upgradeF.UpgradeButtonFrame.Unlock.Visible = true;
                    end;

                    u10.canBuy = v112;
                end;

                local function DoViewportFrame() -- Line: 1268
                    -- upvalues: u1 (ref), ReplicatedStorage (ref), u96 (copy), ViewportModel (ref)
                    local ViewportFrame = u1.upgradeF.ViewportFrame;

                    for _, child in pairs(ViewportFrame:GetChildren()) do
                        if child:IsA("Model") or (child:IsA("Folder") or child:IsA("Camera")) then
                            child:Destroy();
                        end;
                    end;

                    local v113 = ReplicatedStorage.Storage.DisplayWepModels:FindFirstChild(u96);

                    if v113 then
                        local v114 = v113:Clone();
                        v114.Parent = ViewportFrame;
                        local Camera = Instance.new("Camera");
                        Camera.Parent = ViewportFrame;

                        if v114:FindFirstChild("Attachments") and v114.Attachments:FindFirstChild("GLaser") then
                            v114.Attachments.GLaser.To.Position = Vector3.new(v114.Attachments.GLaser.To.Position.X, v114.Attachments.GLaser.To.Position.Y, v114.Attachments.GLaser.To.Position.Z * 100);
                            v114.Attachments.GLaser.Beam.Enabled = true;
                        end;

                        v114.Parent = ViewportFrame;
                        ViewportFrame.CurrentCamera = Camera;
                        local v115 = ViewportModel.new(ViewportFrame, Camera);
                        local BoundingBox, _ = v114:GetBoundingBox();
                        v115:SetModel(v114);
                        local v116 = 30;
                        local Attribute = v114:GetAttribute("FOVOffset");

                        if Attribute then
                            v116 = v116 + Attribute;
                        end;

                        Camera.FieldOfView = v116;
                        local FitDistance = v115:GetFitDistance(BoundingBox.Position);
                        local CFrame_Angles_ret = CFrame.Angles(0, -1.5707963267948966, 0);
                        Camera.CFrame = CFrame.new(BoundingBox.Position) * CFrame_Angles_ret * CFrame.new(0, 0, FitDistance);
                    end;
                end;

                (function() -- Line: 1312, Name: DoStatsFrame
                    -- upvalues: u1 (ref), u10 (ref), u100 (copy)
                    u1.statsF.Unavailable2.Visible = false;

                    for _, child in pairs(u1.StatsL:GetChildren()) do
                        if child:IsA("Frame") then
                            child.Visible = false;
                        end;
                    end;

                    u1.StatsL.Visible = true;

                    for _, child in pairs(u10.chosen[2][u10.chosen[1]].Bars:GetChildren()) do
                        local v117 = u1.StatsL:FindFirstChild(child.Name);

                        if v117 then
                            v117.Visible = true;
                            v117.Stat.Text = child.Value;
                            local _ = v117.TypeValue.Value;

                            if v117:FindFirstChild("Bar") then
                                if child:FindFirstChild("Bar") then
                                    v117.Bar.Visible = true;
                                    local Bar3 = v117.Bar:FindFirstChild("Bar3");

                                    if not Bar3 then
                                        Bar3 = v117.Bar.Bar2:Clone();
                                        Bar3.Name = "Bar3";
                                        Bar3.Parent = v117.Bar;
                                    end;

                                    local v118 = u100.Bars:FindFirstChild(child.Name);

                                    if v118 and (v118.Value ~= child.Value and tonumber(v118.Value) ~= nil) then
                                        Bar3.Visible = true;
                                        Bar3.Size = UDim2.new(0, 0, 1, 0);
                                        Bar3.Position = UDim2.new(child.Bar.Value, 0, 0, 0);
                                        Bar3.BackgroundTransparency = 0;
                                        local v119;

                                        if v118.Bar.Value > child.Bar.Value then
                                            Bar3.BackgroundColor3 = Color3.fromRGB(55, 111, 64);
                                            Bar3.AnchorPoint = Vector2.new(0, 0);
                                            v119 = v118.Bar.Value - child.Bar.Value;
                                            v117.Stat.TextColor3 = Color3.fromRGB(126, 255, 145);
                                        else
                                            Bar3.BackgroundColor3 = Color3.fromRGB(111, 61, 61);
                                            Bar3.AnchorPoint = Vector2.new(1, 0);
                                            v119 = child.Bar.Value - v118.Bar.Value;
                                            v117.Stat.TextColor3 = Color3.fromRGB(255, 114, 116);
                                        end;

                                        local v120;

                                        if tonumber(v118.Value) > 1 then
                                            local v121 = tonumber(v118.Value) * 10;
                                            v120 = math.round(v121) / 10;
                                        else
                                            local v122 = tonumber(v118.Value) * 100;
                                            v120 = math.round(v122) / 100;
                                        end;

                                        v117.Stat.Text = child.Value .. " -> " .. v120;
                                        local Out = Enum.EasingDirection.Out;
                                        local Quint = Enum.EasingStyle.Quint;
                                        Bar3:TweenSize(UDim2.new(v119, 0, 1, 0), Out, Quint, 1, true);
                                    else
                                        Bar3.Visible = false;
                                    end;

                                    local Out = Enum.EasingDirection.Out;
                                    local Quint = Enum.EasingStyle.Quint;
                                    v117.Bar.Bar2:TweenSize(UDim2.new(child.Bar.Value, 0, 1, 0), Out, Quint, 1, true);
                                else
                                    v117.Bar.Visible = false;
                                end;
                            end;

                            v117.Title.Text = string.upper(v117.Title.Text);
                        end;
                    end;
                end)();
                DoViewportFrame();
                u10.canBuy = true;
            end,

            ViewItem = function(p123, p124, p125, p126) -- Line: 1453, Name: ViewItem
                -- upvalues: u1 (ref), u10 (ref), ShopType (ref), u9 (ref), u7 (ref), u4 (ref), ShopValue (ref), ReplicatedStorage (ref), GetSellPrice (ref), LocalPlayer (ref), u8 (ref), Humanoid (ref), u3 (ref), ItemStats (ref), Character (ref), GetConfig (ref), TweenService (ref), GetRefillPrice (ref), GetUnlockPrice (ref)
                local function _(p127, p128) -- Line: 1456
                    local Out = Enum.EasingDirection.Out;
                    local Quint = Enum.EasingStyle.Quint;
                    p127:TweenSize(UDim2.new(p128, 0, 1, 0), Out, Quint, 1, true);
                end;

                u1.nSellData1.Visible = true;

                if not (p124 and p124.Parent) then
                    return;
                end;

                for _, child in pairs(u1.purchaseFs:GetChildren()) do
                    if child:IsA("Frame") then
                        child.Visible = false;
                    end;
                end;

                u1.nSellData1.Visible = false;
                local u129 = p124:FindFirstChild(p123);
                u10.chosen = {
                    p123,
                    p124,
                    u129,
                    p125,
                    p126
                };

                if not p126 then
                    u10.lastnonSellItem = u10.chosen;
                end;

                local v130 = u129:FindFirstChild("IsGamepass") and u129.IsGamepass.Value;
                local v131 = u129:FindFirstChild("IsDevProduct") and u129.IsDevProduct.Value;
                local Value = u129.Level.Value;
                local Value2 = u129.Price.Value;
                local SlotUsage = u129:FindFirstChild("SlotUsage");
                local v132 = SlotUsage and (SlotUsage.Value or 0) or 0;
                local v133;

                if SlotUsage and SlotUsage:FindFirstChild("DisplaySlots") then
                    v133 = "+" .. SlotUsage.DisplaySlots.Value or v132;
                else
                    v133 = v132;
                end;

                local v134 = tostring(v133);
                local _G_GamepassCheck_ret = _G.GamepassCheck("Weaponry");
                local v135 = u129:FindFirstChild("CanLevelUnlock") and u129.CanLevelUnlock.Value;
                local v136 = u129.SellStations:FindFirstChild(ShopType.Value);
                local v137 = u129:FindFirstChild("RefillStations") and u129.RefillStations:FindFirstChild(ShopType.Value);
                local v138 = u129:FindFirstChild("IsUpgrade") and u129.IsUpgrade.Value;
                local CanUpgrade = u129:FindFirstChild("CanUpgrade");
                local v139;

                if CanUpgrade then
                    v139 = CanUpgrade.Value;
                else
                    v139 = CanUpgrade;
                end;

                if u10.cMode == "Buy" or not (v139 and u129.Parent:FindFirstChild(CanUpgrade.UpgradedName.Value)) then
                    u10.upgradeFound = nil;
                    v139 = false;
                else
                    u10.upgradeFound = u129.Parent[CanUpgrade.UpgradedName.Value];
                end;

                if v136 and v136:FindFirstChild("OverrideLevel") then
                    Value = v136.OverrideLevel.Value or Value;
                end;

                if v136 and v136:FindFirstChild("PriceMulti") then
                    Value2 = math.floor(Value2 * v136.PriceMulti.Value) or Value2;
                end;

                local v140 = u129:FindFirstChild("APassOnly") and u129.APassOnly.Value;
                u1.pictureF.Top.ItemImage.Image = "http://www.roblox.com/asset/?id=" .. u129.Image.Value;
                local v141 = Value2 <= 0 and "FREE" or u10.currencyType .. u9.addCommas(Value2);

                if u129.Price:FindFirstChild("ExtraPrice") then
                    v141 = v141 .. ` <font color="rgb(255,255,255)">[+{u10.currencyType}{u9.addCommas(u129.Price.ExtraPrice.Value)}]</font>`;
                elseif v138 and (u129.IsUpgrade:FindFirstChild("OriginName") and u129.Parent:FindFirstChild(u129.IsUpgrade.OriginName.Value)) then
                    v141 = (u10.currencyType .. u9.addCommas(Value2 + u129.Parent[u129.IsUpgrade.OriginName.Value].Price.Value)) .. ` <font color="rgb(255,255,255)">[+{u10.currencyType}{u9.addCommas(Value2)}]</font>`;
                end;

                u1.statsF.Level.Text = (Value <= 1 or not v135) and "1" or Value;
                u1.statsF.Slots.Text = v134;
                u1.statsF.SlotsTitle.Text = "SLOTS";
                u1.statsF.Price.Text = v131 and "N/A" or v141;
                u1.statsF.Price:SetAttribute("Price", Value2);
                local v142 = v140 and _G_GamepassCheck_ret and 0 or Value;

                if p126 then
                    u1.statsF.Slots.TextColor3 = u10.colors.white;

                    if u129.ForSale.Value then
                        u1.statsF.Price.TextColor3 = u10.colors.white;
                        u1.statsF.Level.TextColor3 = u10.colors.white;
                    else
                        u1.statsF.Price.TextColor3 = u10.colors.white;
                        u1.statsF.Level.TextColor3 = u10.colors.white;
                        u1.statsF.Price.Text = "N/A";
                        u1.statsF.Level.Text = "N/A";
                    end;

                    u1.statsF.StockTitle.Text = "SELL PRICE";
                    local v143 = GetSellPrice(LocalPlayer, LocalPlayer.Backpack:FindFirstChild(u129.Name) or LocalPlayer.Character:FindFirstChild(u129.Name), u129);
                    u10.lastSellPrice = v143;
                    u1.statsF.Stock.Text = u10.currencyType .. u9.addCommas(v143);
                else
                    if u7.GetChosenCurrency() < Value2 then
                        u1.statsF.Price.TextColor3 = u10.colors.red;
                    else
                        u1.statsF.Price.TextColor3 = u10.colors.green;
                    end;

                    if _G.PlayerData.Level < v142 and (v135 and not (v140 and _G_GamepassCheck_ret)) then
                        u1.statsF.Level.TextColor3 = u10.colors.red;
                    else
                        u1.statsF.Level.TextColor3 = u10.colors.green;
                    end;

                    if u4 and u4.InventorySlots.Value + tonumber(v132) > u4.InventorySlots.MaxValue then
                        u1.statsF.Slots.TextColor3 = u10.colors.red;
                    else
                        u1.statsF.Slots.TextColor3 = u10.colors.green;
                    end;

                    if ShopValue.Value then
                        local v144 = nil;

                        if ReplicatedStorage.Values.GlobalStocks.Value then
                            v144 = ReplicatedStorage.Values.GlobalStocks.CurrentStocks:FindFirstChild(u129.Name);
                        elseif ShopValue.Value.Parent:FindFirstChild("CurrentStocks") and ShopValue.Value.Parent.CurrentStocks:FindFirstChild(u129.Name) then
                            v144 = ShopValue.Value.Parent.CurrentStocks:FindFirstChild(u129.Name);
                        end;

                        if v144 then
                            local MaxValue = v144.MaxValue;
                            local v145 = u7.NoCounts(ShopValue.Value);
                            local v146 = v145 and "..." or tostring(u7.StockOf(v144)) .. "/" .. tostring(MaxValue);
                            u1.statsF.Stock.Text = MaxValue >= 10000 and not v145 and "∞" or v146;

                            if u7.StockOf(v144) <= 0 and not v145 then
                                u1.statsF.Stock.TextColor3 = u10.colors.red;
                            end;
                        end;
                    else
                        u1.statsF.Stock.Text = "N/A";
                    end;

                    u1.statsF.StockTitle.Text = "IN STOCK";
                end;

                u1.statsF.Stock.TextColor3 = u10.colors.green;

                if p125 then
                    u8.Select1(p125);
                end;

                u1.pictureF.Top.Title.Text = u129.DisplayName.Value;
                u1.pictureF.Top.Desc.Text = u129.Desc.Value;

                if _G.CheckIfMobile and _G.CheckIfMobile() then
                    u1.pictureF.Top.Desc.TextSize = 8;
                    u1.pictureF.Top.Title.TextSize = 8;
                else
                    u1.pictureF.Top.Desc.TextSize = 15;
                    u1.pictureF.Top.Title.TextSize = 16;
                end;

                for _, child in pairs(u1.StatsL:GetChildren()) do
                    if child:IsA("Frame") then
                        child.Visible = false;
                    end;
                end;

                u1.StatsL.Visible = true;

                for _, child in pairs(u129.Bars:GetChildren()) do
                    local v147 = u1.StatsL:FindFirstChild(child.Name);

                    if v147 then
                        v147.Visible = true;
                        local _ = v147.TypeValue.Value;

                        if v147:FindFirstChild("Bar") then
                            if child:FindFirstChild("Bar") then
                                v147.Bar.Visible = true;
                                local Bar3 = v147.Bar:FindFirstChild("Bar3");

                                if Bar3 then
                                    Bar3.Visible = false;
                                end;

                                v147.Bar.Bar2.BackgroundTransparency = 0;
                                v147.Bar.Bar2.BackgroundColor3 = Color3.fromRGB(111, 111, 111);
                                local Out = Enum.EasingDirection.Out;
                                local Quint = Enum.EasingStyle.Quint;
                                v147.Bar.Bar2:TweenSize(UDim2.new(child.Bar.Value, 0, 1, 0), Out, Quint, 1, true);
                            else
                                v147.Bar.Visible = false;
                            end;
                        end;

                        v147.Title.Text = string.upper(v147.Title.Text);
                        v147.Stat.Text = child.Value;
                        v147.Stat.TextColor3 = Color3.new(1, 1, 1);
                    end;
                end;

                local u148 = true;
                local v149 = true;
                Humanoid:UnequipTools();
                local v150 = u7.gotToolCheck(u129.Name);
                local u151 = not u129:FindFirstChild("BuyCheck") and true or require(u129.BuyCheck)(LocalPlayer);

                if v150 < u129.MaxBuy.Value then
                    if u151 then
                        u151 = u4.InventorySlots.Value + tonumber(v132) <= u4.InventorySlots.MaxValue;
                    end;
                else
                    u151 = false;
                end;

                local v152;

                if u129:FindFirstChild("CanLevelUnlock") and u129.CanLevelUnlock.Value then
                    v152 = v142 <= _G.PlayerData.Level and true or u3.Unlocked:FindFirstChild(u129.Name);
                else
                    v152 = u129.CanUnlock.Value and u3.Unlocked:FindFirstChild(u129.Name) or v142 <= 1;
                end;

                if ReplicatedStorage.Values.Shop_OneGunOnly.Value and ItemStats.Guns:FindFirstChild(u129.Name) then
                    for _, child in pairs(LocalPlayer.Backpack:GetChildren()) do
                        if child:IsA("Tool") and ItemStats.Guns:FindFirstChild(child.Name) then
                            v149 = false;
                            break;
                        end;
                    end;

                    if v149 then
                        v149 = not Character:GetAttribute("Shop_OneGunOnly");
                    end;
                end;

                if ReplicatedStorage.Values.Shop_OneMeleeOnly.Value and ItemStats.Melees:FindFirstChild(u129.Name) then
                    for _, child in pairs(LocalPlayer.Backpack:GetChildren()) do
                        if child:IsA("Tool") and ItemStats.Melees:FindFirstChild(child.Name) then
                            v149 = false;
                            break;
                        end;
                    end;
                end;

                if not (u151 and (v152 and v149)) then
                    u148 = false;
                end;

                local u153 = LocalPlayer.Backpack:FindFirstChild(u129.Name) or Character:FindFirstChild(u129.Name);
                local v154 = v150 >= 1 and true or false;
                pcall(function() -- Line: 1781
                    -- upvalues: ReplicatedStorage (ref), u129 (copy), u7 (ref), ShopValue (ref), u151 (ref), u148 (ref)
                    local v155;

                    if ReplicatedStorage.Values.GlobalStocks.Value then
                        v155 = ReplicatedStorage.Values.GlobalStocks.CurrentStocks:FindFirstChild(u129.Name).Value <= 0;
                    else
                        v155 = u7.StockOf(ShopValue.Value.Parent.CurrentStocks:FindFirstChild(u129.Name)) <= 0;
                    end;

                    if v155 then
                        u151 = false;
                        u148 = false;
                    end;
                end);
                local v156 = false;
                local FullFrame = u1.statsF.Unavailable2.FullFrame;
                local FullFrame2 = u1.statsF.Unavailable2.FullFrame2;
                local UpgradeFrame = u1.statsF.Unavailable2.UpgradeFrame;
                u1.pF_bF.Unavailable.Visible = false;
                u1.statsF.Unavailable2.Visible = false;
                u1.StatsL.Visible = true;
                u1.pF_bF.Available.Visible = false;
                u1.pF_bF.Available2.Visible = false;
                u1.pF_bF.Available3.Visible = false;
                u1.pF_bF.Unlock.Visible = false;
                u1.pF_bF.Unlock2.Visible = false;
                u1.pF_bF.Gamepass.Visible = false;
                u1.pF_bF.Product.Visible = false;
                u1.pF_bF.ClaimProduct.Visible = false;
                FullFrame.Visible = false;
                FullFrame2.Visible = false;
                u1.statsF.Unavailable2.Frame.Visible = false;
                u1.statsF.Unavailable2.UpgradeFrame.Visible = false;

                local function IsResupplyAble(p157) -- Line: 1826
                    -- upvalues: GetConfig (ref), u153 (ref), u4 (ref)
                    if p157:FindFirstChild("ResupplyGun") and (p157.ResupplyGun.Value and (GetConfig(u153) and (u153:FindFirstChild("Values") and u153.Values:FindFirstChild("StoredAmmo")))) then
                        return "g";
                    end;

                    if p157:FindFirstChild("ResupplyArmor") and (p157.ResupplyArmor.Value and u4) then
                        return "a";
                    end;
                end;

                if u148 and u10.cMode == "Buy" then
                    u1.pictureF.Top.Desc.Visible = true;

                    if v130 then
                        local v158 = u129.IsGamepass:FindFirstChild("ForSale") and u129.IsGamepass:FindFirstChild("ForSale").Value;
                        local v159 = (v158 or _G.GamepassCheck(u129.IsGamepass.ID.Value)) and true or false;
                        u1.pF_bF.Gamepass.Visible = v159;
                        u1.pF_bF.Unavailable.Visible = not v159;
                    elseif v131 then
                        local v160 = u129.IsDevProduct:FindFirstChild("ForSale") and u129.IsDevProduct:FindFirstChild("ForSale").Value;
                        local Value3 = u129.ForSale.Value;

                        if not v160 then
                            Value3 = false;
                        end;

                        if Value3 then
                            local v161 = u129.IsDevProduct:FindFirstChild("CustomAttributeName") and u129.IsDevProduct.CustomAttributeName.Value;

                            if LocalPlayer:GetAttribute("ShopProductClaim_" .. (v161 or u129.Name)) then
                                u1.pF_bF.ClaimProduct.Visible = true;
                                u1.pF_bF.Product.Visible = false;
                            else
                                u1.pF_bF.ClaimProduct.Visible = false;
                                u1.pF_bF.Product.TextButton.Frame.PriceText.Text = tostring(u129.Price.Value);
                                u1.pF_bF.Product.Visible = true;
                            end;
                        else
                            u1.pF_bF.ClaimProduct.Visible = false;
                            u1.pF_bF.Product.Visible = false;
                        end;

                        u1.pF_bF.Unavailable.Visible = not Value3;
                    else
                        u1.pF_bF.Available.Visible = true;
                    end;

                    u10.canBuy = true;
                elseif u148 == false and (u10.cMode == "Sell" and (u153 and IsResupplyAble(u129))) then
                    local v162 = IsResupplyAble(u129);

                    if v139 then
                        FullFrame = u1.statsF.Unavailable2.Frame;
                        UpgradeFrame.Visible = true;
                    end;

                    FullFrame.Visible = true;
                    FullFrame.TextButton.Visible = true;
                    u1.StatsL.Visible = false;

                    local function v168(p163, p164, p165) -- Line: 1910
                        -- upvalues: u10 (ref), TweenService (ref)
                        local Out = Enum.EasingDirection.Out;
                        local Quint = Enum.EasingStyle.Quint;

                        if p165 then
                            if u10.av2BT_2 then
                                u10.av2BT_2:Cancel();
                            end;
                        elseif u10.av2BT then
                            u10.av2BT:Cancel();
                        end;

                        local v166 = u10.colors.green:Lerp(u10.colors.red, 1 - p164 / 1);
                        local v167 = TweenService:Create(p163, TweenInfo.new(1, Quint, Out), {
                            Size = UDim2.new(p164, 0, 1, 0),
                            BackgroundColor3 = v166
                        });

                        if p165 then
                            u10.av2BT_2 = v167;
                            u10.av2BT_2:Play();

                            return;
                        end;

                        u10.av2BT = v167;
                        u10.av2BT:Play();
                    end;

                    local v169 = u129.SellStations:FindFirstChild(ShopType.Value) or u129:FindFirstChild("RefillStations") and u129.RefillStations:FindFirstChild(ShopType.Value);

                    if v162 == "g" then
                        local v170 = GetConfig(u153);
                        local ResupplyGun2 = u129:FindFirstChild("ResupplyGun2");

                        if ResupplyGun2 then
                            FullFrame.Visible = false;
                            FullFrame2.Visible = true;
                            local UnderbarrelLauncher = v170.Customs.UnderbarrelLauncher;
                            local v171 = (u153.Values.SERVER_Ammo2.Value + u153.Values.SERVER_StoredAmmo2.Value) / (UnderbarrelLauncher.MagSize + UnderbarrelLauncher.StoredAmmo);
                            local v172, v173 = GetRefillPrice(LocalPlayer, ResupplyGun2.Price.Value, v171, v137);
                            v168(FullFrame2.Bar2.Bar, v171, true);

                            if v171 < 1 then
                                FullFrame2.Price2.TextColor3 = u7.GetChosenCurrency() < v172 and u10.colors.red or (v173 and u10.colors.orange or u10.colors.green);
                                FullFrame2.Price2.Text = u10.currencyType .. u9.addCommas(v172);
                            else
                                FullFrame2.Price2.Text = "N/A";
                                FullFrame2.Price2.TextColor3 = u10.colors.grey;
                            end;

                            u10.interact_Unavailable2_Price2 = v172;
                            FullFrame2.TextButton.Text = "PURCHASE " .. (UnderbarrelLauncher.DisplayTypes[1] or "");
                            FullFrame2.TextButton2.Text = "PURCHASE " .. (UnderbarrelLauncher.DisplayTypes[2] or "");
                            u10.invSecondRefilLDisplayTypes = UnderbarrelLauncher.DisplayTypes;
                            FullFrame2.Unavailable.Text = FullFrame2.TextButton.Text;
                            FullFrame2.Unavailable2.Text = FullFrame2.TextButton2.Text;
                            FullFrame2.Unavailable2.TextSize = FullFrame2.TextButton2.TextSize;
                            FullFrame2.TextButton2.Visible = v171 < 1;
                            FullFrame2.Unavailable2.Visible = not FullFrame2.TextButton2.Visible;
                        else
                            FullFrame.TextButton.Text = "PURCHASE AMMO";
                            FullFrame2 = FullFrame;
                        end;

                        FullFrame2.Title.Text = "AMMO RESUPPLY";
                        local v174 = (u153.Values.SERVER_Ammo.Value + u153.Values.SERVER_StoredAmmo.Value) / (v170.MagSize + v170.StoredAmmo);
                        local v175, v176 = GetRefillPrice(LocalPlayer, u129.ResupplyGun.Price.Value, v174, v137);
                        v168(FullFrame2.Bar.Bar, v174);

                        if v174 < 1 then
                            FullFrame2.Price.TextColor3 = u7.GetChosenCurrency() < v175 and u10.colors.red or (v176 and u10.colors.orange or u10.colors.green);
                            FullFrame2.Price.Text = u10.currencyType .. u9.addCommas(v175);
                        else
                            FullFrame2.Price.Text = "N/A";
                            FullFrame2.Price.TextColor3 = u10.colors.grey;
                        end;

                        FullFrame2.TextButton.Visible = v174 < 1;
                        FullFrame2.Unavailable.Visible = not FullFrame2.TextButton.Visible;
                        u10.interact_Unavailable2_Price = v175;
                    else
                        local v177 = u4.ArmorHP[u129.ResupplyArmor.Type.Value];
                        local v178 = v177.Value / v177.MaxValue;
                        local HeadToo = u129.ResupplyArmor:FindFirstChild("HeadToo");

                        if HeadToo and HeadToo.Value then
                            local Head = u4.ArmorHP.Head;
                            v178 = (v178 + Head.Value / Head.MaxValue) / 2;
                        end;

                        v168(FullFrame.Bar.Bar, v178);
                        FullFrame.Title.Text = "ARMOR REPAIR";
                        FullFrame.TextButton.Text = "PURCHASE REPAIR";
                        local v179 = GetRefillPrice(LocalPlayer, u129.ResupplyArmor.Price.Value, v178, v137);

                        if v178 < 1 then
                            FullFrame.Price.TextColor3 = u7.GetChosenCurrency() < v179 and u10.colors.red or u10.colors.green;
                            FullFrame.Price.Text = u10.currencyType .. u9.addCommas(v179);
                        else
                            FullFrame.Price.Text = "N/A";
                            FullFrame.Price.TextColor3 = u10.colors.grey;
                        end;

                        FullFrame.TextButton.Visible = v178 < 1;
                        u10.interact_Unavailable2_Price = v179;
                    end;

                    FullFrame.Unavailable.Text = FullFrame.TextButton.Text;
                    FullFrame.Unavailable.TextSize = FullFrame.TextButton.TextSize;
                    FullFrame.Unavailable.Visible = not FullFrame.TextButton.Visible;
                    local v180 = not (u129.Sellable.Value and u129:FindFirstChild("SellCheck")) and true or require(u129.SellCheck)(LocalPlayer, u129.Name);

                    if v154 and (u129:FindFirstChild("Sellable") and (u129.Sellable.Value and v180)) then
                        u1.pF_bF.Unavailable.Visible = false;
                        u1.pF_bF.Available2.Visible = true;
                        local v181 = GetSellPrice(LocalPlayer, u153, u129);
                        u10.lastSellPrice = v181;
                        u1.pF_bF.Available2.TextButton.PriceLabel.Text = u10.currencyType .. u9.addCommas(v181);
                        u1.pF_bF.Available2.TextButton.PriceLabel:SetAttribute("Price", v181);
                    else
                        u1.pF_bF.Unavailable.Visible = true;
                        u1.pF_bF.Available2.Visible = false;
                    end;

                    if not v169 then
                        FullFrame.TextButton.Visible = false;
                    end;

                    FullFrame.CantPurchase.Visible = not v169;
                    FullFrame.Parent.Visible = true;
                    u10.canBuy = true;
                else
                    local v182 = u129.CanRent.Value and (u151 and not p126);

                    if v140 and not (_G_GamepassCheck_ret or p126) then
                        u1.pF_bF.Unlock2.Visible = true;
                    elseif v130 or (v152 or p126) then
                        if p126 and (v154 and (u129:FindFirstChild("Sellable") and u129.Sellable.Value)) then
                            local v183 = GetSellPrice(LocalPlayer, u153, u129);
                            u10.lastSellPrice = v183;
                            u1.pF_bF.Available2.TextButton.PriceLabel.Text = u10.currencyType .. u9.addCommas(v183);
                            u1.pF_bF.Available2.TextButton.PriceLabel:SetAttribute("Price", v183);
                            u1.pF_bF.Available2.Visible = true;
                        else
                            u1.pF_bF.Unavailable.Visible = true;
                        end;
                    else
                        local Value3 = u1.pF_bF.Unlock.TextButton.Value;
                        Value3.Value = u10.currencyType .. u9.addCommas(GetUnlockPrice(LocalPlayer, _G.PlayerData.Level, v142, u129.CanUnlock));
                        u1.pF_bF.Unlock.TextButton.Title.Text = "UNLOCK EARLY FOR: <b><font color=" .. "\"rgb(255,165,0)\">" .. Value3.Value .. "</font></b>";

                        if u129.CanUnlock.Value then
                            u1.pF_bF.Unlock.Visible = true;
                        end;

                        if v182 then
                            u1.pF_bF.Available3.Visible = true;
                            v156 = true;
                        elseif v154 and p126 then
                            local v184 = GetSellPrice(LocalPlayer, u153, u129);
                            u10.lastSellPrice = v184;
                            u1.pF_bF.Available2.TextButton.PriceLabel.Text = u10.currencyType .. u9.addCommas(v184);
                            u1.pF_bF.Available2.TextButton.PriceLabel:SetAttribute("Price", v184);
                            u1.pF_bF.Available2.Visible = true;
                        end;

                        if not (u129.CanUnlock.Value or v182) then
                            u1.pF_bF.Unavailable.Visible = true;
                        end;
                    end;

                    u10.canBuy = v156 or v152;
                end;

                u1.pictureF.Top.ItemImage.LockedUI.Enabled = not v152;
                u1.pictureF.Top.ItemImage.LockedIcon.Visible = not v152;
                local NewLabel = u1.pictureF.Top.ItemImage.NewLabel;
                local v185 = u129:FindFirstChild("IsNew") and u129.IsNew.Value;
                NewLabel.Visible = v185;
            end,

            UpdateFrameF = function(u186, u187) -- Line: 2140, Name: UpdateFrameF
                -- upvalues: ShopType (ref), u10 (ref), u9 (ref), GetSellPrice (ref), LocalPlayer (ref), u3 (ref)
                local v188 = u186.SellStations:FindFirstChild(ShopType.Value);
                local Value = u186.Price.Value;

                if v188 and v188:FindFirstChild("PriceMulti") then
                    Value = math.floor(Value * v188.PriceMulti.Value) or Value;
                end;

                local Value2 = u186.Level.Value;
                local v189 = u186:FindFirstChild("IsGamepass") and u186.IsGamepass.Value;
                local v190 = u186:FindFirstChild("IsDevProduct") and u186.IsDevProduct.Value;
                local v191 = u186:FindFirstChild("APassOnly") and u186.APassOnly.Value;
                local _G_GamepassCheck_ret = _G.GamepassCheck("Weaponry");
                local v192 = u186.SellStations:FindFirstChild("LegalStore") and (not u186.SellStations:FindFirstChild("IllegalStore") and v191);
                local v193 = u186:FindFirstChild("IsOP") and u186.IsOP.Value;
                local v194 = u186:FindFirstChild("IsValuable") and u186.IsValuable.Value;
                local u195 = v191 and _G_GamepassCheck_ret and 0 or (v188 and (v188:FindFirstChild("OverrideLevel") and v188.OverrideLevel.Value) or Value2);

                if v190 then
                    u187.Frame.Price.Text = " " .. u186.Price.Value;
                else
                    local Price = u187.Frame.Price;
                    local v196;

                    if v189 then
                        v196 = "GAMEPASS";
                    else
                        local currencyType = u10.currencyType;
                        local addCommas = u9.addCommas;
                        local v197;

                        if u10.cMode == "Sell" then
                            v197 = GetSellPrice(LocalPlayer, LocalPlayer.Backpack:FindFirstChild(u186.Name) or LocalPlayer.Character:FindFirstChild(u186.Name), u186) or Value;
                        else
                            v197 = Value;
                        end;

                        v196 = currencyType .. addCommas(v197);
                    end;

                    Price.Text = v196;
                end;

                if v189 then
                    u187.Frame.Price.TextColor3 = Color3.new(1, 1, 1);
                elseif u10.cMode == "Sell" then
                    u187.Frame.Price.TextColor3 = u10.colors.green;
                elseif u186.Price.Value < Value then
                    u187.Frame.Price.TextColor3 = u10.colors.orange;
                else
                    u187.Frame.Price.TextColor3 = Color3.new(1, 1, 1);
                end;

                u187.Frame.Title.Text = u186.DisplayName.Value;
                u187.Frame.Type.Text = u186:FindFirstChild("TypeName") and (string.upper(u186.TypeName.Value) or "") or "";
                u187.Frame.ItemImage.Image = "http://www.roblox.com/asset/?id=" .. u186.Image.Value;
                u187.LayoutOrder = u186:FindFirstChild("CustomLayoutOrder") and u186.CustomLayoutOrder.Value or u195 + Value;

                if v189 or u186:FindFirstChild("IsDevProduct") then
                    u187.LayoutOrder = u187.LayoutOrder - 100;
                end;

                if _G.CheckIfMobile and _G.CheckIfMobile() then
                    u187.Frame.Title.UIScale.Scale = 0.8;
                    u187.Frame.Type.UIScale.Scale = 0.8;
                    u187.Frame.Price.UIScale.Scale = 0.65;
                else
                    u187.Frame.Title.UIScale.Scale = 1;
                    u187.Frame.Type.UIScale.Scale = 1;
                    u187.Frame.Price.UIScale.Scale = 1;
                end;

                _G.GamepassCheck("Weaponry");
                local v198 = nil;

                if (function() -- Line: 2201, Name: AbleBuyCheck
                    -- upvalues: u186 (copy), u195 (ref), u3 (ref)
                    if u186:FindFirstChild("CanLevelUnlock") and u186.CanLevelUnlock.Value then
                        return u195 <= _G.PlayerData.Level and true or u3.Unlocked:FindFirstChild(u186.Name);
                    end;

                    return u186.CanUnlock.Value and u3.Unlocked:FindFirstChild(u186.Name) or u195 <= 1;
                end)() then
                    for _, _ in pairs(u187:GetChildren()) do

                    end;

                    u187.Frame.Has.Value = true;
                    u187.Frame.ItemImage.LockedUI.Enabled = false;
                    u187.Frame.ItemImage.LockedIcon.Visible = false;
                else
                    u187.Frame.Has.Value = false;
                    u187.Frame.BackgroundColor3 = Color3.new(0, 0, 0);
                    u187.Frame.ItemImage.LockedUI.Enabled = true;
                    u187.Frame.ItemImage.LockedIcon.Visible = true;
                end;

                if v189 or v190 then
                    v198 = 1;
                elseif u186:FindFirstChild("Winter") then
                    v198 = 2;
                elseif u186:FindFirstChild("IsIndependence") then
                    v198 = 7;
                elseif u186:FindFirstChild("IsSquid") then
                    v198 = 8;
                elseif u186:FindFirstChild("IsHallows2") and u186.IsHallows2.Value then
                    v198 = 5;
                elseif u186:FindFirstChild("IsHallows") and u186.IsHallows.Value then
                    u187.Frame.BorderColor3 = Color3.fromRGB(90, 255, 123);
                elseif v193 then
                    v198 = 3;
                elseif v192 then
                    v198 = 6;
                elseif v194 then
                    v198 = 4;
                elseif u186:FindFirstChild("IsNew") and u186.IsNew.Value then
                    u187.Frame.BorderColor3 = Color3.fromRGB(255, 253, 166);
                else
                    u187.Frame.BackgroundColor3 = Color3.new(0, 0, 0);
                end;

                if v198 then
                    if u187:GetAttribute("HasGradient") then
                        pcall(function() -- Line: 2276
                            -- upvalues: u187 (copy)
                            u187.Frame.Gradient:Destroy();
                            u187.Frame.Price.Gradient:Destroy();
                            u187.Frame.Title.Gradient:Destroy();
                            u187.Frame.Type.Gradient:Destroy();
                            u187.Frame.BG_Frame.Gradient:Destroy();
                        end);
                    end;

                    local v199 = script["Gradient" .. v198]:Clone();
                    v199.Name = "Gradient";
                    v199.Enabled = true;
                    v199:Clone().Parent = u187.Frame;
                    v199:Clone().Parent = u187.Frame.Price;
                    v199:Clone().Parent = u187.Frame.Title;
                    v199:Clone().Parent = u187.Frame.Type;
                    v199:Clone().Parent = u187.Frame.BG_Frame;
                    u187:SetAttribute("HasGradient", true);
                end;
            end,

            CreateFrameF = function(u200, p201, u202, p203) -- Line: 2298, Name: CreateFrameF
                -- upvalues: u10 (ref), ShopType (ref), u1 (ref), ItemStats (ref), UISounds (ref), u8 (ref), u6 (ref)
                local createdFrames = u10.createdFrames;

                if u202 == "Sell" then
                    createdFrames = u10.createdFrames2;
                end;

                local v204 = u200.SellStations:FindFirstChild(ShopType.Value);
                local Value = u200.Price.Value;

                if v204 and v204:FindFirstChild("PriceMulti") then
                    Value = math.floor(Value * v204.PriceMulti.Value) or Value;
                end;

                local Value2 = u200.Level.Value;
                local _ = v204 and (v204:FindFirstChild("OverrideLevel") and v204.OverrideLevel.Value) or Value2;
                local v205 = u200:FindFirstChild("IsGamepass") and u200.IsGamepass.Value;
                _G.GamepassCheck("Weaponry");
                local u206 = script.Template:Clone();
                u206.Name = u200.Name;
                u206.LayoutOrder = u200:FindFirstChild("CustomLayoutOrder") and u200.CustomLayoutOrder.Value or tonumber(u200.Level.Value);

                if v205 or u200:FindFirstChild("IsDevProduct") then
                    u206.LayoutOrder = u206.LayoutOrder - 100;
                end;

                local u207 = nil;

                if p201 == u1.listF1_C.melees then
                    u207 = ItemStats.Melees;
                elseif p201 == u1.listF1_C.guns then
                    u207 = ItemStats.Guns;
                elseif p201 == u1.listF1_C.throwables then
                    u207 = ItemStats.Throwables;
                elseif p201 == u1.listF1_C.armour then
                    u207 = ItemStats.Armour;
                elseif p201 == u1.listF1_C.misc then
                    u207 = ItemStats.Misc;
                end;

                local TextButton = u206.Frame.TextButton;
                TextButton.MouseButton1Click:Connect(function() -- Line: 2343
                    -- upvalues: u10 (ref), UISounds (ref), u8 (ref), u206 (copy), u200 (copy), u207 (ref), u202 (copy)
                    if u10.processing then
                        return;
                    end;

                    UISounds.click:Play();
                    u8.Select1(u206);
                    u8.ViewItem(u200.Name, u207, u206, u202);
                end);
                TextButton.MouseEnter:Connect(function() -- Line: 2353
                    -- upvalues: UISounds (ref), u206 (copy)
                    UISounds.hover:Play();
                    u206.Frame.HoverOverlay.Visible = true;
                end);
                TextButton.MouseLeave:Connect(function() -- Line: 2361
                    -- upvalues: u206 (copy)
                    u206.Frame.HoverOverlay.Visible = false;
                end);
                u8.UpdateFrameF(u200, u206);
                u206.Parent = p203 or p201;
                createdFrames[u200] = u206;

                if u202 ~= "Sell" then
                    u6[u200.Name] = u206;
                end;
            end,

            HoverClick = function(p208) -- Line: 2380, Name: HoverClick
                -- upvalues: u10 (ref), UISounds (ref)
                p208.MouseEnter:Connect(function() -- Line: 2381
                    -- upvalues: u10 (ref), UISounds (ref)
                    if u10.processing then
                        return;
                    end;

                    UISounds.hover:Play();
                end);
                p208.MouseButton1Click:Connect(function() -- Line: 2385
                    -- upvalues: u10 (ref), UISounds (ref)
                    if u10.processing then
                        return;
                    end;

                    UISounds.click:Play();
                end);
            end,

            SetUpStore = function() -- Line: 2391, Name: SetUpStore
                -- upvalues: Warn (ref), u10 (ref), ItemStats (ref), u8 (ref), u1 (ref), UISounds (ref), OpenValue (ref), Events (ref), u7 (ref), u9 (ref), GetShopBuyFee (ref), LocalPlayer (ref), u3 (ref), RunService (ref), ReplicatedStorage (ref), UserInputService (ref), Events2 (ref)
                Warn("setting up store...");

                if u10.StoreSetUp then
                    return;
                end;

                u10.StoreSetUp = true;

                for _, child in pairs(ItemStats.Melees:GetChildren()) do
                    if u8.CanCreateF(child) then
                        u8.CreateFrameF(child, u1.listF1_C.melees);
                    end;
                end;

                for _, child in pairs(ItemStats.Guns:GetChildren()) do
                    if u8.CanCreateF(child) then
                        u8.CreateFrameF(child, u1.listF1_C.guns);
                    end;
                end;

                for _, child in pairs(ItemStats.Throwables:GetChildren()) do
                    if u8.CanCreateF(child) then
                        u8.CreateFrameF(child, u1.listF1_C.throwables);
                    end;
                end;

                for _, child in pairs(ItemStats.Armour:GetChildren()) do
                    if u8.CanCreateF(child) then
                        u8.CreateFrameF(child, u1.listF1_C.armour);
                    end;
                end;

                for _, child in pairs(ItemStats.Misc:GetChildren()) do
                    if u8.CanCreateF(child) then
                        u8.CreateFrameF(child, u1.listF1_C.misc);
                    end;
                end;

                u1.buttonsF.meleesButton.TextButton.MouseButton1Click:Connect(function() -- Line: 2433
                    -- upvalues: u10 (ref), UISounds (ref), u8 (ref), u1 (ref)
                    if u10.processing then
                        return;
                    end;

                    UISounds.click:Play();
                    u8.ViewTab(u1.buttonsF.meleesButton, u1.listF1_C.melees);
                end);
                u1.buttonsF.meleesButton.TextButton.MouseEnter:Connect(function() -- Line: 2438
                    -- upvalues: UISounds (ref)
                    UISounds.hover:Play();
                end);
                u1.buttonsF.gunsButton.TextButton.MouseButton1Click:Connect(function() -- Line: 2440
                    -- upvalues: u10 (ref), UISounds (ref), u8 (ref), u1 (ref)
                    if u10.processing then
                        return;
                    end;

                    UISounds.click:Play();
                    u8.ViewTab(u1.buttonsF.gunsButton, u1.listF1_C.guns);
                end);
                u1.buttonsF.gunsButton.TextButton.MouseEnter:Connect(function() -- Line: 2446
                    -- upvalues: UISounds (ref)
                    UISounds.hover:Play();
                end);
                u1.buttonsF.throwablesButton.TextButton.MouseButton1Click:Connect(function() -- Line: 2448
                    -- upvalues: u10 (ref), UISounds (ref), u8 (ref), u1 (ref)
                    if u10.processing then
                        return;
                    end;

                    UISounds.click:Play();
                    u8.ViewTab(u1.buttonsF.throwablesButton, u1.listF1_C.throwables);
                end);
                u1.buttonsF.throwablesButton.TextButton.MouseEnter:Connect(function() -- Line: 2453
                    -- upvalues: UISounds (ref)
                    UISounds.hover:Play();
                end);
                u1.buttonsF.armorButton.TextButton.MouseButton1Click:Connect(function() -- Line: 2455
                    -- upvalues: u10 (ref), UISounds (ref), u8 (ref), u1 (ref)
                    if u10.processing then
                        return;
                    end;

                    UISounds.click:Play();
                    u8.ViewTab(u1.buttonsF.armorButton, u1.listF1_C.armour);
                end);
                u1.buttonsF.armorButton.TextButton.MouseEnter:Connect(function() -- Line: 2460
                    -- upvalues: UISounds (ref)
                    UISounds.hover:Play();
                end);
                u1.buttonsF.miscButton.TextButton.MouseButton1Click:Connect(function() -- Line: 2462
                    -- upvalues: u10 (ref), UISounds (ref), u8 (ref), u1 (ref)
                    if u10.processing then
                        return;
                    end;

                    UISounds.click:Play();
                    u8.ViewTab(u1.buttonsF.miscButton, u1.listF1_C.misc);
                end);
                u1.buttonsF.miscButton.TextButton.MouseEnter:Connect(function() -- Line: 2467
                    -- upvalues: UISounds (ref)
                    UISounds.hover:Play();
                end);
                u1.buyButton.MouseButton1Click:Connect(function() -- Line: 2471
                    -- upvalues: u10 (ref), UISounds (ref), u8 (ref)
                    if u10.processing then
                        return;
                    end;

                    if u10.cMode ~= "Buy" then
                        UISounds.click:Play();
                        u8.ViewTab2("Buy");
                    end;
                end);
                u1.buyButton.MouseEnter:Connect(function() -- Line: 2478
                    -- upvalues: UISounds (ref)
                    UISounds.hover:Play();
                end);
                u1.sellButton.MouseButton1Click:Connect(function() -- Line: 2480
                    -- upvalues: u10 (ref), UISounds (ref), u8 (ref)
                    if u10.processing then
                        return;
                    end;

                    if u10.cMode ~= "Sell" then
                        UISounds.click:Play();
                        u8.ViewTab2("Sell");
                    end;
                end);
                u1.sellButton.MouseEnter:Connect(function() -- Line: 2488
                    -- upvalues: UISounds (ref)
                    UISounds.hover:Play();
                end);
                u1.CloseB.MouseButton1Click:Connect(function() -- Line: 2492
                    -- upvalues: u10 (ref), UISounds (ref), OpenValue (ref), Events (ref)
                    if u10.processing then
                        return;
                    end;

                    UISounds.click:Play();
                    OpenValue.Value = false;
                    Events.BYZERSPROTEC:FireServer(false);
                end);
                u1.CloseB.MouseEnter:Connect(function() -- Line: 2500
                    -- upvalues: UISounds (ref)
                    UISounds.hover:Play();
                end);
                OpenValue.Changed:Connect(u8.ToggleGUI);

                function u7.Interact_Available() -- Line: 2509
                    -- upvalues: u10 (ref), u1 (ref), u7 (ref), u9 (ref), GetShopBuyFee (ref), LocalPlayer (ref)
                    if u10.processing then
                        return;
                    end;

                    for _, child in pairs(u1.purchaseFs:GetChildren()) do
                        if child:IsA("Frame") then
                            child.Visible = false;
                        end;
                    end;

                    local v209 = u1.statsF.Price:GetAttribute("Price") or 0;
                    local Text = u1.statsF.Price.Text;
                    local v210 = false;
                    u1.purchaseFs.PurchaseFrame.Title.Text = "Purchase " .. u10.chosen[2]:FindFirstChild(u10.chosen[1]).DisplayName.Value .. " for";

                    if u7.GetChosenCurrency() < v209 and u9.CanShopFromBankCheck(u10.chosen[2]:FindFirstChild(u10.chosen[1])) then
                        local v211 = GetShopBuyFee(LocalPlayer, u10.chosen[2]:FindFirstChild(u10.chosen[1]), "m");

                        if v211 and v211 > 0 then
                            v209 = v209 + v211;
                            Text = u10.currencyType .. u9.addCommas(v209) .. "<font color=\"rgb(255, 155, 155)\">" .. `(+{u10.currencyType}{u9.addCommas(v211)} bank fee)</font>`;
                            v210 = true;
                        end;
                    end;

                    if not v210 and v209 < 5000 then
                        u7.Purchase();

                        return;
                    end;

                    u1.purchaseFs.PurchaseFrame.PriceLabel.Text = "<b>" .. Text .. "</b>";
                    u1.purchaseFs.PurchaseFrame.Visible = true;
                end;

                function u7.Interact_Available3() -- Line: 2544
                    -- upvalues: u10 (ref), u1 (ref), u7 (ref), u9 (ref), GetShopBuyFee (ref), LocalPlayer (ref)
                    if u10.processing then
                        return;
                    end;

                    for _, child in pairs(u1.purchaseFs:GetChildren()) do
                        if child:IsA("Frame") then
                            child.Visible = false;
                        end;
                    end;

                    local math_floor_ret = math.floor(u10.chosen[3].Price.Value * u10.chosen[3].CanRent.RentMulti.Value + 0.5);

                    if u7.GetChosenCurrency() < math_floor_ret and u9.CanShopFromBankCheck(u10.chosen[2]:FindFirstChild(u10.chosen[1])) then
                        local v212 = GetShopBuyFee(LocalPlayer, u10.chosen[2]:FindFirstChild(u10.chosen[1]), "m");

                        if v212 then
                            math_floor_ret = math_floor_ret + v212;
                            local _ = u10.currencyType .. u9.addCommas(math_floor_ret) .. "<font color=\"rgb(255, 155, 155)\">" .. `(+{u10.currencyType}{u9.addCommas(v212)} bank fee)</font>`;
                        else
                            u9.addCommas(math_floor_ret);
                        end;
                    else
                        u9.addCommas(math_floor_ret);
                    end;

                    u1.purchaseFs.RentFrame.Title.Text = "Early buy " .. u10.chosen[2]:FindFirstChild(u10.chosen[1]).DisplayName.Value .. " for";
                    u1.purchaseFs.RentFrame.PriceLabel.Text = "<b>" .. u10.currencyType .. math_floor_ret .. "</b>" .. " (x" .. u10.chosen[3].CanRent.RentMulti.Value .. " price)";
                    u1.purchaseFs.RentFrame.Visible = true;
                end;

                function u7.Interact_Gamepass() -- Line: 2575
                    -- upvalues: u10 (ref), u3 (ref), UISounds (ref), RunService (ref), u8 (ref), u7 (ref)
                    if u10.processing then
                        return;
                    end;

                    if u3.Gamepasses:FindFirstChild(u10.chosen[1]) then
                        u7.Purchase();
                    elseif _G.PromptGamepass(u10.chosen[3].IsGamepass.ID.Value) then
                        UISounds.purchase:Play();
                        local v213 = u10.chosen[1];
                        local v214 = u10.chosen[2];
                        local v215 = u10.chosen[4];
                        local v216 = u10.chosen[5];
                        RunService.RenderStepped:Wait();
                        u8.ViewItem(v213, v214, v215, v216);
                    end;
                end;

                function u7.Interact_Unlock2() -- Line: 2593
                    -- upvalues: u10 (ref), UISounds (ref), RunService (ref), u8 (ref)
                    if u10.processing then
                        return;
                    end;

                    if not _G.GamepassCheck("Weaponry") and _G.PromptGamepass("Weaponry") then
                        UISounds.purchase:Play();
                        local v217 = u10.chosen[1];
                        local v218 = u10.chosen[2];
                        local v219 = u10.chosen[4];
                        local v220 = u10.chosen[5];
                        RunService.RenderStepped:Wait();
                        u8.ViewItem(v217, v218, v219, v220);
                    end;
                end;

                function u7.Interact_Product() -- Line: 2609
                    -- upvalues: u10 (ref), UISounds (ref), RunService (ref), u8 (ref)
                    if u10.processing then
                        return;
                    end;

                    if _G.PromptProductPurchase(u10.chosen[3].IsDevProduct.ID.Value) then
                        UISounds.purchase:Play();
                        local v221 = u10.chosen[1];
                        local v222 = u10.chosen[2];
                        local v223 = u10.chosen[4];
                        local v224 = u10.chosen[5];
                        RunService.RenderStepped:Wait();
                        u8.ViewItem(v221, v222, v223, v224);
                    end;
                end;

                function u7.Intreract_ClaimProduct() -- Line: 2628
                    -- upvalues: u10 (ref), ReplicatedStorage (ref), UISounds (ref), RunService (ref), u8 (ref)
                    if u10.processing then
                        return;
                    end;

                    local v225 = u10.chosen[3];
                    local _ = v225.IsDevProduct.ID.Value;

                    if ReplicatedStorage.Events.AttemptClaimShopProduct:InvokeServer(v225.Name) then
                        UISounds.purchase:Play();
                        local v226 = u10.chosen[1];
                        local v227 = u10.chosen[2];
                        local v228 = u10.chosen[4];
                        local v229 = u10.chosen[5];
                        RunService.RenderStepped:Wait();
                        u8.ViewItem(v226, v227, v228, v229);
                    end;
                end;

                function u7.Cancel_UpgradeF() -- Line: 2647
                    -- upvalues: u10 (ref), u1 (ref), u8 (ref)
                    if not u10.isUpgradeOpen then
                        return;
                    end;

                    u10.isUpgradeOpen = false;
                    u1.upgradeF.Visible = false;

                    if u10.cMode ~= "Buy" then
                        u1.listF1.Visible = false;
                        u1.listF2.CanvasPosition = Vector2.new(0, 0);
                        u1.listF2.Visible = true;
                        u1.pictureF.Visible = true;
                        u1.statsF.Unavailable2.Visible = true;
                        u1.StatsL.Visible = false;
                        u1.listF2.Visible = true;
                        u8.Select3(u1.sellButton);

                        return;
                    end;

                    u1.listF1.Visible = true;
                    u1.listF2.Visible = false;
                    u1.pictureF.Visible = true;
                    u1.nSellData1.Visible = false;
                    u1.nSellData2.Visible = false;
                    u1.statsF.Unavailable2.Visible = false;
                    u1.StatsL.Visible = true;
                    u1.listF1.Visible = true;
                    u8.Select3(u1.buyButton);
                end;

                function u7.Interact_DoUpgrade() -- Line: 2693
                    -- upvalues: u10 (ref), u1 (ref), u7 (ref), u9 (ref), GetShopBuyFee (ref), LocalPlayer (ref)
                    if u10.processing then
                        return;
                    end;

                    for _, child in pairs(u1.purchaseFs:GetChildren()) do
                        if child:IsA("Frame") then
                            child.Visible = false;
                        end;
                    end;

                    local v230 = u1.upgradeF.Price:GetAttribute("Price") or 0;
                    local Text = u1.upgradeF.Price.Text;
                    local v231 = false;
                    u1.purchaseFs.UpgradeFrame.Title.Text = "Upgrade " .. u10.chosen[2]:FindFirstChild(u10.chosen[1]).DisplayName.Value .. " for";

                    if u7.GetChosenCurrency() < v230 and u9.CanShopFromBankCheck(u10.chosen[2]:FindFirstChild(u10.chosen[1])) then
                        local v232 = GetShopBuyFee(LocalPlayer, u10.chosen[2]:FindFirstChild(u10.chosen[1]), "m");

                        if v232 and v232 > 0 then
                            v230 = v230 + v232;
                            Text = u10.currencyType .. u9.addCommas(v230) .. "<font color=\"rgb(255, 155, 155)\">" .. `(+{u10.currencyType}{u9.addCommas(v232)} bank fee)</font>`;
                            v231 = true;
                        end;
                    end;

                    if not v231 and v230 < 5000 then
                        u7.Purchase("Upgrade");

                        return;
                    end;

                    u1.purchaseFs.UpgradeFrame.PriceLabel.Text = "<b>" .. Text .. "</b>";
                    u1.purchaseFs.UpgradeFrame.Visible = true;
                end;

                function u7.Interact_UpgradeF(p233) -- Line: 2728
                    -- upvalues: u10 (ref), u1 (ref), u8 (ref)
                    if u10.processing and not p233 then
                        return;
                    end;

                    if u10.isUpgradeOpen then
                        return;
                    end;

                    if not u10.upgradeFound then
                        return;
                    end;

                    u10.isUpgradeOpen = true;
                    local _ = u10.chosen[3];
                    u1.listF1.Visible = false;
                    u1.listF2.Visible = false;
                    u8.ViewUpgrade(u10.upgradeFound.Name, u10.upgradeFound.Parent);
                    u1.upgradeF.Visible = true;
                end;

                function u7.Interact_Unavailable2(p234) -- Line: 2745
                    -- upvalues: u10 (ref), u1 (ref), u7 (ref), u9 (ref), GetShopBuyFee (ref), LocalPlayer (ref)
                    if p234 ~= 2 then
                        p234 = nil;
                    end;

                    if u10.processing then
                        return;
                    end;

                    local v235 = u10.chosen[3];

                    for _, child in pairs(u1.purchaseFs:GetChildren()) do
                        if child:IsA("Frame") then
                            child.Visible = false;
                        end;
                    end;

                    local v236 = p234 and (u10.interact_Unavailable2_Price2 or 0) or (u10.interact_Unavailable2_Price or 0);
                    local Text = u1.statsF.Unavailable2.Frame.Price.Text;
                    local v237 = nil;

                    if u7.GetChosenCurrency() < v236 and u9.CanShopFromBankCheck(u10.chosen[2]:FindFirstChild(u10.chosen[1])) then
                        local ResupplyGun = v235:FindFirstChild("ResupplyGun");

                        if p234 then
                            ResupplyGun = v235:FindFirstChild("ResupplyGun2");
                        end;

                        local v238 = GetShopBuyFee(LocalPlayer, u10.chosen[2]:FindFirstChild(u10.chosen[1]), ResupplyGun and "rf" or "rp");

                        if v238 then
                            v236 = v236 + v238;
                            Text = u10.currencyType .. u9.addCommas(v236) .. "<font color=\"rgb(255, 155, 155)\">" .. `(+{u10.currencyType}{u9.addCommas(v238)} bank fee)</font>`;
                            v237 = true;
                        end;
                    end;

                    u10.isSecondResupply = nil;

                    if not v237 and v236 < 5000 then
                        u7.Purchase("ResupplyAmmo", p234);

                        return;
                    end;

                    if v235:FindFirstChild("ResupplyGun") then
                        if v235:FindFirstChild("ResupplyGun2") and u10.invSecondRefilLDisplayTypes then
                            u10.isSecondResupply = p234;
                            u1.purchaseFs.RefillFrame.Title.Text = "Refill " .. v235.DisplayName.Value .. "[" .. tostring(p234 and u10.invSecondRefilLDisplayTypes[2] or u10.invSecondRefilLDisplayTypes[1]) .. "] for";
                        else
                            u1.purchaseFs.RefillFrame.Title.Text = "Refill " .. v235.DisplayName.Value .. " for";
                        end;

                        u1.purchaseFs.RefillFrame.PriceLabel.Text = "<b>" .. Text .. "</b>";
                        u1.purchaseFs.RefillFrame.TextButton.Text = "REFILL";
                    elseif v235:FindFirstChild("ResupplyArmor") then
                        u1.purchaseFs.RefillFrame.Title.Text = "Repair " .. v235.DisplayName.Value .. " for";
                        u1.purchaseFs.RefillFrame.PriceLabel.Text = "<b>" .. Text .. "</b>";
                        u1.purchaseFs.RefillFrame.TextButton.Text = "REPAIR";
                    end;

                    u1.purchaseFs.RefillFrame.Visible = true;
                end;

                function u7.Interact_Available2() -- Line: 2811
                    -- upvalues: u10 (ref), u1 (ref), u7 (ref)
                    if u10.processing then
                        return;
                    end;

                    for _, child in pairs(u1.purchaseFs:GetChildren()) do
                        if child:IsA("Frame") then
                            child.Visible = false;
                        end;
                    end;

                    local v239 = u10.chosen[2]:FindFirstChild(u10.chosen[1]);
                    local v240 = u10.lastSellPrice or 0;

                    if v239:FindFirstChild("NoSellConfirmation") and v239.NoSellConfirmation.Value or v240 < 1000 then
                        u7.Purchase("Sell");

                        return;
                    end;

                    u1.purchaseFs.SellFrame.Title.Text = "Sell " .. v239.DisplayName.Value .. " for";
                    u1.purchaseFs.SellFrame.PriceLabel.Text = u1.pF_bF.Available2.TextButton.PriceLabel.Text;
                    u1.purchaseFs.SellFrame.Visible = true;
                end;

                function u7.Interact_Unlock(p241) -- Line: 2836
                    -- upvalues: u10 (ref), u1 (ref)
                    if u10.processing then
                        return;
                    end;

                    for _, child in pairs(u1.purchaseFs:GetChildren()) do
                        if child:IsA("Frame") then
                            child.Visible = false;
                        end;
                    end;

                    if u10.upgradeFound and u10.cMode ~= "Buy" then
                        u1.purchaseFs.UnlockFrame.Title.Text = "Unlock " .. u10.chosen[2]:FindFirstChild(u10.chosen[1]).DisplayName.Value .. "* UPGRADE early for";
                        u1.purchaseFs.UnlockFrame.PriceLabel.Text = "<b>" .. u1.upgradeF.UpgradeButtonFrame.Unlock.TextButton.Value.Value .. "</b>";
                    else
                        u1.purchaseFs.UnlockFrame.Title.Text = "Unlock " .. u10.chosen[2]:FindFirstChild(u10.chosen[1]).DisplayName.Value .. " early for";
                        u1.purchaseFs.UnlockFrame.PriceLabel.Text = "<b>" .. u1.pF_bF.Unlock.TextButton.Value.Value .. "</b>";
                    end;

                    u1.purchaseFs.UnlockFrame.Visible = true;
                end;

                u1.pF_bF.Available.TextButton.MouseButton1Click:Connect(u7.Interact_Available);
                u1.pF_bF.Available3.TextButton.MouseButton1Click:Connect(u7.Interact_Available3);
                u1.pF_bF.Gamepass.TextButton.MouseButton1Click:Connect(u7.Interact_Gamepass);
                u1.pF_bF.Unlock2.TextButton.MouseButton1Click:Connect(u7.Interact_Unlock2);
                u1.pF_bF.Product.TextButton.MouseButton1Click:Connect(u7.Interact_Product);
                u1.pF_bF.ClaimProduct.TextButton.MouseButton1Click:Connect(u7.Intreract_ClaimProduct);
                u1.pF_bF.Unlock.TextButton.MouseButton1Click:Connect(u7.Interact_Unlock);
                u1.statsF.Unavailable2.Frame.TextButton.MouseButton1Click:Connect(u7.Interact_Unavailable2);
                u1.statsF.Unavailable2.FullFrame.TextButton.MouseButton1Click:Connect(u7.Interact_Unavailable2);
                u1.statsF.Unavailable2.FullFrame2.TextButton.MouseButton1Click:Connect(u7.Interact_Unavailable2);
                u1.statsF.Unavailable2.FullFrame2.TextButton2.MouseButton1Click:Connect(function() -- Line: 2867
                    -- upvalues: u7 (ref)
                    u7.Interact_Unavailable2(2);
                end);
                u1.statsF.Unavailable2.UpgradeFrame.TextButton.MouseButton1Click:Connect(u7.Interact_UpgradeF);
                u1.upgradeF.UpgradeButtonFrame.TextButton.MouseButton1Click:Connect(u7.Interact_DoUpgrade);
                u1.upgradeF.CloseButton.MouseButton1Click:Connect(u7.Cancel_UpgradeF);
                u1.upgradeF.UpgradeButtonFrame.Unlock.TextButton.MouseButton1Click:Connect(u7.Interact_Unlock);
                u1.pF_bF.Available2.TextButton.MouseButton1Click:Connect(u7.Interact_Available2);
                u1.pF_bF.Unlock.TextButton.MouseButton1Click:Connect(u7.Interact_Unlock);
                u1.purchaseFs.PurchaseFrame.TextButton.MouseButton1Click:Connect(function() -- Line: 2879
                    -- upvalues: u7 (ref)
                    u7.Purchase();
                end);
                u1.purchaseFs.UpgradeFrame.TextButton.MouseButton1Click:Connect(function() -- Line: 2882
                    -- upvalues: u7 (ref)
                    u7.Purchase("Upgrade");
                end);
                u1.purchaseFs.RentFrame.TextButton.MouseButton1Click:Connect(function() -- Line: 2885
                    -- upvalues: u7 (ref)
                    u7.Purchase();
                end);
                u1.purchaseFs.RefillFrame.TextButton.MouseButton1Click:Connect(function() -- Line: 2888
                    -- upvalues: u7 (ref), u10 (ref)
                    u7.Purchase("ResupplyAmmo", u10.isSecondResupply);
                end);
                u1.purchaseFs:WaitForChild("SellFrame").TextButton.MouseButton1Click:Connect(function() -- Line: 2891
                    -- upvalues: u7 (ref)
                    u7.Purchase("Sell");
                end);
                u1.purchaseFs.UnlockFrame.TextButton.MouseButton1Click:Connect(function() -- Line: 2894
                    -- upvalues: u7 (ref)
                    u7.Purchase("Unlock");
                end);
                u1.purchaseFs.SellFrame.TextButton.MouseButton1Click:Connect(function() -- Line: 2898
                    -- upvalues: u7 (ref)
                    u7.Purchase("Sell");
                end);

                for _, child in pairs(u1.purchaseFs:GetChildren()) do
                    if child:IsA("Frame") then
                        child.CloseButton.MouseButton1Click:Connect(function() -- Line: 2904
                            -- upvalues: u10 (ref), child (copy)
                            if u10.processing then
                                return;
                            end;

                            child.Visible = false;
                        end);
                        u8.HoverClick(child.TextButton);
                        u8.HoverClick(child.CloseButton);
                    end;
                end;

                u8.HoverClick(u1.upgradeF.CloseButton);
                u8.HoverClick(u1.statsF.Unavailable2.UpgradeFrame.TextButton);

                for _, descendant in pairs(u1.pF_bF:GetDescendants()) do
                    if descendant.ClassName == "TextButton" then
                        u8.HoverClick(descendant);
                    end;
                end;

                Events.BYZERSPROTEC.OnClientEvent:Connect(u7.UpdateProtection);
                Events.ShopEvent.OnClientEvent:Connect(function(p242) -- Line: 2925
                    -- upvalues: u10 (ref), u8 (ref)
                    if p242 == "Refresh" and u10.chosen then
                        u8.ViewItem(u10.chosen[1], u10.chosen[2], u10.chosen[4], u10.chosen[5]);
                    end;
                end);
                u3.Cash.Changed:Connect(u7.UpdateCash);

                if ReplicatedStorage.Values.CashPointsReplace.Value then
                    Events:WaitForChild("UpdateClient").OnClientEvent:Connect(u7.UpdateCash);
                end;

                local function updtInpType(p243) -- Line: 2960
                    -- upvalues: u1 (ref), UserInputService (ref)
                    if p243 ~= 2 then
                        u1.CloseB.TextColor3 = Color3.fromRGB(255, 255, 255);
                        u1.CloseB.Text = "X";
                        u1.CloseB.ImageLabel.Visible = false;

                        return;
                    end;

                    u1.CloseB.TextColor3 = Color3.fromRGB(255, 170, 0);
                    u1.CloseB.Text = "";
                    local ImageForKeyCode = UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonY);
                    u1.CloseB.ImageLabel.Image = ImageForKeyCode or "";
                    u1.CloseB.ImageLabel.Visible = true;
                end;

                UserInputService.InputBegan:Connect(function(p244, p245) -- Line: 2976
                    -- upvalues: u10 (ref), OpenValue (ref), Events (ref)
                    if p244.KeyCode == Enum.KeyCode.ButtonY and (not p245 and (u10.open and OpenValue.Value)) then
                        OpenValue.Value = false;
                        Events.BYZERSPROTEC:FireServer(false);
                    end;
                end);
                Events2.InputTypeChanged.Event:Connect(updtInpType);
                updtInpType(_G.InputType);
            end
        };
    end;

    Warn("shop setup start");
    createFrames();
    Warn("shop frames created");
    createVbrs();
    Warn("vbrs created");
    createFuncs();
    Warn("shop funcs created");
    u8.SetUpStore();
    Warn("successfully loaded shop!");
end)();
local Events3 = ReplicatedStorage:WaitForChild("Events");
local Events22 = ReplicatedStorage:WaitForChild("Events2");
ReplicatedStorage:WaitForChild("PlayerbaseData2", 60):WaitForChild(LocalPlayer.Name);
local u246 = nil;
local u247 = {
    toggle = Humanoid:LoadAnimation(ReplicatedStorage.Storage.Animations:WaitForChild("Toggle2"))
};
local OpenValue2 = CoreGUI:WaitForChild("OpenValue");
require(ReplicatedStorage.NewModules.Shared.Configuration.Gamepasses);
local u248 = false;

local function GuiToggle(p249) -- Line: 3034
    -- upvalues: CoreGUI (copy), u246 (ref), OpenValue2 (copy), Events3 (copy), GamepadService (copy)
    CoreGUI.ShopValue.Value = u246;

    if p249 ~= true or OpenValue2.Value then
        if p249 == false and OpenValue2.Value then
            OpenValue2.Value = false;
            Events3.BYZERSPROTEC:FireServer(false);
            GamepadService:DisableGamepadCursor();
        end;

        return;
    end;

    OpenValue2.Value = true;
    Events3.BYZERSPROTEC:FireServer(true, "shop", u246, CoreGUI.ShopType.Value);
    pcall(function() -- Line: 3041
        -- upvalues: GamepadService (ref), CoreGUI (ref)
        if _G.InputType == 2 then
            GamepadService:EnableGamepadCursor(CoreGUI.ShopFrame);
        end;
    end);
end;

local function DealerAirborne() -- Line: 3057
    -- upvalues: Humanoid (ref)
    if not (Humanoid and Humanoid.Parent) then
        return true;
    end;

    local State = Humanoid:GetState();

    return (Humanoid.FloorMaterial == Enum.Material.Air or State == Enum.HumanoidStateType.Jumping) and true or State == Enum.HumanoidStateType.Freefall;
end;

local function OnShopEvent(p250, p251) -- Line: 3063
    -- upvalues: Humanoid (ref), OpenValue2 (copy), u10 (copy), u7 (ref), Character (ref), HumanoidRootPart (ref), u246 (ref), CoreGUI (copy), GuiToggle (ref), u248 (ref)
    if not p251 then
        local v252;

        if Humanoid and Humanoid.Parent then
            local State = Humanoid:GetState();
            v252 = (Humanoid.FloorMaterial == Enum.Material.Air or State == Enum.HumanoidStateType.Jumping) and true or State == Enum.HumanoidStateType.Freefall;
        else
            v252 = true;
        end;

        if v252 then
            return;
        end;
    end;

    if OpenValue2.Value then
        return;
    end;

    if not p251 then
        if u10.opening then
            return;
        end;

        u10.opening = true;
        pcall(u7.Ready, p250);
        u10.opening = nil;

        if OpenValue2.Value or (not _G.CheckIfCan(Character, "Any") or (HumanoidRootPart.Position - p250.Position).Magnitude > 6.5) then
            return;
        end;

        local v253;

        if Humanoid and Humanoid.Parent then
            local State = Humanoid:GetState();
            v253 = (Humanoid.FloorMaterial == Enum.Material.Air or State == Enum.HumanoidStateType.Jumping) and true or State == Enum.HumanoidStateType.Freefall;
        else
            v253 = true;
        end;

        if v253 or not p250.Parent then
            return;
        end;
    end;

    u246 = p250;
    CoreGUI.ShopType.Value = p251 and "IllegalStore" or u246.Parent.Type.Value;
    CoreGUI.BuyZoneValue.Value = p251;
    GuiToggle(true);

    while true do
        if not OpenValue2.Value then
            return;
        end;

        task.wait(0.07);

        if p251 then
            if not _G.CheckIfCan(Character, "Any") then
                u248 = false;
                GuiToggle(false);

                return;
            end;
        else
            if not _G.CheckIfCan(Character, "Any") or (HumanoidRootPart.Position - p250.Position).Magnitude > 6.5 then
                break;
            end;

            local v254;

            if Humanoid and Humanoid.Parent then
                local State = Humanoid:GetState();
                v254 = (Humanoid.FloorMaterial == Enum.Material.Air or State == Enum.HumanoidStateType.Jumping) and true or State == Enum.HumanoidStateType.Freefall;
            else
                v254 = true;
            end;

            if v254 then
                break;
            end;
        end;
    end;

    GuiToggle(false);
end;

Events22:WaitForChild("Shop").Event:Connect(OnShopEvent);

local function NewChar(p255) -- Line: 3103
    -- upvalues: Character (ref), Humanoid (ref), HumanoidRootPart (ref), u247 (ref), ReplicatedStorage (copy), GuiToggle (ref), u7 (ref), LocalPlayer (copy), u248 (ref), OnShopEvent (copy), UserInputService (copy), CoreGUI (copy), u4 (ref)
    Character = p255;
    Humanoid = p255:WaitForChild("Humanoid");
    HumanoidRootPart = p255:WaitForChild("HumanoidRootPart");
    u247 = {
        toggle = Humanoid:LoadAnimation(ReplicatedStorage.Storage.Animations:WaitForChild("Toggle2"))
    };
    Humanoid.Died:Connect(function() -- Line: 3109
        -- upvalues: GuiToggle (ref)
        GuiToggle(false);
    end);
    task.spawn(function() -- Line: 3113
        -- upvalues: Humanoid (ref), Character (ref), u7 (ref)
        local v256 = Humanoid;

        while task.wait(0.25) and (v256.Health > 0 and v256.Parent == Character) do
            u7.PreFetch();
        end;
    end);
    local BuyZones = workspace.Filter:FindFirstChild("BuyZones");

    if BuyZones then
        local u257 = ReplicatedStorage.Storage.GUIs.BuyZoneGUI:Clone();
        u257.Parent = LocalPlayer.PlayerGui;
        local u258 = nil;
        local u259 = nil;
        local u260 = nil;

        local function DeviceCheck() -- Line: 3128
            -- upvalues: u260 (ref), u257 (copy)
            u260 = _G.InputType;

            if _G.InputType == 3 then
                u257.Frame.Visible = false;
                u257.MobileFrame.Visible = true;

                return;
            end;

            if _G.InputType == 2 then
                u257.Frame.Visible = true;
                u257.MobileFrame.Visible = false;
                u257.Frame.ButtonFrame.ButtonXBG.Visible = true;
                u257.Frame.ButtonFrame.X.Visible = true;
                u257.Frame.ButtonFrame.B.Visible = false;

                return;
            end;

            u257.Frame.Visible = true;
            u257.MobileFrame.Visible = false;
            u257.Frame.ButtonFrame.ButtonXBG.Visible = false;
            u257.Frame.ButtonFrame.X.Visible = false;
            u257.Frame.ButtonFrame.B.Visible = true;
        end;

        local function TryOpen() -- Line: 3151
            -- upvalues: u258 (ref), u259 (ref), u248 (ref), Character (ref), u257 (copy), OnShopEvent (ref), ReplicatedStorage (ref)
            if u258 and (u259 and not u248) then
                if not _G.CheckIfCan(Character, "Any") then
                    return;
                end;

                u248 = true;
                u257.Enabled = false;
                OnShopEvent(ReplicatedStorage.Values.GlobalStocks, u259);
            end;
        end;

        local u263 = UserInputService.InputBegan:Connect(function(p261, p262) -- Line: 3166
            -- upvalues: u258 (ref), u259 (ref), u248 (ref), Character (ref), u257 (copy), OnShopEvent (ref), ReplicatedStorage (ref)
            if p262 then
                return;
            end;

            if (p261.KeyCode == Enum.KeyCode.B or p261.KeyCode == Enum.KeyCode.ButtonX) and (u258 and (u259 and not u248)) then
                if not _G.CheckIfCan(Character, "Any") then
                    return;
                end;

                u248 = true;
                u257.Enabled = false;
                OnShopEvent(ReplicatedStorage.Values.GlobalStocks, u259);
            end;
        end);
        local u264 = u257.MobileFrame.TextButton.MouseButton1Down:Connect(function() -- Line: 3173
            -- upvalues: u258 (ref), u259 (ref), u248 (ref), Character (ref), u257 (copy), OnShopEvent (ref), ReplicatedStorage (ref)
            if u258 and (u259 and not u248) then
                if not _G.CheckIfCan(Character, "Any") then
                    return;
                end;

                u248 = true;
                u257.Enabled = false;
                OnShopEvent(ReplicatedStorage.Values.GlobalStocks, u259);
            end;
        end);
        local u265 = true;
        local u266 = nil;
        u266 = Humanoid.AncestryChanged:Connect(function(p267, p268) -- Line: 3179
            -- upvalues: u266 (ref), u263 (ref), u264 (ref), u265 (ref)
            if not p268 then
                u266:Disconnect();
                u263:Disconnect();
                u264:Disconnect();
                u265 = nil;
            end;
        end);
        task.spawn(function() -- Line: 3188
            -- upvalues: Humanoid (ref), u265 (ref), u260 (ref), DeviceCheck (copy), u259 (ref), u258 (ref), ReplicatedStorage (ref), BuyZones (copy), HumanoidRootPart (ref), u248 (ref), CoreGUI (ref), GuiToggle (ref), u257 (copy)
            while true do
                if Humanoid.Health <= 0 or not u265 then
                    return;
                end;

                if _G.InputType ~= u260 then
                    DeviceCheck();
                end;

                u259 = nil;
                u258 = false;

                if ReplicatedStorage.Values.BuyZonesEnabled.Value and ReplicatedStorage.Values.GlobalStocks.Value then
                    for _, child in pairs(BuyZones:GetChildren()) do
                        if child.Enabled.Value and ((child.MainPart.Position - HumanoidRootPart.Position).Magnitude <= child.MainPart.Size.Magnitude and table.find(workspace:GetPartsInPart(child.MainPart), HumanoidRootPart)) then
                            u258 = true;
                            u259 = child.MainPart;
                            break;
                        end;
                    end;
                end;

                if u248 and not _G.Shop_Active then
                    u248 = false;
                end;

                if not (u258 and u259) and u248 then
                    u248 = false;
                    CoreGUI.BuyZoneValue.Value = nil;
                    GuiToggle(false);
                end;

                u257.Enabled = u258 and not u248;
                task.wait(0.2);
            end;
        end);
    end;

    local v269 = _G.GVF and _G.GVF();
    u4 = v269;
    u7.UpdateCash();
    u4:WaitForChild("InventorySlots"):GetPropertyChangedSignal("Value"):Connect(function() -- Line: 3235
        -- upvalues: u7 (ref)
        u7.SlotChange();
    end);
    u4:WaitForChild("InventorySlots"):GetPropertyChangedSignal("MaxValue"):Connect(function() -- Line: 3238
        -- upvalues: u7 (ref)
        u7.SlotChange();
    end);
    u7.SlotChange(true);
end;

LocalPlayer.CharacterAdded:Connect(NewChar);

if LocalPlayer.Character then
    task.spawn(function() -- Line: 3247
        -- upvalues: NewChar (copy), LocalPlayer (copy)
        NewChar(LocalPlayer.Character);
    end);
end;

return v2;
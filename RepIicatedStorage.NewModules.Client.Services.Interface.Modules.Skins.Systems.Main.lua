-- ============================================================
-- SCRIPT: Main
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface.Modules.Skins.Systems.Main
-- ============================================================

-- Decompiled with Potassium's decompiler.

local u1 = {};
local Events2 = game:GetService("ReplicatedStorage"):WaitForChild("Events2");

local function lerp(p2, p3, p4) -- Line: 7
    return p2 + (p3 - p2) * p4;
end;

function u1.new(p5) -- Line: 11
    p5.vars.inventoryIds = {};
    p5.vars.cosmeticData = nil;
    p5.caseReplicatedData = _G.COSMETIC_STORE_DATA;
    p5.vars.equippedCosmeticData = nil;
    p5.vars.currentTab = 2;
    p5.vars.busy = false;
    p5.vars.busy2 = false;
    p5.vars.busy3 = false;
    p5.vars.open = false;
    p5.vars.inMassSellMode = false;
    p5.vars.massSellSelected = {};
    p5.vars.lockSelectedList = {};
    p5.vars.adminViewInv = false;
    p5.vars.adminViewInvData = nil;
    p5.vars.activeCaseUnbox = nil;
    p5.vars.activeSellData = nil;
    p5.vars.isvHelpOpen = nil;
end;

function u1.Connections(u6) -- Line: 36
    -- upvalues: Events2 (copy)
    local function updtInpType(p7) -- Line: 39
        -- upvalues: u6 (copy)
        if p7 ~= 2 then
            u6.frames.closeButton.TextColor3 = Color3.fromRGB(255, 255, 255);
            u6.frames.closeButton.Text = "X";
            u6.frames.closeButton.ImageLabel.Visible = false;

            return;
        end;

        u6.frames.closeButton.TextColor3 = Color3.fromRGB(255, 170, 0);
        u6.frames.closeButton.Text = "";
        local ImageForKeyCode = game:GetService("UserInputService"):GetImageForKeyCode(Enum.KeyCode.ButtonY);
        u6.frames.closeButton.ImageLabel.Image = ImageForKeyCode or "";
        u6.frames.closeButton.ImageLabel.Visible = true;
    end;

    u6.events2F.InputTypeChanged.Event:Connect(updtInpType);
    updtInpType(_G.InputType);
    u6.events2F.UpdateClientData.Event:Connect(function(...) -- Line: 58
        -- upvalues: u6 (copy)
        u6.systems.Main.UpdateClientData(u6, ...);
    end);
    u6.systems.Main.UpdateClientData(u6, _G.PlayerData);
    u6.systems.UI.MassSellMode(u6, false, true);
    u6.systems.UI.LockMode(u6, false, true);
    u6.systems.UI.ToggleISVHelp(u6, false);
    u6.systems.UI.ViewTab(u6, 2, true);
    u6.systems.UI.SwitchSortType(u6, 1);
    Events2.UpdateSkinIdKills.Event:Connect(function(p8, p9) -- Line: 70
        -- upvalues: u6 (copy)
        if u6.vars.inventoryIds[p8] then
            local _, v10 = unpack(u6.vars.inventoryIds[p8]);
            u6.systems.UI:SetKillText(v10, p9);
        end;
    end);
end;

function u1.GetTotalRarityValue(p11, p12) -- Line: 78
    local v13 = 0;

    for _, v in pairs(p12) do
        if v.Rarity then
            v13 = v13 + (p11.modules.cosmeticRaritySellPrices[v.Rarity] or 0);
        end;
    end;

    return v13;
end;

function u1.GetItemStats(p14, p15, p16) -- Line: 88
    if typeof(p15) ~= "string" or typeof(p16) ~= "string" then
        return;
    end;

    if p14.Services.ReplicatedStorage.Storage.ItemStats:FindFirstChild(p16) and p14.Services.ReplicatedStorage.Storage.ItemStats[p16]:FindFirstChild(p15) then
        return p14.Services.ReplicatedStorage.Storage.ItemStats[p16][p15];
    end;
end;

function u1.RemoveFromInventoryCache(p17, p18) -- Line: 98
    if p17.vars.massSellSelected and p17.vars.massSellSelected[p18] then
        p17.systems.Skins.ToggleMassSellSkin(p17, p18, true);
    end;

    local v19 = p17.vars.inventoryIds[p18];
    p17.vars.inventoryIds[p18] = nil;

    if v19 and v19[2] then
        v19[2]:Destroy();
    end;
end;

function u1.DataSavingDisabledCheck(p20) -- Line: 111
    return not p20.Services.ReplicatedStorage.Values.DataSaving.Value or p20.Services.ReplicatedStorage.Values.IsVipServer.Value;
end;

function u1.UpdateClientData(p21, p22, p23) -- Line: 115
    if p22.CosmeticData or p22.EquippedCosmeticData then
        p21.vars.cosmeticData = p22.CosmeticData;
        p21.vars.equippedCosmeticData = p22.EquippedCosmeticData;

        if not p23 then
            p21.systems.Main.UpdateInventory(p21);
        end;

        p21.systems.UI.UpdateSlots(p21);
    end;

    p21.caseReplicatedData = _G.COSMETIC_STORE_DATA;
end;

function u1.UpdateInventory(u24) -- Line: 130
    -- upvalues: u1 (copy)
    u1.UpdateClientData(u24, u24.vars.adminViewInv and u24.vars.adminViewInvData or _G.PlayerData, true);

    if not u24.vars.cosmeticData then
        return;
    end;

    local TotalRarityValue = u1.GetTotalRarityValue(u24, u24.vars.cosmeticData.Skins);
    u24.frames.ivSVF_TextLabel.Text = "<b>ISV</b>: <font color=\"rgb(170, 255, 199)\">" .. "$" .. u24.modules.addCommas(TotalRarityValue) .. "</font>";
    local v25 = {};

    for i, v in pairs(u24.vars.cosmeticData.Skins) do
        if v.ItemName ~= nil and v.SkinClass ~= nil then
            v25[i] = true;
            local v26 = u24.vars.inventoryIds[i];

            if not v26 then
                v.ItemDisplayName = u1.GetItemStats(u24, v.ItemName, v.SkinClass).DisplayName.Value;
                local success, result = pcall(function() -- Line: 155
                    -- upvalues: u24 (copy), i (copy), v (copy)
                    return u24.systems.UI.CreateInventoryFrame(u24, "skin", i, v);
                end);

                if success and result then
                    result.Name = i;
                    result.Serial.Visible = true;
                    result.Parent = u24.frames.listFrames.Guns;
                    u24.vars.inventoryIds[i] = { v, result, "skin" };
                    v26 = { v, result };
                else
                    warn("CreateCosmeticFrame1 Error:", result);
                end;
            end;

            if v26 then
                v26[1] = v;
                v26[2].NewLabel.Visible = os.time() - v.GotTick < 43200;
                v26[2]:SetAttribute("TradeLocked", v.TradeLocked and true or nil);
                v26[2]:SetAttribute("TradeLockedHide", v.TradeLockedHide and true or nil);
                v26[2].TradeLockedIcon.Visible = v.TradeLocked and not v.TradeLockedHide;

                if v.TradeLockedHide or not v.TradeLocked then
                    v26[2]:SetAttribute("TradeHold", v.TradeHold and true or nil);
                    v26[2].TradeHoldIcon.Visible = v.TradeHold;
                end;

                v26[2].LockedIcon.Visible = v26[1].Locked;

                if not u24.vars.inMassSellMode then
                    if u24.vars.adminViewInv and u24.vars.adminOutput == i then
                        v26[2].UIStroke.Enabled = true;
                        v26[2].UIStroke.Color = Color3.new(1, 0.882353, 0);
                        v26[2].UIStroke.Thickness = 3;
                    elseif u24.vars.equippedCosmeticData.Skins[v.ItemName] == i then
                        v26[2].UIStroke.Enabled = true;
                        v26[2].UIStroke.Color = Color3.new(1, 1, 1);
                        v26[2].UIStroke.Thickness = 2;
                    else
                        v26[2].UIStroke.Enabled = false;
                    end;

                    u24.systems.UI.UpdateInventoryFrameSortType(u24, u24.vars.sortType, i, v, v26[2]);
                end;
            end;
        end;
    end;

    u24.vars.updatedEquippedCosmetics = nil;

    for i, v in pairs(u24.vars.cosmeticData.Cases) do
        v25[i] = true;
        local v27 = u24.vars.inventoryIds[i];

        if not v27 then
            local success, result = pcall(function() -- Line: 219
                -- upvalues: u24 (copy), i (copy), v (copy)
                return u24.systems.UI.CreateInventoryFrame(u24, "case", i, v);
            end);

            if success and result then
                result.Name = i;
                result.Parent = u24.frames.listFrames.Cases;
                u24.vars.inventoryIds[i] = { v, result, "case" };
                v27 = { v, result };
            else
                warn("CreateCosmeticFrame Error2:", result);
            end;
        end;

        if v27 then
            if u24.vars.adminViewInv and u24.vars.adminOutput == i then
                v27[2].UIStroke.Enabled = true;
                v27[2].UIStroke.Color = Color3.new(1, 0.882353, 0);
                v27[2].UIStroke.Thickness = 3;
            else
                v27[2].UIStroke.Enabled = false;
                v27[2].NewLabel.Visible = os.time() - v.GotTick < 21600;
            end;
        end;
    end;

    for _, v in pairs(u24.frames.listFrames) do
        local v28 = #v:GetChildren() / 11;
        v.CanvasSize = UDim2.new(0, 0, v28 < 1 and 0 or v28, 0);
    end;

    u24.systems.UI.UpdateSlots(u24);

    for i, _ in pairs(u24.vars.inventoryIds) do
        if not v25[i] then
            u1.RemoveFromInventoryCache(u24, i);
        end;
    end;
end;

return u1;
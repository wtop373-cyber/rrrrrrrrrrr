-- ============================================================
-- SCRIPT: Skins
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface.Modules.Skins.Systems.Skins
-- ============================================================

-- Decompiled with Potassium's decompiler.

local v1 = {};

local function lerp(p2, p3, p4) -- Line: 3
    return p2 + (p3 - p2) * p4;
end;

local function tweenGraph(p5, p6) -- Line: 7
    return 1 - (1 - math.clamp(p5, 0, 1)) ^ p6;
end;

function v1.new() -- Line: 12
end;

function v1.ToggleLockSkin(p7, p8, p9) -- Line: 16
    local v10 = p7.vars.inventoryIds[p8];

    if not v10 then
        return;
    end;

    if p9 or p7.vars.lockSelectedList[p8] then
        v10[2].SellOverlay.Visible = false;

        if p7.vars.inMassSellMode then
            v10[2].UIStroke.Thickness = 1;
        end;

        p7.vars.lockSelectedList[p8] = nil;
    else
        v10[2].SellOverlay.Visible = true;
        p7.vars.lockSelectedList[p8] = v10;
        v10[2].UIStroke.Thickness = 2;
    end;

    local v11 = 0;

    for _, _ in pairs(p7.vars.lockSelectedList) do
        v11 = v11 + 1;
    end;

    p7.frames.lockSelectedButton.Visible = v11 > 0;
    p7.frames.selectCountLabel.Text = tostring(v11) .. "/" .. tostring(p7.config.MaxMassSelect);
    p7.frames.selectCountLabel.TextLabel.Text = p7.frames.selectCountLabel.Text;
    p7.frames.selectCountLabel.TextLabel.TextColor3 = p7.config.MaxMassSelect <= v11 and Color3.new(1, 0, 0) or Color3.new(1, 1, 1);
end;

function v1.ToggleMassSellSkin(p12, p13, p14) -- Line: 48
    local v15 = p12.vars.inventoryIds[p13];

    if not v15 then
        return;
    end;

    if p14 or p12.vars.massSellSelected[p13] then
        v15[2].SellOverlay.Visible = false;

        if p12.vars.inMassSellMode then
            v15[2].UIStroke.Thickness = 1;
        end;

        p12.vars.massSellSelected[p13] = nil;
    elseif not v15[1].Locked then
        v15[2].SellOverlay.Visible = true;
        p12.vars.massSellSelected[p13] = v15;
        v15[2].UIStroke.Thickness = 2;
    end;

    local v16 = 0;

    for _, _ in pairs(p12.vars.massSellSelected) do
        v16 = v16 + 1;
    end;

    p12.frames.sellSelectedButton.Visible = v16 > 0;
    p12.frames.selectCountLabel.Text = tostring(v16) .. "/" .. tostring(p12.config.MaxMassSelect);
    p12.frames.selectCountLabel.TextLabel.Text = p12.frames.selectCountLabel.Text;
    p12.frames.selectCountLabel.TextLabel.TextColor3 = p12.config.MaxMassSelect <= v16 and Color3.new(1, 0, 0) or Color3.new(1, 1, 1);
end;

function v1.EquipSkin(p17, p18) -- Line: 80
    p17.vars.busy = true;
    local v19 = p17.events.cosmeticsInteract:InvokeServer("EquipCosmetic", "Skins", p18);

    if v19 then
        p17.vars.equippedCosmeticData = v19;
        p17.systems.Main.UpdateInventory(p17);
    end;

    p17.vars.busy = false;
end;

function v1.OpenCase(p20, p21) -- Line: 92
    p20.vars.busy = true;

    if p20.events.cosmeticsInteract:InvokeServer("OpenCase", p21) then
        p20.systems.Main.RemoveFromInventoryCache(p20, p21);
        p20.systems.Main.UpdateInventory(p20);
    end;

    p20.vars.busy = false;
end;

function v1.LockSkins(p22, p23) -- Line: 104
    p22.vars.busy = true;
    p22.events.cosmeticsInteract:InvokeServer("LockCosmetic", "skin", p23);
    p22.systems.Main.UpdateInventory(p22);
    p22.vars.busy = false;
end;

function v1.AttemptSellSkin(p24, p25, p26, p27) -- Line: 114
    if p24.vars.busy3 then
        return;
    end;

    p24.vars.busy3 = true;

    for _, child in pairs(p24.frames.purchaseFrame:GetChildren()) do
        if child:IsA("Frame") then
            child.Visible = false;
        end;
    end;

    local v28 = p24.events.cosmeticsInteract:InvokeServer("SellCheck", p25, p26);

    if p27 then
        p27 = p27.DisplayName;
    end;

    local v29 = not p27 and "N/A" or "\'" .. p27 .. "\'";

    if v28 then
        p24.vars.activeSellData = { p25, p26 };
        local v30;

        if v28.Price > 0 then
            v30 = "Sell " .. v29 .. " for";
            local v31 = false;

            if #p26 > 1 then
                if v28.HasDeleteSkin then
                    v30 = "Mass sell [x" .. v28.SellCount .. "] " .. "<font color=\'rgb(255,0,0)\'>and delete [x" .. v28.DeleteCount .. "]</font> selected items for";
                    v31 = true;
                else
                    v30 = "Mass sell selected items [x" .. v28.SellCount .. "] for";
                end;
            end;

            p24.frames.purchaseFrame.SellFrame.PriceLabel.Text = v28.Price and ("$" .. p24.modules.addCommas(v28.Price) or "N/A") or "N/A";
            p24.frames.purchaseFrame.SellFrame.PriceLabel.Visible = true;
            p24.frames.purchaseFrame.SellFrame.Title.Position = UDim2.new(0.5, 0, 0.099, 0);
            p24.frames.purchaseFrame.SellFrame.Title.AnchorPoint = Vector2.new(v31 and 0 or 0.5, 0);
            p24.frames.purchaseFrame.SellFrame.Title.Position = UDim2.new(v31 and 0.05 or 0.5, 0, 0.099, 0);
            p24.frames.purchaseFrame.SellFrame.TradedItemWarning.Visible = false;
            p24.frames.purchaseFrame.SellFrame.TextButton.Text = (v28.Sellable or v28.Price > 0) and "SELL" or "DELETE";
        else
            v30 = "Delete " .. v29 .. "";

            if #p26 > 1 then
                v30 = "<font color=\'rgb(255,0,0)\'>Mass delete selected items [x" .. v28.DeleteCount .. "]</font>";
            end;

            p24.frames.purchaseFrame.SellFrame.PriceLabel.Visible = false;
            p24.frames.purchaseFrame.SellFrame.TradedItemWarning.Visible = true;
            p24.frames.purchaseFrame.SellFrame.Title.AnchorPoint = Vector2.new(0.5, 0);
            p24.frames.purchaseFrame.SellFrame.TextButton.Text = "DELETE";
        end;

        p24.frames.purchaseFrame.SellFrame.Title.Text = v30;
        p24.frames.purchaseFrame.SellFrame.Visible = true;
    else
        local v32 = p24.vars.inventoryIds[p26[1]][1].Locked and "Skin locked! Unlock it before you can sell/delete it!" or (#p26 > 1 and "Error: Unable to mass delete!" or "Error: Unable to delete " .. v29);

        if v28 then
            v32 = `Error: {v28}`;
        elseif not p24.Services.ReplicatedStorage.Values.DataSaving.Value then
            v32 = v32 .. " (DATASAVING DISABLED)";
        end;

        p24.frames.purchaseFrame.FailSellFrame.Title.Text = v32;
        p24.frames.purchaseFrame.FailSellFrame.Visible = true;
    end;

    p24.frames.purchaseFrame.Visible = true;
    p24.vars.busy3 = false;
end;

function v1.UnboxEffect(u33, p34, u35) -- Line: 207
    if u33.vars.activeCaseUnbox then
        u33.vars.activeCaseUnbox.Destroy();
    end;

    local u36 = true;
    local ChosenItem = u35.ChosenItem;
    u33.vars.busy2 = true;
    u33.vars.activeCaseUnbox = {};
    local TweenInfo_new_ret = TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
    local BlurEffect = Instance.new("BlurEffect");
    BlurEffect.Size = 0;
    local Frame = Instance.new("Frame");
    Frame.BackgroundTransparency = 1;
    Frame.AnchorPoint = Vector2.new(0.5, 0.5);
    Frame.Position = UDim2.new(0.5, 0, 0.5, 0);
    Frame.Size = UDim2.new(5, 0, 5, 0);
    Frame.BackgroundColor3 = Color3.new();
    Frame.BorderSizePixel = 0;
    local u37 = nil;
    local v38 = u33.scDir.SpinUnboxFrame:Clone();
    u33.vars.activeCaseUnbox.spinFrame = v38;
    u33.vars.activeCaseUnbox.spinFrame2 = v38.SpinnerFrame;
    u33.vars.activeCaseUnbox.spinFrame3 = u33.vars.activeCaseUnbox.spinFrame2.ItemsFrame.ItemsContainer;
    u33.vars.activeCaseUnbox.caseFrame = v38.CaseFrame;
    u33.vars.activeCaseUnbox.spinFrame2.Visible = false;

    local function HideUis() -- Line: 267
        -- upvalues: u33 (copy)
        local success, result = pcall(function() -- Line: 268
            -- upvalues: u33 (ref)
            local v39 = {
                u33.frames.mainFrame,
                u33.GUI.StoreFrame,
                u33.GUI.StatsFrame,
                u33.GUI.LevelFrame,
                u33.GUI.SettingsFrame,
                u33.GUI.NotificationFrame
            };
            u33.vars.activeCaseUnbox.NonVisibleUIs = {};

            for _, v in pairs(v39) do
                if v.Visible then
                    table.insert(u33.vars.activeCaseUnbox.NonVisibleUIs, v);
                end;
            end;

            for _, child in pairs(u33.plr.PlayerGui:GetChildren()) do
                if child:IsA("ScreenGui") and (child.ResetOnSpawn and child.Enabled) then
                    table.insert(u33.vars.activeCaseUnbox.NonVisibleUIs, child);
                end;
            end;

            for _, v in pairs(u33.vars.activeCaseUnbox.NonVisibleUIs) do
                if v:IsA("Frame") then
                    v.Visible = false;
                elseif v:IsA("ScreenGui") then
                    v.Enabled = false;
                end;
            end;

            if u33.plr and u33.plr.Character then
                u33.plr.Character.Humanoid:UnequipTools();
                u33.vars.activeCaseUnbox.BBB = _G.AffectChar("B", 15);
            end;
        end);

        if not success then
            warn("HideUisError:", result);
        end;
    end;

    local function DoPreloadWait(u40) -- Line: 311
        local u41 = false;
        coroutine.wrap(function() -- Line: 316
            -- upvalues: u40 (copy), u41 (ref)
            game:GetService("ContentProvider"):PreloadAsync(u40);
            u41 = true;
        end)();
        local v42 = time();

        repeat
            task.wait(0.1);
        until time() - v42 >= 10 or u41;
    end;

    local function CaseAnimation() -- Line: 326
        -- upvalues: u33 (copy), u35 (copy)
        u33.vars.activeCaseUnbox.caseFrame.Visible = true;
        u33.vars.activeCaseUnbox.spinFrame.Parent = u33.frames.unboxFrame;
        local ViewportFrame = u33.vars.activeCaseUnbox.caseFrame.ViewportFrame;
        local v43 = u35.CaseData.ItemName or "DefaultCase";
        local v44 = u33.cosmeticsF.Cases[v43]:Clone();
        local TextureName = u35.CaseData.TextureName;
        local TextureID = u35.CaseData.TextureID;

        if TextureName then
            local v45 = u33.cosmeticsF.CasePBRs:FindFirstChild(TextureName);

            for _, descendant in pairs(v44:GetDescendants()) do
                if descendant:IsA("MeshPart") and descendant:GetAttribute("SATP") then
                    if TextureID then
                        descendant.TextureID = "rbxassetid://" .. tostring(TextureID);
                    end;

                    v45:Clone().Parent = descendant;
                end;
            end;
        end;

        v44.Parent = ViewportFrame.WorldModel;
        u33.vars.activeCaseUnbox.spinFrame.Visible = true;
        pcall(function() -- Line: 357
            -- upvalues: u33 (ref)
            if _G.InputType == 2 then
                task.delay(0.1, function() -- Line: 359
                    -- upvalues: u33 (ref)
                    u33.Services.GamepadService:EnableGamepadCursor(u33.vars.activeCaseUnbox.spinFrame);
                end);
            end;
        end);
        local Camera = Instance.new("Camera");
        ViewportFrame.CurrentCamera = Camera;
        Camera.Parent = ViewportFrame;
        local v46 = u33.modules.ViewportModel.new(ViewportFrame, Camera);
        local BoundingBox, _ = v44:GetBoundingBox();
        local u47 = BoundingBox;
        v46:SetModel(v44);
        local CFrame_new_ret = CFrame.new();
        local CFrame_new_ret2 = CFrame.new(0, 0, 0);
        local CFrameValue = Instance.new("CFrameValue");
        CFrameValue.Value = CFrame_new_ret2;
        CFrameValue.Parent = v44;
        u33.Services.TS:Create(CFrameValue, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Value = CFrame.new(0, 0, 0)
        }):Play();
        u33.systems.UI.ApplyUISSpin(u33, v44, function(p48) -- Line: 386, Name: OnUpdate
            -- upvalues: CFrame_new_ret (ref)
            CFrame_new_ret = p48;
        end);
        local FitDistance = v46:GetFitDistance(u47.Position);
        local u49 = CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 2, 0) * CFrame.Angles(0.3490658503988659, 0, 0);
        local u50 = nil;

        local function UpdateCam(p51) -- Line: 397
            -- upvalues: u49 (copy), CFrame_new_ret (ref), CFrameValue (copy), Camera (copy), u47 (ref), FitDistance (copy)
            local v52 = u49 * (CFrame.fromEulerAnglesYXZ(-0.3490658503988659, 0, 0) * CFrame_new_ret * CFrameValue.Value);
            Camera.CFrame = CFrame.new(u47.Position) * v52 * CFrame.new(0, 0, FitDistance);
        end;

        UpdateCam();
        local u53 = u33.Services.RunService.RenderStepped:Connect(UpdateCam);
        u50 = v44.AncestryChanged:Connect(function(p54, p55) -- Line: 407
            -- upvalues: u50 (ref), u53 (ref)
            if not p55 then
                u50:Disconnect();
                u53:Disconnect();
            end;
        end);
        local v56 = v44.AnimationController:LoadAnimation(u33.cosmeticsF.CaseAnims[v43]);
        v56:GetMarkerReachedSignal("Unlock"):Connect(function() -- Line: 416
            -- upvalues: u33 (ref)
            u33.uiSoundsF.case_open_key:Play();
        end);
        v56:GetMarkerReachedSignal("Land"):Connect(function() -- Line: 420
            -- upvalues: u33 (ref)
            u33.uiSoundsF["caseland" .. math.random(1, 4)]:Play();
        end);
        v56:Play(0);
        v56:GetMarkerReachedSignal("FullOpen"):Wait();
        task.wait();
        u33.uiSoundsF.case_open:Play();
        task.delay(0, function() -- Line: 454
            -- upvalues: u33 (ref)
            u33.Services.TS:Create(u33.vars.activeCaseUnbox.caseFrame.ViewportFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                ImageTransparency = 0.5,
                ImageColor3 = Color3.new(0.15, 0.15, 0.15)
            }):Play();
        end);
    end;

    local function StartSpin() -- Line: 459
        -- upvalues: u35 (copy), u33 (copy), ChosenItem (copy), u36 (ref), u37 (ref)
        local Random_new_ret = Random.new();
        local v57 = Random_new_ret:NextInteger(50, 50);
        local v58 = Random_new_ret:NextInteger(v57 - 10, v57 - 5);

        for i, v in pairs(u35.CaseData.Contents) do
            local SpinSkinTemplate = u33.scDir.SpinSkinTemplate;
            local v59;

            if i == v58 then
                v59 = ChosenItem;
            else
                v59 = v;
            end;

            local Rarity = v59.Rarity;

            if Rarity == "limited" then
                SpinSkinTemplate = u33.scDir.SpinLimitedTemplate;
            elseif Rarity == "exotic" then
                SpinSkinTemplate = u33.scDir.SpinExoticTemplate;
            end;

            local v60 = SpinSkinTemplate:Clone();

            if Rarity then
                local v61 = u33.config.RarityBands[string.lower(Rarity)];

                if v61 then
                    v60.RarityBand.BackgroundColor3 = v61;
                    v60.RarityBand2.ImageColor3 = v61;
                end;
            else
                v60.RarityBand.BackgroundColor3 = u33.config.RarityBands.common;
                v60.RarityBand2.ImageColor3 = u33.config.RarityBands.common;
            end;

            if Rarity ~= "limited" and Rarity ~= "exotic" then
                v60.ViewportFrame.LightColor = Color3.fromRGB(350, 350, 350);
                u33.systems.UI.AddToViewportFrame(u33, v59, v60.ViewportFrame);
            end;

            v60.Parent = u33.vars.activeCaseUnbox.spinFrame3;
            v60.LayoutOrder = i;
        end;

        u33.vars.activeCaseUnbox.spinFrame3.Position = UDim2.new(0, 0, 0.5, 0);
        local Scale = u33.scDir.SpinSkinTemplate.Size.X.Scale;
        local v62 = Scale / 2;
        local _ = u33.GUI.AbsoluteSize.X;
        local v63 = 0.5 - v62 + (v58 - 1) * (-Scale - u33.vars.activeCaseUnbox.spinFrame3.UIListLayout.Padding.Scale);
        local v64 = Random_new_ret:NextNumber(-(v62 / 1.05), v62 / 1.05);
        local v65 = v63 + v64;
        local u66 = tick();
        local u67 = Random_new_ret:NextNumber(3.5, 5.5);
        local v68 = 0;
        local v69 = 0;
        local v70 = nil;
        u33.vars.activeCaseUnbox.spinFrame2.Visible = true;
        local u71 = false;
        local SkipButton = u33.vars.activeCaseUnbox.spinFrame2.SkipButton;
        SkipButton.MouseEnter:Connect(function() -- Line: 546
            -- upvalues: u33 (ref)
            u33.uiSoundsF.hover:Play();
        end);
        SkipButton.MouseButton1Click:Connect(function() -- Line: 551
            -- upvalues: u71 (ref), u33 (ref), SkipButton (copy), u66 (copy), u35 (ref), u67 (ref)
            if u71 then
                return;
            end;

            u33.uiSoundsF.click:Play();
            u71 = true;
            SkipButton.Visible = false;
            local v72 = 0 + 10 * (1 - (tick() - u66) / (u35.UnboxTime - 2));
            u67 = u67 * (math.max(v72, 0) + 1);
        end);
        local v73 = false;

        while u36 do
            local v74 = (tick() - u66) / u35.UnboxTime;
            local v75 = 1 - (1 - math.clamp(v74, 0, 1)) ^ u67;
            local v76 = 0 + (v65 - 0) * v75;
            local math_floor_ret = math.floor((v76 + v64) / Scale);
            local v77 = math.abs(math_floor_ret) + 1;

            if v77 == v68 then
                v77 = v68;
            else
                u33.uiSoundsF.tick_sound:Play();
                v69 = v69 + 1;
            end;

            u33.vars.activeCaseUnbox.spinFrame3.Position = UDim2.new(v76, 0, 0.5, 0);
            local math_abs_ret = math.abs(v76 - v65);

            if not v70 and math_abs_ret < 0.01 then
                v70 = time();
            end;

            if not (v73 or (math_abs_ret >= 0.2 or ChosenItem.Rarity ~= "limited")) then
                v73 = true;
                u37 = u33.uiSoundsF:FindFirstChild("unbox_" .. string.lower(ChosenItem.Rarity));

                if u37 then
                    u37 = u37:Clone();
                    u37.Parent = u33.GUI;
                    game.Debris:AddItem(u37, 20);
                    u37:Play();
                end;
            end;

            if SkipButton.Visible and math_abs_ret < 0.1 then
                SkipButton.Visible = false;
            end;

            if u71 or (v74 >= 1 or v70 and time() - v70 >= 0.2) then
                break;
            end;

            u33.Services.RunService.Heartbeat:Wait();
            v68 = v77;
        end;

        if u33.vars.activeCaseUnbox.spinFrame and u33.vars.activeCaseUnbox.spinFrame.Parent then
            u33.vars.activeCaseUnbox.spinFrame:Destroy();
        end;

        u33.vars.activeCaseUnbox.spinDone = true;
    end;

    local function FullUnbox(p78, p79, u80, p81) -- Line: 622
        -- upvalues: u33 (copy), ChosenItem (copy), u35 (copy), u37 (ref), BlurEffect (copy), TweenInfo_new_ret (copy), Frame (copy)
        if u33.vars.activeCaseUnbox.spinFrame and u33.vars.activeCaseUnbox.spinFrame.Parent then
            u33.vars.activeCaseUnbox.spinFrame:Destroy();
        end;

        local v82 = (ChosenItem.CustomName or (not p79 and "N/A" or p79.DisplayName.Value)) .. " | " .. (ChosenItem.DisplayName or "?");

        if u35.ChosenItem.SouvenirType then
            v82 = "Souvenir " .. v82;
        elseif u35.ChosenItem.Killtrack then
            v82 = "KILLTRACK™ " .. v82;
        end;

        p78.Title.Text = v82;
        local RarityBand = p78.RarityBand;
        RarityBand.Size = UDim2.new(string.len(v82) / 61, 0, RarityBand.Size.Y.Scale, 0);

        if ChosenItem.Rarity then
            local v83 = u33.config.RarityBands[string.lower(ChosenItem.Rarity)];

            if v83 then
                RarityBand.BackgroundColor3 = v83;
                p78.MiddleColor.ImageLabel.ImageColor3 = v83;
                p78.Rarity.TextColor3 = v83;
                p78.Rarity.Text = "[" .. string.upper(u33.config.CustomRarityNames[ChosenItem.Rarity] or ChosenItem.Rarity) .. "]";
            end;

            u37 = ChosenItem.Rarity ~= "limited" and u33.uiSoundsF:FindFirstChild("unbox_" .. string.lower(ChosenItem.Rarity));

            if u37 then
                u37 = u37:Clone();
                u37.Parent = u33.GUI;
                game.Debris:AddItem(u37, 15);
                u37:Play();
            end;
        else
            RarityBand.BackgroundColor3 = u33.config.RarityBands.common;
            p78.MiddleColor.ImageLabel.ImageColor3 = u33.config.RarityBands.common;
            p78.Rarity.TextColor3 = u33.config.RarityBands.common;
            p78.Rarity.Text = "[UNCOMMON]";
        end;

        local ItemStats = u33.systems.Main.GetItemStats(u33, ChosenItem.ItemName, ChosenItem.SkinClass);

        if ItemStats and ItemStats:FindFirstChild("Desc") then
            p78.Desc.Text = ItemStats.Desc.Value;
        end;

        p78.BottomBar.CloseButton.MouseEnter:Connect(function() -- Line: 681
            -- upvalues: u33 (ref)
            u33.uiSoundsF.hover:Play();
        end);
        p78.BottomBar.CloseButton.MouseButton1Click:Connect(function() -- Line: 684
            -- upvalues: u33 (ref)
            u33.uiSoundsF.click:Play();
            u33.vars.activeCaseUnbox.Destroy();
        end);

        if u80 then
            u33.systems.UI.ApplyPreviewMetadata(u33, ChosenItem, u80, true);

            if u35.ChosenItem.Killtrack then
                local success, result = pcall(function() -- Line: 696
                    -- upvalues: u33 (ref), u80 (copy)
                    return u33.modules.addKillTrackModel(u80, true);
                end);

                if success and result then
                    for _, descendant in pairs(result:GetDescendants()) do
                        if descendant:IsA("BasePart") then
                            descendant.Anchored = true;
                        end;
                    end;

                    local math_random_ret = math.random(1, 9);

                    local function updt() -- Line: 709
                        -- upvalues: u33 (ref), result (copy), math_random_ret (ref)
                        u33.modules.killTrackDisplayDecal(result, string.rep(tostring(math_random_ret), 6));
                    end;

                    local u84 = true;
                    local u85 = nil;
                    u85 = result.AncestryChanged:Connect(function(p86, p87) -- Line: 716
                        -- upvalues: u85 (ref), u84 (ref)
                        if not p87 then
                            u85:Disconnect();
                            u84 = nil;
                        end;
                    end);
                    task.spawn(function() -- Line: 722
                        -- upvalues: u84 (ref), u33 (ref), result (copy), math_random_ret (ref)
                        while u84 do
                            u33.modules.killTrackDisplayDecal(result, string.rep(tostring(math_random_ret), 6));
                            math_random_ret = math_random_ret + 1;

                            if math_random_ret > 9 then
                                math_random_ret = 0;
                            end;

                            task.wait(1);
                        end;
                    end);
                end;
            end;

            if u35.ChosenItem.SouvenirType then
                local success, result = pcall(function() -- Line: 736
                    -- upvalues: u33 (ref), u80 (copy), u35 (ref)
                    return u33.modules.addSouvenirSticker(u80, u35.ChosenItem.SouvenirType);
                end);

                if success and result then
                    for _, descendant in pairs(result:GetDescendants()) do
                        if descendant:IsA("BasePart") then
                            descendant.Anchored = true;
                        end;
                    end;
                end;
            end;
        end;

        p78.Parent = u33.frames.unboxFrame2;
        u33.vars.unboxFrameEffectMs[ChosenItem.Rarity] = require(u33.scDir.UnboxFrameEffects[ChosenItem.Rarity]);

        if u33.vars.unboxFrameEffectMs[ChosenItem.Rarity] then
            u33.vars.unboxFrameEffectMs[ChosenItem.Rarity](p78.EffectFrame, ChosenItem.Rarity, u33.config, u37);
        end;

        p78.Visible = true;
        p78.MiddleColor.ImageLabel.ImageTransparency = 1;
        u33.Services.TS:Create(BlurEffect, TweenInfo_new_ret, {
            Size = 30
        }):Play();
        u33.Services.TS:Create(Frame, TweenInfo_new_ret, {
            BackgroundTransparency = 0.35
        }):Play();
        u33.Services.TS:Create(p78.MiddleColor.ImageLabel, TweenInfo_new_ret, {
            ImageTransparency = 0
        }):Play();
    end;

    local success, result = pcall(function() -- Line: 268
        -- upvalues: u33 (copy)
        local v88 = {
            u33.frames.mainFrame,
            u33.GUI.StoreFrame,
            u33.GUI.StatsFrame,
            u33.GUI.LevelFrame,
            u33.GUI.SettingsFrame,
            u33.GUI.NotificationFrame
        };
        u33.vars.activeCaseUnbox.NonVisibleUIs = {};

        for _, v in pairs(v88) do
            if v.Visible then
                table.insert(u33.vars.activeCaseUnbox.NonVisibleUIs, v);
            end;
        end;

        for _, child in pairs(u33.plr.PlayerGui:GetChildren()) do
            if child:IsA("ScreenGui") and (child.ResetOnSpawn and child.Enabled) then
                table.insert(u33.vars.activeCaseUnbox.NonVisibleUIs, child);
            end;
        end;

        for _, v in pairs(u33.vars.activeCaseUnbox.NonVisibleUIs) do
            if v:IsA("Frame") then
                v.Visible = false;
            elseif v:IsA("ScreenGui") then
                v.Enabled = false;
            end;
        end;

        if u33.plr and u33.plr.Character then
            u33.plr.Character.Humanoid:UnequipTools();
            u33.vars.activeCaseUnbox.BBB = _G.AffectChar("B", 15);
        end;
    end);

    if not success then
        warn("HideUisError:", result);
    end;

    u33.frames.unboxFrame2.Visible = false;
    local u89 = u33.scDir.UnboxTemplate:Clone();
    u89.Visible = false;

    function u33.vars.activeCaseUnbox.Destroy() -- Line: 773
        -- upvalues: u36 (ref), u33 (copy), BlurEffect (copy), Frame (copy), u89 (copy)
        if not u36 then
            return;
        end;

        u33.vars.busy2 = false;
        u36 = false;
        u33.frames.unboxFrame2.Visible = false;

        if u33.vars.activeCaseUnbox.spinFrame and u33.vars.activeCaseUnbox.spinFrame.Parent then
            u33.vars.activeCaseUnbox.spinFrame:Destroy();
        end;

        for _, v in pairs(u33.vars.activeCaseUnbox.NonVisibleUIs) do
            if v:IsA("Frame") then
                v.Visible = true;
            elseif v:IsA("ScreenGui") then
                v.Enabled = true;
            end;
        end;

        if u33.vars.activeCaseUnbox.BBB and u33.vars.activeCaseUnbox.BBB.Parent then
            u33.vars.activeCaseUnbox.BBB:Destroy();
        end;

        game.Debris:AddItem(BlurEffect, 2);
        game.Debris:AddItem(Frame, 1);
        Frame:Destroy();
        u33.Services.TS:Create(BlurEffect, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
            Size = 0
        }):Play();

        if u89 and u89.Parent then
            u89:Destroy();
        end;
    end;

    u33.frames.unboxFrame2.Visible = false;
    local ItemStats = u33.systems.Main.GetItemStats(u33, ChosenItem.ItemName, ChosenItem.SkinClass);
    local u90, u91 = u33.systems.UI.AddToViewportFrame(u33, ChosenItem, u89.ViewportFrame, "unboxitem", true);
    u89.Visible = false;
    u89.Parent = u33.frames.unboxFrame2;
    (function() -- Line: 818, Name: PreloadSetUp
        -- upvalues: u90 (copy), u33 (copy), ChosenItem (copy), u35 (copy), DoPreloadWait (copy), u91 (copy)
        local v92 = {};

        if u90 then
            table.insert(v92, u90);
        end;

        local UnboxStuff = u33.plr.PlayerGui:FindFirstChild("UnboxStuff");

        if UnboxStuff then
            UnboxStuff = UnboxStuff:FindFirstChild(ChosenItem.ItemName .. "_" .. ChosenItem.DisplayName);
        end;

        if UnboxStuff then
            UnboxStuff = UnboxStuff:FindFirstChildOfClass("SurfaceAppearance");
        end;

        if UnboxStuff then
            table.insert(v92, UnboxStuff:Clone());
        end;

        local v93 = {};

        for _, v in pairs(u35.CaseData.Contents) do
            if v.TextureID and not v93[v.TextureID] then
                v93[v.TextureID] = true;
                local Decal = Instance.new("Decal");
                Decal.Texture = "rbxassetid://" .. tostring(v.TextureID);
                Decal.Parent = u90;
                table.insert(v92, Decal);
            end;
        end;

        table.insert(v92, u33.vars.activeCaseUnbox.spinFrame);
        table.insert(v92, u33.cosmeticsF.CaseAnims[u35.CaseData.ItemName or "DefaultCase"]);
        DoPreloadWait(v92);

        if u90 and u90.Parent then
            u90:Destroy();
        end;

        if u91 and u91.Parent then
            u91:Destroy();
        end;
    end)();
    BlurEffect.Parent = workspace.CurrentCamera;
    Frame.Parent = u33.frames.unboxFrame;
    u33.Services.TS:Create(BlurEffect, TweenInfo_new_ret, {
        Size = 15
    }):Play();
    u33.Services.TS:Create(Frame, TweenInfo_new_ret, {
        BackgroundTransparency = 0.5
    }):Play();
    u33.frames.unboxFrame.Visible = true;
    CaseAnimation();
    StartSpin();

    if u36 then
        u33.frames.unboxFrame2.Visible = true;
        local v94, v95 = u33.systems.UI.AddToViewportFrame(u33, ChosenItem, u89.ViewportFrame, "unboxitem");
        FullUnbox(u89, ItemStats, v94, v95);
    end;
end;

return v1;
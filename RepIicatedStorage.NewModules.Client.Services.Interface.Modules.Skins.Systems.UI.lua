-- ============================================================
-- SCRIPT: UI
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface.Modules.Skins.Systems.UI
-- ============================================================

-- Decompiled with Potassium's decompiler.

local u1 = {};
local TweenService = game:GetService("TweenService");
local TweenInfo_new_ret = TweenInfo.new(0.15, Enum.EasingStyle.Cubic, Enum.EasingDirection.In);

function u1.new(u2) -- Line: 7
    function _G.IsSkinTradeActive() -- Line: 8
        -- upvalues: u2 (copy)
        return u2.activeTrade ~= nil;
    end;

    u2.frames = {};
    u2.frames.mainFrame = u2.GUI:WaitForChild("SkinsFrame");
    u2.frames.mainFrame2 = u2.frames.mainFrame.MainFrame;
    u2.frames.topBar = u2.frames.mainFrame.TopBar;
    u2.frames.closeButton = u2.frames.topBar.CloseButton;
    u2.frames.casesFrame = u2.frames.mainFrame2.CasesFrame;
    u2.frames.skinsFrame = u2.frames.mainFrame2.SkinsFrame;
    u2.frames.noDataSFrame = u2.frames.mainFrame2.NoDataSavingFrame;
    u2.frames.casesButton = u2.frames.mainFrame2.CasesButton;
    u2.frames.skinsButton = u2.frames.mainFrame2.SkinsButton;
    u2.frames.listFrames = {
        Guns = u2.frames.skinsFrame.ListFrame.Frame.GunsFrame,
        Cases = u2.frames.casesFrame.ListFrame.Frame
    };
    u2.frames.unboxFrame = u2.GUI.UnboxFrame;
    u2.frames.unboxFrame2 = u2.frames.unboxFrame.UnboxFrame2;
    u2.frames.massSellButton = u2.frames.skinsFrame.ButtonFrames2.MassSellButton;
    u2.frames.sellSelectedButton = u2.frames.skinsFrame.ButtonFrames2.SellSelectedButton;
    u2.frames.selectCountLabel = u2.frames.skinsFrame.ButtonFrames2.SelectCountLabel;
    u2.frames.lockModeButton = u2.frames.skinsFrame.ButtonFrames2.LockModeButton;
    u2.frames.lockSelectedButton = u2.frames.skinsFrame.ButtonFrames2.LockSelectedButton;
    u2.frames.addSlotsButton = u2.frames.topBar.Frame.AddSlotsButton;
    u2.frames.slotsFrame = u2.frames.topBar.Frame.SlotFrame;
    u2.frames.purchaseFrame = u2.frames.mainFrame2.PurchaseFrames;
    u2.frames.inventorySellValueFrame = u2.frames.skinsFrame.InventorySellValueFrame;
    u2.frames.ivSVF_TextLabel = u2.frames.inventorySellValueFrame.TextLabel;
    u2.frames.ivSVF_OpenButton = u2.frames.inventorySellValueFrame.ToggleButtons.OpenButton;
    u2.frames.ivSVF_CloseButton = u2.frames.inventorySellValueFrame.ToggleButtons.CloseButton;
    u2.frames.ivSVF_HelpFrame = u2.frames.skinsFrame.InventorySellValueExplained;
    u2.frames.sortTypeFrame = u2.frames.skinsFrame.TypeFrame;
    u2.frames.sortTypeButton = u2.frames.skinsFrame.ButtonFrames3.TypeButton;
    u2.frames.searchButtonFrame = u2.frames.skinsFrame.ButtonFrames3.SearchButtonFrame;
    u2.frames.searchbarFrame = u2.frames.skinsFrame.ButtonFrames3.SearchbarFrame;
    u2.vars.sortType = 1;
    u2.frames.uiGrids = {};
    u2.vars.unboxFrameEffectMs = {};

    for _, child in pairs(u2.scDir.UnboxFrameEffects:GetChildren()) do
        u2.vars.unboxFrameEffectMs[child.Name] = require(child);
    end;

    for _, descendant in pairs(u2.frames.mainFrame:GetDescendants()) do
        if descendant.ClassName == "UIGridLayout" then
            table.insert(u2.frames.uiGrids, descendant);
        end;
    end;

    u2.frames.adminOutputFrame = u2.frames.mainFrame2.AdminOutputFrame;

    return u2;
end;

function u1.Connections(u3) -- Line: 77
    -- upvalues: u1 (copy)
    local function PurchaseFrames() -- Line: 338
        -- upvalues: u3 (copy), u1 (ref)
        for _, descendant in pairs(u3.frames.purchaseFrame:GetDescendants()) do
            if descendant:IsA("TextButton") then
                descendant.MouseEnter:Connect(function() -- Line: 341
                    -- upvalues: u3 (ref)
                    u3.uiSoundsF.hover:Play();
                end);

                if descendant.Name == "CloseButton" then
                    descendant.MouseButton1Click:Connect(function() -- Line: 346
                        -- upvalues: u3 (ref)
                        u3.uiSoundsF.click:Play();
                        u3.vars.activeSellData = nil;
                        u3.frames.purchaseFrame.Visible = false;
                    end);
                elseif descendant.Name == "TextButton" and descendant.Parent.Name == "SellFrame" then
                    descendant.MouseButton1Click:Connect(function() -- Line: 352
                        -- upvalues: u3 (ref), u1 (ref)
                        if u3.vars.tradeRequestsTabOpen then
                            return;
                        end;

                        if u3.vars.activeSellData then
                            if u3.vars.busy3 then
                                return;
                            end;

                            u3.vars.busy3 = true;
                            local v4 = u3.events.cosmeticsInteract:InvokeServer("DoFullSell", u3.vars.activeSellData[1], u3.vars.activeSellData[2]);
                            u3.vars.busy3 = false;
                            u3.vars.activeSellData = nil;
                            u3.frames.purchaseFrame.Visible = false;

                            if v4 then
                                u3.vars.activeSellData = nil;

                                if u3.vars.inMassSellMode then
                                    u3.frames.sellSelectedButton.Visible = false;
                                    u3.frames.lockSelectedButton.Visible = false;
                                    u1.MassSellMode(u3, false, true);
                                    u1.LockMode(u3, false, true);
                                    u1.ToggleISVHelp(u3, false);
                                    u1.ToggleSortType(u3, false);
                                    u1.ToggleSearchBar(u3, false);
                                end;

                                u3.systems.Main.UpdateInventory(u3);
                            end;
                        end;
                    end);
                end;
            end;
        end;
    end;

    local function Other() -- Line: 388
        -- upvalues: u3 (copy), u1 (ref)
        u3.events.caseUnboxEffect.OnClientEvent:Connect(function(...) -- Line: 389
            -- upvalues: u3 (ref)
            u3.systems.Skins.UnboxEffect(u3, ...);
        end);
        u3.events.cosmeticAdminV.OnClientEvent:Connect(function(p5) -- Line: 393
            -- upvalues: u1 (ref), u3 (ref)
            u1.EnterAdminViewMode(u3, true, p5);
        end);
        u3.events2F.ToggleSkinsUI.Event:Connect(function(...) -- Line: 397
            -- upvalues: u1 (ref), u3 (ref)
            u1.ToggleGUI(u3, ...);
        end);
    end;

    (function() -- Line: 80, Name: TopBar
        -- upvalues: u3 (copy), u1 (ref)
        u3.frames.closeButton.MouseEnter:Connect(function() -- Line: 81
            -- upvalues: u3 (ref)
            u3.uiSoundsF.hover:Play();
        end);
        u3.frames.closeButton.MouseButton1Click:Connect(function() -- Line: 84
            -- upvalues: u3 (ref), u1 (ref)
            if u3.vars.busy or u3.vars.busy2 then
                return;
            end;

            u3.uiSoundsF.click:Play();
            u1.ToggleGUI(u3, false);
        end);
        u3.Services.UIS.InputBegan:Connect(function(p6, p7) -- Line: 92
            -- upvalues: u3 (ref), u1 (ref)
            if p6.KeyCode == Enum.KeyCode.ButtonY and (not p7 and u3.vars.open) then
                u1.ToggleGUI(u3, false);
            end;
        end);
        u3.frames.skinsButton.MouseEnter:Connect(function() -- Line: 102
            -- upvalues: u3 (ref)
            u3.uiSoundsF.hover:Play();
        end);
        u3.frames.casesButton.MouseEnter:Connect(function() -- Line: 103
            -- upvalues: u3 (ref)
            u3.uiSoundsF.hover:Play();
        end);
        u3.frames.skinsButton.MouseButton1Click:Connect(function() -- Line: 105
            -- upvalues: u3 (ref), u1 (ref)
            if u3.vars.currentTab ~= 2 then
                u3.uiSoundsF.click:Play();
                u1.ViewTab(u3, 2);
            end;
        end);
        u3.frames.casesButton.MouseButton1Click:Connect(function() -- Line: 112
            -- upvalues: u3 (ref), u1 (ref)
            if u3.vars.currentTab ~= 1 then
                u3.uiSoundsF.click:Play();
                u1.ViewTab(u3, 1);
            end;
        end);
        u3.frames.massSellButton.MouseEnter:Connect(function() -- Line: 122
            -- upvalues: u3 (ref)
            u3.uiSoundsF.hover:Play();
        end);
        u3.frames.sellSelectedButton.MouseEnter:Connect(function() -- Line: 123
            -- upvalues: u3 (ref)
            u3.uiSoundsF.hover:Play();
        end);
        u3.frames.lockModeButton.MouseEnter:Connect(function() -- Line: 125
            -- upvalues: u3 (ref)
            u3.uiSoundsF.hover:Play();
        end);
        u3.frames.lockSelectedButton.MouseEnter:Connect(function() -- Line: 126
            -- upvalues: u3 (ref)
            u3.uiSoundsF.hover:Play();
        end);
        u3.frames.massSellButton.MouseButton1Click:Connect(function() -- Line: 128
            -- upvalues: u3 (ref), u1 (ref)
            if u3.vars.busy or (u3.vars.busy2 or u3.vars.busy3) then
                return;
            end;

            if u3.frames.purchaseFrame.Visible then
                return;
            end;

            if u3.vars.tradeRequestsTabOpen then
                return;
            end;

            if u3.activeTrade then
                return;
            end;

            u3.uiSoundsF.click:Play();

            if not u3.vars.inMassSellMode then
                u1.MassSellMode(u3, true);

                return;
            end;

            u1.LockMode(u3, false);
            u1.MassSellMode(u3, false);
            u1.ToggleISVHelp(u3, false);
        end);
        u3.frames.lockModeButton.MouseButton1Click:Connect(function() -- Line: 148
            -- upvalues: u3 (ref), u1 (ref)
            if u3.vars.busy or (u3.vars.busy2 or u3.vars.busy3) then
                return;
            end;

            if u3.frames.purchaseFrame.Visible then
                return;
            end;

            if u3.vars.tradeRequestsTabOpen then
                return;
            end;

            if u3.activeTrade then
                return;
            end;

            u3.uiSoundsF.click:Play();

            if not u3.vars.inLockMode then
                u1.LockMode(u3, true);

                return;
            end;

            u1.LockMode(u3, false);
            u1.MassSellMode(u3, false);
            u1.ToggleISVHelp(u3, false);
        end);
        u3.frames.sellSelectedButton.MouseButton1Click:Connect(function() -- Line: 168
            -- upvalues: u3 (ref)
            if u3.vars.busy or (u3.vars.busy2 or u3.vars.busy3) then
                return;
            end;

            if u3.frames.purchaseFrame.Visible then
                return;
            end;

            if u3.vars.tradeRequestsTabOpen then
                return;
            end;

            if u3.activeTrade then
                return;
            end;

            u3.uiSoundsF.click:Play();
            local v8 = {};

            for i, _ in pairs(u3.vars.massSellSelected) do
                table.insert(v8, i);
            end;

            u3.systems.Skins.AttemptSellSkin(u3, "skin", v8);
        end);
        u3.frames.lockSelectedButton.MouseButton1Click:Connect(function() -- Line: 189
            -- upvalues: u3 (ref), u1 (ref)
            if u3.vars.busy or (u3.vars.busy2 or u3.vars.busy3) then
                return;
            end;

            if u3.frames.purchaseFrame.Visible then
                return;
            end;

            if u3.vars.tradeRequestsTabOpen then
                return;
            end;

            if u3.activeTrade then
                return;
            end;

            u3.uiSoundsF.click:Play();
            local v9 = {};

            for i, _ in pairs(u3.vars.lockSelectedList) do
                table.insert(v9, i);
            end;

            u3.systems.Skins.LockSkins(u3, v9);
            u1.LockMode(u3, false, true);
            u3.uiSoundsF.click:Play();
        end);
        u3.frames.addSlotsButton.MouseEnter:Connect(function() -- Line: 215
            -- upvalues: u3 (ref)
            u3.uiSoundsF.hover:Play();
        end);
        u3.frames.addSlotsButton.MouseButton1Click:Connect(function() -- Line: 217
            -- upvalues: u3 (ref), u1 (ref)
            if u3.vars.busy or (u3.vars.busy2 or u3.vars.busy3) then
                return;
            end;

            if u3.frames.purchaseFrame.Visible then
                return;
            end;

            u3.uiSoundsF.click:Play();

            if _G.PromptGamepass("CosmeticSlots1") then
                u3.frames.addSlotsButton.Visible = false;
                u1.UpdateSlots(u3);
                task.delay(0.5, function() -- Line: 229
                    -- upvalues: u1 (ref), u3 (ref)
                    u1.UpdateSlots(u3);
                end);
            end;
        end);
        u3.frames.sortTypeButton.MouseEnter:Connect(function() -- Line: 237
            -- upvalues: u3 (ref)
            u3.uiSoundsF.hover:Play();
        end);
        u3.frames.sortTypeButton.MouseButton1Click:Connect(function() -- Line: 238
            -- upvalues: u3 (ref), u1 (ref)
            if u3.vars.busy or (u3.vars.busy2 or u3.vars.busy3) then
                return;
            end;

            if u3.frames.purchaseFrame.Visible then
                return;
            end;

            if u3.vars.tradeRequestsTabOpen then
                return;
            end;

            if u3.activeTrade then
                return;
            end;

            u3.uiSoundsF.click:Play();
            u1.ToggleSortType(u3);
        end);
        u3.frames.sortTypeFrame["1_Button"].MouseEnter:Connect(function() -- Line: 247
            -- upvalues: u3 (ref)
            u3.uiSoundsF.hover:Play();
        end);
        u3.frames.sortTypeFrame["1_Button"].MouseButton1Click:Connect(function() -- Line: 248
            -- upvalues: u3 (ref), u1 (ref)
            if u3.vars.busy or (u3.vars.busy2 or u3.vars.busy3) then
                return;
            end;

            if u3.frames.purchaseFrame.Visible then
                return;
            end;

            if u3.vars.tradeRequestsTabOpen then
                return;
            end;

            if u3.activeTrade then
                return;
            end;

            u3.uiSoundsF.click:Play();
            u1.SwitchSortType(u3, 1);
            u1.ToggleSortType(u3, false);
        end);
        u3.frames.sortTypeFrame["2_Button"].MouseEnter:Connect(function() -- Line: 258
            -- upvalues: u3 (ref)
            u3.uiSoundsF.hover:Play();
        end);
        u3.frames.sortTypeFrame["2_Button"].MouseButton1Click:Connect(function() -- Line: 259
            -- upvalues: u3 (ref), u1 (ref)
            if u3.vars.busy or (u3.vars.busy2 or u3.vars.busy3) then
                return;
            end;

            if u3.frames.purchaseFrame.Visible then
                return;
            end;

            if u3.vars.tradeRequestsTabOpen then
                return;
            end;

            if u3.activeTrade then
                return;
            end;

            u3.uiSoundsF.click:Play();
            u1.SwitchSortType(u3, 2);
            u1.ToggleSortType(u3, false);
        end);
        u3.frames.sortTypeFrame["3_Button"].MouseEnter:Connect(function() -- Line: 269
            -- upvalues: u3 (ref)
            u3.uiSoundsF.hover:Play();
        end);
        u3.frames.sortTypeFrame["3_Button"].MouseButton1Click:Connect(function() -- Line: 270
            -- upvalues: u3 (ref), u1 (ref)
            if u3.vars.busy or (u3.vars.busy2 or u3.vars.busy3) then
                return;
            end;

            if u3.frames.purchaseFrame.Visible then
                return;
            end;

            if u3.vars.tradeRequestsTabOpen then
                return;
            end;

            if u3.activeTrade then
                return;
            end;

            u3.uiSoundsF.click:Play();
            u1.SwitchSortType(u3, 3);
            u1.ToggleSortType(u3, false);
        end);
        u3.frames.sortTypeFrame["4_Button"].MouseEnter:Connect(function() -- Line: 280
            -- upvalues: u3 (ref)
            u3.uiSoundsF.hover:Play();
        end);
        u3.frames.sortTypeFrame["4_Button"].MouseButton1Click:Connect(function() -- Line: 281
            -- upvalues: u3 (ref), u1 (ref)
            if u3.vars.busy or (u3.vars.busy2 or u3.vars.busy3) then
                return;
            end;

            if u3.frames.purchaseFrame.Visible then
                return;
            end;

            if u3.vars.tradeRequestsTabOpen then
                return;
            end;

            if u3.activeTrade then
                return;
            end;

            u3.uiSoundsF.click:Play();
            u1.SwitchSortType(u3, 4);
            u1.ToggleSortType(u3, false);
        end);
        u3.frames.searchButtonFrame.ImageButton.MouseEnter:Connect(function() -- Line: 292
            -- upvalues: u3 (ref)
            u3.uiSoundsF.hover:Play();
        end);
        u3.frames.searchButtonFrame.ImageButton.MouseButton1Click:Connect(function() -- Line: 293
            -- upvalues: u3 (ref), u1 (ref)
            if u3.vars.busy or (u3.vars.busy2 or u3.vars.busy3) then
                return;
            end;

            if u3.frames.purchaseFrame.Visible then
                return;
            end;

            if u3.vars.tradeRequestsTabOpen then
                return;
            end;

            if u3.activeTrade then
                return;
            end;

            u3.uiSoundsF.click:Play();
            u1.ToggleSearchBar(u3);
        end);
        u3.frames.ivSVF_OpenButton.MouseButton1Click:Connect(function() -- Line: 303
            -- upvalues: u3 (ref), u1 (ref)
            if u3.vars.busy or (u3.vars.busy2 or u3.vars.busy3) then
                return;
            end;

            if u3.frames.purchaseFrame.Visible then
                return;
            end;

            u3.uiSoundsF.click:Play();
            u1.ToggleISVHelp(u3, true);
        end);
        u3.frames.ivSVF_CloseButton.MouseButton1Click:Connect(function() -- Line: 314
            -- upvalues: u3 (ref), u1 (ref)
            u3.uiSoundsF.click:Play();
            u1.ToggleISVHelp(u3, false);
        end);
        u3.frames.topBar.ViewFrame.CloseButton.MouseButton1Click:Connect(function() -- Line: 322
            -- upvalues: u3 (ref), u1 (ref)
            u3.uiSoundsF.click:Play();
            u1.EnterAdminViewMode(u3, false);
        end);

        local function UpdateAdminOutput() -- Line: 330
            -- upvalues: u3 (ref)
            u3.frames.adminOutputFrame.TextBox.Text = u3.vars.adminOutput or "";
        end;

        u3.frames.adminOutputFrame.TextBox:GetPropertyChangedSignal("Text"):Connect(UpdateAdminOutput);
        u3.frames.adminOutputFrame:GetPropertyChangedSignal("Visible"):Connect(UpdateAdminOutput);
    end)();
    PurchaseFrames();
    Other();
end;

function u1.ApplyUISSpin(u10, p11, u12) -- Line: 407
    local CFrame_new_ret = CFrame.new();
    local CFrameValue = Instance.new("CFrameValue");
    local u13 = {};
    local u14 = nil;
    local u15 = {};
    local u16 = nil;

    if u12 then
        table.insert(u13, CFrameValue.Changed:Connect(function() -- Line: 421
            -- upvalues: u12 (copy), CFrameValue (copy)
            u12(CFrameValue.Value);
        end));
    end;

    table.insert(u13, u10.Services.UIS.InputChanged:Connect(function(p17, p18) -- Line: 426
        -- upvalues: u15 (copy), u10 (copy), u16 (ref), CFrame_new_ret (ref), u14 (ref), CFrameValue (copy)
        local v19;

        if p17.KeyCode == Enum.KeyCode.Thumbstick2 then
            v19 = p17.UserInputType == Enum.UserInputType.Gamepad1;
        else
            v19 = false;
        end;

        if (v19 or (p17.UserInputType == Enum.UserInputType.MouseMovement or p17.UserInputType == Enum.UserInputType.Touch)) and u15.MouseButton1 then
            local v20, v21;

            if v19 then
                v20 = Vector2.new(p17.Position.X, p17.Position.Y);
                v21 = {
                    Y = 0,
                    X = p17.Position.X * 5
                };
            else
                v20 = Vector2.new(u10.mouse.X, u10.mouse.Y);
                v21 = (v20 - u16) / 5;
            end;

            CFrame_new_ret = CFrame_new_ret * CFrame.Angles(0, math.rad(v21.X), 0);

            if u14 then
                u14:Cancel();
            end;

            u14 = u10.Services.TS:Create(CFrameValue, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Value = CFrame_new_ret
            }):Play();
            u16 = v20;
        end;
    end));
    table.insert(u13, u10.Services.UIS.InputBegan:Connect(function(p22, p23) -- Line: 467
        -- upvalues: u16 (ref), u10 (copy), u15 (copy)
        if p22.UserInputType == Enum.UserInputType.MouseButton1 or (p22.KeyCode == Enum.KeyCode.ButtonR2 or p22.UserInputType == Enum.UserInputType.Touch and p22.UserInputState == Enum.UserInputState.Begin) then
            u16 = Vector2.new(u10.mouse.X, u10.mouse.Y);
            u15.MouseButton1 = true;
        end;
    end));
    table.insert(u13, u10.Services.UIS.InputEnded:Connect(function(p24, p25) -- Line: 476
        -- upvalues: u15 (copy), u16 (ref), u14 (ref), u10 (copy), CFrameValue (copy)
        if p24.UserInputType == Enum.UserInputType.MouseButton1 or (p24.KeyCode == Enum.KeyCode.ButtonR2 or p24.UserInputType == Enum.UserInputType.Touch) then
            u15.MouseButton1 = nil;
            u16 = nil;

            if u14 then
                u14:Cancel();
            end;

            u14 = u10.Services.TS:Create(CFrameValue, TweenInfo.new(2.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Value = CFrame.new()
            }):Play();
        end;
    end));
    local u26 = nil;
    u26 = p11.AncestryChanged:Connect(function(p27, p28) -- Line: 490
        -- upvalues: u26 (ref), u13 (copy)
        if not p28 then
            u26:Disconnect();

            for _, v in pairs(u13) do
                pcall(function() -- Line: 494
                    -- upvalues: v (copy)
                    v:Disconnect();
                end);
            end;
        end;
    end);

    return true;
end;

function u1.SetKillText(p29, p30, p31) -- Line: 504
    p30.Kills.Text = `KOs: {p31}`;
end;

function u1.ToggleBuffer(p32, u33, p34) -- Line: 508
    if not p34 then
        if u33 and u33.Parent then
            u33:SetAttribute("Buffering", nil);

            if u33:FindFirstChild("Buffer") then
                u33.Buffer.Visible = false;
            end;
        end;

        return;
    end;

    u33:SetAttribute("Buffering", true);
    local Buffer = u33.Buffer;
    Buffer.Visible = true;
    local u35 = nil;
    u35 = Buffer.AncestryChanged:Connect(function(p36, p37) -- Line: 516
        -- upvalues: u35 (ref)
        if not p37 then
            u35:Disconnect();
            u35 = nil;
        end;
    end);
    task.spawn(function() -- Line: 523
        -- upvalues: u35 (ref), u33 (copy), Buffer (copy)
        while u35 and (u33 and (u33.Parent and u33:GetAttribute("Buffering"))) do
            local Buffer2 = u33.Buffer;
            Buffer2.Rotation = Buffer2.Rotation + 1;
            task.wait();
        end;

        if u35 then
            u35:Disconnect();
            u35 = nil;
        end;

        if Buffer and Buffer.Parent then
            Buffer.Visible = false;
        end;
    end);
end;

function u1.CosmeticFrameHoverStuff(p38, u39) -- Line: 544
    -- upvalues: TweenService (copy), TweenInfo_new_ret (copy)
    local function hover(p40, p41) -- Line: 545
        -- upvalues: TweenService (ref), TweenInfo_new_ret (ref), u39 (copy)
        if p41 then
            TweenService:Create(p40, TweenInfo_new_ret, {
                ImageTransparency = 1
            }):Play();
            TweenService:Create(u39.Kills, TweenInfo_new_ret, {
                TextStrokeTransparency = 0.5,
                TextTransparency = 0
            }):Play();

            return;
        end;

        TweenService:Create(p40, TweenInfo_new_ret, {
            ImageTransparency = 0
        }):Play();
        TweenService:Create(u39.Kills, TweenInfo_new_ret, {
            TextStrokeTransparency = 1,
            TextTransparency = 1
        }):Play();
    end;

    u39.KilltrackIcon.MouseEnter:Connect(function() -- Line: 565
        -- upvalues: u39 (copy), TweenService (ref), TweenInfo_new_ret (ref)
        if u39.KilltrackIcon.Visible then
            TweenService:Create(u39.KilltrackIcon, TweenInfo_new_ret, {
                ImageTransparency = 1
            }):Play();
            TweenService:Create(u39.Kills, TweenInfo_new_ret, {
                TextStrokeTransparency = 0.5,
                TextTransparency = 0
            }):Play();
        end;
    end);
    u39.KilltrackIcon.MouseLeave:Connect(function() -- Line: 571
        -- upvalues: u39 (copy), TweenService (ref), TweenInfo_new_ret (ref)
        if u39.KilltrackIcon.Visible then
            TweenService:Create(u39.KilltrackIcon, TweenInfo_new_ret, {
                ImageTransparency = 0
            }):Play();
            TweenService:Create(u39.Kills, TweenInfo_new_ret, {
                TextStrokeTransparency = 1,
                TextTransparency = 1
            }):Play();
        end;
    end);
    u39.SouvenirIcon.MouseEnter:Connect(function() -- Line: 577
        -- upvalues: u39 (copy), TweenService (ref), TweenInfo_new_ret (ref)
        if u39.SouvenirIcon.Visible then
            TweenService:Create(u39.SouvenirIcon, TweenInfo_new_ret, {
                ImageTransparency = 1
            }):Play();
            TweenService:Create(u39.Kills, TweenInfo_new_ret, {
                TextStrokeTransparency = 0.5,
                TextTransparency = 0
            }):Play();
        end;
    end);
    u39.SouvenirIcon.MouseLeave:Connect(function() -- Line: 583
        -- upvalues: u39 (copy), TweenService (ref), TweenInfo_new_ret (ref)
        if u39.SouvenirIcon.Visible then
            TweenService:Create(u39.SouvenirIcon, TweenInfo_new_ret, {
                ImageTransparency = 0
            }):Play();
            TweenService:Create(u39.Kills, TweenInfo_new_ret, {
                TextStrokeTransparency = 1,
                TextTransparency = 1
            }):Play();
        end;
    end);
end;

function u1.CreateCosmeticFrame(u42, u43, u44, u45, p46) -- Line: 590
    -- upvalues: u1 (copy)
    local u47 = u42.scDir.SkinTemplate:Clone();
    local ViewportFrame = u47.ViewportFrame;
    ViewportFrame.LightColor = Color3.fromRGB(350, 350, 350);
    local RarityBand = u47.RarityBand;

    if u44.TotalKills then
        u42.systems.UI:SetKillText(u47, u44.TotalKills);
    end;

    if u45 == "skin" then
        if not u44.ItemDisplayName then
            u44.ItemDisplayName = u42.systems.Main.GetItemStats(u42, u44.ItemName, u44.SkinClass).DisplayName.Value;
        end;

        if u44.Serial then
            u47.Serial.Text = `#{u44.Serial}`;
        else
            u47.Serial.Text = "#N/A";
        end;

        if u44.Killtrack then
            u47.KilltrackIcon.Visible = true;
        else
            u47.KilltrackIcon.Visible = false;
        end;

        if u44.SouvenirType then
            u47.SouvenirIcon.Visible = true;
            u47.Kills.Text = u42.modules.souvenirLabels[u44.SouvenirType] or u44.SouvenirType;
            u47.Kills.TextColor3 = Color3.fromRGB(255, 230, 138);
        else
            u47.SouvenirIcon.Visible = false;
        end;
    end;

    if u44.ItemDisplayName then
        if u44.CustomName then
            u47.ItemType.Text = `{u44.ItemDisplayName} [{u44.CustomName}]`;
        else
            u47.ItemType.Text = u44.ItemDisplayName;
        end;
    else
        u47.ItemType.Text = "N/A";
    end;

    if u44.Killtrack then
        u47.ItemType.Text = "KILLTRACK™ " .. u47.ItemType.Text;
    elseif u44.SouvenirType then
        u47.ItemType.Text = "Souvenir " .. u47.ItemType.Text;
    end;

    if u45 == "case" then
        u47.ItemType.Text = u44.DisplayName or "?";
        u47.SkinName.Text = "";

        if string.len(u47.ItemType.Text) > 19 then
            u47.ItemType.Size = UDim2.new(u47.ItemType.Size.X.Scale, 0, 0.25, 0);
        end;
    else
        u47.SkinName.Text = u44.DisplayName or "?";
    end;

    u47:SetAttribute("SkinName", u47.SkinName.Text);
    local Odds = u47:FindFirstChild("Odds");

    if Odds then
        if u44.Odds then
            local Odds2 = u44.Odds;
            local v48;

            if Odds2 > 0 and Odds2 < 1 then
                local v49 = -math.log10(Odds2);
                v48 = math.floor(v49) + 4;
            else
                v48 = 4;
            end;

            local v50 = 10 ^ v48;
            local v51 = math.floor(Odds2 * v50 + 0.5) / v50;
            local v52 = string.format("%." .. v48 .. "f", v51):gsub("0+$", ""):gsub("%.$", "");
            local _ = math.abs(v51 - Odds2) > 1e-12;
            local v53 = "";
            local v54 = v52:find(".", 1, true);

            if Odds2 < 0.1 and v54 then
                local v55 = v52:sub(v54 + 1):find("[1-9]");

                if v55 and #v52:sub(v54 + v55 + 1) >= 2 then
                    Odds.RichText = true;
                    Odds.Text = v53 .. v52:sub(1, v54 + v55) .. "<font transparency=\"0.5\">" .. v52:sub(v54 + v55 + 1) .. "</font>%";
                else
                    Odds.RichText = false;
                    Odds.Text = v53 .. v52 .. "%";
                end;
            else
                Odds.RichText = false;
                Odds.Text = v53 .. v52 .. "%";
            end;
        else
            Odds.Text = "";
        end;

        Odds.Visible = false;
    end;

    local ButtonsFrame = u47.ButtonsFrame;

    if u44.Rarity then
        local v56 = u42.config.RarityBands[string.lower(u44.Rarity)];

        if v56 then
            RarityBand.BackgroundColor3 = v56;
        end;
    else
        RarityBand.BackgroundColor3 = u42.config.RarityBands.common;
    end;

    if p46 then
        u47.Hover.Visible = false;
        ButtonsFrame.SellButton.Visible = false;
    else
        u1.CosmeticFrameHoverStuff(u42, u47);
        u47.Hover.MouseEnter:Connect(function() -- Line: 716
            -- upvalues: u42 (copy), u47 (copy), u45 (copy), ButtonsFrame (copy), u44 (copy)
            u42.uiSoundsF.hover:Play();
            u47.BackgroundColor3 = Color3.fromRGB(180, 180, 180);
            u47.TradeLockedIcon.Visible = false;
            u47.TradeHoldButton.Visible = false;
            u47.TradeHoldIcon.Visible = false;

            if u45 == "skin" then
                ButtonsFrame.SellButton.Visible = true;
                ButtonsFrame.SellButton.TextLabel.Text = u44.Sellable and "SELL" or "DELETE";
                ButtonsFrame.SellButton.BackgroundColor3 = u44.Sellable and Color3.new(1, 1, 1) or Color3.new(1, 0, 0);
            end;
        end);
        u47.Hover.MouseLeave:Connect(function() -- Line: 731
            -- upvalues: u47 (copy), ButtonsFrame (copy)
            u47.BackgroundColor3 = Color3.fromRGB(154, 154, 154);

            if u47:GetAttribute("TradeLocked") and not u47:GetAttribute("TradeLockedHide") then
                u47.TradeLockedIcon.Visible = true;
            elseif u47:GetAttribute("TradeHold") then
                u47.TradeHoldButton.Visible = false;
                u47.TradeHoldIcon.Visible = true;
            end;

            if _G.InputType ~= 3 then
                ButtonsFrame.SellButton.Visible = false;
            end;
        end);

        if u45 == "skin" and _G.InputType == 3 then
            ButtonsFrame.SellButton.Visible = true;

            if u44.TradeHold then
                u47.TradeHoldIcon.Visible = true;
                u47.TradeHoldIcon.Position = UDim2.new(0.985, 0, 0.26, 0);
            end;
        end;

        ButtonsFrame.SellButton.MouseEnter:Connect(function() -- Line: 756
            -- upvalues: u42 (copy)
            u42.uiSoundsF.hover:Play();
        end);
        ButtonsFrame.SellButton.MouseButton1Click:Connect(function() -- Line: 760
            -- upvalues: u42 (copy), u45 (copy), u43 (copy), u44 (copy)
            if u42.vars.busy or (u42.vars.busy2 or u42.vars.busy3) then
                return;
            end;

            if u42.frames.purchaseFrame.Visible then
                return;
            end;

            u42.uiSoundsF.click:Play();
            u42.systems.Skins.AttemptSellSkin(u42, u45, { u43 }, u44);
        end);
        u47.Hover.MouseButton1Click:Connect(function() -- Line: 771
            -- upvalues: u42 (copy), u1 (ref), u47 (copy), u45 (copy), u43 (copy)
            if u42.vars.busy or u42.vars.busy2 then
                return;
            end;

            if u42.vars.adminViewInv then
                return;
            end;

            if u42.activeTrade or u42.vars.tradeRequestsTabOpen then
                return;
            end;

            u1.ToggleBuffer(u42, u47, true);
            local success, result = pcall(function() -- Line: 782
                -- upvalues: u45 (ref), u42 (ref), u43 (ref)
                if u45 == "skin" then
                    if u42.vars.inMassSellMode then
                        if not (u42.vars.busy3 or u42.vars.activeSellData) then
                            local v57 = 0;

                            for _, _ in pairs(u42.vars.massSellSelected) do
                                v57 = v57 + 1;
                            end;

                            if v57 < u42.config.MaxMassSelect or u42.vars.massSellSelected[u43] then
                                u42.uiSoundsF.click:Play();
                                u42.systems.Skins.ToggleMassSellSkin(u42, u43);
                            end;
                        end;
                    else
                        if not u42.vars.inLockMode then
                            u42.uiSoundsF.click:Play();
                            u42.systems.Skins.EquipSkin(u42, u43);

                            return;
                        end;

                        if not (u42.vars.busy3 or u42.vars.activeSellData) then
                            local v58 = 0;

                            for _, _ in pairs(u42.vars.lockSelectedList) do
                                v58 = v58 + 1;
                            end;

                            if v58 < u42.config.MaxMassSelect or u42.vars.lockSelectedList[u43] then
                                u42.uiSoundsF.click:Play();
                                u42.systems.Skins.ToggleLockSkin(u42, u43);
                            end;
                        end;
                    end;
                else
                    if u42.vars.inMassSellMode then
                        return;
                    end;

                    u42.uiSoundsF.click:Play();
                    u42.systems.Skins.OpenCase(u42, u43);
                end;
            end);
            u1.ToggleBuffer(u42, u47, false);

            if not success then
                warn("Hover Click error 539:", result);
            end;
        end);
    end;

    u47.Hover.MouseButton1Click:Connect(function() -- Line: 832
        -- upvalues: u42 (copy), u43 (copy)
        if not u42.vars.adminViewInv then
            return;
        end;

        u42.uiSoundsF.click:Play();
        u42.systems.UI.UpdateAdminOutput(u42, u43);
    end);

    if u42.vars.adminViewInv then
        u47.Hover.Visible = true;
        u1.CosmeticFrameHoverStuff(u42, u47);
    end;

    u42.systems.UI.AddToViewportFrame(u42, u44, ViewportFrame, u45 == "case" and "case" or false);

    return u47;
end;

function u1.UpdateAdminOutput(p59, p60) -- Line: 850
    p59.vars.adminOutput = tostring(p60);
    p59.frames.adminOutputFrame.TextBox.Text = p59.vars.adminOutput or "";
    p59.systems.Main.UpdateInventory(p59);
end;

function u1.CreateInventoryFrame(u61, p62, u63, u64, u65) -- Line: 856
    -- upvalues: u1 (copy)
    if p62 ~= "skin" then
        if p62 == "case" then
            local success, result = pcall(function() -- Line: 876
                -- upvalues: u61 (copy), u63 (copy), u64 (copy)
                return u61.systems.UI.CreateCosmeticFrame(u61, u63, u64, "case", u61.vars.adminViewInv);
            end);

            if success and result then
                result.Name = u63;

                if u64.GotTick then
                    result.LayoutOrder = -math.round(u64.GotTick);

                    return result;
                end;

                result.LayoutOrder = 1000000;

                return result;
            end;
        end;

        return;
    end;

    local success, result = pcall(function() -- Line: 858
        -- upvalues: u61 (copy), u63 (copy), u64 (copy), u65 (copy)
        return u61.systems.UI.CreateCosmeticFrame(u61, u63, u64, "skin", u61.vars.adminViewInv or u65);
    end);

    if success and result then
        result.Name = u63;

        if u64.CustomLayoutOrder then
            result.LayoutOrder = u64.CustomLayoutOrder;

            return result;
        end;

        u1.UpdateInventoryFrameSortType(u61, u61.vars.sortType, u63, u64, result);

        return result;
    end;

    warn("CreateCosmeticFrame1 Error:", result);
end;

function u1.ApplyPreviewMetadata(u66, p67, u68, p69) -- Line: 893
    local u70 = p67.ItemName .. "_" .. p67.DisplayName;
    local PlayerGui = u66.plr.PlayerGui;
    local u71 = p69 and "UnboxStuff" or "SkinPreviewStuff";
    local u72 = {};
    local u73 = nil;
    local u74 = nil;
    local u75 = nil;
    local u76 = {};
    local u77 = nil;
    local u78 = false;
    local u79 = true;
    local u80 = false;

    local function cleanup() -- Line: 907
        -- upvalues: u79 (ref), u72 (copy), u73 (ref), u74 (ref)
        u79 = false;

        for _, v in ipairs(u72) do
            v:Disconnect();
        end;

        if u73 then
            u73:Disconnect();
        end;

        if u74 then
            u74:Disconnect();
        end;
    end;

    local function applyMaterial(p81) -- Line: 913
        -- upvalues: u77 (ref), u76 (ref), u68 (copy)
        if not p81 or u77 == p81 then
            return;
        end;

        for _, v in ipairs(u76) do
            v:Destroy();
        end;

        u76 = {};
        u77 = p81;

        for _, descendant in ipairs(u68:GetDescendants()) do
            if descendant:IsA("MeshPart") and (descendant:GetAttribute("SATP") and not (descendant:GetAttribute("IgnorePBR") or descendant:GetAttribute("SATP2"))) then
                local v82 = p81:Clone();
                table.insert(u76, v82);
                v82.Parent = descendant;
            end;
        end;
    end;

    local u83 = nil;

    local function schedule() -- Line: 927
        -- upvalues: u79 (ref), u80 (ref), u83 (ref)
        if not u79 or u80 then
            return;
        end;

        u80 = true;
        task.defer(function() -- Line: 930
            -- upvalues: u80 (ref), u79 (ref), u83 (ref)
            u80 = false;

            if u79 then
                u83();
            end;
        end);
    end;

    u83 = function() -- Line: 935
        -- upvalues: u79 (ref), u78 (ref), PlayerGui (copy), u71 (copy), u70 (copy), u75 (ref), u73 (ref), schedule (copy), u66 (copy), applyMaterial (copy), u68 (copy), cleanup (copy)
        if not u79 or u78 then
            return;
        end;

        local v84 = PlayerGui:FindFirstChild(u71);

        if v84 then
            v84 = v84:FindFirstChild(u70);
        end;

        if v84 ~= u75 then
            if u73 then
                u73:Disconnect();
            end;

            u75 = v84;
            local v85;

            if v84 then
                v85 = v84:GetAttributeChangedSignal("PreviewDescendantCount"):Connect(schedule);
            else
                v85 = v84;
            end;

            u73 = v85;
        end;

        local v86;

        if v84 then
            v86 = v84:GetAttribute("PreviewDescendantCount");
        else
            v86 = v84;
        end;

        local v87;

        if v86 == nil then
            v87 = false;
        else
            v87 = v86 <= #v84:GetDescendants();
        end;

        local v88;

        if v87 then
            v88 = v84:FindFirstChildOfClass("SurfaceAppearance");
        else
            v88 = v87;
        end;

        applyMaterial(v88 or u66.cosmeticsF.RepPBR:FindFirstChild(u70));

        if v87 then
            u78 = true;
            local ApplyM = v84:FindFirstChild("ApplyM");

            if ApplyM then
                local success, result = pcall(function() -- Line: 953
                    -- upvalues: ApplyM (copy), u68 (ref), u66 (ref)
                    return require(ApplyM)(u68, u66.plr);
                end);

                if not success then
                    warn(result);
                end;
            end;

            cleanup();
        end;
    end;

    if p69 or p67.Rarity == "limited" then
        local function watchFolder(p89) -- Line: 962
            -- upvalues: u74 (ref), schedule (copy)
            if u74 then
                u74:Disconnect();
            end;

            u74 = p89.DescendantAdded:Connect(schedule);
        end;

        local v90 = PlayerGui:FindFirstChild(u71);

        if v90 then
            if u74 then
                u74:Disconnect();
            end;

            u74 = v90.DescendantAdded:Connect(schedule);
        end;

        table.insert(u72, PlayerGui.ChildAdded:Connect(function(p91) -- Line: 968
            -- upvalues: u71 (copy), u74 (ref), schedule (copy), u79 (ref), u80 (ref), u83 (ref)
            if p91.Name == u71 then
                if u74 then
                    u74:Disconnect();
                end;

                u74 = p91.DescendantAdded:Connect(schedule);

                if u79 then
                    if u80 then
                        return;
                    end;

                    u80 = true;
                    task.defer(function() -- Line: 930
                        -- upvalues: u80 (ref), u79 (ref), u83 (ref)
                        u80 = false;

                        if u79 then
                            u83();
                        end;
                    end);
                end;
            end;
        end));
    end;

    table.insert(u72, u66.cosmeticsF.RepPBR.ChildAdded:Connect(function(p92) -- Line: 975
        -- upvalues: u70 (copy), u79 (ref), u80 (ref), u83 (ref)
        if p92.Name == u70 and u79 then
            if u80 then
                return;
            end;

            u80 = true;
            task.defer(function() -- Line: 930
                -- upvalues: u80 (ref), u79 (ref), u83 (ref)
                u80 = false;

                if u79 then
                    u83();
                end;
            end);
        end;
    end));
    table.insert(u72, u68.Destroying:Connect(cleanup));
    u83();
end;

function u1.AddToViewportFrame(u93, u94, p95, p96, p97) -- Line: 982
    -- upvalues: u1 (copy)
    local u98 = p96 == "unboxitem";
    local u99 = u94.ItemName and (p96 == "case" and u93.cosmeticsF.Cases:FindFirstChild(u94.ItemName) or u93.Services.ReplicatedStorage.Storage.DisplayWepModels:FindFirstChild(u94.ItemName));
    local u100 = u99;

    local function ApplyAttributes(p101, p102) -- Line: 995
        -- upvalues: u99 (ref), u100 (copy)
        for _, v in pairs({ "NoDefaultOrientation", "FOVOffset", "FOVOffset_CASE", "FOVOffset_SKIN", "OffsetCFrame_CASE", "OffsetCFrame_SKIN", "CustomLightDirection", "CustomLightDirection_CASE" }) do
            if p102 then
                if p101:GetAttribute(v) ~= nil then
                    u99:SetAttribute(v, p101:GetAttribute(v));
                end;
            elseif p101:GetAttribute(v) == nil then
                local v103 = u100 and u100:GetAttribute(v);
                p101:SetAttribute(v, v103);
            end;
        end;
    end;

    local v104;

    if u94.MeshVariant and p96 ~= "case" then
        v104 = u93.Services.ReplicatedStorage.Storage.SkinVariants[u94.SkinClass]:FindFirstChild(u94.MeshVariant);

        if not u94.MeshVariantIsAddon then
            u99 = v104;
        end;
    else
        v104 = nil;
    end;

    if u99 then
        u99 = u99:Clone();

        if u94.MeshVariant and not u94.MeshVariantIsAddon then
            ApplyAttributes(u99, false);
            u99:SetAttribute("MeshVariant", true);
        end;

        if u94.MeshVariantIsAddon and v104 then
            local v105 = v104:Clone();
            ApplyAttributes(v105, true);
            v105:SetAttribute("MeshVariant", true);
            local v106 = u99:FindFirstChild("Handle") or u99:FindFirstChild("WeaponHandle");
            local v107 = v105:FindFirstChild("Handle") or v105:FindFirstChild("WeaponHandle");

            if v107 and v106 then
                local Descendants = v107:GetDescendants();
                local v108 = {};

                for _, v in pairs(Descendants) do
                    if v:IsA("BasePart") then
                        v108[v] = v107.CFrame:ToObjectSpace(v.CFrame);
                    end;
                end;

                v107.CFrame = v106.CFrame;

                for i, v in pairs(v108) do
                    i.CFrame = v107.CFrame * v;
                    local Weld = Instance.new("Weld");
                    Weld.Part0 = v106;
                    Weld.Part1 = i;
                    local CFrame_new_ret = CFrame.new(v106.Position);
                    local v109 = v106.CFrame:inverse() * CFrame_new_ret;
                    local v110 = i.CFrame:inverse() * CFrame_new_ret;
                    Weld.C0 = v109;
                    Weld.C1 = v110;
                    Weld.Parent = i;
                    i.Anchored = true;
                    i.Parent = u99;
                end;
            end;

            v105:Destroy();
        end;

        local Camera = Instance.new("Camera");
        Camera.Parent = p95;

        if u94.TextureID then
            for _, descendant in pairs(u99:GetDescendants()) do
                if descendant:IsA("MeshPart") and descendant:GetAttribute("SATP") then
                    descendant.TextureID = "rbxassetid://" .. tostring(u94.TextureID);
                end;

                if u94._FixedMagThing then
                    if descendant.Name == "MagPart" then
                        descendant.Transparency = 1;
                    elseif descendant.Name == "FixedMagPart" then
                        descendant.Transparency = 0;
                    elseif descendant.Name == "BasePart" then
                        descendant.Transparency = 1;
                    elseif descendant.Name == "BasePart2" then
                        descendant.Transparency = 0;
                    end;
                end;
            end;
        end;

        if not u98 and p96 ~= "case" then
            u1.ApplyPreviewMetadata(u93, u94, u99, false);
        end;

        if u94.Killtrack then
            local success, result = pcall(function() -- Line: 1097
                -- upvalues: u93 (copy), u99 (ref)
                return u93.modules.addKillTrackModel(u99, true);
            end);

            if success and result then
                for _, descendant in pairs(result:GetDescendants()) do
                    if descendant:IsA("BasePart") then
                        descendant.Anchored = true;
                    end;
                end;

                local math_random_ret = math.random(1, 9);

                local function updt() -- Line: 1110
                    -- upvalues: u93 (copy), result (copy), math_random_ret (copy)
                    u93.modules.killTrackDisplayDecal(result, string.rep(tostring(math_random_ret), 6));
                end;

                u93.modules.killTrackDisplayDecal(result, string.rep(tostring(math_random_ret), 6));
            end;
        end;

        if u94.SouvenirType then
            local success, result = pcall(function() -- Line: 1119
                -- upvalues: u93 (copy), u99 (ref), u94 (copy)
                return u93.modules.addSouvenirSticker(u99, u94.SouvenirType);
            end);

            if success and result then
                for _, descendant in pairs(result:GetDescendants()) do
                    if descendant:IsA("BasePart") then
                        descendant.Anchored = true;
                    end;
                end;
            end;
        end;

        if p96 == "case" then
            for _, descendant in pairs(u99:GetDescendants()) do
                if descendant:IsA("SurfaceAppearance") then
                    descendant:Destroy();
                end;
            end;
        end;

        u99.Parent = p95;
        p95.CurrentCamera = Camera;

        if p97 then
            return u99, Camera;
        end;

        local Attribute = u99:GetAttribute("CustomLightDirection");
        local Attribute2 = u99:GetAttribute("CustomLightDirection_CASE");

        if u94._CLightDirection then
            Attribute = Vector3.new(unpack(u94._CLightDirection));
        end;

        if Attribute then
            p95.LightDirection = Attribute;
        end;

        if u98 then
            p95:SetAttribute("HasCustomLightDirection", Attribute2 ~= nil);
            p95.LightDirection = Attribute2 or Vector3.new(0, 1, 1);
            p95.Ambient = Color3.fromRGB(175, 175, 175);
            p95.LightColor = Color3.fromRGB(350, 350, 350);
        end;

        local v111, u112;

        if u98 then
            v111 = nil;
            u112 = nil;
        else
            v111 = u93.modules.ViewportModel.new(p95, Camera);
            local v113;
            u112, v113 = u99:GetBoundingBox();
            v111:SetModel(u99);
        end;

        local v114 = 32;
        local v115 = not u98 and u99:GetAttribute("FOVOffset");

        if v115 then
            v114 = v114 + v115;
        end;

        Camera.FieldOfView = v114;
        local u116;

        if u98 then
            u116 = nil;
        else
            u116 = v111:GetFitDistance(u112.Position);
        end;

        local v117 = not u98 and u99:GetAttribute("FOVOffset_SKIN");

        if v117 then
            v114 = v114 + v117;
        end;

        Camera.FieldOfView = v114;
        local u118 = not u99:GetAttribute("NoDefaultOrientation") and CFrame.Angles(0, -1.5707963267948966, 0) or CFrame.Angles(0, 0, 0);

        if u94.MeshVariant then
            u118 = u118 * CFrame.Angles(0, 0, 3.141592653589793);
        end;

        if not u98 then
            local Attribute3 = u99:GetAttribute("OffsetCFrame");

            if Attribute3 then
                u118 = u118 * Attribute3;
            end;
        end;

        local u119 = not u98 and u99:GetAttribute("OffsetCFrame_SKIN");

        if not u119 then
            if u98 or p96 == "case" then
                u119 = u99:GetAttribute("OffsetCFrame_CASE");
            else
                u119 = false;
            end;
        end;

        local u120;

        if u119 then
            u120 = u118 * u119;

            if u93.Services.RunService:IsStudio() then
                local AA_UI_Skin_Offsets = workspace:FindFirstChild("AA_UI_Skin_Offsets");

                if not AA_UI_Skin_Offsets then
                    AA_UI_Skin_Offsets = Instance.new("Folder", workspace);
                    AA_UI_Skin_Offsets.Name = "AA_UI_Skin_Offsets";
                end;

                local CFrameValue = Instance.new("CFrameValue", AA_UI_Skin_Offsets);
                CFrameValue.Name = u99.Name;
                CFrameValue.Value = u119;
                local NumberValue = Instance.new("NumberValue", CFrameValue);
                NumberValue.Name = "FOV";

                if typeof(v117) == "number" then
                    NumberValue.Value = v117;
                end;

                CFrameValue.Changed:Connect(function() -- Line: 1225
                    -- upvalues: u120 (ref), u118 (copy), CFrameValue (copy), Camera (copy), u112 (ref), u116 (ref)
                    u120 = u118 * CFrameValue.Value;
                    Camera.CFrame = CFrame.new(u112.Position) * u120 * CFrame.new(0, 0, u116);
                end);
                NumberValue.Changed:Connect(function() -- Line: 1232
                    -- upvalues: Camera (copy), NumberValue (copy), u98 (copy)
                    Camera.FieldOfView = 32 + NumberValue.Value;

                    if u98 then
                        local v121 = Camera;
                        v121.FieldOfView = v121.FieldOfView - 10;
                    end;
                end);
                local u122 = nil;
                u122 = u99.AncestryChanged:Connect(function(p123, p124) -- Line: 1240
                    -- upvalues: u122 (ref), CFrameValue (copy)
                    if not p124 then
                        u122:Disconnect();
                        CFrameValue:Destroy();
                    end;
                end);
            end;
        else
            u120 = u118;
        end;

        if u98 then
            local CFrame_new_ret = CFrame.new(0, 2, 0);
            local CFrameValue = Instance.new("CFrameValue");
            CFrameValue.Value = CFrame_new_ret;
            CFrameValue.Parent = u99;
            u93.Services.TS:Create(CFrameValue, TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Value = CFrame.new(0, 0, 0)
            }):Play();
            local v125 = u93.modules.ViewportModel.new(p95, Camera);
            local BoundingBox, _ = u99:GetBoundingBox();
            u112 = BoundingBox;
            v125:SetModel(u99);
            Camera.FieldOfView = Camera.FieldOfView - 10;
            local Attribute3 = u99:GetAttribute("FOVOffset_CASE");

            if Attribute3 then
                Camera.FieldOfView = Camera.FieldOfView + Attribute3;
            end;

            local CFrame_new_ret2 = CFrame.new();
            u1.ApplyUISSpin(u93, u99, function(p126) -- Line: 1271, Name: OnUpdate
                -- upvalues: CFrame_new_ret2 (ref)
                CFrame_new_ret2 = p126;
            end);
            local FitDistance = v125:GetFitDistance(u112.Position);
            local CFrame_Angles_ret = CFrame.Angles(0, -1.5707963267948966, 0);

            if u94.MeshVariant then
                CFrame_Angles_ret = CFrame_Angles_ret * CFrame.Angles(0, 0, 3.141592653589793);
            end;

            local u127 = nil;
            local u131 = u93.Services.RunService.RenderStepped:Connect(function(p128) -- Line: 1284
                -- upvalues: CFrame_Angles_ret (ref), u119 (copy), CFrame_new_ret2 (ref), CFrameValue (copy), Camera (copy), u112 (ref), FitDistance (copy)
                local v129 = CFrame_Angles_ret;

                if u119 then
                    v129 = v129 * u119;
                end;

                local v130 = v129 * (CFrame.fromEulerAnglesYXZ(-0.3490658503988659, 0, 0) * CFrame_new_ret2 * CFrameValue.Value);
                Camera.CFrame = CFrame.new(u112.Position) * v130 * CFrame.new(0, 0, FitDistance);
            end);
            u127 = u99.AncestryChanged:Connect(function(p132, p133) -- Line: 1293
                -- upvalues: u127 (ref), u131 (ref)
                if not p133 then
                    u127:Disconnect();
                    u131:Disconnect();
                end;
            end);
        else
            Camera.CFrame = CFrame.new(u112.Position) * u120 * CFrame.new(0, 0, u116);
        end;

        return u99, Camera;
    end;
end;

function u1.ToggleGUI(u134, p135) -- Line: 1308
    -- upvalues: u1 (copy)
    local open = u134.vars.open;

    if p135 == nil then
        p135 = not u134.vars.open;
    end;

    if u134.activeTrade then
        return;
    end;

    if p135 and not u134.vars.open then
        u134.uiSoundsF.open:Play();
        u134.events2F.ToggleStoreUI:Fire(false);
        u134.events2F.ToggleSettingsUI:Fire(false);
        u134.events2F.ToggleReturnMenu:Fire(false);
        u134.vars.open = true;
        u1.UpdateUIGrids(u134);
        u134.systems.Main.UpdateInventory(u134);
        u1.UpdateSortType(u134);
        pcall(function() -- Line: 1335
            -- upvalues: u134 (copy)
            if _G.InputType == 2 then
                task.delay(0.15, function() -- Line: 1337
                    -- upvalues: u134 (ref)
                    if u134.vars.open then
                        u134.Services.GamepadService:EnableGamepadCursor(u134.GUI.SkinsFrame);
                    end;
                end);
            end;
        end);
    elseif not p135 and u134.vars.open then
        u134.uiSoundsF.close:Play();
        u134.vars.open = false;
        u1.MassSellMode(u134, false);
        u1.LockMode(u134, false);
        u1.ToggleISVHelp(u134, false);
        u1.ToggleSortType(u134, false);
        u1.ToggleSearchBar(u134, false);

        if u134.systems.Trade then
            u134.systems.Trade.ToggleTradeRequestsTab(u134, false);
        end;

        u134.Services.GamepadService:DisableGamepadCursor();
        u134.vars.activeSellData = nil;
        u134.frames.purchaseFrame.Visible = false;
    end;

    u134.events._toggleGuiEvent:Fire(p135);
    u134.frames.mainFrame.Visible = u134.vars.open;

    if u134.vars.open then
        u134.frames.mainFrame2.Visible = true;
    end;

    if u134.vars.open then
        pcall(function() -- Line: 1370
            -- upvalues: u134 (copy)
            if _G.InputType == 2 then
                u134.Services.GamepadService:EnableGamepadCursor(u134.GUI.SkinsFrame);
            end;
        end);

        return;
    end;

    if open then
        u134.Services.GamepadService:DisableGamepadCursor();
        u134.events2F.SkinsUIClosed:Fire(true);
    end;
end;

function u1.ViewTab(p136, p137, p138) -- Line: 1381
    -- upvalues: u1 (copy)
    if not p138 then
        p136.systems.Main.UpdateInventory(p136);
    end;

    if p137 == 1 then
        p136.frames.skinsFrame.Visible = false;

        if p136.systems.Main.DataSavingDisabledCheck(p136) then
            p136.frames.casesFrame.Visible = false;
            p136.frames.noDataSFrame.Visible = true;
        else
            p136.frames.casesFrame.Visible = true;
            p136.frames.noDataSFrame.Visible = false;
        end;

        p136.frames.skinsButton.TextTransparency = 0.5;
        p136.frames.casesButton.TextTransparency = 0;
        p136.vars.activeSellData = nil;
        p136.frames.purchaseFrame.Visible = false;
        u1.MassSellMode(p136, false);
        u1.LockMode(p136, false);
        u1.ToggleISVHelp(p136, false);
        u1.ToggleSortType(p136, false);
        u1.ToggleSearchBar(p136, false);
    elseif p137 == 2 then
        p136.frames.skinsFrame.Visible = true;
        p136.frames.casesFrame.Visible = false;
        p136.frames.noDataSFrame.Visible = false;
        p136.frames.skinsButton.TextTransparency = 0;
        p136.frames.casesButton.TextTransparency = 0.5;
    end;

    p136.vars.currentTab = p137;
    u1.UpdateSlots(p136);
    p136.events._changeTabEvent:Fire(p137);
end;

function u1.UpdateUIGrids(p139) -- Line: 1427
    local UDim2_new_ret = UDim2.new(0.02, 0, 0.14, 0);
    local UDim2_new_ret2 = UDim2.new(0.18, 0, 0.32, 0);

    if _G.DeviceType == 3 then
        UDim2_new_ret = UDim2.new(0.02, 0, 0.14, 0);
        UDim2_new_ret2 = UDim2.new(0.235, 0, 0.35, 0);
    end;

    for _, v in pairs(p139.frames.uiGrids) do
        v.CellPadding = UDim2_new_ret;
        v.CellSize = UDim2_new_ret2;
    end;
end;

function u1.MassSellMode(p140, p141, p142) -- Line: 1442
    local v143 = p141 or false;

    if v143 == p140.vars.inMassSellMode and not p142 then
        return;
    end;

    if v143 then
        p140.frames.massSellButton.BackgroundColor3 = Color3.fromRGB(121, 121, 121);
        p140.frames.massSellButton.Text = "CANCEL";
        p140.frames.massSellButton.TextLabel.Text = "CANCEL";
        p140.frames.sellSelectedButton.Visible = false;
        p140.frames.lockModeButton.Visible = false;
        p140.frames.selectCountLabel.Visible = true;

        for _, v in pairs(p140.vars.inventoryIds) do
            if v[2].Parent then
                v[2].ButtonsFrame.Visible = false;
                v[2].BlackOverlay.Visible = v[1].Locked;
            end;
        end;

        p140.systems.Trade.ToggleTradeRequestsTab(p140, false);
    else
        p140.frames.massSellButton.BackgroundColor3 = Color3.fromRGB(121, 0, 0);
        p140.frames.massSellButton.Text = "MASS SELL";
        p140.frames.massSellButton.TextLabel.Text = "MASS SELL";
        p140.frames.sellSelectedButton.Visible = false;
        p140.frames.lockModeButton.Visible = true;
        p140.frames.selectCountLabel.Visible = false;
        p140.frames.selectCountLabel.Text = "0/" .. tostring(p140.config.MaxMassSelect);
        p140.frames.selectCountLabel.TextLabel.Text = p140.frames.selectCountLabel.Text;
        p140.frames.selectCountLabel.TextLabel.TextColor3 = Color3.new(1, 1, 1);

        for i, _ in pairs(p140.vars.massSellSelected) do
            p140.systems.Skins.ToggleMassSellSkin(p140, i, true);
        end;

        p140.vars.massSellSelected = {};

        for _, v in pairs(p140.vars.inventoryIds) do
            if v[2].Parent then
                v[2].ButtonsFrame.Visible = true;
                v[2].BlackOverlay.Visible = false;
            end;
        end;

        p140.vars.inMassSellMode = false;

        if not p142 then
            p140.systems.Main.UpdateInventory(p140);
        end;
    end;

    p140.vars.inMassSellMode = v143;
end;

function u1.LockMode(p144, p145, p146) -- Line: 1507
    local v147 = p145 or false;

    if v147 == p144.vars.inLockMode and not p146 then
        return;
    end;

    if v147 then
        p144.frames.lockModeButton.TextLabel.Text = "CANCEL";
        p144.frames.lockSelectedButton.Visible = false;
        p144.frames.massSellButton.Visible = false;
        p144.frames.selectCountLabel.Visible = true;

        for _, v in pairs(p144.vars.inventoryIds) do
            if v[2].Parent then
                v[2].SellOverlay.BackgroundColor3 = Color3.new(0.968627, 0.968627, 0.968627);
                v[2].ButtonsFrame.Visible = false;
            end;
        end;

        p144.systems.Trade.ToggleTradeRequestsTab(p144, false);
    else
        p144.frames.lockModeButton.TextLabel.Text = "LOCK MODE";
        p144.frames.sellSelectedButton.Visible = false;
        p144.frames.massSellButton.Visible = true;
        p144.frames.selectCountLabel.Visible = false;
        p144.frames.selectCountLabel.Text = "0/" .. tostring(p144.config.MaxMassSelect);
        p144.frames.selectCountLabel.TextLabel.Text = p144.frames.selectCountLabel.Text;
        p144.frames.selectCountLabel.TextLabel.TextColor3 = Color3.new(1, 1, 1);

        for i, _ in pairs(p144.vars.lockSelectedList) do
            p144.systems.Skins.ToggleLockSkin(p144, i, true);
        end;

        p144.vars.lockSelectedList = {};

        for _, v in pairs(p144.vars.inventoryIds) do
            if v[2].Parent then
                v[2].SellOverlay.BackgroundColor3 = Color3.new(1, 0, 0);
                v[2].ButtonsFrame.Visible = true;
            end;
        end;

        p144.vars.inLockMode = false;

        if not p146 then
            p144.systems.Main.UpdateInventory(p144);
        end;
    end;

    p144.vars.inLockMode = v147;
end;

function u1.ToggleISVHelp(p148, p149) -- Line: 1564
    if p149 == p148.vars.isvHelpOpen then
        return;
    end;

    p148.frames.ivSVF_OpenButton.Visible = not p149;
    p148.frames.ivSVF_CloseButton.Visible = p149;
    p148.frames.ivSVF_HelpFrame.Visible = p149;
    p148.vars.isvHelpOpen = p149;
end;

function u1.UpdateSlots(p150) -- Line: 1574
    if not p150.vars.cosmeticData then
        return;
    end;

    local v151 = 0;
    local v152 = 0;

    for _, _ in pairs(p150.vars.cosmeticData.Skins) do
        v151 = v151 + 1;
    end;

    for _, _ in pairs(p150.vars.cosmeticData.Cases) do
        v152 = v152 + 1;
    end;

    if p150.caseReplicatedData then
        local v153 = p150.vars.currentTab == 1 and v152 and v152 or v151;
        local v154 = _G.PlayerData and _G.PlayerData.CosmeticInventoryLimits or p150.caseReplicatedData.InventoryLimits;
        local v155 = p150.vars.currentTab == 1 and v154.Cases or v154.Skins;
        p150.frames.slotsFrame.Slots.Text = " " .. tostring(v153) .. "/" .. tostring(v155);
        p150.frames.slotsFrame.Slots.TextColor3 = v155 <= v153 and Color3.new(1, 0.2, 0.2) or Color3.new(1, 1, 1);
        p150.frames.slotsFrame.Visible = true;

        if p150.vars.currentTab == 1 then
            p150.frames.casesFrame.EmptyFrame.Visible = v153 <= 0;
        else
            p150.frames.skinsFrame.EmptyFrame.Visible = v153 <= 0;
        end;

        local addSlotsButton = p150.frames.addSlotsButton;
        local v156 = not _G.GamepassCheck("CosmeticSlots1") and p150.vars.currentTab == 2;
        addSlotsButton.Visible = v156;
    end;
end;

function u1.EnterAdminViewMode(p157, p158, p159) -- Line: 1615
    -- upvalues: u1 (copy)
    if p158 == nil then
        p158 = false;
    end;

    if not (p158 or p157.vars.adminViewInv) then
        return;
    end;

    if p158 then
        p157.vars.adminViewInv = true;
        p157.vars.adminViewInvData = p157.modules.deepCopy(p159);
        local v160 = p159.ViewedUsername or "[?]";
        p157.frames.topBar.ViewFrame.Title.Text = "<b>@" .. tostring(v160) .. "</b>\'s COSMETIC INVENTORY";
        p157.frames.topBar.ViewFrame.Visible = true;
        p157.frames.topBar.Title.Visible = false;
        p157.frames.mainFrame.BackgroundColor3 = Color3.fromRGB(167, 167, 167);
        u1.MassSellMode(p157, false);
        u1.LockMode(p157, false);
        u1.ToggleISVHelp(p157, false);
        p157.frames.massSellButton.Visible = false;
        p157.frames.sellSelectedButton.Visible = false;
        p157.frames.lockModeButton.Visible = false;
        p157.frames.lockSelectedButton.Visible = false;
        p157.frames.adminOutputFrame.Visible = true;
        warn("OPENED ADMIN COSMETIC VIEW (@" .. v160);
    else
        p157.vars.adminViewInv = false;
        p157.vars.adminViewInvData = nil;
        p157.frames.mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
        p157.frames.topBar.ViewFrame.Visible = false;
        p157.frames.topBar.Title.Visible = true;
        p157.frames.massSellButton.Visible = true;
        p157.frames.adminOutputFrame.Visible = false;
        p157.vars.adminOutput = nil;
        warn("CLOSED ADMIN COSMETIC VIEW");
    end;

    p157.systems.Main.UpdateInventory(p157);
end;

function u1.ToggleSortType(p161, p162) -- Line: 1664
    if p162 == nil then
        p162 = not p161.vars.sortTypeOpen;
    end;

    if p162 == p161.vars.sortTypeOpen then
        return;
    end;

    p161.frames.sortTypeFrame.Visible = p162;
    p161.frames.sortTypeButton.TextLabel.TextTransparency = p162 and 0 or 0.25;
    p161.frames.sortTypeButton.ImageLabel.ImageTransparency = p162 and 0 or 0.25;
    p161.vars.sortTypeOpen = p162;
end;

function u1.UpdateInventoryFrameSortType(u163, p164, p165, u166, p167) -- Line: 1676
    local function u170(p168) -- Line: 1679
        -- upvalues: u163 (copy), u166 (copy), u170 (ref)
        if p168 == 1 then
            return 1000000000 - u163.config.RarityNumbers[string.lower(u166.Rarity)] * 3000000 - u170(4);
        end;

        if p168 == 4 then
            local v169 = 0;
            local ItemStats = u163.systems.Main.GetItemStats(u163, u166.ItemName, u166.SkinClass);

            if ItemStats and ItemStats:FindFirstChild("Price") then
                v169 = v169 - math.round(ItemStats.Price.Value) * 0.3;
            end;

            if u166.Rarity == "limited" then
                return v169 - 1000000;
            end;

            if u166.Rarity == "exotic" then
                v169 = v169 - 1000000;
            end;

            return v169;
        end;
    end;

    if p164 == 1 then
        p167.LayoutOrder = u170(1);
    elseif p164 == 2 then
        local v171 = u170(1);

        if u163.vars.equippedCosmeticData.Skins[u166.ItemName] == p165 then
            v171 = v171 - 100000000;
        end;

        p167.LayoutOrder = v171;
    elseif p164 == 3 then
        p167.LayoutOrder = -u166.GotTick or 1000000000000;
    elseif p164 == 4 then
        p167.LayoutOrder = u170(4);
    end;
end;

function u1.UpdateSortType(p172, p173) -- Line: 1727
    -- upvalues: u1 (copy)
    for i, v in pairs(p172.vars.inventoryIds) do
        if v[3] == "skin" then
            u1.UpdateInventoryFrameSortType(p172, p173 or p172.vars.sortType, i, v[1], v[2]);
        end;
    end;
end;

function u1.SwitchSortType(p174, p175) -- Line: 1735
    -- upvalues: u1 (copy)
    p174.vars.sortType = p175;
    p174.frames.sortTypeButton.TextLabel.Text = p174.frames.sortTypeFrame[tostring(p175) .. "_Button"].TextLabel.Text;
    u1.UpdateSortType(p174, p175);
end;

function u1.ToggleSearchBar(u176, p177) -- Line: 1741
    if p177 == nil then
        p177 = not u176.vars.searchBarOpen;
    end;

    if p177 == u176.vars.searchBarOpen then
        return;
    end;

    u176.frames.searchbarFrame.Visible = p177;
    u176.frames.searchButtonFrame.ImageButton.ImageTransparency = p177 and 0 or 0.25;

    if u176.vars.searchCon then
        u176.vars.searchCon:Disconnect();
        u176.vars.searchCon = nil;
    end;

    if p177 then
        u176.vars.searchCon = u176.frames.searchbarFrame.TextBox:GetPropertyChangedSignal("Text"):Connect(function() -- Line: 1755
            -- upvalues: u176 (copy)
            local string_lower_ret = string.lower(u176.frames.searchbarFrame.TextBox.Text);

            for _, v in pairs(u176.vars.inventoryIds) do
                if v[3] == "skin" then
                    if not v[1].ItemDisplayName then
                        local ItemStats = u176.systems.Main.GetItemStats(u176, v[1].ItemName, v[1].SkinClass);
                        v[1].ItemDisplayName = ItemStats.DisplayName.Value;
                    end;

                    v[2].Visible = string.find(string.lower((v[1].ItemDisplayName or "") .. " ☂ " .. (v[1].DisplayName or "") .. " ☂ " .. (v[1].CustomName or "") .. " "), string_lower_ret, 1, true) and true or false;
                end;
            end;

            for _, v in pairs(u176.frames.listFrames) do
                v.CanvasPosition = Vector2.new(0, 0);
            end;
        end);
        u176.frames.searchbarFrame.TextBox:CaptureFocus();
    else
        for _, v in pairs(u176.vars.inventoryIds) do
            if v[3] == "skin" then
                v[2].Visible = true;
            end;
        end;
    end;

    u176.vars.searchBarOpen = p177;
end;

function u1.SetOddsLabel(p178, p179) -- Line: 1790
    if not p178 then
        return;
    end;

    if p179 then
        local v180;

        if p179 > 0 and p179 < 1 then
            local v181 = -math.log10(p179);
            v180 = math.floor(v181) + 4;
        else
            v180 = 4;
        end;

        local v182 = 10 ^ v180;
        local v183 = math.floor(p179 * v182 + 0.5) / v182;
        local v184 = string.format("%." .. v180 .. "f", v183):gsub("0+$", ""):gsub("%.$", "");
        local _ = math.abs(v183 - p179) > 1e-12;
        local v185 = "";
        local v186 = v184:find(".", 1, true);

        if p179 < 0.1 and v186 then
            local v187 = v184:sub(v186 + 1):find("[1-9]");

            if v187 and #v184:sub(v186 + v187 + 1) >= 2 then
                p178.RichText = true;
                p178.Text = v185 .. v184:sub(1, v186 + v187) .. "<font transparency=\"0.5\">" .. v184:sub(v186 + v187 + 1) .. "</font>%";
            else
                p178.RichText = false;
                p178.Text = v185 .. v184 .. "%";
            end;
        else
            p178.RichText = false;
            p178.Text = v185 .. v184 .. "%";
        end;
    else
        p178.Text = "";
    end;

    p178.Visible = false;
end;

return u1;
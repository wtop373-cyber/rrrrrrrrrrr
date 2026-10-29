-- ============================================================
-- SCRIPT: AtmVending
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface.Modules.AtmVending
-- ============================================================

-- Decompiled with Potassium's decompiler.

local v1 = {};
local UserInputService = game:GetService("UserInputService");
game:GetService("RunService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local TweenService = game:GetService("TweenService");
local GamepadService = game:GetService("GamepadService");
local CoreGUI = script.Parent.Parent.CoreGUI;
local workspace_CurrentCamera = workspace.CurrentCamera;
local SocialRewards = require(script.Parent.SocialRewards);
local ATMBlur = workspace_CurrentCamera:FindFirstChild("ATMBlur");

if not ATMBlur then
    ATMBlur = Instance.new("BlurEffect");
    ATMBlur.Size = 0;
    ATMBlur.Name = "ATMBlur";
    ATMBlur.Parent = workspace_CurrentCamera;
end;

ATMBlur.Size = 0;
_G.ATM_Active = false;

repeat
    wait(0.15);
until _G.WaitForChar and (_G.GVF and _G.GVF());

_G.WaitForChar();
local LocalPlayer = game.Players.LocalPlayer;
local Character = LocalPlayer.Character;
local Humanoid = Character:WaitForChild("Humanoid");
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart");
local u2 = {
    toggle = Humanoid:LoadAnimation(ReplicatedStorage.Storage.Animations:WaitForChild("Toggle2"))
};
local u3 = nil;
LocalPlayer.CharacterAdded:Connect(function(p4) -- Line: 39
    -- upvalues: Character (ref), Humanoid (ref), HumanoidRootPart (ref), u2 (ref), ReplicatedStorage (copy), u3 (ref)
    Character = p4;
    Humanoid = Character:WaitForChild("Humanoid");
    HumanoidRootPart = Character:WaitForChild("HumanoidRootPart");
    u2 = {
        toggle = Humanoid:LoadAnimation(ReplicatedStorage.Storage.Animations:WaitForChild("Toggle2"))
    };
    Humanoid.Died:Once(function() -- Line: 45
        -- upvalues: u3 (ref)
        u3(false);
    end);
end);
ReplicatedStorage:WaitForChild("PlayerbaseData2", 100):WaitForChild(LocalPlayer.Name, 100);
local Events = ReplicatedStorage:WaitForChild("Events");
local Events2 = ReplicatedStorage:WaitForChild("Events2");
local ATM = Events.ATM;
local VendinMachine = Events.VendinMachine;
local MysteryBoxU = Events.MysteryBoxU;
local UISounds = ReplicatedStorage:WaitForChild("Storage"):WaitForChild("UISounds");
local u5 = {
    mF = CoreGUI:WaitForChild("ATMFrame")
};
u5.am = u5.mF:WaitForChild("AnswerMessage");
u5.cb = u5.mF:WaitForChild("Header").CloseButton;
u5.cashT = u5.mF:WaitForChild("Header").Cash;
u5.atm_f = u5.mF:WaitForChild("ATMFrame");
u5.d_box = u5.atm_f.DepositBox.TextBox;
u5.d_but = u5.atm_f.DepositButton.TextButton;
u5.d_but2 = u5.atm_f.EnterAllButton.TextButton;
u5.d_but_f = u5.atm_f.DepositButton.Pause;
u5.d_but2_f = u5.atm_f.EnterAllButton.Pause;
u5.w_box = u5.atm_f.WithdrawBox.TextBox;
u5.w_but = u5.atm_f.WithdrawButton.TextButton;
u5.w_but_f = u5.atm_f.WithdrawButton.Pause;
u5.protectL = u5.mF:WaitForChild("ProtectionStatus");
u5.allowanceF = u5.atm_f:WaitForChild("AllowanceFrame");
u5.red_f = u5.mF:WaitForChild("RedeemFrame");
u5.r_box = u5.red_f:WaitForChild("RedeemBox").TextBox;
u5.r_button = u5.red_f:WaitForChild("RedeemButton").TextButton;
u5.r_button_F = u5.red_f:WaitForChild("RedeemButton").Pause;
u5.atm_f_b = u5.mF:WaitForChild("AtmButton");
u5.red_f_b = u5.mF:WaitForChild("RedeemButton");
u5.soc_f_b = u5.mF:WaitForChild("SocialsButton");
local u6 = {
    mF = CoreGUI:WaitForChild("VendingFrame")
};
u6.am = u6.mF:WaitForChild("AnswerMessage");
u6.cb = u6.mF:WaitForChild("Header").CloseButton;
u6.cashT = u6.mF:WaitForChild("Header").Cash;
u6.snack_b = u6.mF:WaitForChild("SnackFrame"):WaitForChild("Button");
u6.soda_b = u6.mF:WaitForChild("SodaFrame"):WaitForChild("Button");
local u7 = {
    mF = CoreGUI:WaitForChild("MysteryFrame")
};
u7.cb = u7.mF.CloseButton;
u7.cashT = u7.mF:WaitForChild("Header").Cash;
u7.purchase_b = u7.mF:WaitForChild("PurchaseButton");
u7.priceT = u7.mF:WaitForChild("Price");
local u8 = ReplicatedStorage:WaitForChild("PlayerbaseData2", 1000):WaitForChild(LocalPlayer.Name, 1000);
local u9 = false;
local u10 = nil;
local u11 = nil;
local u12 = nil;
local u13 = nil;
local u14 = nil;
local u15 = nil;
local u16 = false;
local u17 = false;
local u18 = false;
local u19 = 0;
local u20 = "";
local u21 = 1;
local u22 = 1;
local u23 = u22;

local function PositiveIntegerMask(p24) -- Line: 136
    return p24:gsub("[^%-%d]", "");
end;

local AddCommas = require(ReplicatedStorage.NewModules.Shared.Extensions.AddCommas);

local function Convert(p25) -- Line: 142
    local function Format(p26) -- Line: 143
        return string.format("%02i", p26);
    end;

    local v27 = (p25 - p25 % 60) / 60;

    return string.format("%02i", v27) .. ":" .. string.format("%02i", p25 - v27 * 60);
end;

local function ATM_UpdateProtection(p28, p29) -- Line: 151
    -- upvalues: u5 (copy)
    local v30 = "rgb(255,255,255)";

    if tonumber(p29) then
        v30 = p29 <= 15 and "rgb(255,170,0)" or v30;

        local function _(p31) -- Line: 143
            return string.format("%02i", p31);
        end;

        local v32 = (p29 - p29 % 60) / 60;
        p29 = string.format("%02i", v32) .. ":" .. string.format("%02i", p29 - v32 * 60);
    end;

    local v33 = ("PROTECTION STATUS: " .. "<font color=" .. "\"" .. (string.lower(p28) == "cooldown" and "rgb(255,0,0)" or v30) .. "\">") .. p28 .. " (";

    if tonumber(p29) then
        local function _(p34) -- Line: 143
            return string.format("%02i", p34);
        end;

        local v35 = (p29 - p29 % 60) / 60;
        p29 = string.format("%02i", v35) .. ":" .. string.format("%02i", p29 - v35 * 60);
    end;

    u5.protectL.Text = (v33 .. p29 .. ")") .. "</font>";
end;

local function ATM_ToggleBusy(p36) -- Line: 185
    -- upvalues: u5 (copy), u10 (ref)
    if p36 then
        u5.w_but_f.Visible = true;
        u5.d_but_f.Visible = true;
        u5.d_but2_f.Visible = true;
        u5.r_button_F.Visible = true;
        u5.r_button.Parent.ImageColor3 = Color3.fromRGB(122, 122, 122);
        u5.d_but.Parent.ImageColor3 = Color3.fromRGB(122, 122, 122);
        u5.d_but2.Parent.ImageColor3 = Color3.fromRGB(122, 122, 122);
        u5.w_but.Parent.ImageColor3 = Color3.fromRGB(122, 122, 122);
        u5.w_but.Visible = false;
        u5.d_but.Visible = false;
        u5.d_but2.Visible = false;
        u5.r_button.Visible = false;
    else
        u5.w_but_f.Visible = false;
        u5.d_but_f.Visible = false;
        u5.d_but2_f.Visible = false;
        u5.r_button_F.Visible = false;
        u5.w_but.Visible = true;
        u5.d_but.Visible = true;
        u5.d_but2.Visible = true;
        u5.r_button.Visible = true;
        u5.r_button.Parent.ImageColor3 = Color3.fromRGB(255, 248, 160);
        u5.d_but.Parent.ImageColor3 = Color3.fromRGB(160, 209, 255);
        u5.d_but2.Parent.ImageColor3 = Color3.fromRGB(207, 232, 255);
        u5.w_but.Parent.ImageColor3 = Color3.fromRGB(160, 209, 255);
    end;

    u10 = p36;
end;

local function ATM_MessageHandler(p37, p38, p39) -- Line: 221
    -- upvalues: u19 (ref), u5 (copy), u20 (ref), u21 (ref)
    local v40 = p38 or "An error occured in your request";
    local math_random_ret = math.random();
    u19 = math_random_ret;
    u5.am.Visible = true;

    if p37 == true then
        u5.am.TextColor3 = Color3.new(0, 1, 0);
        u5.am.T.TextColor3 = Color3.new(0, 1, 0);
    elseif p37 then
        u5.am.TextColor3 = Color3.new(1, 1, 1);
        u5.am.T.TextColor3 = Color3.new(1, 1, 1);
    else
        u5.am.TextColor3 = Color3.new(1, 0, 0);
        u5.am.T.TextColor3 = Color3.new(1, 0, 0);
    end;

    if v40 == u20 then
        u21 = u21 + 1;
        v40 = v40 .. " x" .. u21;
    else
        u20 = v40;
        u21 = 1;
    end;

    u5.am.Text = v40;
    u5.am.T.Text = v40;
    delay(p39 or 2.5, function() -- Line: 254
        -- upvalues: u19 (ref), math_random_ret (copy), u5 (ref)
        if u19 == math_random_ret then
            u5.am.Visible = false;
            u5.am.Text = "";
            u5.am.T.Text = "";
        end;
    end);
end;

local function ATM_AllowanceChange() -- Line: 263
    -- upvalues: u8 (copy), u5 (copy)
    local NextAllowance = u8.NextAllowance;

    if NextAllowance.Claim.Value then
        u5.allowanceF.Status.Visible = false;
        u5.allowanceF.ClaimButton.Visible = true;

        return;
    end;

    u5.allowanceF.Status.Visible = true;
    u5.allowanceF.ClaimButton.Visible = false;
    local Status = u5.allowanceF.Status;
    local Value = NextAllowance.Value;

    local function _(p41) -- Line: 143
        return string.format("%02i", p41);
    end;

    local v42 = (Value - Value % 60) / 60;
    local v43 = string.format("%02i", v42) .. ":" .. string.format("%02i", Value - v42 * 60);
    Status.Text = "ALLOWANCE STATUS: <b><font size=\"25\" >" .. tostring(v43) .. "</font></b>";
end;

local function ATM_changeTab(p44) -- Line: 276
    -- upvalues: u5 (copy), Events2 (copy), u23 (ref), u22 (ref)
    if p44 == 1 then
        u5.red_f.Visible = false;
        u5.atm_f.Visible = true;
        u5.atm_f_b.Selected.Visible = true;
        u5.red_f_b.Selected.Visible = false;
    elseif p44 == 2 then
        u5.red_f.Visible = true;
        u5.atm_f.Visible = false;
        u5.atm_f_b.Selected.Visible = false;
        u5.red_f_b.Selected.Visible = true;
    elseif p44 == 3 then
        u5.mF.Visible = false;
        Events2.ToggleSocialRewards:Fire(true);
    end;

    u23 = u22;
    u22 = p44;
end;

u3 = function(p45) -- Line: 298, Name: ATM_GuiToggle
    -- upvalues: u16 (ref), u5 (copy), SocialRewards (copy), UISounds (copy), u12 (ref), Humanoid (ref), TweenService (copy), ATMBlur (ref), Events (copy), u13 (ref), GamepadService (copy), u22 (ref), ATM_changeTab (copy), u23 (ref), Events2 (copy), u17 (ref), u18 (ref)
    if p45 == u16 then
        return;
    end;

    u5.mF.Visible = p45;
    local v46 = SocialRewards.countAvailableSocials();

    if v46 > 0 then
        u5.soc_f_b.Hint.Visible = true;
        u5.soc_f_b.Hint.Text = v46;
    else
        u5.soc_f_b.Hint.Visible = false;
    end;

    if not p45 then
        u5.w_box.Text = "";
        u5.d_box.Text = "";
    end;

    if p45 == true and not u16 then
        UISounds.open:Play();
        pcall(function() -- Line: 322
            -- upvalues: u12 (ref)
            u12:Cancel();
        end);
        Humanoid:UnequipTools();
        u12 = TweenService:Create(ATMBlur, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = 10
        });
        Events.BYZERSPROTEC:FireServer(true, "ATM", u13);
        pcall(function() -- Line: 329
            -- upvalues: GamepadService (ref), u5 (ref)
            if _G.InputType == 2 then
                GamepadService:EnableGamepadCursor(u5.cb);
            end;
        end);

        if _G.CheckIfMobile and _G.CheckIfMobile() then
            u5.allowanceF.Status.UIScale.Scale = 0.7;
        else
            u5.allowanceF.Status.UIScale.Scale = 1;
        end;
    elseif u16 then
        UISounds.close:Play();

        if u22 == 3 then
            ATM_changeTab(u23 == 3 and 1 or (u23 or 1));
            Events2.ToggleSocialRewards:Fire(false);
            local v47 = SocialRewards.countAvailableSocials();

            if v47 > 0 then
                u5.soc_f_b.Hint.Visible = true;
                u5.soc_f_b.Hint.Text = v47;
            else
                u5.soc_f_b.Hint.Visible = false;
            end;
        end;

        pcall(function() -- Line: 357
            -- upvalues: u12 (ref)
            u12:Cancel();
        end);
        u12 = TweenService:Create(ATMBlur, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Size = 0
        });
        Events.BYZERSPROTEC:FireServer(false);
        pcall(function() -- Line: 363
            -- upvalues: GamepadService (ref)
            GamepadService:DisableGamepadCursor();
        end);
    end;

    u16 = p45;
    _G.ATM_Active = u16 or (u17 or u18);

    if u12 then
        u12:Play();
    end;
end;

local function Vending_GuiToggle(p48) -- Line: 378
    -- upvalues: u17 (ref), u6 (copy), UISounds (copy), u12 (ref), Humanoid (ref), TweenService (copy), ATMBlur (ref), GamepadService (copy), u16 (ref), u18 (ref)
    if p48 == u17 then
        return;
    end;

    u6.mF.Visible = p48;

    if p48 == true and not u17 then
        UISounds.open:Play();
        pcall(function() -- Line: 388
            -- upvalues: u12 (ref)
            u12:Cancel();
        end);
        Humanoid:UnequipTools();
        u12 = TweenService:Create(ATMBlur, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = 10
        });
        pcall(function() -- Line: 394
            -- upvalues: GamepadService (ref), u6 (ref)
            if _G.InputType == 2 then
                GamepadService:EnableGamepadCursor(u6.cb);
            end;
        end);
    elseif u17 then
        UISounds.close:Play();
        pcall(function() -- Line: 409
            -- upvalues: u12 (ref)
            u12:Cancel();
        end);
        u12 = TweenService:Create(ATMBlur, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Size = 0
        });
        pcall(function() -- Line: 414
            -- upvalues: GamepadService (ref)
            GamepadService:DisableGamepadCursor();
        end);
    end;

    u17 = p48;
    _G.ATM_Active = u16 or (u17 or u18);

    if u12 then
        u12:Play();
    end;
end;

local function Mystery_GuiToggle(p49) -- Line: 427
    -- upvalues: u18 (ref), u7 (copy), UISounds (copy), u12 (ref), Humanoid (ref), TweenService (copy), ATMBlur (ref), GamepadService (copy), u16 (ref), u17 (ref)
    if p49 == u18 then
        return;
    end;

    u7.mF.Visible = p49;

    if p49 == true and not u18 then
        UISounds.open:Play();
        pcall(function() -- Line: 437
            -- upvalues: u12 (ref)
            u12:Cancel();
        end);
        Humanoid:UnequipTools();
        u12 = TweenService:Create(ATMBlur, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = 10
        });
        pcall(function() -- Line: 443
            -- upvalues: GamepadService (ref), u7 (ref)
            if _G.InputType == 2 then
                GamepadService:EnableGamepadCursor(u7.cb);
            end;
        end);
    elseif u18 then
        UISounds.close:Play();
        pcall(function() -- Line: 458
            -- upvalues: u12 (ref)
            u12:Cancel();
        end);
        u12 = TweenService:Create(ATMBlur, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Size = 0
        });
        pcall(function() -- Line: 463
            -- upvalues: GamepadService (ref)
            GamepadService:DisableGamepadCursor();
        end);
    end;

    u18 = p49;
    _G.ATM_Active = u16 or (u17 or u18);

    if u12 then
        u12:Play();
    end;
end;

Humanoid.Died:Once(function() -- Line: 476
    -- upvalues: u3 (ref)
    u3(false);
end);
(function() -- Line: 481, Name: SetUp
    -- upvalues: u10 (ref), u11 (ref), u5 (copy), UISounds (copy), Events2 (copy), u22 (ref), u23 (ref), u16 (ref), SocialRewards (copy), ATM_changeTab (copy), u13 (ref), ATM_ToggleBusy (copy), u2 (ref), ATM_MessageHandler (copy), ATM (copy), u8 (copy), u3 (ref), AddCommas (copy), LocalPlayer (copy), ATM_AllowanceChange (copy), Character (ref), HumanoidRootPart (ref), Events (copy), ATM_UpdateProtection (copy), u9 (ref), u6 (copy), u14 (ref), u17 (ref), Vending_GuiToggle (copy), VendinMachine (copy), u7 (copy), u15 (ref), Mystery_GuiToggle (copy), MysteryBoxU (copy), u18 (ref), UserInputService (copy)
    u10 = false;
    u11 = _G.GVF();

    local function Vending_H() -- Line: 781
        -- upvalues: u6 (ref), UISounds (ref), u14 (ref), u17 (ref), u10 (ref), u2 (ref), Vending_GuiToggle (ref), VendinMachine (ref), Events2 (ref), u8 (ref), AddCommas (ref), Character (ref), HumanoidRootPart (ref)
        u6.mF.Visible = false;

        for _, descendant in pairs(u6.mF:GetDescendants()) do
            if descendant:IsA("TextButton") then
                descendant.MouseEnter:Connect(function() -- Line: 786
                    -- upvalues: UISounds (ref)
                    UISounds.hover:Play();
                end);
                descendant.MouseButton1Click:Connect(function() -- Line: 789
                    -- upvalues: UISounds (ref)
                    UISounds.click:Play();
                end);
            end;
        end;

        local function doProcess(u50) -- Line: 795
            -- upvalues: u14 (ref), u17 (ref), u10 (ref), UISounds (ref), u2 (ref), Vending_GuiToggle (ref), VendinMachine (ref), Events2 (ref)
            if not (u14 and u17) then
                return;
            end;

            if u10 then
                return;
            end;

            if u14.Parent.Values.Busy.Value then
                return;
            end;

            u10 = true;
            UISounds.click:Play();
            u2.toggle:Play();
            Vending_GuiToggle(false);
            local v51, v52, v53, _, _ = pcall(function() -- Line: 808
                -- upvalues: VendinMachine (ref), u14 (ref), u50 (copy)
                return VendinMachine:InvokeServer(u14, u50);
            end);

            if not v51 then
                v52 = false;
                v53 = nil;
            end;

            if v52 then
                UISounds.purchase:Play();
            else
                UISounds.error:Play();
                Events2.ClientWarn:Fire({
                    v53 or "N/A",
                    1.5,
                    Color3.fromRGB(255, 121, 121),
                    Color3.new(0, 0, 0),
                    "lost"
                });
            end;

            u10 = false;
        end;

        u6.snack_b.MouseButton1Click:Connect(function() -- Line: 823
            -- upvalues: doProcess (copy)
            doProcess("snack");
        end);
        u6.soda_b.MouseButton1Click:Connect(function() -- Line: 826
            -- upvalues: doProcess (copy)
            doProcess("soda");
        end);
        u6.cb.MouseButton1Click:Connect(function() -- Line: 830
            -- upvalues: Vending_GuiToggle (ref)
            Vending_GuiToggle(false);
        end);
        u8.Cash.Changed:Connect(function() -- Line: 834
            -- upvalues: u6 (ref), AddCommas (ref), u8 (ref)
            u6.cashT.Text = "$" .. AddCommas(u8.Cash.Value);
        end);
        u6.cashT.Text = "$" .. AddCommas(_G.PlayerData.Cash);
        Events2:WaitForChild("VendingMachine").Event:Connect(function(p54) -- Line: 839
            -- upvalues: u17 (ref), u14 (ref), Vending_GuiToggle (ref), Character (ref), HumanoidRootPart (ref)
            if not u17 then
                u14 = p54;
                Vending_GuiToggle(true);

                while u17 do
                    wait(0.05);

                    if not _G.CheckIfCan(Character, "Any") or (HumanoidRootPart.Position - u14.Position).Magnitude > 6.5 then
                        Vending_GuiToggle(false);

                        return;
                    end;
                end;
            end;
        end);
    end;

    local function Mystery_H() -- Line: 860
        -- upvalues: u7 (ref), UISounds (ref), u15 (ref), u10 (ref), u2 (ref), Mystery_GuiToggle (ref), MysteryBoxU (ref), Events2 (ref), u8 (ref), AddCommas (ref), u18 (ref), Character (ref), HumanoidRootPart (ref)
        u7.mF.Visible = false;

        for _, descendant in pairs(u7.mF:GetDescendants()) do
            if descendant:IsA("TextButton") then
                descendant.MouseEnter:Connect(function() -- Line: 865
                    -- upvalues: UISounds (ref)
                    UISounds.hover:Play();
                end);
                descendant.MouseButton1Click:Connect(function() -- Line: 868
                    -- upvalues: UISounds (ref)
                    UISounds.click:Play();
                end);
            end;
        end;

        local function u59(u55) -- Line: 874
            -- upvalues: u15 (ref), u10 (ref), UISounds (ref), u2 (ref), Mystery_GuiToggle (ref), MysteryBoxU (ref), Events2 (ref)
            if not u15 then
                return;
            end;

            if u10 then
                return;
            end;

            u10 = true;
            UISounds.click:Play();
            u2.toggle:Play();
            Mystery_GuiToggle(false);
            local v56, v57, v58, _, _ = pcall(function() -- Line: 885
                -- upvalues: MysteryBoxU (ref), u55 (copy), u15 (ref)
                return MysteryBoxU:InvokeServer(u55, u15);
            end);

            if not v56 then
                v57 = false;
                v58 = nil;
            end;

            if v57 then
                UISounds.purchase:Play();
            else
                UISounds.error:Play();
                Events2.ClientWarn:Fire({
                    v58 or "N/A",
                    1.5,
                    Color3.fromRGB(255, 121, 121),
                    Color3.new(0, 0, 0),
                    "lost"
                });
            end;

            u10 = false;
        end;

        u7.purchase_b.MouseButton1Click:Connect(function() -- Line: 900
            -- upvalues: u59 (copy)
            u59("Buy");
        end);
        u7.cb.MouseButton1Click:Connect(function() -- Line: 903
            -- upvalues: Mystery_GuiToggle (ref)
            Mystery_GuiToggle(false);
        end);
        u8.Cash.Changed:Connect(function() -- Line: 907
            -- upvalues: u7 (ref), AddCommas (ref), u8 (ref)
            u7.cashT.Text = "$" .. AddCommas(u8.Cash.Value);
        end);
        u7.cashT.Text = "$" .. AddCommas(_G.PlayerData.Cash);
        Events2:WaitForChild("MysteryBoxInteract").Event:Connect(function(p60, p61) -- Line: 912
            -- upvalues: u18 (ref), u15 (ref), u7 (ref), Mystery_GuiToggle (ref), Character (ref), HumanoidRootPart (ref), u59 (copy)
            if not u18 then
                u15 = p60;

                if p61 == "Buy" then
                    u7.priceT.Text = "Purchase for <font color=" .. "\"rgb(255, 228, 93)\">$" .. tostring(u15.Parent.Values.Price.Value) .. "</font>";
                    Mystery_GuiToggle(true);

                    while u18 do
                        wait(0.05);

                        if not (_G.CheckIfCan(Character, "Any") and ((HumanoidRootPart.Position - u15.Position).Magnitude <= 6.5 and (not u15.Parent.Values.Busy.Value and u15.Parent.Values.Active.Value))) then
                            Mystery_GuiToggle(false);

                            return;
                        end;
                    end;
                else
                    u59("Take");
                end;
            end;
        end);
    end;

    (function() -- Line: 485, Name: ATM_H
        -- upvalues: u5 (ref), UISounds (ref), u10 (ref), Events2 (ref), u22 (ref), u23 (ref), u16 (ref), SocialRewards (ref), ATM_changeTab (ref), u13 (ref), ATM_ToggleBusy (ref), u2 (ref), ATM_MessageHandler (ref), ATM (ref), u8 (ref), u3 (ref), AddCommas (ref), LocalPlayer (ref), ATM_AllowanceChange (ref), Character (ref), HumanoidRootPart (ref), Events (ref), ATM_UpdateProtection (ref), u9 (ref)
        u5.mF.Visible = false;

        for _, descendant in pairs(u5.mF:GetDescendants()) do
            if descendant:IsA("TextButton") then
                descendant.MouseEnter:Connect(function() -- Line: 490
                    -- upvalues: UISounds (ref)
                    UISounds.hover:Play();
                end);
                descendant.MouseButton1Click:Connect(function() -- Line: 493
                    -- upvalues: UISounds (ref)
                    UISounds.click:Play();
                end);
            end;
        end;

        u5.atm_f.JoinGroupButton.MouseButton1Click:Connect(function() -- Line: 499
            -- upvalues: u10 (ref), Events2 (ref)
            if u10 then
                return;
            end;

            task.spawn(function() -- Line: 502
                -- upvalues: Events2 (ref)
                Events2.GroupJoinPrompt:Invoke();
            end);
        end);
        u5.atm_f_b.Button.MouseButton1Click:Connect(function() -- Line: 510
            -- upvalues: u10 (ref), u22 (ref), UISounds (ref), u5 (ref), u23 (ref)
            if u10 then
                return;
            end;

            if u22 ~= 1 then
                UISounds.click:Play();
                u5.red_f.Visible = false;
                u5.atm_f.Visible = true;
                u5.atm_f_b.Selected.Visible = true;
                u5.red_f_b.Selected.Visible = false;
                u23 = u22;
                u22 = 1;
            end;
        end);
        u5.red_f_b.Button.MouseButton1Click:Connect(function() -- Line: 522
            -- upvalues: u10 (ref), u22 (ref), UISounds (ref), u5 (ref), u23 (ref)
            if u10 then
                return;
            end;

            if u22 ~= 2 then
                UISounds.click:Play();
                u5.red_f.Visible = true;
                u5.atm_f.Visible = false;
                u5.atm_f_b.Selected.Visible = false;
                u5.red_f_b.Selected.Visible = true;
                u23 = u22;
                u22 = 2;
            end;
        end);
        u5.soc_f_b.Button.MouseButton1Click:Connect(function() -- Line: 531
            -- upvalues: u10 (ref), u22 (ref), UISounds (ref), u5 (ref), Events2 (ref), u23 (ref)
            if u10 then
                return;
            end;

            if u22 ~= 3 then
                UISounds.click:Play();
                u5.mF.Visible = false;
                Events2.ToggleSocialRewards:Fire(true);
                u23 = u22;
                u22 = 3;
            end;
        end);
        Events2.SocialRewardsClosed.Event:Connect(function() -- Line: 540
            -- upvalues: u16 (ref), u22 (ref), u5 (ref), SocialRewards (ref), ATM_changeTab (ref), u23 (ref)
            if u16 and u22 == 3 then
                u5.mF.Visible = true;
                local v62 = SocialRewards.countAvailableSocials();

                if v62 > 0 then
                    u5.soc_f_b.Hint.Visible = true;
                    u5.soc_f_b.Hint.Text = v62;
                else
                    u5.soc_f_b.Hint.Visible = false;
                end;

                ATM_changeTab(u23);
            end;
        end);
        u5.r_button.MouseButton1Click:Connect(function() -- Line: 556
            -- upvalues: u13 (ref), u16 (ref), u10 (ref), ATM_ToggleBusy (ref), UISounds (ref), u2 (ref), ATM_MessageHandler (ref), u5 (ref), ATM (ref)
            if not (u13 and u16) then
                return;
            end;

            if u10 then
                return;
            end;

            if u13.Parent.Values.Busy.Value then
                return;
            end;

            ATM_ToggleBusy(true);
            UISounds.click:Play();
            u2.toggle:Play();
            ATM_MessageHandler("m", "PROCESSING...", 3);
            local Text = u5.r_box.Text;
            local v63, v64, v65, _, v66 = pcall(function() -- Line: 570
                -- upvalues: ATM (ref), Text (copy), u13 (ref)
                return ATM:InvokeServer("REDEEM", Text, u13);
            end);

            if not v63 then
                v64 = false;
                v65 = nil;
                v66 = nil;
            end;

            ATM_MessageHandler(v64, v65, 2.5);

            if v64 or not u16 then
                if v64 then
                    u5.r_box.Text = "";
                    UISounds.purchase:Play();
                    u2.toggle:Play();
                end;
            else
                UISounds.error:Play();
            end;

            if v66 then
                wait(v66);
            end;

            ATM_ToggleBusy(false);
        end);
        u5.red_f.Visible = false;
        u5.atm_f.Visible = true;
        u5.atm_f_b.Selected.Visible = true;
        u5.red_f_b.Selected.Visible = false;
        u23 = u22;
        u22 = 1;
        u5.d_but2.MouseButton1Click:Connect(function() -- Line: 593
            -- upvalues: u13 (ref), u16 (ref), u10 (ref), UISounds (ref), u8 (ref), u5 (ref)
            if not (u13 and u16) then
                return;
            end;

            if u10 then
                return;
            end;

            UISounds.click:Play();

            if u8.Cash.Value > 0 then
                u5.d_box.Text = tostring(u8.Cash.Value);
            end;
        end);
        u5.d_but.MouseButton1Click:Connect(function() -- Line: 607
            -- upvalues: u13 (ref), u16 (ref), u10 (ref), ATM_ToggleBusy (ref), u5 (ref), ATM_MessageHandler (ref), u2 (ref), UISounds (ref), ATM (ref)
            if not (u13 and u16) then
                return;
            end;

            if u10 then
                return;
            end;

            if u13.Parent.Values.Busy.Value then
                return;
            end;

            ATM_ToggleBusy(true);
            local u67 = tonumber(u5.d_box.Text);

            if u67 then
                if math.floor(u67) == u67 then
                    u2.toggle:Play();
                    UISounds.click:Play();
                    ATM_MessageHandler("m", "PROCESSING...", 3);
                    local v68, v69, v70, v71, v72 = pcall(function() -- Line: 625
                        -- upvalues: ATM (ref), u67 (copy), u13 (ref)
                        return ATM:InvokeServer("DP", u67, u13);
                    end);

                    if not v68 then
                        v71 = nil;
                        v69 = false;
                        v70 = nil;
                        v72 = nil;
                    end;

                    if v71 and (u13 and u13:FindFirstChild("error")) then
                        u13.error:Play();
                    end;

                    ATM_MessageHandler(v69, v70, 2.5);

                    if v69 or not u16 then
                        if v69 then
                            u2.toggle:Play();
                        end;
                    else
                        UISounds.error:Play();
                    end;

                    if v72 then
                        wait(v72);
                    end;
                else
                    ATM_MessageHandler(false, "WE DON\'T DO DECIMALS BIG MAN", 1.5);
                end;
            else
                ATM_MessageHandler(false, "MUST BE A NUMBER", 1.5);
            end;

            ATM_ToggleBusy(false);
        end);
        u5.w_but.MouseButton1Click:Connect(function() -- Line: 648
            -- upvalues: u13 (ref), u16 (ref), u10 (ref), ATM_ToggleBusy (ref), u5 (ref), ATM_MessageHandler (ref), u2 (ref), UISounds (ref), ATM (ref)
            if not (u13 and u16) then
                return;
            end;

            if u10 then
                return;
            end;

            if u13.Parent.Values.Busy.Value then
                return;
            end;

            ATM_ToggleBusy(true);
            local u73 = tonumber(u5.w_box.Text);

            if u73 then
                if math.floor(u73) == u73 then
                    u2.toggle:Play();
                    UISounds.click:Play();
                    ATM_MessageHandler("m", "PROCESSING...", 3);
                    local v74, v75, v76, v77, v78 = pcall(function() -- Line: 665
                        -- upvalues: ATM (ref), u73 (copy), u13 (ref)
                        return ATM:InvokeServer("WI", u73, u13);
                    end);

                    if not v74 then
                        v77 = nil;
                        v75 = false;
                        v76 = nil;
                        v78 = nil;
                    end;

                    if v77 and (u13 and u13:FindFirstChild("error")) then
                        u13.error:Play();
                    end;

                    ATM_MessageHandler(v75, v76, 2.5);

                    if v75 or not u16 then
                        if v75 then
                            u2.toggle:Play();
                        end;
                    else
                        UISounds.error:Play();
                    end;

                    if v78 then
                        wait(v78);
                    end;
                else
                    ATM_MessageHandler(false, "WE DON\'T DO DECIMALS BIG MAN", 1.5);
                end;
            else
                ATM_MessageHandler(false, "MUST BE A NUMBER", 1.5);
            end;

            ATM_ToggleBusy(false);
        end);
        u5.cb.MouseButton1Click:Connect(function() -- Line: 687
            -- upvalues: u3 (ref)
            u3(false);
        end);
        u5.w_box:GetPropertyChangedSignal("Text"):Connect(function() -- Line: 691
            -- upvalues: u5 (ref)
            if _G.DeviceType == 1 then
                u5.w_box.Text = u5.w_box.Text:gsub("[^%-%d]", "");
            end;
        end);
        u5.w_box.FocusLost:Connect(function() -- Line: 696
            -- upvalues: u5 (ref)
            u5.w_box.Text = u5.w_box.Text:gsub("[^%-%d]", "");
        end);
        u5.d_box:GetPropertyChangedSignal("Text"):Connect(function() -- Line: 700
            -- upvalues: u5 (ref)
            if _G.DeviceType == 1 then
                u5.d_box.Text = u5.d_box.Text:gsub("[^%-%d]", "");
            end;
        end);
        u5.d_box.FocusLost:Connect(function() -- Line: 705
            -- upvalues: u5 (ref)
            u5.d_box.Text = u5.d_box.Text:gsub("[^%-%d]", "");
        end);
        u8.Cash.Changed:Connect(function() -- Line: 709
            -- upvalues: u5 (ref), AddCommas (ref), u8 (ref)
            u5.cashT.Text = "$" .. AddCommas(u8.Cash.Value);
        end);
        u5.cashT.Text = "$" .. AddCommas(_G.PlayerData.Cash);

        if u13 then
            local u79 = nil;
            u79 = u13.Parent.Values.Busy.Changed:Connect(function() -- Line: 716
                -- upvalues: u13 (ref), LocalPlayer (ref), u3 (ref), u79 (ref)
                wait();

                if u13.Parent.Values.User.Value ~= LocalPlayer and u13.Parent.Values.User.Value ~= nil then
                    u3(false);
                    u79:Disconnect();
                end;
            end);
        end;

        Events2:WaitForChild("ATM").Event:Connect(function(p80) -- Line: 725
            -- upvalues: u16 (ref), u13 (ref), ATM_AllowanceChange (ref), u3 (ref), Character (ref), HumanoidRootPart (ref)
            if not u16 then
                u13 = p80;
                ATM_AllowanceChange();
                u3(true);

                while u16 do
                    wait(0.05);

                    if not _G.CheckIfCan(Character, "Any") or (HumanoidRootPart.Position - u13.Position).Magnitude > 6.5 then
                        u3(false);

                        return;
                    end;
                end;
            end;
        end);
        Events.BYZERSPROTEC.OnClientEvent:Connect(ATM_UpdateProtection);
        u8:WaitForChild("NextAllowance"):GetPropertyChangedSignal("Value"):Connect(ATM_AllowanceChange);
        u8.NextAllowance:WaitForChild("Claim"):GetPropertyChangedSignal("Value"):Connect(ATM_AllowanceChange);
        u5.allowanceF.ClaimButton.TextButton.MouseButton1Click:Connect(function() -- Line: 752
            -- upvalues: u9 (ref), u5 (ref), Events (ref), u13 (ref), ATM_MessageHandler (ref)
            if u9 then
                return;
            end;

            u9 = true;
            u5.allowanceF.ClaimButton.TextButton.Visible = false;
            u5.allowanceF.ClaimButton.Pause.Visible = true;
            u5.allowanceF.ClaimButton.ImageColor3 = Color3.fromRGB(122, 122, 122);
            local v81, v82, v83, v84 = pcall(function() -- Line: 760
                -- upvalues: Events (ref), u13 (ref)
                return Events.CLMZALOW:InvokeServer(u13, nil);
            end);

            if not v81 then
                v82 = false;
                v83 = nil;
                v84 = nil;
            end;

            if v82 then
                ATM_MessageHandler(v82, v83, v84);
            elseif v83 == "YOU ARE TOO INJURED TO DO THIS RIGHT NOW" then
                ATM_MessageHandler(false, v83);
            else
                ATM_MessageHandler(false, "AN ERROR OCCURRED IN YOUR REQUEST");
            end;

            u5.allowanceF.ClaimButton.TextButton.Visible = true;
            u5.allowanceF.ClaimButton.Pause.Visible = false;
            u5.allowanceF.ClaimButton.ImageColor3 = Color3.fromRGB(133, 255, 235);
            u9 = false;
        end);
    end)();
    Vending_H();
    Mystery_H();
    u11.Currents.ChildAdded:Connect(function(p85) -- Line: 940
        -- upvalues: u3 (ref)
        if p85.Name == "Flinching" then
            u3(false);
        end;
    end);

    local function updtInpType(p86) -- Line: 947
        -- upvalues: u5 (ref), UserInputService (ref)
        if p86 ~= 2 then
            u5.cb.TextColor3 = Color3.fromRGB(255, 255, 255);
            u5.cb.Text = "X";
            u5.cb.ImageLabel.Visible = false;

            return;
        end;

        u5.cb.TextColor3 = Color3.fromRGB(255, 170, 0);
        u5.cb.Text = "";
        local ImageForKeyCode = UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonY);
        u5.cb.ImageLabel.Image = ImageForKeyCode or "";
        u5.cb.ImageLabel.Visible = true;
    end;

    UserInputService.InputBegan:Connect(function(p87, p88) -- Line: 963
        -- upvalues: u16 (ref), u3 (ref), u17 (ref), Vending_GuiToggle (ref)
        if p87.KeyCode == Enum.KeyCode.ButtonY and not p88 then
            if u16 then
                u3(false);
            end;

            if u17 then
                Vending_GuiToggle(false);
            end;
        end;
    end);
    Events2.InputTypeChanged.Event:Connect(updtInpType);
    updtInpType(_G.InputType);
end)();

return v1;
-- ============================================================
-- SCRIPT: Hud
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface.Modules.Hud
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");
local TweenService = game:GetService("TweenService");
local StarterGui = game:GetService("StarterGui");
local RunService = game:GetService("RunService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local UserInputService = game:GetService("UserInputService");
game:GetService("ContentProvider");
local Events = ReplicatedStorage:WaitForChild("Events");
local Events2 = ReplicatedStorage:WaitForChild("Events2");
local LocalPlayer = Players.LocalPlayer;
local Mouse = LocalPlayer:GetMouse();
local CoreGUI = script.Parent.Parent.CoreGUI;
local MFrame = CoreGUI:WaitForChild("MFrame");
local SlotFrame = CoreGUI:WaitForChild("SlotFrame");
local HealthFrame = MFrame:WaitForChild("HealthFrame");
local BodyFrame = MFrame:WaitForChild("BodyFrame");
local Frame = MFrame:WaitForChild("IndicatorsFrame"):WaitForChild("Frame");
local Bar = HealthFrame:WaitForChild("Bar");
local Bar2 = HealthFrame:WaitForChild("Bar2");
local HealthNum = HealthFrame:WaitForChild("HealthNum");
local StaminaFrame = MFrame:WaitForChild("StaminaFrame");
local StaminaNum = StaminaFrame:WaitForChild("StaminaNum");
local Bar3 = StaminaFrame:WaitForChild("Bar");
local Bar22 = StaminaFrame:WaitForChild("Bar2");
local Number = SlotFrame:WaitForChild("Number");
local HoverUI = script:WaitForChild("HoverUI");
local u1 = nil;
local v2 = {};

repeat
    task.wait(0.5);
until _G.WaitForChar and (_G.GVF and _G.GVF());

_G.WaitForChar();

if not (LocalPlayer.Character and CoreGUI.Parent) then
    script.Parent = nil;
    wait(100);
end;

local u3 = {};

local function run() -- Line: 44
    -- upvalues: LocalPlayer (copy), u1 (ref), HoverUI (copy), Bar3 (copy), CoreGUI (copy), MFrame (copy), Events2 (copy), ReplicatedStorage (copy), TweenService (copy), BodyFrame (copy), HealthNum (copy), Bar2 (copy), Bar (copy), StaminaNum (copy), Bar22 (copy), Frame (copy), u3 (copy), Number (copy), RunService (copy), Mouse (copy), Events (copy), StarterGui (copy), SlotFrame (copy), UserInputService (copy)
    local Character = LocalPlayer.Character;
    local _G_GVF_ret = _G.GVF();
    local Humanoid = Character:WaitForChild("Humanoid");
    u1 = HoverUI:Clone();
    TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
    ({}).BackgroundColor3 = Color3.fromRGB(143, 0, 0);
    local u4 = nil;
    local BackgroundColor3 = Bar3.BackgroundColor3;
    local u5 = {};
    local u6 = {};
    local u7 = {};
    local Health = Humanoid.Health;
    local u8 = {};
    local u9 = false;
    local u10 = false;
    local u11 = false;
    local u12 = nil;
    local CombatFrame3 = CoreGUI:WaitForChild("CombatFrame1"):WaitForChild("CombatFrame2"):WaitForChild("CombatFrame3");
    local InCombat = CombatFrame3:WaitForChild("InCombat");
    local Protected = CombatFrame3:WaitForChild("Protected");
    local BloodShot = CoreGUI:WaitForChild("BloodShot");
    local FrostOverlay = CoreGUI:WaitForChild("FrostOverlay");
    local MouseLockButton = MFrame:WaitForChild("MouseLockButton");
    local u13 = nil;
    local u14 = nil;
    local u15 = nil;
    local CantStamina = Events2:WaitForChild("CantStamina");
    local GotStamina = Events2:WaitForChild("GotStamina");
    local StaminaChange = Events2:WaitForChild("StaminaChange");
    Character:WaitForChild("Torso");
    Character:WaitForChild("Head");

    local function round(p16, p17) -- Line: 90
        local v18 = 10 ^ (p17 or 0);

        return math.floor(p16 * v18 + 0.5) / v18;
    end;

    local function Lerp(p19, p20, p21) -- Line: 95
        return p19 + (p20 - p19) * p21;
    end;

    local function shallowCopy(p22) -- Line: 99
        local v23 = {};

        for i, v in pairs(p22) do
            v23[i] = v;
        end;

        return v23;
    end;

    local Downed = _G_GVF_ret.Downed;

    local function getArmor(p24) -- Line: 109
        -- upvalues: _G_GVF_ret (copy)
        return _G_GVF_ret.ArmoredParts:FindFirstChild(p24);
    end;

    local function updateDisplayName() -- Line: 113
        -- upvalues: MFrame (ref), Humanoid (copy)
        MFrame.DisplayNameLabel.Visible = _G.GSettings and _G.GSettings.UITag or not _G.GSettings;
        MFrame.DisplayNameLabel.Text = Humanoid.DisplayName;
    end;

    local ColorHueAdjuster = require(ReplicatedStorage.NewModules.Shared.Extensions.ColorHueAdjuster);
    local u25 = nil;

    local function UpdateFrostOverlay() -- Line: 123
        -- upvalues: _G_GVF_ret (copy), Humanoid (copy), FrostOverlay (copy), u25 (ref), TweenService (ref)
        local FrostOverlay2 = _G_GVF_ret.Currents:FindFirstChild("FrostOverlay");
        local v26 = 1;
        local v27, v28;

        if FrostOverlay2 and (FrostOverlay2.ClassName == "DoubleConstrainedValue" and not (not (Humanoid and Humanoid.Parent) or Humanoid and Humanoid.Health <= 0)) then
            local math_clamp_ret = math.clamp(FrostOverlay2.Value / FrostOverlay2.MaxValue, 0, 1);
            v27 = math_clamp_ret * 0.6;
            v28 = 1 - math_clamp_ret;
        else
            v28 = 1;
            v27 = 0;
            v26 = 3;
        end;

        if v28 < 1 then
            FrostOverlay.Visible = true;

            if not (u25 and u25.Parent) then
                u25 = Instance.new("NumberValue");
                u25.Name = "POIZSKRATA";
                u25:SetAttribute("CustomColor", Color3.fromRGB(140, 221, 255));
                u25.Parent = _G_GVF_ret.Currents;
            end;

            u25.Value = v27;
        else
            if u25 and u25.Parent then
                u25:Destroy();
            end;

            u25 = nil;
        end;

        TweenService:Create(FrostOverlay, TweenInfo.new(v26, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            ImageTransparency = v28
        }):Play();
    end;

    local function HealthDo() -- Line: 160
        -- upvalues: BodyFrame (ref), u5 (copy), Humanoid (copy), Downed (copy), HealthNum (ref), u11 (ref), TweenService (ref), Bar2 (ref), Bar (ref), Character (copy), u12 (ref), u1 (ref), _G_GVF_ret (copy), u8 (copy), u6 (copy), u7 (copy), BloodShot (copy), Health (ref)
        if not (BodyFrame and BodyFrame.Parent) then
            return;
        end;

        pcall(function() -- Line: 163
            -- upvalues: u5 (ref)
            for i, v in pairs(u5) do
                v:Cancel();
                table.remove(u5, i);
            end;
        end);
        local Color3_fromRGB_ret = Color3.fromRGB(187, 255, 207);
        local Color3_fromRGB_ret2 = Color3.fromRGB(170, 0, 0);
        local Color3_fromRGB_ret3 = Color3.fromRGB(170, 0, 0);
        local Color3_fromRGB_ret4 = Color3.fromRGB(120, 0, 0);
        local v29 = math.max(Humanoid.MaxHealth, 0) - 14.99;
        local Health2 = Humanoid.Health;
        local u30 = Color3_fromRGB_ret:Lerp(Color3_fromRGB_ret2, 1 - Health2 / v29);
        local u31 = nil;
        local v32 = false;
        local v33;

        if Humanoid.Health <= 15 or Downed.Value then
            v33 = 0 + 100 * (Health2 / 25);
            v32 = true;
            u30 = Color3_fromRGB_ret3:Lerp(Color3_fromRGB_ret4, 1 - v33 / v29);
            HealthNum.TextColor3 = Color3.new(1, 0, 0);
            u31 = "DOWNED";

            if not u11 then
                TweenService:Create(Bar2, TweenInfo.new(0.65, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Size = UDim2.new(v33 / v29, 0, 1, 0)
                }):Play();
            end;

            u11 = true;
        elseif Downed.Value then
            v33 = Health2;
        else
            u11 = false;
            v33 = 0 + 100 * ((Health2 - 14.99) / 100);
            u30 = Color3_fromRGB_ret:Lerp(Color3_fromRGB_ret2, 1 - v33 / v29);
            HealthNum.Visible = true;
            HealthNum.TextColor3 = Color3.new(1, 1, 1);
            local math_floor_ret = math.floor(v33);
            u31 = (v33 < 1 and v33 > 0 and "<1" or math_floor_ret) .. "%";
        end;

        local math_max_ret = math.max(v33, 0);
        HealthNum.Text = u31 or "";
        HealthNum.TextColor3 = Color3.fromRGB(255 - u30.R / 2, 255 - u30.g / 2, 255 - u30.B / 2);
        Bar.Size = UDim2.new(math_max_ret / v29, 0, 0.8, 0);
        TweenService:Create(Bar, TweenInfo.new(0.65, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = u30
        }):Play();
        Bar2.BackgroundColor3 = u30;
        TweenService:Create(Bar2, TweenInfo.new(0.65, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(math_max_ret / v29, 0, 0.8, 0)
        }):Play();
        local TweenInfo_new_ret = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
        TweenService:Create(BodyFrame.Torso, TweenInfo_new_ret, {
            BackgroundColor3 = u30
        }):Play();
        (function() -- Line: 252, Name: brez
            -- upvalues: Character (ref), BodyFrame (ref), u12 (ref), u1 (ref), u31 (ref), u30 (ref), _G_GVF_ret (ref)
            local _G_IsArmoredCheck_ret, _, v34 = _G.IsArmoredCheck(Character, "Torso");
            BodyFrame.Torso.Armored.Visible = _G_IsArmoredCheck_ret;
            BodyFrame.Torso.Armored.BackgroundColor3 = _G_IsArmoredCheck_ret and (v34 and Color3.fromRGB(85, 170, 255)) or Color3.fromRGB(81, 81, 81);

            if u12 == BodyFrame.Torso then
                u1.Health.value.Text = u31;
                u1.Health.value.TextColor3 = u30;
                u1.Fracture.Visible = false;

                if _G_IsArmoredCheck_ret then
                    u1.Armor.Visible = true;
                    local v35;

                    if u12.Name == "Head" then
                        v35 = _G_GVF_ret.ArmorHP.Head;
                    else
                        v35 = _G_GVF_ret.ArmorHP.Body;
                    end;

                    local v36;

                    if v35.Value <= 0 then
                        v36 = "BROKEN";
                    else
                        local math_max_ret2 = math.max(v35.Value / v35.MaxValue * 100, 1);
                        v36 = math.floor(math_max_ret2) .. "%";
                    end;

                    u1.Armor.value.Text = v36;
                    local v37 = Color3.fromRGB(85, 170, 255):Lerp(Color3.fromRGB(211, 0, 3), 1 - v35.Value / v35.MaxValue);
                    u1.Armor.value.TextColor3 = v37;

                    return;
                end;

                u1.Armor.Visible = false;
            end;
        end)();

        for _, v in pairs(u8) do
            local v38 = v[1];
            local v39 = v[2];
            local Color3_new_ret = Color3.new(1, 1, 1);
            local v40 = false;
            local v41 = BodyFrame:FindFirstChild(v39.Name);
            local v42 = 0;
            local _G_IsArmoredCheck_ret, _, v43 = _G.IsArmoredCheck(Character, v39.Name);
            v41.Armored.Visible = _G_IsArmoredCheck_ret;
            v41.Armored.BackgroundColor3 = _G_IsArmoredCheck_ret and (v43 and Color3.fromRGB(85, 170, 255)) or Color3.fromRGB(81, 81, 81);
            v41.Bar.BackgroundTransparency = 1;

            if v38 and (v38.Parent and not (v39.Broken.Value or v39.Destroyed.Value)) then
                Color3_new_ret = Color3_fromRGB_ret:Lerp(Color3_fromRGB_ret2, 1 - v39.Value / v39.MaxValue);
                v41.Visible = true;
                v42 = 0;
            elseif v39.Destroyed.Value or v38 and v38.Parent then
                if v39.Destroyed.Value then
                    Color3_new_ret = Color3.new(0, 0, 0);
                    v41.Bar.BackgroundTransparency = 1;
                elseif v39.Broken.Value then
                    v40 = true;
                    Color3_new_ret = Color3_fromRGB_ret:Lerp(Color3_fromRGB_ret2, 1 - v39.Value / v39.MaxValue);
                    local v44 = v39.Value / v39.MaxValue;

                    if not u6[v] or u7[v] then
                        v41.Bar.Position = UDim2.new(0, 0, 1, 0);
                        v41.Bar.Size = UDim2.new(1, 0, 0, 0);
                        v41.BackgroundColor3 = Color3.new(1, 0, 0);
                        v41.BackgroundTransparency = 0;

                        if u7[v] then
                            u7[v]:Cancel();
                            u7[v] = nil;
                        end;

                        local v45 = TweenService:Create(v41, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 100000, true), {
                            BackgroundTransparency = 0.65
                        });
                        u6[v] = v45;
                        v45:Play();
                    end;

                    v41.Bar.BackgroundTransparency = 0.5;
                    v41.Bar:TweenSizeAndPosition(UDim2.new(1, 0, v44, 0), UDim2.new(0, 0, 1 - v44, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 0.25, true);
                end;
            end;

            if v41 == u12 then
                u1.Health.value.Text = math.floor(v39.Destroyed.Value and 0 or v39.Value) .. "%";
                u1.Health.value.TextColor3 = Color3_new_ret;

                if _G_IsArmoredCheck_ret then
                    local v46;

                    if u12.Name == "Head" then
                        v46 = _G_GVF_ret.ArmorHP.Head;
                    else
                        v46 = _G_GVF_ret.ArmorHP.Body;
                    end;

                    local v47;

                    if v46.Value <= 0 then
                        v47 = "BROKEN";
                    else
                        local math_max_ret2 = math.max(v46.Value / v46.MaxValue * 100, 1);
                        v47 = math.floor(math_max_ret2) .. "%";
                    end;

                    u1.Armor.value.Text = v47;
                    local v48 = Color3.fromRGB(85, 170, 255):Lerp(Color3.fromRGB(170, 0, 0), 1 - v46.Value / v46.MaxValue);
                    u1.Armor.value.TextColor3 = v48;
                    u1.Armor.Visible = true;
                else
                    u1.Armor.Visible = false;
                end;

                if v39.Destroyed.Value then
                    u1.Fracture.value.Text = "DESTROYED";
                    u1.Fracture.Visible = true;
                elseif v39.Broken.Value then
                    u1.Fracture.value.Text = v39.Name == "Head" and "BROKEN" or "FRACTURED";
                    u1.Fracture.Visible = true;
                else
                    u1.Fracture.Visible = false;
                end;
            end;

            if not v40 then
                if u6[v] then
                    u6[v]:Cancel();
                    u6[v] = nil;
                end;

                local v49 = TweenService:Create(v41, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundColor3 = Color3_new_ret,
                    BackgroundTransparency = v42
                });
                v49:Play();
                u7[v] = v49;
            end;
        end;

        local v50 = 2;
        local math_clamp_ret = math.clamp(Health2 / v29, 0.9, 1);

        if Health2 > 0 and v32 then
            math_clamp_ret = math.clamp(math_max_ret / v29, 0.6, 0.8);
        elseif Health2 <= 0 then
            v50 = v50 * 1.5;
            math_clamp_ret = 1;
        end;

        TweenService:Create(BloodShot, TweenInfo.new(v50, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            ImageTransparency = math_clamp_ret
        }):Play();
        Health = Humanoid.Health;
    end;

    local u51 = false;

    local function QueueHealthDo() -- Line: 436
        -- upvalues: u51 (ref), LocalPlayer (ref), Character (copy), HealthDo (copy)
        if u51 then
            return;
        end;

        u51 = true;
        task.defer(function() -- Line: 439
            -- upvalues: u51 (ref), LocalPlayer (ref), Character (ref), HealthDo (ref)
            u51 = false;

            if LocalPlayer.Character ~= Character then
                return;
            end;

            HealthDo();
        end);
    end;

    local function UpdateStamina(u52, u53) -- Line: 446
        -- upvalues: StaminaNum (ref), Bar3 (ref), Bar22 (ref)
        local math_floor_ret = math.floor(u52);
        StaminaNum.Text = (u52 < 1 and u52 > 0 and "<1" or math_floor_ret) .. "%";
        local _ = Bar3.Size.Y.Scale;
        Bar3.Size = UDim2.new(u52 / u53, 0, 0.8, 0);
        pcall(function() -- Line: 455
            -- upvalues: Bar22 (ref), u52 (copy), u53 (copy)
            Bar22:TweenSizeAndPosition(UDim2.new(u52 / u53, 0, 0.8, 0), UDim2.new(0, 0, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.65, true);
        end);
    end;

    local function u54() -- Line: 467
        -- upvalues: u4 (ref), Bar3 (ref), BackgroundColor3 (copy), TweenService (ref)
        pcall(function() -- Line: 468
            -- upvalues: u4 (ref)
            u4:Cancel();
        end);
        Bar3.BackgroundColor3 = BackgroundColor3;
        u4 = TweenService:Create(Bar3, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true), {
            BackgroundColor3 = Color3.fromRGB(254, 161, 165)
        });
        u4:Play();
    end;

    local function u55() -- Line: 483
        -- upvalues: u4 (ref), Bar3 (ref), BackgroundColor3 (copy), TweenService (ref)
        pcall(function() -- Line: 484
            -- upvalues: u4 (ref)
            u4:Cancel();
        end);
        Bar3.BackgroundColor3 = BackgroundColor3;
        u4 = TweenService:Create(Bar3, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true), {
            BackgroundColor3 = Color3.fromRGB(155, 254, 205)
        });
        u4:Play();
    end;

    local function u57(p56) -- Line: 496
        -- upvalues: u9 (ref), u13 (ref), InCombat (copy), TweenService (ref)
        if not p56 or u9 then
            if not p56 and u9 then
                u9 = false;

                if u13 then
                    u13:Cancel();
                end;

                u13 = nil;
                InCombat.Visible = false;
            end;

            return;
        end;

        u9 = true;

        if u13 then
            u13:Cancel();
        end;

        InCombat.ImageTransparency = 0.5;
        InCombat.ImageColor3 = Color3.new(1, 1, 1);
        u13 = TweenService:Create(InCombat, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, (1 / 0), true), {
            ImageTransparency = 0.2,
            ImageColor3 = Color3.fromRGB(255, 144, 146)
        });
        InCombat.Visible = true;
        u13:Play();
    end;

    local function u59(p58) -- Line: 520
        -- upvalues: u10 (ref), u14 (ref), Protected (copy), TweenService (ref)
        if not p58 or u10 then
            if not p58 and u10 then
                u10 = false;

                if u14 then
                    u14:Cancel();
                end;

                u14 = nil;
                Protected.Visible = false;
            end;

            return;
        end;

        u10 = true;

        if u14 then
            u14:Cancel();
        end;

        Protected.ImageTransparency = 0.5;
        Protected.ImageColor3 = Color3.new(1, 1, 1);
        u14 = TweenService:Create(Protected, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, (1 / 0), true), {
            ImageTransparency = 0.25
        });
        Protected.Visible = true;
        u14:Play();
    end;

    u9 = true;

    if u9 then
        u9 = false;

        if u13 then
            u13:Cancel();
        end;

        u13 = nil;
        InCombat.Visible = false;
    end;

    local function IndicatorHandler() -- Line: 547
        -- upvalues: Bar3 (ref), TweenService (ref), _G_GVF_ret (copy), Frame (ref), ColorHueAdjuster (copy), Humanoid (copy), FrostOverlay (copy), u10 (ref), u14 (ref), Protected (copy), u3 (ref)
        local u60 = nil;
        local u61 = nil;
        local u62 = nil;
        local u63 = nil;
        local u64 = nil;
        local u65 = nil;
        local u66 = nil;
        local u67 = nil;
        local u68 = nil;
        local u69 = false;
        local u70 = false;
        local u71 = false;
        local u72 = false;
        local u73 = false;
        local u74 = false;
        local u75 = false;
        local u76 = false;
        local u77 = false;
        local u78 = false;

        local function Rage(p79) -- Line: 570
            -- upvalues: u69 (ref), u60 (ref), Bar3 (ref), TweenService (ref)
            if not p79 then
                u69 = false;

                if u60 then
                    u60:Cancel();
                end;

                u60 = TweenService:Create(Bar3.Red, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                    BackgroundTransparency = 1,
                    BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                });
                u60:Play();
                wait(1);

                if not u69 then
                    Bar3.Red.Visible = false;
                end;

                return;
            end;

            u69 = true;

            if u60 then
                u60:Cancel();
            end;

            Bar3.Red.BackgroundColor3 = Color3.fromRGB(255, 0, 0);
            Bar3.Red.BackgroundTransparency = 0.25;
            u60 = TweenService:Create(Bar3.Red, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 30, true), {
                BackgroundColor3 = Color3.fromRGB(255, 93, 93)
            });
            u60:Play();
            Bar3.Red.Visible = true;
        end;

        local function Bleed(p80) -- Line: 597
            -- upvalues: _G_GVF_ret (ref), u70 (ref), u61 (ref), Frame (ref), TweenService (ref)
            if not (p80 and (_G_GVF_ret.Currents:FindFirstChild("Bleeding") or _G_GVF_ret.Currents:FindFirstChild("Bleeding2"))) or u70 then
                if not (p80 or (_G_GVF_ret.Currents:FindFirstChild("Bleeding") or (_G_GVF_ret.Currents:FindFirstChild("Bleeding2") or not u70))) then
                    u70 = false;

                    if u61 then
                        u61:Cancel();
                    end;

                    u61 = TweenService:Create(Frame.Bleeding.Icon, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        ImageTransparency = 1,
                        ImageColor3 = Color3.new(1, 1, 1)
                    });
                    u61:Play();
                    TweenService:Create(Frame.Bleeding.BG, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        ImageTransparency = 1
                    }):Play();
                    delay(0.25, function() -- Line: 627
                        -- upvalues: u70 (ref), Frame (ref)
                        if not u70 then
                            Frame.Bleeding.Visible = false;
                        end;
                    end);
                end;

                return;
            end;

            u70 = true;

            if u61 then
                u61:Cancel();
            end;

            Frame.Bleeding.Icon.ImageColor3 = Color3.new(1, 1, 1);
            Frame.Bleeding.Icon.ImageTransparency = 0.5;
            u61 = TweenService:Create(Frame.Bleeding.Icon, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, (1 / 0), true), {
                ImageTransparency = 0.2,
                ImageColor3 = Color3.fromRGB(253, 73, 76)
            });
            u61:Play();
            TweenService:Create(Frame.Bleeding.BG, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                ImageTransparency = 0.8
            }):Play();
            Frame.Bleeding.Visible = true;
        end;

        local function Drown(p81) -- Line: 635
            -- upvalues: _G_GVF_ret (ref), u71 (ref), u62 (ref), Frame (ref), TweenService (ref)
            if not (p81 and (_G_GVF_ret.Currents:FindFirstChild("Drowning") and not u71)) then
                if not (p81 or (_G_GVF_ret.Currents:FindFirstChild("Drowning") or not u71)) then
                    u71 = false;

                    if u62 then
                        u62:Cancel();
                    end;

                    u62 = TweenService:Create(Frame.Drowning.Icon, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        ImageTransparency = 1,
                        ImageColor3 = Color3.new(1, 1, 1)
                    });
                    u62:Play();
                    TweenService:Create(Frame.Drowning.BG, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        ImageTransparency = 1
                    }):Play();
                    delay(0.25, function() -- Line: 667
                        -- upvalues: u71 (ref), Frame (ref)
                        if not u71 then
                            Frame.Drowning.Visible = false;
                        end;
                    end);
                end;

                return;
            end;

            u71 = true;

            if u62 then
                u62:Cancel();
            end;

            Frame.Drowning.Icon.ImageColor3 = Color3.new(1, 1, 1);
            Frame.Drowning.Icon.ImageTransparency = 0.5;
            u62 = TweenService:Create(Frame.Drowning.Icon, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, (1 / 0), true), {
                ImageTransparency = 0.2,
                ImageColor3 = Color3.fromRGB(253, 73, 76)
            });
            u62:Play();
            TweenService:Create(Frame.Drowning.BG, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                ImageTransparency = 0.8
            }):Play();
            Frame.Drowning.Visible = true;
        end;

        local function Underwater(p82) -- Line: 675
            -- upvalues: _G_GVF_ret (ref), u72 (ref), u63 (ref), Frame (ref), TweenService (ref)
            if not (p82 and (_G_GVF_ret.Currents:FindFirstChild("Underwater") and not u72)) then
                if not (p82 or (_G_GVF_ret.Currents:FindFirstChild("Underwater") or not u72)) then
                    u72 = false;

                    if u63 then
                        u63:Cancel();
                    end;

                    u63 = TweenService:Create(Frame.Underwater.Icon, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        ImageTransparency = 1,
                        ImageColor3 = Color3.new(1, 1, 1)
                    });
                    u63:Play();
                    TweenService:Create(Frame.Underwater.BG, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        ImageTransparency = 1
                    }):Play();
                    delay(0.25, function() -- Line: 707
                        -- upvalues: u72 (ref), Frame (ref)
                        if not u72 then
                            Frame.Underwater.Visible = false;
                        end;
                    end);
                end;

                return;
            end;

            u72 = true;

            if u63 then
                u63:Cancel();
            end;

            Frame.Underwater.Icon.ImageColor3 = Color3.new(1, 1, 1);
            Frame.Underwater.Icon.ImageTransparency = 0.5;
            u63 = TweenService:Create(Frame.Underwater.Icon, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, (1 / 0), true), {
                ImageTransparency = 0.2,
                ImageColor3 = Color3.fromRGB(253, 73, 76)
            });
            u63:Play();
            TweenService:Create(Frame.Underwater.BG, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                ImageTransparency = 0.8
            }):Play();
            Frame.Underwater.Visible = true;
        end;

        local function Stunned(p83) -- Line: 715
            -- upvalues: _G_GVF_ret (ref), u73 (ref), u64 (ref), Frame (ref), TweenService (ref)
            if not (p83 and (_G_GVF_ret.Currents:FindFirstChild("Stunned") and not u73)) then
                if not (p83 or (_G_GVF_ret.Currents:FindFirstChild("Stunned") or not u73)) then
                    u73 = false;

                    if u64 then
                        u64:Cancel();
                    end;

                    u64 = TweenService:Create(Frame.Stunned.Icon, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        ImageTransparency = 1,
                        ImageColor3 = Color3.new(1, 1, 1)
                    });
                    u64:Play();
                    TweenService:Create(Frame.Stunned.BG, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        ImageTransparency = 1
                    }):Play();
                    delay(0.25, function() -- Line: 745
                        -- upvalues: u73 (ref), Frame (ref)
                        if not u73 then
                            Frame.Stunned.Visible = false;
                        end;
                    end);
                end;

                return;
            end;

            u73 = true;

            if u64 then
                u64:Cancel();
            end;

            Frame.Stunned.Icon.ImageColor3 = Color3.new(1, 1, 1);
            Frame.Stunned.Icon.ImageTransparency = 0.5;
            u64 = TweenService:Create(Frame.Stunned.Icon, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, (1 / 0), true), {
                ImageTransparency = 0.2,
                ImageColor3 = Color3.fromRGB(253, 73, 76)
            });
            u64:Play();
            TweenService:Create(Frame.Stunned.BG, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                ImageTransparency = 0.8
            }):Play();
            Frame.Stunned.Visible = true;
        end;

        local function Poisoned(p84) -- Line: 753
            -- upvalues: _G_GVF_ret (ref), u74 (ref), u65 (ref), Frame (ref), ColorHueAdjuster (ref), TweenService (ref)
            if not (p84 and (_G_GVF_ret.Currents:FindFirstChild("POIZSKRATA") and not u74)) then
                if not (p84 or (_G_GVF_ret.Currents:FindFirstChild("POIZSKRATA") or not u74)) then
                    u74 = false;

                    if u65 then
                        u65:Cancel();
                    end;

                    u65 = TweenService:Create(Frame.Poisoned.Icon, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        ImageTransparency = 1,
                        ImageColor3 = Color3.new(1, 1, 1)
                    });
                    u65:Play();
                    TweenService:Create(Frame.Poisoned.BG, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        ImageTransparency = 1
                    }):Play();
                    delay(0.25, function() -- Line: 791
                        -- upvalues: u74 (ref), Frame (ref)
                        if not u74 then
                            Frame.Poisoned.Visible = false;
                        end;
                    end);
                end;

                return;
            end;

            u74 = true;

            if u65 then
                u65:Cancel();
            end;

            Frame.Poisoned.Icon.ImageColor3 = Color3.new(1, 1, 1);
            Frame.Poisoned.Icon.ImageTransparency = 0.5;
            local Color3_fromRGB_ret = Color3.fromRGB(157, 253, 72);
            local POIZSKRATA = _G_GVF_ret.Currents:FindFirstChild("POIZSKRATA");

            if POIZSKRATA then
                POIZSKRATA = POIZSKRATA:GetAttribute("CustomColor");
            end;

            if POIZSKRATA then
                Color3_fromRGB_ret = ColorHueAdjuster(Color3_fromRGB_ret, POIZSKRATA);
            end;

            u65 = TweenService:Create(Frame.Poisoned.Icon, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, (1 / 0), true), {
                ImageTransparency = 0.2,
                ImageColor3 = Color3_fromRGB_ret
            });
            u65:Play();
            TweenService:Create(Frame.Poisoned.BG, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                ImageTransparency = 0.8
            }):Play();
            Frame.Poisoned.Visible = true;
        end;

        local function u87() -- Line: 801
            -- upvalues: _G_GVF_ret (ref), Humanoid (ref), FrostOverlay (ref), TweenService (ref)
            local FrostOverlay2 = _G_GVF_ret.Currents:FindFirstChild("FrostOverlay");
            local v85 = 1;
            local v86;

            if FrostOverlay2 and (FrostOverlay2.ClassName == "DoubleConstrainedValue" and not (not (Humanoid and Humanoid.Parent) or Humanoid and Humanoid.Health <= 0)) then
                v86 = 1 - math.clamp(FrostOverlay2.Value / FrostOverlay2.MaxValue, 0, 1);
            else
                v86 = 1;
                v85 = 3;
            end;

            if v86 < 1 then
                FrostOverlay.Visible = true;
            end;

            TweenService:Create(FrostOverlay, TweenInfo.new(v85, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                ImageTransparency = v86
            }):Play();
        end;

        local function u93(p88) -- Line: 823
            -- upvalues: _G_GVF_ret (ref), u77 (ref), u68 (ref), Frame (ref), ColorHueAdjuster (ref), TweenService (ref), u87 (copy)
            if not (p88 and (_G_GVF_ret.Currents:FindFirstChild("FrostOverlay") and not u77)) then
                if not (p88 or (_G_GVF_ret.Currents:FindFirstChild("FrostOverlay") or not u77)) then
                    u77 = false;

                    if u68 then
                        u68:Cancel();
                    end;

                    u68 = TweenService:Create(Frame.FrostOverlay.Icon, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        ImageTransparency = 1,
                        ImageColor3 = Color3.new(1, 1, 1)
                    });
                    u68:Play();
                    TweenService:Create(Frame.FrostOverlay.BG, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        ImageTransparency = 1
                    }):Play();
                    u87();
                    delay(0.25, function() -- Line: 875
                        -- upvalues: u77 (ref), Frame (ref)
                        if not u77 then
                            Frame.FrostOverlay.Visible = false;
                        end;
                    end);
                end;

                return;
            end;

            u77 = true;

            if u68 then
                u68:Cancel();
            end;

            Frame.FrostOverlay.Icon.ImageColor3 = Color3.new(1, 1, 1);
            Frame.FrostOverlay.Icon.ImageTransparency = 0.5;
            local Color3_fromRGB_ret = Color3.fromRGB(107, 209, 253);
            local FrostOverlay2 = _G_GVF_ret.Currents:FindFirstChild("FrostOverlay");

            if FrostOverlay2 then
                FrostOverlay2 = FrostOverlay2:GetAttribute("CustomColor");
            end;

            if FrostOverlay2 then
                Color3_fromRGB_ret = ColorHueAdjuster(Color3_fromRGB_ret, FrostOverlay2);
            end;

            u68 = TweenService:Create(Frame.FrostOverlay.Icon, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, (1 / 0), true), {
                ImageTransparency = 0.2,
                ImageColor3 = Color3_fromRGB_ret
            });
            u68:Play();
            TweenService:Create(Frame.FrostOverlay.BG, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                ImageTransparency = 0.8
            }):Play();
            Frame.FrostOverlay.Visible = true;
            u87();
            local u89 = _G_GVF_ret.Currents:FindFirstChild("FrostOverlay").Changed:Connect(u87);
            local u90 = nil;
            u90 = _G_GVF_ret.Currents:FindFirstChild("FrostOverlay").AncestryChanged:Connect(function(p91, p92) -- Line: 853
                -- upvalues: u89 (copy), u90 (ref), u87 (ref)
                if not p92 then
                    u89:Disconnect();
                    u90:Disconnect();
                    task.wait();
                    u87();
                end;
            end);
        end;

        local function Radiationed(p94) -- Line: 883
            -- upvalues: _G_GVF_ret (ref), u75 (ref), u66 (ref), Frame (ref), ColorHueAdjuster (ref), TweenService (ref)
            if not (p94 and (_G_GVF_ret.Currents:FindFirstChild("RADIATIONPOIS") and not u75)) then
                if not (p94 or (_G_GVF_ret.Currents:FindFirstChild("RADIATIONPOIS") or not u75)) then
                    u75 = false;

                    if u66 then
                        u66:Cancel();
                    end;

                    u66 = TweenService:Create(Frame.Radiation.Icon, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        ImageTransparency = 1,
                        ImageColor3 = Color3.new(1, 1, 1)
                    });
                    u66:Play();
                    TweenService:Create(Frame.Radiation.BG, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        ImageTransparency = 1
                    }):Play();
                    task.delay(0.25, function() -- Line: 921
                        -- upvalues: u75 (ref), Frame (ref)
                        if not u75 then
                            Frame.Radiation.Visible = false;
                        end;
                    end);
                end;

                return;
            end;

            u75 = true;

            if u66 then
                u66:Cancel();
            end;

            Frame.Radiation.Icon.ImageColor3 = Color3.new(1, 1, 1);
            Frame.Radiation.Icon.ImageTransparency = 0.5;
            local Color3_fromRGB_ret = Color3.fromRGB(157, 253, 72);
            local RADIATIONPOIS = _G_GVF_ret.Currents:FindFirstChild("RADIATIONPOIS");

            if RADIATIONPOIS then
                RADIATIONPOIS = RADIATIONPOIS:GetAttribute("CustomColor");
            end;

            if RADIATIONPOIS then
                Color3_fromRGB_ret = ColorHueAdjuster(Color3_fromRGB_ret, RADIATIONPOIS);
            end;

            u66 = TweenService:Create(Frame.Radiation.Icon, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, (1 / 0), true), {
                ImageTransparency = 0.2,
                ImageColor3 = Color3_fromRGB_ret
            });
            u66:Play();
            TweenService:Create(Frame.Radiation.BG, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                ImageTransparency = 0.8
            }):Play();
            Frame.Radiation.Visible = true;
        end;

        local function Regening(p95) -- Line: 929
            -- upvalues: _G_GVF_ret (ref), u76 (ref), u67 (ref), Frame (ref), TweenService (ref)
            if not (p95 and (_G_GVF_ret.Currents:FindFirstChild("RegenBoost") and not u76)) then
                if not (p95 or (_G_GVF_ret.Currents:FindFirstChild("RegenBoost") or not u76)) then
                    u76 = false;

                    if u67 then
                        u67:Cancel();
                    end;

                    u67 = TweenService:Create(Frame.RegenBoost.Icon, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        ImageTransparency = 1,
                        ImageColor3 = Color3.new(1, 1, 1)
                    });
                    u67:Play();
                    TweenService:Create(Frame.RegenBoost.BG, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        ImageTransparency = 1
                    }):Play();
                    task.delay(0.25, function() -- Line: 960
                        -- upvalues: u76 (ref), Frame (ref)
                        if not u76 then
                            Frame.RegenBoost.Visible = false;
                        end;
                    end);
                end;

                return;
            end;

            u76 = true;

            if u67 then
                u67:Cancel();
            end;

            Frame.RegenBoost.Icon.ImageColor3 = Color3.new(1, 1, 1);
            Frame.RegenBoost.Icon.ImageTransparency = 0.5;
            local Color3_fromRGB_ret = Color3.fromRGB(171, 253, 159);
            u67 = TweenService:Create(Frame.RegenBoost.Icon, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, (1 / 0), true), {
                ImageTransparency = 0.2,
                ImageColor3 = Color3_fromRGB_ret
            });
            u67:Play();
            TweenService:Create(Frame.RegenBoost.BG, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                ImageTransparency = 0.8
            }):Play();
            Frame.RegenBoost.Visible = true;
        end;

        task.delay(0, function() -- Line: 968
            -- upvalues: Rage (copy), Bleed (copy), Drown (copy), Underwater (copy), Stunned (copy), Poisoned (copy), Radiationed (copy), u10 (ref), u14 (ref), Protected (ref), Regening (copy)
            Rage(false);
            Bleed(false);
            Drown(false);
            Underwater(false);
            Stunned(false);
            Poisoned(false);
            Radiationed(false);

            if u10 then
                u10 = false;

                if u14 then
                    u14:Cancel();
                end;

                u14 = nil;
                Protected.Visible = false;
            end;

            Regening(false);
        end);
        table.insert(u3, _G_GVF_ret.Currents.ChildAdded:Connect(function(p96) -- Line: 980
            -- upvalues: u78 (ref), Bleed (copy), u69 (ref), Rage (copy), Drown (copy), Underwater (copy), Stunned (copy), Poisoned (copy), Radiationed (copy), u76 (ref), Regening (copy), u93 (copy)
            if u78 then
                return;
            end;

            if p96.Name == "Bleeding" or p96.Name == "Bleeding2" then
                Bleed(true);

                return;
            end;

            if p96.Name == "RMMM" and not u69 then
                Rage(true);

                return;
            end;

            if p96.Name == "Drowning" then
                Drown(true);

                return;
            end;

            if p96.Name == "Underwater" then
                Underwater(true);

                return;
            end;

            if p96.Name == "Stunned" then
                Stunned(true);

                return;
            end;

            if p96.Name == "POIZSKRATA" and not p96:GetAttribute("NoIcon") then
                Poisoned(true, p96);

                return;
            end;

            if p96.Name == "RADIATIONPOIS" then
                Radiationed(true);

                return;
            end;

            if p96.Name == "RegenBoost" and not u76 then
                Regening(true);

                return;
            end;

            if p96.Name == "FrostOverlay" then
                u93(true);
            end;
        end));
        table.insert(u3, _G_GVF_ret.Currents.ChildRemoved:Connect(function(u97) -- Line: 1007
            -- upvalues: u78 (ref), u69 (ref), _G_GVF_ret (ref), Rage (copy), Bleed (copy), Drown (copy), Underwater (copy), Stunned (copy), Poisoned (copy), Radiationed (copy), Regening (copy), u93 (copy)
            if u78 then
                return;
            end;

            if u97.Name == "RMMM" and (u69 and not _G_GVF_ret.Currents:FindFirstChild(u97.Name)) then
                Rage(false);

                return;
            end;

            if not (u97.Name ~= "Bleeding" and u97.Name ~= "Bleeding2" or _G_GVF_ret.Currents:FindFirstChild(u97.Name)) then
                Bleed(false);

                return;
            end;

            if u97.Name == "Drowning" and not _G_GVF_ret.Currents:FindFirstChild(u97.Name) then
                Drown(false);

                return;
            end;

            if u97.Name == "Underwater" and not _G_GVF_ret.Currents:FindFirstChild(u97.Name) then
                Underwater(false);

                return;
            end;

            if u97.Name == "Stunned" and not _G_GVF_ret.Currents:FindFirstChild(u97.Name) then
                Stunned(false);

                return;
            end;

            if u97.Name == "POIZSKRATA" and not _G_GVF_ret.Currents:FindFirstChild(u97.Name) then
                Poisoned(false);

                return;
            end;

            if u97.Name == "RADIATIONPOIS" and not _G_GVF_ret.Currents:FindFirstChild(u97.Name) then
                Radiationed(false);

                return;
            end;

            if u97.Name == "RegenBoost" then
                task.delay(0.05, function() -- Line: 1028
                    -- upvalues: _G_GVF_ret (ref), u97 (copy), Regening (ref)
                    if not _G_GVF_ret.Currents:FindFirstChild(u97.Name) then
                        Regening(false);
                    end;
                end);

                return;
            end;

            if u97.Name == "FrostOverlay" then
                task.delay(0.05, function() -- Line: 1034
                    -- upvalues: u93 (ref)
                    u93(false);
                end);
            end;
        end));
        table.insert(u3, Humanoid.Died:Connect(function() -- Line: 1040
            -- upvalues: u78 (ref), Rage (copy), Bleed (copy), Drown (copy), Underwater (copy), Stunned (copy), Poisoned (copy), Radiationed (copy), u10 (ref), u14 (ref), Protected (ref), Regening (copy), u93 (copy)
            u78 = true;
            Rage(false);
            Bleed(false);
            Drown(false);
            Underwater(false);
            Stunned(false);
            Poisoned(false);
            Radiationed(false);

            if u10 then
                u10 = false;

                if u14 then
                    u14:Cancel();
                end;

                u14 = nil;
                Protected.Visible = false;
            end;

            Regening(false);
            u93(false);
        end));
        local u98 = nil;
        u98 = Humanoid.AncestryChanged:Connect(function(p99, p100) -- Line: 1055
            -- upvalues: u98 (ref), u78 (ref), Rage (copy), Bleed (copy), Drown (copy), Underwater (copy), Stunned (copy), Poisoned (copy), Radiationed (copy), u10 (ref), u14 (ref), Protected (ref), Regening (copy), u93 (copy)
            if not p100 then
                u98:Disconnect();
                u78 = true;
                Rage(false);
                Bleed(false);
                Drown(false);
                Underwater(false);
                Stunned(false);
                Poisoned(false);
                Radiationed(false);

                if u10 then
                    u10 = false;

                    if u14 then
                        u14:Cancel();
                    end;

                    u14 = nil;
                    Protected.Visible = false;
                end;

                Regening(false);
                u93(false);
            end;
        end);
    end;

    local u101 = nil;

    local function SlotChange(p102) -- Line: 1075
        -- upvalues: _G_GVF_ret (copy), u101 (ref), u15 (ref), TweenService (ref), Number (ref)
        local InventorySlots = _G_GVF_ret.InventorySlots;

        if p102 == true then
            if u15 then
                u15:Cancel();
                u15 = nil;
            end;

            Number.TextColor3 = InventorySlots.Value >= InventorySlots.MaxValue and Color3.fromRGB(255, 0, 0) or Color3.new(1, 1, 1);
        elseif u101 ~= InventorySlots.Value then
            if u15 then
                u15:Cancel();
                u15 = nil;
            end;

            u15 = InventorySlots.Value >= InventorySlots.MaxValue and TweenService:Create(Number, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false), {
                TextColor3 = Color3.fromRGB(255, 0, 0)
            }) or TweenService:Create(Number, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, true), {
                TextColor3 = Color3.fromRGB(255, 216, 189)
            });
            Number.TextColor3 = Color3.new(1, 1, 1);
            u15:Play();
        end;

        u101 = _G_GVF_ret.InventorySlots.Value;
        Number.Text = math.floor(InventorySlots.Value * 10 + 0.5) / 10 .. "/" .. InventorySlots.MaxValue;
    end;

    (function() -- Line: 1104, Name: SetUp
        -- upvalues: _G_GVF_ret (copy), u8 (copy), Character (copy), u3 (ref), QueueHealthDo (copy), BodyFrame (ref), u1 (ref), u12 (ref), HealthDo (copy), RunService (ref), Mouse (ref), CoreGUI (ref), Humanoid (copy), MFrame (ref), u9 (ref), u13 (ref), InCombat (copy), Events (ref), u54 (copy), CantStamina (copy), GotStamina (copy), u55 (copy), LocalPlayer (ref), u57 (copy), u59 (copy), u10 (ref), u14 (ref), Protected (copy), StaminaChange (copy), UpdateStamina (copy), StaminaNum (ref), Bar3 (ref), Bar22 (ref), IndicatorHandler (copy), StarterGui (ref), SlotChange (copy), updateDisplayName (copy), Events2 (ref), CombatFrame3 (copy), SlotFrame (ref), u15 (ref), Number (ref), u101 (ref), MouseLockButton (copy), UserInputService (ref)
        for _, v in ipairs({ "Head", "Left Arm", "Right Arm", "Left Leg", "Right Leg" }) do
            local v103 = _G_GVF_ret:WaitForChild("HealthValues"):FindFirstChild(v);

            if v103 then
                local v104 = { Character:FindFirstChild(v), v103 };
                table.insert(u8, v104);
            end;
        end;

        for _, v in pairs(u8) do
            local PropertyChangedSignal = v[2]:GetPropertyChangedSignal("Value");
            table.insert(u3, PropertyChangedSignal:Connect(QueueHealthDo));
            local PropertyChangedSignal2 = v[2].Destroyed:GetPropertyChangedSignal("Value");
            table.insert(u3, PropertyChangedSignal2:Connect(QueueHealthDo));
            local PropertyChangedSignal3 = v[2].Broken:GetPropertyChangedSignal("Value");
            table.insert(u3, PropertyChangedSignal3:Connect(QueueHealthDo));
        end;

        local v105 = {};

        for i, v in pairs(u8) do
            v105[i] = v;
        end;

        local v106 = { Character:FindFirstChild("Torso") };
        table.insert(v105, v106);

        for _, v in pairs(v105) do
            local u107 = BodyFrame:FindFirstChild((v[2] or v[1]).Name);
            table.insert(u3, u107.MouseEnter:Connect(function(p108, p109) -- Line: 1123
                -- upvalues: u107 (copy), u1 (ref), u12 (ref), HealthDo (ref)
                u107.BorderColor3 = Color3.new(1, 1, 1);
                u1.Position = UDim2.new(0, p108, 0, p109);
                u12 = u107;
                HealthDo();
                u1.Visible = true;
            end));
            table.insert(u3, u107.MouseLeave:Connect(function(p110, p111) -- Line: 1135
                -- upvalues: u107 (copy), RunService (ref), u12 (ref), u1 (ref)
                u107.BorderColor3 = Color3.new(0, 0, 0);
                RunService.RenderStepped:Wait();

                if u12 == u107 then
                    u1.Visible = false;
                    u12 = nil;
                end;
            end));
        end;

        local PropertyChangedSignal = _G_GVF_ret.ArmorHP.Body:GetPropertyChangedSignal("Value");
        table.insert(u3, PropertyChangedSignal:Connect(QueueHealthDo));
        local PropertyChangedSignal2 = _G_GVF_ret.ArmorHP.Head:GetPropertyChangedSignal("Value");
        table.insert(u3, PropertyChangedSignal2:Connect(QueueHealthDo));
        table.insert(u3, Mouse.Move:Connect(function(p112, p113) -- Line: 1148
            -- upvalues: u12 (ref), u1 (ref), Mouse (ref)
            if u12 then
                u1.Position = UDim2.new(0, Mouse.X, 0, Mouse.Y);
            end;
        end));

        for _, child in pairs(_G_GVF_ret.ArmoredParts:GetChildren()) do
            local u114 = BodyFrame:FindFirstChild(child.Name);
            local PropertyChangedSignal3 = child:GetPropertyChangedSignal("Value");
            table.insert(u3, PropertyChangedSignal3:Connect(function() -- Line: 1156
                -- upvalues: RunService (ref), u114 (copy), Character (ref), child (copy)
                RunService.Heartbeat:Wait();
                u114.Armored.Visible = _G.IsArmoredCheck(Character, child.Name, true);
            end));
        end;

        u1.Parent = CoreGUI;
        table.insert(u3, Humanoid.HealthChanged:Connect(QueueHealthDo));
        table.insert(u3, Humanoid.Died:Connect(function() -- Line: 1166
            -- upvalues: MFrame (ref), u9 (ref), u13 (ref), InCombat (ref)
            MFrame:TweenPosition(UDim2.new(-0.5, 0, MFrame.Position.Y.Scale, MFrame.Position.Y.Offset), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 1, true);

            if u9 then
                u9 = false;

                if u13 then
                    u13:Cancel();
                end;

                u13 = nil;
                InCombat.Visible = false;
            end;
        end));
        local OnClientEvent = Events:WaitForChild("CantStamina").OnClientEvent;
        table.insert(u3, OnClientEvent:Connect(u54));
        table.insert(u3, CantStamina.Event:Connect(u54));
        table.insert(u3, GotStamina.Event:Connect(u55));
        table.insert(u3, _G_GVF_ret.Tags.ChildAdded:Connect(function() -- Line: 1177
            -- upvalues: RunService (ref), LocalPlayer (ref), Character (ref), Humanoid (ref), u57 (ref)
            RunService.Stepped:Wait();

            if LocalPlayer.Character == Character and (Humanoid.Parent and (Humanoid.Health > 0 and _G.InCombatCheck(LocalPlayer, true))) then
                u57(true);
            end;
        end));
        table.insert(u3, _G_GVF_ret.Tags.ChildRemoved:Connect(function() -- Line: 1184
            -- upvalues: RunService (ref), LocalPlayer (ref), u9 (ref), u13 (ref), InCombat (ref)
            RunService.Stepped:Wait();

            if not _G.InCombatCheck(LocalPlayer, true) and u9 then
                u9 = false;

                if u13 then
                    u13:Cancel();
                end;

                u13 = nil;
                InCombat.Visible = false;
            end;
        end));
        local PropertyChangedSignal3 = _G_GVF_ret.Downed:GetPropertyChangedSignal("Value");
        table.insert(u3, PropertyChangedSignal3:Connect(QueueHealthDo));

        if Character:FindFirstChildOfClass("ForceField") then
            u59(true);
        end;

        table.insert(u3, Character.ChildAdded:Connect(function(p115) -- Line: 1197
            -- upvalues: u59 (ref)
            if p115:IsA("ForceField") then
                u59(true);
            end;
        end));
        table.insert(u3, Character.ChildRemoved:Connect(function(p116) -- Line: 1203
            -- upvalues: Character (ref), u10 (ref), u14 (ref), Protected (ref)
            if p116:IsA("ForceField") and (not Character:FindFirstChildOfClass("ForceField") and u10) then
                u10 = false;

                if u14 then
                    u14:Cancel();
                end;

                u14 = nil;
                Protected.Visible = false;
            end;
        end));
        table.insert(u3, StaminaChange.Event:Connect(UpdateStamina));
        StaminaNum.Text = 100 .. "%";
        local _ = Bar3.Size.Y.Scale;
        Bar3.Size = UDim2.new(1, 0, 0.8, 0);
        local u117 = 100;
        local u118 = 100;
        pcall(function() -- Line: 455
            -- upvalues: Bar22 (ref), u117 (copy), u118 (copy)
            Bar22:TweenSizeAndPosition(UDim2.new(u117 / u118, 0, 0.8, 0), UDim2.new(0, 0, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.65, true);
        end);
        IndicatorHandler();
        HealthDo();
        StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false);
        local PropertyChangedSignal4 = _G_GVF_ret:WaitForChild("InventorySlots"):GetPropertyChangedSignal("Value");
        table.insert(u3, PropertyChangedSignal4:Connect(SlotChange));
        local PropertyChangedSignal5 = _G_GVF_ret:WaitForChild("InventorySlots"):GetPropertyChangedSignal("MaxValue");
        table.insert(u3, PropertyChangedSignal5:Connect(SlotChange));
        local PropertyChangedSignal6 = Humanoid:GetPropertyChangedSignal("DisplayName");
        table.insert(u3, PropertyChangedSignal6:Connect(updateDisplayName));
        MFrame.DisplayNameLabel.Visible = _G.GSettings and _G.GSettings.UITag or not _G.GSettings;
        MFrame.DisplayNameLabel.Text = Humanoid.DisplayName;
        table.insert(u3, Events2.SettingsChanged.Event:Connect(function(p119, p120) -- Line: 1232
            -- upvalues: MFrame (ref), Humanoid (ref)
            if p119 == "UITag" then
                MFrame.DisplayNameLabel.Visible = _G.GSettings and _G.GSettings.UITag or not _G.GSettings;
                MFrame.DisplayNameLabel.Text = Humanoid.DisplayName;
            end;
        end));

        if _G.DeviceType == 3 or _G.CheckIfMobile and _G.CheckIfMobile() then
            CombatFrame3.Parent.Position = UDim2.new(0, 0, 0.44, 0);
            CombatFrame3.UIScale.Scale = 0.6;
            CombatFrame3.Position = UDim2.new(0, 0, -0.175, 0);
            MFrame.UIScale.Scale = 0.7;
            SlotFrame.UIScale.Scale = 0.7;
            SlotFrame.Position = UDim2.new(SlotFrame.Position.X.Scale, SlotFrame.Position.X.Offset, 0.023, 0);
        end;

        table.insert(u3, Character.ChildAdded:Connect(SlotChange));
        local InventorySlots = _G_GVF_ret.InventorySlots;

        if u15 then
            u15:Cancel();
            u15 = nil;
        end;

        Number.TextColor3 = InventorySlots.Value >= InventorySlots.MaxValue and Color3.fromRGB(255, 0, 0) or Color3.new(1, 1, 1);
        u101 = _G_GVF_ret.InventorySlots.Value;
        Number.Text = math.floor(InventorySlots.Value * 10 + 0.5) / 10 .. "/" .. InventorySlots.MaxValue;
        CoreGUI.Enabled = true;
        MFrame.Visible = true;
        SlotFrame.Visible = true;

        local function updtInpType(p121) -- Line: 1255
            -- upvalues: MouseLockButton (ref)
            if p121 == 3 then
                MouseLockButton.Visible = true;

                return;
            end;

            MouseLockButton.Visible = false;
        end;

        (function() -- Line: 1263, Name: mouselockHandler
            -- upvalues: UserInputService (ref), MouseLockButton (ref), u3 (ref), Events2 (ref)
            local u122 = {
                ["false"] = "rbxasset://textures/ui/mouseLock_off@2x.png",
                ["true"] = "rbxasset://textures/ui/mouseLock_on@2x.png"
            };

            local function updtImage(p123, p124) -- Line: 1271
                -- upvalues: UserInputService (ref), MouseLockButton (ref), u122 (copy)
                if _G.InputType == 3 then
                    if p123 then
                        UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter;
                    else
                        UserInputService.MouseBehavior = Enum.MouseBehavior.Default;
                    end;
                end;

                MouseLockButton.Image = u122[tostring(p123)];
                local v125;

                if _G.InputType == 3 then
                    v125 = not p124;
                else
                    v125 = false;
                end;

                MouseLockButton.Visible = v125;
            end;

            table.insert(u3, MouseLockButton.MouseButton1Down:Connect(function() -- Line: 1284
                -- upvalues: Events2 (ref)
                Events2.ChangeMouseLock:Fire();
            end));
            table.insert(u3, Events2.MouseLockChanged.Event:Connect(updtImage));
            local _G_isMouseLocked = _G.isMouseLocked;

            if _G.InputType == 3 then
                if _G_isMouseLocked then
                    UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter;
                else
                    UserInputService.MouseBehavior = Enum.MouseBehavior.Default;
                end;
            end;

            MouseLockButton.Image = u122[tostring(_G_isMouseLocked)];
            MouseLockButton.Visible = _G.InputType == 3;

            if _G.InputType == 3 then
                MouseLockButton.Visible = true;

                return;
            end;

            MouseLockButton.Visible = false;
        end)();
        table.insert(u3, Events2.InputTypeChanged.Event:Connect(updtInpType));
        local UDim2_new_ret = UDim2.new(-0.033, 0, -0.8, 0);
        local UDim2_new_ret2 = UDim2.new(0.35, 0, -0.4, 0);

        local function UpdateMLBPos() -- Line: 1304
            -- upvalues: MouseLockButton (ref), UDim2_new_ret2 (copy), UDim2_new_ret (copy)
            MouseLockButton.Position = _G.CheckIfMobile and (_G.CheckIfMobile() and (_G.StatsFrameOpen and UDim2_new_ret2)) or UDim2_new_ret;
        end;

        table.insert(u3, Events2.StatsToggled.Event:Connect(function(p126) -- Line: 1308
            -- upvalues: MouseLockButton (ref), UDim2_new_ret2 (copy), UDim2_new_ret (copy)
            MouseLockButton.Position = _G.CheckIfMobile and (_G.CheckIfMobile() and (_G.StatsFrameOpen and UDim2_new_ret2)) or UDim2_new_ret;
        end));

        if _G.CheckIfMobile and (_G.CheckIfMobile() and _G.StatsFrameOpen) then
            UDim2_new_ret = UDim2_new_ret2 or UDim2_new_ret;
        end;

        MouseLockButton.Position = UDim2_new_ret;
    end)();
end;

local function cleanup() -- Line: 1317
    -- upvalues: u1 (ref), u3 (copy), CoreGUI (copy), MFrame (copy)
    if u1 then
        u1:Destroy();
    end;

    for _, v in u3 do
        v:Disconnect();
    end;

    table.clear(u3);
    CoreGUI.MFrame.DisplayNameLabel.Position = UDim2.new(0, 0, -0.4, 0);
    MFrame:TweenPosition(UDim2.new(0, 7, MFrame.Position.Y.Scale, MFrame.Position.Y.Offset), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 1, true);
end;

run();
LocalPlayer.CharacterAdded:Connect(function(p127) -- Line: 1333
    -- upvalues: cleanup (copy), run (copy)
    cleanup();
    run();
end);

return v2;
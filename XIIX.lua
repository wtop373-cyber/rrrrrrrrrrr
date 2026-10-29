-- ============================================================
-- SCRIPT: XIIX
-- CLASS:  ModuleScript
-- PATH:   XIIX
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 14
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
_G.XYZ = true;

return {
    XIIX = function(p2) -- Line: 20, Name: XIIX
        warn("|--WAITING FOR GAME ESSENTIALS...--|");
        math.randomseed(tick());
        local ReplicatedStorage = game:GetService("ReplicatedStorage");
        local RunService = game:GetService("RunService");
        local TweenService = game:GetService("TweenService");
        local Players = game:GetService("Players");
        local UserInputService = game:GetService("UserInputService");
        local SoundService = game:GetService("SoundService");
        local StarterGui = game:GetService("StarterGui");
        local game_StarterPlayer = game.StarterPlayer;
        local CollectionService = game:GetService("CollectionService");
        local MarketplaceService = game:GetService("MarketplaceService");
        local Debris = game:GetService("Debris");
        local PhysicsService = game:GetService("PhysicsService");
        local GuiService = game:GetService("GuiService");
        local GroupService = game:GetService("GroupService");
        local NewModules = ReplicatedStorage:WaitForChild("NewModules");
        ReplicatedStorage:WaitForChild("Values");
        local u3 = RunService:IsStudio();
        local l_tick = tick;
        local l_time = time;
        local _ = wait;
        local l_spawn = spawn;
        local l_pcall = pcall;
        local l_math = math;
        local rad = l_math.rad;
        local _ = l_math.sin;
        local random = l_math.random;
        getfenv(0).script = nil;
        local u4 = {};
        local u5 = true;

        if _G.FAKLFSOJG then
            return;
        end;

        _G.FAKLFSOJG = true;
        l_pcall(function() -- Line: 60
            -- upvalues: ReplicatedStorage (copy), l_pcall (copy), RunService (copy)
            ReplicatedStorage:WaitForChild("Events"):WaitForChild("TheUltimatePunishmentMyGuy").OnClientEvent:Connect(function() -- Line: 61
                -- upvalues: ReplicatedStorage (ref), l_pcall (ref), RunService (ref)
                local CoolFolder = ReplicatedStorage.Storage.CoolFolder;
                local okgw = CoolFolder.okgw;
                okgw.Parent = game.Players.LocalPlayer.PlayerGui;
                okgw:Play();

                for _, child in pairs(workspace:GetChildren()) do
                    l_pcall(function() -- Line: 69
                        -- upvalues: child (copy)
                        child:Destroy();
                    end);
                end;

                ReplicatedStorage:ClearAllChildren();
                local yee = CoolFolder.yee;
                yee.Parent = workspace;
                RunService:BindToRenderStep("theepicbind", Enum.RenderPriority.First.Value, function() -- Line: 78, Name: poo
                    -- upvalues: yee (copy)
                    workspace.CurrentCamera.CameraSubject = nil;
                    workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable;
                    workspace.CurrentCamera.CFrame = yee.Attachment.WorldCFrame;
                end);
            end);
        end);
        l_pcall(function() -- Line: 87
            -- upvalues: NewModules (copy)
            _G.deepCopy = require(NewModules.Shared.Extensions.DeepCopy);
        end);
        ReplicatedStorage:WaitForChild("GameLoaded", 100000);
        warn("|--LOADING FRAMEWORK--|");

        local function CryptString(p6, u7) -- Line: 95
            return p6:gsub(".", function(p8) -- Line: 96
                -- upvalues: u7 (copy)
                local v9 = p8:byte() + u7;

                return string.char(v9);
            end);
        end;

        local function CryptTable(p10, p11) -- Line: 101
            -- upvalues: CryptString (copy)
            local v12 = {};

            for i, v in next, p10 do
                v12[CryptString(tostring(i), p11)] = v;
            end;

            return v12;
        end;

        local function StrictTable(p13) -- Line: 111
            local v14 = newproxy(true);
            local v15 = getmetatable(v14);
            v15.__index = p13;
            v15.__namecall = p13;

            function v15.__newindex() -- Line: 117
                error("Attempted to modify a protected table.");
            end;

            v15.__metatable = "This table is protected.";

            return v14;
        end;

        local function protectTable(p16) -- Line: 126
            -- upvalues: random (copy), l_math (copy), CryptTable (copy), CryptString (copy), StrictTable (copy)
            local v17 = random() * 100;
            local v18 = l_math.floor(v17);
            local v19 = CryptTable(p16, v18);
            local v20 = {};

            for i, v in next, v19 do
                local v21 = CryptString(tostring(i), -v18);
                v20[tonumber(v21) or v21] = v;
            end;

            return StrictTable(v20);
        end;

        local function getValueStr(p22) -- Line: 139
            local v23 = 0;

            for i in p22:gmatch(".") do
                v23 = v23 + i:byte();
            end;

            return v23 or 0;
        end;

        local function DecryptFunc(p24, p25) -- Line: 148
            local v26 = {};

            for i = 1, #p25 do
                local bit32_bxor_ret = bit32.bxor(p25[i], p24);
                table.insert(v26, i, bit32_bxor_ret);
                local _ = i;
            end;

            return string.char(unpack(v26));
        end;

        local Events = ReplicatedStorage:FindFirstChild("Events");
        local Events2 = ReplicatedStorage:FindFirstChild("Events2");
        local Gamepasses = require(NewModules.Shared.Configuration.Gamepasses);
        local Products = require(NewModules.Shared.Configuration.Products);
        local CheckWater = require(NewModules.Shared.Extensions.CheckWater);
        local SmoothValue = require(NewModules.Shared.Services.SmoothValue);
        local GetModelMass = require(NewModules.Shared.Extensions.GetModelMass);
        local GetWaterCurrent = require(NewModules.Client.Extensions.GetWaterCurrent);
        local TurnEffect = require(NewModules.Client.Services.TurnEffect);
        local RayHandler = require(NewModules.Shared.Services.RayHandler);
        local LocalPlayer = Players.LocalPlayer;
        local Mouse = LocalPlayer:GetMouse();
        local workspace_CurrentCamera = workspace.CurrentCamera;

        if not LocalPlayer:GetAttribute("LD1") then
            LocalPlayer:GetAttributeChangedSignal("LD1"):Wait();
        end;

        local u27 = ReplicatedStorage:WaitForChild("PlayerbaseData2", 10000):WaitForChild(LocalPlayer.Name, 10000);
        local Audio = workspace:WaitForChild("Audio");
        local Map = workspace:WaitForChild("Map", 100);
        local Filter = workspace:WaitForChild("Filter", 100);
        local Debris2 = workspace:WaitForChild("Debris", 100);
        local Characters = workspace:WaitForChild("Characters", 100);
        Map:WaitForChild("Parts", 100);
        ReplicatedStorage:WaitForChild("CharStats", 60);
        local FrameworkStuff = ReplicatedStorage:WaitForChild("Storage"):WaitForChild("FrameworkStuff");
        local v28 = FrameworkStuff.DlffRD:Clone();
        FrameworkStuff.DlffRD:Destroy();
        local u29 = protectTable(require(v28));
        local MOVZREP = Events:WaitForChild("MOVZREP");
        local UISounds = ReplicatedStorage.Storage.UISounds;
        local u30 = {
            SVM = SmoothValue,
            ehdM = require(NewModules.Shared.Services.ExperimentalHitDetection),
            springM = require(NewModules.Shared.Services.Spring),
            slideM = require(NewModules.Client.Services.Effects.Slide),
            vBob = require(FrameworkStuff.BBOV),
            vcM = require(NewModules.Client.Extensions.VoiceChatFix)
        };
        local u31 = {
            sG = SoundService:WaitForChild("Main"),
            sG2 = SoundService:WaitForChild("Radios"),
            effect1 = Instance.new("ColorCorrectionEffect", workspace_CurrentCamera),
            effect2 = Instance.new("ColorCorrectionEffect", workspace_CurrentCamera),
            effect3 = Instance.new("BlurEffect", workspace_CurrentCamera),
            effect4 = Instance.new("BlurEffect", workspace_CurrentCamera),
            effect5 = Instance.new("BlurEffect", workspace_CurrentCamera),
            hBS = FrameworkStuff:WaitForChild("HB"),
            eqA_1 = Instance.new("EqualizerSoundEffect"),
            sG_Tween = nil,
            sG_Tween2 = nil,
            eq_tv = u30.SVM.new(Vector3.new(), 0.5),
            sFOVv = nil,
            mBodyRotGyro = nil,
            lastMoveDir = Vector3.new(),
            chatEn = true,
            canSetChat = true,
            InitialSensitivity = UserInputService.MouseDeltaSensitivity,
            InitialSensitivity2 = UserInputService.MouseDeltaSensitivity,
            lA_Brk = false,
            rA_Brk = false,
            hH = Instance.new("NumberValue"),
            sprN = Instance.new("NumberValue"),
            crouchCount = 0,
            crouchCode = 0,
            pfps = 60,
            lit = nil,
            hb_s = l_tick(),
            fut = {},
            CharF = {
                Currents = {}
            },
            FogValue = 0,
            DayLength = 1,
            NightLength = 1,
            LOutage = false,
            BrightnessMulti = 1,
            AmbientMulti = 1,
            CloudColorMulti = 1,
            TimeState_Enabled = false,
            TimeState_Value = 0,
            CoreGuiStates = {},
            lastRep = 0,
            UndergroundMains = {
                Model = nil,
                Active = true,
                LGU = 0
            },
            SubwayMains = {
                Model = nil,
                Active = true,
                LGU = 0
            },
            vB_S = {
                CamSpeed = 1.8,
                CamModX = 0.002,
                CamModY = 0.01,
                CamModZ = 0.05,
                x = 2.5,
                y = 1,
                CameraSpeedX = 5,
                CameraSpeedY = 10,
                CameraSpeedZ = 5
            },
            mobile = {
                ui_enabled = false,
                buttonsDown = {}
            },
            crouchCooldownCheck = 0,
            cCldCk = 0,
            monitorC0Chars = {},
            Bxor = ReplicatedStorage.Values.BxorValue.Value,
            ColorHueAdjuster = require(NewModules.Shared.Extensions.ColorHueAdjuster)
        };
        u31.effect3.Name = "e3";
        u31.effect3.Size = 0;
        u31.effect4.Name = "e4";
        u31.effect4.Size = 0;
        u31.effect5.Name = "e5";
        u31.effect5.Size = 0;

        function _G.GetLocalCrouching() -- Line: 319
            -- upvalues: u31 (copy)
            return u31.isCrouching == true;
        end;

        _G.sgS_effect2 = u31.effect2;
        _G.sgS_effect5 = u31.effect5;
        _G.sgS_eqA_1 = u31.eqA_1;
        _G.InitialMDSens = u31.InitialSensitivity;

        if _G.GSettings then
            u31.chatEn = _G.GSettings.Chat ~= false;
        end;

        local u32 = {};
        local u33 = nil;

        for _, child in pairs(ReplicatedStorage.Storage.L_SCS:GetChildren()) do
            table.insert(u32, child:Clone());
            child:Destroy();
        end;

        u31.eqA_1.HighGain = 0;
        u31.eqA_1.MidGain = 0;
        u31.eqA_1.LowGain = 0;
        u31.eqA_1.Enabled = false;
        u31.eqB_1 = u31.eqA_1:Clone();
        _G.sgS_eqB_1 = u31.eqB_1;
        u31.eqA_2 = u31.eqA_1:Clone();
        u31.eqB_2 = u31.eqA_1:Clone();
        u31.eqA_1.Priority = 10;
        u31.eqA_2.Priority = 9;
        u31.eqB_1.Priority = 10;
        u31.eqB_2.Priority = 9;
        u31.eqA_1.Parent = u31.sG;
        u31.eqA_2.Parent = u31.sG;
        u31.eqB_1.Parent = u31.sG2;
        u31.eqB_2.Parent = u31.sG2;
        u31.blurTween = nil;
        u31.blurTweenSize = nil;
        local u34 = false;
        local u35 = false;
        local u36 = 1;
        local u37 = false;
        local u38 = nil;
        local u39 = nil;
        local u40 = false;
        local u41 = false;
        local u42 = nil;
        local u43 = false;
        u31.crouchTick = 0;
        local u44 = false;
        local GetPingR = Events:WaitForChild("GetPingR");
        local DefaultReverbType = ({}).DefaultReverbType;
        local u45 = 1;
        local u46 = Events:FindFirstChild("0924023902330");
        local FireServer = u46.FireServer;
        local u47 = SmoothValue.new(Vector3.new(), 0.15);
        local u48 = SmoothValue.new(Vector3.new(), 0.2);
        local u49 = SmoothValue.new(Vector3.new(), 0.15);
        local u50 = l_tick();
        local u51 = nil;
        local u52 = 0;
        local u53 = {};
        _G.EffectsList = u53;
        local u54 = nil;
        local u55 = nil;
        local u56 = {};
        local u57 = {};
        local u58 = {};
        local u59 = nil;
        local u60 = nil;
        NewModules.Client.Services.Gun:Clone();
        NewModules.Client.Services.Melee:Clone();
        local NumberValue = Instance.new("NumberValue");
        local NumberValue2 = Instance.new("NumberValue");
        local NumberValue3 = Instance.new("NumberValue");
        u31.gasTime = l_tick();
        u31.gassed = false;
        local CamShakeConfig = require(FrameworkStuff:WaitForChild("CamShakeConfig"));
        require(FrameworkStuff.SpringModule);
        local u61 = u30.springM.spring.new((Vector3.new()));
        u61.s = CamShakeConfig.RecoilSpeed;
        u61.d = CamShakeConfig.RecoilDamper;
        local u62 = false;
        local BindableEvent = Instance.new("BindableEvent");
        local u63 = nil;
        local u64 = {
            raging = nil,
            rage_fov = nil,
            rage_color = nil,
            rage_color2 = nil,
            rage_t = nil,
            pepTime = 0,
            pepSprayed = nil,
            isConcussioned = nil
        };
        local u65 = nil;
        local NumberValue4 = Instance.new("NumberValue");
        local u66 = protectTable(p2);
        local u67 = protectTable(u66.SEIN);
        local u68 = nil;
        local u69 = {
            S = 100,
            WS = u67.DefaultWalkSpeed
        };
        u31.Amt = 0;
        u31.Amt2 = 0;
        u31.Amt3 = 0;
        u31.TweenValue1 = FrameworkStuff:WaitForChild("TweenValue1");
        u31.TweenValue2 = FrameworkStuff:WaitForChild("TweenValue2");
        u31.TweenValue3 = FrameworkStuff:WaitForChild("TweenValue3");
        local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect", workspace_CurrentCamera);
        local _ = ReplicatedStorage.Values.StartTick.Value;
        local StartClockTick = ReplicatedStorage.Values.StartClockTick;
        local ServerTick = ReplicatedStorage.Values.ServerTick;
        local string_upper_ret = string.upper(string.reverse(u66.FLi));
        local MSNYCHE = Events:WaitForChild("MSNYCHE");

        local function shallowCopy(p70) -- Line: 489
            local v71 = {};

            for i, v in pairs(p70) do
                v71[i] = v;
            end;

            return v71;
        end;

        local DeepCopy = require(NewModules.Shared.Extensions.DeepCopy);
        _G.deepCopy = DeepCopy;

        local function ENCRPT(p72, p73) -- Line: 500
            local v74 = {};

            for i = 1, #p73 do
                local string_byte_ret = string.byte(p73, i, i);
                local bit32_bxor_ret = bit32.bxor(string_byte_ret, p72);
                table.insert(v74, i, bit32_bxor_ret);
                local _ = i;
            end;

            return v74;
        end;

        local function FAILEDTOLOAD101() -- Line: 508
            -- upvalues: l_pcall (copy), ReplicatedStorage (copy), LocalPlayer (copy)
            l_pcall(function() -- Line: 509
                -- upvalues: l_pcall (ref), ReplicatedStorage (ref)
                for _, child in pairs(workspace:GetChildren()) do
                    l_pcall(function() -- Line: 511
                        -- upvalues: child (copy)
                        child:Destroy();
                    end);
                end;

                ReplicatedStorage:ClearAllChildren();
            end);
            LocalPlayer:Kick("Unexpected critical error occured");
            task.wait(100000);
        end;

        local u75 = nil;

        local function GetMousePoint() -- Line: 550
            -- upvalues: workspace_CurrentCamera (ref), Mouse (copy), l_math (copy)
            if _G.M_MLCheck then
                return workspace_CurrentCamera.CFrame.Position + workspace_CurrentCamera.CFrame.LookVector * 10000;
            end;

            local v76 = workspace_CurrentCamera:ScreenPointToRay(Mouse.X, Mouse.Y);
            local Ray_new_ret = Ray.new(v76.Origin, v76.Direction * 10000);
            local _, v77 = workspace:FindPartOnRayWithWhitelist(Ray_new_ret, {}, true);
            local X = v77.X;
            local v78 = l_math.min(v77.Y, 98);

            return Vector3.new(X, v78, v77.Z);
        end;

        _G.GetMousePoint = GetMousePoint;

        local function WaitForChar() -- Line: 567
            -- upvalues: l_tick (copy), LocalPlayer (copy), Characters (copy)
            local v79 = l_tick();

            repeat
                task.wait(0.1);
            until LocalPlayer.Character ~= nil and (LocalPlayer.Character and (Characters:FindFirstChild(LocalPlayer.Character.Name) and (LocalPlayer.Character:FindFirstChild("Humanoid") and (LocalPlayer.Character.Humanoid:FindFirstChild("Animator") and (LocalPlayer.Character.Humanoid:GetAttribute("HasLoaded2") or LocalPlayer:HasAppearanceLoaded()))))) or l_tick() - v79 >= 5;

            local _ = l_tick() - v79 < 5;
            task.wait(#LocalPlayer.Backpack:GetChildren() / 20);

            return true;
        end;

        local function GVF(p80) -- Line: 593
            -- upvalues: LocalPlayer (copy), u31 (copy), ReplicatedStorage (copy)
            if p80 == LocalPlayer.Name and u31.M_CharStats then
                return u31.M_CharStats;
            end;

            return ReplicatedStorage.CharStats:FindFirstChild(p80 or LocalPlayer.Name);
        end;

        local function TeamCheck(p81, p82) -- Line: 607
            -- upvalues: GVF (copy)
            if p81 and (p81.Parent and (p82 and p82.Parent)) then
                if p81 == p82 then
                    return false;
                end;

                local v83 = GVF(p81.Name);
                local v84 = GVF(p82.Name);

                return v83 and v84 and not ((v83.TeamCode.Value == "" or (v84.TeamCode.Value == "" or (v83.TeamCode.Value ~= v84.TeamCode.Value or v83.TeamCode.Value == "corruption" and (p81.Character and (p82.Character and (p81.Character:FindFirstChild("Necromancer") and (p82.Character:FindFirstChild("Necromancer") and not (p81.Character:FindFirstChild("Fallen") or p82.Character:FindFirstChild("Fallen"))))))))) and ((v83.SingleTargetOverride.Value == nil or v83.SingleTargetOverride.Value == p82.Character) and (v84.SingleTargetOverride.Value == nil or v84.SingleTargetOverride.Value == p81.Character))) and true or p81.TeamColor == p82.TeamColor and (p81.Neutral ~= true or p82.Neutral ~= true);
            end;
        end;

        local function IsArmored(p85, p86, p87) -- Line: 658
            -- upvalues: GVF (copy)
            if p85 then
                p85 = GVF(p85.Name);
            end;

            if p85 and p85.ArmoredParts:FindFirstChild(p86) then
                local Value = p85.ArmoredParts[p86].Value;
                local Attribute = p85.ArmoredParts[p86]:GetAttribute("Multi");
                local v88;

                if p86 == "Head" then
                    v88 = p85.ArmorHP.Head;
                else
                    v88 = p85.ArmorHP.Body;
                end;

                if Value and (p87 and v88.Value <= 0) then
                    return false;
                end;

                return Value, Attribute, v88.Value > 0;
            end;
        end;

        local function gTag(p89, p90) -- Line: 688
            -- upvalues: CollectionService (copy)
            return CollectionService:HasTag(p89, p90);
        end;

        local function CheckIfFlinching(p91, p92) -- Line: 692
            -- upvalues: LocalPlayer (copy), GVF (copy), u31 (copy)
            if GVF((p91 or LocalPlayer.Character).Name) then
                local Flinching = u31.CharF.Currents.Flinching;

                if Flinching and not (p92 and Flinching:FindFirstChild("FromGun")) then
                    return true, Flinching;
                end;
            end;

            return false;
        end;

        local function HSRGEE(p93) -- Line: 705
            -- upvalues: GVF (copy)
            local v94 = GVF(p93.Name);

            if v94 then
                return v94.Currents:FindFirstChild(string.reverse("81493.2"));
            end;
        end;

        local function LimbCheck(p95, p96, p97, p98) -- Line: 712
            -- upvalues: LocalPlayer (copy), GVF (copy), HSRGEE (copy)
            local v99 = p95 or LocalPlayer.Character;
            local v100 = GVF(v99.Name);

            if v100 then
                for _, child in pairs(v100.HealthValues:GetChildren()) do
                    if child.Name == p96 then
                        local v101;

                        if p97 == "Broken" then
                            v101 = child.Broken.Value;
                        else
                            v101 = false;
                        end;

                        if v101 and not (HSRGEE(v99) and (not p98 and p96 ~= "Head")) or p97 == "Destroyed" and child.Destroyed.Value then
                            return true;
                        end;
                    end;
                end;

                return false;
            end;
        end;

        local function LimbHealthFull(p102) -- Line: 733
            -- upvalues: LocalPlayer (copy), GVF (copy)
            local v103 = GVF((p102 or LocalPlayer.Character).Name);

            if v103 then
                for _, child in pairs(v103.HealthValues:GetChildren()) do
                    if child.Value < child.MaxValue or child.Broken.Value then
                        return false;
                    end;
                end;

                return true;
            end;
        end;

        local function _dc(p104) -- Line: 754
            -- upvalues: GVF (copy)
            local v105 = GVF(p104.Name);

            if v105 then
                v105 = v105.Downed.Value;
            end;

            return v105;
        end;

        local function u110(p106) -- Line: 758
            -- upvalues: LocalPlayer (copy), l_pcall (copy), _dc (copy)
            local v107 = p106 or LocalPlayer.Character;

            if not v107 then
                return false;
            end;

            local v108, v109 = l_pcall(_dc, v107);

            return v108 and v109 and v109 or false;
        end;

        local function _rgc(p111) -- Line: 769
            return p111.RagdollTime.Value > 0 and true or (p111.RagdollTime.RagdollSwitch.Value or (p111.RagdollTime.RagdollSwitch2.Value or p111.RagdollTime.SRagdolled.Value));
        end;

        local function u116(p112) -- Line: 772
            -- upvalues: LocalPlayer (copy), GVF (copy), l_pcall (copy), _rgc (copy)
            local v113 = GVF((p112 or LocalPlayer.Character).Name);

            if not v113 then
                return false;
            end;

            local v114, v115 = l_pcall(_rgc, v113);

            if v114 then
                return v115;
            end;

            return nil;
        end;

        local function CheckIfCan(p117, p118) -- Line: 787
            -- upvalues: LocalPlayer (copy), GVF (copy), u31 (copy), ReplicatedStorage (copy), u116 (ref), u110 (ref)
            local v119;

            if p117 then
                if p117 == LocalPlayer.Character then
                    v119 = true;
                else
                    v119 = false;
                end;
            else
                p117 = LocalPlayer.Character;
                v119 = true;
            end;

            local v120 = GVF();

            if not v120 then
                return false;
            end;

            if not (v119 and u31.CharF.Humanoid or p117:FindFirstChild("Humanoid")) then
                return;
            end;

            local v121 = v119 and u31.CharF.Humanoid or p117:FindFirstChild("Humanoid");
            local v122 = v119 and u31.CharF.Root or p117:FindFirstChild("HumanoidRootPart");
            local v123 = v119 and u31.CharF.Head or p117:FindFirstChild("Head");
            local v124 = v119 and u31.CharF.Torso or p117:FindFirstChild("Torso");
            local v125 = v119 and u31.CharF.State or v121:GetState();
            local v126;

            if p118 then
                if p118 == "Any" then
                    v126 = false;
                else
                    v126 = not p117:FindFirstChild(p118);
                end;
            elseif v119 then
                v126 = not (u31.CharF.RA and u31.CharF.RA.Parent) or not v119 and not p117:FindFirstChild("Right Arm");
            else
                v126 = not v119 and not p117:FindFirstChild("Right Arm");
            end;

            if ReplicatedStorage.Values.ZaWarudo.Value and ReplicatedStorage.Values.ZaWarudo.Owner.Value ~= LocalPlayer then
                return false;
            end;

            if not (v122 and (v124 and v123)) then
                return false;
            end;

            if v121 and v121.Health <= 0 or v126 then
                return false;
            end;

            if u116(p117) then
                return false;
            end;

            if u110(p117) then
                return false;
            end;

            if v120 and v120.Handcuffed.Value then
                return false;
            end;

            return (v125 ~= Enum.HumanoidStateType.FallingDown and (v125 ~= Enum.HumanoidStateType.GettingUp and v125 ~= Enum.HumanoidStateType.Seated) or v122.Anchored) and true or false;
        end;

        local function Lerp(p127, p128, p129) -- Line: 840
            return p127 + (p128 - p127) * p129;
        end;

        local BindableEvent2 = Instance.new("BindableEvent");
        BindableEvent2.Event:Connect(function(u130, p131) -- Line: 845
            task.delay(p131, function() -- Line: 846
                -- upvalues: u130 (copy)
                if u130 and u130.Parent then
                    u130:Destroy();
                end;
            end);
        end);

        local function AffectChar(p132, u133, p134, p135) -- Line: 850
            -- upvalues: GVF (copy), LocalPlayer (copy), l_math (copy), BindableEvent2 (copy)
            local v136 = GVF();
            local Character = LocalPlayer.Character;

            if not v136 then
                return nil;
            end;

            if p132 ~= "SD" and (p132 ~= "ND" and (p132 ~= "SP" and (p132 ~= "JR" and (p132 ~= "DmgM1" and p132 ~= "MS")))) then
                local BoolValue = Instance.new("BoolValue");
                BoolValue.Name = p132;

                if p132 == "ADT" and (Character and Character:FindFirstChild("Humanoid")) then
                    BoolValue.Parent = Character.Humanoid;
                else
                    BoolValue.Parent = v136.Currents;
                end;

                if u133 ~= l_math.huge and u133 < 9999 then
                    BindableEvent2:Fire(BoolValue, u133);
                end;

                return BoolValue;
            end;

            local NumberValue5 = Instance.new("NumberValue");
            NumberValue5.Name = p132 .. "_" .. p134;
            NumberValue5.Value = p135;
            NumberValue5.Parent = v136.Currents;

            if u133 ~= l_math.huge then
                coroutine.wrap(function() -- Line: 862
                    -- upvalues: u133 (copy), NumberValue5 (ref)
                    task.wait(u133);

                    if NumberValue5 and NumberValue5.Parent then
                        NumberValue5:Destroy();
                    end;
                end)();
            end;

            return NumberValue5;
        end;

        local function Disconnect(p137) -- Line: 888
            if p137 then
                p137:Disconnect();
            end;
        end;

        local function GamepassCheck(p138, p139) -- Line: 895
            -- upvalues: Gamepasses (copy), u27 (copy), l_pcall (copy), MarketplaceService (copy), LocalPlayer (copy)
            local v140 = type(p138) == "number";
            local u141 = v140 or 0;

            for i, v in pairs(Gamepasses) do
                if not ((not v140 or i ~= p138) and (v140 or v[1] ~= p138)) then
                    p138 = v[1];
                    u141 = i;
                    break;
                end;
            end;

            local v142 = u27:WaitForChild("Gamepasses", 100):FindFirstChild(p138);

            if v142 then
                return v142;
            end;

            if p139 then
                local u143 = nil;
                l_pcall(function() -- Line: 912
                    -- upvalues: u143 (ref), MarketplaceService (ref), LocalPlayer (ref), u141 (ref)
                    u143 = MarketplaceService:UserOwnsGamePassAsync(LocalPlayer.UserId, u141);
                end);

                return u143;
            end;
        end;

        local function PromptGamepass(u144, p145, p146) -- Line: 919
            -- upvalues: GamepassCheck (copy), Gamepasses (copy), MarketplaceService (copy), LocalPlayer (copy), l_tick (copy), FrameworkStuff (copy)
            GamepassCheck(u144, p146);

            if typeof(u144) ~= "number" then
                for i, v in pairs(Gamepasses) do
                    if v[1] == u144 then
                        u144 = i;
                        break;
                    end;
                end;
            end;

            if typeof(u144) == "number" then
                local u147 = nil;
                local u148 = nil;
                u148 = MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(p149, p150, p151) -- Line: 937
                    -- upvalues: u144 (ref), u147 (ref), u148 (ref)
                    if p150 == u144 then
                        u147 = p151;
                        u148:Disconnect();
                    end;
                end);
                MarketplaceService:PromptGamePassPurchase(LocalPlayer, u144);
                MarketplaceService.PromptGamePassPurchaseFinished:Wait();
                local v152 = l_tick();

                repeat
                    task.wait(0.05);
                until u147 == true or l_tick() - v152 > 1.5;

                if u148 then
                    u148:Disconnect();
                end;

                if u147 and p145 then
                    FrameworkStuff.purchase:Play();
                end;

                return u147;
            end;
        end;

        local function PromptProductPurchase(u153, p154) -- Line: 963
            -- upvalues: Products (copy), MarketplaceService (copy), ReplicatedStorage (copy), LocalPlayer (copy), l_tick (copy), FrameworkStuff (copy)
            if typeof(u153) ~= "number" then
                for i, v in pairs(Products) do
                    if v[1] == u153 then
                        u153 = i;
                        break;
                    end;
                end;
            end;

            if typeof(u153) == "number" then
                local u155 = nil;
                local u156 = nil;
                u156 = MarketplaceService.PromptProductPurchaseFinished:Connect(function(p157, p158, p159) -- Line: 980
                    -- upvalues: u153 (ref), u155 (ref), u156 (ref)
                    if p158 == u153 then
                        u155 = p159;
                        u156:Disconnect();
                    end;
                end);
                local Events3 = ReplicatedStorage:FindFirstChild("Events");

                if Events3 then
                    Events3 = Events3:FindFirstChild("ProductPrompt");
                end;

                if Events3 then
                    Events3:FireServer(u153);
                else
                    MarketplaceService:PromptProductPurchase(LocalPlayer, u153);
                end;

                MarketplaceService.PromptProductPurchaseFinished:Wait();
                local v160 = l_tick();

                repeat
                    task.wait(0.05);
                until u155 == true or l_tick() - v160 > 1.5;

                if u156 then
                    u156:Disconnect();
                end;

                if u155 and p154 then
                    FrameworkStuff.purchase:Play();
                end;

                return u155;
            end;
        end;

        local function InCombatCheck(p161, p162) -- Line: 1012
            -- upvalues: LocalPlayer (copy), GVF (copy)
            local v163 = GVF((p161 or LocalPlayer).Name);

            if not v163 then
                return;
            end;

            local v164 = false;

            if p162 then
                for _, child in pairs(v163.Tags:GetChildren()) do
                    if string.find(child.Name, "inCombat_") then
                        v164 = true;
                        break;
                    end;
                end;
            end;

            return v163.Tags:FindFirstChild("creator") or p162 and v164;
        end;

        local function CheckDeviceType() -- Line: 1033
            -- upvalues: UserInputService (copy), GuiService (copy), LocalPlayer (copy), u31 (copy)
            local TouchEnabled = UserInputService.TouchEnabled;
            local KeyboardEnabled = UserInputService.KeyboardEnabled;
            local MouseEnabled = UserInputService.MouseEnabled;
            local GamepadEnabled = UserInputService.GamepadEnabled;
            local v165 = GuiService:IsTenFootInterface();
            local v166 = v165 and 2 or ((LocalPlayer.PlayerGui:FindFirstChild("TouchGui") or TouchEnabled and not (KeyboardEnabled or (MouseEnabled or (GamepadEnabled or v165)))) and 3 or 1);
            _G.DeviceType = v166;
            u31.DeviceType = v166;

            return v166;
        end;

        local u167 = {
            [Enum.UserInputType.Gamepad1] = true,
            [Enum.UserInputType.Gamepad2] = true,
            [Enum.UserInputType.Gamepad3] = true,
            [Enum.UserInputType.Gamepad4] = true,
            [Enum.UserInputType.Gamepad5] = true,
            [Enum.UserInputType.Gamepad6] = true,
            [Enum.UserInputType.Gamepad7] = true,
            [Enum.UserInputType.Gamepad8] = true
        };
        local u168 = {
            [Enum.UserInputType.MouseMovement] = true,
            [Enum.UserInputType.MouseButton1] = true,
            [Enum.UserInputType.MouseButton2] = true,
            [Enum.UserInputType.MouseButton3] = true,
            [Enum.UserInputType.MouseWheel] = true
        };
        local u169 = nil;
        local u170 = -l_math.huge;
        local u171 = 0;
        local u172 = 0;

        local function DefaultInputScheme() -- Line: 1080
            -- upvalues: UserInputService (copy)
            local PreferredInput = UserInputService.PreferredInput;

            return PreferredInput == Enum.PreferredInput.Touch and 3 or (PreferredInput == Enum.PreferredInput.Gamepad and 2 or 1);
        end;

        local function InputSchemeFrom(p173, p174) -- Line: 1090
            -- upvalues: u170 (ref), l_tick (copy), u167 (copy), UserInputService (copy), u168 (copy), u169 (ref), u172 (ref), u171 (ref)
            local UserInputType = p173.UserInputType;

            if UserInputType == Enum.UserInputType.Touch then
                u170 = l_tick();

                return 3;
            end;

            if u167[UserInputType] then
                local KeyCode = p173.KeyCode;

                if KeyCode ~= Enum.KeyCode.Thumbstick1 and (KeyCode ~= Enum.KeyCode.Thumbstick2 and p173.UserInputState ~= Enum.UserInputState.Change) or p173.Position.Magnitude >= 0.5 then
                    return 2;
                end;

                return;
            end;

            if UserInputType == Enum.UserInputType.Keyboard then
                if not (UserInputService.TouchEnabled and (p174 or UserInputService:GetFocusedTextBox())) then
                    return 1;
                end;

                return;
            end;

            if not u168[UserInputType] then
                return;
            end;

            if UserInputService.MouseEnabled and l_tick() - u170 >= 0.5 then
                if UserInputType == Enum.UserInputType.MouseMovement and u169 ~= 1 then
                    local v175 = l_tick();

                    if v175 - u172 > 0.25 then
                        u171 = 0;
                    end;

                    u172 = v175;
                    u171 = u171 + p173.Delta.Magnitude;

                    if u171 < 12 then
                        return;
                    end;

                    u171 = 0;
                end;

                return 1;
            end;
        end;

        local u176 = nil;

        local function PadLockWanted() -- Line: 1128
            -- upvalues: LocalPlayer (copy)
            local _G_GSettings = _G.GSettings;

            if not _G_GSettings or _G_GSettings.PadShiftLock ~= false then
                return true;
            end;

            local Character = LocalPlayer.Character;
            local v177;

            if Character == nil then
                v177 = false;
            else
                v177 = Character:FindFirstChildOfClass("Tool") ~= nil;
            end;

            return v177;
        end;

        local function PadLockSync(p178) -- Line: 1137
            -- upvalues: PadLockWanted (copy), Events2 (copy)
            if _G.InputType ~= 2 then
                return;
            end;

            local _G_GSettings = _G.GSettings;

            if not (p178 or _G_GSettings and _G_GSettings.PadShiftLock == false) then
                return;
            end;

            local v179 = PadLockWanted();

            if _G.isMouseLocked == true ~= v179 then
                Events2.ChangeMouseLock:Fire(v179);
            end;
        end;

        local function CheckInputType(p180, p181, p182) -- Line: 1151
            -- upvalues: InputSchemeFrom (copy), u169 (ref), UserInputService (copy), DefaultInputScheme (copy), l_pcall (copy), LocalPlayer (copy), u31 (copy), u176 (ref), Events2 (copy), PadLockWanted (copy)
            local v183;

            if p180 then
                v183 = InputSchemeFrom(p180, p182);

                if not v183 then
                    return;
                end;

                u169 = v183;
            else
                if u169 == 2 and #UserInputService:GetConnectedGamepads() == 0 then
                    u169 = nil;
                elseif u169 == 3 and not UserInputService.TouchEnabled then
                    u169 = nil;
                end;

                v183 = u169 or DefaultInputScheme();
            end;

            if v183 == 2 then
                l_pcall(function() -- Line: 1170
                    -- upvalues: UserInputService (ref), LocalPlayer (ref)
                    local ImageForKeyCode = UserInputService:GetImageForKeyCode(Enum.KeyCode.DPadDown);
                    LocalPlayer.PlayerGui.CoreGUI.XboxDropThing.Frame.Icon.Image = ImageForKeyCode or "";
                end);
            end;

            if v183 == _G.InputType then
                _G.InputType = v183;
                u31.InputType = v183;

                if p181 and v183 == 2 then
                    Events2.ChangeMouseLock:Fire(PadLockWanted());
                end;
            else
                local v184 = _G.InputType == 2;
                _G.InputType = v183;
                u31.InputType = v183;

                if v183 == 2 then
                    u176 = _G.isMouseLocked == true;
                    Events2.ChangeMouseLock:Fire(PadLockWanted());
                elseif v184 and u176 ~= nil then
                    if _G.isMouseLocked == true ~= u176 then
                        Events2.ChangeMouseLock:Fire(u176);
                    end;

                    u176 = nil;
                end;

                Events2.InputTypeChanged:Fire(v183);
            end;

            if u31.MobileControlsM then
                if v183 == 3 then
                    u31.MobileControlsM.ToggleGUI(true);

                    return;
                end;

                u31.MobileControlsM.ToggleGUI(false);
            end;
        end;

        local function WatchChar(p185) -- Line: 1213
            -- upvalues: PadLockSync (copy)
            p185.ChildAdded:Connect(function(p186) -- Line: 1214
                -- upvalues: PadLockSync (ref)
                if p186:IsA("Tool") then
                    PadLockSync();
                end;
            end);
            p185.ChildRemoved:Connect(function(p187) -- Line: 1219
                -- upvalues: PadLockSync (ref)
                if p187:IsA("Tool") then
                    task.defer(PadLockSync);
                end;
            end);
        end;

        LocalPlayer.CharacterAdded:Connect(WatchChar);

        if LocalPlayer.Character then
            WatchChar(LocalPlayer.Character);
        end;

        Events2.SettingsChanged.Event:Connect(function(p188) -- Line: 1230
            -- upvalues: PadLockSync (copy)
            PadLockSync(p188 == "PadShiftLock");
        end);

        local function deError(p189) -- Line: 1252
            -- upvalues: l_math (copy)
            return l_math.floor(p189 + 500) / 1000;
        end;

        local function RAND(p190, p191, p192) -- Line: 1257
            -- upvalues: random (copy)
            local v193 = 1 / (p192 or 1);

            return random(p190 * v193, p191 * v193) / v193;
        end;

        local function SetCoreGuiEnabled(u194, u195, p196) -- Line: 1262
            -- upvalues: u31 (copy), l_pcall (copy), StarterGui (copy), RunService (copy)
            if u31.CoreGuiStates[u194] ~= u195 then
                local u197 = p196 or 1;
                coroutine.wrap(function() -- Line: 1266
                    -- upvalues: u197 (ref), l_pcall (ref), StarterGui (ref), u194 (copy), u195 (copy), u31 (ref), RunService (ref)
                    for i = 1, u197 do
                        local v198, _ = l_pcall(function() -- Line: 1268
                            -- upvalues: StarterGui (ref), u194 (ref), u195 (ref)
                            StarterGui:SetCoreGuiEnabled(u194, u195);
                        end);

                        if v198 then
                            u31.CoreGuiStates[u194] = u195;
                        end;

                        RunService.Heartbeat:Wait();
                        local _ = i;
                    end;
                end)();
            end;
        end;

        local function round(p199) -- Line: 1283
            -- upvalues: l_math (copy)
            return l_math.floor(p199 * 1000) / 1000;
        end;

        local function ResetAllow(p200) -- Line: 1287
            -- upvalues: BindableEvent (copy), l_pcall (copy), StarterGui (copy), u31 (copy)
            if p200 == true then
                p200 = BindableEvent or p200;
            end;

            l_pcall(StarterGui.SetCore, StarterGui, "ResetButtonCallback", p200);
            u31.resetMode = p200;
        end;

        local function Destroy(p201) -- Line: 1293
            if p201 and p201.Parent then
                p201:Destroy();
            end;
        end;

        require(NewModules.Shared.Extensions.AddCommas);
        local Folder = Instance.new("Folder");
        Folder.Name = "display_cache";
        Folder.Parent = ReplicatedStorage;
        local Folder2 = Instance.new("Folder");
        Folder2.Name = "packages_cache";
        Folder2.Parent = nil;
        local u202 = {};

        local function Destroyed(u203) -- Line: 1338
            -- upvalues: l_pcall (copy)
            if not u203 then
                return true;
            end;

            if u203.Parent then
                return false;
            end;

            local _, v204 = l_pcall(function() -- Line: 1343
                -- upvalues: u203 (copy)
                u203.Parent = u203;
            end);

            return v204:match("locked") and true or false;
        end;

        local function DisplayItemsChangedFunc() -- Line: 1347
            -- upvalues: u202 (copy), Destroyed (copy), Folder (copy)
            local v205 = _G.GSettings and not _G.GSettings.DisplayItems;

            for i, v in pairs(u202) do
                local di = v.di;

                if di and not Destroyed(di) then
                    if v205 then
                        if v205 and di.Parent ~= Folder then
                            di.Parent = Folder;
                        end;
                    elseif di.Parent ~= i then
                        di.Parent = i;
                    end;
                end;
            end;
        end;

        local function UpdateCharClientPackage(p206, p207, p208) -- Line: 1367
            -- upvalues: u202 (copy), LocalPlayer (copy), Folder2 (copy), FrameworkStuff (copy), Disconnect (copy), Destroy (copy)
            local v209 = u202[p207];

            if not (v209 and (p207 and p207.Parent)) then
                return;
            end;

            if p207 == LocalPlayer.Character then
                return;
            end;

            local vRs = v209.vRs;

            if p206 then
                if vRs and vRs.hpActive then
                    if vRs.pF then
                        for _, v in pairs(vRs.pF) do
                            if v and v.Parent then
                                v.Parent = p207;
                            end;
                        end;
                    end;

                    vRs.pF = nil;
                    local Head = p207:FindFirstChild("Head");

                    if not p207:GetAttribute("_NoHeadClientChange") then
                        Destroy(vRs.headSM);
                        vRs.headSM = nil;

                        if Head and vRs.oHeadSM then
                            vRs.oHeadSM:Clone().Parent = Head;
                            Destroy(vRs.oHeadSM);
                            vRs.oHeadSM = nil;
                        end;

                        if vRs.headlessReplace then
                            Destroy(vRs.headlessReplace);
                            vRs.headlessReplace = nil;
                        end;
                    end;

                    vRs.hpActive = nil;
                end;
            else
                local v210;

                if vRs and not vRs.hpActive then
                    vRs.hpActive = true;
                    vRs.pF = {};
                    v210 = true;
                else
                    v210 = false;
                end;

                if v210 then
                    for _, child in pairs(p207:GetChildren()) do
                        if child.ClassName == "CharacterMesh" then
                            if not table.find(vRs.pF, child) then
                                table.insert(vRs.pF, child);
                            end;

                            child.Parent = Folder2;
                        end;
                    end;

                    local Head = p207:FindFirstChild("Head");
                    local v211 = Head and (not p207:GetAttribute("_NoHeadClientChange") and Head:FindFirstChild("Mesh"));

                    if v211 then
                        if not (v211 and (v211.MeshId and (string.find(v211.MeshId, "134079402") or string.find(v211.MeshId, "16673245747")))) then
                            vRs.oHeadSM = v211;

                            if vRs.oHeadSM then
                                vRs.oHeadSM.Parent = nil;
                            end;

                            vRs.headSM = FrameworkStuff.DefaultHeadMesh:Clone();
                            vRs.headSM.Parent = Head;

                            return;
                        end;

                        vRs.headlessReplace = FrameworkStuff.HeadlessReplace:Clone();
                        vRs.headlessReplace.Parent = Head;
                        local Weld = Instance.new("Weld");
                        Weld.Part0 = Head;
                        Weld.Part1 = vRs.headlessReplace;
                        Weld.Parent = vRs.headlessReplace;
                        local u212 = nil;
                        local u213 = nil;
                        local u214 = nil;

                        local function DDISCONNECT() -- Line: 1416
                            -- upvalues: Disconnect (ref), u212 (ref), u213 (ref), u214 (ref), Destroy (ref), vRs (copy)
                            Disconnect(u212);
                            Disconnect(u213);
                            Disconnect(u214);
                            Destroy(vRs.headlessReplace);
                            vRs.headlessReplace = nil;
                        end;

                        u212 = Head.AncestryChanged:Connect(function(p215, p216) -- Line: 1427
                            -- upvalues: DDISCONNECT (copy)
                            if not p216 then
                                DDISCONNECT();
                            end;
                        end);
                        u213 = vRs.headlessReplace.AncestryChanged:Connect(function(p217, p218) -- Line: 1432
                            -- upvalues: DDISCONNECT (copy)
                            if not p218 then
                                DDISCONNECT();
                            end;
                        end);
                        u214 = Head:GetPropertyChangedSignal("Transparency"):Connect(function() -- Line: 1437
                            -- upvalues: Head (copy), DDISCONNECT (copy)
                            if Head and Head.Transparency >= 0.9 then
                                DDISCONNECT();
                            end;
                        end);
                    end;
                elseif p208 then
                    for _, v in pairs(p208) do
                        if v.ClassName == "CharacterMesh" then
                            if not table.find(vRs.pF, v) then
                                table.insert(vRs.pF, v);
                            end;

                            v.Parent = Folder2;
                        end;
                    end;
                end;
            end;
        end;

        local function ClientPackagesChangedFunc() -- Line: 1498
            -- upvalues: u31 (copy), u202 (copy), UpdateCharClientPackage (copy)
            local v219;

            if typeof(_G.GSettings) == "table" then
                v219 = _G.GSettings and _G.GSettings.PlayerPackages;
            else
                v219 = true;
            end;

            if v219 ~= u31.playerPackagesState then
                u31.playerPackagesState = v219;

                for i, _ in pairs(u202) do
                    UpdateCharClientPackage(v219, i);
                end;
            end;
        end;

        local function MonitorDisplayItems() -- Line: 1512
            -- upvalues: LocalPlayer (copy), u202 (copy), Folder (copy), Destroy (copy), Destroyed (copy), Players (copy), UpdateCharClientPackage (copy), Characters (copy), l_spawn (copy)
            local function newCharacter(u220) -- Line: 1513
                -- upvalues: LocalPlayer (ref), u202 (ref), Folder (ref), Destroy (ref), Destroyed (ref), Players (ref), UpdateCharClientPackage (ref)
                local Humanoid = u220:WaitForChild("Humanoid", 5);

                if not Humanoid then
                    return;
                end;

                if not Humanoid:GetAttribute("HasLoaded2") then
                    Humanoid:GetAttributeChangedSignal("HasLoaded2"):Wait();
                end;

                local DisplayItems = u220:FindFirstChild("DisplayItems");
                local v221 = u220 == LocalPlayer.Character;
                u202[u220] = {
                    di = DisplayItems,
                    vRs = {}
                };

                if DisplayItems and (_G.GSettings and not _G.GSettings.DisplayItems) then
                    DisplayItems.Parent = v221 and Folder or nil;
                end;

                local u222 = nil;
                u222 = u220.AncestryChanged:Connect(function(p223, p224) -- Line: 1539
                    -- upvalues: u222 (ref), u202 (ref), u220 (copy), Destroy (ref), Destroyed (ref), DisplayItems (ref)
                    if not p224 then
                        u222:Disconnect();
                        local v225 = u202[u220] and u202[u220].vRs;

                        if v225 and v225.hpActive then
                            if v225.pF then
                                for _, v in pairs(v225.pF) do
                                    Destroy(v);
                                end;
                            end;

                            v225.pF = nil;

                            if not Destroyed(v225.headSM) then
                                Destroy(v225.headSM);
                            end;

                            if not Destroyed(v225.oHeadSM) then
                                Destroy(v225.oHeadSM);
                            end;
                        end;

                        u202[u220] = nil;

                        if DisplayItems and not Destroyed(DisplayItems) then
                            DisplayItems:Destroy();
                            DisplayItems = nil;
                        end;
                    end;
                end);
                local PlayerFromCharacter = Players:GetPlayerFromCharacter(u220);

                if PlayerFromCharacter and not (Humanoid:GetAttribute("HasLoaded2") or PlayerFromCharacter:HasAppearanceLoaded()) then
                    local v226 = os.clock() + 5;

                    repeat
                        task.wait(0.1);
                    until not (u220.Parent and (PlayerFromCharacter.Character == u220 and not (Humanoid:GetAttribute("HasLoaded2") or (PlayerFromCharacter:HasAppearanceLoaded() or v226 <= os.clock()))));
                end;

                task.delay(0.5, function() -- Line: 1581
                    -- upvalues: u220 (copy), UpdateCharClientPackage (ref)
                    if u220 and u220.Parent then
                        local v227;

                        if typeof(_G.GSettings) == "table" then
                            v227 = _G.GSettings and _G.GSettings.PlayerPackages;
                        else
                            v227 = true;
                        end;

                        UpdateCharClientPackage(v227, u220, nil);
                    end;
                end);
            end;

            Characters.ChildAdded:Connect(newCharacter);

            for _, child in pairs(Characters:GetChildren()) do
                l_spawn(function() -- Line: 1591
                    -- upvalues: newCharacter (copy), child (copy)
                    newCharacter(child);
                end);
            end;
        end;

        local function S_Hmm(u228) -- Line: 1597
            -- upvalues: u66 (ref), getValueStr (copy), ServerTick (copy), l_pcall (copy), Players (copy), u4 (ref)
            local function getDt(p229, p230) -- Line: 1598
                -- upvalues: u66 (ref), getValueStr (ref), ServerTick (ref)
                local IntSalt2 = u66.IntSalt2;
                local v231 = u66.UsernameSalt and (getValueStr((tostring(p229))) or 0) or 0;

                return ServerTick.Value - (p230 + (IntSalt2 + v231 + (u66.UserIdSalt and p229.UserId / 2 or 0)));
            end;

            local v232, v233 = l_pcall(function() -- Line: 1603
                -- upvalues: getDt (copy), Players (ref), u228 (copy)
                return getDt(Players.LocalPlayer, u228);
            end);

            if v232 and (u228 and (v233 and (type(u228) == "number" and v233 < u66.MaxDT))) then
                return true;
            end;

            u4.DTXC1({ u66.CZs[1] }, 3);

            return false;
        end;

        local function S_Get() -- Line: 1616
            -- upvalues: u65 (ref), u69 (copy)
            return u65.S, u69.S;
        end;

        local function Upt_S() -- Line: 1620
            -- upvalues: S_Get (copy), u31 (copy), Events (copy), Events2 (copy)
            local v234, v235 = S_Get();

            if v234 < 10 and not u31.BreathMode then
                u31.BreathMode = true;
                Events.BreathingSound:FireServer(true);
            elseif v234 > 50 and u31.BreathMode then
                u31.BreathMode = false;
                Events.BreathingSound:FireServer(false);
            end;

            Events2.StaminaChange:Fire(v234, v235);
        end;

        local function S_Check(p236, p237) -- Line: 1634
            -- upvalues: S_Get (copy)
            local v238, v239 = S_Get();

            return v238 - p236 >= 0 and not ((not p237 or v239 * 0.1 >= v238) and p237) and true or false;
        end;

        local function S_Take(p240) -- Line: 1645
            -- upvalues: S_Get (copy), GVF (copy), HSRGEE (copy), LocalPlayer (copy), u69 (copy), u31 (copy), u65 (ref), NumberValue4 (copy), random (copy), Upt_S (copy)
            local v241, _ = S_Get();

            if GVF() and HSRGEE(LocalPlayer.Character) then
                p240 = p240 < 0 and p240 * 1 or p240 * 1;
            end;

            local v242 = v241 - p240;

            if u69.S < v242 then
                v242 = u69.S;
            elseif v242 <= 0 then
                u31.MobileControlsM.ToggleButton("sprint", false);
                v242 = 0;
            end;

            u65.S = v242;
            NumberValue4.Value = random();
            Upt_S();

            return v242;
        end;

        local function u244(p243) -- Line: 1668
            -- upvalues: S_Get (copy)
            return S_Get();
        end;

        local function u247(p245, p246) -- Line: 1673
            -- upvalues: S_Hmm (copy), S_Take (copy)
            if S_Hmm(p245) and type(p246) == "number" then
                return S_Take(p246);
            end;

            return false;
        end;

        local function u251(p248, p249, p250) -- Line: 1678
            -- upvalues: S_Hmm (copy), S_Check (copy)
            if S_Hmm(p248) and type(p249) == "number" then
                return S_Check(p249, p250);
            end;

            return false;
        end;

        local function CantS() -- Line: 1683
            -- upvalues: Events2 (copy)
            Events2.CantStamina:Fire();
        end;

        local function GameLoadWait() -- Line: 1687
            -- upvalues: l_pcall (copy), u27 (copy), u62 (ref), StarterGui (copy), FAILEDTOLOAD101 (copy)
            local v252, v253 = l_pcall(function() -- Line: 1688
                -- upvalues: u27 (ref), u62 (ref), StarterGui (ref)
                u27:WaitForChild("Loaded", 600);

                if not u27.Loaded.Value then
                    u27.Loaded:GetPropertyChangedSignal("Value"):Wait();
                end;

                u62 = true;
                StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true);
            end);

            if v252 then
                return;
            end;

            warn(v253);
            FAILEDTOLOAD101();
        end;

        local function SprintTing(p254) -- Line: 1705
            -- upvalues: GVF (copy), S_Get (copy), u31 (copy), u59 (ref), u60 (ref), l_time (copy), u65 (ref), u67 (ref), CantS (copy)
            local v255 = GVF();
            local v256, v257 = S_Get();

            if p254 == false then
                if u31.CharF.sprinting then
                    u59:Pause();
                    u60:Play();
                end;

                v255.Sprinting.Value = false;
                u31.CharF.sprinting = false;
                u31.CharF.sprintTick = 0;

                return;
            end;

            if v257 * 0.1 >= v256 then
                CantS();

                return;
            end;

            if not u31.CharF.sprinting then
                u31.CharF.sprinting = true;
                u31.CharF.sprintTick = l_time();
                u60:Pause();
                u59:Play();
            end;

            u65.WS = u67.RunWalkSpeed;
            v255.Sprinting.Value = true;
        end;

        local function cTag(u258, u259, u260) -- Line: 1734
            -- upvalues: CollectionService (copy)
            CollectionService:AddTag(u258, u259);

            if u260 then
                coroutine.wrap(function() -- Line: 1737
                    -- upvalues: u260 (copy), u258 (copy), CollectionService (ref), u259 (copy)
                    task.wait(u260);

                    if u258 and u258.Parent then
                        CollectionService:RemoveTag(u258, u259);
                    end;
                end)();
            end;
        end;

        local function MonitorSound(u261, u262, p263, p264, p265, p266, p267) -- Line: 1746
            -- upvalues: u56 (copy), Destroyed (copy)
            if not (u261 and (u261.Parent and not u56[u261])) then
                return;
            end;

            local u268 = {
                u261,
                u262,
                p263,
                p264,
                p265,
                p266,
                nil
            };
            u56[u261] = u268;
            local u269 = nil;
            u269 = u261.AncestryChanged:Connect(function(p270, p271) -- Line: 1753
                -- upvalues: u56 (ref), u261 (copy), Destroyed (ref), u269 (ref), u268 (copy)
                if p271 then
                    u56[u261] = u268;
                else
                    u56[u261] = nil;

                    if Destroyed(u261) then
                        u269:Disconnect();
                    end;
                end;
            end);
            coroutine.wrap(function() -- Line: 1765
                -- upvalues: u262 (copy), u56 (ref), u261 (copy), u269 (ref)
                task.wait(u262);
                u56[u261] = nil;
                u269:Disconnect();
            end)();
        end;

        local function underGroundCheck(p272, p273) -- Line: 1772
            -- upvalues: u31 (copy)
            if typeof(p272) == "Vector3" then
                return ((p273 or 1) == 2 and (u31.LightingConfig.underGround2.posY or -48.7) or (u31.LightingConfig.underGround1.posY or -5)) > p272.Y;
            end;
        end;

        local function MonitorSound2(p274, p275) -- Line: 1784
            -- upvalues: u57 (copy), workspace_CurrentCamera (ref), underGroundCheck (copy), l_math (copy)
            if not (p274 and p274.Parent) then
                u57[p274] = nil;

                return;
            end;

            local DistEqualizer = p274:FindFirstChild("DistEqualizer");

            if not DistEqualizer then
                DistEqualizer = Instance.new("EqualizerSoundEffect");
                DistEqualizer.Name = "DistEqualizer";
                DistEqualizer.LowGain = 0;
                DistEqualizer.HighGain = 0;
                DistEqualizer.MidGain = 0;
                DistEqualizer.Priority = 20;
                DistEqualizer.Parent = p274;
                DistEqualizer.Enabled = false;
            end;

            local v276 = p275 and p274.Parent.WorldPosition or p274.Parent.Position;
            local Position = workspace_CurrentCamera.CFrame.Position;
            local v277 = p274.EmitterSize * 100;
            local Magnitude = (v276 - Position).Magnitude;
            local v278 = v276.Y - Position.Y;
            local v279 = underGroundCheck(Position, 1);
            local v280 = underGroundCheck(Position, 2);
            local v281 = nil;
            local v282;

            if v280 and not underGroundCheck(v276, 2) or underGroundCheck(v276, 2) and not v280 then
                l_math.abs(v278);
                v282 = 10;
                v281 = true;
            elseif v279 and not underGroundCheck(v276, 1) or underGroundCheck(v276, 1) and not v279 then
                l_math.abs(v278);
                v282 = 5;
                v281 = true;
            else
                v282 = v278 / 100;
            end;

            local v283 = Magnitude / (v277 / l_math.max(v282, 1));
            local v284 = (1 - l_math.clamp(1 - v283, 0, 1)) * 100;
            local v285 = l_math.floor(v284) / 100;

            if v281 then
                local _ = 5 - l_math.clamp(5 - v283, 0, 5);
                v283 = l_math.floor(v285 * 100) / 100;
            end;

            DistEqualizer.LowGain = -1 * v283;
            DistEqualizer.MidGain = -80 * v285;
            DistEqualizer.HighGain = -80 * v285;
            DistEqualizer.Enabled = not p274:FindFirstChild("NoMonitor");
        end;

        local function MS2_Check(u286, p287) -- Line: 1860
            -- upvalues: u58 (copy), SoundService (copy), u57 (copy), MonitorSound2 (copy), random (copy)
            debug.profilebegin("MS2_Check");
            warn("new descendant", u286:GetFullName());

            if not (u286.ClassName ~= "Sound" or not (u286.Parent:IsA("BasePart") or u286.Parent:IsA("Attachment")) or u58[u286]) then
                u58[u286] = u286.Playing;

                if not (u286.SoundGroup or u286:GetAttribute("NSG")) then
                    u286.SoundGroup = SoundService.Main;
                end;

                local u288 = true;
                local u289 = nil;

                local function c(p290) -- Line: 1876
                    -- upvalues: u288 (ref), u286 (copy), u57 (ref), MonitorSound2 (ref)
                    if not (u288 and u286.Playing) then
                        u57[u286] = nil;

                        return;
                    end;

                    u57[u286] = { u286, u286.Parent:IsA("Attachment") };
                    MonitorSound2(u57[u286][1], u57[u286][2]);
                end;

                c(true);
                local u291 = random();
                local u292 = u286:GetPropertyChangedSignal("Playing"):Connect(c);
                u289 = u286.AncestryChanged:Connect(function(p293, p294) -- Line: 1894
                    -- upvalues: u291 (ref), random (ref), u288 (ref), u292 (ref), u289 (ref), u57 (ref), u286 (copy), u58 (ref), c (copy)
                    u291 = random();

                    if p294 then
                        u57[u286] = { u286, u286:IsA("Attachment") };
                        u288 = true;
                    else
                        u288 = false;
                        local u295 = u291;
                        task.delay(10, function() -- Line: 1900
                            -- upvalues: u295 (copy), u291 (ref), u292 (ref), u289 (ref), u57 (ref), u286 (ref), u58 (ref)
                            if u295 == u291 then
                                u292:Disconnect();
                                u289:Disconnect();
                                u57[u286] = nil;
                                u58[u286] = nil;
                            end;
                        end);
                    end;

                    c();
                end);
            end;

            debug.profileend("MS2_Check");
        end;

        local function TweakC0Monitor(u296) -- Line: 1920
            -- upvalues: u31 (copy), l_pcall (copy), TurnEffect (copy)
            if u31.monitorC0Chars[u296] then
                return;
            end;

            local u297 = {};
            local u298 = {};
            local u299 = {};

            local function TM_DISCONNECT() -- Line: 1930
                -- upvalues: u298 (copy), l_pcall (ref), u299 (ref), u297 (ref), u31 (ref), u296 (copy)
                for _, v in pairs(u298) do
                    l_pcall(function() -- Line: 1932
                        -- upvalues: v (copy)
                        v:Disconnect();
                    end);
                end;

                for _, v in pairs(u299) do
                    l_pcall(function() -- Line: 1937
                        -- upvalues: v (copy)
                        v:Disconnect();
                    end);
                end;

                l_pcall(function() -- Line: 1942
                    -- upvalues: u297 (ref)
                    u297.activeTurnEffect:Stop();
                end);

                for i, _ in pairs(u297) do
                    u297[i] = nil;
                end;

                u297 = nil;
                u31.monitorC0Chars[u296] = nil;
            end;

            local function UpdateCharAttributes() -- Line: 1955
                -- upvalues: u297 (ref), u296 (copy)
                u297.atribs = u296:GetAttributes();
            end;

            local function UpdateHumanoidAttributes() -- Line: 1958
                -- upvalues: u297 (ref)
                u297.atribs2 = u297.humanoid:GetAttributes();
            end;

            local function HumanoidADTThing() -- Line: 1965
                -- upvalues: u297 (ref)
                u297.hum_adt = u297.humanoid:FindFirstChild("ADT");
            end;

            local function UpdateCurrentTool(p300) -- Line: 1969
                -- upvalues: u297 (ref), u296 (copy), u299 (ref), l_pcall (ref)
                if not (p300 and (not p300 or p300.ClassName ~= "Tool")) then
                    task.delay(0, function() -- Line: 1971
                        -- upvalues: u297 (ref), u296 (ref), u299 (ref), l_pcall (ref)
                        if u297 then
                            local v301 = u296:FindFirstChildOfClass("Tool");

                            if v301 and u297.tool ~= v301 then
                                for _, v in pairs(u299) do
                                    l_pcall(function() -- Line: 1976
                                        -- upvalues: v (copy)
                                        v:Disconnect();
                                    end);
                                end;

                                u299 = {};
                                u297.toolData = {};
                                local toolData = u297.toolData;

                                local function bind(u302, u303) -- Line: 1992
                                    -- upvalues: toolData (copy), u299 (ref)
                                    toolData[u302] = u303;

                                    local function setDefault(p304) -- Line: 1994
                                        -- upvalues: toolData (ref), u302 (copy), u303 (copy)
                                        toolData[u302 .. "_DefaultCF"] = p304;
                                        toolData[u302 .. "_DefaultCF_Offset"] = u303:FindFirstChild("Offset");
                                    end;

                                    local DefaultCF = u303:FindFirstChild("DefaultCF");

                                    if DefaultCF then
                                        setDefault(DefaultCF);
                                    end;

                                    table.insert(u299, u303.ChildAdded:Connect(function(p305) -- Line: 2002
                                        -- upvalues: toolData (ref), u302 (copy), setDefault (copy)
                                        if p305.Name == "DefaultCF" and not toolData[u302 .. "_DefaultCF"] then
                                            setDefault(p305);

                                            return;
                                        end;

                                        if p305.Name == "Offset" and (toolData[u302 .. "_DefaultCF"] and not toolData[u302 .. "_DefaultCF_Offset"]) then
                                            toolData[u302 .. "_DefaultCF_Offset"] = p305;
                                        end;
                                    end));
                                end;

                                local u306 = {
                                    Tool6D_1 = { "Tool6D_Torso" },
                                    Tool6D_2 = { "Mag6D_Torso", "Mag6D_HRP" },
                                    Tool6D_3 = { "Mag6D2_Torso" }
                                };
                                local v307 = false;

                                for _, v in ipairs({ "Tool6D_1", "Tool6D_2", "Tool6D_3" }) do
                                    local v308 = v;
                                    local v309 = nil;

                                    for _, v2 in ipairs(u306[v]) do
                                        v309 = v309 or v301:FindFirstChild(v2);
                                    end;

                                    if v309 then
                                        bind(v308, v309);
                                    else
                                        v307 = true;
                                    end;
                                end;

                                if v307 then
                                    table.insert(u299, v301.ChildAdded:Connect(function(p310) -- Line: 2025
                                        -- upvalues: u306 (copy), toolData (copy), bind (copy)
                                        for i, v in pairs(u306) do
                                            if not toolData[i] and table.find(v, p310.Name) then
                                                bind(i, p310);
                                            end;
                                        end;
                                    end));
                                end;
                            end;

                            u297.tool = v301;
                        end;
                    end);
                end;
            end;

            u297.char = u296;
            u297.root = u296:FindFirstChild("HumanoidRootPart");
            u297.torso = u296:FindFirstChild("Torso");
            u297.head = u296:FindFirstChild("Head");
            u297.humanoid = u296:FindFirstChild("Humanoid");
            local v311 = u297.torso and u297.torso:FindFirstChild("Left Shoulder");
            u297.leftShoulder = v311;
            local v312 = u297.torso and u297.torso:FindFirstChild("Right Shoulder");
            u297.rightShoulder = v312;
            local v313 = u297.torso and u297.torso:FindFirstChild("Neck");
            u297.neck = v313;
            local v314 = u297.root and u297.root:FindFirstChild("RootJoint");
            u297.rootJoint = v314;

            if u297.root and (u297.torso and (u297.head and (u297.humanoid and (u297.leftShoulder and (u297.rightShoulder and (u297.neck and u297.rootJoint)))))) then
                u297.atribs = {};
                u297.atribs2 = {};
                u297.activeTurnEffect = TurnEffect.New(u296, u297.humanoid, u297.root);
                UpdateCharAttributes();
                UpdateHumanoidAttributes();
                HumanoidADTThing();
                UpdateCurrentTool();
                table.insert(u298, u296.AttributeChanged:Connect(UpdateCharAttributes));
                table.insert(u298, u297.humanoid.AttributeChanged:Connect(UpdateHumanoidAttributes));
                table.insert(u298, u297.humanoid.ChildAdded:Connect(HumanoidADTThing));
                table.insert(u298, u297.humanoid.ChildRemoved:Connect(HumanoidADTThing));
                table.insert(u298, u296.ChildAdded:Connect(UpdateCurrentTool));
                table.insert(u298, u296.ChildRemoved:Connect(UpdateCurrentTool));
                table.insert(u298, u296.AncestryChanged:Connect(function(p315, p316) -- Line: 2070
                    -- upvalues: TM_DISCONNECT (copy)
                    if not p316 then
                        TM_DISCONNECT();
                    end;
                end));
                table.insert(u298, u297.humanoid.Died:Connect(TM_DISCONNECT));
                u31.monitorC0Chars[u296] = u297;

                return u297;
            end;
        end;

        local function DoTweak(p317, p318, p319, p320, u321, p322, p323, p324, p325, u326, p327) -- Line: 2082
            -- upvalues: u31 (copy), TweakC0Monitor (copy), LocalPlayer (copy), TweenService (copy), l_math (copy), workspace_CurrentCamera (ref), u116 (ref), l_tick (copy), GVF (copy), MOVZREP (copy), u63 (ref)
            local v328 = u31.monitorC0Chars[p317] or TweakC0Monitor(p317);

            if not v328 then
                return;
            end;

            local u329 = p317 == LocalPlayer.Character;
            local u330 = _G.FP and p317 == LocalPlayer.Character;

            local function Tween(p331, p332, p333, p334) -- Line: 2093
                -- upvalues: u330 (copy), u329 (copy), u31 (ref), TweenService (ref), u326 (copy), l_math (ref)
                local Attribute = p332:GetAttribute("RESIZ_OS");

                if Attribute and not u330 then
                    p333 = CFrame.new(p333.Position * Attribute) * (p333 - p333.Position);

                    if p334 then
                        p334 = CFrame.new(p334.Position * Attribute) * (p334 - p334.Position);
                    end;
                end;

                if p332 and p332.Parent then
                    if not u329 then
                        local v335 = p334 and {
                            C0 = p333,
                            C1 = p334
                        } or {
                            C0 = p333
                        };
                        local tweenInfos = u31.tweenInfos;

                        if not tweenInfos then
                            tweenInfos = {};
                            u31.tweenInfos = tweenInfos;
                        end;

                        local v336 = tweenInfos[p331];

                        if not v336 then
                            v336 = TweenInfo.new(p331, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
                            tweenInfos[p331] = v336;
                        end;

                        TweenService:Create(p332, v336, v335):Play();

                        return;
                    end;

                    local v337 = l_math.min(u326 * (1 - p331) * 10, 1);
                    p332.C0 = p332.C0:Lerp(p333, v337);

                    if p334 then
                        p332.C1 = p332.C1:Lerp(p334, v337);
                    end;
                end;
            end;

            local _ = v328.root;
            local torso = v328.torso;
            local humanoid = v328.humanoid;
            local u338 = not v328.atribs.NoArmMovement and p322;

            if not (p317 and (p317.Parent and (torso and (v328.head and humanoid)))) then
                return false;
            end;

            if p317 ~= LocalPlayer.Character and (torso.CFrame.p - workspace_CurrentCamera.CFrame.Position).Magnitude > 1000 then
                return;
            end;

            if not (u329 and u116()) then
                local leftShoulder = v328.leftShoulder;
                local rightShoulder = v328.rightShoulder;
                local neck = v328.neck;
                local v339 = v328.atribs2.NeckOffset or CFrame.new();
                local OriginRS_C1 = v328.atribs2.OriginRS_C1;
                local v340 = u329 and u31.CharF.State or humanoid:GetState();

                if u329 and (l_tick() - u31.lastRep >= 0.333 or (p325 or u31.ForceArmMovRep)) then
                    if not p325 then
                        u31.lastRep = l_tick();
                    end;

                    p327 = u31.ForceArmMovRep_Instant and true or p327;
                    u31.ForceArmMovRep = nil;
                    u31.ForceArmMovRep_Instant = nil;
                    local v341 = {};
                    local v342 = {
                        p318,
                        p319,
                        p320,
                        u321,
                        u338,
                        p323,
                        p324
                    };
                    local Value = GVF().Sprinting.Value;
                    local v343 = u31.isCrouching == true;
                    local v344 = l_math.floor(humanoid.WalkSpeed * 10) / 10;
                    table.insert(v341, v342);
                    table.insert(v341, Value);
                    table.insert(v341, v343);
                    table.insert(v341, v344);
                    MOVZREP:FireServer(v341, p327);
                end;

                local u345, v346;

                if p327 then
                    u345 = 0;
                    v346 = 0;
                else
                    u345 = u329 and 0.1 or 0.25;
                    v346 = 0.25;
                end;

                local v347 = p317:GetAttribute("BayonetCharging") and 0 or -l_math.asin((p319 - p318).Unit.Y);
                local v348 = 0;

                if v328.rootJoint and v328.rootJoint:GetAttribute("TurnEffectAngle") then
                    v348 = v348 + v328.rootJoint:GetAttribute("TurnEffectAngle");
                end;

                local v349 = v347 + v348;
                local v350 = 0;
                local v351 = 0;

                local function dxx(p352, p353) -- Line: 2219
                    -- upvalues: u345 (ref), u321 (ref), u338 (ref)
                    u345 = 0;
                    u321 = p352;
                    u338 = p353;
                end;

                if u330 then
                    u63 = true;
                    u345 = 0;
                    dxx(false, false);
                    v346 = 0;
                elseif u63 and p317 == LocalPlayer.Character then
                    u345 = 0;
                    u63 = false;
                end;

                if v328.hum_adt then
                    dxx(true, false);
                end;

                if p324 then
                    v350 = -0;
                    v351 = 0;
                end;

                local CFrame_new_ret = CFrame.new();
                local G_ArmsOffset2 = v328.atribs2.G_ArmsOffset2;
                local G_ArmsOffset3 = v328.atribs2.G_ArmsOffset3;
                local v354 = v328.atribs2.G_ArmsOffset or nil;

                if G_ArmsOffset2 then
                    if v354 then
                        G_ArmsOffset2 = v354 * G_ArmsOffset2;
                    end;
                else
                    G_ArmsOffset2 = v354;
                end;

                if G_ArmsOffset3 then
                    if G_ArmsOffset2 then
                        G_ArmsOffset3 = G_ArmsOffset2 * G_ArmsOffset3;
                    end;
                else
                    G_ArmsOffset3 = G_ArmsOffset2;
                end;

                if leftShoulder then
                    if u338 then
                        local v355 = CFrame.new(-1, 0.5, 0) * CFrame.Angles(v349, v350 + -1.55, v351);

                        if G_ArmsOffset3 then
                            v355 = v355 * G_ArmsOffset3;
                            local LA_ArmsOffset2 = v328.atribs2.LA_ArmsOffset2;

                            if LA_ArmsOffset2 then
                                v355 = v355 * LA_ArmsOffset2;
                            end;

                            local LA_ArmsOffset3 = v328.atribs2.LA_ArmsOffset3;

                            if LA_ArmsOffset3 then
                                v355 = v355 * LA_ArmsOffset3;
                            end;
                        end;

                        Tween(u345, leftShoulder, v355);
                    else
                        Tween(v346, leftShoulder, CFrame.new(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0));
                    end;
                end;

                if rightShoulder then
                    if u338 then
                        CFrame_new_ret = CFrame.new(1, 0.5, 0) * CFrame.Angles(v349, v350 + 1.55, v351);

                        if G_ArmsOffset3 then
                            local CFrame_new_ret2 = CFrame.new(-G_ArmsOffset3.X, G_ArmsOffset3.Y, -G_ArmsOffset3.Z);
                            local v356, v357, v358 = G_ArmsOffset3:ToEulerAnglesYXZ();
                            CFrame_new_ret = CFrame_new_ret * (CFrame_new_ret2 * CFrame.Angles(-v356, v357, v358));
                        end;

                        Tween(u345, rightShoulder, CFrame_new_ret);
                    else
                        CFrame_new_ret = CFrame.new(1, 0.5, 0) * CFrame.Angles(0, 1.55, 0);
                        Tween(v346, rightShoulder, CFrame_new_ret, OriginRS_C1 or CFrame.new(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0));
                    end;
                end;

                if v328.tool then
                    local Tool6D_1 = v328.toolData.Tool6D_1;

                    if Tool6D_1 and v328.toolData.Tool6D_1_DefaultCF then
                        local Tool6D_1_DefaultCF = v328.toolData.Tool6D_1_DefaultCF;

                        if u338 and rightShoulder then
                            local v359 = v328.toolData.Tool6D_1_DefaultCF_Offset and v328.toolData.Tool6D_1_DefaultCF_Offset.Value or CFrame.new();
                            Tween(u345, Tool6D_1, CFrame_new_ret * CFrame.fromEulerAnglesXYZ(0, l_math.pi / -2, 0) * v359 * Tool6D_1_DefaultCF.Value);
                        else
                            Tween(v346, Tool6D_1, Tool6D_1_DefaultCF.Value);
                        end;
                    end;

                    local Tool6D_2 = v328.toolData.Tool6D_2;

                    if Tool6D_2 and v328.toolData.Tool6D_2_DefaultCF then
                        local Tool6D_2_DefaultCF = v328.toolData.Tool6D_2_DefaultCF;

                        if u338 and rightShoulder then
                            local v360 = v328.toolData.Tool6D_2_DefaultCF_Offset and v328.toolData.Tool6D_2_DefaultCF_Offset.Value or CFrame.new();
                            Tween(u345, Tool6D_2, CFrame_new_ret * CFrame.fromEulerAnglesXYZ(0, l_math.pi / -2, 0) * v360 * Tool6D_2_DefaultCF.Value);
                        else
                            Tween(v346, Tool6D_2, Tool6D_2_DefaultCF.Value);
                        end;
                    end;

                    local Tool6D_3 = v328.toolData.Tool6D_3;

                    if Tool6D_3 and v328.toolData.Tool6D_3_DefaultCF then
                        local Tool6D_3_DefaultCF = v328.toolData.Tool6D_3_DefaultCF;

                        if u338 and rightShoulder then
                            local v361 = v328.toolData.Tool6D_3_DefaultCF_Offset and v328.toolData.Tool6D_3_DefaultCF_Offset.Value or CFrame.new();
                            Tween(u345, Tool6D_3, CFrame_new_ret * CFrame.fromEulerAnglesXYZ(0, l_math.pi / -2, 0) * v361 * Tool6D_3_DefaultCF.Value);
                        else
                            Tween(v346, Tool6D_3, Tool6D_3_DefaultCF.Value);
                        end;
                    end;
                end;

                if neck then
                    local v362 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0) * v339;

                    if v340 == Enum.HumanoidStateType.Swimming or not (u321 and p320) then
                        Tween(v346, neck, v362);
                    else
                        local CFrame_new = CFrame.new;
                        local CFrame_Angles = CFrame.Angles;
                        local _ = CFrame.new().toObjectSpace;
                        local asin = l_math.asin;
                        local pi = l_math.pi;
                        local v363 = l_math.pi / 2;
                        local v364;

                        if p323 then
                            v364 = CFrame_new(v362.p) * CFrame_Angles(0, -asin(p320.X), 0) * CFrame_Angles(-v363 + asin(p320.Y), 0, pi);
                        else
                            v364 = CFrame_new(v362.p) * CFrame_Angles(-v363, 0, pi);
                        end;

                        Tween(u345 * 0.75, neck, v364);
                    end;
                end;

                return true;
            end;
        end;

        local function ForceChar(p365, p366, p367) -- Line: 2403
            -- upvalues: cTag (copy), Debris (copy)
            if p365 or not p365.Parent then
                local BodyForce = Instance.new("BodyForce");
                BodyForce.Force = p366;
                cTag(BodyForce, "BM");
                BodyForce.Parent = p365;

                if p367 then
                    Debris:AddItem(BodyForce, p367);
                end;

                return BodyForce;
            end;
        end;

        local function CreateForce(p368, p369) -- Line: 2417
            -- upvalues: cTag (copy), Debris (copy)
            if p368 or not p368.Parent then
                local v370 = {};

                if p368 and p368.Parent then
                    for _, child in pairs(p368:GetChildren()) do
                        if child.Name == "ForceT_Ang" or child.Name == "ForceT_bodyV" then
                            child:Destroy();
                        end;
                    end;
                end;

                for i, v in pairs(p369) do
                    local Instance_new_ret = Instance.new(i);
                    local v371 = v;

                    for i2, v2 in pairs(v.Paras) do
                        Instance_new_ret[i2] = v2;
                    end;

                    cTag(Instance_new_ret, "BM");
                    Instance_new_ret.Parent = p368;

                    if v371.Time then
                        Debris:AddItem(Instance_new_ret, v371.Time);
                    end;

                    table.insert(v370, Instance_new_ret);
                end;

                return v370;
            end;
        end;

        local function RagdollChar(p372) -- Line: 2450
            -- upvalues: GVF (copy), random (copy), Players (copy), u110 (ref)
            local u373 = p372 or 1;
            local RagdollTime = GVF().RagdollTime;
            RagdollTime.RagdollTime2.Value = RagdollTime.RagdollTime2.Value + u373;
            RagdollTime.RagdollSwitch2.Value = true;
            RagdollTime.RagdollSwitch.Value = true;
            local v374 = random();
            RagdollTime.RagdollSwitch2.Code.Value = v374;
            Players.LocalPlayer.Character.Humanoid.PlatformStand = true;
            local _ = RagdollTime.Value;
            coroutine.wrap(function() -- Line: 2470
                -- upvalues: u373 (ref), RagdollTime (copy), Players (ref), u110 (ref)
                task.wait(u373);

                if RagdollTime.RagdollTime2.Value - u373 <= 0 then
                    RagdollTime.RagdollSwitch2.Value = false;

                    if RagdollTime.Value <= 0 and not RagdollTime.SRagdolled.Value then
                        Players.LocalPlayer.Character.Humanoid.PlatformStand = false;
                    end;
                end;

                RagdollTime.RagdollTime2.Value = RagdollTime.RagdollTime2.Value - u373;
                local os_clock_ret = os.clock();

                while RagdollTime.Parent and (RagdollTime.RagdollSwitch.Value and (os.clock() - os_clock_ret < 120 and (u110() or (RagdollTime.Value > 0 or RagdollTime.SRagdolled.Value)))) do
                    task.wait(0.25);
                end;

                if RagdollTime.Parent and (RagdollTime.RagdollTime2.Value <= 0 and not (u110() or (RagdollTime.Value > 0 or RagdollTime.SRagdolled.Value))) then
                    RagdollTime.RagdollSwitch.Value = false;
                end;
            end)();
        end;

        local function BodyGyroFunc(p375, p376, p377, p378, p379) -- Line: 2492
            -- upvalues: u31 (copy), u110 (ref), workspace_CurrentCamera (ref), u116 (ref), UserInputService (copy)
            if p375 and (p376 and (p377 and (p378 and u31.mBodyRotGyro))) then
                local v380 = u110();

                if p377.MoveDirection.Magnitude > 0.1 then
                    u31.lastMoveDir = p377.MoveDirection;
                end;

                if not p378.Downed.Resisting.Value then
                    if v380 then
                        u31.mBodyRotGyro.CFrame = CFrame.new(p376.Position, p376.Position + u31.lastMoveDir + Vector3.new(0.01, 0.01, 0.01));
                    elseif _G.InputType == 3 then
                        u31.mBodyRotGyro.CFrame = CFrame.new(p376.Position, p376.Position + workspace_CurrentCamera.CFrame.LookVector * 1000);
                    else
                        u31.mBodyRotGyro.CFrame = CFrame.new(p376.Position, u31.MousePoint);
                    end;
                end;

                if p376 and (p376.Parent and (p377 and (p377.Parent and u31.mBodyRotGyro))) then
                    local State = u31.CharF.State;
                    local v381 = u116(p375);
                    u31.mBodyRotGyro.D = 10000;

                    if v381 or (p376:GetAttribute("NO_ROOT_ROT") or p376:FindFirstChild("HealGyro")) then
                        p377.AutoRotate = false;
                        u31.mBodyRotGyro.Parent = nil;

                        return;
                    end;

                    if v380 or State ~= Enum.HumanoidStateType.Climbing and (State ~= Enum.HumanoidStateType.FallingDown and (State ~= Enum.HumanoidStateType.GettingUp and (State ~= Enum.HumanoidStateType.Ragdoll and (State ~= Enum.HumanoidStateType.StrafingNoPhysics and (State ~= Enum.HumanoidStateType.PlatformStanding and not (p377.Sit or (p377.PlatformStand or not (p379 or (u31.CharF.Currents.ROTROOT or UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter))))))))) then
                        p377.AutoRotate = false;
                        u31.mBodyRotGyro.Parent = p376;
                        u31.mBodyRotGyro.D = v380 and 800 or 100;

                        return;
                    end;

                    if p375:FindFirstChild("RBTMVB") then
                        p377.AutoRotate = false;
                        u31.mBodyRotGyro.Parent = p376;
                        u31.mBodyRotGyro.CFrame = CFrame.new(p376.Position, p376.Position + p377.MoveDirection + p376.CFrame.LookVector * 0.1);
                        u31.mBodyRotGyro.D = 100;

                        return;
                    end;

                    u31.mBodyRotGyro.Parent = nil;
                    p377.AutoRotate = not v381;
                end;
            end;
        end;

        local function DamageHitEffect(p382, p383) -- Line: 2561
            -- upvalues: workspace_CurrentCamera (ref), HSRGEE (copy), l_math (copy), u53 (ref), u31 (copy), Destroyed (copy), Debris (copy), Lerp (copy), u37 (ref), TweenService (copy), CamShakeConfig (copy), RAND (copy), u61 (copy)
            if not (p382 and p382.Parent) then
                return;
            end;

            local Humanoid = p382:FindFirstChild("Humanoid");

            if not Humanoid then
                return;
            end;

            local ColorCorrectionEffect2 = Instance.new("ColorCorrectionEffect", workspace_CurrentCamera);
            local BlurEffect = Instance.new("BlurEffect", workspace_CurrentCamera);
            BlurEffect.Size = 0;

            if HSRGEE(p382) then
                p383 = p383 * 0.4;
            end;

            local v384 = l_math.min(p383, 200);
            table.insert(u53, ColorCorrectionEffect2);
            table.insert(u53, BlurEffect);
            u31.effInserts = (u31.effInserts or 0) + 2;

            if u31.effInserts >= 64 then
                u31.effInserts = 0;
                local v385 = 0;

                for i = 1, #u53 do
                    local v386 = u53[i];
                    local v387;

                    if v386 == nil or typeof(v386) == "Instance" and Destroyed(v386) then
                        v387 = i;
                    else
                        v385 = v385 + 1;
                        u53[v385] = v386;
                        v387 = i;
                    end;
                end;

                for i = #u53, v385 + 1, -1 do
                    u53[i] = nil;
                    local _ = i;
                end;
            end;

            Debris:AddItem(ColorCorrectionEffect2, 2);
            Debris:AddItem(BlurEffect, 2);
            local v388 = Lerp(0.1, 1, v384 / 100);
            local v389 = 0.1;
            local u390 = 0.25 + v388 * 0.175;

            if Humanoid.Health == 0 or u37 then
                v389 = v389 * 2;
                u390 = u390 * 2;
            end;

            TweenService:Create(ColorCorrectionEffect2, TweenInfo.new(v389, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                TintColor = Color3.new(1, l_math.max(1 - v388 * 1, 0.2), (l_math.max(1 - v388 * 1, 0.2))),
                Contrast = v388 * 0.05
            }):Play();
            TweenService:Create(BlurEffect, TweenInfo.new(v389, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = l_math.min(v388 * 30, 100) + 5
            }):Play();
            task.delay(v389, function() -- Line: 2618
                -- upvalues: ColorCorrectionEffect2 (copy), BlurEffect (copy), TweenService (ref), u390 (ref)
                if ColorCorrectionEffect2 and BlurEffect.Parent then
                    TweenService:Create(ColorCorrectionEffect2, TweenInfo.new(u390, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        Brightness = 0,
                        Contrast = 0,
                        TintColor = Color3.new(1, 1, 1)
                    }):Play();
                    TweenService:Create(BlurEffect, TweenInfo.new(u390, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        Size = 0
                    }):Play();
                end;
            end);
            local AngleX_Min = CamShakeConfig.AngleX_Min;
            local AngleX_Max = CamShakeConfig.AngleX_Max;
            local AngleZ_Min = CamShakeConfig.AngleZ_Min;
            local AngleZ_Max = CamShakeConfig.AngleZ_Max;
            local AngleY_Min = CamShakeConfig.AngleY_Min;
            local AngleY_Max = CamShakeConfig.AngleY_Max;
            local v391;

            if Humanoid.Health == 0 or u37 then
                AngleY_Max = 3;
                AngleZ_Min = -3;
                AngleZ_Max = 3;
                v391 = 2;
                AngleX_Min = 2;
                AngleX_Max = 2;
                AngleY_Min = -3;
            else
                v391 = 1;
            end;

            local v392 = CamShakeConfig.Recoil * v388 * v391;
            local v393 = v392 * RAND(AngleX_Min, AngleX_Max, CamShakeConfig.Accuracy);
            local u394 = l_math.rad(v393);
            local v395 = v392 * RAND(AngleY_Min, AngleY_Max, CamShakeConfig.Accuracy);
            local u396 = l_math.rad(v395);
            local v397 = v392 * RAND(AngleZ_Min, AngleZ_Max, CamShakeConfig.Accuracy);
            local v398 = l_math.rad(v397);

            if p382:FindFirstChild("HumanoidRootPart") then
                u61:accelerate((Vector3.new(u394, u396, v398)));
                coroutine.wrap(function() -- Line: 2672
                    -- upvalues: u61 (ref), u394 (copy), u396 (copy)
                    task.wait(0.03);
                    u61:accelerate((Vector3.new(-u394, -u396, 0)));
                end)();
            end;
        end;

        local function Flashed(u399, p400, u401, p402) -- Line: 2680
            -- upvalues: LocalPlayer (copy), workspace_CurrentCamera (ref), u53 (ref), u30 (copy), u52 (ref), random (copy), FrameworkStuff (copy), SoundService (copy), Debris (copy), ReplicatedStorage (copy), u31 (copy), u110 (ref), AffectChar (copy), l_math (copy), TweenService (copy), Lerp (copy), l_tick (copy), RunService (copy), l_pcall (copy)
            if not u399 and u399.Parent then
                return;
            end;

            if LocalPlayer.Character then
                local Humanoid = LocalPlayer.Character:FindFirstChild("Humanoid");
                local Head = LocalPlayer.Character:FindFirstChild("Head");
                LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
                local u403 = workspace_CurrentCamera.ViewportSize / 2;

                local function Check1() -- Line: 2693
                    -- upvalues: workspace_CurrentCamera (ref), u399 (copy), u403 (copy)
                    local v404, v405 = workspace_CurrentCamera:WorldToScreenPoint(u399.Position);

                    return v405, (Vector2.new(v404.X, v404.Y) - u403).Magnitude;
                end;

                local function Check2() -- Line: 2702
                    -- upvalues: u399 (copy), u53 (ref), u30 (ref), Head (copy)
                    local v406 = u399:Clone();
                    v406:ClearAllChildren();
                    local BoolValue = Instance.new("BoolValue");
                    BoolValue.Name = "CanHitT";
                    BoolValue.Parent = v406;
                    v406.CFrame = u399.CFrame;
                    v406.CanTouch = true;
                    v406.Transparency = 0.99;
                    v406.Parent = workspace.Terrain;
                    table.insert(u53, v406);
                    local v407 = {};
                    local Position = v406.CFrame.Position;
                    table.insert(v407, u30.ehdM.NewAttachment(v406, Position, 0, 0, 0, true));
                    table.insert(v407, u30.ehdM.NewAttachment(v406, Position, 0, 4, 0));
                    table.insert(v407, u30.ehdM.NewAttachment(v406, Position, 0, -4, 0));
                    table.insert(v407, u30.ehdM.NewAttachment(v406, Position, 4, 0, 0));
                    table.insert(v407, u30.ehdM.NewAttachment(v406, Position, -4, 0, 0));
                    table.insert(v407, u30.ehdM.NewAttachment(v406, Position, 0, 0, 4));
                    table.insert(v407, u30.ehdM.NewAttachment(v406, Position, 0, 0, -4));
                    table.insert(v407, u30.ehdM.NewAttachment(v406, Position, 0, 2, 0));
                    table.insert(v407, u30.ehdM.NewAttachment(v406, Position, 0, -2, 0));
                    local Part = Instance.new("Part");
                    Part.Name = "FHead2";
                    Part.Size = Vector3.new(1.2, 1, 1);
                    Part.CanCollide = false;
                    Part.CanTouch = false;
                    Part.Transparency = 1;
                    Part.CFrame = Head.CFrame;
                    Part.Parent = Head.Parent;
                    local v408 = u30.ehdM:Cast(v406, v407, Part, 12, true, true, true);
                    v406:Destroy();
                    Part:Destroy();

                    return v408;
                end;

                u52 = random();
                local _, v409 = Check1();
                local v410 = Check2();

                if not (Humanoid and Humanoid.Parent) then
                    return false;
                end;

                local v411;

                if v410 then
                    v411 = p400 >= 0.1;
                else
                    v411 = v410;
                end;

                local v412 = 1 - v409 / u403.Magnitude;

                if v411 then
                    v411 = v412 > -0.1;
                end;

                local u413 = 0;
                local v414 = 0.5;

                if v411 then
                    p400 = p400 * v412;
                else
                    u413 = p400 * 3;
                    v414 = 0.5;
                    u401 = 1;
                end;

                local u415 = FrameworkStuff.Flashbang:Clone();
                u415.Parent = FrameworkStuff.BlindSounds;
                u415.Volume = 0;
                local TweenInfo_new_ret = TweenInfo.new(0.1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
                local EqualizerSoundEffect = Instance.new("EqualizerSoundEffect");
                EqualizerSoundEffect.Priority = 15;
                EqualizerSoundEffect.HighGain = 0;
                EqualizerSoundEffect.LowGain = 0;
                EqualizerSoundEffect.MidGain = 0;
                FrameworkStuff.FlashbangEffect:Clone();
                EqualizerSoundEffect.Parent = SoundService.Main;
                local u416 = EqualizerSoundEffect:Clone();
                u416.Parent = SoundService.Radios;
                table.insert(u53, EqualizerSoundEffect);
                table.insert(u53, u416);
                Debris:AddItem(EqualizerSoundEffect, u401 + 6);
                Debris:AddItem(u416, u401 + 6);
                local ColorCorrectionEffect2 = Instance.new("ColorCorrectionEffect", workspace_CurrentCamera);
                ColorCorrectionEffect2.Name = "BlindEffect";
                Debris:AddItem(ColorCorrectionEffect2, 1);
                local _ = (p400 / 2 + 0.35) * 1;
                table.insert(u53, ColorCorrectionEffect2);
                local v417 = ReplicatedStorage.Storage.GUIs.FlashedGUI:Clone();
                local Frame = v417:WaitForChild("Frame");
                table.insert(u53, v417);
                v417.Parent = LocalPlayer.PlayerGui;
                Debris:AddItem(Frame, u401 + 5);
                local u418;

                if not v411 or u31.CharF and u31.CharF.Currents.NFLZXES or u110() then
                    u418 = nil;
                else
                    u418 = Humanoid:LoadAnimation(ReplicatedStorage.Storage.Animations.BlindAnim);
                    u418.Priority = Enum.AnimationPriority.Idle;
                    u418:Play(0.1, p400 / 2 + 0.5, 0.01);
                end;

                local u419 = AffectChar("ND", 60, "FL" .. l_math.random(), 100);
                local ColorCorrectionEffect3 = Instance.new("ColorCorrectionEffect");
                ColorCorrectionEffect3.Name = "BlindEffect";
                local BlurEffect = Instance.new("BlurEffect");
                BlurEffect.Name = "BlindEffect";
                ColorCorrectionEffect3.Brightness = 0;
                BlurEffect.Size = 0;
                Debris:AddItem(ColorCorrectionEffect3, u401 + 5);
                Debris:AddItem(BlurEffect, u401 + 5);
                ColorCorrectionEffect3.Parent = workspace_CurrentCamera;
                BlurEffect.Parent = workspace_CurrentCamera;
                table.insert(u53, ColorCorrectionEffect3);
                table.insert(u53, BlurEffect);

                if v410 then
                    TweenService:Create(BlurEffect, TweenInfo_new_ret, {
                        Size = 50 * p400 * v414
                    }):Play();
                    TweenService:Create(ColorCorrectionEffect3, TweenInfo_new_ret, {
                        Contrast = 2 * p400
                    }):Play();
                    TweenService:Create(Frame, TweenInfo_new_ret, {
                        BackgroundTransparency = Lerp(-0.25, 0.17, 1 - p400)
                    }):Play();
                end;

                u415:Play();
                TweenService:Create(u415, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    Volume = 0.35 * p400
                }):Play();
                TweenService:Create(EqualizerSoundEffect, TweenInfo_new_ret, {
                    HighGain = -90 * p400,
                    MidGain = -90 * p400,
                    LowGain = -50 * p400
                }):Play();
                TweenService:Create(u416, TweenInfo_new_ret, {
                    HighGain = -90 * p400,
                    MidGain = -90 * p400,
                    LowGain = -50 * p400
                }):Play();

                local function StopFlash(p420, u421) -- Line: 2889
                    -- upvalues: l_tick (ref), RunService (ref), Humanoid (copy), l_pcall (ref), TweenService (ref), EqualizerSoundEffect (ref), u413 (ref), u416 (ref), Frame (copy), u415 (ref), Debris (ref), u418 (ref), ColorCorrectionEffect3 (ref), BlurEffect (ref), u419 (copy), u401 (ref)
                    local v422 = l_tick();

                    repeat
                        RunService.Heartbeat:Wait();
                    until p420 <= l_tick() - v422 or (not Humanoid.Parent or Humanoid.Health <= 0);

                    l_pcall(function() -- Line: 2894
                        -- upvalues: TweenService (ref), EqualizerSoundEffect (ref), u421 (copy), u413 (ref), u416 (ref), Frame (ref)
                        TweenService:Create(EqualizerSoundEffect, TweenInfo.new(u421 * 1.7 + u413, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                            HighGain = 0,
                            LowGain = 0,
                            MidGain = 0
                        }):Play();
                        TweenService:Create(u416, TweenInfo.new(u421 * 1.7 + u413, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                            HighGain = 0,
                            LowGain = 0,
                            MidGain = 0
                        }):Play();
                        TweenService:Create(Frame, TweenInfo.new(u421 * 1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                            BackgroundTransparency = 1
                        }):Play();
                    end);

                    if u415 and u415.Parent then
                        TweenService:Create(u415, TweenInfo.new(u421 * 2 + u413, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                            Volume = 0
                        }):Play();
                        Debris:AddItem(u415, u421 * 2 + u413 + 0.5);
                    end;

                    if u418 then
                        u418:Stop(u421 * 1.25);
                    end;

                    if ColorCorrectionEffect3 and ColorCorrectionEffect3.Parent then
                        TweenService:Create(ColorCorrectionEffect3, TweenInfo.new(u421, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                            Brightness = 0,
                            Contrast = 0
                        }):Play();
                    end;

                    if BlurEffect and BlurEffect.Parent then
                        TweenService:Create(BlurEffect, TweenInfo.new(u421 * 1.5 + u413, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                            Size = 0
                        }):Play();
                    end;

                    if u419 and u419.Parent then
                        TweenService:Create(u419, TweenInfo.new(u421 * 1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                            Value = 0
                        }):Play();
                        task.delay(u421, function() -- Line: 2923
                            -- upvalues: u419 (ref)
                            u419:Destroy();
                        end);
                    end;

                    u401 = nil;
                    EqualizerSoundEffect = nil;
                    u416 = nil;
                    u415 = nil;
                    u418 = nil;
                    ColorCorrectionEffect3 = nil;
                    BlurEffect = nil;
                end;

                coroutine.wrap(function() -- Line: 2937
                    -- upvalues: StopFlash (copy), u401 (ref)
                    StopFlash(u401 * 0.25, u401 * 0.75);
                end)();

                if v411 then
                    return p402:FireServer(true);
                end;

                return false;
            end;
        end;

        local function ShellShock(p423, u424, p425, p426, p427, p428, p429, p430) -- Line: 2950
            -- upvalues: LocalPlayer (copy), l_math (copy), l_tick (copy), RunService (copy), l_pcall (copy), TweenService (copy), Debris (copy), AffectChar (copy), FrameworkStuff (copy), random (copy), SoundService (copy), u53 (ref), workspace_CurrentCamera (ref), l_spawn (copy)
            if LocalPlayer.Character then
                local v431 = p425 or 1;
                local v432 = p428 or 1;
                local v433 = p429 or 1;
                local v434 = p430 or 1;
                local v435 = l_math.max(v431 / 2, 1);
                local Humanoid = LocalPlayer.Character:FindFirstChild("Humanoid");

                local function StopShock(p436, u437, u438, p439, p440, p441, p442) -- Line: 2964
                    -- upvalues: l_tick (ref), RunService (ref), Humanoid (copy), l_pcall (ref), TweenService (ref), Debris (ref)
                    local v443 = l_tick();

                    repeat
                        RunService.Heartbeat:Wait();
                    until p436 <= l_tick() - v443 or (not Humanoid.Parent or Humanoid.Health <= 0);

                    l_pcall(function() -- Line: 2970
                        -- upvalues: TweenService (ref), u437 (ref), u438 (ref)
                        TweenService:Create(u437, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                            HighGain = 0,
                            LowGain = 0,
                            MidGain = 0
                        }):Play();
                        TweenService:Create(u438, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                            HighGain = 0,
                            LowGain = 0,
                            MidGain = 0
                        }):Play();
                    end);

                    if p439 and p439.Parent then
                        TweenService:Create(p439, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                            Volume = 0
                        }):Play();
                        Debris:AddItem(p439, 1.5);
                    end;

                    if p440 and p440.Parent then
                        TweenService:Create(p440, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Value = 0
                        }):Play();
                    end;

                    if p441 and p441.Parent then
                        TweenService:Create(p441, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Size = 0
                        }):Play();
                    end;

                    if p442 and p442.Parent then
                        TweenService:Create(p442, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            FarIntensity = 0,
                            FocusDistance = 0,
                            InFocusRadius = 500,
                            NearIntensity = 0
                        }):Play();
                    end;

                    u437 = nil;
                    u438 = nil;
                end;

                if Humanoid and Humanoid.Parent then
                    AffectChar("ND", u424, "SS" .. l_math.random(), 30);
                    local u444 = FrameworkStuff.ShellShocks:GetChildren()[random(1, #FrameworkStuff.ShellShocks:GetChildren())]:Clone();
                    u444.Parent = FrameworkStuff.BlindSounds;
                    u444.Volume = 0.55 * p423 * v435;
                    u444:Play();
                    local u445 = FrameworkStuff.ShellShockEffect:Clone();
                    u445.Parent = SoundService.Main;
                    local v446 = u445.HighGain * p423 * v431 * v432;
                    local v447 = u445.HighGain * p423 * v431 * v432;
                    local v448 = u445.HighGain * p423 * v432;
                    u445.HighGain = 0;
                    u445.MidGain = 0;
                    u445.LowGain = 0;
                    table.insert(u53, u445);
                    local u449 = u445:Clone();
                    u449.Parent = SoundService.Radios;
                    table.insert(u53, u449);
                    Debris:AddItem(u445, u424 + 1);
                    Debris:AddItem(u449, u424 + 1);
                    TweenService:Create(u445, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        HighGain = v446,
                        MidGain = v447,
                        LowGain = v448
                    }):Play();
                    TweenService:Create(u449, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        HighGain = v446,
                        MidGain = v447,
                        LowGain = v448
                    }):Play();
                    local v450 = p426 or 0;
                    local u451;

                    if p427 then
                        u451 = nil;
                    else
                        u451 = AffectChar("SD", u424 * v434, "Shocked", (3 + v450) * p423);
                        local v452 = AffectChar("AJ", u424 * v434);
                        Debris:AddItem(v452, 5);
                        AffectChar("AS", u424 * v434);
                        Debris:AddItem(v452, 5);
                    end;

                    Humanoid.NameDisplayDistance = 0;
                    Humanoid.HealthDisplayDistance = 0;
                    local BlurEffect = Instance.new("BlurEffect");
                    local DepthOfFieldEffect = Instance.new("DepthOfFieldEffect");
                    DepthOfFieldEffect.FarIntensity = 0;
                    DepthOfFieldEffect.FocusDistance = 0;
                    DepthOfFieldEffect.InFocusRadius = 0;
                    DepthOfFieldEffect.NearIntensity = 0;
                    BlurEffect.Name = "BlindEffect";
                    DepthOfFieldEffect.Name = "BlindEffect";
                    local v453 = 10 * p423 * v431;
                    local v454 = l_math.max((20 - 10 * p423 * v431) / v433, 0);
                    BlurEffect.Size = v453 * 2.5;
                    BlurEffect.Parent = workspace_CurrentCamera;
                    DepthOfFieldEffect.Parent = workspace_CurrentCamera;
                    TweenService:Create(BlurEffect, TweenInfo.new(u424 / 1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        Size = v453
                    }):Play();
                    TweenService:Create(DepthOfFieldEffect, TweenInfo.new(u424 / 1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        FocusDistance = 10,
                        FarIntensity = 1 * v433,
                        InFocusRadius = v454,
                        NearIntensity = 1 * v433
                    }):Play();
                    Debris:AddItem(BlurEffect, u424 + 3);
                    Debris:AddItem(DepthOfFieldEffect, u424 + 3);
                    table.insert(u53, BlurEffect);
                    table.insert(u53, DepthOfFieldEffect);
                    l_spawn(function() -- Line: 3075
                        -- upvalues: StopShock (copy), u424 (copy), u445 (copy), u449 (copy), u444 (copy), u451 (ref), BlurEffect (copy), DepthOfFieldEffect (copy)
                        StopShock(u424, u445, u449, u444, u451, BlurEffect, DepthOfFieldEffect);
                    end);
                end;

                return false;
            end;
        end;

        local function StunEffect(p455, p456, p457) -- Line: 3082
            -- upvalues: l_math (copy), TweenService (copy)
            local v458 = p456 - p457;
            local _G_AffectChar_ret = _G.AffectChar("MS", l_math.huge, l_math.random(), p455);
            game.Debris:AddItem(_G_AffectChar_ret, p457 + v458);
            task.wait(v458);

            if _G_AffectChar_ret and _G_AffectChar_ret.Parent then
                game.Debris:AddItem(_G_AffectChar_ret, p457);
                TweenService:Create(_G_AffectChar_ret, TweenInfo.new(p457, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                    Value = 1
                }):Play();
            end;
        end;

        local function StunGrenaded(u459, u460) -- Line: 3093
            -- upvalues: ShellShock (copy), Lerp (copy), StunEffect (copy)
            coroutine.wrap(function() -- Line: 3094
                -- upvalues: ShellShock (ref), u459 (copy), u460 (copy)
                ShellShock(u459, u460, 1.5, 3);
            end)();
            StunEffect(Lerp(0.1, 0.25, 1 - u459), u460, 1);
        end;

        local function TearGas(u461) -- Line: 3103
            -- upvalues: u31 (copy), l_tick (copy), workspace_CurrentCamera (ref), AffectChar (copy), l_math (copy), u53 (ref), l_pcall (copy), random (copy), TweenService (copy), S_Get (copy), S_Take (copy), Debris (copy)
            u31.gasTime = l_tick();

            if u31.gassed then
                return;
            end;

            u31.gassed = true;
            local BlurEffect = Instance.new("BlurEffect");
            BlurEffect.Name = "TEGA_Effect";
            BlurEffect.Parent = workspace_CurrentCamera;
            BlurEffect.Size = 0;
            local u462 = AffectChar("ND", l_math.huge, "TG" .. l_math.random(), 15);
            table.insert(u53, BlurEffect);
            local u463 = nil;
            coroutine.wrap(function() -- Line: 3118
                -- upvalues: l_pcall (ref), u463 (ref), random (ref), TweenService (ref), BlurEffect (copy), u31 (ref), S_Get (ref), S_Take (ref), l_tick (ref), u461 (copy), Debris (ref), u462 (copy)
                while true do
                    task.wait();
                    l_pcall(function() -- Line: 3120
                        -- upvalues: u463 (ref)
                        u463:Cancel();
                    end);
                    local v464 = random(200, 400) / 10;
                    u463 = TweenService:Create(BlurEffect, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                        Size = v464
                    });
                    u463:Play();

                    if u31.CharF and (u31.CharF.Humanoid and (not u31.CharF.Humanoid:GetAttribute("NoGasStun") and S_Get() > 16)) then
                        S_Take(0.5);
                    end;

                    if u461 <= l_tick() - u31.gasTime or not (BlurEffect and (BlurEffect.Parent and u31.gassed)) then
                        if BlurEffect and BlurEffect.Parent then
                            l_pcall(function() -- Line: 3133
                                -- upvalues: u463 (ref)
                                u463:Cancel();
                            end);
                            u463 = TweenService:Create(BlurEffect, TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                                Size = 0
                            });
                            u463:Play();
                            Debris:AddItem(BlurEffect, 4);
                        end;

                        u31.gassed = false;

                        if u462 and u462.Parent then
                            u462:Destroy();
                        end;

                        return;
                    end;
                end;
            end)();
        end;

        local function MonitorExplosionSound(u465, p466, u467, u468, p469, p470, u471) -- Line: 3146
            -- upvalues: l_pcall (copy), u56 (copy), u31 (copy), LocalPlayer (copy), workspace_CurrentCamera (ref), l_math (copy)
            local u472 = p469 or 1;
            local u473 = p470 or 1;
            local v482, _ = l_pcall(function() -- Line: 3150
                -- upvalues: u465 (copy), u56 (ref), u31 (ref), LocalPlayer (ref), workspace_CurrentCamera (ref), u467 (ref), l_math (ref), u468 (ref), u473 (ref), u472 (ref), u471 (copy)
                local v474;

                if u465 and u465.Parent then
                    v474 = u465.Parent:IsA("Attachment");

                    if v474 or u465.Parent:IsA("BasePart") then
                        u56[u465][7] = u465.Parent;
                    end;
                else
                    v474 = false;
                end;

                local v475 = u56[u465][7];

                if v475 ~= nil then
                    local v476;

                    if u31.CharF.Humanoid and (u31.CharF.Humanoid.Parent and (u31.CharF.Humanoid:GetState() ~= Enum.HumanoidStateType.Dead and (u31.CharF.Torso and u31.CharF.Torso.Parent))) then
                        v476 = LocalPlayer.Character.Torso.CFrame.Position;
                    else
                        v476 = workspace_CurrentCamera.CFrame.Position;
                    end;

                    local v477 = v474 and v475.WorldPosition or v475.Position;
                    u467 = u467 or 1;
                    u467 = u467 / 3.5;
                    u467 = l_math.max(u467, 1);
                    u468 = u468 or 1;
                    local v478 = u465.EmitterSize * u467;
                    local Magnitude = (v476 - v477).Magnitude;
                    local v479 = l_math.clamp(1 - Magnitude / v478, 0, 1);
                    local v480 = l_math.max(v479, 0);
                    local v481 = l_math.max(1 - Magnitude / v478, 0);
                    u31.Amt = u31.Amt + u465.PlaybackLoudness * 0.0002 * u468 * v480 * u473;
                    u31.Amt2 = u31.Amt2 + u465.PlaybackLoudness * 0.02 * u468 * v481 * u472;

                    if u471 then
                        u31.Amt3 = u31.Amt3 + u465.PlaybackLoudness * 0.0001 * u468 * v480 * u471;
                    end;
                end;
            end);
            local _ = v482 == false;
        end;

        function u31.LtStep(p483, p484) -- Line: 3236
            -- upvalues: u31 (copy), l_math (copy), Lerp (copy)
            local LtEase = u31.LtEase;
            local v485;

            if u31.SetFogValue == nil then
                v485 = false;
            else
                v485 = u31.SetFogValue ~= 0;
            end;

            local v486;

            if u31.SetHazeValue == nil then
                v486 = false;
            else
                v486 = u31.SetHazeValue ~= 0;
            end;

            local v487 = u31.AmbientMulti or 1;
            local v488 = u31.BrightnessMulti or 1;

            if not LtEase then
                LtEase = {
                    C = p484,
                    A = v487,
                    B = v488,
                    F = v485 and 1 or 0,
                    H = v486 and 1 or 0,
                    FV = v485 and u31.SetFogValue or 0,
                    HV = v486 and u31.SetHazeValue or 0
                };
                u31.LtEase = LtEase;
            end;

            local v489 = l_math.clamp(p483 or 0, 0, 0.1);
            local v490 = l_math.min(v489 * 4.5, 1);

            if v485 then
                LtEase.FV = LtEase.F > 0 and Lerp(LtEase.FV, u31.SetFogValue, v490) or u31.SetFogValue;
                LtEase.F = l_math.min(LtEase.F + v489 / 1.8, 1);
            else
                LtEase.F = l_math.max(LtEase.F - v489 / 0.9, 0);
            end;

            if v486 then
                LtEase.HV = LtEase.H > 0 and Lerp(LtEase.HV, u31.SetHazeValue, v490) or u31.SetHazeValue;
                LtEase.H = l_math.min(LtEase.H + v489 / 1.8, 1);
            else
                LtEase.H = l_math.max(LtEase.H - v489 / 0.9, 0);
            end;

            local v491 = l_math.max(LtEase.F, LtEase.H);
            local v492 = v490 * l_math.max(1 - v491 * v491, 0.25);
            LtEase.A = l_math.abs(v487 - LtEase.A) < 0.002 and v487 and v487 or Lerp(LtEase.A, v487, LtEase.A < v487 and v492 and v492 or v490);
            local v493;

            if l_math.abs(v488 - LtEase.B) < 0.002 and v488 then
                v493 = v488;
            else
                if LtEase.B < v488 then
                    v490 = v492 or v490;
                end;

                v493 = Lerp(LtEase.B, v488, v490);
            end;

            LtEase.B = v493;

            if LtEase.C ~= p484 and (LtEase.A - 0.04 < v487 and LtEase.B - 0.04 < v488) then
                LtEase.C = p484;
            end;

            return LtEase.C;
        end;

        local function RUN_BIND1(p494) -- Line: 3269
            -- upvalues: u31 (copy), u62 (ref), ColorCorrectionEffect (copy), GVF (copy), l_pcall (copy), workspace_CurrentCamera (ref), l_math (copy), u56 (copy), MonitorExplosionSound (copy), random (copy), rad (copy), u67 (ref), S_Get (copy), u51 (ref), Lerp (copy), u47 (copy), u50 (ref), u30 (copy), u61 (copy), underGroundCheck (copy), DefaultReverbType (ref), ServerTick (copy), StartClockTick (copy), u48 (copy), u110 (ref), u45 (ref), Audio (copy), SoundService (copy), LocalPlayer (copy), l_tick (copy), ReplicatedStorage (copy), u33 (ref)
            debug.profilebegin("RUN_BIND1-RenderStepped");
            u31.Amt = 0;
            u31.Amt2 = 0;
            u31.Amt3 = 0;

            if not u62 then
                return;
            end;

            local Value = u31.TweenValue1.Value;

            if Value ~= u31.TweenValue1_BN then
                u31.TweenValue1_BN = Value;
                ColorCorrectionEffect.Brightness = Value;
            end;

            local Value2 = u31.TweenValue3.Value;

            if Value2 ~= u31.TweenValue3_BN then
                u31.TweenValue3_BN = Value2;
                ColorCorrectionEffect.Contrast = Value2;
            end;

            local u495 = 0;
            local u496 = GVF();

            if u496 and u496.Parent then
                local u497 = 70;
                l_pcall(function() -- Line: 3295
                    -- upvalues: workspace_CurrentCamera (ref), u31 (ref), u496 (copy), u497 (ref), u495 (ref)
                    if _G.PVEye_FOV then
                        workspace_CurrentCamera.FieldOfView = _G.PVEye_FOV;
                        u31.FOV = _G.PVEye_FOV;

                        return;
                    end;

                    for _, child in pairs(u496.FOVs:GetChildren()) do
                        u497 = u497 + child.Value;

                        if child:GetAttribute("ADS_FOV") then
                            u495 = u495 + child.value;
                        end;
                    end;

                    if u497 ~= u31.FOV then
                        u31.FOV = u497;
                        workspace_CurrentCamera.FieldOfView = u497;
                    end;
                end);
            end;

            u31.ADS_FOV = u495;
            local v498 = l_math.clamp(workspace_CurrentCamera.FieldOfView, 1, 120);
            local v499 = l_math.clamp(v498 - u495, 1, 120);
            local l__G = _G;
            local v500 = l_math.rad(v498 * 0.5);
            local v501 = l_math.tan(v500);
            local v502 = l_math.rad(v499 * 0.5);
            l__G.GamepadZoomScale = v501 / l_math.tan(v502);

            for _, v in pairs(u56) do
                MonitorExplosionSound(v[1], v[2], v[3], v[4], v[5], v[6], v[8]);
            end;

            if not _G.PVEye_Active then
                local v503 = workspace_CurrentCamera.CFrame * CFrame.Angles(0, 0, (rad(random(-u31.TweenValue2.Value, u31.TweenValue2.Value) * 0.01)));
                local v504 = rad((random(-u31.TweenValue2.Value, u31.TweenValue2.Value)));
                local v505 = rad((random(-u31.TweenValue2.Value, u31.TweenValue2.Value)));
                local v506 = rad((random(-u31.TweenValue2.Value, u31.TweenValue2.Value)));
                workspace_CurrentCamera.CFrame = v503 + Vector3.new(v504, v505, v506);
            end;

            if u67.CameraBobbing and not _G.PVEye_Active then
                local v507, v508 = S_Get();

                if u51 and (u51.Parent and (u51.Health > 0 and (u496 and (u496.Parent and u51.MoveDirection:Dot(u51.MoveDirection) > 0)))) or v507 / v508 < 0.5 then
                    local v509 = 0;
                    local v510 = 0;
                    local u511, v512;

                    if u51.MoveDirection:Dot(u51.MoveDirection) > 0 then
                        u511 = v509 + l_math.min(u51.WalkSpeed, 35) / 15;
                        v512 = v510 + l_math.min(u51.WalkSpeed, 45) / 2;
                        l_pcall(function() -- Line: 3343
                            -- upvalues: u496 (copy), u511 (ref)
                            if u496.Crouching.Value then
                                u511 = u511 * 1.5;
                            end;
                        end);

                        if not _G.FP then
                            u511 = u511 / 1.5;
                        end;
                    else
                        local v513 = 1 - Lerp(0, 1, v507 / v508);
                        u511 = v509 + v513 * 0.5;
                        v512 = v510 + v513 * 3;
                    end;

                    if v512 > 0 or u511 > 0 then
                        u47:Update((Vector3.new(1, v512, u511)));
                    end;
                elseif u47.Value.Y > 0 or u47.Value.Z > 0 then
                    u47:Update((Vector3.new(0, u47.Value.Y, u47.Value.Z)));
                end;

                local Y = u47.Value.Y;
                local _ = u47.Value.Z * u47.Value.X * l_math.sin(u50);
                local CFrame_new_ret = CFrame.new();

                if u31.CharF.Humanoid and (u31.CharF.Root and (u31.CharF.Humanoid.Parent and u31.CharF.Root.Parent)) then
                    CFrame_new_ret = u30.vBob.Movement(p494, u31.CharF.Humanoid, u31.CharF.Root, u31.vB_S.CamModX, u31.vB_S.CamModY, u31.vB_S.CamModZ, u31.vB_S.CameraSpeedX, u31.vB_S.CameraSpeedY, u31.vB_S.CameraSpeedZ, u31.vB_S.x, u31.vB_S.y, u31.vB_S.CamSpeed);
                end;

                workspace_CurrentCamera.CoordinateFrame = workspace_CurrentCamera.CoordinateFrame * CFrame_new_ret;
                u50 = u50 + p494 * Y;
                local CFrame_new_ret2 = CFrame.new();
                local _G_camShakePart = _G.camShakePart;

                if _G.FP and (u31.CharF.State ~= Enum.HumanoidStateType.Swimming and (u31.CharF.Humanoid and (u31.CharF.Humanoid.Health > 0 and (u31.CharF.Head and (_G_camShakePart and _G_camShakePart.Parent))))) then
                    local Motor6D = _G_camShakePart:FindFirstChild("Motor6D");
                    local v514;

                    if Motor6D and u31.LastShakeTransform then
                        local v515 = l_math.rad(_G_camShakePart.Orientation.Z);
                        local v516 = l_math.rad(u31.CharF.Root.Orientation.Z);
                        v514 = Motor6D.Transform:Lerp(CFrame.new(), 0.5);
                        CFrame_new_ret2 = v514 * u31.LastShakeTransform:Inverse() * CFrame.Angles(0, 0, v516 - v515 * 0.5);
                    else
                        v514 = nil;
                    end;

                    u31.LastShakeTransform = v514 or Motor6D.Transform;
                    _G.CamShakeCFrameOffset1 = CFrame_new_ret2;
                    local v517 = workspace_CurrentCamera;
                    v517.CoordinateFrame = v517.CoordinateFrame * CFrame_new_ret2;
                else
                    _G.CamShakeCFrameOffset1 = CFrame.new();
                end;
            elseif _G.PVEye_Active then
                _G.CamShakeCFrameOffset1 = CFrame.new();
            end;

            if l_math.abs(u61.p.x) > 0 or (l_math.abs(u61.p.y) > 0 or l_math.abs(u61.p.z) > 0) then
                workspace_CurrentCamera.CoordinateFrame = workspace_CurrentCamera.CoordinateFrame * CFrame.Angles(u61.p.x * p494 * u31.pfps, u61.p.y * p494 * u31.pfps, u61.p.z * p494 * u31.pfps);
            end;

            local DayLength = u31.DayLength;
            local NightLength = u31.NightLength;
            local v518 = underGroundCheck(workspace_CurrentCamera.CFrame.Position, 1);
            local v519 = underGroundCheck(workspace_CurrentCamera.CFrame.Position, 2);
            local v520 = (ServerTick.Value - StartClockTick.Value) / 60 % (DayLength + NightLength);
            local v521;

            if v520 < DayLength then
                v521 = 6 + 12 * v520 / DayLength;
            else
                v521 = (18 + 12 * (v520 - DayLength) / NightLength) % 24;
            end;

            if u31.TimeState_Enabled then
                v521 = u31.TimeState_Value;
            end;

            if v521 >= 23.9 or v521 <= 0.05 then
                u48.Value = Vector3.new(v521, 0, 0);
            else
                u48:Update((Vector3.new(v521, 0, 0)));
            end;

            DefaultReverbType = u67.DefaultReverbType;

            if not _G.NoSGReverbChange then
                if u31.CharF.Char then
                    local Humanoid = u31.CharF.Humanoid;

                    if Humanoid.Health > 0 then
                        if Humanoid.Health > 15 and not u110() then
                            if v519 then
                                DefaultReverbType = Enum.ReverbType.SewerPipe;
                                u45 = 0.5;
                                Audio.CityAmbience.Playing = false;
                                Audio.SewerAmbience.Playing = true;
                                Audio.UndergroundAmbience.Playing = false;
                            elseif v518 then
                                u45 = 0.65;
                                DefaultReverbType = Enum.ReverbType.Quarry;
                                Audio.CityAmbience.Playing = false;
                                Audio.SewerAmbience.Playing = false;
                                Audio.UndergroundAmbience.Playing = true;
                            else
                                u45 = 1;
                                DefaultReverbType = u67.DefaultReverbType;

                                if u31.LOutage then
                                    Audio.CityAmbience.Playing = false;
                                    Audio.SewerAmbience.Playing = false;
                                    Audio.UndergroundAmbience.Playing = true;
                                else
                                    Audio.CityAmbience.Playing = true;
                                    Audio.SewerAmbience.Playing = false;
                                    Audio.UndergroundAmbience.Playing = false;
                                end;
                            end;
                        else
                            u45 = 0.5;
                            DefaultReverbType = Enum.ReverbType.UnderWater;
                        end;
                    else
                        u45 = 0.5;
                        DefaultReverbType = Enum.ReverbType.UnderWater;
                    end;
                end;

                SoundService.AmbientReverb = DefaultReverbType;
                u31.sG.Volume = u45;
            end;

            local function v524(p522) -- Line: 3503
                -- upvalues: l_math (ref)
                local v523 = l_math.abs(12 - p522) / 12 - 1;

                return l_math.abs(v523);
            end;

            local ClockTime = game.Lighting.ClockTime;

            if u31.FakeClockTime_Enabled then
                ClockTime = u31.TimeState_Value;
            end;

            local v525 = v524(ClockTime);
            local v526 = _G.Y8OTOP and 0 or v525;
            local v527 = u31.LightingConfig.Night.Ambient:Lerp(u31.LightingConfig.Day.Ambient, v526);
            local v528 = u31.LightingConfig.Night.OutdoorAmbient:Lerp(u31.LightingConfig.Day.OutdoorAmbient, v526);
            local v529 = Lerp(u31.LightingConfig.Night.Brightness, u31.LightingConfig.Day.Brightness, v526);
            local v530;

            if u31.LightingConfig.Day.ColorShift_Top then
                v530 = u31.LightingConfig.Day.ColorShift_Top:Lerp(u31.LightingConfig.Night.ColorShift_Top, 1 - v526 / 1);
            else
                v530 = nil;
            end;

            local v531, v532, v533;

            if typeof(u31.LightingConfig.Day.Atmo) == "Color3" then
                local v534 = u31.LightingConfig.Day.Atmo:Lerp(u31.LightingConfig.Night.Atmo, 1 - v526 / 1);
                v531 = v534.R;
                v532 = v534.G;
                v533 = v534.B;
            else
                local v535 = Lerp(u31.LightingConfig.Night.Atmo, u31.LightingConfig.Day.Atmo, v526);
                local v536 = l_math.max(v535, 0);
                v531 = l_math.max(v536, u31.LightingConfig.MinAtmo or 0.02);
                v532 = l_math.max(v536, u31.LightingConfig.MinAtmo or 0.02);
                v533 = l_math.max(v536, u31.LightingConfig.MinAtmo or 0.02);
            end;

            local v537, v538, v539;

            if typeof(u31.LightingConfig.Day.Decay) == "Color3" then
                local v540 = u31.LightingConfig.Day.Decay:Lerp(u31.LightingConfig.Night.Decay, 1 - v526 / 1);
                v537 = v540.R;
                v538 = v540.G;
                v539 = v540.B;
            else
                local v541 = Lerp(u31.LightingConfig.Night.Decay, u31.LightingConfig.Day.Decay, v526);
                v537 = l_math.max(v541, 0);
                v538 = v537;
                v539 = v538;
                local v542 = v538;
                v538 = v539;
                v542 = v539;
            end;

            local v543 = Lerp(u31.LightingConfig.Night.Haze, u31.LightingConfig.Day.Haze, v526);
            local v544 = l_math.max(v543, 0);
            local v545 = _G._ATMO and _G._ATMO.Glare;

            if u31.LightingConfig.Night.Glare and u31.LightingConfig.Day.Glare then
                local v546 = Lerp(u31.LightingConfig.Night.Glare, u31.LightingConfig.Day.Glare, v526);
                v545 = l_math.max(v546, 0);
            end;

            local v547 = Lerp(u31.LightingConfig.Night.Density, u31.LightingConfig.Day.Density, v526);
            local v548 = u31.LtStep(p494, u48.Value.X);

            if v519 and not _G.IgnoreUndergroundCheck then
                v527 = u31.LightingConfig.underGround2.ambient or v527;
                v528 = u31.LightingConfig.underGround2.outdoorAmbient or v528;
                v547 = u31.LightingConfig.underGround2.denseNum or v547;
                v544 = u31.LightingConfig.underGround2.hazeNum or v544;
                v548 = u31.LightingConfig.underGround2.timeNum or v548;
                v529 = u31.LightingConfig.underGround2.brightNum or v529;

                if typeof(u31.LightingConfig.underGround2.atmo) == "Color3" then
                    local atmo = u31.LightingConfig.underGround2.atmo;

                    if atmo then
                        v531 = atmo.R;
                        v532 = atmo.G;
                        v533 = atmo.B;
                    end;
                else
                    v532 = u31.LightingConfig.underGround2.atmo or v531;
                    v533 = v532;
                    v531 = v533;
                    local v549 = v533;
                    v533 = v531;
                    v549 = v531;
                end;

                if typeof(u31.LightingConfig.underGround2.Decay) == "Color3" then
                    local decay = u31.LightingConfig.underGround2.decay;

                    if decay then
                        v537 = decay.R;
                        v538 = decay.G;
                        v539 = decay.B;
                    end;
                else
                    v537 = u31.LightingConfig.underGround2.atmo or v537;
                    v538 = v537;
                    v539 = v538;
                    local v550 = v538;
                    v538 = v539;
                    v550 = v539;
                end;
            elseif v518 and not _G.IgnoreUndergroundCheck then
                v527 = u31.LightingConfig.underGround1.ambient or v527;
                v528 = u31.LightingConfig.underGround2.outdoorAmbient or v528;
                v547 = u31.LightingConfig.underGround1.denseNum or v547;
                v544 = u31.LightingConfig.underGround1.hazeNum or v544;
                v548 = u31.LightingConfig.underGround1.timeNum or v548;
                v529 = u31.LightingConfig.underGround1.brightNum or v529;

                if typeof(u31.LightingConfig.underGround1.atmo) == "Color3" then
                    local atmo = u31.LightingConfig.underGround1.atmo;

                    if atmo then
                        v531 = atmo.R;
                        v532 = atmo.G;
                        v533 = atmo.B;
                    end;
                else
                    v532 = u31.LightingConfig.underGround1.atmo or v531;
                    v533 = v532;
                    v531 = v533;
                    local v551 = v533;
                    v533 = v531;
                    v551 = v531;
                end;

                if typeof(u31.LightingConfig.underGround1.decay) == "Color3" then
                    local decay = u31.LightingConfig.underGround1.decay;

                    if decay then
                        v537 = decay.R;
                        v538 = decay.G;
                        v539 = decay.B;
                    end;
                else
                    v537 = u31.LightingConfig.underGround1.atmo or v537;
                    v538 = v537;
                    v539 = v538;
                    local v552 = v538;
                    v538 = v539;
                    v552 = v539;
                end;
            end;

            local v553 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
            local v554 = not v553 or underGroundCheck(v553.Position, 2);
            local v555 = not v553 or underGroundCheck(v553.Position, 1);

            if u31.UndergroundMains.Model then
                if v554 then
                    u31.UndergroundMains.LGU = l_tick();

                    if not u31.UndergroundMains.Active then
                        u31.UndergroundMains.Active = true;
                        u31.UndergroundMains.Model.Parent = workspace.Map.Parts;
                    end;
                elseif u31.UndergroundMains.Active and l_tick() - u31.UndergroundMains.LGU > 3 then
                    u31.UndergroundMains.Active = false;
                    u31.UndergroundMains.Model.Parent = ReplicatedStorage;
                end;
            end;

            if u31.SubwayMains.Model then
                if v555 then
                    u31.SubwayMains.LGU = l_tick();

                    if not u31.SubwayMains.Active then
                        u31.SubwayMains.Active = true;
                        u31.SubwayMains.Model.Parent = workspace.Map.Parts;
                    end;
                elseif u31.SubwayMains.Active and l_tick() - u31.SubwayMains.LGU > 3 then
                    u31.SubwayMains.Active = false;
                    u31.SubwayMains.Model.Parent = ReplicatedStorage;
                end;
            end;

            if u31.LtEase.F > 0 then
                v547 = Lerp(v547, u31.LtEase.FV, u31.LtEase.F ^ 2);
            end;

            local v556 = v547 + u31.FogAddValue;

            if u31.LtEase.H > 0 then
                v544 = Lerp(v544, u31.LtEase.HV, u31.LtEase.H ^ 2);
            end;

            if u33 and u33.Parent then
                v556 = u31.CharF.Currents.NFXOG and 0 or v556;

                if u31.CharF.Currents.NNNVG then
                    v527 = Color3.fromRGB(200, 200, 200);
                    v532 = 1;
                    v529 = 2;
                    v531 = 0;
                    v533 = 0;
                end;

                if u31.CharF.Currents.CC_DenseAdd then
                    for _, v in pairs(u31.CharF.Currents.CC_DenseAdd) do
                        v556 = v556 + v.Value;
                    end;
                end;
            end;

            local v557;

            if _G.Y8OTOP then
                v557 = Color3.fromRGB(75, 75, 75);
                v556 = v556 / 2;
                v548 = 0;
            else
                local A = u31.LtEase.A;
                local B = u31.LtEase.B;

                if u31.DeviceType == 3 then
                    A = A * 1.5;
                    B = B * 1.5;
                end;

                v557 = Color3.new(v527.R * A, v527.G * A, v527.B * A);
                v528 = Color3.new(v528.R * A, v528.G * A, v528.B * A);
                v529 = v529 * B;
            end;

            if u62 then
                game.Lighting.Ambient = v557;

                if u31.FakeClockTime_Enabled then
                    v548 = u31.FakeClockTime_Value or v548;
                end;

                game.Lighting.ClockTime = v548;
                game.Lighting.OutdoorAmbient = v528;
                game.Lighting.Brightness = v529;

                if v530 then
                    game.Lighting.ColorShift_Top = v530;
                end;

                local Atmosphere = game.Lighting:FindFirstChild("Atmosphere");

                if Atmosphere then
                    _G._ATMO = Atmosphere;
                    local Color3_new_ret = Color3.new(v531, v532, v533);
                    local Color3_new_ret2 = Color3.new(v537, v538, v539);
                    Atmosphere.Color = Color3_new_ret;
                    Atmosphere.Decay = Color3_new_ret2;
                    Atmosphere.Density = v556;
                    Atmosphere.Haze = v544;

                    if v545 then
                        Atmosphere.Glare = v545;
                    end;
                end;
            end;

            debug.profileend();
        end;

        local function CleanUp() -- Line: 3812
            -- upvalues: u52 (ref), FrameworkStuff (copy), u31 (copy), u53 (ref), Destroy (copy)
            u52 = 0;
            FrameworkStuff.BlindSounds:ClearAllChildren();
            u31.gassed = false;
            u31.gasTime = 0;

            for _, v in pairs(u53) do
                Destroy(v);
            end;

            for _, v in pairs(_G.EffectsList) do
                Destroy(v);
            end;

            u31.ll_Brk = false;
            u31.rl_Brk = false;
            u53 = {};
            _G.EffectsList = {};
            u31.ACCL = nil;
            u31.M_CharStats = nil;

            if _G.Y8OTOP and _G.GetUbra then
                require(_G.GetUbra).T(false);
            end;
        end;

        local function CharAdded(u558) -- Line: 3841
            -- upvalues: u62 (ref), LocalPlayer (copy), u31 (copy), workspace_CurrentCamera (ref), SetCoreGuiEnabled (copy), u34 (ref), l_pcall (copy), u30 (copy), ReplicatedStorage (copy), u43 (ref), game_StarterPlayer (copy), UserInputService (copy), u54 (ref), CleanUp (copy), Mouse (copy), Filter (copy), u65 (ref), DeepCopy (copy), u69 (copy), CheckInputType (ref), Upt_S (copy), u55 (ref), WaitForChar (copy), u67 (ref), u51 (ref), FrameworkStuff (copy), l_tick (copy), GVF (copy), u32 (copy), u33 (ref), u75 (ref), S_Get (copy), NumberValue3 (copy), PhysicsService (copy), TurnEffect (copy), u29 (ref), Destroy (copy), cTag (copy), u44 (ref), DefaultReverbType (ref), u45 (ref), TweenService (copy), u59 (ref), u60 (ref), u37 (ref), u41 (ref), u39 (ref), u40 (ref), u35 (ref), u38 (ref), ResetAllow (copy), random (copy), l_time (copy), AffectChar (copy), l_math (copy), u53 (ref), Disconnect (copy), DoTweak (copy), u64 (copy), RunService (copy), u49 (copy), NumberValue (copy), u110 (ref), ForceChar (copy), CheckWater (copy), u116 (ref), Events (copy), S_Take (copy), GetWaterCurrent (copy), u68 (ref), ShellShock (copy), u42 (ref), LimbCheck (copy), CheckIfFlinching (copy), Debris (copy), UISounds (copy), Events2 (copy), l_spawn (copy), Map (copy), GetModelMass (copy), CantS (copy), DamageHitEffect (copy), HSRGEE (copy), SprintTing (copy), NumberValue4 (copy), InCombatCheck (copy)
            _G.IsAlive = false;

            if not u62 then
                repeat
                    task.wait(0.15);
                until u62 or u558 ~= LocalPlayer.Character;
            end;

            if u558 ~= LocalPlayer.Character then
                return;
            end;

            u31.DiedData = nil;
            task.wait(0);
            workspace_CurrentCamera = workspace.CurrentCamera;
            u31.CoreGuiStates = {};
            LocalPlayer:SetAttribute("IsBackpackEnabled", false);
            SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false);
            u31.canSetChat = false;
            u34 = false;
            local v559, v560 = l_pcall(function() -- Line: 3866
                -- upvalues: u30 (ref), u558 (copy)
                return u30.vcM(u558);
            end);

            if not v559 then
                warn("CVoiceChatError:", v560);
            end;

            for _, child in pairs(ReplicatedStorage.Storage.GUIs.PlayerGui:GetChildren()) do
                child:Clone().Parent = LocalPlayer.PlayerGui;
            end;

            u43 = false;
            LocalPlayer.CameraMinZoomDistance = game_StarterPlayer.CameraMinZoomDistance;
            UserInputService.MouseDeltaSensitivity = u31.InitialSensitivity;
            u31.ADS_FOV = 0;

            if u54 and u54.Parent then
                u54:ClearAllChildren();
            end;

            CleanUp();
            Mouse.TargetFilter = Filter;
            u31.MouseDeltaSensitivity = UserInputService.MouseDeltaSensitivity;
            u65 = DeepCopy(u69);
            CheckInputType(nil, true);
            _G.MDS = u31.InitialSensitivity;
            _G.GamepadZoomScale = 1;
            Upt_S();
            l_pcall(function() -- Line: 3903
                -- upvalues: u55 (ref)
                u55:Cancel();
            end);
            u65.WS = 0;
            u31.BreathMode = false;
            u31.effect3.Size = 0;
            u31.crouchCount = 0;
            WaitForChar();

            if LocalPlayer.Character ~= u558 or not (u558 and (u558.Parent and LocalPlayer.Character)) then
                return;
            end;

            workspace_CurrentCamera = workspace.CurrentCamera;
            u65.WS = u67.DefaultWalkSpeed;
            local Humanoid = u558:WaitForChild("Humanoid");
            u51 = Humanoid;

            if u31.MobileControlsM and Humanoid.Health > 0 then
                u31.MobileControlsM.NewCharacterFunction();
            end;

            task.delay(0.5, function() -- Line: 3935
                -- upvalues: LocalPlayer (ref), u558 (copy), Humanoid (copy), SetCoreGuiEnabled (ref), u31 (ref)
                if LocalPlayer.Character == u558 and Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
                    LocalPlayer:SetAttribute("IsBackpackEnabled", true);
                    local v561;

                    if _G.GSettings then
                        v561 = _G.GSettings.Chat ~= false;
                    else
                        v561 = u31.chatEn;
                    end;

                    SetCoreGuiEnabled(Enum.CoreGuiType.Chat, v561);
                    u31.canSetChat = true;
                end;
            end);
            l_pcall(function() -- Line: 3944
                -- upvalues: FrameworkStuff (ref), u31 (ref)
                FrameworkStuff.Flatline:Stop();
                u31.sG_Tween:Cancel();
                u31.sG_Tween2:Cancel();
            end);
            local v562 = l_tick();

            repeat
                task.wait(0.1);
            until GVF and GVF() ~= nil or (l_tick() - v562 > 5 or LocalPlayer.Character ~= u558);

            if l_tick() - v562 > 5 or (LocalPlayer.Character ~= u558 or not GVF) then
                return;
            end;

            for _, v in pairs(u32) do
                v:Clone().Parent = LocalPlayer.Backpack;
            end;

            local u563 = GVF();
            u33 = u563;
            local RagdollTime = u563:WaitForChild("RagdollTime");
            local RagdollSwitch = RagdollTime:WaitForChild("RagdollSwitch");
            local HumanoidRootPart = u558:WaitForChild("HumanoidRootPart");
            local Torso = u558:WaitForChild("Torso");
            local Neck = Torso:FindFirstChild("Neck");
            local Head = u558:WaitForChild("Head");
            local Sprinting = u563:WaitForChild("Sprinting");

            if u31.CharF.CustomCC and u31.CharF.CustomCC.Parent then
                u31.CharF.CustomCC:Destroy();
            end;

            u31.CharF.CustomCC = Instance.new("ColorCorrectionEffect");
            u31.CharF.CustomCC.Parent = workspace_CurrentCamera;
            _G.CustomCC = u31.CharF.CustomCC;

            if u31.CharF.CustomCC2 and u31.CharF.CustomCC2.Parent then
                u31.CharF.CustomCC2:Destroy();
            end;

            u31.CharF.CustomCC2 = Instance.new("BlurEffect");
            u31.CharF.CustomCC2.Size = 0;
            u31.CharF.CustomCC2.Parent = workspace_CurrentCamera;
            _G.CustomCC2 = u31.CharF.CustomCC2;
            u31.isCrouching = false;
            u31.CharF.Torso = Torso;
            u31.CharF.Root = HumanoidRootPart;
            u31.CharF.Neck = Neck;
            u31.CharF.Head = Head;
            u31.CharF.Humanoid = Humanoid;
            u31.CharF.Tool = nil;
            u31.CharF.Char = u558;
            l_pcall(function() -- Line: 3993
                -- upvalues: u31 (ref), u558 (copy)
                u31.CharF.LA = u558:WaitForChild("Left Arm", 3);
                u31.CharF.RA = u558:WaitForChild("Right Arm", 3);
                u31.CharF.LL = u558:WaitForChild("Left Leg", 3);
                u31.CharF.RL = u558:WaitForChild("Right Leg", 3);
            end);
            u31.CharF.State = Humanoid:GetState();
            u31.CharF.Currents = {};
            u31.CharF.lastSlide = 0;
            u31.CharF.sliding = false;
            u31.CharF.sprinting = false;
            u31.CharF.sprintTick = 0;

            local function FunnyCurrents(p564) -- Line: 4010
                -- upvalues: u31 (ref)
                local Name = p564.Name;

                if Name ~= "AS" and (Name ~= "AC" and (Name ~= "B" and (Name ~= "FORCEC" and (Name ~= "CM" and (Name ~= "NRG" and (Name ~= "NNNVG" and (Name ~= "NFXOG" and (Name ~= "CLMB_SD" and (Name ~= "CC_Saturation" and (Name ~= " " and (Name ~= "CC_Brightness" and (Name ~= "CC_Blur" and (Name ~= "CC_DenseAdd" and (Name ~= "CC_TintColor" and (Name ~= "CC_Contrast" and (Name ~= "ROTROOT" and (Name ~= "Reviving" and Name ~= "FORCE_S"))))))))))))))))) then
                    return;
                end;

                if not u31.CharF.Currents[p564.Name] then
                    u31.CharF.Currents[p564.Name] = {};
                end;

                table.insert(u31.CharF.Currents[p564.Name], p564);

                if u31.CharF.CustomCC and table.find({ "CC_Saturation", "CC_Contrast", "CC_Brightness", "CC_TintColor", "CC_Blur" }, Name) then
                    u31.CharF.CustomCC.Brightness = 0;
                    u31.CharF.CustomCC.Contrast = 0;
                    u31.CharF.CustomCC.Saturation = 0;
                    u31.CharF.CustomCC.TintColor = Color3.new(1, 1, 1);
                    u31.CharF.CustomCC2.Size = 0;

                    if u31.CharF.Currents.CC_Saturation then
                        for _, v in pairs(u31.CharF.Currents.CC_Saturation) do
                            local CustomCC = u31.CharF.CustomCC;
                            CustomCC.Saturation = CustomCC.Saturation + v.Value;
                        end;
                    end;

                    if u31.CharF.Currents.CC_Contrast then
                        for _, v in pairs(u31.CharF.Currents.CC_Contrast) do
                            local CustomCC = u31.CharF.CustomCC;
                            CustomCC.Contrast = CustomCC.Contrast + v.Value;
                        end;
                    end;

                    if u31.CharF.Currents.CC_Brightness then
                        for _, v in pairs(u31.CharF.Currents.CC_Brightness) do
                            local CustomCC = u31.CharF.CustomCC;
                            CustomCC.Brightness = CustomCC.Brightness + v.Value;
                        end;
                    end;

                    if u31.CharF.Currents.CC_TintColor then
                        for _, v in pairs(u31.CharF.Currents.CC_TintColor) do
                            u31.CharF.CustomCC.TintColor = v.Value;
                        end;
                    end;

                    if u31.CharF.Currents.CC_Blur then
                        for _, v in pairs(u31.CharF.Currents.CC_Blur) do
                            local CustomCC2 = u31.CharF.CustomCC2;
                            CustomCC2.Size = CustomCC2.Size + v.Value;
                        end;
                    end;
                end;
            end;

            u31.M_CharStats = ReplicatedStorage.CharStats:WaitForChild(LocalPlayer.Name, 30);
            local v567, v568 = l_pcall(function() -- Line: 4081
                -- upvalues: u31 (ref), FunnyCurrents (copy), u75 (ref)
                if u31.M_CharStats then
                    for _, child in pairs(u31.M_CharStats.Currents:GetChildren()) do
                        FunnyCurrents(child);
                    end;

                    u31.M_CharStats.Currents.ChildAdded:Connect(function(p565) -- Line: 4086
                        -- upvalues: FunnyCurrents (ref)
                        FunnyCurrents(p565);
                    end);
                    u31.M_CharStats.Currents.ChildRemoved:Connect(function(p566) -- Line: 4089
                        -- upvalues: u31 (ref), u75 (ref)
                        if u31.CharF.Currents[p566.Name] then
                            local table_find_ret = table.find(u31.CharF.Currents[p566.Name], p566);

                            if table_find_ret then
                                table.remove(u31.CharF.Currents[p566.Name], table_find_ret);

                                if #u31.CharF.Currents[p566.Name] <= 0 then
                                    u31.CharF.Currents[p566.Name] = nil;
                                end;
                            end;

                            if p566.Name == "NRG" then
                                u75();
                            end;
                        end;
                    end);
                end;
            end);

            if not v567 then
                warn(v568);
            end;

            local u569 = false;
            local u570 = nil;
            local u571 = false;
            local u572 = S_Get();
            local u573 = false;
            u31.hH.Value = 0;
            NumberValue3.Value = 0;
            Humanoid.HipHeight = 0;
            local Part = Instance.new("Part");
            Part.CanTouch = false;
            Part.Massless = true;
            Part.Transparency = 1;
            Part.Size = Vector3.new(0.05, 1, 0.05);
            Part.Locked = true;
            local Weld = Instance.new("Weld");
            Weld.Part0 = Torso;
            Weld.Part1 = Part;
            Weld.C0 = Weld.C0 * CFrame.new(0, 1.5, 0);
            Weld.Parent = Part;
            Part.Parent = Torso;
            Head.CollisionGroupId = PhysicsService:GetCollisionGroupId("No-Collide5");
            Torso.CollisionGroupId = PhysicsService:GetCollisionGroupId("No-Collide5");
            Part.CollisionGroupId = HumanoidRootPart.CollisionGroupId;
            Humanoid:MoveTo(HumanoidRootPart.Position);
            u31.activeTurnEffect = TurnEffect.New(u558, Humanoid, HumanoidRootPart, true);
            coroutine.wrap(function() -- Line: 4149
                -- upvalues: u29 (ref)
                u29.NC();
            end)();
            Destroy(u31.mBodyRotGyro);
            u31.mBodyRotGyro = Instance.new("BodyGyro");
            cTag(u31.mBodyRotGyro, "BM");
            u31.mBodyRotGyro.MaxTorque = Vector3.new(0, 6000, 0);
            u31.mBodyRotGyro.P = 10000;
            u31.mBodyRotGyro.D = 100;
            u44 = false;
            workspace_CurrentCamera.CameraType = Enum.CameraType.Custom;
            workspace_CurrentCamera.CameraSubject = Humanoid;
            Mouse.TargetFilter = u558;
            Mouse.TargetFilter = workspace:FindFirstChild("Filter");
            DefaultReverbType = u67.DefaultReverbType;
            u45 = 1;
            u31.sG_Tween = TweenService:Create(u31.eqA_1, TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0), {
                HighGain = 0,
                MidGain = 0,
                LowGain = 0
            });
            u31.sG_Tween2 = TweenService:Create(u31.eqB_1, TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0), {
                HighGain = 0,
                MidGain = 0,
                LowGain = 0
            });
            task.delay(3, function() -- Line: 4182
                -- upvalues: u31 (ref)
                u31.eqA_1.Enabled = false;
                u31.eqB_1.Enabled = false;
            end);
            u31.sG_Tween:Play();
            u31.sG_Tween2:Play();
            u31.effect1.TintColor = Color3.new(1, 1, 1);
            u31.effect2.TintColor = Color3.new(1, 1, 1);
            u31.sFOVv = Instance.new("NumberValue", u563.FOVs);
            u31.sFOVv.Value = 0;
            u31.sprN.Value = 0;
            u31.hH.Value = 0;
            u59 = TweenService:Create(u31.sprN, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Value = 1
            });
            u60 = TweenService:Create(u31.sprN, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Value = 0
            });
            u37 = false;
            u41 = false;
            u39 = HumanoidRootPart;
            u40 = false;
            u35 = false;
            u34 = false;

            if u38 and u38.Parent then
                u38:WaitForChild("Frame").Visible = false;
                TweenService:Create(u38:WaitForChild("BlackFrame"), TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    BackgroundTransparency = 1
                }):Play();
                task.delay(3, function() -- Line: 4214
                    -- upvalues: u37 (ref), u571 (ref), u38 (ref)
                    if not (u37 or u571) then
                        _G.deathGUI = nil;
                        u38:Destroy();
                    end;
                end);
            end;

            local Health = Humanoid.Health;
            ResetAllow(true);
            u31.DiedData = nil;
            local u574 = true;
            random();
            local u575 = 0;
            local u576 = nil;
            local u577 = nil;
            local u578 = nil;
            local u579 = nil;
            local u580 = nil;
            local u581 = nil;
            local u582 = nil;
            local u583 = nil;
            local u584 = nil;
            local u585 = nil;
            local u586 = nil;
            local u587 = nil;
            local u588 = nil;
            local u589 = nil;
            local u590 = nil;
            local u591 = nil;
            local u592 = nil;
            local u593 = nil;
            local u594 = nil;
            local u595 = true;
            local u596 = true;
            local u597 = l_time();
            local u598 = false;
            _G.lastClimbTick = 0;
            local u599 = nil;
            local u600 = nil;
            AffectChar("SD", l_math.huge, random(), 6).Parent = nil;
            local u601 = ReplicatedStorage.Storage.GUIs.DownedGUI:Clone();
            table.insert(u53, u601);
            u601.Enabled = false;
            u601.Parent = LocalPlayer.PlayerGui;
            _G.IsAlive = true;
            local _ = _G.DeviceType == 2;
            local u602 = Humanoid:LoadAnimation(ReplicatedStorage.Storage.Animations.DownedHold);

            local function disconnect() -- Line: 4258
                -- upvalues: u574 (ref), Disconnect (ref), u577 (ref), u578 (ref), u579 (ref), u585 (ref), u580 (ref), u581 (ref), u582 (ref), u586 (ref), u587 (ref), u588 (ref), u589 (ref), u583 (ref), u576 (ref), u584 (ref), u596 (ref), u590 (ref), u591 (ref), u592 (ref), u593 (ref), u594 (ref), Destroy (ref), u599 (ref), u600 (ref), u595 (ref), u575 (ref)
                if not u574 then
                    return;
                end;

                u574 = false;
                Disconnect(u577);
                Disconnect(u578);
                Disconnect(u579);
                Disconnect(u585);
                Disconnect(u580);
                Disconnect(u581);
                Disconnect(u582);
                Disconnect(u586);
                Disconnect(u587);
                Disconnect(u588);
                Disconnect(u589);
                Disconnect(u583);
                Disconnect(u576);
                Disconnect(u584);
                Disconnect(nil);
                Disconnect(nil);
                Disconnect(u596);
                Disconnect(u590);
                Disconnect(u591);
                Disconnect(u592);
                Disconnect(u593);
                Disconnect(u594);
                Destroy(u599);
                Destroy(u600);
                u595 = false;
                u596 = false;
                u575 = 0;
            end;

            local function C0Tweak(p603, p604) -- Line: 4293
                -- upvalues: Neck (ref), Torso (copy), u31 (ref), HumanoidRootPart (copy), workspace_CurrentCamera (ref), u558 (copy), Mouse (ref), Humanoid (copy), l_math (ref), UserInputService (ref), DoTweak (ref)
                debug.profilebegin("DoTweak");
                local _ = CFrame.new;
                local _ = CFrame.Angles;
                local toObjectSpace = CFrame.new().toObjectSpace;
                local v605 = nil;
                local v606 = false;

                if not (Neck and Neck.Parent) then
                    Neck = Torso:FindFirstChild("Neck");
                    u31.CharF.Neck = Neck;
                end;

                if Neck and Neck.Parent then
                    v605 = toObjectSpace(HumanoidRootPart.CFrame, workspace_CurrentCamera.CFrame).LookVector.Unit;

                    if workspace_CurrentCamera.CameraSubject.Parent == u558 then
                        v606 = true;
                    else
                        v606 = false;
                    end;
                end;

                local MousePoint = u31.MousePoint;
                local p = Mouse.Origin.p;
                local v607 = not u558:GetAttribute("NoNeckMovement");
                local State = Humanoid:GetState();

                if State == Enum.HumanoidStateType.Climbing or State == Enum.HumanoidStateType.Swimming then
                    local X = MousePoint.X;
                    local v608 = l_math.max(HumanoidRootPart.Position.Y + 7.5, MousePoint.Y);
                    MousePoint = Vector3.new(X, v608, MousePoint.Z);
                end;

                if p603 then
                    p603 = not p603:GetAttribute("NoArmMovement");
                end;

                local v609 = not _G.FP;

                if v609 then
                    if UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter then
                        v609 = p603;
                    else
                        v609 = false;
                    end;
                end;

                if v605 then
                    _G.YLookVecNUM = v605.Y;
                    DoTweak(u558, MousePoint, p, v605, v607, p603, v606, v609, nil, p604);
                end;

                debug.profileend();
            end;

            coroutine.wrap(function() -- Line: 4370
                -- upvalues: u558 (copy), u574 (ref), u31 (ref), HumanoidRootPart (copy), u595 (ref), RagdollSwitch (copy), u64 (ref), RunService (ref), u35 (ref), u34 (ref), Head (copy), u49 (ref), Humanoid (copy), u40 (ref), PhysicsService (ref), Torso (copy), u43 (ref), LocalPlayer (ref), u39 (ref), u563 (copy), l_math (ref), l_pcall (ref), NumberValue (ref), game_StarterPlayer (ref), u110 (ref)
                local function alivCCC() -- Line: 4371
                    -- upvalues: u558 (ref), u574 (ref), u31 (ref), HumanoidRootPart (ref)
                    local v610 = u558 and (u558.Parent and u574);

                    if v610 then
                        if u31.CharF.State == Enum.HumanoidStateType.Dead then
                            v610 = false;
                        else
                            v610 = HumanoidRootPart and HumanoidRootPart.Parent;
                        end;
                    end;

                    return v610;
                end;

                while u595 and alivCCC() do
                    if RagdollSwitch.Value and not u64.__z then
                        u64.__z = true;
                    else
                        while RagdollSwitch.Parent and (not RagdollSwitch.Value and alivCCC()) do
                            local v611 = RunService.Heartbeat:Wait();
                            u31.activeTurnEffect:Update(v611);
                        end;
                    end;

                    if not alivCCC() then
                        break;
                    end;

                    local v612 = false;

                    if RagdollSwitch.Value then
                        u35 = false;
                        u34 = false;
                        u31.activeTurnEffect:Stop();

                        if Head and Head.Parent then
                            local v613, v614, v615 = Head.CFrame:ToOrientation();
                            u49.Value = Vector3.new(v613, v614, v615);
                        end;

                        Humanoid:UnequipTools();

                        while RagdollSwitch.Value == true and alivCCC() do
                            u40 = true;
                            Humanoid.Jump = false;
                            Head.CollisionGroupId = PhysicsService:GetCollisionGroupId("No-Collide5");
                            Torso.CollisionGroupId = PhysicsService:GetCollisionGroupId("No-Collide5");
                            Humanoid.CameraOffset = Vector3.new(0, 0, 0);

                            if not u43 then
                                LocalPlayer.CameraMinZoomDistance = 5;
                            end;

                            if u39 and (u39.Parent and u563.Grabbed.Value) then
                                for _, child in pairs(u558:GetChildren()) do
                                    if child:IsA("BasePart") then
                                        local v616 = l_math.min(child.Velocity.X, 5);
                                        local v617 = l_math.min(child.Velocity.Y, 5);
                                        local v618 = l_math.min(child.Velocity.Z, 5);
                                        child.Velocity = Vector3.new(v616, v617, v618);
                                    end;
                                end;
                            end;

                            if not v612 then
                                Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, false);
                                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false);
                                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false);
                                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false);
                                Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false);
                                Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false);
                                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false);
                                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, false);
                                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true);
                                l_pcall(function() -- Line: 4456
                                    -- upvalues: Head (ref), PhysicsService (ref), Torso (ref), Humanoid (ref)
                                    task.delay(0, function() -- Line: 4457
                                        -- upvalues: Head (ref), PhysicsService (ref), Torso (ref), Humanoid (ref)
                                        Head.CollisionGroupId = PhysicsService:GetCollisionGroupId("No-Collide5");
                                        Torso.CollisionGroupId = PhysicsService:GetCollisionGroupId("No-Collide5");
                                        Humanoid:UnequipTools();
                                    end);
                                end);
                                v612 = true;
                            end;

                            Humanoid:ChangeState(Enum.HumanoidStateType.Ragdoll);
                            NumberValue.Value = 0;
                            Humanoid.WalkSpeed = 0;
                            RunService.Heartbeat:Wait();
                        end;

                        u43 = false;
                        LocalPlayer.CameraMinZoomDistance = game_StarterPlayer.CameraMinZoomDistance;
                    end;

                    u40 = false;

                    if Humanoid.Health > 0 then
                        if Humanoid and Humanoid.Parent then
                            Humanoid.PlatformStand = false;
                            Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, true);
                            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true);
                            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true);
                            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true);
                            Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true);
                            Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true);
                            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true);
                            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, true);
                            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false);
                        end;

                        Humanoid:ChangeState(Enum.HumanoidStateType.Running);
                    end;

                    if u110() and Humanoid.Health > 0 then
                        u31.hH.Value = -1;
                        u31.downed = true;
                        Humanoid.CameraOffset = Vector3.new(0, -2, 0);
                    end;

                    if u39 then
                        local _ = u39.Parent;
                    end;

                    Head.CollisionGroupId = PhysicsService:GetCollisionGroupId("No-Collide5");
                    Torso.CollisionGroupId = PhysicsService:GetCollisionGroupId("No-Collide5");
                end;
            end)();
            coroutine.wrap(function() -- Line: 4559
                -- upvalues: AffectChar (ref), l_math (ref), random (ref), u53 (ref), ForceChar (ref), HumanoidRootPart (copy), u574 (ref), Humanoid (copy), Head (copy), Torso (copy), CheckWater (ref), u31 (ref), u44 (ref), u563 (copy), u110 (ref), u116 (ref), u558 (copy), Events (ref), l_tick (ref), S_Take (ref), S_Get (ref), GetWaterCurrent (ref)
                local v619 = AffectChar("SD", l_math.huge, random(), 5);
                local v620 = AffectChar("JR", l_math.huge, random(), 15);
                table.insert(u53, v619);
                table.insert(u53, v620);
                local v621 = ForceChar(HumanoidRootPart, (Vector3.new(0, -10, 0)));
                local v622 = ForceChar(HumanoidRootPart, (Vector3.new(0, 100, 0)));
                local v623 = ForceChar(HumanoidRootPart, (Vector3.new(0, 0, 0)));
                v621.Parent = nil;
                v622.Parent = nil;
                local v624 = AffectChar("Drowning", l_math.huge);
                local v625 = AffectChar("Underwater", l_math.huge);
                v624.Parent = nil;
                v625.Parent = nil;
                v619.Parent = nil;
                v620.Parent = nil;
                local v626 = 0;

                while u574 and (Humanoid.Health > 0 and (Head and Head.Parent)) do
                    task.wait(0.15);
                    debug.profilebegin("WaterDrownCheck");
                    local v627, v628 = CheckWater(true, true, Torso.CFrame, Head.CFrame + Head.CFrame.LookVector + Vector3.new(0, 0.5, 0));
                    local v629 = u31.CharF.State == Enum.HumanoidStateType.Swimming;
                    u44 = v627;

                    if v627 and not (v629 or Humanoid:GetAttribute("N_WTR_SD")) then
                        v619.Parent = u563.Currents;
                        v620.Parent = u563.Currents;
                    else
                        v619.Parent = nil;
                        v620.Parent = nil;
                    end;

                    local v630 = u110();
                    local v631 = u116(u558);
                    local v632 = v631 and -50 or l_math.random(-400, -200);
                    v621.Force = Vector3.new(0, v632, 0);

                    if v629 and not v631 or v630 and u44 then
                        v621.Parent = HumanoidRootPart;
                    else
                        v621.Parent = nil;
                    end;

                    if v630 and u44 then
                        v622.Parent = HumanoidRootPart;

                        if not u116(u558) then
                            Events.__RZDONL:FireServer("-r__r3");
                        end;
                    else
                        v622.Parent = nil;
                    end;

                    local Vector3_new_ret = Vector3.new();

                    if v628 then
                        if l_tick() - v626 < 0.3 then
                            S_Take(1);
                        end;

                        local v633 = S_Get();

                        if v633 - 1 <= 0 and v633 > 0 then
                            v626 = l_tick();
                        end;

                        v625.Parent = u563.Currents;

                        if S_Get() <= 0 then
                            v624.Parent = u563.Currents;

                            if l_tick() - v626 >= 0.5 then
                                local v634 = 7.5;

                                if v630 or Humanoid.Health <= 15 then
                                    Vector3_new_ret = Vector3.new(0, 100, 0);
                                    v634 = 0.5;
                                elseif Humanoid.Health - v634 <= 15 then
                                    v634 = Humanoid.Health - 15;
                                    u563.Downed.Value = true;
                                elseif Humanoid.Health > 25 then
                                    u563.Downed.Value = false;
                                end;

                                if not u558:FindFirstChildOfClass("ForceField") then
                                    local _ = Humanoid.Health - v634 <= 1;
                                    Humanoid.Health = Humanoid.Health - v634;
                                end;

                                AffectChar("NRG", 3);
                                Events.TK_DGM:FireServer(v634, "Drown");
                                v626 = l_tick();
                            end;
                        else
                            v626 = l_tick();
                            v624.Parent = nil;
                        end;
                    else
                        v626 = l_tick();
                        v624.Parent = nil;
                        v625.Parent = nil;
                    end;

                    if v627 then
                        local v635 = GetWaterCurrent(HumanoidRootPart, 3);

                        if v630 and u44 or not v630 then
                            v623.Force = v635 + Vector3_new_ret * 1.5;
                            v623.Parent = HumanoidRootPart;
                        else
                            v623.Force = Vector3.new();
                        end;
                    else
                        v623.Parent = nil;
                    end;

                    debug.profileend();
                end;

                v624.Parent = nil;
                v625.Parent = nil;
            end)();

            local function DoGyroS(p636) -- Line: 4702
                -- upvalues: u574 (ref), Humanoid (copy), u116 (ref), u558 (copy), Head (copy), Torso (copy), u39 (ref), RagdollTime (copy), l_tick (ref), u569 (ref), l_math (ref), u570 (ref), Destroy (ref), C0Tweak (copy), u31 (ref)
                if not u574 then
                    return;
                end;

                local State = Humanoid:GetState();
                local v637 = State == Enum.HumanoidStateType.Climbing;

                if u116(u558) then
                    if u39 and u39.Parent then
                        u39.CanCollide = not RagdollTime.SRagdolled.Value;
                    end;
                elseif State ~= Enum.HumanoidStateType.Swimming then
                    if Head and Head.Parent then
                        Head.CanCollide = false;
                    end;

                    if Torso and Torso.Parent then
                        Torso.CanCollide = false;
                    end;

                    if u39 and u39.Parent then
                        u39.CanCollide = true;
                    end;
                end;

                if v637 then
                    _G.lastClimbTick = l_tick();

                    if not u569 then
                        u569 = true;
                    end;

                    local v638, v639, v640 = Torso.CFrame:ToOrientation();
                    local _ = l_math.floor(v638 * 100) / 100;
                    local _ = l_math.floor(v639 * 100) / 100;
                    local _ = l_math.floor(v640 * 100) / 100;
                elseif u569 then
                    u569 = false;

                    if u570 then
                        Destroy(u570);
                    end;

                    u570 = nil;
                end;

                C0Tweak(u31.CharF.Tool, p636);
            end;

            local u641 = nil;
            u641 = RunService.Heartbeat:Connect(function(p642) -- Line: 4793
                -- upvalues: u574 (ref), u641 (ref), DoGyroS (copy)
                debug.profilebegin("gyroHeartbeat");

                if not u574 then
                    u641:Disconnect();

                    return;
                end;

                DoGyroS(p642);
                debug.profileend();
            end);
            u68 = DoGyroS;
            u596 = u563.Downed.Changed:Connect(function(p643) -- Line: 4830
                -- upvalues: ShellShock (ref), Humanoid (copy), u563 (copy), l_pcall (ref), u31 (ref), u42 (ref), u116 (ref), LocalPlayer (ref), u558 (copy), RunService (ref), Events (ref), AffectChar (ref), l_math (ref), LimbCheck (ref), CheckIfFlinching (ref), u601 (copy), UserInputService (ref), u39 (ref), u33 (ref), u602 (copy), Disconnect (ref), Destroy (ref)
                if p643 then
                    ShellShock(1, 1.5, 0.25, 0, true);
                end;

                if Humanoid.Health <= 0 then
                    return;
                end;

                if not p643 then
                    u31.hH.Value = 0;
                    Humanoid.CameraOffset = Vector3.new(0, 0, 0);

                    return;
                end;

                if not (u563.Handcuffed.Value or Humanoid:GetAttribute("NoDeathRagdoll")) then
                    for _, v in pairs(Humanoid:GetPlayingAnimationTracks()) do
                        v:Stop(0.5);
                    end;
                end;

                l_pcall(function() -- Line: 4844
                    -- upvalues: u31 (ref)
                    u31.crouch_Tween:Pause();
                end);
                l_pcall(function() -- Line: 4845
                    -- upvalues: u42 (ref), u563 (ref)
                    if u42 then
                        u42:Stop(0.175);
                        u42:Destroy();
                        u42 = nil;
                        u563.Crouching.Value = false;
                    end;
                end);
                u31.isCrouching = false;

                if not u116() then
                    u31.hH.Value = -1;
                    Humanoid.CameraOffset = Vector3.new(0, -2, 0);
                end;

                local u644 = false;
                local u645 = false;
                local v646 = false;
                local u647 = false;
                u31.MobileControlsM.DiedFunction();
                task.spawn(function() -- Line: 4871
                    -- upvalues: LocalPlayer (ref), u558 (ref), u563 (ref), Humanoid (ref), RunService (ref), u31 (ref)
                    while LocalPlayer.Character == u558 and (u563.Downed.Value and Humanoid.Health > 0) do
                        RunService.Heartbeat:Wait();
                    end;

                    if LocalPlayer.Character == u558 and Humanoid.Health > 0 then
                        u31.MobileControlsM.NewCharacterFunction();
                    end;
                end);
                local DownResist = Events.DownResist;
                local v648 = AffectChar("SD", l_math.huge, l_math.random(), 1000);
                v648.Parent = nil;

                local function DoResist(u649, p650) -- Line: 4885
                    -- upvalues: u647 (ref), LimbCheck (ref), u558 (ref), CheckIfFlinching (ref), u116 (ref), u645 (ref), u563 (ref), DownResist (copy)
                    if u647 then
                        return;
                    end;

                    if LimbCheck(u558, "Head", "Broken", true) then
                        return;
                    end;

                    u647 = true;

                    if CheckIfFlinching(u558) or (u116(u558) or LimbCheck(u558, "Head", "Broken", true)) then
                        u645 = false;
                    end;

                    coroutine.wrap(function() -- Line: 4895
                        -- upvalues: u649 (copy), u563 (ref), DownResist (ref), u645 (ref)
                        if u649 == u563.Downed.Resisting.Value then
                            u645 = u649;

                            return;
                        end;

                        u645 = DownResist:InvokeServer(u649) and u649 or false;
                    end)();
                    u647 = false;
                end;

                local _G_InputType = _G.InputType;

                local function DeviceCheck() -- Line: 4909
                    -- upvalues: _G_InputType (ref), u601 (ref)
                    _G_InputType = _G.InputType;

                    if _G.InputType == 3 then
                        u601.Frame.Visible = false;
                        u601.MobileFrame.Visible = true;

                        return;
                    end;

                    if _G.InputType == 2 then
                        u601.Frame.Visible = true;
                        u601.MobileFrame.Visible = false;
                        u601.Frame.ButtonFrame.ButtonXBG.Visible = true;
                        u601.Frame.ButtonFrame.X.Visible = true;
                        u601.Frame.ButtonFrame.B.Visible = false;

                        return;
                    end;

                    u601.Frame.Visible = true;
                    u601.MobileFrame.Visible = false;
                    u601.Frame.ButtonFrame.ButtonXBG.Visible = false;
                    u601.Frame.ButtonFrame.X.Visible = false;
                    u601.Frame.ButtonFrame.B.Visible = true;
                end;

                DeviceCheck();
                local v653 = UserInputService.InputBegan:Connect(function(p651, p652) -- Line: 4933
                    -- upvalues: u644 (ref)
                    if p652 then
                        return;
                    end;

                    if p651.KeyCode == Enum.KeyCode.F or p651.KeyCode == Enum.KeyCode.ButtonX then
                        u644 = true;

                        return;
                    end;

                    local _ = p651.KeyCode == Enum.KeyCode.B;
                end);
                local v655 = UserInputService.InputEnded:Connect(function(p654) -- Line: 4941
                    -- upvalues: u644 (ref)
                    if p654.KeyCode == Enum.KeyCode.F or p654.KeyCode == Enum.KeyCode.ButtonX then
                        u644 = false;

                        return;
                    end;

                    local _ = p654.KeyCode == Enum.KeyCode.B;
                end);
                local v656 = u601.MobileFrame.TextButton.MouseButton1Down:Connect(function() -- Line: 4949
                    -- upvalues: u644 (ref), u601 (ref)
                    u644 = not u644;
                    u601.MobileFrame.TextButton.BackgroundColor3 = u644 and Color3.fromRGB(5, 80, 255) or Color3.fromRGB(90, 90, 90);
                end);

                while LocalPlayer.Character == u558 and (u563.Downed.Value and (Humanoid.Health > 0 and (LocalPlayer.Character == u558 and (u563.Downed.Value and Humanoid.Health > 0)))) do
                    if _G.InputType ~= _G_InputType then
                        DeviceCheck();
                    end;

                    if u116() then
                        if u645 then
                            if u601 and u601.Parent then
                                u601.Enabled = false;
                            end;

                            DoResist(false);
                        end;
                    else
                        if u39 and u39.Parent then
                            local v657, v658, v659 = u39.CFrame:ToEulerAnglesYXZ();
                            local v660 = l_math.deg(v657);
                            local v661;

                            if v660 > 0 then
                                v661 = l_math.min(v660, 15);
                            else
                                v661 = l_math.max(v660, -15);
                            end;

                            l_math.rad(v661);
                            u39.CFrame = CFrame.new(u39.CFrame.p) * CFrame.Angles(0, v658, v659);
                        end;

                        local v662 = (Humanoid.MoveDirection.Magnitude <= 0.1 or u645) and not LimbCheck(u558, "Head", "Broken", true) and not CheckIfFlinching();

                        if u644 and (v662 and not u31.CharF.Currents.Reviving) then
                            if u645 then
                                if u601 and u601.Parent then
                                    u601.Enabled = _G.InputType == 3;
                                end;
                            else
                                DoResist(true);
                            end;
                        else
                            if u601 and u601.Parent then
                                u601.Enabled = v662 and not (u644 or u31.CharF.Currents.Reviving) and not u33.Grabbed.Value;
                            end;

                            if u645 then
                                DoResist(false);
                            end;
                        end;
                    end;

                    if u645 and not v646 then
                        u602:Play(0.2);
                        v648.Parent = u33.Currents;
                        v646 = true;
                    elseif v646 and not u645 then
                        u602:Stop(0.2);
                        v648.Parent = nil;
                        v646 = false;
                    end;

                    RunService.Heartbeat:Wait();
                end;

                if u601 and u601.Parent then
                    u601.Enabled = false;
                end;

                Disconnect(v653);
                Disconnect(v655);
                Disconnect(v656);
                Destroy(v648);
                u602:Stop();
            end);

            local function RageMode_On(p663) -- Line: 5035
                -- upvalues: u64 (ref), u563 (copy), TweenService (ref), u53 (ref), workspace_CurrentCamera (ref), u31 (ref)
                if u64.raging then
                    return;
                end;

                u64.raging = true;
                u64.rage_fov = Instance.new("NumberValue");
                u64.rage_fov.Parent = u563.FOVs;
                local TweenInfo_new_ret = TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
                TweenService:Create(u64.rage_fov, TweenInfo_new_ret, {
                    Value = 30
                }):Play();
                u64.rage_color = Instance.new("ColorCorrectionEffect");
                u64.rage_color2 = Instance.new("ColorCorrectionEffect");
                table.insert(u53, u64.rage_color);
                table.insert(u53, u64.rage_color2);
                u64.rage_color.Parent = workspace_CurrentCamera;
                u64.rage_color2.Parent = workspace_CurrentCamera;
                local Color3_fromRGB_ret = Color3.fromRGB(255, 143, 143);

                if p663 and p663.Parent then
                    local Attribute = p663:GetAttribute("CustomColor");

                    if Attribute then
                        Color3_fromRGB_ret = u31.ColorHueAdjuster(Color3_fromRGB_ret, Attribute);
                    end;
                end;

                TweenService:Create(u64.rage_color, TweenInfo_new_ret, {
                    Brightness = 0.1,
                    Contrast = 0.2,
                    Saturation = -0.25,
                    TintColor = Color3_fromRGB_ret
                }):Play();
                u64.rage_t = TweenService:Create(u64.rage_color2, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 30, true), {
                    Brightness = 0.1
                });
                u64.rage_t:Play();
            end;

            local function RageMode_Off() -- Line: 5068
                -- upvalues: u64 (ref), Debris (ref), TweenService (ref)
                if not u64.raging then
                    return;
                end;

                u64.raging = false;
                local TweenInfo_new_ret = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);

                if u64.rage_fov and u64.rage_fov.Parent then
                    Debris:AddItem(u64.rage_fov, 1);
                    TweenService:Create(u64.rage_fov, TweenInfo_new_ret, {
                        Value = 0
                    }):Play();
                end;

                if u64.rage_color and u64.rage_color.Parent then
                    Debris:AddItem(u64.rage_color, 1);
                    TweenService:Create(u64.rage_color, TweenInfo_new_ret, {
                        Brightness = 0,
                        Contrast = 0,
                        Saturation = 0,
                        TintColor = Color3.fromRGB(255, 255, 255)
                    }):Play();
                end;

                if u64.rage_color2 and u64.rage_color2.Parent then
                    Debris:AddItem(u64.rage_color2, 1);
                    TweenService:Create(u64.rage_color2, TweenInfo_new_ret, {
                        Brightness = 0,
                        Contrast = 0,
                        Saturation = 0,
                        TintColor = Color3.fromRGB(255, 255, 255)
                    }):Play();
                end;

                if u64.rage_t then
                    u64.rage_t:Cancel();
                end;

                u64.rage_t = nil;
            end;

            local function Poison_On(u664, p665, p666) -- Line: 5096
                -- upvalues: u64 (ref), u37 (ref), u563 (copy), u53 (ref), workspace_CurrentCamera (ref), u31 (ref), Humanoid (copy), TweenService (ref)
                if u64.poisoned then
                    return;
                end;

                if u37 then
                    return;
                end;

                if not u664 then
                    return;
                end;

                u64.poisoned = true;
                u64.poison_fov = Instance.new("NumberValue");
                u64.poison_fov.Parent = u563.FOVs;
                local TweenInfo_new_ret = TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
                u64.poison_effect = Instance.new("ColorCorrectionEffect");
                u64.poison_effect2 = Instance.new("BlurEffect");
                u64.poison_effect2.Size = 0;
                table.insert(u53, u64.poison_effect);
                table.insert(u53, u64.poison_effect2);
                u64.poison_effect.Parent = workspace_CurrentCamera;
                u64.poison_effect2.Parent = workspace_CurrentCamera;
                local v667 = p665 and Color3.fromRGB(134, 185, 255) or (p666 and Color3.fromRGB(255, 143, 121) or Color3.fromRGB(183, 255, 134));
                local v668;

                if u664 then
                    v668 = u664:GetAttribute("CustomColor");
                else
                    v668 = u664;
                end;

                if v668 then
                    v667 = u31.ColorHueAdjuster(v667, v668);
                end;

                local u669 = {
                    Brightness = 0.85,
                    Contrast = 2.1,
                    Saturation = -0.35,
                    BlurSize = 12,
                    Fov = -35,
                    TintColor = v667
                };
                local u670 = nil;

                local function updt() -- Line: 5137
                    -- upvalues: u664 (copy), Humanoid (ref), u670 (ref), u669 (copy), TweenService (ref), u64 (ref), TweenInfo_new_ret (copy)
                    local Value = u664.Value;

                    if Humanoid.Health <= 0 then
                        u670:Disconnect();

                        return;
                    end;

                    local v671 = {
                        Brightness = u669.Brightness * Value,
                        Contrast = u669.Contrast * Value,
                        Saturation = u669.Saturation * Value,
                        TintColor = Color3.fromRGB(255, 255, 255):Lerp(u669.TintColor, Value / 1)
                    };
                    TweenService:Create(u64.poison_effect, TweenInfo_new_ret, v671):Play();
                    TweenService:Create(u64.poison_effect2, TweenInfo_new_ret, {
                        Size = u669.BlurSize * Value
                    }):Play();
                    TweenService:Create(u64.poison_fov, TweenInfo_new_ret, {
                        Value = u669.Fov * Value
                    }):Play();
                end;

                updt();
                u670 = u664.Changed:Connect(updt);
            end;

            local function Poison_Off() -- Line: 5156
                -- upvalues: u64 (ref), TweenService (ref)
                if not u64.poisoned then
                    return;
                end;

                u64.poisoned = false;
                local TweenInfo_new_ret = TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.In);
                local v672 = {
                    Brightness = 0,
                    Contrast = 0,
                    Saturation = 0,
                    TintColor = Color3.fromRGB(255, 255, 255)
                };

                if u64.poison_effect and u64.poison_effect.Parent then
                    game.Debris:AddItem(u64.poison_effect, 4);
                    TweenService:Create(u64.poison_effect, TweenInfo_new_ret, v672):Play();
                end;

                if u64.poison_effect2 and u64.poison_effect2.Parent then
                    game.Debris:AddItem(u64.poison_effect2, 4);
                    TweenService:Create(u64.poison_effect2, TweenInfo_new_ret, {
                        Size = 0
                    }):Play();
                end;

                if u64.poison_fov and u64.poison_fov.Parent then
                    game.Debris:AddItem(u64.poison_fov, 4);
                    TweenService:Create(u64.poison_fov, TweenInfo_new_ret, {
                        Value = 0
                    }):Play();
                end;
            end;

            local function FrostOverlay_On(u673, p674, p675) -- Line: 5187
                -- upvalues: u64 (ref), u37 (ref), FrameworkStuff (ref), u563 (copy), u53 (ref), workspace_CurrentCamera (ref), u31 (ref), Humanoid (copy), TweenService (ref)
                if u64.frostOverlay then
                    return;
                end;

                if u37 then
                    return;
                end;

                if not u673 then
                    return;
                end;

                u64.frostOverlay = true;

                if FrameworkStuff:FindFirstChild("FreezeSound") then
                    FrameworkStuff.FreezeSound:Play();
                end;

                u64.frost_fov = Instance.new("NumberValue");
                u64.frost_fov.Parent = u563.FOVs;
                local TweenInfo_new_ret = TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
                u64.frost_effect = Instance.new("ColorCorrectionEffect");
                u64.frost_effect2 = Instance.new("BlurEffect");
                u64.frost_effect2.Size = 0;
                table.insert(u53, u64.frost_effect);
                table.insert(u53, u64.frost_effect2);
                u64.frost_effect.Parent = workspace_CurrentCamera;
                u64.frost_effect2.Parent = workspace_CurrentCamera;
                local v676 = p674 and Color3.fromRGB(134, 185, 255) or (p675 and Color3.fromRGB(255, 143, 121) or Color3.fromRGB(183, 255, 134));
                local v677;

                if u673 then
                    v677 = u673:GetAttribute("CustomColor");
                else
                    v677 = u673;
                end;

                if v677 then
                    v676 = u31.ColorHueAdjuster(v676, v677);
                end;

                local u678 = {
                    Brightness = 0.32725,
                    Contrast = 0.8085000000000001,
                    Saturation = -0.13474999999999998,
                    BlurSize = 4.62,
                    Fov = -5,
                    TintColor = v676
                };
                local u679 = nil;

                local function v681() -- Line: 5232
                    -- upvalues: u673 (copy), Humanoid (ref), u679 (ref), u678 (copy), TweenService (ref), u64 (ref), TweenInfo_new_ret (copy)
                    local Value = u673.Value;

                    if Humanoid.Health <= 0 then
                        u679:Disconnect();

                        return;
                    end;

                    local v680 = {
                        Brightness = u678.Brightness * Value,
                        Contrast = u678.Contrast * Value,
                        Saturation = u678.Saturation * Value,
                        TintColor = Color3.fromRGB(255, 255, 255):Lerp(u678.TintColor, Value / 1)
                    };
                    TweenService:Create(u64.frost_effect, TweenInfo_new_ret, v680):Play();
                    TweenService:Create(u64.frost_effect2, TweenInfo_new_ret, {
                        Size = u678.BlurSize * Value
                    }):Play();
                    TweenService:Create(u64.frost_fov, TweenInfo_new_ret, {
                        Value = u678.Fov * Value
                    }):Play();
                end;

                v681();
                u679 = u673.Changed:Connect(v681);
            end;

            local function FrostOverlay_Off() -- Line: 5252
                -- upvalues: u64 (ref), TweenService (ref)
                if not u64.frostOverlay then
                    return;
                end;

                u64.frostOverlay = false;
                local TweenInfo_new_ret = TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.In);
                local v682 = {
                    Brightness = 0,
                    Contrast = 0,
                    Saturation = 0,
                    TintColor = Color3.fromRGB(255, 255, 255)
                };

                if u64.frost_effect and u64.frost_effect.Parent then
                    game.Debris:AddItem(u64.frost_effect, 4);
                    TweenService:Create(u64.frost_effect, TweenInfo_new_ret, v682):Play();
                end;

                if u64.frost_effect2 and u64.frost_effect2.Parent then
                    game.Debris:AddItem(u64.frost_effect2, 4);
                    TweenService:Create(u64.frost_effect2, TweenInfo_new_ret, {
                        Size = 0
                    }):Play();
                end;

                if u64.frost_fov and u64.frost_fov.Parent then
                    game.Debris:AddItem(u64.frost_fov, 4);
                    TweenService:Create(u64.frost_fov, TweenInfo_new_ret, {
                        Value = 0
                    }):Play();
                end;
            end;

            local function Radiation_On(u683) -- Line: 5283
                -- upvalues: u64 (ref), u37 (ref), ReplicatedStorage (ref), u53 (ref), LocalPlayer (ref), FrameworkStuff (ref), u31 (ref), l_math (ref), Humanoid (copy), TweenService (ref)
                if u64.radiationed then
                    return;
                end;

                if u37 then
                    return;
                end;

                if not u683 then
                    return;
                end;

                u64.radiationed = true;
                local TweenInfo_new_ret = TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
                u64.radiationImage = ReplicatedStorage.Storage.GUIs.Radiation:Clone();
                table.insert(u53, u64.radiationImage);
                u64.radiationImage.Parent = LocalPlayer.PlayerGui:FindFirstChild("CoreGUI");
                u64.radiationS1 = FrameworkStuff.Geiger:Clone();
                table.insert(u53, u64.radiationS1);
                u64.radiationS1.Parent = workspace.CurrentCamera;
                u64.radiationS2 = FrameworkStuff.GeigerHigh:Clone();
                table.insert(u53, u64.radiationS2);
                u64.radiationS2.Parent = workspace.CurrentCamera;
                u64.radiationImage.ImageTransparency = 1;
                u64.radiationImage.Visible = true;
                local Color3_fromRGB_ret = Color3.fromRGB(183, 255, 134);
                local v684;

                if u683 then
                    v684 = u683:GetAttribute("CustomColor");
                else
                    v684 = u683;
                end;

                if v684 then
                    u31.ColorHueAdjuster(Color3_fromRGB_ret, v684);
                end;

                local u685 = nil;
                local u686 = nil;
                u64.radiationS1.Volume = 0;
                u64.radiationS1.TimePosition = l_math.random() * 60;
                u64.radiationS2.Volume = 0;
                u64.radiationS2.TimePosition = l_math.random() * 5;
                u64.radiationS1.Playing = true;
                u64.radiationS2.Playing = true;

                local function v688() -- Line: 5324
                    -- upvalues: u683 (copy), Humanoid (ref), u685 (ref), TweenService (ref), u64 (ref), TweenInfo_new_ret (copy), u686 (ref)
                    local Value = u683.Value;
                    local v687 = u683:GetAttribute("GeigerPerc") or 0;

                    if Humanoid.Health <= 0 then
                        u685:Disconnect();

                        return;
                    end;

                    TweenService:Create(u64.radiationImage, TweenInfo_new_ret, {
                        ImageTransparency = 1 - Value
                    }):Play();
                    local TweenInfo_new_ret2 = TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);

                    if v687 >= 0.7 then
                        if not u686 then
                            u686 = true;
                            TweenService:Create(u64.radiationS2, TweenInfo_new_ret2, {
                                Volume = 0.4
                            }):Play();
                            TweenService:Create(u64.radiationS1, TweenInfo_new_ret2, {
                                Volume = 0
                            }):Play();
                        end;
                    elseif u686 ~= false then
                        u686 = false;
                        TweenService:Create(u64.radiationS1, TweenInfo_new_ret2, {
                            Volume = 1
                        }):Play();
                        TweenService:Create(u64.radiationS2, TweenInfo_new_ret2, {
                            Volume = 0
                        }):Play();
                    end;
                end;

                v688();
                u685 = u683.Changed:Connect(v688);
                u683:GetAttributeChangedSignal("GeigerPerc"):Connect(v688);
            end;

            local function Radiation_Off() -- Line: 5357
                -- upvalues: u64 (ref), TweenService (ref)
                if not u64.radiationed then
                    return;
                end;

                u64.radiationed = false;
                local TweenInfo_new_ret = TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.In);
                local TweenInfo_new_ret2 = TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
                local v689 = {
                    ImageTransparency = 1
                };

                if u64.radiationImage and u64.radiationImage.Parent then
                    TweenService:Create(u64.radiationImage, TweenInfo_new_ret, v689):Play();
                    game.Debris:AddItem(u64.radiationImage, 4);
                end;

                if u64.radiationS1 and u64.radiationS1.Parent then
                    game.Debris:AddItem(u64.radiationS1, 0.2);
                    TweenService:Create(u64.radiationS1, TweenInfo_new_ret2, {
                        Volume = 0
                    }):Play();
                end;

                if u64.radiationS2 and u64.radiationS2.Parent then
                    game.Debris:AddItem(u64.radiationS2, 0.2);
                    TweenService:Create(u64.radiationS2, TweenInfo_new_ret2, {
                        Volume = 0
                    }):Play();
                end;
            end;

            local function Smoke_On() -- Line: 5385
                -- upvalues: u37 (ref), u64 (ref), ReplicatedStorage (ref), u53 (ref), LocalPlayer (ref), TweenService (ref), u31 (ref)
                if u37 then
                    return;
                end;

                if u64.smokesc then
                    return;
                end;

                u64.smokesc = true;
                local u690 = ReplicatedStorage.Storage.GUIs.SmokeScreenGUI:Clone();
                u64.smokesc_gui = u690;
                table.insert(u53, u690);
                u690.Parent = LocalPlayer.PlayerGui;

                local function z(p691) -- Line: 5395
                    -- upvalues: TweenService (ref)
                    TweenService:Create(p691, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                        ImageTransparency = 0
                    }):Play();
                end;

                for _, child in pairs(u690:GetChildren()) do
                    if child:IsA("ImageLabel") then
                        z(child);
                    end;
                end;

                local function applySmokeColor(p692) -- Line: 5405
                    -- upvalues: u690 (copy)
                    if u690 and u690.Parent then
                        for _, child in pairs(u690:GetChildren()) do
                            if child:IsA("ImageLabel") then
                                child.ImageColor3 = p692;
                            end;
                        end;
                    end;
                end;

                task.delay(0.05, function() -- Line: 5415
                    -- upvalues: u690 (copy), u31 (ref), applySmokeColor (copy), u64 (ref)
                    if not (u690 and u690.Parent) then
                        return;
                    end;

                    local M_CharStats = u31.M_CharStats;
                    local u693;

                    if M_CharStats and M_CharStats:FindFirstChild("Currents") then
                        u693 = M_CharStats.Currents:FindFirstChild("SMMKE");
                    else
                        u693 = nil;
                    end;

                    if u693 then
                        local Attribute = u693:GetAttribute("SmokeColor");

                        if Attribute then
                            applySmokeColor(Attribute);
                        end;

                        u64.smokesc_attrCon = u693:GetAttributeChangedSignal("SmokeColor"):Connect(function() -- Line: 5428
                            -- upvalues: u693 (ref), applySmokeColor (ref)
                            local Attribute2 = u693:GetAttribute("SmokeColor");

                            if Attribute2 then
                                applySmokeColor(Attribute2);
                            end;
                        end);
                    end;
                end);
            end;

            local function Smoke_Off() -- Line: 5439
                -- upvalues: u64 (ref), TweenService (ref)
                if not u64.smokesc then
                    return;
                end;

                u64.smokesc = false;

                if u64.smokesc_attrCon then
                    u64.smokesc_attrCon:Disconnect();
                    u64.smokesc_attrCon = nil;
                end;

                if u64.smokesc_gui and u64.smokesc_gui.Parent then
                    local function v695(p694) -- Line: 5450
                        -- upvalues: TweenService (ref)
                        TweenService:Create(p694, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            ImageTransparency = 1
                        }):Play();
                    end;

                    game.Debris:AddItem(u64.smokesc_gui, 1);

                    for _, child in pairs(u64.smokesc_gui:GetChildren()) do
                        if child:IsA("ImageLabel") then
                            v695(child);
                        end;
                    end;
                end;
            end;

            local function DeathF() -- Line: 5462
                -- upvalues: l_tick (ref), u37 (ref), SetCoreGuiEnabled (ref), u31 (ref), l_pcall (ref), RunService (ref), u43 (ref), workspace_CurrentCamera (ref), NumberValue3 (ref), Humanoid (copy), LocalPlayer (ref), RageMode_Off (copy), Poison_Off (copy), Radiation_Off (copy), FrameworkStuff (ref), u558 (copy), DefaultReverbType (ref), u45 (ref), TweenService (ref), u38 (ref), u571 (ref), UISounds (ref), ReplicatedStorage (ref), Events (ref), Events2 (ref), l_math (ref), UserInputService (ref), l_spawn (ref), u563 (copy), Debris (ref), u53 (ref), HumanoidRootPart (copy), u55 (ref), Head (copy), Map (ref), WaitForChar (ref)
                l_tick();

                if u37 then
                    return;
                end;

                u37 = true;
                SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false, 3);
                u31.canSetChat = false;
                l_pcall(function() -- Line: 5471
                    -- upvalues: RunService (ref)
                    RunService:UnbindFromRenderStep("FP_BIND");
                end);
                u43 = false;
                _G.FP_BINDING = false;
                workspace_CurrentCamera.CameraType = Enum.CameraType.Custom;
                RunService.RenderStepped:Wait();
                u31.hH.Value = 0;
                NumberValue3.Value = 0;
                Humanoid.HipHeight = 0;
                Humanoid.CameraOffset = Vector3.new(0, 0, 0);
                Humanoid.NameDisplayDistance = 0;
                Humanoid.HealthDisplayDistance = 0;
                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, true);
                Humanoid:ChangeState(Enum.HumanoidStateType.Dead);
                l_pcall(function() -- Line: 5487
                    -- upvalues: LocalPlayer (ref)
                    LocalPlayer.PlayerGui.CoreGUI.XboxDropThing.Visible = false;
                end);
                RageMode_Off();
                Poison_Off();
                Radiation_Off();
                u31.activeTurnEffect:Stop();
                l_pcall(function() -- Line: 5498
                    -- upvalues: FrameworkStuff (ref), u558 (ref), Humanoid (ref)
                    FrameworkStuff.Boom:Play();
                    FrameworkStuff.Flatline:Play();

                    if u558:FindFirstChild("Head") and u558:FindFirstChild("Torso") then
                        FrameworkStuff.Flatline.TimePosition = 1.5;
                    end;

                    if not Humanoid:GetAttribute("NoDeathRagdoll") then
                        for _, v in pairs(Humanoid:GetPlayingAnimationTracks()) do
                            v:Stop(0.5);
                        end;
                    end;
                end);
                local v696 = u558:FindFirstChild("Head") and (u558.Head.Transparency <= 0.95 and u558.Head) or u558:FindFirstChild("Torso");

                if v696 then
                    workspace_CurrentCamera.CameraSubject = v696;
                end;

                DefaultReverbType = Enum.ReverbType.Bathroom;
                u45 = 0.5;

                if _G.NoDeathEFZ then
                    u31.effect2.Enabled = false;
                    u31.effect5.Enabled = false;
                    u31.eqA_1.Enabled = false;
                    u31.eqB_1.Enabled = false;
                else
                    u31.effect2.Enabled = true;
                    u31.effect5.Enabled = true;
                    u31.eqA_1.Enabled = true;
                    u31.eqB_1.Enabled = true;
                    u31.effect2.Saturation = -0.5;
                    u31.effect5.Size = 15;
                end;

                l_tick();
                local v697 = TweenService:Create(u31.effect2, TweenInfo.new(6, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                    Contrast = 0.5,
                    Brightness = -0.25
                });
                local v698 = TweenService:Create(u31.effect5, TweenInfo.new(6, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {
                    Size = 30
                });
                u31.sG_Tween = TweenService:Create(u31.eqA_1, TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
                    HighGain = -80,
                    MidGain = -80,
                    LowGain = -80
                });
                u31.sG_Tween2 = TweenService:Create(u31.eqB_1, TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
                    HighGain = -80,
                    MidGain = -80,
                    LowGain = -80
                });
                u31.sG_Tween:Play();
                u31.sG_Tween2:Play();
                local v699 = TweenService:Create(u31.effect2, TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0), {
                    Contrast = 0,
                    Saturation = 0,
                    Brightness = 0
                });
                local v700 = TweenService:Create(u31.effect5, TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0), {
                    Size = 0
                });
                v697:Play();
                v698:Play();
                u31.sG_Tween:Play();
                u31.sG_Tween2:Play();

                if u31.MobileControlsM then
                    u31.MobileControlsM.DiedFunction();
                end;

                task.spawn(function() -- Line: 5597
                    -- upvalues: LocalPlayer (ref), u558 (ref), Humanoid (ref)
                    task.wait(2.5);

                    if LocalPlayer.character == u558 then
                        task.wait(2.5);

                        if LocalPlayer.character == u558 then
                            Humanoid.NameDisplayDistance = 0;
                            Humanoid.HealthDisplayDistance = 0;
                        end;
                    end;
                end);

                if u38 then
                    u38:Destroy();
                end;

                u38 = FrameworkStuff.DeathGUI:Clone();
                _G.deathGUI = u38;
                l_spawn(function() -- Line: 5614, Name: DeathUI
                    -- upvalues: u571 (ref), u38 (ref), LocalPlayer (ref), TweenService (ref), UISounds (ref), ReplicatedStorage (ref), u558 (ref), Events (ref), l_pcall (ref), u31 (ref), Events2 (ref), l_math (ref), UserInputService (ref)
                    if u571 then
                        return;
                    end;

                    u38.Parent = LocalPlayer.PlayerGui;
                    _G.deathGUI = u38;
                    local Frame = u38:WaitForChild("Frame");
                    local Frame2 = Frame:WaitForChild("Frame2");
                    local ReportFrame = Frame:WaitForChild("ReportFrame");
                    local ReportFrame2 = Frame:WaitForChild("ReportFrame2");
                    local ReportFrame3 = Frame:WaitForChild("ReportFrame3");
                    local Label = Frame:WaitForChild("Label");
                    local UIGradient = Label:WaitForChild("UIGradient");
                    local TweenInfo_new_ret = TweenInfo.new(3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 0, false, 3);
                    local TweenInfo_new_ret2 = TweenInfo.new(7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 2.3);
                    local TweenInfo_new_ret3 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In);

                    if LocalPlayer:GetAttribute("NoRespawnUI") then
                        Label.Visible = false;
                    else
                        TweenService:Create(Label, TweenInfo_new_ret, {
                            TextTransparency = 0,
                            TextStrokeTransparency = 0.5
                        }):Play();
                        TweenService:Create(Label, TweenInfo.new(1.7, Enum.EasingStyle.Quint, Enum.EasingDirection.In, 0, false, 2.3), {
                            Position = UDim2.new(0.5, 0, 0.5, -75)
                        }):Play();
                    end;

                    local u701 = TweenService:Create(u38.BlackFrame, TweenInfo_new_ret, {
                        BackgroundTransparency = 0.3
                    });
                    u701:Play();
                    TweenService:Create(UIGradient, TweenInfo_new_ret2, {
                        Offset = Vector2.new(1, 0)
                    }):Play();
                    local u702 = {};
                    local u703 = false;

                    local function DDisconnect() -- Line: 5654
                        -- upvalues: u702 (copy)
                        for _, v in pairs(u702) do
                            if v then
                                v:Disconnect();
                            end;
                        end;
                    end;

                    local u704 = false;

                    for _, descendant in pairs(u38:GetDescendants()) do
                        if descendant:IsA("TextButton") then
                            table.insert(u702, descendant.MouseEnter:Connect(function() -- Line: 5664
                                -- upvalues: descendant (copy), UISounds (ref)
                                if descendant.Selectable then
                                    UISounds.hover:Play();
                                end;
                            end));
                            table.insert(u702, descendant.MouseButton1Down:Connect(function() -- Line: 5669
                                -- upvalues: descendant (copy), UISounds (ref)
                                if descendant.Selectable then
                                    UISounds.click:Play();
                                end;
                            end));
                        end;
                    end;

                    local function OnPlay() -- Line: 5677
                        -- upvalues: u704 (ref), u703 (ref), LocalPlayer (ref), ReplicatedStorage (ref), Frame2 (copy), u558 (ref), Events (ref), UIGradient (copy), DDisconnect (copy), u701 (copy), TweenService (ref), u38 (ref), TweenInfo_new_ret3 (copy), Label (copy), l_pcall (ref)
                        if u704 or u703 then
                            return;
                        end;

                        if LocalPlayer:GetAttribute("RespawningPaused") or ReplicatedStorage.Values.RespawningDisabled.Value then
                            u704 = true;
                            Frame2.RespawnButton.Selectable = false;
                            Frame2.RespawnButton.Active = false;
                            Frame2.RespawnButton.Text = "Paused";

                            repeat
                                task.wait(0.35);
                            until not (ReplicatedStorage.Values.RespawningDisabled.Value or LocalPlayer:GetAttribute("RespawningPaused"));

                            u704 = false;
                            Frame2.RespawnButton.Selectable = true;
                            Frame2.RespawnButton.Active = true;

                            if LocalPlayer.Character ~= u558 and (LocalPlayer.Character and LocalPlayer.Character.Parent) then
                                return;
                            end;
                        end;

                        u703 = true;
                        local v705 = Events.DeathRespawn:InvokeServer("KMG4R904", nil);
                        u703 = false;

                        if v705 and (UIGradient and UIGradient.Parent) then
                            u704 = true;
                            DDisconnect();
                            Frame2.RespawnButton.Selectable = false;
                            Frame2.RespawnButton.Active = false;
                            Frame2.RespawnButton.Text = "Respawning";

                            if u701 then
                                u701:Cancel();
                            end;

                            TweenService:Create(u38.BlackFrame, TweenInfo_new_ret3, {
                                BackgroundTransparency = 0
                            }):Play();
                            TweenService:Create(Frame2.RespawnButton, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 0, true), {
                                BackgroundColor3 = Color3.new(1, 1, 1)
                            }):Play();
                            task.delay(1, function() -- Line: 5718
                                -- upvalues: Frame2 (ref)
                                if Frame2.Parent then
                                    Frame2.RespawnButton.Visible = false;
                                end;
                            end);

                            for _, v in pairs({
                                Label,
                                Frame2.RespawnButton,
                                Frame2.ReportButton,
                                Frame2.Distance,
                                Frame2.DistanceTitle,
                                Frame2.Killer,
                                Frame2.KillerTitle,
                                Frame2.Weapon,
                                Frame2.WeaponTitle,
                                Frame2.ReportButton,
                                Frame2.MenuButton
                            }) do
                                local v706 = {
                                    TextTransparency = 1,
                                    TextStrokeTransparency = 1
                                };

                                if v == Frame2.ReportButton or v == Frame2.MenuButton then
                                    v706.BackgroundTransparency = 1;
                                end;

                                TweenService:Create(v, TweenInfo_new_ret3, v706):Play();
                            end;

                            Frame2.SettingsButton.BackgroundTransparency = 1;
                            TweenService:Create(Frame2.SettingsButton, TweenInfo_new_ret3, {
                                ImageTransparency = 1
                            }):Play();
                            l_pcall(function() -- Line: 5742
                                -- upvalues: u38 (ref), Frame2 (ref), TweenService (ref), TweenInfo_new_ret3 (ref)
                                require(game:GetService("ReplicatedStorage").NewModules.Client.Extensions.DeathRecapUI).Hide(u38);

                                for _, v in ipairs({ "FinisherTitle", "Finisher" }) do
                                    local v707 = Frame2:FindFirstChild(v);

                                    if v707 then
                                        TweenService:Create(v707, TweenInfo_new_ret3, {
                                            TextTransparency = 1,
                                            TextStrokeTransparency = 1
                                        }):Play();
                                    end;
                                end;
                            end);
                        end;
                    end;

                    local function HandleReportS() -- Line: 5752
                        -- upvalues: u31 (ref), l_pcall (ref), Frame2 (copy), Label (copy), ReportFrame (copy), ReportFrame2 (copy), ReportFrame3 (copy), u38 (ref), UISounds (ref), Events (ref), Frame (copy), Events2 (ref), u702 (copy)
                        local u708 = 0;
                        local u709 = false;
                        local u710 = false;
                        local u711 = u31.DiedData and u31.DiedData.canReport ~= nil;
                        local u712 = nil;
                        local u713 = false;
                        local u714 = nil;
                        local u715 = nil;
                        l_pcall(function() -- Line: 5760
                            -- upvalues: u712 (ref), u713 (ref)
                            u712 = require(game:GetService("ReplicatedStorage").NewModules.Client.Extensions.DeathRecapUI);
                            u713 = u712.NEW_REPORT == true;
                        end);

                        if u713 then
                            u711 = u712.HasReportTargets(u31.DiedData and u31.DiedData.Recap);
                        end;

                        local u716 = true;

                        local function UpdateCanReport() -- Line: 5773
                            -- upvalues: u711 (ref), u710 (ref), Frame2 (ref)
                            if u711 and not u710 then
                                Frame2.ReportButton.TextTransparency = 0;
                                Frame2.ReportButton.BackgroundTransparency = 0.5;
                                Frame2.ReportButton.Selectable = true;

                                return;
                            end;

                            Frame2.ReportButton.TextTransparency = 0.5;
                            Frame2.ReportButton.BackgroundTransparency = 0.75;
                            Frame2.ReportButton.Selectable = false;
                        end;

                        local function OpenReport() -- Line: 5785
                            -- upvalues: u711 (ref), u710 (ref), u713 (ref), u715 (ref), Frame2 (ref), Label (ref), ReportFrame (ref)
                            if not u711 or u710 then
                                return;
                            end;

                            if u713 and u715 then
                                Frame2.Visible = false;
                                Label.Visible = false;
                                u715();

                                return;
                            end;

                            Frame2.Visible = false;
                            Label.Visible = false;
                            ReportFrame.Visible = true;
                        end;

                        local function CancelReport1() -- Line: 5800
                            -- upvalues: u709 (ref), Frame2 (ref), Label (ref), ReportFrame (ref), ReportFrame2 (ref), ReportFrame3 (ref), u712 (ref), l_pcall (ref), u38 (ref), u714 (ref)
                            if u709 then
                                return;
                            end;

                            Frame2.Visible = true;
                            Label.Visible = true;
                            ReportFrame.Visible = false;
                            ReportFrame2.Visible = false;
                            ReportFrame3.Visible = false;
                            ReportFrame.SuspectButton.Text = "";
                            ReportFrame.AbuseButton.Text = "";
                            ReportFrame.InfoBox.Text = "";

                            if u712 and u712.CloseReport then
                                l_pcall(u712.CloseReport, u38);
                            end;

                            u714 = nil;
                        end;

                        local function CancelReport2() -- Line: 5817
                            -- upvalues: u709 (ref), UpdateCanReport (copy), ReportFrame2 (ref), ReportFrame (ref), u713 (ref), u712 (ref), u38 (ref), ReportFrame3 (ref)
                            if u709 then
                                return;
                            end;

                            UpdateCanReport();
                            ReportFrame2.Visible = false;
                            ReportFrame.Visible = not u713;

                            if u713 and u712 then
                                u712.ShowReport(u38, true);
                            end;

                            ReportFrame3.Visible = false;
                        end;

                        local function SubmitReport1() -- Line: 5828
                            -- upvalues: u716 (ref), ReportFrame2 (ref), ReportFrame (ref)
                            if not u716 then
                                return;
                            end;

                            ReportFrame2.Visible = true;
                            ReportFrame.Visible = false;
                        end;

                        local function EndReport(p717, u718) -- Line: 5835
                            -- upvalues: u716 (ref), u713 (ref), ReportFrame2 (ref), ReportFrame (ref), Frame2 (ref), UISounds (ref), ReportFrame3 (ref), UpdateCanReport (copy)
                            if not (u716 or u713) then
                                return;
                            end;

                            ReportFrame2.Visible = false;
                            ReportFrame.Visible = false;
                            Frame2.Visible = false;

                            if p717 then
                                UISounds.BEEP:Play();
                                ReportFrame3.TextBox.Visible = true;
                                ReportFrame3.Size = UDim2.new(0, 300, 0, 170);
                                ReportFrame3.Desc.Text = "Your report has been submitted.\n\nFor a faster response or if you have more info to provide, create a ticket in our Communications Server giving the ID below:";
                                ReportFrame3.Desc.TextColor3 = Color3.fromRGB(120, 185, 122);
                                ReportFrame3.TextBox.Text = u718;
                                ReportFrame3.TextBox:GetPropertyChangedSignal("Text"):Connect(function() -- Line: 5853
                                    -- upvalues: ReportFrame3 (ref), u718 (copy)
                                    ReportFrame3.TextBox.Text = u718;
                                end);
                                warn("Report submitted: " .. u718);
                            else
                                UISounds.error:Play();
                                ReportFrame3.TextBox.Visible = false;
                                ReportFrame3.Size = UDim2.new(0, 200, 0, 90);
                                ReportFrame3.Desc.Text = "Error processing report";
                                ReportFrame3.Desc.TextColor3 = Color3.fromRGB(185, 112, 112);
                                warn("Report failed to submit");
                            end;

                            UpdateCanReport();
                            ReportFrame3.Visible = true;
                        end;

                        local function SubmitReportFull() -- Line: 5873
                            -- upvalues: u709 (ref), u716 (ref), u713 (ref), u714 (ref), Events (ref), u708 (ref), ReportFrame (ref), u710 (ref), EndReport (copy)
                            if u709 or not (u716 or u713) then
                                return;
                            end;

                            if u713 and not u714 then
                                return;
                            end;

                            u709 = true;
                            local v719;

                            if u713 then
                                v719 = Events.FL_IGRBR:InvokeServer(nil, u714);
                            else
                                v719 = Events.FL_IGRBR:InvokeServer(nil, u708, ReportFrame.InfoBox.Text);
                            end;

                            u710 = true;
                            u709 = false;

                            if v719 then
                                EndReport(true, v719);

                                return;
                            end;

                            EndReport(false);
                        end;

                        local function InfoChanged() -- Line: 5894
                            -- upvalues: ReportFrame (ref), u708 (ref), u716 (ref)
                            local string_len_ret = string.len(ReportFrame.InfoBox.Text);
                            local v720 = string_len_ret <= 50;
                            u716 = v720 and (u708 == 1 and true or u708 == 2);
                            ReportFrame.InfoBox.TextLabel.Text = string_len_ret .. "/" .. 50;
                            ReportFrame.InfoBox.TextLabel.TextColor3 = v720 and Color3.fromRGB(148, 148, 148) or Color3.fromRGB(148, 0, 0);
                            ReportFrame.InfoBox.TextColor3 = v720 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(255, 0, 0);
                            ReportFrame.SubmitButton.BackgroundTransparency = u716 and 0.5 or 0.75;
                            ReportFrame.SubmitButton.TextTransparency = u716 and 0 or 0.5;
                            ReportFrame.SubmitButton.Selectable = u716;
                        end;

                        local function SetReportMode(p721) -- Line: 5911
                            -- upvalues: ReportFrame (ref), u708 (ref), InfoChanged (copy)
                            if p721 == 1 then
                                ReportFrame.SuspectButton.Text = "⬜";
                                ReportFrame.AbuseButton.Text = "";
                            else
                                ReportFrame.SuspectButton.Text = "";
                                ReportFrame.AbuseButton.Text = "⬜";
                            end;

                            u708 = p721;
                            InfoChanged();
                        end;

                        u715 = function() -- Line: 5924
                            -- upvalues: u712 (ref), u38 (ref), u31 (ref), u714 (ref), ReportFrame2 (ref), CancelReport1 (copy)
                            u712.OpenReport(u38, u31.DiedData and u31.DiedData.Recap, {
                                onSubmit = function(p722) -- Line: 5926, Name: onSubmit
                                    -- upvalues: u714 (ref), u712 (ref), u38 (ref), ReportFrame2 (ref)
                                    u714 = p722;
                                    u712.ShowReport(u38, false);
                                    ReportFrame2.Visible = true;
                                end,

                                onCancel = CancelReport1
                            });
                        end;

                        local function OpenSettings() -- Line: 5936
                            -- upvalues: Frame (ref), Events2 (ref)
                            Frame.Visible = false;
                            Events2.ToggleSettingsUI:Fire(true);
                        end;

                        table.insert(u702, Frame2.ReportButton.MouseButton1Down:Connect(OpenReport));
                        table.insert(u702, Frame2.MenuButton.MouseButton1Down:Connect(function() -- Line: 5943
                            -- upvalues: Events2 (ref)
                            Events2.ToggleReturnMenu:Fire();
                        end));
                        table.insert(u702, Frame2.SettingsButton.MouseButton1Down:Connect(OpenSettings));
                        table.insert(u702, Events2.SettingsClosed.Event:Connect(function() -- Line: 5947
                            -- upvalues: Frame (ref)
                            Frame.Visible = true;
                        end));
                        table.insert(u702, ReportFrame.SuspectButton.MouseButton1Down:Connect(function() -- Line: 5951
                            -- upvalues: SetReportMode (copy)
                            SetReportMode(1);
                        end));
                        table.insert(u702, ReportFrame.AbuseButton.MouseButton1Down:Connect(function() -- Line: 5954
                            -- upvalues: SetReportMode (copy)
                            SetReportMode(2);
                        end));
                        local PropertyChangedSignal = ReportFrame.InfoBox:GetPropertyChangedSignal("Text");
                        table.insert(u702, PropertyChangedSignal:Connect(InfoChanged));
                        table.insert(u702, ReportFrame.CancelButton.MouseButton1Down:Connect(CancelReport1));
                        table.insert(u702, ReportFrame.SubmitButton.MouseButton1Down:Connect(SubmitReport1));
                        table.insert(u702, ReportFrame2.CancelButton.MouseButton1Down:Connect(CancelReport2));
                        table.insert(u702, ReportFrame2.SubmitButton.MouseButton1Down:Connect(SubmitReportFull));
                        table.insert(u702, ReportFrame3.CancelButton.MouseButton1Down:Connect(CancelReport1));
                        InfoChanged();
                        CancelReport1();
                        UpdateCanReport();
                    end;

                    task.delay(4 - u31.RESINC_V, function() -- Line: 5970
                        -- upvalues: u31 (ref), u571 (ref), LocalPlayer (ref), u38 (ref), Frame2 (copy), l_pcall (ref), l_math (ref), HandleReportS (copy), u702 (copy), OnPlay (copy), UserInputService (ref), DDisconnect (copy)
                        if not u31.DiedData then
                            for i = 1, 10 do
                                if u31.DiedData or u571 then
                                    break;
                                end;

                                task.wait(1);
                                local _ = i;
                            end;
                        end;

                        if not LocalPlayer:GetAttribute("NoRespawnUI") and (u38 and (u38.Parent and not (u571 and LocalPlayer.Character))) then
                            local v723 = u31.DiedData and u31.DiedData.KillDistance;
                            local v724 = u31.DiedData and u31.DiedData.WeaponName;
                            Frame2.Killer.Text = u31.DiedData and u31.DiedData.KillerName or "N/A";
                            Frame2.Distance.Text = v723 or "N/A";
                            Frame2.Weapon.Text = v724 or "N/A";
                            Frame2.Weapon.Text = string.upper(Frame2.Weapon.Text);
                            local u725 = 0;
                            l_pcall(function() -- Line: 5992
                                -- upvalues: u31 (ref), Frame2 (ref), u725 (ref), l_math (ref)
                                local v726 = u31.DiedData and u31.DiedData.Recap;
                                local v727;

                                if v726 then
                                    v727 = v726.attackers;
                                else
                                    v727 = v726;
                                end;

                                local v728;

                                if v726 then
                                    v728 = v726.downer;
                                else
                                    v728 = v726;
                                end;

                                local v729;

                                if v726 then
                                    v729 = v726.finisher;
                                else
                                    v729 = v726;
                                end;

                                local v730 = {
                                    { Frame2.KillerTitle, Frame2.Killer },
                                    { Frame2.WeaponTitle, Frame2.Weapon },
                                    { Frame2.DistanceTitle, Frame2.Distance }
                                };

                                if v727 and (v728 and (v729 and (v728 ~= v729 and (v727[v728] and v727[v729])))) then
                                    Frame2.KillerTitle.Text = "DOWNED BY:";

                                    local function at(p731) -- Line: 5999
                                        local v732 = tostring(p731);

                                        return v732 == "[REDACTED]" and v732 and v732 or "@" .. v732;
                                    end;

                                    Frame2.Killer.Text = at(v727[v728].name);
                                    local v733 = Frame2.KillerTitle:Clone();
                                    v733.Name = "FinisherTitle";
                                    v733.Text = "FINISHED BY:";
                                    v733.Parent = Frame2;
                                    local v734 = Frame2.Killer:Clone();
                                    v734.Name = "Finisher";
                                    v734.Text = at(v727[v729].name);
                                    v734.Parent = Frame2;

                                    for _, v in ipairs(v726.hits or {}) do
                                        if v.dn then
                                            Frame2.Weapon.Text = string.upper((tostring(v.w or "N/A")));
                                            Frame2.Distance.Text = v.r and tostring(v.r) .. " STUDS" or "N/A";
                                        end;
                                    end;

                                    v730 = {
                                        { Frame2.KillerTitle, Frame2.Killer },
                                        { v733, v734 },
                                        { Frame2.WeaponTitle, Frame2.Weapon },
                                        { Frame2.DistanceTitle, Frame2.Distance }
                                    };
                                    u725 = 20;

                                    for _, v in ipairs({
                                        Frame2.RespawnButton,
                                        Frame2.ReportButton,
                                        Frame2.SettingsButton,
                                        Frame2.MenuButton
                                    }) do
                                        v.Position = v.Position + UDim2.fromOffset(0, u725);
                                    end;
                                end;

                                local v735 = 0;

                                for _, v in ipairs(v730) do
                                    v735 = l_math.max(v735, v[2].TextBounds.X);
                                end;

                                local v736 = l_math.max(0, v735 - 160);

                                for i, v in ipairs(v730) do
                                    local v737 = -30 + (i - 1) * 20;
                                    v[1].Position = UDim2.new(0.5, -85 - l_math.floor(v736 / 2), 0.5, v737);
                                    v[2].Position = UDim2.new(0.5, l_math.ceil(v736 / 2) + 50, 0.5, v737);
                                end;
                            end);
                            HandleReportS();
                            l_pcall(function() -- Line: 6027
                                -- upvalues: u31 (ref), u38 (ref), Frame2 (ref), u725 (ref)
                                local v738 = u31.DiedData and u31.DiedData.Recap;

                                if v738 then
                                    require(game:GetService("ReplicatedStorage").NewModules.Client.Extensions.DeathRecapUI).Show(u38, v738, {
                                        buttonParent = Frame2,
                                        buttonShift = u725
                                    });
                                end;
                            end);
                            Frame2.Visible = true;
                            Frame2.RespawnButton.Visible = true;
                            Frame2.RespawnButton.TextSize = 20;
                            Frame2.RespawnButton.Selectable = false;
                            Frame2.RespawnButton.Active = false;
                            Frame2.RespawnButton.Text = "Respawn in: 0s";

                            if not (u38 and (u38.Parent and not u571)) then
                                return;
                            end;

                            Frame2.RespawnButton.Active = true;
                            Frame2.RespawnButton.Selectable = true;

                            if _G.InputType == 1 then
                                Frame2.RespawnButton.Text = "Respawn [E]";
                            elseif _G.InputType == 2 then
                                Frame2.RespawnButton.Text = "Respawn <font color=\"rgb(255,165,0)\">[Y]</font>";
                            else
                                Frame2.RespawnButton.Text = "Respawn";
                            end;

                            Frame2.RespawnButton.TextSize = 25;
                            table.insert(u702, Frame2.RespawnButton.MouseButton1Down:Connect(OnPlay));
                            table.insert(u702, UserInputService.InputBegan:Connect(function(p739, p740) -- Line: 6076
                                -- upvalues: Frame2 (ref), OnPlay (ref)
                                if p740 then
                                    return;
                                end;

                                if not Frame2.Visible then
                                    return;
                                end;

                                if p739.KeyCode == Enum.KeyCode.E or p739.KeyCode == Enum.KeyCode.ButtonY then
                                    OnPlay();
                                end;
                            end));
                            table.insert(u702, LocalPlayer.CharacterAdded:Connect(DDisconnect));
                        end;
                    end);
                end);
                workspace_CurrentCamera.CameraType = Enum.CameraType.Scriptable;
                local NumberValue5 = Instance.new("NumberValue", u563.FOVs);
                NumberValue5.Value = 0;
                TweenService:Create(NumberValue5, TweenInfo.new(7, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
                    Value = 15
                }):Play();
                local NumberValue6 = Instance.new("NumberValue");
                TweenService:Create(NumberValue6, TweenInfo.new(7, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                    Value = 15
                }):Play();
                Debris:AddItem(NumberValue6);
                local Part2 = Instance.new("Part");
                Part2.CanCollide = false;
                Part2.CanTouch = false;
                Part2.Transparency = 1;
                Part2.CFrame = workspace_CurrentCamera.CFrame;
                Part2.Parent = u558;
                local BodyGyro = Instance.new("BodyGyro");
                BodyGyro.MaxTorque = Vector3.new(1000, 1000, 1000);
                BodyGyro.CFrame = workspace_CurrentCamera.CFrame;
                BodyGyro.Parent = Part2;
                local BodyPosition = Instance.new("BodyPosition");
                BodyPosition.MaxForce = Vector3.new(10000, 10000, 10000);
                BodyPosition.Position = workspace_CurrentCamera.CFrame.p;
                BodyPosition.Parent = Part2;
                table.insert(u53, Part2);
                local p = workspace_CurrentCamera.CFrame.p;
                l_tick();

                while true do
                    RunService.Heartbeat:Wait();

                    if not _G.NoDeathEFZ and (HumanoidRootPart and HumanoidRootPart.Parent) then
                        l_pcall(function() -- Line: 6122
                            -- upvalues: u55 (ref)
                            u55:Cancel();
                        end);
                        local Magnitude = (p - HumanoidRootPart.CFrame.p).Magnitude;

                        if Magnitude > 15 then
                            local Ray_new_ret = Ray.new(p, (Head.Position - p).Unit * (Magnitude / 4));
                            local v741;
                            v741, p = workspace:FindPartOnRayWithWhitelist(Ray_new_ret, {});
                        end;

                        local Ray_new_ret = Ray.new(p, (p + Vector3.new(0, NumberValue6.Value, 0) - p).Unit * (NumberValue6.Value + 1));
                        local _, v742 = workspace:FindPartOnRayWithWhitelist(Ray_new_ret, { Map });
                        local v743 = v742 - Vector3.new(0, 2, 0);
                        BodyGyro.CFrame = CFrame.new(workspace_CurrentCamera.CFrame.p, HumanoidRootPart.Position);
                        BodyPosition.Position = v743;
                        u55 = TweenService:Create(workspace_CurrentCamera, TweenInfo.new(0.05, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                            CFrame = Part2.CFrame
                        });
                        u55:Play();
                        _G.DeathEFZ_deathCamTing = u55;
                    end;

                    if u571 and not u37 then
                        _G.DeathEFZ_deathCamTing = nil;

                        if LocalPlayer.Character == u558 then
                            WaitForChar();
                        end;

                        v697:Pause();
                        v698:Pause();
                        v699:Play();
                        v700:Play();

                        return;
                    end;
                end;
            end;

            local u744 = nil;
            u577 = Humanoid.StateChanged:Connect(function(p745, p746) -- Line: 6164
                -- upvalues: u31 (ref), Humanoid (copy), l_math (ref), u744 (ref), AffectChar (ref), random (ref), Destroy (ref)
                u31.CharF.State = p746;

                if p746 == Enum.HumanoidStateType.FallingDown or p746 == Enum.HumanoidStateType.GettingUp then
                    Humanoid:ChangeState(Enum.HumanoidStateType.Running);
                end;

                if p746 ~= Enum.HumanoidStateType.Climbing then
                    if p745 == Enum.HumanoidStateType.Climbing then
                        Destroy(u744);
                    end;

                    return;
                end;

                local v747 = 8.5;
                local v748 = (v747 + l_math.clamp(1 - Humanoid.Health / Humanoid.MaxHealth, 0, v747) - 8.5) * 8.5;

                if u31.CharF.Currents.CLMB_SD then
                    for _, v in pairs(u31.CharF.Currents.CLMB_SD) do
                        v748 = v748 - v.Value;
                    end;
                end;

                u744 = AffectChar("SD", l_math.huge, random(), v748);
            end);
            u578 = Humanoid.Changed:Connect(function(p749) -- Line: 6193
                -- upvalues: l_time (ref), Humanoid (copy), u563 (copy), u597 (ref), u31 (ref), CheckIfFlinching (ref), u116 (ref), S_Get (ref), Torso (copy), CheckWater (ref), S_Take (ref), u598 (ref), u110 (ref), GVF (ref), ForceChar (ref), LocalPlayer (ref), HumanoidRootPart (copy), GetModelMass (ref), u558 (copy), CantS (ref)
                if p749 and p749 == "Jump" then
                    local v750 = l_time();
                    local v751 = 10;
                    local State = Humanoid:GetState();

                    if Humanoid.Health <= 0 or State == Enum.HumanoidStateType.Dead then
                        return;
                    end;

                    local v752 = State == Enum.HumanoidStateType.Swimming and 0 or v751;

                    if u563.Crouching.Value or (v750 < u597 + 1 or (u31.CharF.Currents.AJ or CheckIfFlinching())) then
                        Humanoid.Jump = false;

                        return;
                    end;

                    if u116() or v752 > S_Get() then
                        if S_Get() >= 45 and (not u598 and (u110() and (u116() and not GVF().Grabbed.Value))) then
                            u598 = true;
                            S_Take(55);
                            Humanoid.Jump = false;
                            ForceChar(LocalPlayer.character.HumanoidRootPart, (HumanoidRootPart.CFrame.UpVector + Vector3.new(0, 1.85, 0)) * GetModelMass(u558) * 150, 0.1);
                            task.delay(0.5, function() -- Line: 6238
                                -- upvalues: u598 (ref)
                                u598 = false;
                            end);
                        else
                            Humanoid.Jump = false;
                            CantS();
                        end;
                    else
                        if State == Enum.HumanoidStateType.Swimming then
                            v751 = CheckWater(true, false, CFrame.new(Torso.Position + Torso.CFrame.UpVector * 4), nil) and 0 or v751;
                            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false);
                            task.delay(0.5, function() -- Line: 6228
                                -- upvalues: Humanoid (ref)
                                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true);
                            end);
                        end;

                        S_Take(v751);
                    end;

                    u597 = v750;
                end;
            end);
            u579 = Humanoid.HealthChanged:Connect(function(p753) -- Line: 6250
                -- upvalues: Health (ref), u31 (ref), u563 (copy), DamageHitEffect (ref), u558 (copy), NumberValue3 (ref), Humanoid (copy), u571 (ref), DeathF (copy)
                if Health - p753 > 0.05 and (Health - p753 > 0.45 or (p753 == 0 or (u31.CharF.Currents.Bleeding or u31.CharF.Currents.Bleeding2))) then
                    local v754 = Health - p753;

                    if v754 >= 1 or not u563.Downed.Resisting.Value then
                        DamageHitEffect(u558, v754);
                    end;
                end;

                Health = p753;

                if p753 <= 0 and u558.Parent then
                    u31.hH.Value = 0;
                    NumberValue3.Value = 0;
                    Humanoid.HipHeight = 0;
                    Humanoid.CameraOffset = Vector3.new(0, 0, 0);
                    u571 = false;
                    DeathF();
                end;
            end);
            task.spawn(function() -- Line: 6281
                -- upvalues: Humanoid (copy), u31 (ref), NumberValue3 (ref), DeathF (copy)
                if Humanoid:GetState() == Enum.HumanoidStateType.Dead or Humanoid.Health <= 0 then
                    u31.hH.Value = 0;
                    NumberValue3.Value = 0;
                    Humanoid.HipHeight = 0;
                    Humanoid.CameraOffset = Vector3.new(0, 0, 0);
                    task.spawn(DeathF);
                end;
            end);
            u585 = Humanoid.Running:Connect(function(p755) -- Line: 6291
            end);
            u584 = u558.ChildAdded:Connect(function(p756) -- Line: 6295
                -- upvalues: AffectChar (ref), u31 (ref), RunService (ref), u558 (copy), l_pcall (ref), LocalPlayer (ref)
                if p756.ClassName == "Tool" then
                    if _G.InputType ~= 2 then
                        AffectChar("B", 0.15);
                    end;

                    if _G.InputType == 3 or _G.InputType == 2 then
                        local Attribute = p756:GetAttribute("canDrop");
                        u31.MobileControlsM.EnableButton("drop_item", Attribute);

                        if not Attribute then
                            l_pcall(function() -- Line: 6339
                                -- upvalues: LocalPlayer (ref)
                                LocalPlayer.PlayerGui.CoreGUI.XboxDropThing.Visible = false;
                            end);

                            return;
                        end;

                        local u757 = nil;
                        RunService.Heartbeat:Wait();

                        if p756 and p756.Parent then
                            u757 = p756.AncestryChanged:Connect(function(p758, p759) -- Line: 6312
                                -- upvalues: u757 (ref), RunService (ref), u558 (ref), u31 (ref), l_pcall (ref), LocalPlayer (ref)
                                u757:Disconnect();
                                RunService.Heartbeat:Wait();
                                local u760 = u558 and (u558.Parent and u31.CharF.Tool) and u31.CharF.Tool:GetAttribute("canDrop");
                                u31.MobileControlsM.EnableButton("drop_item", u760);
                                l_pcall(function() -- Line: 6325
                                    -- upvalues: LocalPlayer (ref), u760 (copy)
                                    local v761;

                                    if _G.InputType == 2 then
                                        v761 = u760;
                                    else
                                        v761 = false;
                                    end;

                                    LocalPlayer.PlayerGui.CoreGUI.XboxDropThing.Visible = v761;
                                end);
                            end);
                        end;

                        if _G.InputType == 2 then
                            l_pcall(function() -- Line: 6333
                                -- upvalues: LocalPlayer (ref)
                                LocalPlayer.PlayerGui.CoreGUI.XboxDropThing.Visible = true;
                            end);
                        end;

                        return;
                    end;

                    l_pcall(function() -- Line: 6345
                        -- upvalues: LocalPlayer (ref)
                        LocalPlayer.PlayerGui.CoreGUI.XboxDropThing.Visible = false;
                    end);
                end;
            end);

            local function updateLimbs() -- Line: 6353
                -- upvalues: u563 (copy), u31 (ref), u599 (ref), AffectChar (ref), l_math (ref), Destroy (ref), u600 (ref)
                if u563.HealthValues["Left Leg"].Broken.Value then
                    u31.ll_Brk = true;
                    local Value = u563.HealthValues["Left Leg"].Destroyed.Value;

                    if u599 or Value then
                        if u599 and Value then
                            Destroy(u599);
                            u599 = nil;
                        end;
                    else
                        u599 = AffectChar("SP", l_math.huge, l_math.random(), 0.84);
                    end;
                else
                    u31.ll_Brk = false;
                    Destroy(u599);
                    u599 = nil;
                end;

                if u563.HealthValues["Right Leg"].Broken.Value then
                    u31.rl_Brk = true;
                    local Value = u563.HealthValues["Right Leg"].Destroyed.Value;

                    if not (u600 or Value) then
                        u600 = AffectChar("SP", l_math.huge, l_math.random(), 0.84);

                        return;
                    end;

                    if u600 and Value then
                        Destroy(u600);
                        u600 = nil;
                    end;
                else
                    u31.rl_Brk = false;
                    Destroy(u600);
                    u600 = nil;
                end;
            end;

            updateLimbs();
            u590 = u563.HealthValues["Left Leg"].Broken.Changed:Connect(updateLimbs);
            u591 = u563.HealthValues["Right Leg"].Broken.Changed:Connect(updateLimbs);
            u592 = u563.HealthValues["Left Leg"].Destroyed.Changed:Connect(updateLimbs);
            u593 = u563.HealthValues["Right Leg"].Destroyed.Changed:Connect(updateLimbs);
            u594 = Events.OHNRGEE.OnClientEvent:Connect(updateLimbs);

            local function RSF() -- Line: 6393
                -- upvalues: u573 (ref), u575 (ref), u574 (ref), u31 (ref), S_Get (ref), HSRGEE (ref), LocalPlayer (ref), u110 (ref), u116 (ref), u563 (copy), l_math (ref), u572 (ref), S_Take (ref), Sprinting (copy)
                u573 = true;
                local v762 = u575;
                local os_clock_ret = os.clock();
                local v763 = 1;
                local v764 = false;

                while u573 and (u574 and (u575 == v762 and not u31.CharF.Currents.NRG)) do
                    task.wait(0.04);
                    local os_clock_ret2 = os.clock();
                    local v765 = os_clock_ret2 - os_clock_ret;

                    if not (u573 and (u574 and (u575 == v762 and not u31.CharF.Currents.NRG))) then
                        break;
                    end;

                    local v766, v767 = S_Get();

                    if v767 <= v766 then
                        break;
                    end;

                    local v768 = HSRGEE(LocalPlayer.Character);
                    v764 = v768 and true or v764;
                    local v769 = -12 * v765 * v763;

                    if u110() or (u116() or u563.Grabbing.Value) then
                        v769 = v769 / 2.5;
                    end;

                    if v764 then
                        v769 = v769 * 1.5;
                    end;

                    local v770 = l_math.max(0, v767 - v766);
                    u572 = S_Take(-l_math.min(-v769, v770));

                    if v768 and Sprinting.Value then
                        v763 = v763 + 20 * v765;
                    end;

                    os_clock_ret = os_clock_ret2;
                end;

                if u575 == v762 then
                    u573 = false;
                end;
            end;

            local u771 = false;

            local function SPRFunc() -- Line: 6433
                -- upvalues: u771 (ref), u574 (ref), S_Get (ref), Sprinting (copy), RagdollSwitch (copy), u563 (copy), Humanoid (copy), l_math (ref), S_Take (ref), SprintTing (ref)
                if u771 then
                    return;
                end;

                u771 = true;
                coroutine.wrap(function() -- Line: 6436
                    -- upvalues: u574 (ref), S_Get (ref), Sprinting (ref), RagdollSwitch (ref), u563 (ref), Humanoid (ref), l_math (ref), S_Take (ref), u771 (ref), SprintTing (ref)
                    local os_clock_ret = os.clock();

                    while u574 do
                        task.wait(0.04);
                        local os_clock_ret2 = os.clock();

                        if not u574 then
                            break;
                        end;

                        local v772, _ = S_Get();

                        if v772 <= 0 or (not Sprinting.Value or RagdollSwitch.Value) then
                            break;
                        end;

                        local v773 = 0.25;

                        if u563.Grabbing.Value then
                            v773 = v773 * 1.35;
                        end;

                        local Attribute = Humanoid:GetAttribute("ZSPRN_M");

                        if Attribute then
                            v773 = v773 * Attribute;
                        end;

                        S_Take((v773 + l_math.clamp(1 - Humanoid.Health / Humanoid.MaxHealth, 0, v773 * 0.55)) * ((os_clock_ret2 - os_clock_ret) / 0.05));
                        os_clock_ret = os_clock_ret2;
                    end;

                    u771 = false;

                    if u574 then
                        SprintTing(false);
                        Sprinting.Value = false;
                    end;
                end)();
            end;

            u75 = function() -- Line: 6469
                -- upvalues: S_Get (ref), u573 (ref), HSRGEE (ref), LocalPlayer (ref), u31 (ref), u572 (ref), random (ref), u575 (ref), u563 (copy), u574 (ref), RSF (copy)
                local v774, v775 = S_Get();

                if u573 and (HSRGEE(LocalPlayer.Character) and not u31.CharF.Currents.NRG) then
                    u572 = v774;

                    return;
                end;

                if not (v774 >= u572 and (v774 >= v775 or u573) or u31.CharF.Currents.NRG) then
                    local u776 = random();
                    u575 = u776;
                    u573 = false;
                    u572 = v774;
                    coroutine.wrap(function() -- Line: 6485
                        -- upvalues: HSRGEE (ref), LocalPlayer (ref), u563 (ref), u574 (ref), u575 (ref), u776 (copy), u573 (ref), u31 (ref), random (ref), RSF (ref)
                        local v777 = u563 and HSRGEE(LocalPlayer.Character) and -1 or 1.25;
                        task.wait(v777);

                        if u574 and (u575 == u776 and not (u573 or u31.CharF.Currents.NRG)) then
                            u575 = random();
                            RSF();
                        end;
                    end)();
                end;

                local v778, _ = S_Get();
                u572 = v778;
            end;

            u580 = NumberValue4:GetPropertyChangedSignal("Value"):Connect(u75);

            local function ACCL_DO(p779) -- Line: 6502
                -- upvalues: u31 (ref), AffectChar (ref), l_math (ref)
                u31.ACCL = {};
                u31.ACCL.SD = AffectChar("SD", l_math.huge, "ACCLD", 0);
                u31.ACCL.V = p779;
                u31.ACCL.M = p779:WaitForChild("M").Value;
                u31.ACCL.R = p779.Value;
            end;

            local function nC(p780) -- Line: 6511
                -- upvalues: u575 (ref), random (ref), u573 (ref), RageMode_On (copy), Poison_On (copy), Smoke_On (copy), ACCL_DO (copy), Radiation_On (copy), FrostOverlay_On (copy)
                if p780.Name == "NRG" then
                    u575 = random();
                    u573 = false;

                    return;
                end;

                if p780.Name == "RMMM" then
                    RageMode_On(p780);

                    return;
                end;

                if p780.Name == "POIZSKRATA" then
                    Poison_On(p780);

                    return;
                end;

                if p780.Name == "FROSTSKRATA" then
                    Poison_On(p780, true);

                    return;
                end;

                if p780.Name == "FLAMESKRATA" then
                    Poison_On(p780, nil, true);

                    return;
                end;

                if p780.Name == "SMMKE" then
                    Smoke_On();

                    return;
                end;

                if p780.Name == "ACCLTRR" then
                    ACCL_DO(p780);

                    return;
                end;

                if p780.Name == "RADIATIONPOIS" then
                    Radiation_On(p780);

                    return;
                end;

                if p780.Name == "FrostOverlay" then
                    FrostOverlay_On(p780);
                end;
            end;

            u581 = u563.Currents.ChildAdded:Connect(nC);

            for _, child in pairs(u563.Currents:GetChildren()) do
                nC(child);
            end;

            u582 = u563.Currents.ChildRemoved:Connect(function(p781) -- Line: 6539
                -- upvalues: u75 (ref), RageMode_Off (copy), Poison_Off (copy), RunService (ref), u31 (ref), Smoke_Off (copy), Destroy (ref), Radiation_Off (copy), FrostOverlay_Off (copy)
                if p781.Name == "NRG" then
                    u75();

                    return;
                end;

                if p781.Name == "RMMM" then
                    RageMode_Off();

                    return;
                end;

                if p781.Name == "POIZSKRATA" then
                    Poison_Off();

                    return;
                end;

                if p781.Name == "FROSTSKRATA" then
                    Poison_Off();

                    return;
                end;

                if p781.Name == "FLAMESKRATA" then
                    Poison_Off();

                    return;
                end;

                if p781.Name == "SMMKE" then
                    RunService.Heartbeat:Wait();

                    if not u31.CharF.Currents.SMMKE then
                        Smoke_Off();
                    end;
                else
                    if p781.Name == "ACCLTRR" and not u31.CharF.Currents.ACCLTRR then
                        if u31.ACCL and u31.ACCL.SD then
                            Destroy(u31.ACCL.SD);
                        end;

                        u31.ACCL = nil;

                        return;
                    end;

                    if p781.Name == "RADIATIONPOIS" then
                        Radiation_Off();

                        return;
                    end;

                    if p781.Name == "FrostOverlay" then
                        FrostOverlay_Off(p781);
                    end;
                end;
            end);
            task.spawn(function() -- Line: 6567
                -- upvalues: RageMode_Off (copy), Poison_Off (copy), Radiation_Off (copy), Smoke_Off (copy), FrostOverlay_Off (copy)
                task.spawn(RageMode_Off);
                task.spawn(Poison_Off);
                task.spawn(Radiation_Off);
                task.spawn(Smoke_Off);
                task.spawn(FrostOverlay_Off);
            end);
            u588 = u558.ChildRemoved:Connect(function(p782) -- Line: 6575
                -- upvalues: RunService (ref), u31 (ref), u558 (copy)
                if p782:IsA("Tool") then
                    for _, descendant in pairs(p782:GetDescendants()) do
                        if descendant:IsA("BasePart") then
                            descendant.LocalTransparencyModifier = 0;
                        end;
                    end;

                    RunService.RenderStepped:Wait();
                    u31.CharF.Tool = u558:FindFirstChildOfClass("Tool");
                end;
            end);
            u589 = u558.ChildAdded:Connect(function(p783) -- Line: 6589
                -- upvalues: u31 (ref), u558 (copy)
                if p783:IsA("Tool") then
                    u31.CharF.Tool = p783;

                    if u31.CharF.toolCon then
                        u31.CharF.toolCon:Disconnect();
                    end;

                    u31.CharF.toolCon = p783.AncestryChanged:Connect(function(p784, p785) -- Line: 6596
                        -- upvalues: u31 (ref), u558 (ref)
                        u31.CharF.toolCon:Disconnect();
                        u31.CharF.toolCon = nil;
                        local CharF = u31.CharF;
                        local v786 = u558 and u558.Parent and u558:FindFirstChildOfClass("Tool");
                        CharF.Tool = v786;
                    end);
                end;
            end);

            local function combatTing() -- Line: 6604
                -- upvalues: Events2 (ref), InCombatCheck (ref), LocalPlayer (ref)
                Events2.InCombat:Fire(InCombatCheck(LocalPlayer, true));
            end;

            u586 = u563.Tags.ChildAdded:Connect(combatTing);
            u587 = u563.Tags.ChildRemoved:Connect(combatTing);
            u583 = Sprinting:GetPropertyChangedSignal("Value"):Connect(function(p787) -- Line: 6611
                -- upvalues: Sprinting (copy), SPRFunc (copy)
                if Sprinting.Value then
                    SPRFunc();
                end;
            end);
            u576 = u558.AncestryChanged:Connect(function(p788, p789) -- Line: 6617
                -- upvalues: u571 (ref), disconnect (copy)
                if not p789 then
                    u571 = true;
                    disconnect();
                end;
            end);
        end;

        local function SetUp() -- Line: 6625
            -- upvalues: u65 (ref), DeepCopy (copy), u69 (copy), ReplicatedStorage (copy), LocalPlayer (copy), Players (copy), BindableEvent (copy), Events (copy), Map (copy), Filter (copy), Characters (copy), Debris2 (copy), u54 (ref), u247 (copy), u244 (copy), u251 (copy), u110 (ref), u116 (ref), AffectChar (copy), CheckIfCan (copy), cTag (copy), gTag (copy), CheckIfFlinching (copy), TeamCheck (copy), WaitForChar (copy), GVF (copy), HSRGEE (copy), GamepassCheck (copy), PromptGamepass (copy), PromptProductPurchase (copy), InCombatCheck (copy), LimbCheck (copy), LimbHealthFull (copy), RagdollChar (copy), ForceChar (copy), IsArmored (copy), NewModules (copy), UserInputService (copy), BodyGyroFunc (copy), u31 (copy), l_tick (copy), RunService (copy), u27 (copy), Events2 (copy), SetCoreGuiEnabled (copy), DisplayItemsChangedFunc (copy), ClientPackagesChangedFunc (copy), MOVZREP (copy), DoTweak (copy), GuiService (copy), l_pcall (copy), MonitorDisplayItems (copy), workspace_CurrentCamera (ref), PhysicsService (copy), l_math (copy), underGroundCheck (copy), MonitorSound (copy), CreateForce (copy), ShellShock (copy), Flashed (copy), StunGrenaded (copy), S_Take (copy), GetMousePoint (copy), RayHandler (copy), CheckDeviceType (copy), u34 (ref), u35 (ref), CheckInputType (ref), Destroyed (copy)
            u65 = DeepCopy(u69);
            _G.GSFFLDR = ReplicatedStorage.Storage.SouffleDir;
            _G.GSFFLDR.Name = "";
            _G.GSFFLDR.Parent = script;
            _G.GSFF_T = {};

            if not (LocalPlayer.Parent and Players:FindFirstChild(LocalPlayer.Name)) then
                script:Destroy();
            end;

            BindableEvent.Event:Connect(function() -- Line: 6650
                -- upvalues: Events (ref)
                Events.PlayerReset:FireServer(true, nil);
            end);
            LocalPlayer.AncestryChanged:Connect(function(p790, p791) -- Line: 6657
                -- upvalues: Map (ref), Filter (ref), Characters (ref), Debris2 (ref), ReplicatedStorage (ref)
                if not p791 then
                    if workspace:FindFirstChild("Map") then
                        Map:Destroy();
                    end;

                    if workspace:FindFirstChild("Filter") then
                        Filter:Destroy();
                    end;

                    if workspace:FindFirstChild("Characters") then
                        Characters:Destroy();
                    end;

                    if workspace:FindFirstChild("Debris") then
                        Debris2:Destroy();
                    end;

                    ReplicatedStorage:ClearAllChildren();
                    script:Destroy();
                end;
            end);
            u54 = Instance.new("Folder", Debris2);
            u54.Name = "ToClear";
            _G.FolderToClear = u54;
            _G.S_Take = u247;
            _G.S_Get = u244;
            _G.S_Check = u251;
            _G.DownedCheck = u110;
            _G.RagdollCheck = u116;
            _G.AffectChar = AffectChar;
            _G.CheckIfCan = CheckIfCan;
            _G.cTag = cTag;
            _G.gTag = gTag;
            _G.CheckIfFlinching = CheckIfFlinching;
            _G.TeamCheck = TeamCheck;
            _G.WaitForChar = WaitForChar;
            _G.GVF = GVF;
            _G.HSRGEE = HSRGEE;
            _G.GamepassCheck = GamepassCheck;
            _G.PromptGamepass = PromptGamepass;
            _G.PromptProductPurchase = PromptProductPurchase;
            _G.InCombatCheck = InCombatCheck;
            _G.LimbCheck = LimbCheck;
            _G.LimbHealthFull = LimbHealthFull;
            _G.RagdollChar = RagdollChar;
            _G.ForceChar = ForceChar;
            _G.IsArmoredCheck = IsArmored;
            _G.Compliance = require(NewModules.Shared.Configuration.Compliance);
            _G.SMains = {
                IsArmored = IsArmored
            };
            _G.IsAlive = false;

            function _G.M_MLCheck() -- Line: 6712
                -- upvalues: UserInputService (ref)
                return _G.isMouseLocked == true and true or UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter;
            end;

            function _G.DoBodyGyroFunc(p792) -- Line: 6719
                -- upvalues: LocalPlayer (ref), GVF (ref), BodyGyroFunc (ref)
                local Character = LocalPlayer.Character;
                local v793;

                if Character then
                    v793 = Character:FindFirstChild("HumanoidRootPart");
                else
                    v793 = Character;
                end;

                local v794;

                if Character then
                    v794 = Character:FindFirstChild("Humanoid");
                else
                    v794 = Character;
                end;

                BodyGyroFunc(Character, v793, v794, GVF(), p792);
            end;

            function _G.DoArmMovementReplicate(p795) -- Line: 6728
                -- upvalues: u31 (ref)
                u31.ForceArmMovRep = true;
                u31.ForceArmMovRep_Instant = p795;
            end;

            ReplicatedStorage:WaitForChild("Values", 5);
            ReplicatedStorage.Values.ServerTick.Changed:Connect(function() -- Line: 6735
                -- upvalues: ReplicatedStorage (ref), l_tick (ref)
                ReplicatedStorage.Values.ClientServerTick.Value = l_tick();
            end);
            ReplicatedStorage.Values.ClientServerTick.Value = l_tick();
            Events:WaitForChild("ChangeState").OnClientEvent:Connect(function(p796, p797, p798) -- Line: 6744
                -- upvalues: LocalPlayer (ref), RunService (ref)
                local v799 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid");

                if v799 then
                    for i = 1, p797 do
                        v799:ChangeState(p796, true);
                        RunService.Heartbeat:Wait();
                        local _ = i;
                    end;
                end;
            end);
            Events:WaitForChild("PurchaseFinished").OnClientEvent:Connect(function(p800, p801, p802) -- Line: 6756
                -- upvalues: u27 (ref)
                if p802 then
                    local BoolValue = Instance.new("BoolValue");
                    BoolValue.Name = p801;
                    BoolValue.Parent = u27.Gamepasses;
                end;
            end);
            Events:WaitForChild("GetGamepasses").OnClientEvent:Connect(function(p803) -- Line: 6764
                -- upvalues: u27 (ref)
                for _, v in pairs(p803) do
                    if not u27.Gamepasses:FindFirstChild(v) then
                        local BoolValue = Instance.new("BoolValue");
                        BoolValue.Name = v;
                        BoolValue.Parent = u27.Gamepasses;
                    end;
                end;
            end);
            Events:WaitForChild("UN_DWNTING").OnClientEvent:Connect(function(p804, p805) -- Line: 6774
                -- upvalues: LocalPlayer (ref), RunService (ref)
                local Character = LocalPlayer.Character;
                local v806;

                if Character then
                    v806 = Character:FindFirstChild("HumanoidRootPart");
                else
                    v806 = Character;
                end;

                if Character and v806 then
                    v806.CFrame = p804;
                    RunService.Heartbeat:Wait();
                    v806.CFrame = p804;
                    RunService.Heartbeat:Wait();
                end;
            end);
            Events:WaitForChild("SyncDoor").OnClientEvent:Connect(function(p807) -- Line: 6786
                -- upvalues: RunService (ref)
                for i = 1, 3 do
                    local _ = i;

                    for _, v in pairs(p807) do
                        local v808 = v[1];
                        local v809 = v[2];

                        if v808 and (v808.Parent and v808.Anchored) then
                            v808.CFrame = v809;
                        end;
                    end;

                    RunService.Heartbeat:Wait();
                end;
            end);

            local function HandlePostFX() -- Line: 6811
                local v810 = _G.GSettings and not _G.GSettings.PostFX;
                local v811 = workspace.Terrain:FindFirstChildOfClass("Clouds");

                if v811 then
                    v811.Enabled = not v810;
                end;

                for _, child in pairs(game.Lighting:GetChildren()) do
                    if child:GetAttribute("PostFX") == true then
                        child.Enabled = not v810;
                    end;
                end;
            end;

            local function HandleAdvancedMaterials() -- Line: 6829
                -- upvalues: u31 (ref), HandleAdvancedMaterials (copy)
                if u31.MaterialSwapLock then
                    u31.MaterialSwapPending = true;

                    return;
                end;

                local v812 = _G.GSettings and _G.GSettings.AdvancedMaterials and true or false;

                if not u31.MaterialVariants then
                    u31.MaterialVariants = {};
                    u31.MaterialVariantsOn = true;

                    for _, child in pairs(game:GetService("MaterialService"):GetChildren()) do
                        table.insert(u31.MaterialVariants, child);
                    end;
                end;

                if u31.MaterialVariantsOn == v812 then
                    return;
                end;

                u31.MaterialVariantsOn = v812;
                u31.MaterialSwapLock = true;
                u31.MaterialSwapPending = false;
                task.delay(3, function() -- Line: 6854
                    -- upvalues: u31 (ref), HandleAdvancedMaterials (ref)
                    u31.MaterialSwapLock = false;

                    if u31.MaterialSwapPending then
                        u31.MaterialSwapPending = false;
                        HandleAdvancedMaterials();
                    end;
                end);

                for _, v in pairs(u31.MaterialVariants) do
                    v.Parent = v812 and game:GetService("MaterialService") or nil;
                end;
            end;

            Events2:WaitForChild("SettingsChanged").Event:Connect(function(p813, p814) -- Line: 6867
                -- upvalues: u31 (ref), SetCoreGuiEnabled (ref), HandlePostFX (copy), HandleAdvancedMaterials (copy), DisplayItemsChangedFunc (ref), ClientPackagesChangedFunc (ref)
                if p813 == "Chat" then
                    u31.chatEn = p814;

                    if u31.canSetChat then
                        SetCoreGuiEnabled(Enum.CoreGuiType.Chat, p814);
                    end;
                else
                    if p813 == "PostFX" then
                        HandlePostFX();

                        return;
                    end;

                    if p813 == "AdvancedMaterials" then
                        HandleAdvancedMaterials();

                        return;
                    end;

                    if p813 == "DisplayItems" then
                        DisplayItemsChangedFunc(p814);

                        return;
                    end;

                    if p813 == "PlayerPackages" then
                        ClientPackagesChangedFunc(p814);
                    end;
                end;
            end);
            MOVZREP.OnClientEvent:Connect(function(p815, p816, p817, p818, p819, p820, p821, p822, p823) -- Line: 6888
                -- upvalues: DoTweak (ref)
                DoTweak(p815, p816, p817, p818, p819, p820, p821, p822, true, nil, p823);
            end);
            Events.NewHelmet.OnClientEvent:Connect(function(...) -- Line: 6892
                -- upvalues: ReplicatedStorage (ref), LocalPlayer (ref)
                local v824 = ReplicatedStorage.Storage.GUIs.HelmetOverlayGUI:Clone();
                v824.Parent = LocalPlayer.PlayerGui;
                v824:WaitForChild("SetUp"):Fire(...);
            end);
            Events.DiedDataa.OnClientEvent:Connect(function(p825) -- Line: 6900
                -- upvalues: u31 (ref)
                u31.DiedData = p825;
            end);
            LocalPlayer.Chatted:Connect(function(p826) -- Line: 6904
                -- upvalues: LocalPlayer (ref), GuiService (ref)
                if p826 == "/e avatar" then
                    local v827 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid");
                    local v828;

                    if v827 then
                        v828 = v827:FindFirstChildOfClass("HumanoidDescription");
                    else
                        v828 = v827;
                    end;

                    if v828 then
                        GuiService:InspectPlayerFromHumanoidDescription(v828, v827.DisplayName);
                    end;
                end;
            end);
            local v829, v830 = l_pcall(MonitorDisplayItems);

            if not v829 then
                warn("DisplayIHandler", v830);
            end;

            local function ClientScrapHandler() -- Line: 6941
                -- upvalues: ReplicatedStorage (ref), Events (ref), workspace_CurrentCamera (ref), l_pcall (ref), PhysicsService (ref), l_math (ref), u31 (ref), underGroundCheck (ref), RunService (ref)
                local ScrapStuff = ReplicatedStorage.Storage.ScrapStuff;
                local SpawnerTools = ScrapStuff.SpawnerTools;
                local SCRZPAPAPA = Events.SCRZPAPAPA;
                local SpawnedPiles = workspace.Filter.SpawnedPiles;
                local u831 = {};

                local function removeScrap(p832, p833) -- Line: 6949
                    -- upvalues: u831 (copy), workspace_CurrentCamera (ref), l_pcall (ref), SpawnerTools (copy), PhysicsService (ref), l_math (ref)
                    local v834 = p832[1];
                    local _ = p832[2];
                    local _ = p832[3];
                    local u835 = p832[4];
                    local u836 = u831[v834];
                    u831[v834] = nil;

                    if u836 and (u836 and (u836.Parent and (u836.PrimaryPart and u836.PrimaryPart.Parent))) then
                        if u835 and (p833 and (workspace_CurrentCamera.CFrame.Position - u836.PrimaryPart.CFrame.Position).Magnitude < 200) then
                            local _, _ = l_pcall(function() -- Line: 6962
                                -- upvalues: u835 (copy), SpawnerTools (ref), u836 (copy), PhysicsService (ref), l_math (ref)
                                local v837 = SpawnerTools[u835 == "KRAMPUS" and "BreakCrate_Krampus" or "BreakCrate"]:Clone();
                                game.Debris:AddItem(v837, 5);
                                v837:SetPrimaryPartCFrame(u836.PrimaryPart.CFrame);

                                for _, descendant in pairs(v837:GetDescendants()) do
                                    if descendant:IsA("BasePart") then
                                        descendant.CollisionGroupId = PhysicsService:GetCollisionGroupId("NoCharCollide3");

                                        if descendant:IsA("MeshPart") then
                                            descendant.TextureID = u836.PrimaryPart.TextureID;
                                            descendant.Material = u836.PrimaryPart.Material;
                                        end;
                                    end;
                                end;

                                v837.Parent = workspace.Debris;
                                v837.Base.Anchored = true;
                                v837.Base.Attachment.ParticleEmitter:Emit(15);
                                local OpenSound = v837.Base.Attachment.OpenSound;
                                OpenSound.PlaybackSpeed = OpenSound.PlaybackSpeed * (l_math.random(90, 110) / 100);
                                v837.Base.Attachment.OpenSound:Play();
                                v837.crate_top:Destroy();

                                for _, descendant in pairs(v837:GetDescendants()) do
                                    if descendant:IsA("LinearVelocity") then
                                        descendant.Enabled = true;
                                        task.delay(0.1, function() -- Line: 6993
                                            -- upvalues: descendant (copy)
                                            if descendant and descendant.Parent then
                                                descendant:Destroy();
                                            end;
                                        end);
                                    elseif descendant:IsA("BasePart") then
                                        descendant.Anchored = false;
                                    elseif descendant:IsA("Weld") or descendant:IsA("ManualWeld") then
                                        descendant:Destroy();
                                    end;
                                end;
                            end);
                        end;

                        u836:Destroy();
                    end;
                end;

                local function createScrap(u838, p839) -- Line: 7012
                    -- upvalues: u831 (copy), SpawnedPiles (copy), SCRZPAPAPA (copy), l_math (ref), SpawnerTools (copy), ReplicatedStorage (ref), ScrapStuff (copy), u31 (ref), underGroundCheck (ref), PhysicsService (ref), RunService (ref), removeScrap (copy)
                    local u840 = u838[1];
                    local u841 = u838[2];
                    local v842 = u838[3];
                    local v843 = u838[4];
                    local v844 = u838[5];
                    local v845 = u838[6];
                    local v846 = u838[7];
                    local v847 = u838[8];
                    local v848 = u831[u840];

                    if not (v848 and v848.Parent) then
                        for _, child in SpawnedPiles:GetChildren() do
                            if child:GetAttribute("jzu") == string.reverse(u840) then
                                v848 = child;
                                break;
                            end;
                        end;
                    end;

                    if v848 and v848.Parent then
                        u831[u840] = v848;
                        SCRZPAPAPA:FireServer("ack", u840);

                        return;
                    end;

                    local v849 = v843 == "KRAMPUS" and "C1_Krampus" or v846;
                    local u850 = SpawnerTools[v849 or (v843 and "C1" or "S" .. l_math.random(1, 2))]:Clone();
                    local PrimaryPart = u850.PrimaryPart;

                    if v844 then
                        u850:SetAttribute("IsLocked", true);
                        local v851 = ReplicatedStorage.Storage.GUIs.RequiresLockpickBGUI:Clone();
                        v851.Parent = PrimaryPart;
                        v851.Adornee = PrimaryPart.PosA;
                    end;

                    if v847 then
                        u850:SetAttribute("NO_CRATE_HIT", v847);
                        _G.cTag(u850, v847);
                    end;

                    if v843 then
                        u850:SetAttribute("Id", u840);
                        u850:SetAttribute("LPBRs", v843);
                        u850:SetAttribute("IsCrate", true);
                    end;

                    PrimaryPart.CFrame = u841;

                    if not v849 then
                        if v843 == 1 then
                            PrimaryPart.TextureID = "rbxassetid://11157911882";
                            PrimaryPart.Material = Enum.Material.Fabric;
                        elseif v843 == 2 then
                            PrimaryPart.TextureID = "rbxassetid://11157915894";
                            PrimaryPart.Material = Enum.Material.Metal;
                        elseif v843 == 3 then
                            PrimaryPart.TextureID = "rbxassetid://11157926942";
                            PrimaryPart.Material = Enum.Material.Metal;
                        elseif v843 == "4J" then
                            PrimaryPart.TextureID = "rbxassetid://13932575545";
                            PrimaryPart.Material = Enum.Material.Wood;
                        elseif v843 == "XMAS" then
                            PrimaryPart.TextureID = "rbxassetid://15684791974";
                            PrimaryPart.Material = Enum.Material.Wood;
                        elseif v843 == "KRAMPUS" then
                            PrimaryPart.TextureID = "rbxassetid://11157911882";
                            PrimaryPart.Material = Enum.Material.Wood;
                        end;
                    end;

                    local v852 = ScrapStuff.Particle:Clone();
                    v852.Color = ColorSequence.new(v842);
                    v852.Parent = PrimaryPart;
                    v852.Enabled = true;
                    u850:SetAttribute("jzu", string.reverse(u840));
                    u850:SetAttribute("cot_", v845);

                    local function floorGone() -- Line: 7097
                        -- upvalues: u841 (copy), u31 (ref), ReplicatedStorage (ref), underGroundCheck (ref)
                        local Position = u841.Position;
                        local Model = u31.SubwayMains.Model;
                        local Model2 = u31.UndergroundMains.Model;
                        local v853;

                        if Model == nil or (Model.Parent ~= ReplicatedStorage or underGroundCheck(Position, 1) ~= true) then
                            if Model2 == nil or Model2.Parent ~= ReplicatedStorage then
                                v853 = false;
                            else
                                v853 = underGroundCheck(Position, 2) == true;
                            end;
                        else
                            v853 = true;
                        end;

                        return v853;
                    end;

                    local u854 = floorGone();

                    if u854 then
                        PrimaryPart.Anchored = true;
                    end;

                    u850.Parent = SpawnedPiles;

                    for _, descendant in pairs(u850:GetDescendants()) do
                        if descendant:IsA("BasePart") then
                            descendant.CollisionGroupId = PhysicsService:GetCollisionGroupId("NoCharCollide2");
                        end;
                    end;

                    task.spawn(function() -- Line: 7115
                        -- upvalues: PrimaryPart (copy), floorGone (copy), u854 (ref), u841 (copy), u850 (copy)
                        local os_clock_ret = os.clock();

                        while PrimaryPart.Parent do
                            task.wait(0.25);

                            if not PrimaryPart.Parent then
                                break;
                            end;

                            if floorGone() then
                                if not u854 then
                                    u854 = true;
                                    PrimaryPart.AssemblyLinearVelocity = Vector3.zero;
                                    PrimaryPart.AssemblyAngularVelocity = Vector3.zero;
                                    PrimaryPart.Anchored = true;
                                    PrimaryPart.CFrame = u841;
                                end;
                            elseif u854 then
                                u854 = false;
                                os_clock_ret = os.clock();
                                PrimaryPart.Anchored = false;
                            else
                                local v855 = os.clock() - os_clock_ret;
                                local v856 = (PrimaryPart.Position - u841.Position).Magnitude > 12;

                                if v856 or (v855 > 12 or v855 >= 3 and PrimaryPart.Velocity.Magnitude <= 0.25) then
                                    if v856 then
                                        local RaycastParams_new_ret = RaycastParams.new();
                                        RaycastParams_new_ret.FilterType = Enum.RaycastFilterType.Exclude;
                                        RaycastParams_new_ret.FilterDescendantsInstances = { workspace.Filter };
                                        RaycastParams_new_ret.CollisionGroup = "NoCharCollide2";
                                        RaycastParams_new_ret.RespectCanCollide = true;
                                        local v857 = workspace:Raycast(u841.Position + Vector3.new(0, 3, 0), Vector3.new(0, -18, 0), RaycastParams_new_ret);
                                        PrimaryPart.CFrame = v857 and u841 + Vector3.new(0, v857.Position.Y + PrimaryPart.Size.Y / 2 - u841.Y, 0) or u841;
                                    end;

                                    for _, descendant in pairs(u850:GetDescendants()) do
                                        if descendant:IsA("BasePart") then
                                            descendant.Anchored = true;
                                            descendant.CanCollide = false;
                                            descendant.CanTouch = false;
                                        end;
                                    end;

                                    return;
                                end;
                            end;
                        end;
                    end);
                    PrimaryPart.AncestryChanged:Connect(function(p858, p859) -- Line: 7159
                        -- upvalues: RunService (ref), u850 (copy)
                        RunService.Heartbeat:Wait();

                        if not p859 then
                            u850:Destroy();
                        end;
                    end);
                    u831[u840] = u850;
                    SCRZPAPAPA:FireServer("ack", u840);
                    task.delay(p839, function() -- Line: 7169
                        -- upvalues: u831 (ref), u840 (copy), u850 (copy), removeScrap (ref), u838 (copy)
                        if u831[u840] == u850 then
                            removeScrap(u838);
                        end;
                    end);
                end;

                SCRZPAPAPA.OnClientEvent:Connect(function(p860, p861, p862) -- Line: 7176
                    -- upvalues: createScrap (copy), removeScrap (copy)
                    if p860 == "add" then
                        createScrap(p861, p862);

                        return;
                    end;

                    if p860 == "remove" then
                        removeScrap(p861, p862);
                    end;
                end);
            end;

            local function clientDroppableHandler() -- Line: 7186
                -- upvalues: workspace_CurrentCamera (ref), ReplicatedStorage (ref)
                local v863 = {
                    FillTransparency = 1,
                    OutlineTransparency = 0.75,
                    FillColor = Color3.new(),
                    OutlineColor = Color3.new(1, 1, 1),
                    DepthMode = Enum.HighlightDepthMode.Occluded
                };
                local SpawnedBread = workspace:WaitForChild("Filter"):WaitForChild("SpawnedBread");
                local SpawnedTools = workspace:WaitForChild("Filter"):WaitForChild("SpawnedTools");
                local SpawnedPiles = workspace:WaitForChild("Filter"):WaitForChild("SpawnedPiles");
                local Highlight = Instance.new("Highlight");

                for i, v in pairs(v863) do
                    Highlight[i] = v;
                end;

                local u864 = {};

                local function checkMonitor(p865, p866) -- Line: 7207
                    -- upvalues: workspace_CurrentCamera (ref), u864 (copy)
                    local v867 = p866[1];
                    local v868 = p866[2];

                    if v867 and v867.Parent then
                        if (workspace_CurrentCamera.CFrame.Position - v867.Position).Magnitude < 25 then
                            if p866[3] ~= true then
                                v868.Enabled = true;
                                v868.Parent = p865;
                                v868.Adornee = p865;
                                u864[p865][3] = true;
                            end;
                        elseif p866[3] ~= false then
                            v868.Enabled = false;
                            v868.Parent = nil;
                            u864[p865][3] = false;
                        end;
                    end;
                end;

                local function checkAdded(u869) -- Line: 7227
                    -- upvalues: u864 (copy), ReplicatedStorage (ref), Highlight (copy), checkMonitor (copy)
                    task.wait(0.1);

                    if not u869.Parent then
                        return;
                    end;

                    if u869:IsA("BasePart") or u869:IsA("Model") and u869.PrimaryPart then
                        if u864[u869] then
                            return;
                        end;

                        local v870 = u869:IsA("BasePart") and u869 and u869 or u869.PrimaryPart;

                        if not ReplicatedStorage.Values.DisableDropHighlights.Value then
                            local u871 = Highlight:Clone();
                            u864[u869] = { v870, u871 };
                            checkMonitor(u869, u864[u869]);
                            local u872 = nil;
                            u872 = u869.AncestryChanged:Connect(function(p873, p874) -- Line: 7246
                                -- upvalues: u872 (ref), u864 (ref), u869 (copy), u871 (copy)
                                if not p874 then
                                    u872:Disconnect();
                                    u864[u869] = nil;

                                    if u871 and u871.Parent then
                                        u871:Destroy();
                                    end;
                                end;
                            end);
                        end;
                    end;
                end;

                SpawnedBread.ChildAdded:Connect(checkAdded);
                SpawnedTools.ChildAdded:Connect(checkAdded);
                SpawnedPiles.ChildAdded:Connect(checkAdded);

                for _, child in pairs(SpawnedBread:GetChildren()) do
                    checkAdded(child);
                end;

                for _, child in pairs(SpawnedTools:GetChildren()) do
                    checkAdded(child);
                end;

                for _, child in pairs(SpawnedPiles:GetChildren()) do
                    checkAdded(child);
                end;

                task.spawn(function() -- Line: 7274
                    -- upvalues: u864 (copy), checkMonitor (copy)
                    while task.wait(0.5) do
                        for i, v in pairs(u864) do
                            checkMonitor(i, v);
                        end;
                    end;
                end);
            end;

            Events:WaitForChild("MonitorSound").OnClientEvent:Connect(MonitorSound);
            Events2:WaitForChild("MonitorSound").Event:Connect(MonitorSound);
            Events:WaitForChild("MonitorSound2").OnClientEvent:Connect(MonitorSound);
            Events2:WaitForChild("MonitorSound2").Event:Connect(MonitorSound);
            Events:WaitForChild("FT_").OnClientEvent:Connect(ForceChar);
            Events:WaitForChild("CFRCE").OnClientEvent:Connect(CreateForce);
            Events:WaitForChild("ShellShock").OnClientEvent:Connect(ShellShock);
            Events:WaitForChild("Flash").OnClientEvent:Connect(Flashed);
            Events:WaitForChild("StunE").OnClientEvent:Connect(StunGrenaded);

            function _G.MonitorSound(...) -- Line: 7296
                -- upvalues: MonitorSound (ref)
                MonitorSound(...);
            end;

            Events:WaitForChild("INSTNMA").OnClientEvent:Connect(function(p875) -- Line: 7300
                -- upvalues: Events2 (ref), S_Take (ref)
                if p875 > 0 then
                    Events2.GotStamina:Fire();
                end;

                S_Take(-p875);
            end);
            ClientScrapHandler();
            clientDroppableHandler();
            u31.SetHazeValue = ReplicatedStorage.Values.SetHazeValue.Value;
            ReplicatedStorage.Values.SetHazeValue.Changed:Connect(function() -- Line: 7311
                -- upvalues: u31 (ref), ReplicatedStorage (ref)
                u31.SetHazeValue = ReplicatedStorage.Values.SetHazeValue.Value;
            end);
            u31.SetFogValue = ReplicatedStorage.Values.SetFogValue.Value;
            ReplicatedStorage.Values.SetFogValue.Changed:Connect(function() -- Line: 7316
                -- upvalues: u31 (ref), ReplicatedStorage (ref)
                u31.SetFogValue = ReplicatedStorage.Values.SetFogValue.Value;
            end);
            u31.FogAddValue = ReplicatedStorage.Values.FogAddValue.Value;
            ReplicatedStorage.Values.FogAddValue.Changed:Connect(function() -- Line: 7321
                -- upvalues: u31 (ref), ReplicatedStorage (ref)
                u31.FogAddValue = ReplicatedStorage.Values.FogAddValue.Value;
            end);
            u31.DayLength = ReplicatedStorage.Values.DayLength.Value;
            ReplicatedStorage.Values.DayLength.Changed:Connect(function() -- Line: 7326
                -- upvalues: u31 (ref), ReplicatedStorage (ref)
                u31.DayLength = ReplicatedStorage.Values.DayLength.Value;
            end);
            u31.NightLength = ReplicatedStorage.Values.NightLength.Value;
            ReplicatedStorage.Values.NightLength.Changed:Connect(function() -- Line: 7331
                -- upvalues: u31 (ref), ReplicatedStorage (ref)
                u31.NightLength = ReplicatedStorage.Values.NightLength.Value;
            end);
            u31.TimeState_Enabled = ReplicatedStorage.Values.TimeState.Enabled.Value;
            ReplicatedStorage.Values.TimeState.Enabled.Changed:Connect(function() -- Line: 7336
                -- upvalues: u31 (ref), ReplicatedStorage (ref)
                u31.TimeState_Enabled = ReplicatedStorage.Values.TimeState.Enabled.Value;
            end);
            u31.TimeState_Value = ReplicatedStorage.Values.TimeState.Value;
            ReplicatedStorage.Values.TimeState.Changed:Connect(function() -- Line: 7340
                -- upvalues: u31 (ref), ReplicatedStorage (ref)
                u31.TimeState_Value = ReplicatedStorage.Values.TimeState.Value;
            end);
            u31.FakeClockTime_Enabled = ReplicatedStorage.Values.TimeState.FakeClockTime.Enabled.Value;
            ReplicatedStorage.Values.TimeState.FakeClockTime.Enabled.Changed:Connect(function() -- Line: 7346
                -- upvalues: u31 (ref), ReplicatedStorage (ref)
                u31.FakeClockTime_Enabled = ReplicatedStorage.Values.TimeState.FakeClockTime.Enabled.Value;
            end);
            u31.FakeClockTime_Value = ReplicatedStorage.Values.TimeState.FakeClockTime.Value;
            ReplicatedStorage.Values.TimeState.FakeClockTime.Changed:Connect(function() -- Line: 7350
                -- upvalues: u31 (ref), ReplicatedStorage (ref)
                u31.FakeClockTime_Value = ReplicatedStorage.Values.TimeState.FakeClockTime.Value;
            end);
            u31.AmbientMulti = ReplicatedStorage.Values.AmbientMulti.Value;
            ReplicatedStorage.Values.AmbientMulti.Changed:Connect(function() -- Line: 7355
                -- upvalues: u31 (ref), ReplicatedStorage (ref)
                u31.AmbientMulti = ReplicatedStorage.Values.AmbientMulti.Value;
            end);
            u31.BrightnessMulti = ReplicatedStorage.Values.BrightnessMulti.Value;
            ReplicatedStorage.Values.BrightnessMulti.Changed:Connect(function() -- Line: 7360
                -- upvalues: u31 (ref), ReplicatedStorage (ref)
                u31.BrightnessMulti = ReplicatedStorage.Values.BrightnessMulti.Value;
            end);
            u31.CloudColorMulti = ReplicatedStorage.Values.CloudColorMulti.Value;
            ReplicatedStorage.Values.CloudColorMulti.Changed:Connect(function() -- Line: 7365
                -- upvalues: u31 (ref), ReplicatedStorage (ref)
                u31.CloudColorMulti = ReplicatedStorage.Values.CloudColorMulti.Value;
            end);
            u31.LOutage = ReplicatedStorage.Values.LOutage.Value;
            ReplicatedStorage.Values.LOutage.Changed:Connect(function() -- Line: 7370
                -- upvalues: u31 (ref), ReplicatedStorage (ref)
                u31.LOutage = ReplicatedStorage.Values.LOutage.Value;
            end);
            u31.LegacyDowning = ReplicatedStorage.Values.LegacyDowningSystem.Value;
            ReplicatedStorage.Values.LegacyDowningSystem.Changed:Connect(function() -- Line: 7375
                -- upvalues: u31 (ref), ReplicatedStorage (ref)
                u31.LegacyDowning = ReplicatedStorage.Values.LegacyDowningSystem.Value;
            end);
            u31.ResettingDisabled = ReplicatedStorage.Values.ResettingDisabled.Value;
            ReplicatedStorage.Values.ResettingDisabled.Changed:Connect(function() -- Line: 7380
                -- upvalues: u31 (ref), ReplicatedStorage (ref)
                u31.ResettingDisabled = ReplicatedStorage.Values.ResettingDisabled.Value;
            end);
            u31.RespawnIncrease_Value = ReplicatedStorage.Values.RespawnIncrease.Value;
            u31.RESINC_V = ReplicatedStorage.Values.RespawnIncrease.Value;
            ReplicatedStorage.Values.ResettingDisabled.Changed:Connect(function() -- Line: 7386
                -- upvalues: u31 (ref), ReplicatedStorage (ref)
                u31.RESINC_V = ReplicatedStorage.Values.RespawnIncrease.Value;
            end);
            u31.LightingConfig = require(ReplicatedStorage.Storage:WaitForChild("LightingObjects").LightingConfig);
            u31.MousePoint = GetMousePoint();
            _G.MousePoint = u31.MousePoint;
            RayHandler.SetUp();
            GuiService.AutoSelectGuiEnabled = true;
            CheckDeviceType();
            task.spawn(function() -- Line: 7401, Name: HandleMobile
                -- upvalues: u31 (ref), NewModules (ref), Events2 (ref), u34 (ref), u35 (ref), LocalPlayer (ref), l_math (ref), RunService (ref), CheckInputType (ref)
                u31.MobileControlsM = require(NewModules.Client.Services.MobileControls);
                u31.MobileControlsM.DoSetUp();
                Events2.JumpButton.Event:Connect(function(p876) -- Line: 7405
                    -- upvalues: u31 (ref)
                    if p876 then
                        u31.MobileControlsM.EnableButton("jump", true);

                        return;
                    end;

                    u31.MobileControlsM.EnableButton("jump", false);
                end);
                u31.MobileControlsM.EnableButton("jump", true);
                u31.MobileControlsM.InputEvent.Event:Connect(function(p877, p878) -- Line: 7415
                    -- upvalues: u34 (ref), u31 (ref), u35 (ref), LocalPlayer (ref), l_math (ref), RunService (ref)
                    if p877 == "sprint" then
                        u34 = p878;

                        if p878 then
                            u31.MobileControlsM.ToggleButton("crouch", false);
                        end;
                    elseif p877 == "crouch" then
                        u35 = p878;

                        if p878 then
                            task.delay(0.1, function() -- Line: 7424
                                -- upvalues: u31 (ref)
                                u31.MobileControlsM.ToggleButton("sprint", false);
                            end);
                        end;
                    elseif p877 == "jump" then
                        if p878 and _G.jumpButtonBegan then
                            _G.jumpButtonBegan();

                            return;
                        end;

                        if not p878 and _G.jumpButtonEnd then
                            _G.jumpButtonEnd();
                        end;
                    elseif p877 == "firstperson" and not _G.NoMobileFPButton then
                        if p878 then
                            LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson;

                            return;
                        end;

                        LocalPlayer.CameraMode = Enum.CameraMode.Classic;
                        u31.MobileControlsM.EnableButton("firstperson", false);
                        local CameraMinZoomDistance = LocalPlayer.CameraMinZoomDistance;
                        LocalPlayer.CameraMinZoomDistance = l_math.min(LocalPlayer.CameraMaxZoomDistance, 4);
                        RunService.Heartbeat:Wait();
                        RunService.Heartbeat:Wait();
                        LocalPlayer.CameraMinZoomDistance = CameraMinZoomDistance;
                        task.wait(0.2);

                        if not u31.MobileControlsM.ded then
                            u31.MobileControlsM.EnableButton("firstperson", true);
                        end;
                    end;
                end);
                u31.MobileControlsM.UntoggleAll();
                CheckInputType();
            end);
            task.spawn(function() -- Line: 7459, Name: ClientCollisions
                -- upvalues: Players (ref), l_math (ref), Destroyed (ref), l_pcall (ref), RunService (ref)
                local LocalPlayer2 = Players.LocalPlayer;
                local u879 = setmetatable({}, {
                    __mode = "k"
                });
                local u880 = {};
                local u881 = {};
                local u882 = nil;
                local u883 = nil;
                local Vector3_new_ret = Vector3.new(2, 3.5, 1);
                local u884 = Vector3_new_ret / 2;
                local u885 = nil;
                local u886 = {};
                local u887 = {};
                local u888 = nil;
                local u889 = true;

                local function dropCons(p890) -- Line: 7478
                    -- upvalues: u887 (copy), u886 (copy)
                    local v891 = u887[p890];

                    if v891 then
                        for _, v in v891.cons do
                            v:Disconnect();
                        end;

                        u886[v891.char] = nil;
                        u887[p890] = nil;
                    end;
                end;

                local RaycastParams_new_ret = RaycastParams.new();
                RaycastParams_new_ret.FilterType = Enum.RaycastFilterType.Exclude;
                RaycastParams_new_ret.RespectCanCollide = true;
                RaycastParams_new_ret.IgnoreWater = true;

                local function HasGroundSupport(p892, p893) -- Line: 7494
                    -- upvalues: l_math (ref), RaycastParams_new_ret (copy)
                    if not p893 then
                        return false;
                    end;

                    local JumpHeight = p893.JumpHeight;

                    if p893.UseJumpPower then
                        local v894 = l_math.max(50, p893.JumpPower);
                        JumpHeight = v894 * v894 / (l_math.max(workspace.Gravity, 1) * 2);
                    end;

                    local v895 = p892.Size.Y / 2 + l_math.max(p893.HipHeight, 0);

                    if p893.RigType == Enum.HumanoidRigType.R6 then
                        local v896 = p892.Parent:FindFirstChild("Left Leg");
                        v895 = v895 + (v896 and v896.Size.Y or 2);
                    end;

                    return workspace:Raycast(p892.Position, Vector3.new(0, -(v895 + JumpHeight + 2), 0), RaycastParams_new_ret) ~= nil;
                end;

                local function Intrudes(p897, p898, p899, p900, p901) -- Line: 7510
                    -- upvalues: l_math (ref)
                    local Components, v902, v903, v904, v905, v906, v907, v908, v909, v910, v911, v912 = p897:ToObjectSpace(p899):GetComponents();
                    local v913 = p898 / 2;
                    local v914 = p900 / 2;
                    local v915;

                    if l_math.abs(Components) < v913.X + p901 + l_math.abs(v904) * v914.X + l_math.abs(v905) * v914.Y + l_math.abs(v906) * v914.Z and l_math.abs(v902) < v913.Y + p901 + l_math.abs(v907) * v914.X + l_math.abs(v908) * v914.Y + l_math.abs(v909) * v914.Z then
                        v915 = l_math.abs(v903) < v913.Z + p901 + l_math.abs(v910) * v914.X + l_math.abs(v911) * v914.Y + l_math.abs(v912) * v914.Z;
                    else
                        v915 = false;
                    end;

                    return v915;
                end;

                local RaycastParams_new_ret2 = RaycastParams.new();
                RaycastParams_new_ret2.FilterType = Enum.RaycastFilterType.Exclude;
                RaycastParams_new_ret2.RespectCanCollide = true;
                RaycastParams_new_ret2.IgnoreWater = true;
                RaycastParams_new_ret2.FilterDescendantsInstances = { workspace.Characters, workspace.Debris, workspace.CurrentCamera };

                local function u926(u916) -- Line: 7524
                    -- upvalues: u879 (copy), LocalPlayer2 (copy), u882 (ref), u883 (ref), u880 (ref), u887 (copy), dropCons (copy), u889 (ref), u881 (copy), u926 (copy), u885 (ref), u886 (copy), u888 (ref), Destroyed (ref)
                    local HumanoidRootPart = u916:WaitForChild("HumanoidRootPart", 5);
                    local Humanoid = u916:WaitForChild("Humanoid", 5);

                    if not (HumanoidRootPart and Humanoid) then
                        return;
                    end;

                    if u879[HumanoidRootPart] then
                        return;
                    end;

                    if u916 == LocalPlayer2.Character then
                        u882 = HumanoidRootPart;
                        u883 = Humanoid;
                        u880 = {};

                        for i in pairs(u887) do
                            dropCons(i);
                        end;

                        for _, v in pairs(u879) do
                            if v then
                                v:Destroy();
                            end;
                        end;

                        table.clear(u879);
                        u889 = true;
                        table.clear(u881);

                        for _, child in pairs(workspace.Characters:GetChildren()) do
                            if child ~= u916 and not u879[child:FindFirstChild("HumanoidRootPart")] then
                                task.spawn(u926, child);
                            end;
                        end;

                        local u917 = nil;
                        u917 = HumanoidRootPart.AncestryChanged:Connect(function(p918, p919) -- Line: 7552
                            -- upvalues: u917 (ref), u882 (ref)
                            if not p919 then
                                u917:Disconnect();
                                u882 = nil;
                            end;
                        end);
                        Humanoid.Died:Once(function() -- Line: 7559
                            -- upvalues: u879 (ref), u889 (ref), u880 (ref), u881 (ref)
                            for _, v in pairs(u879) do
                                if v then
                                    v:Destroy();
                                end;
                            end;

                            table.clear(u879);
                            u889 = true;
                            table.clear(u880);
                            table.clear(u881);
                        end);
                        u885 = _G.GVF(LocalPlayer2.Name);

                        local function Update2() -- Line: 7571
                            -- upvalues: u886 (ref)
                            for _, v in pairs(u886) do
                                v();
                            end;
                        end;

                        if u888 then
                            u888:Disconnect();
                        end;

                        u888 = u885.SingleTargetOverride.Changed:Connect(Update2);

                        if u885.SingleTargetOverride.Value ~= nil then
                            task.spawn(Update2);
                        end;

                        return;
                    end;

                    task.wait(0.5);

                    if u879[HumanoidRootPart] or not (HumanoidRootPart.Parent and u916.Parent) then
                        return;
                    end;

                    if not (Humanoid and (Humanoid.Parent and Humanoid.Health > 0)) then
                        return;
                    end;

                    local _G_GVF_ret = _G.GVF(u916.Name);

                    if not _G_GVF_ret then
                        return;
                    end;

                    local RagdollTime = _G_GVF_ret.RagdollTime;
                    local RagdollSwitch = _G_GVF_ret.RagdollTime.RagdollSwitch;
                    local SRagdolled = _G_GVF_ret.RagdollTime.SRagdolled;
                    local SingleTargetOverride = _G_GVF_ret.SingleTargetOverride;
                    local Downed = _G_GVF_ret.Downed;
                    local Grabbed = _G_GVF_ret.Grabbed;
                    local Part = Instance.new("Part");
                    Part.BrickColor = BrickColor.new("Bright red");
                    Part.Size = Vector3.new(2, 3, 1);
                    Part.Anchored = true;
                    Part.CanCollide = false;
                    Part.CanTouch = false;
                    Part.CanQuery = false;
                    Part.Massless = true;
                    Part.CastShadow = false;
                    Part.EnableFluidForces = false;
                    Part.Transparency = 1;
                    Part.Parent = nil;
                    local u920 = false;

                    local function Update() -- Line: 7618
                        -- upvalues: u920 (ref), Humanoid (copy), u916 (copy), Grabbed (copy), HumanoidRootPart (copy), u885 (ref), _G_GVF_ret (copy), LocalPlayer2 (ref), u881 (ref), Destroyed (ref), Part (copy)
                        if u920 then
                            return;
                        end;

                        if not Humanoid or Humanoid.Health <= 0 then
                            return;
                        end;

                        local v921 = _G.RagdollCheck(u916) or (_G.DownedCheck(u916) or Grabbed.Value or (u916:GetAttribute("HAS_NETWORK_OWNERSHIP_CONTROLLED") or HumanoidRootPart:GetAttribute("NO_NETWORK_OWNER")));
                        local v922 = u885 and (u885.Parent and (u885:FindFirstChild("SingleTargetOverride") and (u885.SingleTargetOverride.Value ~= nil and u885.SingleTargetOverride.Value ~= u916))) and true or (_G_GVF_ret:FindFirstChild("SingleTargetOverride") and (_G_GVF_ret.SingleTargetOverride.Value ~= nil and _G_GVF_ret.SingleTargetOverride.Value ~= LocalPlayer2.Character) and true or v921);
                        u881[HumanoidRootPart] = v922;

                        if not Destroyed(Part) then
                            if v922 then
                                Part.CanCollide = false;

                                if Part.Parent ~= nil then
                                    Part.Parent = nil;
                                end;
                            else
                                Part.CanCollide = false;
                                Part.CFrame = HumanoidRootPart.CFrame;
                            end;
                        end;
                    end;

                    dropCons(HumanoidRootPart);
                    u887[HumanoidRootPart] = {
                        char = u916,
                        cons = {
                            RagdollTime.Changed:Connect(Update),
                            RagdollSwitch.Changed:Connect(Update),
                            SingleTargetOverride.Changed:Connect(Update),
                            SRagdolled.Changed:Connect(Update),
                            Downed.Changed:Connect(Update),
                            Grabbed.Changed:Connect(Update),
                            u916:GetAttributeChangedSignal("HAS_NETWORK_OWNERSHIP_CONTROLLED"):Connect(Update),
                            HumanoidRootPart:GetAttributeChangedSignal("NO_NETWORK_OWNER"):Connect(Update)
                        }
                    };
                    task.spawn(Update);
                    u886[u916] = Update;
                    u879[HumanoidRootPart] = Part;
                    u889 = true;
                    local u923 = nil;
                    u923 = HumanoidRootPart.AncestryChanged:Connect(function(p924, p925) -- Line: 7676
                        -- upvalues: u920 (ref), u923 (ref), u881 (ref), HumanoidRootPart (copy), u879 (ref), u880 (ref), u886 (ref), u916 (copy), dropCons (ref), u889 (ref), Part (copy)
                        if not p925 then
                            u920 = true;
                            u923:Disconnect();
                            u881[HumanoidRootPart] = nil;
                            u879[HumanoidRootPart] = nil;
                            u880[HumanoidRootPart] = nil;
                            u886[u916] = nil;
                            dropCons(HumanoidRootPart);
                            u889 = true;
                            Part:Destroy();
                        end;
                    end);
                    Humanoid.Died:Once(function() -- Line: 7690
                        -- upvalues: u920 (ref), u881 (ref), HumanoidRootPart (copy), u879 (ref), u880 (ref), u886 (ref), u916 (copy), dropCons (ref), u889 (ref), Part (copy)
                        u920 = true;
                        u881[HumanoidRootPart] = nil;
                        u879[HumanoidRootPart] = nil;
                        u880[HumanoidRootPart] = nil;
                        u886[u916] = nil;
                        dropCons(HumanoidRootPart);
                        u889 = true;
                        Part:Destroy();
                    end);
                end;

                workspace.Characters.ChildAdded:Connect(u926);

                for _, child in pairs(workspace.Characters:GetChildren()) do
                    task.spawn(u926, child);
                end;

                task.spawn(function() -- Line: 7708
                    -- upvalues: u882 (ref), u879 (copy), l_pcall (ref), u880 (ref), u881 (copy), u889 (ref), dropCons (copy)
                    while true do
                        if u882 then
                            for i, v in pairs(u879) do
                                local v927, v928 = l_pcall(function() -- Line: 7712
                                    -- upvalues: i (copy), v (copy), u882 (ref), u880 (ref), u881 (ref), u889 (ref), u879 (ref), dropCons (ref)
                                    if i and (i.Parent and v) then
                                        if (u882.Position - i.Position).Magnitude <= 15 then
                                            u880[i] = v;

                                            if u881[i] ~= true and not v.Parent then
                                                v.CanCollide = false;
                                                v.CFrame = i.CFrame;
                                                v.Parent = workspace.Debris;
                                                u889 = true;
                                            end;
                                        else
                                            u880[i] = nil;

                                            if v.Parent ~= nil then
                                                v.CanCollide = false;
                                                v.Parent = nil;
                                            end;
                                        end;
                                    else
                                        u880[i] = nil;
                                        u879[i] = nil;
                                        u881[i] = nil;
                                        dropCons(i);
                                        u889 = true;

                                        if v then
                                            v:Destroy();
                                        end;
                                    end;
                                end);

                                if not v927 then
                                    warn("ClientCollisionError:", v928);
                                end;
                            end;
                        end;

                        task.wait(0.5);
                    end;
                end);
                RunService.Heartbeat:Connect(function(p929) -- Line: 7749
                    -- upvalues: u882 (ref), u880 (ref), u889 (ref), u879 (copy), RaycastParams_new_ret (copy), Vector3_new_ret (copy), l_math (ref), u884 (copy), HasGroundSupport (copy), u883 (ref), Intrudes (copy), Players (ref), LocalPlayer2 (copy), RaycastParams_new_ret2 (copy)
                    if not u882 then
                        return;
                    end;

                    local CFrame2 = u882.CFrame;
                    local v930 = nil;
                    local v931;

                    if next(u880) == nil or u882.Parent == nil then
                        v931 = false;
                    else
                        v931 = _G.RagdollCheck(u882.Parent) or _G.DownedCheck(u882.Parent);
                    end;

                    local v932;

                    if v931 then
                        v932 = u882.AssemblyLinearVelocity.Magnitude < 8;
                    else
                        v932 = v931;
                    end;

                    if u889 then
                        u889 = false;
                        local v933 = { workspace.Characters };

                        for _, v in pairs(u879) do
                            table.insert(v933, v);
                        end;

                        RaycastParams_new_ret.FilterDescendantsInstances = v933;
                    end;

                    for i, v in pairs(u880) do
                        if i and (i.Parent and (v and v.Parent == workspace.Debris)) then
                            local Magnitude = (u882.Position - i.Position).Magnitude;
                            local v934 = i.Size or Vector3.new(2, 2, 1);
                            local v935 = (Vector3_new_ret.Magnitude + v934.Magnitude) / 6;
                            local v936 = false;
                            local v937 = i.CFrame.UpVector:Dot((Vector3.new(0, 1, 0))) >= 0.8;

                            if v937 then
                                if Magnitude < v935 then
                                    local Position = CFrame2:ToObjectSpace(i.CFrame).Position;
                                    v936 = l_math.abs(Position.X) < u884.X * 1.5 and (l_math.abs(Position.Y) < u884.Y * 1.5 and l_math.abs(Position.Z) < u884.Z * 1.5) and true or v936;
                                end;
                            else
                                v936 = true;
                            end;

                            if not v936 and CFrame2.Position.Y - i.Position.Y > 2.5 then
                                v936 = not HasGroundSupport(i, i.Parent:FindFirstChildOfClass("Humanoid"));
                            end;

                            if not v936 and i.Position.Y - CFrame2.Position.Y > 2.5 then
                                local v938 = u883 and u883:GetState();
                                local v939;

                                if v938 == Enum.HumanoidStateType.Jumping or v938 == Enum.HumanoidStateType.Freefall then
                                    v939 = u882.AssemblyLinearVelocity.Y > 0;
                                else
                                    v939 = false;
                                end;

                                v936 = not v939;
                            end;

                            if not (v936 or v.CanCollide and ((i.Position - v.Position).Magnitude <= 1.5 or v.Position.Y - CFrame2.Position.Y <= -2.5)) then
                                v936 = Intrudes(i.CFrame, v.Size, CFrame2, u882.Size, v.CanCollide and -0.25 or 0.1);
                            end;

                            local v940 = not v936 and (v931 and (v932 or not v.CanCollide and Magnitude < 6)) and true or v936;
                            v.CanCollide = not v940;

                            if v940 and (v937 and (l_math.abs(i.Position.Y - CFrame2.Position.Y) < 2 and Intrudes(i.CFrame, v.Size, CFrame2, u882.Size, 0.1))) then
                                local v941 = (CFrame2.Position - i.Position) * Vector3.new(1, 0, 1);

                                if v941.Magnitude < 0.05 then
                                    local PlayerFromCharacter = Players:GetPlayerFromCharacter(i.Parent);
                                    v941 = Vector3.xAxis * (PlayerFromCharacter and PlayerFromCharacter.UserId > LocalPlayer2.UserId and -1 or 1);
                                end;

                                v930 = (v930 or Vector3.zero) + v941.Unit * (l_math.clamp(1 - v941.Magnitude / 2, 0, 1) * 4 + 3);
                            end;

                            v.CFrame = i.CFrame;
                        else
                            u880[i] = nil;
                        end;
                    end;

                    if v930 and (v930.Magnitude > 0 and (u883 and (u883.Health > 0 and not (u882.Anchored or (u883.Sit or (u883.FloorMaterial == Enum.Material.Air or (u882.Parent:GetAttribute("HAS_NETWORK_OWNERSHIP_CONTROLLED") or (u882:GetAttribute("NO_NETWORK_OWNER") or (_G.RagdollCheck(u882.Parent) or _G.DownedCheck(u882.Parent)))))))))) then
                        local State = u883:GetState();

                        if State ~= Enum.HumanoidStateType.Physics and (State ~= Enum.HumanoidStateType.PlatformStanding and (State ~= Enum.HumanoidStateType.Climbing and State ~= Enum.HumanoidStateType.Seated)) then
                            if v930.Magnitude > 7 then
                                v930 = v930.Unit * 7;
                            end;

                            local v942 = v930 * l_math.min(p929, 0.1);
                            RaycastParams_new_ret2.CollisionGroup = u882.CollisionGroup;

                            if not workspace:Blockcast(CFrame2, u882.Size * 0.9, v930.Unit * (v942.Magnitude + 0.3), RaycastParams_new_ret2) and workspace:Raycast(CFrame2.Position + v930.Unit * (v942.Magnitude + 1), Vector3.new(0, -6, 0), RaycastParams_new_ret2) then
                                u882.CFrame = CFrame2 + v942;
                            end;
                        end;
                    end;
                end);
            end);
        end;

        local function Pepperd(p943, p944) -- Line: 7847
            -- upvalues: u64 (copy), l_tick (copy), LocalPlayer (copy), workspace_CurrentCamera (ref), TweenService (copy), u53 (ref), S_Take (copy), DamageHitEffect (copy), random (copy), l_pcall (copy), Debris (copy)
            local u945 = p944 or 1;
            local u946 = p943 or 1;
            u64.pepTime = l_tick();

            if u64.pepSprayed then
                return;
            end;

            u64.pepSprayed = true;
            local Character = LocalPlayer.Character;
            local BlurEffect = Instance.new("BlurEffect");
            BlurEffect.Name = "PEP_Effect";
            BlurEffect.Parent = workspace_CurrentCamera;
            BlurEffect.Size = 0;
            TweenService:Create(BlurEffect, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                Size = 15
            }):Play();
            table.insert(u53, BlurEffect);
            local u947 = nil;
            coroutine.resume(coroutine.create(function() -- Line: 7864
                -- upvalues: S_Take (ref), DamageHitEffect (ref), Character (copy), random (ref), u945 (ref), l_tick (ref), u64 (ref), u946 (ref), BlurEffect (copy), l_pcall (ref), u947 (ref), TweenService (ref), Debris (ref)
                repeat
                    task.wait(0.25);
                    S_Take(1.5);
                    DamageHitEffect(Character, random(35, 60) * u945);
                until u946 <= l_tick() - u64.pepTime or not (u64.pepSprayed and (Character and Character.Parent));

                if BlurEffect and BlurEffect.Parent then
                    l_pcall(function() -- Line: 7871
                        -- upvalues: u947 (ref)
                        u947:Cancel();
                    end);
                    u947 = TweenService:Create(BlurEffect, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                        Size = 0
                    });
                    u947:Play();
                    Debris:AddItem(BlurEffect, 3);
                end;

                u64.pepSprayed = false;
            end));
        end;

        local function Concussioned(u948, u949, p950, u951, u952, p953) -- Line: 7880
            -- upvalues: u64 (copy), workspace_CurrentCamera (ref), u53 (ref), Debris (copy), GVF (copy), TweenService (copy), l_math (copy), FrameworkStuff (copy), ShellShock (copy), RAND (copy), CamShakeConfig (copy), LocalPlayer (copy), u61 (copy), StunEffect (copy)
            if u64.isConcussioned then
                return;
            end;

            local ColorCorrectionEffect2 = Instance.new("ColorCorrectionEffect");
            ColorCorrectionEffect2.Name = "Concussion_Effect";
            ColorCorrectionEffect2.Parent = workspace_CurrentCamera;
            table.insert(u53, ColorCorrectionEffect2);
            local BlurEffect = Instance.new("BlurEffect");
            BlurEffect.Name = "Concussion_Effect2";
            BlurEffect.Parent = workspace_CurrentCamera;
            BlurEffect.Size = 0;
            table.insert(u53, BlurEffect);
            Debris:AddItem(ColorCorrectionEffect2, u948 * 1.2);
            Debris:AddItem(BlurEffect, u948 * 1.2);
            local Color3_new_ret = Color3.new(1, 1, 1);
            local v954 = 20 * u949;
            local v955 = -3 * u949;

            if p953 == "lovestruck" then
                v954 = v954 * 0.75;
                v955 = 0;
                Color3_new_ret = Color3.fromRGB(235, 187, 255);
                local ColorCorrectionEffect3 = Instance.new("ColorCorrectionEffect");
                game.Debris:AddItem(ColorCorrectionEffect3, 1);
                ColorCorrectionEffect3.Name = "Concussion_Effect3";
                ColorCorrectionEffect3.Parent = workspace_CurrentCamera;
                table.insert(u53, ColorCorrectionEffect2);
                local v956 = GVF();
                local NumberValue5 = Instance.new("NumberValue");

                if v956 then
                    v956 = v956.FOVs;
                end;

                NumberValue5.Parent = v956;
                table.insert(u53, NumberValue5);
                TweenService:Create(ColorCorrectionEffect3, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    Brightness = 0.85
                }):Play();
                TweenService:Create(NumberValue5, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    Value = 10
                }):Play();
                task.delay(0.31, function() -- Line: 7929
                    -- upvalues: ColorCorrectionEffect3 (ref), TweenService (ref), NumberValue5 (copy), u948 (copy)
                    if ColorCorrectionEffect3 and ColorCorrectionEffect3.Parent then
                        TweenService:Create(ColorCorrectionEffect3, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            Brightness = 0
                        }):Play();
                        TweenService:Create(NumberValue5, TweenInfo.new(u948 * 0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                            Value = 0
                        }):Play();
                    end;
                end);
                local v957 = "lovestruck_fx" .. l_math.random(1, 3);
                local v958 = FrameworkStuff:FindFirstChild((tostring(v957)));

                if v958 then
                    local v959 = v958:Clone();
                    game.Debris:AddItem(v959, 4);
                    table.insert(u53, v959);
                    v959.Parent = workspace.CurrentCamera;
                    v959:Play();
                end;
            end;

            TweenService:Create(ColorCorrectionEffect2, TweenInfo.new(u948 * 0.35, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
                Brightness = 0.15 * u949,
                Contrast = 0.25 * u949,
                Saturation = v955,
                TintColor = Color3_new_ret
            }):Play();
            TweenService:Create(BlurEffect, TweenInfo.new(u948 * 0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                Size = v954
            }):Play();
            task.delay(u948 * 0.35, function() -- Line: 7952
                -- upvalues: ColorCorrectionEffect2 (copy), TweenService (ref), u948 (copy)
                if ColorCorrectionEffect2.Parent then
                    TweenService:Create(ColorCorrectionEffect2, TweenInfo.new(u948 * 0.65, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                        Brightness = 0,
                        Contrast = 0,
                        Saturation = 0,
                        TintColor = Color3.new(1, 1, 1)
                    }):Play();
                end;
            end);
            task.delay(u948 * 0.1, function() -- Line: 7957
                -- upvalues: BlurEffect (copy), TweenService (ref), u948 (copy)
                if BlurEffect.Parent then
                    TweenService:Create(BlurEffect, TweenInfo.new(u948 * 0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                        Size = 0
                    }):Play();
                end;
            end);
            local _ = FrameworkStuff.ConcussionEffect;
            coroutine.wrap(function() -- Line: 7965
                -- upvalues: ShellShock (ref), u949 (copy), u948 (copy)
                ShellShock(u949 * 0.2, u948, 1.5, 0, true);
            end)();
            local v960 = u949 * 150;
            local v961 = v960 * RAND(-6, 6, CamShakeConfig.Accuracy);
            local u962 = l_math.rad(v961);
            local v963 = v960 * RAND(-10, 10, CamShakeConfig.Accuracy);
            local u964 = l_math.rad(v963);
            local v965 = v960 * RAND(-6, 6, CamShakeConfig.Accuracy);
            local v966 = l_math.rad(v965);

            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                u61:accelerate((Vector3.new(u962, u964, v966)));
                coroutine.wrap(function() -- Line: 7987
                    -- upvalues: u61 (ref), u962 (copy), u964 (copy)
                    task.wait(0.03);
                    u61:accelerate((Vector3.new(-u962, -u964, 0)));
                end)();
            end;

            if p950 then
                coroutine.wrap(function() -- Line: 7995
                    -- upvalues: StunEffect (ref), u952 (copy), u948 (copy), u951 (copy)
                    StunEffect(u952, u948, u951);
                end)();
            end;

            task.wait(u948);
            u64.isConcussioned = false;
            local v967 = u948 * 0.7;

            if ColorCorrectionEffect2.Parent then
                Debris:AddItem(ColorCorrectionEffect2, v967);
                Debris:AddItem(BlurEffect, v967);
            end;
        end;

        Events:WaitForChild("TEA_GA").OnClientEvent:Connect(TearGas);
        Events:WaitForChild("PEP_H").OnClientEvent:Connect(Pepperd);
        Events:WaitForChild("CONC_EF").OnClientEvent:Connect(Concussioned);
        u31.groupPromptActive = false;

        local function GroupJoinPrompt() -- Line: 8024
            -- upvalues: u31 (copy), LocalPlayer (copy), l_pcall (copy), GroupService (copy)
            if not u31.groupPromptActive then
                u31.groupPromptActive = true;

                if not u31.gjp_ui then
                    u31.gjp_ui = Instance.new("ScreenGui");
                    u31.gjp_ui.Name = "_fav2";
                    u31.gjp_ui.ResetOnSpawn = false;
                    local TextButton = Instance.new("TextButton");
                    TextButton.BackgroundTransparency = 1;
                    TextButton.Size = UDim2.new(0, 1, 0, 1);
                    TextButton.Modal = true;
                    TextButton.Parent = u31.gjp_ui;
                    u31.gjp_ui.Parent = LocalPlayer.PlayerGui:FindFirstChild("CoreGUI");
                end;

                local v968, v969 = l_pcall(function() -- Line: 8041
                    -- upvalues: GroupService (ref)
                    return GroupService:PromptJoinAsync(4165692);
                end);
                local v970 = false;

                if v968 then
                    v970 = v969 == Enum.GroupMembershipStatus.Joined and true or (v969 ~= Enum.GroupMembershipStatus.JoinRequestPending and v969 == Enum.GroupMembershipStatus.AlreadyMember and true or v970);
                end;

                u31.groupPromptActive = false;

                if u31.gjp_ui and u31.gjp_ui.Parent then
                    u31.gjp_ui:Destroy();
                end;

                u31.gjp_ui = nil;

                return v970;
            end;
        end;

        function Events.GroupJoinPrompt.OnClientInvoke() -- Line: 8071
            -- upvalues: GroupJoinPrompt (copy)
            return GroupJoinPrompt();
        end;

        function Events2.GroupJoinPrompt.OnInvoke() -- Line: 8075
            -- upvalues: GroupJoinPrompt (copy)
            return GroupJoinPrompt();
        end;

        task.spawn(function() -- Line: 8080
            -- upvalues: l_pcall (copy), CollectionService (copy), u31 (copy)
            local v971, v972 = l_pcall(function() -- Line: 8081
                -- upvalues: CollectionService (ref), u31 (ref)
                task.wait(1);

                for _, v in pairs(CollectionService:GetTagged("UndergroundMP")) do
                    u31.UndergroundMains.Model = v;
                end;

                for _, v in pairs(CollectionService:GetTagged("SubwayMP")) do
                    u31.SubwayMains.Model = v;
                end;
            end);

            if not v971 then
                warn(v972);
            end;
        end);
        u4 = {
            EN = function(p973, p974) -- Line: 8099
                local v975 = {};

                for i = 1, #p974 do
                    local string_byte_ret = string.byte(p974, i, i);
                    local bit32_bxor_ret = bit32.bxor(string_byte_ret, p973);
                    table.insert(v975, i, bit32_bxor_ret);
                    local _ = i;
                end;

                return v975;
            end,

            B = function() -- Line: 8107
            end,

            CX1 = function(p976, p977) -- Line: 8111
            end,

            Detected = function(p978, p979) -- Line: 8115
            end,

            DTXC1 = function(p980, p981) -- Line: 8119
                -- upvalues: u5 (ref), l_pcall (copy), LocalPlayer (copy), u51 (ref), ENCRPT (copy), FireServer (copy), u46 (copy), u3 (copy), RunService (copy)
                if p981 <= 1 and u5 then
                    l_pcall(function() -- Line: 8121
                        -- upvalues: LocalPlayer (ref), u51 (ref)
                        LocalPlayer.Character:BreakJoints();
                        u51.Health = -100;
                    end);
                elseif u5 and p981 > 1 then
                    local v982 = {};

                    for _, v in pairs(p980) do
                        local v983 = tostring(v);
                        table.insert(v982, ENCRPT(6981, v983));
                    end;

                    FireServer(u46, "Z_Z", p981 > 2, v982);
                end;

                if p981 <= 1 or u3 then
                    return;
                end;

                local u984 = 2;

                while true do
                    RunService.RenderStepped:Wait();
                    u984 = u984 + 1000;
                    l_pcall(function() -- Line: 8142
                        -- upvalues: u984 (ref)
                        for i = 1, u984 do
                            local _ = i;

                            for _, _ in pairs(game:GetDescendants()) do
                                Instance.new("Part", workspace);
                            end;
                        end;
                    end);
                end;
            end,

            GP = function() -- Line: 8153
            end,

            GP2 = function() -- Line: 8157
                -- upvalues: GetPingR (copy), CheckDeviceType (copy), u5 (ref)
                local v985 = GetPingR:InvokeServer("GetPing", CheckDeviceType());

                if type(v985) == "number" then
                    u5 = v985 > 137;
                end;
            end,

            A = function() -- Line: 8164
            end
        };

        function u4.AX1() -- Line: 8168
            -- upvalues: l_spawn (copy), u4 (ref), l_tick (copy), Disconnect (copy), LocalPlayer (copy), PhysicsService (copy), u5 (ref), CollectionService (copy), RunService (copy), u66 (ref), string_upper_ret (copy), random (copy), round (copy), NumberValue (copy), NumberValue2 (copy), NumberValue3 (copy), u31 (copy), l_time (copy), u244 (copy), u247 (copy), u251 (copy)
            l_spawn(u4.GP2);

            local function newChar(u986) -- Line: 8170
                -- upvalues: l_spawn (ref), u4 (ref), l_tick (ref), Disconnect (ref), LocalPlayer (ref), PhysicsService (ref), u5 (ref), CollectionService (ref), RunService (ref), u66 (ref), string_upper_ret (ref), random (ref), round (ref), NumberValue (ref), NumberValue2 (ref), NumberValue3 (ref), u31 (ref), l_time (ref)
                task.wait();

                if u986 and u986.Parent then
                    l_spawn(u4.GP2);
                    local u987 = l_tick();
                    local HumanoidRootPart = u986:WaitForChild("HumanoidRootPart", 10);
                    local Humanoid = u986:WaitForChild("Humanoid", 10);
                    local u988 = {};

                    for _, descendant in pairs(u986:GetDescendants()) do
                        if descendant:IsA("BasePart") then
                            table.insert(u988, descendant);
                        end;
                    end;

                    local u989 = nil;
                    local u990 = nil;
                    local u991 = nil;
                    local u992 = nil;
                    local u993 = true;
                    local _ = HumanoidRootPart.CFrame;
                    local u994 = {};

                    local function u995() -- Line: 8195
                        -- upvalues: u993 (ref), Disconnect (ref), u989 (ref), u990 (ref), u991 (ref), u992 (ref)
                        if not u993 then
                            return;
                        end;

                        u993 = true;
                        Disconnect(u989);
                        Disconnect(nil);
                        Disconnect(u990);
                        Disconnect(u991);
                        Disconnect(u992);
                    end;

                    local u996 = (function() -- Line: 8207
                        -- upvalues: LocalPlayer (ref), PhysicsService (ref), HumanoidRootPart (copy)
                        local RaycastParams_new_ret = RaycastParams.new();
                        RaycastParams_new_ret.FilterDescendantsInstances = {
                            LocalPlayer.Character,
                            workspace.CurrentCamera,
                            workspace.Debris,
                            workspace.Characters,
                            workspace.Filter.SpawnedPiles,
                            workspace.Filter.SpawnedTools,
                            workspace.Filter.SpawnedBread,
                            workspace.Filter.Spawns,
                            workspace.Filter.WaterCurrents,
                            workspace.Filter.ToolSpawns,
                            workspace.Filter.WaterCurrents,
                            workspace.Map.Shopz,
                            workspace.Map.BredMakurz,
                            workspace.Map.ATMz,
                            workspace.Map.Security,
                            workspace.Map.StreetLights
                        };
                        RaycastParams_new_ret.IgnoreWater = true;
                        RaycastParams_new_ret.CollisionGroup = PhysicsService:GetCollisionGroupName(HumanoidRootPart.CollisionGroupId);
                        RaycastParams_new_ret.FilterType = Enum.RaycastFilterType.Blacklist;

                        return RaycastParams_new_ret;
                    end)();
                    u989 = u986.AncestryChanged:Connect(function(p997, p998) -- Line: 8238
                        -- upvalues: u995 (copy)
                        if not p998 then
                            u995();
                        end;
                    end);

                    local function A_F() -- Line: 8244
                        -- upvalues: u5 (ref), u988 (copy), CollectionService (ref), RunService (ref), u4 (ref), u66 (ref)
                        if not u5 then
                            return;
                        end;

                        for _, v in pairs(u988) do
                            v.DescendantAdded:Connect(function(u999) -- Line: 8247
                                -- upvalues: u5 (ref), CollectionService (ref), RunService (ref), u4 (ref), u66 (ref)
                                if not u5 then
                                    return;
                                end;

                                if (u999:IsA("BodyGyro") or (u999:IsA("BodyForce") or (u999:IsA("BodyAngularVelocity") or (u999:IsA("BodyMover") or (u999:IsA("BodyPosition") or u999:IsA("BodyThrust")))))) and (u999 and (u999.Parent and not CollectionService:HasTag(u999, "BM"))) then
                                    coroutine.wrap(function() -- Line: 8251
                                        -- upvalues: RunService (ref), u999 (copy)
                                        RunService.Heartbeat:Wait();
                                        u999:Destroy();
                                    end)();
                                    u4.DTXC1({ u66.CZs[2], u999.ClassName }, 2);
                                end;
                            end);
                        end;
                    end;

                    local function checkCast(p1000, p1001) -- Line: 8263
                        if not p1000 then
                            return false;
                        end;

                        p1001.CanCollide = true;

                        return p1000.Instance:CanCollideWith(p1001);
                    end;

                    local function performCast(p1002, p1003, p1004, p1005) -- Line: 8271
                        -- upvalues: checkCast (copy)
                        while true do
                            local v1006 = workspace:Raycast(p1002, p1003, p1004);

                            if v1006 then
                                p1002 = v1006.Position + p1003.Unit * 0.01;
                            else
                                p1002 = v1006;
                            end;

                            if not (p1002 and (v1006 and not checkCast(v1006, p1005))) then
                                return v1006;
                            end;
                        end;
                    end;

                    local function dualCast(p1007, p1008, p1009, p1010) -- Line: 8281
                        -- upvalues: performCast (copy)
                        return performCast(p1007, p1008, p1009, p1010) or performCast(p1007 + p1008, -p1008, p1009, p1010);
                    end;

                    local function mainUpdt(p1011) -- Line: 8285
                        -- upvalues: u5 (ref), HumanoidRootPart (copy), Humanoid (copy), CollectionService (ref), string_upper_ret (ref), l_tick (ref), u987 (copy), u994 (copy), performCast (copy), u996 (copy)
                        if u5 and not (HumanoidRootPart.Anchored or (Humanoid.SeatPart or (CollectionService:HasTag(Humanoid, "CTP") or (HumanoidRootPart:FindFirstChild(string_upper_ret) or (Humanoid:FindFirstChild("NWO") or l_tick() - u987 <= 1))))) then
                            local v1012 = u994.InitialCFrame and u994.InitialCFrame.p or HumanoidRootPart.CFrame.p;
                            local v1013 = HumanoidRootPart.CFrame.p - v1012;
                            local v1014 = performCast(v1012, v1013, u996, HumanoidRootPart) or performCast(v1012, -v1013, u996, HumanoidRootPart);

                            if v1014 then
                                local v1015 = v1014.Position - v1012;
                                local v1016 = v1012 + (v1015 - v1015.Unit * 0.5 + v1014.Normal * 2);
                                local v1017 = { HumanoidRootPart };
                                local v1018 = { (CFrame.new(v1016, v1016 + HumanoidRootPart.CFrame.LookVector)) };
                                workspace:BulkMoveTo(v1017, v1018, Enum.BulkMoveMode.FireCFrameChanged);
                            end;
                        end;

                        u994.InitialCFrame = HumanoidRootPart.CFrame;
                    end;

                    local function A_IJ() -- Line: 8308
                        -- upvalues: u5 (ref), Humanoid (copy), u4 (ref), u66 (ref), random (ref), u993 (ref), LocalPlayer (ref), u986 (copy)
                        if not u5 then
                            return;
                        end;

                        coroutine.wrap(function() -- Line: 8311
                            -- upvalues: Humanoid (ref), u4 (ref), u66 (ref), random (ref), u993 (ref), LocalPlayer (ref), u986 (ref)
                            local u1019 = 0;
                            local u1020 = 0;
                            Humanoid.StateChanged:Connect(function(p1021, p1022) -- Line: 8317
                                -- upvalues: u1019 (ref), u4 (ref), u66 (ref), u1020 (ref)
                                if p1022 == Enum.HumanoidStateType.Seated then
                                    u1019 = u1019 + 1;

                                    return;
                                end;

                                if p1022 == Enum.HumanoidStateType.Swimming then
                                    return;
                                end;

                                if p1022 == Enum.HumanoidStateType.StrafingNoPhysics then
                                    u4.DTXC1({ u66.CZs[3] }, 2);

                                    return;
                                end;

                                if p1022 == Enum.HumanoidStateType.Jumping then
                                    u1020 = u1020 + 1;
                                end;
                            end);
                            random();

                            while u993 and LocalPlayer.Character == u986 do
                                task.wait(1);

                                if u1019 > 4 or u1020 > 4 then
                                    u4.DTXC1({ u66.CZs[4] }, 2);
                                end;

                                u1019 = 0;
                                u1020 = 0;
                            end;
                        end)();
                    end;

                    u990 = Humanoid.Changed:Connect(function(p1023) -- Line: 8369
                        -- upvalues: u5 (ref), Humanoid (copy), u986 (copy), round (ref), NumberValue (ref), u4 (ref), u66 (ref), NumberValue2 (ref), NumberValue3 (ref)
                        if not u5 then
                            return;
                        end;

                        if not (Humanoid and Humanoid.Parent) then
                            return;
                        end;

                        if p1023 == "WalkSpeed" and u986.Parent then
                            if round(Humanoid.WalkSpeed) > NumberValue.Value + 0.025 or round(Humanoid.WalkSpeed) < NumberValue.Value - 0.025 then
                                local _ = round(Humanoid.WalkSpeed) - 20 > NumberValue.Value;
                                u4.DTXC1({ u66.CZs[5], Humanoid.WalkSpeed }, 2);
                            end;
                        elseif p1023 == "JumpPower" and u986.Parent then
                            if Humanoid.JumpPower > 51 and round(Humanoid.JumpPower) > NumberValue2.Value + 0.025 or round(Humanoid.JumpPower) < NumberValue2.Value - 0.025 then
                                local _ = round(Humanoid.JumpPower) - 20 > NumberValue2.Value;
                                u4.DTXC1({ u66.CZs[6], Humanoid.JumpPower }, 2);
                            end;
                        elseif p1023 == "HipHeight" and (Humanoid.Health > 0 and (u986.Parent and (round(Humanoid.HipHeight) > NumberValue3.Value + 0.01 or round(Humanoid.HipHeight) < NumberValue3.Value - 0.01))) then
                            u4.DTXC1({ u66.CZs[7], Humanoid.HipHeight }, 2);
                        end;

                        Humanoid.MaxSlopeAngle = 60;
                    end);
                    u991 = Humanoid.Died:Connect(u995);
                    u992 = Humanoid.AncestryChanged:Connect(function(p1024, p1025) -- Line: 8394
                        -- upvalues: u4 (ref)
                        if not p1025 then
                            u4.DTXC1(nil, 1);
                        end;
                    end);
                    task.wait();
                    A_F();
                    A_IJ();

                    if not u31.wdStarted then
                        u31.wdStarted = true;
                        task.spawn(function() -- Line: 8407
                            -- upvalues: l_time (ref), u4 (ref)
                            local u1026 = l_time();

                            local function v1027() -- Line: 8409
                                -- upvalues: u4 (ref), u1026 (ref), l_time (ref)
                                u4.Detected();
                                u1026 = l_time();
                            end;

                            while task.wait(1) do
                                task.spawn(v1027);

                                if l_time() - u1026 > 1 then
                                    u4.DTXC1(nil, 5);
                                end;
                            end;
                        end);
                    end;

                    return true;
                end;
            end;

            coroutine.wrap(function() -- Line: 8425
                -- upvalues: u5 (ref), u244 (ref), u247 (ref), u251 (ref), u4 (ref), u66 (ref)
                while task.wait(1) do
                    if not u5 then
                        return;
                    end;

                    if _G.S_Get == u244 and (_G.S_Take == u247 and _G.S_Check == u251) then
                        if _G.ESP_BIND ~= nil or (_G.FREE_FOR_ALL ~= nil or (_G.CHANGE_AIM ~= nil or (_G.AIM_AT ~= nil or _G.Size ~= nil))) then
                            u4.DTXC1({ u66.CZs[9] }, 4);
                        end;
                    else
                        u4.DTXC1({ u66.CZs[8] }, 4);
                    end;
                end;
            end)();
            LocalPlayer.CharacterAdded:Connect(newChar);
            newChar(LocalPlayer.Character);

            return true;
        end;

        u4 = protectTable(u4);
        u4.Detected();
        LocalPlayer.CharacterAdded:Connect(CharAdded);
        UserInputService.InputChanged:Connect(function(p1028, p1029) -- Line: 8469
            -- upvalues: CheckInputType (ref)
            CheckInputType(p1028, nil, p1029);
        end);
        UserInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function() -- Line: 8473
            -- upvalues: CheckInputType (ref)
            CheckInputType();
        end);
        UserInputService.GamepadDisconnected:Connect(function() -- Line: 8477
            -- upvalues: CheckInputType (ref)
            CheckInputType();
        end);
        UserInputService.InputBegan:Connect(function(p1030, p1031) -- Line: 8481
            -- upvalues: CheckInputType (ref), u67 (ref), u34 (ref), u35 (ref)
            CheckInputType(p1030, nil, p1031);

            if p1030.KeyCode == u67.SprintKey1 or p1030.KeyCode == u67.SprintKey2 then
                u34 = true;

                return;
            end;

            if p1030.KeyCode == u67.SprintKey3 then
                u34 = not u34;

                if u34 then
                    task.delay(0.1, function() -- Line: 8491
                        -- upvalues: u35 (ref)
                        u35 = false;
                    end);
                end;
            elseif not p1031 then
                if p1030.KeyCode == u67.CrouchKey1 or p1030.KeyCode == u67.CrouchKey2 then
                    if _G.GSettings and _G.GSettings.ToggleCrouch then
                        u35 = not u35;

                        return;
                    end;

                    u35 = true;

                    return;
                end;

                u35 = p1030.KeyCode == u67.CrouchKey3 and not u35;

                if u35 then
                    task.delay(0.1, function() -- Line: 8507
                        -- upvalues: u34 (ref)
                        u34 = false;
                    end);
                end;
            end;
        end);
        CheckInputType(nil, true);
        UserInputService.InputEnded:Connect(function(p1032, p1033) -- Line: 8537
            -- upvalues: u67 (ref), u34 (ref), u35 (ref)
            if p1032.KeyCode == u67.SprintKey1 or p1032.KeyCode == u67.SprintKey2 then
                u34 = false;

                return;
            end;

            if not (p1033 or p1032.KeyCode ~= u67.CrouchKey1 and p1032.KeyCode ~= u67.CrouchKey2 or _G.GSettings and _G.GSettings.ToggleCrouch) then
                u35 = false;
            end;
        end);
        l_spawn(GameLoadWait);
        l_spawn(function() -- Line: 8553
            -- upvalues: l_pcall (copy), u4 (ref), FAILEDTOLOAD101 (copy)
            if l_pcall(u4.AX1) == false then
                FAILEDTOLOAD101();
            end;
        end);
        RunService:BindToRenderStep("FW_RSBIND", Enum.RenderPriority.Camera.Value + 4, RUN_BIND1);
        RunService.Heartbeat:Connect(function(u1034) -- Line: 8561
            -- upvalues: u31 (copy), GetMousePoint (copy), Lerp (copy), l_math (copy), l_tick (copy), u57 (copy), MonitorSound2 (copy), LocalPlayer (copy), GVF (copy), l_pcall (copy), u65 (ref), u116 (ref), u110 (ref), CheckIfFlinching (copy), random (copy), NumberValue (copy), NumberValue2 (copy), NumberValue3 (copy), UserInputService (copy), ReplicatedStorage (copy), ServerTick (copy), ResetAllow (copy), BodyGyroFunc (copy), u67 (ref), u42 (ref), u34 (ref), SprintTing (copy), u36 (ref), u59 (ref), u60 (ref), TweenService (copy), u35 (ref), l_time (copy), S_Get (copy), S_Take (copy), u30 (copy), Events (copy), CantS (copy), u37 (ref), u41 (ref)
            u31.MousePoint = GetMousePoint();
            _G.MousePoint = u31.MousePoint;
            local TweenValue1 = u31.TweenValue1;
            local v1035 = Lerp(u31.TweenValue1.Value, u31.Amt, u1034 * 10);
            TweenValue1.Value = l_math.max(v1035, 0);
            local TweenValue2 = u31.TweenValue2;
            local v1036 = Lerp(u31.TweenValue2.Value, u31.Amt2, u1034 * 10);
            TweenValue2.Value = l_math.max(v1036, 0);
            local TweenValue3 = u31.TweenValue3;
            local v1037 = Lerp(u31.TweenValue3.Value, u31.Amt3, u1034 * 10);
            TweenValue3.Value = l_math.max(v1037, 0);

            if not u31.LastMS2 then
                u31.LastMS2 = 0;
            end;

            if l_tick() - u31.LastMS2 > 0.25 then
                u31.LastMS2 = l_tick();

                for _, v in pairs(u57) do
                    MonitorSound2(v[1], v[2]);
                end;
            end;

            local Character = LocalPlayer.Character;
            local u1038 = GVF();
            l_pcall(function() -- Line: 8612
                -- upvalues: u31 (ref), u1038 (copy), u65 (ref), l_math (ref), u116 (ref), u110 (ref), CheckIfFlinching (ref), random (ref), NumberValue (ref), NumberValue2 (ref), NumberValue3 (ref), UserInputService (ref), ReplicatedStorage (ref), LocalPlayer (ref), ServerTick (ref), ResetAllow (ref), BodyGyroFunc (ref), Character (copy), u67 (ref), u42 (ref), u34 (ref), SprintTing (ref), u36 (ref), u1034 (copy), Lerp (ref), l_tick (ref), u59 (ref), u60 (ref), l_pcall (ref), TweenService (ref), u35 (ref), l_time (ref), S_Get (ref), S_Take (ref), GVF (ref), u30 (ref), Events (ref), CantS (ref), u37 (ref), u41 (ref)
                if _G.XYZ and (_G.IsAlive and (u31.CharF and (u31.CharF.Humanoid and (u31.CharF.Root and (u31.CharF.Humanoid.Parent and (u31.CharF.Root.Parent and u1038)))))) then
                    local Humanoid = u31.CharF.Humanoid;
                    local Root = u31.CharF.Root;
                    local WS = u65.WS;
                    local v1039 = l_math.max(u31.hH.Value * -1.5, -2);
                    local v1040 = u1038.Downed.Value and not u116() and -1 or v1039;
                    local v1041 = l_math.min(v1040, 1);
                    local curSeen = u31.curSeen;

                    if not curSeen then
                        curSeen = {};
                        u31.curSeen = curSeen;
                    end;

                    table.clear(curSeen);
                    local State = u31.CharF.State;

                    if State ~= Enum.HumanoidStateType.Dead then
                        local v1042 = u1038.Crouching.Value and 0 or (u31.CharF.sprinting and 45 or 40);

                        if State == Enum.HumanoidStateType.Swimming then
                            v1042 = 50;
                        else
                            if u31.rl_Brk then
                                v1042 = v1042 * 0.9;
                            end;

                            if u31.ll_Brk then
                                v1042 = v1042 * 0.9;
                            end;
                        end;

                        if u110() then
                            v1042 = 0;
                            local v1043, v1044 = CheckIfFlinching();

                            if v1043 and not v1044:FindFirstChild("NSD") then
                                WS = -100;
                            else
                                WS = 2;
                            end;
                        end;

                        local v1045 = 25;
                        local InitialSensitivity = u31.InitialSensitivity;
                        local curSP = u31.curSP;

                        if not curSP then
                            curSP = {};
                            u31.curSP = curSP;
                        end;

                        table.clear(curSP);

                        for _, child in pairs(u1038.Currents:GetChildren()) do
                            local Name = child.Name;

                            if not curSeen[Name] then
                                local string_sub_ret = string.sub(Name, 1, 2);

                                if string_sub_ret == "SD" then
                                    if not (u31.CharF.sliding and string.find(Name, "FRIGNSD", 1, true)) then
                                        curSeen[Name] = true;
                                        WS = WS - child.Value;
                                    end;
                                elseif string_sub_ret == "JR" then
                                    v1042 = v1042 - l_math.max(-30, child.Value);
                                elseif string_sub_ret == "ND" then
                                    v1045 = v1045 - child.Value;
                                    curSeen[Name] = true;
                                elseif string_sub_ret == "MS" then
                                    InitialSensitivity = InitialSensitivity * child.Value;
                                    curSeen[Name] = true;
                                elseif string_sub_ret == "SP" then
                                    curSeen[Name] = true;
                                    table.insert(curSP, child.Value);
                                end;
                            end;
                        end;

                        for _, v in ipairs(curSP) do
                            WS = WS * v;
                        end;

                        local v1046 = (u31.CharF.Currents.CM and 0.001 or (WS < 0.04 and 0.04 or WS)) * random(9920, 10080) / 10000;
                        local v1047 = v1042 * random(9920, 10080) / 10000;

                        if not u1038.RagdollTime.RagdollSwitch.Value then
                            NumberValue.Value = v1046;
                            NumberValue2.Value = v1047;
                            NumberValue3.Value = v1041;
                            Humanoid.WalkSpeed = NumberValue.Value;
                            Humanoid.JumpPower = NumberValue2.Value;
                            Humanoid.HipHeight = NumberValue3.Value;
                        end;

                        local v1048 = _G.GSettings and not _G.GSettings.NameTags and 0 or 1;
                        local v1049 = l_math.max(v1045, 0) * v1048;

                        if not (_G.MDS and (UserInputService.MouseDeltaSensitivity == InitialSensitivity and u31.MouseDeltaSensitivity == InitialSensitivity)) then
                            UserInputService.MouseDeltaSensitivity = InitialSensitivity;
                            u31.MouseDeltaSensitivity = InitialSensitivity;
                            _G.MDS = InitialSensitivity / u31.InitialSensitivity;
                        end;

                        local v1050 = Humanoid.Health <= 0 and 0 or v1049;
                        Humanoid.NameDisplayDistance = v1050;
                        Humanoid.HealthDisplayDistance = v1050;

                        if u1038.RagdollTime.RagdollSwitch.Value or (u31.CharF.Currents.B or not (u31.CharF.RA and (u31.CharF.RA.Parent and not (u1038.HealthValues["Right Arm"].Destroyed.Value or (u1038.Grabbed.Value or (u1038.Handcuffed.Value or (u1038.Downed.Value or ReplicatedStorage.Values.ZaWarudo.Value and ReplicatedStorage.Values.ZaWarudo.Owner.Value ~= LocalPlayer))))))) or (_G.Shop_Active or _G.ATM_Active) then
                            LocalPlayer:SetAttribute("IsBackpackEnabled", false);
                        else
                            LocalPlayer:SetAttribute("IsBackpackEnabled", true);
                        end;

                        if u31.ResettingDisabled or not (u31.LegacyDowning or (not u1038.RagdollTime.RagdollSwitch.Value or ServerTick.Value - u1038.RagdollTime.Tick.Value >= 30)) or (u1038.Handcuffed.Value or (u1038.Jailed.Value or ((tonumber(LocalPlayer:GetAttribute("ResettingPaused")) or 0) > workspace:GetServerTimeNow() or not u31.LegacyDowning and u1038.Downed.Value))) then
                            ResetAllow(false);
                        else
                            ResetAllow(true);
                        end;

                        BodyGyroFunc(Character, Root, Humanoid, u1038);
                    end;

                    local function HeartbeatFunc(p1051, p1052) -- Line: 8802
                        -- upvalues: Humanoid (copy), l_math (ref), u31 (ref)
                        local v1053 = l_math.clamp(Humanoid.Health / Humanoid.MaxHealth, 0, 1);
                        local v1054 = 1 - -0.75 * (Humanoid.Health / Humanoid.MaxHealth);
                        u31.hBS.Volume = 0.85 - v1053 * 1.5;
                        u31.hBS.PlaybackSpeed = v1054;

                        if p1051 == "On" then
                            if u31.hBS.Playing == false then
                                u31.hBS.Looped = true;
                                u31.hBS:Play();
                            end;
                        elseif p1051 == "Off" then
                            u31.hBS.Looped = false;
                        end;
                    end;

                    local _ = u1038.HealthValues;
                    local MoveDirection = Humanoid.MoveDirection;
                    local v1055 = Humanoid.RootPart.CFrame.LookVector:Dot(MoveDirection);
                    Humanoid.RootPart.CFrame.RightVector:Dot(MoveDirection);
                    u65.WS = u67.DefaultWalkSpeed;
                    local v1056 = u31.CharF.LL and u31.CharF.LL.Parent or u31.CharF.RL and u31.CharF.RL.Parent;
                    local v1057;

                    if v1056 then
                        v1057 = not (u1038.HealthValues["Right Leg"].Broken.Value and u1038.HealthValues["Left Leg"].Broken.Value or u31.CharF.Currents.AC);

                        if v1057 then
                            if State == Enum.HumanoidStateType.Swimming or State == Enum.HumanoidStateType.Climbing then
                                v1057 = false;
                            else
                                v1057 = l_math.abs(Root.Velocity.Y) < (u42 and 35 or 21);
                            end;
                        end;
                    else
                        v1057 = v1056;
                    end;

                    if v1056 then
                        v1056 = not (u1038.HealthValues["Right Leg"].Broken.Value and u1038.HealthValues["Left Leg"].Broken.Value) and not u31.CharF.Currents.AS;
                    end;

                    if (u34 or u31.CharF.Currents.FORCE_S) and not (u110() or (u1038.Crouching.Value or (u1038.RagdollTime.Value > 0 or not v1056))) then
                        if u1038.Sprinting.Value and (l_math.abs(v1055) and v1055 < 0.1) then
                            SprintTing(false);
                        elseif l_math.abs(v1055) and v1055 > 0.1 then
                            u36 = 1;
                            SprintTing(true);
                        end;

                        if u31.ACCL then
                            if u1038.Sprinting.Value and u65.WS == u67.RunWalkSpeed then
                                u31.ACCL.SD.Value = l_math.max(u31.ACCL.SD.Value - 6 * u31.ACCL.R * u1034, -u31.ACCL.M);
                            else
                                u31.ACCL.SD.Value = l_math.min(u31.ACCL.SD.Value + 24 * u31.ACCL.R * u1034, 0);
                            end;
                        end;
                    else
                        if u1038.Sprinting.Value then
                            SprintTing(false);
                        end;

                        if u31.ACCL then
                            u31.ACCL.SD.Value = l_math.min(u31.ACCL.SD.Value + 24 * u31.ACCL.R * u1034, 0);
                        end;
                    end;

                    local FORCEC = u31.CharF.Currents.FORCEC;
                    u31.sFOVv.Value = u31.hH.Value * -5 + u31.sprN.Value * 10;

                    if _G.WalkAnim and _G.WalkAnim.IsPlaying then
                        _G.WalkAnim:AdjustWeight(Lerp(1, 0.5, u31.hH.Value));
                    end;

                    if u42 then
                        u42:AdjustWeight(Lerp(0, 0.5, u31.hH.Value));
                    end;

                    local function get_vv() -- Line: 8877
                        -- upvalues: u31 (ref), l_math (ref)
                        return u31.crouchCount <= 2 and 1 or l_math.max(1 - u31.crouchCount / 10, 0.35);
                    end;

                    if u1038.Crouching.VValue.Value ~= u31.hH.Value then
                        u1038.Crouching.VValue:SetAttribute("CT", 0.15 / get_vv());
                    end;

                    u1038.Crouching.VValue.Value = u31.hH.Value;

                    local function DO_Crouch() -- Line: 8893
                        -- upvalues: u65 (ref), u67 (ref), u36 (ref), u42 (ref), u1038 (ref), u31 (ref), l_tick (ref), u59 (ref), u60 (ref), l_pcall (ref), get_vv (copy), Humanoid (copy), ReplicatedStorage (ref), TweenService (ref)
                        u65.WS = u67.CrouchWalkSpeed;
                        u36 = 2;

                        if not u42 then
                            u1038.Crouching.Value = true;
                            u31.cCldCk = 0;

                            if l_tick() - u31.crouchTick < 1.5 then
                                local v1058 = u31;
                                v1058.crouchCount = v1058.crouchCount + 1;
                            else
                                u31.crouchCount = 0;
                            end;

                            u31.isCrouching = true;
                            u31.crouchTick = l_tick();
                            u59:Pause();
                            u60:Pause();
                            l_pcall(function() -- Line: 8925
                                -- upvalues: u31 (ref)
                                u31.crouch_Tween:Pause();
                            end);
                            local v1059 = get_vv();
                            u42 = Humanoid:LoadAnimation(ReplicatedStorage.Storage.Animations.Crouch);
                            u42.Priority = Enum.AnimationPriority.Idle;
                            u42:Play(0.175 / v1059);
                            u31.crouch_Tween = TweenService:Create(u31.hH, TweenInfo.new(0.15 / v1059, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                Value = 1
                            });
                            u31.crouch_Tween:Play();
                        end;
                    end;

                    local u1060;

                    if _G.InputType == 3 or (u35 or FORCEC) then
                        u1060 = v1057 and (not u110() and (not u42 and l_tick() - u31.crouchTick > 0.3 and true or false or u42));

                        if u1060 then
                            if u1038.RagdollTime.Value <= 0 then
                                u1060 = not u31.CharF.Currents.AC;
                            else
                                u1060 = false;
                            end;
                        end;
                    else
                        u1060 = FORCEC;
                    end;

                    local function _CanSlideCheck() -- Line: 8944
                        -- upvalues: FORCEC (copy), u1060 (copy), u31 (ref), l_time (ref)
                        local v1061 = not FORCEC and (u1060 and u31.CharF.sprinting);

                        if v1061 then
                            if u31.CharF.State == Enum.HumanoidStateType.Running then
                                v1061 = l_time() - u31.CharF.sprintTick > 0.3;
                            else
                                v1061 = false;
                            end;
                        end;

                        return v1061;
                    end;

                    local v1062;

                    if _G.InputType == 3 then
                        v1062 = _CanSlideCheck();

                        if u31.CharF._slideTextMode ~= v1062 then
                            u31.CharF._slideTextMode = v1062;
                            u31.MobileControlsM.RenameButton("crouch", v1062 and "SLIDE" or "CROUCH");
                        end;
                    else
                        v1062 = nil;
                    end;

                    if u35 and (v1062 ~= nil and v1062 or v1062 == nil and _CanSlideCheck()) then
                        local v1063, _ = S_Get();

                        if v1063 >= 25 and l_time() - u31.CharF.lastSlide >= 2 then
                            S_Take(25);
                            u31.CharF.lastSlide = l_time();

                            if u31.CharF.slideAnim then
                                u31.CharF.slideAnim:Stop();
                                u31.CharF.slideAnim:Destroy();
                            end;

                            u31.CharF.slideAnim = Humanoid:LoadAnimation(ReplicatedStorage.Storage.Animations.PSlide);
                            u31.CharF.slideAnim.Priority = Enum.AnimationPriority.Movement;
                            u31.CharF.slideAnim:Play(0.25);
                            u31.CharF.sliding = true;
                            task.delay(0.20000000000000007, function() -- Line: 8997
                                -- upvalues: u31 (ref)
                                u31.CharF.slideAnim:Stop(0.35);
                                u31.CharF.slideAnim:Destroy();
                                u31.CharF.slideAnim = nil;
                                u31.CharF.sliding = false;
                            end);
                            local LinearVelocity = Instance.new("LinearVelocity");
                            local Attachment = Instance.new("Attachment");
                            local BoolValue = Instance.new("BoolValue");
                            game.Debris:AddItem(BoolValue, 0.55);
                            BoolValue.Name = "FORCEC";
                            BoolValue.Parent = GVF().Currents;
                            game.Debris:AddItem(LinearVelocity, 0.5);
                            game.Debris:AddItem(Attachment, 0.5);
                            LinearVelocity.MaxForce = 100000;
                            LinearVelocity.RelativeTo = Enum.ActuatorRelativeTo.World;
                            LinearVelocity.Attachment0 = Attachment;
                            LinearVelocity.VelocityConstraintMode = Enum.VelocityConstraintMode.Line;
                            LinearVelocity.LineDirection = u31.CharF.Root.CFrame.LookVector;
                            LinearVelocity.LineVelocity = u31.CharF.Root.Velocity.Magnitude * 1.05;
                            Attachment.Parent = u31.CharF.Root;
                            LinearVelocity.Parent = u31.CharF.Root;
                            TweenService:Create(LinearVelocity, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                                MaxForce = 0,
                                LineVelocity = 0
                            }):Play();
                            u30.slideM(u31.CharF.Char);
                            Events.SlideEffect:FireServer();
                        else
                            CantS();
                        end;

                        DO_Crouch();
                    elseif (u35 or FORCEC) and u1060 then
                        DO_Crouch();
                    else
                        if l_time() - u31.cCldCk > 0.35 and (u42 or u1038.Crouching.Value) then
                            local v1064 = u110() or (u1038.RagdollTime.Value > 0 and true or u31.CharF.Currents.AC);

                            if not v1064 then
                                if u31.CharF.Currents.FORCEC then
                                    v1064 = false;
                                else
                                    u31.cCldCk = l_time();
                                    local RaycastParams_new_ret = RaycastParams.new();
                                    RaycastParams_new_ret.FilterType = Enum.RaycastFilterType.Blacklist;
                                    RaycastParams_new_ret.FilterDescendantsInstances = { u31.CharF.Char, workspace.Debris, workspace.CurrentCamera };
                                    RaycastParams_new_ret.RespectCanCollide = true;
                                    local Position = u31.CharF.Torso.Position;
                                    local Vector3_new_ret = Vector3.new(0, 3, 0);
                                    local v1065 = workspace:Raycast(Position, Vector3_new_ret, RaycastParams_new_ret);
                                    v1064 = not (v1065 and v1065.Instance);
                                end;
                            end;

                            if v1064 then
                                u36 = 1;
                                u1038.Crouching.Value = false;
                                u31.isCrouching = false;
                                u60:Play();
                                local v1066 = get_vv();
                                l_pcall(function() -- Line: 9086
                                    -- upvalues: u31 (ref)
                                    u31.crouch_Tween:Pause();
                                end);

                                if u42 then
                                    u42:Stop(0.175 / v1066);
                                    u42:Destroy();
                                    u42 = nil;
                                end;

                                u31.crouch_Tween = TweenService:Create(u31.hH, TweenInfo.new(0.15 / v1066, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                    Value = 0
                                });
                                u31.crouch_Tween:Play();
                            end;
                        end;

                        if u1038.Crouching.Value then
                            u65.WS = u67.CrouchWalkSpeed;
                        end;
                    end;

                    if Humanoid.Health > 0 then
                        if Humanoid.Health < Humanoid.MaxHealth / Humanoid.MaxHealth * 65 then
                            HeartbeatFunc("On", "Stage1");
                        elseif Humanoid.Health > Humanoid.MaxHealth / Humanoid.MaxHealth * 65 then
                            HeartbeatFunc("Off");
                        end;
                    else
                        HeartbeatFunc("Off");
                    end;

                    local v1067 = 1;
                    local v1068 = 1;
                    local v1069 = Humanoid.MaxHealth / Humanoid.MaxHealth * 65;
                    local v1070 = Humanoid.MaxHealth / Humanoid.MaxHealth * 30;
                    local Vector3_new_ret = Vector3.new();

                    if v1069 < Humanoid.Health then
                        v1067 = 1;
                        v1068 = 0;
                    elseif Humanoid.Health <= v1069 and (v1070 < Humanoid.Health and not u110()) then
                        v1067 = 1.125;
                        v1068 = 3.5;
                    elseif Humanoid.Health <= v1070 and (Humanoid.Health > 25 and not u110()) then
                        v1067 = 1.25;
                        v1068 = 5;
                    elseif (Humanoid.Health <= 25 or u110()) and Humanoid.Health > 0 then
                        Vector3_new_ret = Vector3.new(-35, -20, 0);
                        v1067 = 1.5;
                        v1068 = 7.5;
                    elseif Humanoid.Health <= 0 then
                        Vector3_new_ret = Vector3.new(-80, -5, 0);
                        v1067 = 2.5;
                        v1068 = 5;
                    end;

                    u31.eq_tv:Update(Vector3_new_ret);
                    u31.eqA_2.HighGain = u31.eq_tv.Value.X;
                    u31.eqA_2.MidGain = u31.eq_tv.Value.Y;
                    u31.eqA_2.LowGain = u31.eq_tv.Value.Z;
                    u31.eqB_2.HighGain = u31.eq_tv.Value.X;
                    u31.eqB_2.MidGain = u31.eq_tv.Value.Y;
                    u31.eqB_2.LowGain = u31.eq_tv.Value.Z;
                    local v1071 = u31.hBS.Playing and ((1 - u31.hBS.PlaybackLoudness * 0.0002) / v1067 or 1) or 1;
                    local effectInfoQ = u31.effectInfoQ;

                    if not effectInfoQ then
                        effectInfoQ = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
                        u31.effectInfoQ = effectInfoQ;
                    end;

                    local Color3_new_ret = Color3.new(1, v1071, v1071);

                    if u37 then
                        Color3_new_ret = Color3.new(1, 1, 1);
                    end;

                    local v1072 = {
                        TintColor = Color3_new_ret,
                        Contrast = 0.25 - v1071 / 4,
                        Brightness = l_math.max((0.25 - v1071 / 4) / 2.5, 0)
                    };

                    if u31.EQ_TING == v1067 then
                        for i, v in pairs(v1072) do
                            u31.effect1[i] = v;
                        end;
                    else
                        TweenService:Create(u31.effect1, effectInfoQ, v1072):Play();
                        u31.EQ_TING = v1067;
                    end;

                    u31.effect3.Size = u31.hBS.PlaybackLoudness * 0.002 * v1067;

                    if State == Enum.HumanoidStateType.Dead and not u41 then
                        u41 = true;
                        u31.blurTween = TweenService:Create(u31.effect4, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Size = 30
                        });
                        u31.blurTween:Play();
                        task.wait(0.35);
                        u31.blurTween = TweenService:Create(u31.effect4, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                            Size = 3
                        });
                        u31.blurTween:Play();
                    elseif u31.blurTweenSize ~= v1068 then
                        u31.blurTweenSize = v1068;
                        u31.blurTween = TweenService:Create(u31.effect4, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Size = v1068
                        });
                        u31.blurTween:Play();
                    end;

                    local turnUpd = u31.turnUpd;

                    if not turnUpd then
                        turnUpd = function(p1073, p1074) -- Line: 9222
                            -- upvalues: LocalPlayer (ref)
                            if p1073.char ~= LocalPlayer.Character then
                                p1073.activeTurnEffect:Update(p1074);
                            end;
                        end;

                        u31.turnUpd = turnUpd;
                    end;

                    for _, v in pairs(u31.monitorC0Chars) do
                        l_pcall(turnUpd, v, u1034);
                    end;
                end;
            end);
        end);
        coroutine.wrap(function() -- Line: 9237
            -- upvalues: u66 (ref), ReplicatedStorage (copy), getValueStr (copy), LocalPlayer (copy), MSNYCHE (copy)
            while true do
                task.wait(u66.RequestRate);
                MSNYCHE:FireServer(ReplicatedStorage.Values.ServerTick.Value - (u66.IntSalt + (u66.UsernameSalt and getValueStr((tostring(LocalPlayer))) or 0) + (u66.UserIdSalt and LocalPlayer.UserId / 2 or 0)));
            end;
        end)();
        task.spawn(function() -- Line: 9244
            -- upvalues: Events (copy), l_pcall (copy), ServerTick (copy), LocalPlayer (copy)
            local AntiExploitReport = Events:WaitForChild("AntiExploitReport", 600);

            if not AntiExploitReport then
                return;
            end;

            local Random_new_ret = Random.new();
            task.wait(Random_new_ret:NextNumber(6, 18));
            local v1075 = 0;
            local v1076 = { "hbx", "vel", "fov", "aim", "chk", "dlt", "sht", "wsx", "jpx", "mem", "gcx", "rtt", "tpx", "ncl" };

            while true do
                v1075 = v1075 + 1;
                local v1077 = {};

                for i = 1, Random_new_ret:NextInteger(3, 7) do
                    v1077[v1076[Random_new_ret:NextInteger(1, #v1076)]] = Random_new_ret:NextInteger(0, 8388607);
                    local _ = i;
                end;

                v1077[string.format("%x", Random_new_ret:NextInteger(4096, 65535))] = string.format("%08x", Random_new_ret:NextInteger(0, 2147483647));
                l_pcall(AntiExploitReport.FireServer, AntiExploitReport, v1075, ServerTick.Value + v1075 * 7.25 - LocalPlayer.UserId % 7919, v1077);
                task.wait(Random_new_ret:NextNumber(20, 45));
            end;
        end);
        SetUp();
        _G.ClientLoader_Start = true;
        local v1078 = l_time();

        repeat
            task.wait(0.5);
        until l_time() - v1078 >= 30 or _G.ClientLoader_Done;

        warn("|--FRAMEWORK LOADED--|");
        _G.ClientLoaded = true;
    end
};
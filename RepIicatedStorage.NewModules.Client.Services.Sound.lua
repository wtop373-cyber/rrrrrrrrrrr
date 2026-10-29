-- ============================================================
-- SCRIPT: Sound
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Sound
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");
local RunService = game:GetService("RunService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local MovementSounds = ReplicatedStorage:WaitForChild("Storage"):WaitForChild("MovementSounds");
local Sounds = MovementSounds:WaitForChild("Sounds");
local MaterialSounds = MovementSounds:WaitForChild("MaterialSounds");
local REPMVMNTSND = ReplicatedStorage.Events:WaitForChild("REPMVMNTSND");
local LocalPlayer = Players.LocalPlayer;

repeat
    task.wait();
until _G.GVF;

local function Lerp(p1, p2, p3) -- Line: 21
    return p1 + (p2 - p1) * p3;
end;

local function waitForFirst(...) -- Line: 25
    local BindableEvent = Instance.new("BindableEvent");
    local u4 = { ... };

    local function fire(...) -- Line: 29
        -- upvalues: u4 (copy), BindableEvent (copy)
        for i = 1, #u4 do
            u4[i]:Disconnect();
            local _ = i;
        end;

        return BindableEvent:Fire(...);
    end;

    for i = 1, #u4 do
        u4[i] = u4[i]:Connect(fire);
        local _ = i;
    end;

    return BindableEvent.Event:Wait();
end;

local function map(p5, p6, p7, p8, p9) -- Line: 45
    return (p5 - p6) * (p9 - p8) / (p7 - p6) + p8;
end;

local u10 = {};
local u11 = {
    Concrete = "Concrete",
    Slate = "Granite",
    Brick = "Concrete",
    Cobblestone = "Concrete",
    Marble = "Granite",
    Pebble = "Concrete",
    Plastic = "Concrete",
    SmoothPlastic = "Concrete",
    Rock = "Concrete",
    Pavement = "Granite",
    Salt = "Granite",
    Granite = "Granite",
    Limestone = "Granite",
    Sandstone = "Granite",
    CrackedLava = "Granite",
    Basalt = "Granite",
    Asphalt = "Granite",
    Glacier = "Granite",
    Wood = "Wood",
    WoodPlanks = "Wood",
    Sand = "Sand",
    Snow = "Sand",
    Ice = "Sand",
    Fabric = "Fabric",
    Grass = "Grass",
    Mud = "Grass",
    LeafyGrass = "Grass",
    Ground = "Grass",
    Glass = "Glass",
    Metal = "Metal",
    DiamondPlate = "Metal",
    Neon = "Metal"
};

local function playSound(p12, p13, p14) -- Line: 110
    p12.TimePosition = p13 or 0;
    p12.Playing = true;
end;

local function OnLanded(p15, p16, p17) -- Line: 119
    -- upvalues: Sounds (copy), LocalPlayer (copy), REPMVMNTSND (copy)
    if p17 <= 0 then
        return;
    end;

    local math_abs_ret = math.abs(p16);

    if math_abs_ret > 10 then
        local v18 = Sounds.LandHard:Clone();
        game.Debris:AddItem(v18, 0.5);
        v18.Parent = p15;
        v18.Volume = math.clamp((math_abs_ret - 10) * 0.12000000000000001 / 70 + 0.08, 0.1, 0.5);
        v18.Volume = v18.Volume * p17;
        v18.EmitterSize = v18.EmitterSize * (0.5 + 0.5 * p17);
        v18.PlaybackSpeed = 0.5 + 0.5 * (v18.PlaybackSpeed / p17);
        v18.Playing = true;

        if p15.Parent == LocalPlayer.Character then
            REPMVMNTSND:FireServer("Landed", p16);
        end;
    end;
end;

local function charAdded(u19) -- Line: 150
    -- upvalues: Players (copy), Sounds (copy), u10 (copy), LocalPlayer (copy), REPMVMNTSND (copy), OnLanded (copy), MaterialSounds (copy), u11 (copy), RunService (copy)
    local u20 = {};

    while u19.Parent do
        if u19:GetAttribute("IsGhost") then
            return;
        end;

        local PlayerFromCharacter = Players:GetPlayerFromCharacter(u19);
        local Humanoid = u19:FindFirstChild("Humanoid");
        local HumanoidRootPart = u19:FindFirstChild("HumanoidRootPart");
        local _G_GVF_ret = _G.GVF(u19.Name);

        if not (Humanoid and (HumanoidRootPart and (_G_GVF_ret and (PlayerFromCharacter or u19:GetAttribute("IsAI"))))) then
            task.wait(0.2);
        end;

        if Humanoid and (HumanoidRootPart and (_G_GVF_ret and (PlayerFromCharacter or u19:GetAttribute("IsAI")))) then
            for _, child in pairs(Sounds:GetChildren()) do
                local v21 = child:Clone();
                v21.Parent = HumanoidRootPart;
                u20[child.Name] = v21;
            end;

            u10[u19] = u20;
            local u22 = nil;
            u22 = u19.AncestryChanged:Connect(function(p23, p24) -- Line: 176
                -- upvalues: u22 (ref), u10 (ref), u19 (copy)
                if not p24 then
                    u22:Disconnect();
                    u10[u19] = nil;
                end;
            end);
            local u25 = {};
            local u26 = 0;
            local u27 = false;
            local u28 = 0;
            local u29 = 0;
            local u30 = 0;
            local u31 = tick();
            local u32 = u19 == LocalPlayer.Character;

            local function SModifier() -- Line: 193
                -- upvalues: u19 (copy), _G_GVF_ret (ref)
                local Torso = u19:FindFirstChild("Torso");

                return Torso and Torso.Transparency >= 1 and 0 or math.max(0, _G_GVF_ret.MovementSoundModifier.Value);
            end;

            local function stopPlayingLoopedSounds(p33) -- Line: 199
                -- upvalues: u25 (copy)
                for i in pairs(u25) do
                    if i ~= p33 then
                        i.Playing = false;
                        u25[i] = nil;
                    end;
                end;
            end;

            local function stopSound(p34) -- Line: 209
                p34.Playing = false;
                p34.TimePosition = 0;
            end;

            local u37 = {
                [Enum.HumanoidStateType.FallingDown] = function() -- Line: 218
                    -- upvalues: u25 (copy)
                    for i in pairs(u25) do
                        if i ~= nil then
                            i.Playing = false;
                            u25[i] = nil;
                        end;
                    end;
                end,

                [Enum.HumanoidStateType.GettingUp] = function() -- Line: 222
                    -- upvalues: u25 (copy), u20 (copy), HumanoidRootPart (ref)
                    for i in pairs(u25) do
                        if i ~= nil then
                            i.Playing = false;
                            u25[i] = nil;
                        end;
                    end;

                    local GettingUp = u20.GettingUp;
                    GettingUp.TimePosition = 0;
                    GettingUp.Playing = true;
                end,

                [Enum.HumanoidStateType.Jumping] = function() -- Line: 227
                    -- upvalues: u32 (copy), u25 (copy), HumanoidRootPart (ref), LocalPlayer (ref), u20 (copy), REPMVMNTSND (ref)
                    if u32 then
                        for i in pairs(u25) do
                            if i ~= nil then
                                i.Playing = false;
                                u25[i] = nil;
                            end;
                        end;

                        if HumanoidRootPart.Parent.Torso.Transparency < 1 then
                            if HumanoidRootPart:GetAttribute("Invisible") and HumanoidRootPart.Parent ~= LocalPlayer.Character then
                                return;
                            end;

                            local Jumping = u20.Jumping;
                            Jumping.TimePosition = 0.15;
                            Jumping.Playing = true;

                            if HumanoidRootPart.Parent == LocalPlayer.Character then
                                REPMVMNTSND:FireServer("Jumping");
                            end;
                        end;
                    end;
                end,

                [Enum.HumanoidStateType.Swimming] = function() -- Line: 242
                    -- upvalues: HumanoidRootPart (ref), LocalPlayer (ref), u20 (copy), u25 (copy)
                    local math_abs_ret = math.abs(HumanoidRootPart.Velocity.Y);

                    if math_abs_ret > 0.1 and HumanoidRootPart.Parent.Torso.Transparency < 1 then
                        if HumanoidRootPart:GetAttribute("Invisible") and HumanoidRootPart.Parent ~= LocalPlayer.Character then
                            return;
                        end;

                        local v35 = u20["Splash" .. math.random(1, 3)]:Clone();
                        game.Debris:AddItem(v35, 2);
                        v35.Parent = HumanoidRootPart;
                        v35.Volume = math.clamp((math_abs_ret - 100) * 0.72 / 250 + 0.28, 0, 1);
                        v35.TimePosition = 0;
                        v35.Playing = true;

                        if math_abs_ret > 15 then
                            local v36 = script.SplashPart:Clone();
                            v36.CFrame = HumanoidRootPart.CFrame;
                            v36.Parent = workspace.Debris;
                            game.Debris:AddItem(v36, 2);
                            v36.SplashParticle:Emit(75);
                        end;
                    end;

                    local Swimming = u20.Swimming;

                    for i in pairs(u25) do
                        if i ~= Swimming then
                            i.Playing = false;
                            u25[i] = nil;
                        end;
                    end;

                    u20.Swimming.Playing = true;
                    u25[u20.Swimming] = true;
                end,

                [Enum.HumanoidStateType.Freefall] = function() -- Line: 268
                    -- upvalues: u20 (copy), u25 (copy)
                    u20.FreeFalling.Volume = 0;
                    local FreeFalling = u20.FreeFalling;

                    for i in pairs(u25) do
                        if i ~= FreeFalling then
                            i.Playing = false;
                            u25[i] = nil;
                        end;
                    end;

                    u25[u20.FreeFalling] = true;
                end,

                [Enum.HumanoidStateType.Landed] = function() -- Line: 274
                    -- upvalues: u32 (copy), u25 (copy), HumanoidRootPart (ref), LocalPlayer (ref), OnLanded (ref), u19 (copy), _G_GVF_ret (ref)
                    if u32 then
                        for i in pairs(u25) do
                            if i ~= nil then
                                i.Playing = false;
                                u25[i] = nil;
                            end;
                        end;

                        if HumanoidRootPart.Parent.Torso.Transparency < 1 then
                            if HumanoidRootPart:GetAttribute("Invisible") and HumanoidRootPart.Parent ~= LocalPlayer.Character then
                                return;
                            end;

                            local Y = HumanoidRootPart.Velocity.Y;
                            local Torso = u19:FindFirstChild("Torso");
                            OnLanded(HumanoidRootPart, Y, Torso and Torso.Transparency >= 1 and 0 or math.max(0, _G_GVF_ret.MovementSoundModifier.Value));
                        end;
                    end;
                end,

                [Enum.HumanoidStateType.Running] = function() -- Line: 287
                end,

                [Enum.HumanoidStateType.Seated] = function() -- Line: 304
                    -- upvalues: u25 (copy)
                    for i in pairs(u25) do
                        if i ~= nil then
                            i.Playing = false;
                            u25[i] = nil;
                        end;
                    end;
                end,

                [Enum.HumanoidStateType.Dead] = function() -- Line: 308
                end
            };

            local function getWS() -- Line: 314
                -- upvalues: LocalPlayer (ref), u19 (copy), Humanoid (ref), _G_GVF_ret (ref), HumanoidRootPart (ref)
                local math_min_ret = math.min(LocalPlayer.Character == u19 and Humanoid.WalkSpeed or _G_GVF_ret.RepWalkSpeed.Value, 50);

                return (math_min_ret + math.min(HumanoidRootPart.Velocity.Magnitude, math_min_ret)) / 2;
            end;

            local function onRunning(p38) -- Line: 321
                -- upvalues: u26 (ref), u29 (ref), u19 (copy), u28 (ref), u27 (ref), u30 (ref), HumanoidRootPart (ref), LocalPlayer (ref), Humanoid (ref), _G_GVF_ret (ref), PlayerFromCharacter (ref), u32 (copy), MaterialSounds (ref), u20 (copy), u31 (ref), u11 (ref)
                u26 = p38;
                u29 = math.random();

                if u26 < 1 and u26 > -1 or u19:FindFirstChild("Torso") and u19.Torso.Transparency >= 1 then
                    u28 = math.random();
                    u27 = false;
                    u30 = tick();

                    return;
                end;

                if HumanoidRootPart.Anchored then
                    return;
                end;

                if u27 then
                    return;
                end;

                local function CalcSpeed() -- Line: 335
                    -- upvalues: LocalPlayer (ref), u19 (ref), Humanoid (ref), _G_GVF_ret (ref), HumanoidRootPart (ref)
                    local math_min_ret = math.min(LocalPlayer.Character == u19 and Humanoid.WalkSpeed or _G_GVF_ret.RepWalkSpeed.Value, 50);

                    return 0.3333333333333333 / ((math_min_ret + math.min(HumanoidRootPart.Velocity.Magnitude, math_min_ret)) / 2 / 16) * 1.1;
                end;

                u28 = math.random();
                local u39 = tick();
                u27 = true;
                local u40 = u28;

                local function sTing(p41, p42) -- Line: 355
                    -- upvalues: u19 (ref), _G_GVF_ret (ref), PlayerFromCharacter (ref), LocalPlayer (ref), u32 (ref), HumanoidRootPart (ref), MaterialSounds (ref), u20 (ref), Humanoid (ref), u26 (ref)
                    local Torso = u19:FindFirstChild("Torso");

                    if (Torso and Torso.Transparency >= 1 and 0 or math.max(0, _G_GVF_ret.MovementSoundModifier.Value)) <= 0 then
                        return;
                    end;

                    if PlayerFromCharacter ~= LocalPlayer and not u32 then
                        local workspace_CurrentCamera = workspace.CurrentCamera;

                        if workspace_CurrentCamera and (workspace_CurrentCamera.CFrame.Position - HumanoidRootPart.Position).Magnitude > 450 then
                            return;
                        end;
                    end;

                    if p41 and MaterialSounds:FindFirstChild(p41) then
                        local v43 = MaterialSounds[p41]:GetChildren()[math.random(1, #MaterialSounds[p41]:GetChildren())]:Clone();
                        local v44;

                        if _G_GVF_ret.Currents:FindFirstChild("RBTMVB_S") then
                            v44 = u20.RStep:Clone();
                            v44.Pitch = v44.Pitch * math.random(90, 110) / 100;
                        else
                            v44 = nil;
                        end;

                        v43.Pitch = v43.Pitch * math.random(90, 110) / 100;
                        local math_min_ret = math.min(LocalPlayer.Character == u19 and Humanoid.WalkSpeed or _G_GVF_ret.RepWalkSpeed.Value, 50);
                        local _ = (math_min_ret + math.min(HumanoidRootPart.Velocity.Magnitude, math_min_ret)) / 2;
                        v43.EmitterSize = v43.EmitterSize * 1.65;

                        if not u32 then
                            v43.EmitterSize = v43.EmitterSize * 1.3;
                            v43.Volume = v43.Volume * 2.5;
                            v43.RollOffMaxDistance = v43.RollOffMaxDistance * 1.25;
                        end;

                        if u26 >= 23 or _G_GVF_ret.Sprinting.Value then
                            local DistortionSoundEffect = Instance.new("DistortionSoundEffect");
                            DistortionSoundEffect.Level = 0.34;
                            DistortionSoundEffect.Priority = 2;
                            DistortionSoundEffect.Parent = v43;
                            v43.EmitterSize = v43.EmitterSize * 1.25;

                            if v44 then
                                v44.Volume = v44.Volume * 1.5;
                                v44.EmitterSize = v44.EmitterSize * 1.25;
                            end;
                        end;

                        local Value = _G_GVF_ret.Crouching.Value;

                        if u19 == LocalPlayer.Character and _G.GetLocalCrouching then
                            Value = _G.GetLocalCrouching();
                        end;

                        if Value then
                            v43.EmitterSize = v43.EmitterSize * 0.2;
                            v43.Volume = v43.Volume * 0.15;

                            if v44 then
                                v44.EmitterSize = v44.EmitterSize * 0.5;
                                v44.Volume = v44.Volume * 0.5;
                            end;
                        end;

                        local Torso2 = u19:FindFirstChild("Torso");
                        local v45 = Torso2 and Torso2.Transparency >= 1 and 0 or math.max(0, _G_GVF_ret.MovementSoundModifier.Value);

                        if v45 > 0 then
                            local DistortionSoundEffect = Instance.new("DistortionSoundEffect");
                            DistortionSoundEffect.Level = 0 + 0.35 * v45;
                            DistortionSoundEffect.Priority = 1;
                            DistortionSoundEffect.Parent = v43;
                        end;

                        v43.Volume = v43.Volume * v45;
                        v43.EmitterSize = v43.EmitterSize * (0.85 + 0.15000000000000002 * v45);
                        v43.PlaybackSpeed = 0.5 + 0.5 * (v43.PlaybackSpeed / v45);
                        local FSP = _G_GVF_ret.Currents:FindFirstChild("FSP");

                        if FSP then
                            v43.PlaybackSpeed = v43.PlaybackSpeed * FSP.Value;
                        end;

                        v43.Parent = LocalPlayer == PlayerFromCharacter and (_G.FP and workspace.CurrentCamera) or HumanoidRootPart;
                        v43:Play();
                        game.Debris:AddItem(v43, 0.5);

                        if v44 then
                            v44.Parent = LocalPlayer == PlayerFromCharacter and (_G.FP and workspace.CurrentCamera) or HumanoidRootPart;
                            v44:Play();
                            game.Debris:AddItem(v44, 0.5);
                        end;
                    end;
                end;

                local success, result = pcall(function() -- Line: 453
                    -- upvalues: u27 (ref), u40 (copy), u28 (ref), Humanoid (ref), u19 (ref), _G_GVF_ret (ref), u30 (ref), u26 (ref), u39 (copy), u31 (ref), LocalPlayer (ref), HumanoidRootPart (ref), u11 (ref), sTing (copy)
                    while u27 and (u40 == u28 and (Humanoid.Parent and (u19.Parent and (_G_GVF_ret and (_G_GVF_ret.Parent and (_G_GVF_ret and _G_GVF_ret.Parent)))))) do
                        local v46 = _G_GVF_ret and (_G_GVF_ret.Parent and _G_GVF_ret.RagdollTime.RagdollSwitch.Value) and true or false;
                        local State = Humanoid:GetState();

                        if not (v46 or (tick() - u30 < 0.1 or u26 < 1 and u26 > -1) or State == Enum.HumanoidStateType.Climbing and tick() - u39 < 0.15) then
                            local v47 = tick() - u31;
                            local math_min_ret = math.min(LocalPlayer.Character == u19 and Humanoid.WalkSpeed or _G_GVF_ret.RepWalkSpeed.Value, 50);

                            if 0.3333333333333333 / ((math_min_ret + math.min(HumanoidRootPart.Velocity.Magnitude, math_min_ret)) / 2 / 16) * 1.1 <= v47 then
                                u31 = tick();
                                local v48 = u11;

                                if State == Enum.HumanoidStateType.Climbing then
                                    sTing("Ladder");
                                else
                                    local FloorMaterial = Humanoid.FloorMaterial;

                                    if FloorMaterial and FloorMaterial ~= Enum.Material.Air then
                                        local v49 = v48[FloorMaterial.Name] or v48.Concrete;
                                        local FSK = _G_GVF_ret.Currents:FindFirstChild("FSK");

                                        if FSK then
                                            v49 = FSK.Value;
                                        end;

                                        sTing(v49);
                                    end;
                                end;
                            end;
                        end;

                        task.wait(0.05);
                    end;
                end);

                if u40 == u28 then
                    u27 = false;
                end;

                if not success then
                    warn("[Sound] Footstep loop failed", result);
                end;
            end;

            local u60 = {
                [u20.Climbing] = function(p50, p51, p52) -- Line: 505
                    p51.Playing = p52.Magnitude > 0.1;
                end,

                [u20.FreeFalling] = function(p53, p54, p55) -- Line: 509
                    if p55.Magnitude > 55 then
                        p54.Volume = math.clamp(p54.Volume + 0.9 * p53, 0, 3);

                        return;
                    end;

                    p54.Volume = 0;
                end,

                [u20.Running] = function(p56, p57, p58) -- Line: 517
                    -- upvalues: Humanoid (ref)
                    local v59;

                    if p58.Magnitude > 0.5 then
                        v59 = Humanoid.MoveDirection.Magnitude > 0.5;
                    else
                        v59 = false;
                    end;

                    p57.Playing = v59;
                end
            };
            local u61 = {
                [Enum.HumanoidStateType.RunningNoPhysics] = Enum.HumanoidStateType.Running
            };
            local u62 = u61[Humanoid:GetState()] or Humanoid:GetState();
            local u67 = Humanoid.StateChanged:Connect(function(p63, p64) -- Line: 530
                -- upvalues: u61 (copy), u62 (ref), u37 (copy)
                local v65 = u61[p64] or p64;

                if v65 ~= u62 then
                    local v66 = u37[v65];

                    if v66 then
                        v66();
                    end;

                    u62 = v65;
                end;
            end);
            local u71 = RunService.Stepped:Connect(function(p68, p69) -- Line: 543
                -- upvalues: u25 (copy), u60 (copy), HumanoidRootPart (ref)
                for i in pairs(u25) do
                    local v70 = u60[i];

                    if v70 then
                        v70(p69, i, HumanoidRootPart.Velocity);
                    end;
                end;
            end);
            local u72 = nil;
            local u73 = nil;
            local u74 = nil;
            local u75 = nil;
            local u76 = nil;

            local function terminate() -- Line: 559
                -- upvalues: u67 (copy), u71 (copy), u72 (ref), u73 (ref), u74 (ref), u75 (ref), u76 (ref)
                u67:Disconnect();
                u71:Disconnect();
                u72:Disconnect();
                u73:Disconnect();
                u74:Disconnect();

                if u75 then
                    u75:Disconnect();
                end;

                if u76 then
                    u76:Disconnect();
                end;
            end;

            u72 = Humanoid.AncestryChanged:Connect(function(p77, p78) -- Line: 569
                -- upvalues: terminate (copy)
                if not p78 then
                    terminate();
                end;
            end);
            u75 = Humanoid.Running:Connect(onRunning);
            u76 = Humanoid.Climbing:Connect(onRunning);
            u73 = HumanoidRootPart.AncestryChanged:Connect(function(p79, p80) -- Line: 578
                -- upvalues: terminate (copy)
                if not p80 then
                    terminate();
                end;
            end);
            u74 = u19.AncestryChanged:Connect(function(p81, p82) -- Line: 584
                -- upvalues: terminate (copy)
                if not p82 then
                    terminate();
                end;
            end);

            return;
        end;
    end;
end;

local Characters = workspace:WaitForChild("Characters");
Characters.ChildAdded:Connect(charAdded);
task.spawn(function() -- Line: 595
    -- upvalues: Characters (copy), charAdded (copy)
    for _, child in pairs(Characters:GetChildren()) do
        task.spawn(charAdded, child);
    end;
end);
REPMVMNTSND.OnClientEvent:Connect(function(p83, p84, p85) -- Line: 602
    -- upvalues: u10 (copy), OnLanded (copy)
    if not (p83 and p83.Parent) then
        return;
    end;

    local HumanoidRootPart = p83:FindFirstChild("HumanoidRootPart");

    if not HumanoidRootPart then
        return;
    end;

    local Torso = p83:FindFirstChild("Torso");

    if Torso and Torso.Transparency >= 1 then
        return;
    end;

    if not u10[p83] then
        return;
    end;

    local v86 = p84 == "Jumping" and 0.15 or nil;

    if p84 == "Landed" then
        local _G_GVF_ret = _G.GVF(p83.Name);

        if _G_GVF_ret then
            OnLanded(HumanoidRootPart, p85, _G_GVF_ret.MovementSoundModifier.Value);
        end;
    else
        local v87 = u10[p83][p84];
        v87.TimePosition = v86 or 0;
        v87.Playing = true;
    end;
end);

return nil;
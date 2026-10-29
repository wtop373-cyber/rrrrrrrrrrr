-- ============================================================
-- SCRIPT: Drift
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Moments.Drift
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");
local RunService = game:GetService("RunService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local SoundService = game:GetService("SoundService");
local StarterGui = game:GetService("StarterGui");
local TextChatService = game:GetService("TextChatService");
local Kit = script.Parent:WaitForChild("Kit", 5);

if not Kit then
    return {};
end;

local u1 = require(Kit);
local v2 = {};
local LocalPlayer = Players.LocalPlayer;
local Random_new_ret = Random.new();
local u3 = {
    AudioReverb = true,
    AudioEcho = true,
    AudioChorus = true,
    AudioDistortion = true,
    AudioFlanger = true,
    AudioPitchShifter = true,
    AudioEqualizer = true,
    AudioCompressor = true,
    AudioLimiter = true,
    AudioTremolo = true
};
local u4 = {
    Grass = "Grass",
    Mud = "Grass",
    LeafyGrass = "Grass",
    Ground = "Grass",
    Wood = "Wood",
    WoodPlanks = "Wood",
    Sand = "Sand",
    Snow = "Sand",
    Ice = "Sand",
    Metal = "Metal",
    DiamondPlate = "Metal",
    Neon = "Metal",
    Glass = "Glass",
    Fabric = "Fabric",
    Slate = "Granite",
    Marble = "Granite",
    Pavement = "Granite",
    Salt = "Granite",
    Granite = "Granite",
    Limestone = "Granite",
    Sandstone = "Granite",
    CrackedLava = "Granite",
    Basalt = "Granite",
    Asphalt = "Granite",
    Glacier = "Granite"
};
local u5 = { "CoreGUI.Backpack", "CoreGUI.SlotFrame", "CoreGUI.StatsFrame", "CoreGUI.LevelFrame", "CoreGUI.DataSavingDisabled" };
local u6 = false;
local u7 = true;
local u8 = setmetatable({}, {
    __mode = "k"
});
local u9 = setmetatable({}, {
    __mode = "k"
});
local u10 = setmetatable({}, {
    __mode = "k"
});
local u11 = nil;
local u12 = nil;
local u13 = setmetatable({}, {
    __mode = "k"
});
local u14 = {};

local function sound(p15, p16, p17, p18) -- Line: 69
    -- upvalues: SoundService (copy), u8 (copy)
    local Sound = Instance.new("Sound");
    Sound.SoundId = p15;
    Sound.Volume = p16;
    Sound.Looped = p18 == true;
    local Main = SoundService:FindFirstChild("Main");

    if Main and Main:IsA("SoundGroup") then
        Sound.SoundGroup = Main;
    end;

    u8[Sound] = true;
    Sound.Parent = p17;

    return Sound;
end;

local function dark() -- Line: 83
    -- upvalues: ReplicatedStorage (copy)
    local Values = ReplicatedStorage:FindFirstChild("Values");

    if Values then
        pcall(function() -- Line: 86
            -- upvalues: Values (copy)
            Values.AmbientMulti.Value = 0.85;
            Values.BrightnessMulti.Value = 0;
            Values.CloudColorMulti.Value = 0;
            Values.SetFogValue.Value = 0.7;
            Values.SetHazeValue.Value = 10;
            Values.TimeState.Value = 0;
            Values.TimeState.Enabled.Value = true;
            Values.Streetlights.Value = false;
            Values.LOutage.Value = true;
        end);
    end;

    task.spawn(function() -- Line: 98
        for _, v in ipairs({ workspace:FindFirstChild("Map"), workspace:FindFirstChild("Filter") }) do
            local v19 = 0;

            for _, v3 in ipairs(v and v:GetDescendants() or {}) do
                if v3:IsA("Light") and not v3:GetAttribute("IGNORE_BLACKOUT") then
                    v3.Enabled = false;
                elseif v3:IsA("BasePart") and (v3.Material == Enum.Material.Neon and not v3:GetAttribute("IGNORE_BLACKOUT")) then
                    local Color = v3.Color;
                    v3.Color = Color3.new(Color.R * 0.15, Color.G * 0.15, Color.B * 0.15);
                end;

                v19 = v19 + 1;

                if v19 % 2000 == 0 then
                    task.wait();
                end;
            end;
        end;
    end);
end;

local function hideGuis() -- Line: 117
    -- upvalues: LocalPlayer (copy), u5 (copy)
    local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui");

    for _, v in ipairs(u5) do
        local v20 = PlayerGui;

        for i in string.gmatch(v, "[^%.]+") do
            if PlayerGui then
                PlayerGui = PlayerGui:FindFirstChild(i);
            end;
        end;

        if PlayerGui and PlayerGui:IsA("GuiObject") then
            PlayerGui.Visible = false;
            PlayerGui = v20;
        elseif PlayerGui and PlayerGui:IsA("LayerCollector") then
            PlayerGui.Enabled = false;
            PlayerGui = v20;
        else
            PlayerGui = v20;
        end;
    end;
end;

local function quiet() -- Line: 132
    -- upvalues: StarterGui (copy), TextChatService (copy), hideGuis (copy)
    pcall(function() -- Line: 133
        -- upvalues: StarterGui (ref)
        StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false);
        StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false);
    end);
    pcall(function() -- Line: 137
        -- upvalues: TextChatService (ref)
        TextChatService.ChatWindowConfiguration.Enabled = false;
        TextChatService.ChatInputBarConfiguration.Enabled = false;
    end);
    hideGuis();
end;

local function stepIds() -- Line: 144
    -- upvalues: u11 (ref), ReplicatedStorage (copy)
    if u11 then
        return u11;
    end;

    local Storage = ReplicatedStorage:FindFirstChild("Storage");

    if Storage then
        Storage = Storage:FindFirstChild("MovementSounds");
    end;

    if Storage then
        Storage = Storage:FindFirstChild("MaterialSounds");
    end;

    local v21 = {};
    local v22 = 0;

    for _, v in ipairs(Storage and Storage:GetDescendants() or {}) do
        if v:IsA("Sound") then
            v21[v.SoundId] = true;
            v22 = v22 + 1;
        end;
    end;

    if v22 > 0 then
        u11 = v21;
    end;

    return v21;
end;

local function allowed(p23) -- Line: 165
    -- upvalues: u8 (copy), stepIds (copy), u7 (ref), LocalPlayer (copy)
    if u8[p23] or stepIds()[p23.SoundId] then
        return true;
    end;

    if not u7 or p23.Name == "boom" then
        return false;
    end;

    local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui");

    if PlayerGui then
        PlayerGui = PlayerGui:FindFirstChild("Intro");
    end;

    local Filter = workspace:FindFirstChild("Filter");

    if Filter then
        Filter = Filter:FindFirstChild("MenuScene");
    end;

    local v24 = PlayerGui ~= nil and p23:IsDescendantOf(PlayerGui);

    if not v24 then
        if Filter == nil then
            v24 = false;
        else
            v24 = p23:IsDescendantOf(Filter);
        end;
    end;

    return v24;
end;

local function check(p25) -- Line: 179
    -- upvalues: allowed (copy)
    if allowed(p25) then
        return;
    end;

    if p25.Volume ~= 0 then
        p25.Volume = 0;
    end;

    if p25.IsPlaying then
        p25:Stop();
    end;
end;

local function gate(u26) -- Line: 191
    -- upvalues: u9 (copy), u10 (copy), allowed (copy)
    if not u26:IsA("Sound") or u9[u26] then
        return;
    end;

    u9[u26] = true;
    u10[u26] = u26.Volume;

    local function again() -- Line: 197
        -- upvalues: u26 (copy), allowed (ref)
        local v27 = u26;

        if allowed(v27) then
            return;
        end;

        if v27.Volume ~= 0 then
            v27.Volume = 0;
        end;

        if v27.IsPlaying then
            v27:Stop();
        end;
    end;

    u26:GetPropertyChangedSignal("Volume"):Connect(again);
    u26:GetPropertyChangedSignal("Playing"):Connect(again);
    u26.Played:Connect(again);
    u26.Resumed:Connect(again);

    if allowed(u26) then
        return;
    end;

    if u26.Volume ~= 0 then
        u26.Volume = 0;
    end;

    if u26.IsPlaying then
        u26:Stop();
    end;
end;

local function sweep() -- Line: 207
    -- upvalues: u14 (ref), u9 (copy), allowed (copy), gate (copy)
    for _, v in ipairs(u14) do
        local v28 = 0;

        for _, descendant in ipairs(v:GetDescendants()) do
            if descendant:IsA("Sound") then
                if u9[descendant] then
                    if not allowed(descendant) then
                        if descendant.Volume ~= 0 then
                            descendant.Volume = 0;
                        end;

                        if descendant.IsPlaying then
                            descendant:Stop();
                        end;
                    end;
                else
                    gate(descendant);
                end;
            end;

            v28 = v28 + 1;

            if v28 % 2000 == 0 then
                task.wait();
            end;
        end;
    end;
end;

local function pin() -- Line: 226
    -- upvalues: LocalPlayer (copy), u5 (copy), u13 (copy)
    local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui");

    for _, v in ipairs(u5) do
        local v29 = PlayerGui;

        for i in string.gmatch(v, "[^%.]+") do
            PlayerGui = PlayerGui;

            if PlayerGui then
                PlayerGui = PlayerGui:FindFirstChild(i);
            end;
        end;

        if PlayerGui and (PlayerGui:IsA("GuiObject") and not u13[PlayerGui]) then
            u13[PlayerGui] = true;
            PlayerGui:GetPropertyChangedSignal("Visible"):Connect(function() -- Line: 235
                -- upvalues: PlayerGui (ref)
                if PlayerGui.Visible then
                    PlayerGui.Visible = false;
                end;
            end);
        end;

        PlayerGui = v29;
    end;
end;

local function shield() -- Line: 244
    -- upvalues: u14 (ref), SoundService (copy), LocalPlayer (copy), gate (copy), RunService (copy), hideGuis (copy), pin (copy), StarterGui (copy), sweep (copy)
    u14 = { workspace, SoundService, LocalPlayer:WaitForChild("PlayerGui") };

    for _, v in ipairs(u14) do
        v.DescendantAdded:Connect(gate);
    end;

    RunService.RenderStepped:Connect(function() -- Line: 249
        -- upvalues: hideGuis (ref), pin (ref), StarterGui (ref)
        hideGuis();
        pin();

        if StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.PlayerList) then
            pcall(StarterGui.SetCoreGuiEnabled, StarterGui, Enum.CoreGuiType.PlayerList, false);
        end;
    end);
    task.spawn(sweep);
end;

local function farthest(p30) -- Line: 259
    local Filter = workspace:FindFirstChild("Filter");

    if Filter then
        Filter = Filter:FindFirstChild("Spawns");
    end;

    local v31 = nil;
    local v32 = nil;

    for _, v in ipairs(Filter and Filter:GetChildren() or {}) do
        if v:IsA("BasePart") and (v.Position.Y >= -10 and (not v:IsA("SpawnLocation") or v.Enabled)) then
            local Magnitude = (v.Position - p30).Magnitude;

            if not v31 or v31 < Magnitude then
                v32 = v.Position;
                v31 = Magnitude;
            end;
        end;
    end;

    return v32;
end;

local function floorAt(p33, p34) -- Line: 274
    local RaycastParams_new_ret = RaycastParams.new();
    RaycastParams_new_ret.FilterType = Enum.RaycastFilterType.Exclude;
    RaycastParams_new_ret.FilterDescendantsInstances = p34;
    local v35 = workspace:Raycast(p33 + Vector3.new(0, 6, 0), Vector3.new(0, -40, 0), RaycastParams_new_ret);

    if v35 then
        v35 = v35.Position;
    end;

    return v35;
end;

local function clear(p36, p37, p38) -- Line: 282
    local RaycastParams_new_ret = RaycastParams.new();
    RaycastParams_new_ret.FilterType = Enum.RaycastFilterType.Exclude;
    RaycastParams_new_ret.FilterDescendantsInstances = p38;
    RaycastParams_new_ret.RespectCanCollide = true;

    return workspace:Raycast(p36 + Vector3.new(0, 2, 0), p37 - p36, RaycastParams_new_ret) == nil;
end;

local function segDist(p39, p40, p41) -- Line: 291
    local v42 = p41 - p40;
    local v43 = v42:Dot(v42);

    if v43 < 1e-6 then
        return (p39 - p40).Magnitude;
    end;

    local v44 = (p39 - p40):Dot(v42) / v43;

    return (p39 - (p40 + v42 * math.clamp(v44, 0, 1))).Magnitude;
end;

local function quietVolume() -- Line: 301
    -- upvalues: u10 (copy)
    local Audio = workspace:FindFirstChild("Audio");

    if Audio then
        Audio = Audio:FindFirstChild("UndergroundAmbience");
    end;

    local v45 = Audio and Audio:IsA("Sound") and (u10[Audio] or Audio.Volume);

    return ((not v45 or v45 <= 0) and 0.08 or v45) * 0;
end;

local function cut(p46, u47) -- Line: 311
    -- upvalues: u1 (copy), SoundService (copy), LocalPlayer (copy), u3 (copy), RunService (copy)
    local u48 = u1.Screen(100000);
    u1.Fill(u48, Color3.new(0, 0, 0), 1);

    if p46 then
        p46:Destroy();
    end;

    local function silence() -- Line: 317
        -- upvalues: SoundService (ref), u47 (copy), LocalPlayer (ref), u3 (ref)
        pcall(function() -- Line: 318
            -- upvalues: SoundService (ref)
            SoundService.AmbientReverb = Enum.ReverbType.NoReverb;
        end);

        for _, v in ipairs({
            u47,
            LocalPlayer.Character,
            LocalPlayer:FindFirstChild("PlayerGui"),
            SoundService,
            workspace:FindFirstChild("Audio")
        }) do
            for _, v3 in ipairs(v and v:GetDescendants() or {}) do
                if v3:IsA("Sound") then
                    if v3.IsPlaying then
                        v3:Stop();
                    end;
                elseif v3:IsA("SoundEffect") or u3[v3.ClassName] then
                    v3:Destroy();
                end;
            end;
        end;
    end;

    silence();
    task.spawn(function() -- Line: 334
        -- upvalues: u48 (copy), RunService (ref), silence (copy)
        while u48.Parent do
            RunService.RenderStepped:Wait();
            silence();
        end;
    end);
    task.wait(1.5);

    return u48;
end;

local Lighting = game:GetService("Lighting");
local RaycastParams_new_ret = RaycastParams.new();
RaycastParams_new_ret.FilterType = Enum.RaycastFilterType.Exclude;

local function gazeAt(p49, p50) -- Line: 348
    -- upvalues: RaycastParams_new_ret (copy), LocalPlayer (copy)
    local Position = p50.CFrame.Position;
    local ViewportSize = p50.ViewportSize;
    local v51 = 0;

    for _, v in ipairs({ "Head", "Torso" }) do
        local v52 = p49:FindFirstChild(v);
        local v53 = v52 and v52:IsA("BasePart") and (v52.Position - Position).Magnitude;

        if v53 and v53 < 160 then
            local v54, v55 = p50:WorldToViewportPoint(v52.Position);

            if v55 and v54.Z > 0 then
                RaycastParams_new_ret.FilterDescendantsInstances = { p49, p50, LocalPlayer.Character };

                if not workspace:Raycast(Position, v52.Position - Position, RaycastParams_new_ret) then
                    local v56 = Vector2.new(v54.X / ViewportSize.X - 0.5, v54.Y / ViewportSize.Y - 0.5).Magnitude / 0.7071;
                    local math_clamp_ret = math.clamp(v56, 0, 1);
                    local v57 = (1 - math.clamp((v53 - 20) / 140, 0, 1)) * (1 - math_clamp_ret * 0.75);
                    v51 = math.max(v51, v57);
                end;
            end;
        end;
    end;

    return v51;
end;

local function drain() -- Line: 370
    -- upvalues: RunService (copy), u12 (ref), gazeAt (copy), Lighting (copy)
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect");
    ColorCorrectionEffect.Name = "GhostGaze";
    local u58 = 1;
    local u59 = os.clock() + (1 / 0);
    RunService.RenderStepped:Connect(function(p60) -- Line: 375
        -- upvalues: u59 (copy), u12 (ref), gazeAt (ref), u58 (ref), Lighting (ref), ColorCorrectionEffect (copy)
        local workspace_CurrentCamera = workspace.CurrentCamera;

        if not workspace_CurrentCamera then
            return;
        end;

        local v61 = os.clock() < u59 and 1 or 0;

        if u12 and u12.Parent then
            local v62 = gazeAt(u12, workspace_CurrentCamera);
            v61 = math.max(v61, v62);
        end;

        if u58 < v61 then
            u58 = math.min(v61, u58 + p60 / 0.5);
        else
            u58 = math.max(v61, u58 - p60 / 1.5);
        end;

        local v63 = 0;

        for _, v in ipairs({ Lighting, workspace_CurrentCamera }) do
            for _, child in ipairs(v:GetChildren()) do
                if child ~= ColorCorrectionEffect and (child:IsA("ColorCorrectionEffect") and child.Enabled) then
                    v63 = v63 + child.Saturation;
                end;
            end;
        end;

        ColorCorrectionEffect.Saturation = math.max(u58 * -0.8, -0.98 - v63);
        ColorCorrectionEffect.Contrast = u58 * 0.12;
        ColorCorrectionEffect.Enabled = u58 > 0.001;

        if ColorCorrectionEffect.Parent ~= workspace_CurrentCamera then
            ColorCorrectionEffect.Parent = workspace_CurrentCamera;
        end;
    end);
end;

local function joint(p64, p65, p66, p67, p68, p69) -- Line: 406
    local Instance_new_ret = Instance.new(p64);
    Instance_new_ret.Name = p65;
    Instance_new_ret.Part0 = p66;
    Instance_new_ret.Part1 = p67;
    Instance_new_ret.C0 = p68;
    Instance_new_ret.C1 = p69;
    Instance_new_ret.Parent = p66;
end;

local function rig(p70) -- Line: 416
    local PrimaryPart = p70.PrimaryPart;
    local GhostCurse = p70:FindFirstChild("GhostCurse");
    local v71 = {};
    local v72 = nil;

    for _, child in ipairs(p70:GetChildren()) do
        if child:IsA("BasePart") and child.Name == "GhostBody" then
            if child.Size.X > 1.5 then
                v72 = child;
            else
                local v73 = PrimaryPart.CFrame:PointToObjectSpace(child.Position);
                v71[(v73.Y < -1 and "Leg" or "Arm") .. (v73.X < 0 and "L" or "R")] = child;
            end;
        end;
    end;

    if PrimaryPart and (GhostCurse and (v72 and (v71.ArmL and (v71.ArmR and (v71.LegL and v71.LegR))))) then
        local CFrame2 = PrimaryPart.CFrame;
        local CFrame_new_ret = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0);
        local CFrame_new_ret2 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0);

        for _, descendant in ipairs(p70:GetDescendants()) do
            if descendant:IsA("BasePart") and (descendant ~= PrimaryPart and (descendant ~= v72 and (descendant ~= GhostCurse and descendant.Name ~= "GhostBody"))) then
                local Name = descendant.Name;
                local v74 = GhostCurse.CFrame:Inverse() * descendant.CFrame;
                local CFrame_new_ret3 = CFrame.new();
                local Weld = Instance.new("Weld");
                Weld.Name = Name;
                Weld.Part0 = GhostCurse;
                Weld.Part1 = descendant;
                Weld.C0 = v74;
                Weld.C1 = CFrame_new_ret3;
                Weld.Parent = GhostCurse;
            end;
        end;

        local v75 = GhostCurse.CFrame:Inverse() * CFrame2 * CFrame_new_ret2;
        local Motor6D = Instance.new("Motor6D");
        Motor6D.Name = "Neck";
        Motor6D.Part0 = v72;
        Motor6D.Part1 = GhostCurse;
        Motor6D.C0 = CFrame_new_ret2;
        Motor6D.C1 = v75;
        Motor6D.Parent = v72;
        PrimaryPart.Name = "HumanoidRootPart";
        v72.Name = "Torso";
        GhostCurse.Name = "Head";
        v71.ArmL.Name = "Left Arm";
        v71.ArmR.Name = "Right Arm";
        v71.LegL.Name = "Left Leg";
        v71.LegR.Name = "Right Leg";
        local Motor6D2 = Instance.new("Motor6D");
        Motor6D2.Name = "RootJoint";
        Motor6D2.Part0 = PrimaryPart;
        Motor6D2.Part1 = v72;
        Motor6D2.C0 = CFrame_new_ret;
        Motor6D2.C1 = CFrame_new_ret;
        Motor6D2.Parent = PrimaryPart;
        local ArmR = v71.ArmR;
        local CFrame_new_ret3 = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0);
        local CFrame_new_ret4 = CFrame.new(-0.5, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0);
        local Motor6D3 = Instance.new("Motor6D");
        Motor6D3.Name = "Right Shoulder";
        Motor6D3.Part0 = v72;
        Motor6D3.Part1 = ArmR;
        Motor6D3.C0 = CFrame_new_ret3;
        Motor6D3.C1 = CFrame_new_ret4;
        Motor6D3.Parent = v72;
        local ArmL = v71.ArmL;
        local CFrame_new_ret5 = CFrame.new(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0);
        local CFrame_new_ret6 = CFrame.new(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0);
        local Motor6D4 = Instance.new("Motor6D");
        Motor6D4.Name = "Left Shoulder";
        Motor6D4.Part0 = v72;
        Motor6D4.Part1 = ArmL;
        Motor6D4.C0 = CFrame_new_ret5;
        Motor6D4.C1 = CFrame_new_ret6;
        Motor6D4.Parent = v72;
        local LegR = v71.LegR;
        local CFrame_new_ret7 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0);
        local CFrame_new_ret8 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0);
        local Motor6D5 = Instance.new("Motor6D");
        Motor6D5.Name = "Right Hip";
        Motor6D5.Part0 = v72;
        Motor6D5.Part1 = LegR;
        Motor6D5.C0 = CFrame_new_ret7;
        Motor6D5.C1 = CFrame_new_ret8;
        Motor6D5.Parent = v72;
        local LegL = v71.LegL;
        local CFrame_new_ret9 = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0);
        local CFrame_new_ret10 = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0);
        local Motor6D6 = Instance.new("Motor6D");
        Motor6D6.Name = "Left Hip";
        Motor6D6.Part0 = v72;
        Motor6D6.Part1 = LegL;
        Motor6D6.C0 = CFrame_new_ret9;
        Motor6D6.C1 = CFrame_new_ret10;
        Motor6D6.Parent = v72;

        for _, descendant in ipairs(p70:GetDescendants()) do
            if descendant:IsA("BasePart") and descendant ~= PrimaryPart then
                descendant.Anchored = false;
                descendant.CanCollide = false;
                descendant.Massless = true;
            end;
        end;

        local AnimationController = Instance.new("AnimationController");
        local Animator = Instance.new("Animator");
        Animator.Parent = AnimationController;
        AnimationController.Parent = p70;

        return Animator;
    end;
end;

local function runTrack(p76) -- Line: 470
    if not p76 then
        return;
    end;

    local Animation = Instance.new("Animation");
    Animation.AnimationId = "rbxassetid://14694480293";
    local success, result = pcall(p76.LoadAnimation, p76, Animation);

    if success and result then
        result.Looped = true;
        result.Priority = Enum.AnimationPriority.Movement;
        result:Play(0);
        result:AdjustSpeed(3.5);
    end;
end;

local function chase(p77, p78, u79) -- Line: 485
    -- upvalues: LocalPlayer (copy), farthest (copy), u1 (copy), Players (copy), rig (copy), u12 (ref), runTrack (copy), ReplicatedStorage (copy), u4 (copy), Random_new_ret (copy), SoundService (copy), u8 (copy), RunService (copy), quietVolume (copy), gazeAt (copy)
    local Character = LocalPlayer.Character;
    local u80 = Character and Character:FindFirstChild("HumanoidRootPart");

    if not u80 then
        return false;
    end;

    local v81 = farthest(u80.Position);
    local u82;

    if v81 then
        u82 = u1.Figure();
    else
        u82 = v81;
    end;

    if not u82 then
        return false;
    end;

    local u83 = { u82, p77 };

    for _, v in ipairs(Players:GetPlayers()) do
        if v.Character then
            table.insert(u83, v.Character);
        end;
    end;

    local RaycastParams_new_ret2 = RaycastParams.new();
    RaycastParams_new_ret2.FilterType = Enum.RaycastFilterType.Exclude;
    RaycastParams_new_ret2.FilterDescendantsInstances = u83;
    local v84 = workspace:Raycast(v81 + Vector3.new(0, 6, 0), Vector3.new(0, -40, 0), RaycastParams_new_ret2);
    local u85 = v84 and v84.Position or v81;
    local math_max_ret = math.max((u80.Position - u85).Magnitude, 70);
    u82:PivotTo(CFrame.lookAt(u85 + Vector3.new(0, 3, 0), (Vector3.new(u80.Position.X, u85.Y + 3, u80.Position.Z))));
    local v86 = rig(u82);
    u82.Parent = p77;
    u12 = u82;
    runTrack(v86);
    local Storage = ReplicatedStorage:FindFirstChild("Storage");

    if Storage then
        Storage = Storage:FindFirstChild("MovementSounds");
    end;

    if Storage then
        Storage = Storage:FindFirstChild("MaterialSounds");
    end;

    local RaycastParams_new_ret3 = RaycastParams.new();
    RaycastParams_new_ret3.FilterType = Enum.RaycastFilterType.Exclude;
    RaycastParams_new_ret3.FilterDescendantsInstances = u83;
    RaycastParams_new_ret3.RespectCanCollide = true;
    local RaycastParams_new_ret4 = RaycastParams.new();
    RaycastParams_new_ret4.FilterType = Enum.RaycastFilterType.Exclude;
    RaycastParams_new_ret4.FilterDescendantsInstances = u83;

    local function stepAt() -- Line: 520
        -- upvalues: u85 (ref), RaycastParams_new_ret4 (copy), u4 (ref), Storage (copy), Random_new_ret (ref), math_max_ret (copy), u80 (ref), SoundService (ref), u8 (ref), u82 (copy)
        local v87 = workspace:Raycast(u85 + Vector3.new(0, 2, 0), Vector3.new(0, -8, 0), RaycastParams_new_ret4);
        local v88 = Storage and (Storage:FindFirstChild(v87 and u4[v87.Material.Name] or "Concrete") or Storage:FindFirstChild("Concrete"));
        local v89 = v88 and v88:GetChildren() or {};
        local v90 = v89[Random_new_ret:NextInteger(1, (math.max(#v89, 1)))];

        if not (v90 and v90:IsA("Sound")) then
            return;
        end;

        local v91 = v90:Clone();
        local v92 = (math_max_ret - (u80.Position - Vector3.new(0, 3, 0) - u85).Magnitude) / math.max(math_max_ret - 20, 1);
        local v93 = math.clamp(v92, 0, 1) ^ 4;

        if v93 <= 0 then
            v91:Destroy();

            return;
        end;

        v91.Volume = v93 * 2.5;
        v91.PlaybackSpeed = 0.8 * Random_new_ret:NextNumber(0.95, 1.05);
        v91.RollOffMode = Enum.RollOffMode.InverseTapered;
        v91.RollOffMinDistance = math_max_ret;
        v91.RollOffMaxDistance = math_max_ret * 2;
        local DistortionSoundEffect = Instance.new("DistortionSoundEffect");
        DistortionSoundEffect.Level = 0.8;
        DistortionSoundEffect.Parent = v91;
        local Main = SoundService:FindFirstChild("Main");

        if Main and Main:IsA("SoundGroup") then
            v91.SoundGroup = Main;
        end;

        u8[v91] = true;
        v91.Parent = u82.PrimaryPart;
        v91:Play();
        task.delay(2, v91.Destroy, v91);
    end;

    local Events = ReplicatedStorage:FindFirstChild("Events");

    if Events then
        Events = Events:FindFirstChild("BRBRBRRBLOOOL2");
    end;

    local u94 = nil;
    local u95 = 1;
    local u96 = 0;
    local os_clock_ret = os.clock();
    local u97 = false;
    local u98 = false;
    local u99 = nil;
    local u100 = false;
    local u101 = 0;
    local u102 = 0;

    local function target() -- Line: 563
        -- upvalues: LocalPlayer (ref), u80 (ref)
        local Character2 = LocalPlayer.Character;

        if Character2 then
            Character2 = Character2:FindFirstChild("HumanoidRootPart");
        end;

        if Character2 then
            u80 = Character2;
        end;

        return u80.Position;
    end;

    local function repath() -- Line: 572
        -- upvalues: u97 (ref), u96 (ref), u85 (ref), LocalPlayer (ref), u80 (ref), Events (copy), u94 (ref), u95 (ref), os_clock_ret (ref)
        if u97 then
            return;
        end;

        u97 = true;
        u96 = os.clock();
        local u103 = u85;
        local Character2 = LocalPlayer.Character;

        if Character2 then
            Character2 = Character2:FindFirstChild("HumanoidRootPart");
        end;

        if Character2 then
            u80 = Character2;
        end;

        local Position = u80.Position;
        task.spawn(function() -- Line: 579
            -- upvalues: Events (ref), u103 (copy), Position (copy), u85 (ref), u94 (ref), u95 (ref), os_clock_ret (ref), u97 (ref)
            local v104, v105;

            if Events then
                v104, v105 = pcall(Events.InvokeServer, Events, "Path", { u103, Position });
            else
                v104 = false;
                v105 = nil;
            end;

            if v104 and (type(v105) == "table" and #v105 > 0) then
                local v106 = {};

                for _, v in ipairs(v105) do
                    if typeof(v) == "Vector3" then
                        table.insert(v106, v);
                    end;
                end;

                local v107 = (1 / 0);
                local v108 = 1;

                for i = 1, math.min(#v106, 40) do
                    local Magnitude = (v106[i] - u85).Magnitude;
                    local v109;

                    if Magnitude < v107 then
                        v108 = i;
                        v107 = Magnitude;
                        v109 = v108;
                        local v110 = v108;
                        v108 = v109;
                        v110 = v109;
                    else
                        v109 = i;
                    end;
                end;

                u94 = v106;
                u95 = v108;
                os_clock_ret = os.clock();
            end;

            u97 = false;
        end);
    end;

    if not u97 then
        u97 = true;
        u96 = os.clock();
        local u111 = u85;
        local Character2 = LocalPlayer.Character;

        if Character2 then
            Character2 = Character2:FindFirstChild("HumanoidRootPart");
        end;

        u80 = Character2 or u80;
        local Position = u80.Position;
        task.spawn(function() -- Line: 579
            -- upvalues: Events (copy), u111 (copy), Position (copy), u85 (ref), u94 (ref), u95 (ref), os_clock_ret (ref), u97 (ref)
            local v112, v113;

            if Events then
                v112, v113 = pcall(Events.InvokeServer, Events, "Path", { u111, Position });
            else
                v112 = false;
                v113 = nil;
            end;

            if v112 and (type(v113) == "table" and #v113 > 0) then
                local v114 = {};

                for _, v in ipairs(v113) do
                    if typeof(v) == "Vector3" then
                        table.insert(v114, v);
                    end;
                end;

                local v115 = (1 / 0);
                local v116 = 1;

                for i = 1, math.min(#v114, 40) do
                    local Magnitude = (v114[i] - u85).Magnitude;
                    local v117;

                    if Magnitude < v115 then
                        v116 = i;
                        v115 = Magnitude;
                        v117 = v116;
                        local v118 = v116;
                        v116 = v117;
                        v118 = v117;
                    else
                        v117 = i;
                    end;
                end;

                u94 = v114;
                u95 = v116;
                os_clock_ret = os.clock();
            end;

            u97 = false;
        end);
    end;

    local v154 = RunService.Heartbeat:Connect(function(p119) -- Line: 607
        -- upvalues: u98 (ref), u82 (copy), LocalPlayer (ref), u80 (ref), u85 (ref), quietVolume (ref), u79 (copy), u99 (ref), gazeAt (ref), u96 (ref), u97 (ref), Events (copy), u94 (ref), u95 (ref), os_clock_ret (ref), u83 (copy), u100 (ref), RaycastParams_new_ret3 (copy), u101 (ref), u102 (ref), stepAt (copy)
        if u98 then
            return;
        end;

        if not u82.Parent then
            u98 = true;

            return;
        end;

        local Character2 = LocalPlayer.Character;

        if Character2 then
            Character2 = Character2:FindFirstChild("HumanoidRootPart");
        end;

        if Character2 then
            u80 = Character2;
        end;

        local Position = u80.Position;
        local v120 = Position - Vector3.new(0, 3, 0);
        local math_clamp_ret = math.clamp((400 - (v120 - u85).Magnitude) / 375, 0, 1);
        local v121 = quietVolume();
        u79.Volume = v121 + (0.6 - v121) * math_clamp_ret;
        local Character3 = LocalPlayer.Character;

        if Character3 then
            Character3 = Character3:FindFirstChildOfClass("Humanoid");
        end;

        if not Character3 or Character3.Health <= 0 then
            u99 = nil;

            return;
        end;

        local workspace_CurrentCamera = workspace.CurrentCamera;

        if workspace_CurrentCamera and ((v120 - u85).Magnitude <= 30 and gazeAt(u82, workspace_CurrentCamera) > 0) then
            u99 = u99 or os.clock();

            if os.clock() - u99 >= 0.5 then
                u98 = true;

                return;
            end;
        else
            u99 = nil;
        end;

        if os.clock() - u96 >= 0.25 and not u97 then
            u97 = true;
            u96 = os.clock();
            local u122 = u85;
            local Character4 = LocalPlayer.Character;

            if Character4 then
                Character4 = Character4:FindFirstChild("HumanoidRootPart");
            end;

            if Character4 then
                u80 = Character4;
            end;

            local Position2 = u80.Position;
            task.spawn(function() -- Line: 579
                -- upvalues: Events (ref), u122 (copy), Position2 (copy), u85 (ref), u94 (ref), u95 (ref), os_clock_ret (ref), u97 (ref)
                local v123, v124;

                if Events then
                    v123, v124 = pcall(Events.InvokeServer, Events, "Path", { u122, Position2 });
                else
                    v123 = false;
                    v124 = nil;
                end;

                if v123 and (type(v124) == "table" and #v124 > 0) then
                    local v125 = {};

                    for _, v in ipairs(v124) do
                        if typeof(v) == "Vector3" then
                            table.insert(v125, v);
                        end;
                    end;

                    local v126 = (1 / 0);
                    local v127 = 1;

                    for i = 1, math.min(#v125, 40) do
                        local Magnitude = (v125[i] - u85).Magnitude;
                        local v128;

                        if Magnitude < v126 then
                            v127 = i;
                            v126 = Magnitude;
                            v128 = v127;
                            local v129 = v127;
                            v127 = v128;
                            v129 = v128;
                        else
                            v128 = i;
                        end;
                    end;

                    u94 = v125;
                    u95 = v127;
                    os_clock_ret = os.clock();
                end;

                u97 = false;
            end);
        end;

        local v130 = math.min(p119, 0.1) * 175;
        local v131;

        if (v120 - u85).Magnitude <= 30 then
            local v132 = u85;
            local RaycastParams_new_ret5 = RaycastParams.new();
            RaycastParams_new_ret5.FilterType = Enum.RaycastFilterType.Exclude;
            RaycastParams_new_ret5.FilterDescendantsInstances = u83;
            RaycastParams_new_ret5.RespectCanCollide = true;
            v131 = workspace:Raycast(v132 + Vector3.new(0, 2, 0), v120 - v132, RaycastParams_new_ret5) == nil;
        else
            v131 = false;
        end;

        local v133 = os.clock() - os_clock_ret > 4;
        local v134 = 0;
        local Vector3_new_ret = Vector3.new(v120.X - u85.X, 0, v120.Z - u85.Z);
        local v135 = v120.Y - u85.Y;
        local v136;

        if v135 > 8 then
            v136 = Vector3_new_ret.Magnitude <= 60;
        else
            v136 = u100;

            if v136 then
                if v135 > 0.5 then
                    v136 = Vector3_new_ret.Magnitude <= 60;
                else
                    v136 = false;
                end;
            end;
        end;

        u100 = v136;
        local v137;

        if u100 then
            local v138;

            if Vector3_new_ret.Magnitude > 0.5 then
                v138 = Vector3_new_ret.Unit or nil;
            else
                v138 = nil;
            end;

            local v139 = u85;
            local v140;

            if v138 then
                v140 = workspace:Raycast(u85 + Vector3.new(0, 0.5, 0), v138 * 3, RaycastParams_new_ret3);
            else
                v140 = v138;
            end;

            if v138 and not v140 then
                u85 = u85 + v138 * math.min(v130, Vector3_new_ret.Magnitude);
            else
                local math_min_ret = math.min(v130, v120.Y - u85.Y);
                u85 = u85 + Vector3.new(0, math_min_ret, 0);
            end;

            u101 = u101 + (u85 - v139).Magnitude;
            local v141 = u85 - v139;
            local v142 = v141:Dot(v141);
            local v143;

            if v142 < 1e-6 then
                v143 = (v120 - v139).Magnitude;
            else
                local v144 = (v120 - v139):Dot(v141) / v142;
                v143 = (v120 - (v139 + v141 * math.clamp(v144, 0, 1))).Magnitude;
            end;

            if v143 <= 4 then
                u98 = true;
                v137 = Position;
                v130 = 0;
            else
                v137 = Position;
                v130 = 0;
            end;
        else
            v137 = Position;
        end;

        while v130 > 0 and (not u98 and v134 < 64) do
            v134 = v134 + 1;
            local v145;

            if v131 or (v133 or not u94) then
                if not (v131 or v133) then
                    break;
                end;

                v145 = v120;
            else
                v145 = u94[u95];

                if not v145 then
                    local v146 = u85;
                    local RaycastParams_new_ret5 = RaycastParams.new();
                    RaycastParams_new_ret5.FilterType = Enum.RaycastFilterType.Exclude;
                    RaycastParams_new_ret5.FilterDescendantsInstances = u83;
                    RaycastParams_new_ret5.RespectCanCollide = true;

                    if workspace:Raycast(v146 + Vector3.new(0, 2, 0), v120 - v146, RaycastParams_new_ret5) ~= nil then
                        break;
                    end;

                    v145 = v120;
                end;
            end;

            local v147 = v145 - u85;
            local Magnitude = v147.Magnitude;
            local math_min_ret = math.min(Magnitude, v130);
            local v148 = u85;

            if Magnitude > 0.001 then
                u85 = u85 + v147.Unit * math_min_ret;
                Position = Vector3.new(v145.X, u85.Y + 3, v145.Z);
            end;

            v130 = v130 - math_min_ret;
            u101 = u101 + math_min_ret;
            local v149 = u85 - v148;
            local v150 = v149:Dot(v149);
            local v151;

            if v150 < 1e-6 then
                v151 = (v120 - v148).Magnitude;
            else
                local v152 = (v120 - v148):Dot(v149) / v150;
                v151 = (v120 - (v148 + v149 * math.clamp(v152, 0, 1))).Magnitude;
            end;

            if v151 <= 4 then
                u98 = true;
                break;
            end;

            if Magnitude - 0.001 <= math_min_ret then
                if u94 and u94[u95] == v145 then
                    u95 = u95 + 1;
                elseif v145 == v120 then
                    break;
                end;
            end;
        end;

        local v153 = u85 + Vector3.new(0, 3, 0);
        local Vector3_new_ret2 = Vector3.new(Position.X, v153.Y, Position.Z);

        if (Vector3_new_ret2 - v153).Magnitude < 0.1 then
            Vector3_new_ret2 = Vector3.new(v137.X, v153.Y, v137.Z);
        end;

        u82:PivotTo(CFrame.lookAt(v153, Vector3_new_ret2));

        if u101 >= 10 and os.clock() - u102 > 0.04 then
            u101 = 0;
            u102 = os.clock();
            stepAt();
        end;
    end);

    repeat
        task.wait();
    until u98 or p78 < os.clock();

    v154:Disconnect();

    return true, u82;
end;

local function run() -- Line: 721
    -- upvalues: LocalPlayer (copy), u7 (ref), sweep (copy), drain (copy), dark (copy), quiet (copy), quietVolume (copy), SoundService (copy), u8 (copy), chase (copy), cut (copy), ReplicatedStorage (copy)
    (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart", 30);
    local _ = workspace.CurrentCamera;
    local os_clock_ret = os.clock();
    local v155;

    repeat
        task.wait(0.2);
        v155 = workspace.CurrentCamera;
    until v155 and (v155.CameraType == Enum.CameraType.Custom and (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart"))) or os.clock() - os_clock_ret > 120;

    local v156 = os.clock() + 180;
    u7 = false;
    task.spawn(sweep);
    pcall(drain);
    dark();
    quiet();
    local v157 = quietVolume();
    local Sound = Instance.new("Sound");
    Sound.SoundId = "rbxassetid://98677375679802";
    Sound.Volume = v157;
    Sound.Looped = true;
    local Main = SoundService:FindFirstChild("Main");

    if Main and Main:IsA("SoundGroup") then
        Sound.SoundGroup = Main;
    end;

    u8[Sound] = true;
    Sound.Parent = v155;
    Sound.PlaybackSpeed = 0.75;
    Sound:Play();
    pcall(function() -- Line: 739
        require(script.Parent:FindFirstChild("Shelf")).Hold();
    end);
    task.wait(25);
    quiet();
    local v158, v159 = chase(v155, v156, Sound);
    cut(v158 and v159 and v159 or nil, workspace.CurrentCamera);
    local Events = ReplicatedStorage:FindFirstChild("Events");

    if Events then
        Events = Events:FindFirstChild("BRBRBRRBLOOOL2");
    end;

    if Events then
        pcall(Events.InvokeServer, Events, "Done");
    end;
end;

function v2.Start() -- Line: 753
    -- upvalues: u6 (ref), shield (copy), run (copy)
    local function go() -- Line: 754
        -- upvalues: u6 (ref), shield (ref), run (ref)
        if u6 or workspace:GetAttribute("Drift") ~= true then
            return;
        end;

        u6 = true;
        pcall(shield);
        local success, result = pcall(run);

        if not success then
            warn(result);
        end;
    end;

    workspace:GetAttributeChangedSignal("Drift"):Connect(go);

    if not u6 then
        if workspace:GetAttribute("Drift") ~= true then
            return;
        end;

        u6 = true;
        pcall(shield);
        local success, result = pcall(run);

        if not success then
            warn(result);
        end;
    end;
end;

return v2;
-- ============================================================
-- SCRIPT: VM
-- CLASS:  LocalScript
-- PATH:   Players.Natvlia_1.Backpack.VM
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
_G.VM_Loaded = false;

repeat
    task.wait(0.1);
until _G.GVF and _G.WaitForChar;

_G.WaitForChar();
local RunService = game:GetService("RunService");
local UserInputService = game:GetService("UserInputService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local ReplicatedFirst = game:GetService("ReplicatedFirst");
game:GetService("TweenService");
local UserInputService2 = game:GetService("UserInputService");
local Events2 = ReplicatedStorage:WaitForChild("Events2");
local Model = Instance.new("Model");
Model.Name = "ViewModel";
local workspace_CurrentCamera = workspace.CurrentCamera;
local LocalPlayer = game.Players.LocalPlayer;

local function serp(p2, p3, p4, p5, p6, p7, p8) -- Line: 79
    if 1 / p8 < 20 then
        return p4, 0;
    end;

    local v9 = p3 + (-p5 * (p2 - p4) + -p6 * p3) * p8;
    local v10 = p2 + v9 * p8;

    if math.abs(v9) < p7 and math.abs(p2 - v10) < p7 then
        return p4, 0;
    end;

    if v10 >= (1 / 0) or (v9 >= (1 / 0) or (v10 ~= v10 or v9 ~= v9)) then
        return p2, p3;
    end;

    return v10, v9;
end;

(function() -- Line: 66, Name: lod
    -- upvalues: LocalPlayer (copy)
    local u11 = false;
    coroutine.wrap(function() -- Line: 68
        -- upvalues: LocalPlayer (ref), u11 (ref)
        if not LocalPlayer:HasAppearanceLoaded() then
            LocalPlayer.CharacterAppearanceLoaded:Wait();
        end;

        u11 = true;
    end)();
    local v12 = tick();

    repeat
        wait(0.1);
    until u11 or tick() - v12 >= 3;
end)();
local ViewModels = ReplicatedFirst:FindFirstChild("ViewModels");

if not ViewModels then
    ViewModels = Instance.new("Folder");
    ViewModels.Name = "ViewModels";
    ViewModels.Parent = ReplicatedFirst;
end;

ViewModels:ClearAllChildren();
local Character = LocalPlayer.Character;

if not (Character and Character.Parent) then
    return;
end;

if not _G.VM then
    _G.VM = {};
    _G.VM.Enabled = false;
    _G.VM.CloneTool = nil;
    _G.VM.Tool = nil;

    function _G.VM.Check(p13) -- Line: 127
        if p13 and _G.VM.Tool ~= p13 then
            return false;
        end;

        return _G.VM.Current and (_G.VM.Current.Parent and _G.VM.Enabled) and true or false;
    end;

    _G.VM.ChangeEvent = Instance.new("BindableEvent", script);
    _G.VM.ChangeEvent2 = Instance.new("BindableEvent", script);
end;

if _G.VM.Current and _G.VM.Current.Parent then
    _G.VM.Current:Destroy();
end;

_G.VM.Current = Model;
local ToolHandler = require(script:WaitForChild("ToolHandler"));
ToolHandler.TransparencyModifier = 0;
local SwayModule = require(script:WaitForChild("SwayModule"));
local u14 = {};
local Head = Character:WaitForChild("Head");
local Humanoid = Character:WaitForChild("Humanoid");
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart");
local Torso = Character:WaitForChild("Torso");
local u15 = Character:FindFirstChild("Left Arm");
local u16 = Character:FindFirstChild("Right Arm");
Character:FindFirstChild("Left Leg");
local u17 = Character:FindFirstChild("Right Leg");
local v18 = Character:WaitForChild("Body Colors");
local u19 = Character:FindFirstChildWhichIsA("Shirt");
local u20 = Torso;
local u21 = {};
local NewModules = ReplicatedStorage:WaitForChild("NewModules");
local u22 = require(NewModules.Shared.Services.SmoothValue).new(Vector3.new(), 0.2);
u22:UpdateAngle(Vector3.new(1, 0.2, 0));
local Part = Instance.new("Part");
Part.Transparency = 1;
Part.CanCollide = false;
Part.CanQuery = false;
Part.CanTouch = false;
Part.Size = Vector3.new();
Part.Massless = true;
Part.CFrame = CFrame.new(Head.Position);
Part.Name = "CamShakePart";
local Motor6D = Instance.new("Motor6D");
Motor6D.C0 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0);
Motor6D.C1 = CFrame.new(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0);
Motor6D.Part0 = HumanoidRootPart;
Motor6D.Part1 = Part;
Motor6D.Parent = Part;
Part.Parent = HumanoidRootPart;
_G.camShakePart = Part;
local _G_GVF_ret = _G.GVF();
Character.ChildAdded:Connect(function(p23) -- Line: 193
    -- upvalues: u14 (copy), u19 (ref), Model (copy)
    if p23:IsA("Shirt") then
        if u14.Shirt then
            u14.Shirt:Destroy();
        end;

        u19 = p23;
        local v24 = u19:Clone();
        u14.Shirt = v24;
        v24.Parent = Model;
    end;
end);
Humanoid.StateChanged:Connect(function(p25, p26) -- Line: 214
    -- upvalues: SwayModule (copy)
    SwayModule.state = p26;
end);
Instance.new("NumberValue", script);
u14.Humaoid = Humanoid:Clone();
u14.HumaoidRootPart = HumanoidRootPart:Clone();

if u15 then
    u14["Left Arm"] = u15:Clone();
end;

if u16 then
    u14["Right Arm"] = u16:Clone();
end;

u14["Body Colors"] = v18:Clone();

if u19 then
    u14.Shirt = u19:Clone();
end;

u14.HumaoidRootPart.Anchored = true;
u14.HumaoidRootPart.CanCollide = false;
u14.HumaoidRootPart.CanTouch = false;
u14.HumaoidRootPart.CanQuery = false;

if u15 then
    u14["Left Arm"].Anchored = false;
    u14["Left Arm"].CanCollide = false;
    u14["Left Arm"].CanTouch = false;
    u14["Left Arm"].CanQuery = false;
    u14["Left Arm"].Massless = false;
    u14["Left Arm"].CastShadow = false;
    u14["Left Arm"].Size = Vector3.new(1, 2, 1);
    local Part2 = Instance.new("Part");
    Part2.Name = "LArmHolder";
    Part2.CastShadow = false;
    Part2.Transparency = 1;
    Part2.Size = Vector3.new(0.5, 0.5, 0.5);
    Part2.CanCollide = false;
    Part2.CanTouch = false;
    Part2.CanQuery = false;
    Part2.Massless = true;
    Part2.Anchored = true;
    task.delay(0, function() -- Line: 271
        -- upvalues: u14 (copy), Part2 (copy)
        u14["Left Arm"].CFrame = Part2.CFrame;
        local Motor6D2 = Instance.new("Motor6D");
        Motor6D2.Name = "RArm6D";
        Motor6D2.Part0 = Part2;
        Motor6D2.Part1 = u14["Left Arm"];
        Motor6D2.C0 = CFrame.new(0, 0, 0);
        Motor6D2.Parent = Part2;
    end);
    u14.LArmHolder = Part2;
end;

if u16 then
    u14["Right Arm"].Anchored = false;
    u14["Right Arm"].CanCollide = false;
    u14["Right Arm"].CanTouch = false;
    u14["Right Arm"].CanQuery = false;
    u14["Right Arm"].Massless = false;
    u14["Right Arm"].CastShadow = false;
    u14["Right Arm"].Size = Vector3.new(1, 2, 1);
    local Part2 = Instance.new("Part");
    Part2.Name = "RArmHolder";
    Part2.CastShadow = false;
    Part2.Transparency = 1;
    Part2.Size = Vector3.new(0.5, 0.5, 0.5);
    Part2.CanCollide = false;
    Part2.CanTouch = false;
    Part2.CanQuery = false;
    Part2.Massless = true;
    Part2.Anchored = true;
    task.delay(0, function() -- Line: 305
        -- upvalues: u14 (copy), Part2 (copy)
        u14["Right Arm"].CFrame = Part2.CFrame;
        local Motor6D2 = Instance.new("Motor6D");
        Motor6D2.Name = "LArm6D";
        Motor6D2.Part0 = Part2;
        Motor6D2.Part1 = u14["Right Arm"];
        Motor6D2.C0 = CFrame.new(0, 0, 0);
        Motor6D2.Parent = Part2;
    end);
    u14.RArmHolder = Part2;
end;

u14.Humaoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false);
u14.Humaoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false);
u14.Humaoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false);
u14.Humaoid:SetStateEnabled(Enum.HumanoidStateType.Flying, false);
u14.Humaoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false);
u14.Humaoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false);
u14.Humaoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false);
u14.Humaoid:SetStateEnabled(Enum.HumanoidStateType.Landed, false);
u14.Humaoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false);
u14.Humaoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false);
u14.Humaoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false);
u14.Humaoid:SetStateEnabled(Enum.HumanoidStateType.Running, false);
u14.Humaoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, false);
u14.Humaoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false);
u14.Humaoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false);
u14.Humaoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, false);

for _, v in pairs(u14) do
    v:ClearAllChildren();
    v.Parent = Model;

    if v:IsA("BasePart") then
        v.Transparency = 1;
    end;
end;

for _, child in pairs(ReplicatedStorage.Storage.FistPoints:GetChildren()) do
    if u16 then
        child:Clone().Parent = u14["Right Arm"];
    end;

    if u15 then
        child:Clone().Parent = u14["Left Arm"];
    end;
end;

ToolHandler.ViewModel = Model;
ToolHandler.Transparency = 0;

local function u33(p27, p28, p29, p30) -- Line: 357
    -- upvalues: u20 (ref), Model (copy)
    if p27:IsA("BasePart") and p28:IsA("BasePart") then
        local CFrame2 = u20.CFrame;
        local v31 = p29 or Vector3.new();
        local v32 = p30 or CFrame.new();
        p27.CFrame = Model.HumanoidRootPart.CFrame:ToWorldSpace(CFrame2:ToObjectSpace(p28.CFrame * v32) + v31);
    end;
end;

local function _(p34, p35, p36) -- Line: 375
    -- upvalues: u20 (ref), Model (copy)
    if p34:IsA("BasePart") and p35:IsA("BasePart") then
        p34.CFrame = p34.CFrame:Lerp(Model.HumanoidRootPart.CFrame:ToWorldSpace(u20.CFrame:ToObjectSpace(p35.CFrame)), p36);
    end;
end;

local u37 = false;

local function AliveCheck() -- Line: 384
    -- upvalues: Character (copy), Humanoid (copy), _G_GVF_ret (copy)
    return Character and (Character.Parent and (Humanoid and (Humanoid.Parent and (Humanoid:GetState() ~= Enum.HumanoidStateType.Dead and (_G_GVF_ret and _G_GVF_ret.RagdollTime.Value <= 0))))) and true or not _G_GVF_ret;
end;

local function GotTool() -- Line: 388
    -- upvalues: ToolHandler (copy)
    return ToolHandler.ActiveTool;
end;

local function FP_Check() -- Line: 394
    -- upvalues: Character (copy), Head (copy), HumanoidRootPart (copy), workspace_CurrentCamera (copy), UserInputService (copy)
    local v38 = Character and Character.Parent and (Head and Head.Parent and (HumanoidRootPart and HumanoidRootPart.Parent));

    if v38 then
        if (workspace_CurrentCamera.CFrame.Position - (HumanoidRootPart.CFrame * CFrame.new(0, 1.5, 0)).p).Magnitude <= 1 then
            v38 = UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter;
        else
            v38 = false;
        end;
    end;

    return v38;
end;

local function lerp(p39, p40, p41) -- Line: 402
    return p39 + (p40 - p39) * p41;
end;

local u42 = 0;
local u43 = 0;
local u44 = 0;
local u45 = 0;
local CFrame_new_ret = CFrame.new();
RunService:BindToRenderStep("FP_renderBind", Enum.RenderPriority.Camera.Value + 5, function(p46) -- Line: 410, Name: renderBind
    -- upvalues: Character (copy), Humanoid (copy), _G_GVF_ret (copy), FP_Check (copy), Model (copy), ToolHandler (copy), u17 (copy), u22 (copy), u20 (ref), Torso (copy), HumanoidRootPart (copy), SwayModule (copy), workspace_CurrentCamera (copy), CFrame_new_ret (ref), UserInputService2 (copy), u42 (ref), u44 (ref), u43 (ref), u45 (ref), u15 (copy), u33 (copy), u16 (copy), u37 (ref), u21 (copy), u14 (copy)
    debug.profilebegin("VM renderBind");

    if not (Character and (Character.Parent and (Humanoid and (Humanoid.Parent and (Humanoid:GetState() ~= Enum.HumanoidStateType.Dead and (_G_GVF_ret and _G_GVF_ret.RagdollTime.Value <= 0)))))) and _G_GVF_ret then
        _G.FP = false;
        _G.VM.Enabled = false;
    end;

    local v47 = FP_Check();

    if v47 then
        _G.FP = true;
    else
        _G.FP = false;
    end;

    local v48 = (Character and (Character.Parent and (Humanoid and (Humanoid.Parent and (Humanoid:GetState() ~= Enum.HumanoidStateType.Dead and (_G_GVF_ret and _G_GVF_ret.RagdollTime.Value <= 0))))) and true or not _G_GVF_ret) and Model.Parent ~= nil;
    local ActiveTool = ToolHandler.ActiveTool;

    if v48 and v47 then
        if u17 and u17.Parent then
            if _G_GVF_ret and _G_GVF_ret.Currents:FindFirstChild("RLEG") then
                u17.LocalTransparencyModifier = 0;
            elseif u17.LocalTransparencyModifier < 1 then
                u17.LocalTransparencyModifier = 1;
            end;
        end;

        if not _G.VM.Enabled then
            _G.VM.ChangeEvent:Fire(true);
        end;

        _G.VM.Tool = ActiveTool;
        _G.VM.Enabled = true;
        local _ = u22.Value.X;
        local Y = u22.Value.Y;
        local v49 = false;

        if ActiveTool and (ToolHandler.tS.AimDown or ToolHandler.tS.FPASHAHSHBRUUUUH) and not (_G_GVF_ret.Sprinting.Value or ToolHandler.tS.NoArmTing) then
            v49 = ToolHandler.tS.AimDown and ToolHandler.tS.AimDown.Value and true or v49;
            u20 = Torso;
        else
            u20 = ActiveTool and ActiveTool:GetAttribute("RELPART_T") and Torso or HumanoidRootPart;
        end;

        _G.ISADSZ = v49;
        SwayModule.adsing = v49;

        if v49 then
            u22:UpdateAngle(Vector3.new(0.5, 0.965, 1));
        else
            u22:UpdateAngle(Vector3.new(1, 0.2, 1));
        end;

        if _G_GVF_ret then
            local _ = _G_GVF_ret.Crouching.Value;
        end;

        local v50 = workspace_CurrentCamera.CFrame:ToWorldSpace(CFrame.new(Vector3.new(0, -1.65, -1)));

        if ToolHandler.tS.FP_Offset then
            v50 = v50 * CFrame.new(ToolHandler.tS.FP_Offset.X, ToolHandler.tS.FP_Offset.Y, ToolHandler.tS.FP_Offset.Z);
        end;

        if ToolHandler.tS.FP_Offset4 then
            v50 = v50 * CFrame.new(ToolHandler.tS.FP_Offset4.X, ToolHandler.tS.FP_Offset4.Y, ToolHandler.tS.FP_Offset4.Z);
        end;

        if ToolHandler.tS.FP_Offset5 then
            v50 = v50 * CFrame.new(ToolHandler.tS.FP_Offset5.X, ToolHandler.tS.FP_Offset5.Y, ToolHandler.tS.FP_Offset5.Z);
        end;

        if ToolHandler.tS.FP_Offset6 then
            v50 = v50 * CFrame.new(ToolHandler.tS.FP_Offset6.X, ToolHandler.tS.FP_Offset6.Y, ToolHandler.tS.FP_Offset6.Z);
        end;

        if ToolHandler.tS.FP_Offset7 then
            v50 = v50 * CFrame.new(ToolHandler.tS.FP_Offset7.X, ToolHandler.tS.FP_Offset7.Y, ToolHandler.tS.FP_Offset7.Z);
        end;

        local v51 = v50 * (ToolHandler.tS.FP_Offset2 or CFrame.new()) * (ToolHandler.tS.FP_Offset3 or CFrame.new());

        if ToolHandler.tS.FP_Offset_Angle then
            v51 = v51 * CFrame.Angles(math.rad(ToolHandler.tS.FP_Offset_Angle.X), math.rad(ToolHandler.tS.FP_Offset_Angle.Y), (math.rad(ToolHandler.tS.FP_Offset_Angle.Z)));
        end;

        if ToolHandler.tS.FP_Offset_Angle2 then
            v51 = v51 * CFrame.Angles(math.rad(ToolHandler.tS.FP_Offset_Angle2.X), math.rad(ToolHandler.tS.FP_Offset_Angle2.Y), (math.rad(ToolHandler.tS.FP_Offset_Angle2.Z)));
        end;

        if not ActiveTool or ActiveTool and ToolHandler.tS.NoArmTing then
            local v52, _, _ = workspace_CurrentCamera.CFrame:ToOrientation();
            local math_clamp_ret = math.clamp(1 - v52 / 1.4, 0, 1);
            v51 = v51 * CFrame.new(0, -3 + 3 * math_clamp_ret, 0.15) * CFrame.Angles(math.rad(-45 + 90 * math_clamp_ret), 0, 0);
        end;

        local v53 = -Humanoid.CameraOffset;
        local v54 = v51 * CFrame.new(v53.X * 0.75, v53.Y * 0.75, v53.Z * 0.75);
        local v55 = CFrame.new(0, math.noise(os.clock() * 0.75) / 25, 0) * CFrame.Angles(math.noise(os.clock() * 3 / 2) / 70, math.noise(os.clock() * 5 / 2) / 100, 0) * CFrame.new(0, 0, 2) - Vector3.new(0, 0, 2);
        CFrame_new_ret = CFrame_new_ret:Lerp(CFrame.new():Lerp(v55, v49 and 0.05 or 1), p46 * 11);
        local v56 = UserInputService2:GetMouseDelta().X / 80;
        local v57 = UserInputService2:GetMouseDelta().Y / 80;
        local v58 = u42;
        local v59 = u44;
        local math_clamp_ret = math.clamp(-v56 * (1 / p46 / 60), v49 and -0.005 or -0.025, v49 and 0.005 or 0.025);

        if 1 / p46 < 20 then
            v58 = math_clamp_ret;
            v59 = 0;
        else
            local v60 = v59 + (-350 * (v58 - math_clamp_ret) + -16 * v59) * p46;
            local v61 = v58 + v60 * p46;

            if math.abs(v60) < 0 and math.abs(v58 - v61) < 0 then
                v58 = math_clamp_ret;
                v59 = 0;
            elseif v61 < (1 / 0) and (v60 < (1 / 0) and (v61 == v61 and v60 == v60)) then
                v59 = v60;
                v58 = v61;
            end;
        end;

        u42 = v58;
        u44 = v59;
        local v62 = u43;
        local v63 = u45;
        local math_clamp_ret2 = math.clamp(-v57 * (1 / p46 / 60), v49 and -0.002 or -0.05, v49 and 0.005 or 0.015);

        if 1 / p46 < 20 then
            v62 = math_clamp_ret2;
            v63 = 0;
        else
            local v64 = v63 + (-350 * (v62 - math_clamp_ret2) + -16 * v63) * p46;
            local v65 = v62 + v64 * p46;

            if math.abs(v64) < 0 and math.abs(v62 - v65) < 0 then
                v62 = math_clamp_ret2;
                v63 = 0;
            elseif v65 < (1 / 0) and (v64 < (1 / 0) and (v65 == v65 and v64 == v64)) then
                v63 = v64;
                v62 = v65;
            end;
        end;

        u43 = v62;
        u45 = v63;
        local v66 = v54 * CFrame_new_ret * (CFrame.Angles(u43, u42, 0) * CFrame.new(0, 0, 2) - Vector3.new(0, 0, 2));

        if _G.CamShakeCFrameOffset1 then
            local _G_CamShakeCFrameOffset1 = _G.CamShakeCFrameOffset1;
            local X = _G_CamShakeCFrameOffset1.X;
            local Y2 = _G_CamShakeCFrameOffset1.Y;
            local Z = _G_CamShakeCFrameOffset1.Z;
            local v67, v68, v69 = _G_CamShakeCFrameOffset1:ToEulerAnglesXYZ();
            v66 = v66 * (CFrame.new(-X, -Y2, -Z) * CFrame.fromEulerAnglesXYZ(-v67, -v68, -v69));
        end;

        if (_G_GVF_ret.Sprinting.Value or not (ActiveTool and (ToolHandler.tS.IsGun or ToolHandler.tS.FPASHAHSHBRUUUUH))) and ActiveTool then
            SwayModule.ToggleWalkCF(false, 0.2);
            _G.VM_WalkCF = CFrame.new();
        else
            SwayModule.ToggleWalkCF(true, 0.2);
            local WalkCF = SwayModule.GetWalkCF(Y);
            v66 = v66 * WalkCF;
            _G.VM_WalkCF = WalkCF;
        end;

        local v70 = v66 * SwayModule.GetSprayCF();
        Model.HumanoidRootPart.CFrame = v70;
        local CFrame_new_ret2 = CFrame.new(0, 0, 0);
        local CFrame_new_ret3 = CFrame.new(0, 0, 0);
        local Vector3_new_ret = Vector3.new();
        local CFrame_new_ret4 = CFrame.new();

        if ToolHandler.tS.LA_Offset then
            CFrame_new_ret2 = CFrame_new_ret2 * CFrame.new(ToolHandler.tS.LA_Offset.X, ToolHandler.tS.LA_Offset.Y, ToolHandler.tS.LA_Offset.Z);
        end;

        if ToolHandler.tS.LA_Offset2 then
            CFrame_new_ret2 = CFrame_new_ret2 * CFrame.new(ToolHandler.tS.LA_Offset2.X, ToolHandler.tS.LA_Offset2.Y, ToolHandler.tS.LA_Offset2.Z);
        end;

        if ToolHandler.tS.LA_Offset_Angle then
            local LA_Offset_Angle = ToolHandler.tS.LA_Offset_Angle;
            CFrame_new_ret2 = CFrame_new_ret2 * CFrame.Angles(math.rad(LA_Offset_Angle.X), math.rad(LA_Offset_Angle.Y), (math.rad(LA_Offset_Angle.Z)));
        end;

        if ToolHandler.tS.RA_Offset then
            CFrame_new_ret3 = CFrame.new(ToolHandler.tS.RA_Offset.X, ToolHandler.tS.RA_Offset.Y, ToolHandler.tS.RA_Offset.Z);
        end;

        if ToolHandler.tS.RA_Offset_Angle then
            local RA_Offset_Angle = ToolHandler.tS.RA_Offset_Angle;
            CFrame_new_ret3 = CFrame_new_ret3 * CFrame.Angles(math.rad(RA_Offset_Angle.X), math.rad(RA_Offset_Angle.Y), (math.rad(RA_Offset_Angle.Z)));
        end;

        if u15 then
            u33(Model.LArmHolder, u15, nil, CFrame_new_ret2);
        end;

        if u16 then
            u33(Model.RArmHolder, u16, nil, CFrame_new_ret3);
        end;

        local CFrame2 = Model.HumanoidRootPart.CFrame;
        local CFrame3 = u20.CFrame;

        for _, v in ipairs(ToolHandler.PartPairs) do
            v[2].CFrame = CFrame2:ToWorldSpace(CFrame3:ToObjectSpace(v[1].CFrame * CFrame_new_ret4) + Vector3_new_ret);
        end;

        ToolHandler.UpdateBones();

        if not u37 then
            for _, v in pairs(u21) do
                local OriginZO = v:FindFirstChild("OriginZO");

                if not OriginZO then
                    OriginZO = Instance.new("NumberValue");
                    OriginZO.Name = "OriginZO";
                    OriginZO.Value = v.ZOffset;
                    OriginZO.Parent = v;
                end;

                v.ZOffset = math.max(OriginZO.Value, 2.5);
            end;

            ToolHandler.ChangePerson(true);
        end;

        u37 = true;
        local v71 = _G_GVF_ret.HealthValues["Left Arm"].Destroyed.Value and 1 or 0;
        local v72 = _G_GVF_ret.HealthValues["Right Arm"].Destroyed.Value and 1 or 0;

        if u14["Left Arm"] and u14["Left Arm"].Parent then
            if u15 and u15.Parent then
                Model["Left Arm"].Transparency = 0 + v71;
            else
                Model["Left Arm"].Transparency = 1;
            end;
        end;

        if u14["Right Arm"] and u14["Right Arm"].Parent then
            if u16 and u16.Parent then
                Model["Right Arm"].Transparency = 0 + v72;
            else
                Model["Right Arm"].Transparency = 1;
            end;
        end;
    else
        _G.ISADSZ = false;
        _G.VM.Tool = nil;

        if _G.VM.Enabled then
            _G.VM.ChangeEvent:Fire(false);
        end;

        _G.VM.Enabled = false;

        if u37 then
            u37 = false;

            if u14["Left Arm"] and (u14["Left Arm"].Parent and u15) then
                Model["Left Arm"].Transparency = 1;
            end;

            if u14["Right Arm"] and (u14["Right Arm"].Parent and u16) then
                Model["Right Arm"].Transparency = 1;
            end;

            for _, v in pairs(u21) do
                local OriginZO = v:FindFirstChild("OriginZO");

                if OriginZO then
                    v.ZOffset = OriginZO.Value;
                end;
            end;

            ToolHandler.ChangePerson(false);
        end;
    end;

    debug.profileend();
end);
Events2:WaitForChild("VM_COM").Event:Connect(function(p73, p74, p75, p76, p77) -- Line: 755
    -- upvalues: SwayModule (copy)
    if p73 == "Spraylerp" then
        SwayModule.SprayLerp(p74, p75, p76, p77);
    end;
end);
Humanoid.Died:Connect(function() -- Line: 761
    -- upvalues: RunService (copy), Model (copy)
    RunService:UnbindFromRenderStep("renderBind");
    Model:Destroy();
end);
Head.DescendantAdded:Connect(function(p78) -- Line: 766
    -- upvalues: u21 (copy)
    if p78:IsA("ParticleEmitter") then
        table.insert(u21, p78);
    end;
end);
Head.DescendantAdded:Connect(function(p79) -- Line: 772
    -- upvalues: u21 (copy), Head (copy)
    local table_find_ret = table.find(u21, p79);

    if p79:IsA("ParticleEmitter") and (table_find_ret and not p79:IsDescendantOf(Head)) then
        table.remove(u21, table_find_ret);
    end;
end);
Model.Parent = workspace.CurrentCamera;
_G.VM_Loaded = true;
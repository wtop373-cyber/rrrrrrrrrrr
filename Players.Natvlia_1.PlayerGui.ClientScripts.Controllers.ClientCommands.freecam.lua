-- ============================================================
-- SCRIPT: freecam
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.ClientCommands.freecam
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local ContextActionService = game:GetService("ContextActionService");
local RunService = game:GetService("RunService");
local StarterGui = game:GetService("StarterGui");
local UserInputService = game:GetService("UserInputService");
local Workspace = game:GetService("Workspace");
local Debris = game:GetService("Debris");
Players.LocalPlayer:WaitForChild("PlayerGui");
local RemoteEventHandler = require(ReplicatedStorage.Shared.Utils.RemoteEventHandler);
require(ReplicatedStorage.Shared.Utils.BindableEventHandler);
local v1 = {};
local math_abs = math.abs;
local math_clamp = math.clamp;
local math_exp = math.exp;
local math_rad = math.rad;
local math_sign = math.sign;
local math_sqrt = math.sqrt;
local math_tan = math.tan;
local LocalPlayer = Players.LocalPlayer;

if not LocalPlayer then
    Players:GetPropertyChangedSignal("LocalPlayer"):Wait();
    LocalPlayer = Players.LocalPlayer;
end;

local CurrentCamera = Workspace.CurrentCamera;
Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() -- Line: 41
    -- upvalues: Workspace (copy), CurrentCamera (ref)
    local CurrentCamera2 = Workspace.CurrentCamera;

    if CurrentCamera2 then
        CurrentCamera = CurrentCamera2;
    end;
end);
local u2 = script.Parent:FindFirstChildOfClass("RemoteFunction");
local Value = Enum.ContextActionPriority.Low.Value;
local Value2 = Enum.ContextActionPriority.High.Value;
local u3 = { Enum.KeyCode.LeftShift, Enum.KeyCode.P };
local u4 = Vector2.new(0.75, 1) * 8;
local u5 = {};
u5.__index = u5;

function u5.new(p6, p7) -- Line: 72
    -- upvalues: u5 (copy)
    local v8 = setmetatable({}, u5);
    v8.f = p6;
    v8.p = p7;
    v8.v = p7 * 0;

    return v8;
end;

function u5.Update(p9, p10, p11) -- Line: 80
    -- upvalues: math_exp (copy)
    local v12 = p9.f * 2 * 3.141592653589793;
    local v = p9.v;
    local v13 = p11 - p9.p;
    local v14 = math_exp(-v12 * p10);
    local v15 = p11 + (v * p10 - v13 * (v12 * p10 + 1)) * v14;
    p9.p = v15;
    p9.v = (v12 * p10 * (v13 * v12 - v) + v) * v14;

    return v15;
end;

function u5.Reset(p16, p17) -- Line: 97
    p16.p = p17;
    p16.v = p17 * 0;
end;

local Vector3_new_ret = Vector3.new();
local Vector2_new_ret = Vector2.new();
local u18 = 0;
local u19 = u5.new(1.5, (Vector3.new()));
local u20 = u5.new(1, Vector2.new());
local u21 = u5.new(4, 0);
local u22 = {};

local function fCurve(p23) -- Line: 122
    -- upvalues: math_exp (copy)
    return (math_exp(2 * p23) - 1) / 6.38905609893065;
end;

local function fDeadzone(p24) -- Line: 126
    -- upvalues: math_exp (copy)
    return (math_exp(2 * ((p24 - 0.15) / 0.85)) - 1) / 6.38905609893065;
end;

local function thumbstickCurve(p25) -- Line: 130
    -- upvalues: math_sign (copy), math_abs (copy), math_exp (copy), math_clamp (copy)
    return math_sign(p25) * math_clamp((math_exp(2 * ((math_abs(p25) - 0.15) / 0.85)) - 1) / 6.38905609893065, 0, 1);
end;

local u26 = {
    ButtonX = 0,
    ButtonY = 0,
    DPadDown = 0,
    DPadUp = 0,
    ButtonL2 = 0,
    ButtonR2 = 0,
    Thumbstick1 = Vector2.new(),
    Thumbstick2 = Vector2.new()
};
local u27 = {
    W = 0,
    A = 0,
    S = 0,
    D = 0,
    E = 0,
    Q = 0,
    U = 0,
    H = 0,
    J = 0,
    K = 0,
    I = 0,
    Y = 0,
    Up = 0,
    Down = 0,
    LeftShift = 0,
    RightShift = 0
};
local u28 = {
    MouseWheel = 0,
    Delta = Vector2.new()
};
local u29 = Vector2.new(1, 1) * 0.04908738521234052;
local u30 = Vector2.new(1, 1) * 0.39269908169872414;
local u31 = 1;

function u22.Vel(p32) -- Line: 181
    -- upvalues: u31 (ref), u27 (copy), math_clamp (copy), thumbstickCurve (ref), u26 (copy), UserInputService (copy)
    u31 = math_clamp(u31 + p32 * (u27.Up - u27.Down) * 0.75, 0.01, 4);
    local v33 = thumbstickCurve(u26.Thumbstick1.X);
    local v34 = thumbstickCurve(u26.ButtonR2) - thumbstickCurve(u26.ButtonL2);
    local v35 = Vector3.new(v33, v34, thumbstickCurve(-u26.Thumbstick1.Y)) * Vector3.new(1, 1, 1);
    local v36 = Vector3.new(u27.D - u27.A + u27.K - u27.H, u27.E - u27.Q + u27.I - u27.Y, u27.S - u27.W + u27.J - u27.U) * Vector3.new(1, 1, 1);
    local v37 = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift);

    return (v35 + v36) * (u31 * (v37 and 0.25 or 1));
end;

function u22.Pan(p38) -- Line: 202
    -- upvalues: thumbstickCurve (ref), u26 (copy), u30 (copy), u28 (copy), u29 (copy)
    local v39 = Vector2.new(thumbstickCurve(u26.Thumbstick2.Y), thumbstickCurve(-u26.Thumbstick2.X)) * u30;
    local v40 = u28.Delta * u29;
    u28.Delta = Vector2.new();

    return v39 + v40;
end;

function u22.Fov(p41) -- Line: 210
    -- upvalues: u26 (copy), u28 (copy)
    local v42 = (u26.ButtonX - u26.ButtonY) * 0.25;
    local v43 = u28.MouseWheel * 1;
    u28.MouseWheel = 0;

    return v42 + v43;
end;

local function Keypress(p44, p45, p46) -- Line: 218
    -- upvalues: u27 (copy)
    u27[p46.KeyCode.Name] = p45 == Enum.UserInputState.Begin and 1 or 0;

    return Enum.ContextActionResult.Sink;
end;

local function GpButton(p47, p48, p49) -- Line: 223
    -- upvalues: u26 (copy)
    u26[p49.KeyCode.Name] = p48 == Enum.UserInputState.Begin and 1 or 0;

    return Enum.ContextActionResult.Sink;
end;

local function MousePan(p50, p51, p52) -- Line: 228
    -- upvalues: u28 (copy)
    local Delta = p52.Delta;
    u28.Delta = Vector2.new(-Delta.y, -Delta.x);

    return Enum.ContextActionResult.Sink;
end;

local function Thumb(p53, p54, p55) -- Line: 234
    -- upvalues: u26 (copy)
    u26[p55.KeyCode.Name] = p55.Position;

    return Enum.ContextActionResult.Sink;
end;

local function Trigger(p56, p57, p58) -- Line: 239
    -- upvalues: u26 (copy)
    u26[p58.KeyCode.Name] = p58.Position.z;

    return Enum.ContextActionResult.Sink;
end;

local function MouseWheel(p59, p60, p61) -- Line: 244
    -- upvalues: u28 (copy)
    u28[p61.UserInputType.Name] = -p61.Position.z;

    return Enum.ContextActionResult.Sink;
end;

local function Zero(p62) -- Line: 249
    for i, v in pairs(p62) do
        p62[i] = v * 0;
    end;
end;

function u22.StartCapture() -- Line: 255
    -- upvalues: ContextActionService (copy), Keypress (copy), Value2 (copy), MousePan (copy), MouseWheel (copy), GpButton (copy), Trigger (copy), Thumb (copy)
    ContextActionService:BindActionAtPriority("FreecamKeyboard", Keypress, false, Value2, Enum.KeyCode.W, Enum.KeyCode.U, Enum.KeyCode.A, Enum.KeyCode.H, Enum.KeyCode.S, Enum.KeyCode.J, Enum.KeyCode.D, Enum.KeyCode.K, Enum.KeyCode.E, Enum.KeyCode.I, Enum.KeyCode.Q, Enum.KeyCode.Y, Enum.KeyCode.Up, Enum.KeyCode.Down);
    ContextActionService:BindActionAtPriority("FreecamMousePan", MousePan, false, Value2, Enum.UserInputType.MouseMovement);
    ContextActionService:BindActionAtPriority("FreecamMouseWheel", MouseWheel, false, Value2, Enum.UserInputType.MouseWheel);
    ContextActionService:BindActionAtPriority("FreecamGamepadButton", GpButton, false, Value2, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY);
    ContextActionService:BindActionAtPriority("FreecamGamepadTrigger", Trigger, false, Value2, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2);
    ContextActionService:BindActionAtPriority("FreecamGamepadThumbstick", Thumb, false, Value2, Enum.KeyCode.Thumbstick1, Enum.KeyCode.Thumbstick2);
end;

function u22.StopCapture() -- Line: 316
    -- upvalues: u31 (ref), u26 (copy), u27 (copy), u28 (copy), ContextActionService (copy)
    u31 = 1;
    local v63 = u26;

    for i, v in pairs(v63) do
        v63[i] = v * 0;
    end;

    local v64 = u27;

    for i, v in pairs(v64) do
        v64[i] = v * 0;
    end;

    local v65 = u28;

    for i, v in pairs(v65) do
        v65[i] = v * 0;
    end;

    ContextActionService:UnbindAction("FreecamKeyboard");
    ContextActionService:UnbindAction("FreecamMousePan");
    ContextActionService:UnbindAction("FreecamMouseWheel");
    ContextActionService:UnbindAction("FreecamGamepadButton");
    ContextActionService:UnbindAction("FreecamGamepadTrigger");
    ContextActionService:UnbindAction("FreecamGamepadThumbstick");
end;

local function GetFocusDistance(p66) -- Line: 331
    -- upvalues: CurrentCamera (ref), u18 (ref), math_tan (copy), Workspace (copy)
    local ViewportSize = CurrentCamera.ViewportSize;
    local v67 = math_tan(u18 / 2) * 2;
    local v68 = ViewportSize.x / ViewportSize.y * v67;
    local rightVector = p66.rightVector;
    local upVector = p66.upVector;
    local lookVector = p66.lookVector;
    local Vector3_new_ret2 = Vector3.new();
    local v69 = 512;

    for i = 0, 1, 0.5 do
        local v70 = i;

        for i2 = 0, 1, 0.5 do
            local v71 = rightVector * ((v70 - 0.5) * v68) - upVector * ((i2 - 0.5) * v67) + lookVector;
            local v72 = p66.p + v71 * 0.1;
            local _, v73 = Workspace:FindPartOnRay(Ray.new(v72, v71.unit * v69));
            local Magnitude = (v73 - v72).Magnitude;
            local v74;

            if Magnitude < v69 then
                Vector3_new_ret2 = v71.unit;
                v69 = Magnitude;
                v74 = i2;
            else
                v74 = i2;
            end;
        end;
    end;

    return lookVector:Dot(Vector3_new_ret2) * v69;
end;

local function StepFreecam(p75) -- Line: 363
    -- upvalues: u19 (copy), u22 (copy), u20 (copy), u21 (copy), u18 (ref), math_rad (copy), math_tan (copy), math_sqrt (copy), math_clamp (copy), Vector2_new_ret (ref), u4 (copy), Vector3_new_ret (ref), CurrentCamera (ref), GetFocusDistance (copy)
    local v76 = u19:Update(p75, u22.Vel(p75));
    local v77 = u20:Update(p75, u22.Pan(p75));
    local v78 = u21:Update(p75, u22.Fov(p75));
    local v79 = math_sqrt(0.7002075382097097 / math_tan((math_rad(u18 / 2))));
    u18 = math_clamp(u18 + v78 * 300 * (p75 / v79), 1, 120);
    Vector2_new_ret = Vector2_new_ret + v77 * u4 * (p75 / v79);
    Vector2_new_ret = Vector2.new(math_clamp(Vector2_new_ret.x, -1.5707963267948966, 1.5707963267948966), Vector2_new_ret.y % 6.283185307179586);
    local v80 = CFrame.new(Vector3_new_ret) * CFrame.fromOrientation(Vector2_new_ret.x, Vector2_new_ret.y, 0) * CFrame.new(v76 * Vector3.new(64, 64, 64) * p75);
    Vector3_new_ret = v80.p;
    CurrentCamera.CFrame = v80;
    CurrentCamera.Focus = v80 * CFrame.new(0, 0, -GetFocusDistance(v80));
    CurrentCamera.FieldOfView = u18;
end;

local u81 = {};
local u82 = nil;
local u83 = nil;
local u84 = nil;
local u85 = nil;
local u86 = nil;
local u87 = nil;
local u88 = {};
local u89 = {
    Backpack = true,
    Chat = true,
    Health = true,
    PlayerList = true
};
local u90 = {
    BadgesNotificationsActive = true,
    PointsNotificationsActive = true
};

function u81.Push() -- Line: 407
    -- upvalues: u89 (copy), StarterGui (copy), u90 (copy), LocalPlayer (ref), u88 (copy), u87 (ref), CurrentCamera (ref), u84 (ref), u86 (ref), u85 (ref), u83 (ref), UserInputService (copy), u82 (ref)
    for i in pairs(u89) do
        u89[i] = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType[i]);
        StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[i], false);
    end;

    for i in pairs(u90) do
        u90[i] = StarterGui:GetCore(i);
        StarterGui:SetCore(i, false);
    end;

    local v91 = LocalPlayer:FindFirstChildOfClass("PlayerGui");

    if v91 then
        for _, child in pairs(v91:GetChildren()) do
            if child:IsA("ScreenGui") and child.Enabled then
                u88[#u88 + 1] = child;
                child.Enabled = false;
            end;
        end;
    end;

    u87 = CurrentCamera.FieldOfView;
    CurrentCamera.FieldOfView = 70;
    u84 = CurrentCamera.CameraType;
    CurrentCamera.CameraType = Enum.CameraType.Custom;
    u86 = CurrentCamera.CFrame;
    u85 = CurrentCamera.Focus;
    u83 = UserInputService.MouseIconEnabled;
    UserInputService.MouseIconEnabled = false;
    u82 = UserInputService.MouseBehavior;
    UserInputService.MouseBehavior = Enum.MouseBehavior.Default;
end;

function u81.Pop() -- Line: 443
    -- upvalues: u89 (copy), StarterGui (copy), u90 (copy), u88 (copy), CurrentCamera (ref), u87 (ref), u84 (ref), u86 (ref), u85 (ref), UserInputService (copy), u83 (ref), u82 (ref)
    for i, v in pairs(u89) do
        StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[i], v);
    end;

    for i, v in pairs(u90) do
        StarterGui:SetCore(i, v);
    end;

    for _, v in pairs(u88) do
        if v.Parent then
            v.Enabled = true;
        end;
    end;

    table.clear(u88);
    CurrentCamera.FieldOfView = u87;
    u87 = nil;
    CurrentCamera.CameraType = u84;
    u84 = nil;
    CurrentCamera.CFrame = u86;
    u86 = nil;
    CurrentCamera.Focus = u85;
    u85 = nil;
    UserInputService.MouseIconEnabled = u83;
    u83 = nil;
    UserInputService.MouseBehavior = u82;
    u82 = nil;
end;

local function StartFreecam() -- Line: 479
    -- upvalues: CurrentCamera (ref), Vector2_new_ret (ref), Vector3_new_ret (ref), u18 (ref), u19 (copy), u20 (copy), u21 (copy), u81 (copy), RunService (copy), StepFreecam (copy), u22 (copy)
    local CFrame2 = CurrentCamera.CFrame;
    Vector2_new_ret = Vector2.new(CFrame2:toEulerAnglesYXZ());
    Vector3_new_ret = CFrame2.p;
    u18 = CurrentCamera.FieldOfView;
    u19:Reset((Vector3.new()));
    u20:Reset(Vector2.new());
    u21:Reset(0);
    u81.Push();
    RunService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, StepFreecam);
    u22.StartCapture();
end;

local function StopFreecam() -- Line: 494
    -- upvalues: u22 (copy), RunService (copy), u81 (copy)
    u22.StopCapture();
    RunService:UnbindFromRenderStep("Freecam");
    u81.Pop();
end;

function v1.init() -- Line: 500
    -- upvalues: u22 (copy), RunService (copy), u81 (copy), StartFreecam (copy), UserInputService (copy), u3 (copy), RemoteEventHandler (copy), ContextActionService (copy), Value (copy), u2 (copy), Debris (copy)
    local u92 = false;

    local function ToggleFreecam() -- Line: 503
        -- upvalues: u92 (ref), u22 (ref), RunService (ref), u81 (ref), StartFreecam (ref)
        if u92 then
            u22.StopCapture();
            RunService:UnbindFromRenderStep("Freecam");
            u81.Pop();
        else
            StartFreecam();
        end;

        u92 = not u92;
    end;

    local function CheckMacro(p93) -- Line: 512
        -- upvalues: UserInputService (ref), u92 (ref), u22 (ref), RunService (ref), u81 (ref), StartFreecam (ref)
        for i = 1, #p93 - 1 do
            if not UserInputService:IsKeyDown(p93[i]) then
                return;
            end;

            local _ = i;
        end;

        if u92 then
            u22.StopCapture();
            RunService:UnbindFromRenderStep("Freecam");
            u81.Pop();
        else
            StartFreecam();
        end;

        u92 = not u92;
    end;

    local function HandleActivationInput(p94, p95, p96) -- Line: 521
        -- upvalues: u3 (ref), CheckMacro (copy)
        if p95 == Enum.UserInputState.Begin and p96.KeyCode == u3[#u3] then
            CheckMacro(u3);
        end;

        return Enum.ContextActionResult.Pass;
    end;

    RemoteEventHandler.AttachCallback("Freecam", function(p97) -- Line: 537
        -- upvalues: ContextActionService (ref), HandleActivationInput (copy), Value (ref), u3 (ref), u92 (ref), u22 (ref), RunService (ref), u81 (ref), StartFreecam (ref), u2 (ref), Debris (ref)
        ContextActionService:UnbindAction("FreecamToggle");
        ContextActionService:BindActionAtPriority("FreecamToggle", HandleActivationInput, false, Value, u3[#u3]);

        if p97 == "Disable" and u92 then
            u92 = false;
            u22.StopCapture();
            RunService:UnbindFromRenderStep("Freecam");
            u81.Pop();
        end;

        if p97 == "Enable" and not u92 then
            u92 = true;
            StartFreecam();
        end;

        if p97 == "Toggle" then
            if u92 then
                u22.StopCapture();
                RunService:UnbindFromRenderStep("Freecam");
                u81.Pop();
            else
                StartFreecam();
            end;

            u92 = not u92;
        end;

        if p97 == "End" or p97 == "Stop" then
            u2.OnClientInvoke = nil;
            Debris:AddItem(u2, 0.5);
            u22.StopCapture();
            RunService:UnbindFromRenderStep("Freecam");
            u81.Pop();
        end;
    end);
    ContextActionService:UnbindAction("FreecamToggle");
end;

return v1;
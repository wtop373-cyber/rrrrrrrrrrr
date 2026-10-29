-- ============================================================
-- SCRIPT: CameraInput
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerScripts.PlayerModule.CameraModule.CameraInput
-- ============================================================

-- Decompiled with Potassium's decompiler.

local ContextActionService = game:GetService("ContextActionService");
local UserInputService = game:GetService("UserInputService");
local Players = game:GetService("Players");
local RunService = game:GetService("RunService");
local UserGameSettings = UserSettings():GetService("UserGameSettings");
local VRService = game:GetService("VRService");
local GuiService = game:GetService("GuiService");
local CommonUtils = script.Parent.Parent:WaitForChild("CommonUtils");
local FlagUtil = require(CommonUtils:WaitForChild("FlagUtil"));
local UserFlag = FlagUtil.getUserFlag("UserCameraInputDt");
local UserFlag2 = FlagUtil.getUserFlag("UserPSSinkUnknownTouchEvents");
local UserFlag3 = FlagUtil.getUserFlag("UserPSTextboxResetCameraInput");
local LocalPlayer = Players.LocalPlayer;
local Value = Enum.ContextActionPriority.Medium.Value;
local u1 = Vector2.new(1, 0.77) * 0.06981317007977318;
local u2 = Vector2.new(1, 0.77) * 0.008726646259971648;
local u3 = Vector2.new(1, 0.77) * 0.12217304763960307;
local u4 = Vector2.new(1, 0.66) * 0.017453292519943295;

if UserFlag then
    u1 = u1 * 60;
end;

if not _G.MDS then
    _G.MDS = 1;
end;

local BindableEvent = Instance.new("BindableEvent");
local BindableEvent2 = Instance.new("BindableEvent");
local Event = BindableEvent.Event;
local Event2 = BindableEvent2.Event;
UserInputService.InputBegan:Connect(function(p5, p6) -- Line: 53
    -- upvalues: BindableEvent (copy)
    if not p6 and p5.UserInputType == Enum.UserInputType.MouseButton2 then
        BindableEvent:Fire();
    end;
end);
UserInputService.InputEnded:Connect(function(p7, p8) -- Line: 59
    -- upvalues: BindableEvent2 (copy)
    if p7.UserInputType == Enum.UserInputType.MouseButton2 then
        BindableEvent2:Fire();
    end;
end);

local function thumbstickCurve(p9) -- Line: 70
    local v10 = (math.abs(p9) - 0.1) / 0.9 * 2;
    local v11 = (math.exp(v10) - 1) / 6.38905609893065;

    return math.sign(p9) * math.clamp(v11, 0, 1);
end;

local function adjustTouchPitchSensitivity(p12) -- Line: 84
    local workspace_CurrentCamera = workspace.CurrentCamera;

    if not workspace_CurrentCamera then
        return p12;
    end;

    local v13 = workspace_CurrentCamera.CFrame:ToEulerAnglesYXZ();

    if p12.Y * v13 >= 0 then
        return p12;
    end;

    local v14 = (1 - (math.abs(v13) * 2 / 3.141592653589793) ^ 0.75) * 0.75 + 0.25;

    return Vector2.new(1, v14) * p12;
end;

local function isInDynamicThumbstickArea(p15: vector) -- Line: 110
    -- upvalues: LocalPlayer (copy)
    local v16 = LocalPlayer:FindFirstChildOfClass("PlayerGui");

    if v16 then
        v16 = v16:FindFirstChild("TouchGui");
    end;

    local v17;

    if v16 then
        v17 = v16:FindFirstChild("TouchControlFrame");
    else
        v17 = v16;
    end;

    if v17 then
        v17 = v17:FindFirstChild("DynamicThumbstickFrame");
    end;

    if not v17 then
        return false;
    end;

    if not v16.Enabled then
        return false;
    end;

    local AbsolutePosition = v17.AbsolutePosition;
    local v18 = AbsolutePosition + v17.AbsoluteSize;
    local v19;

    if p15.X >= AbsolutePosition.X and (p15.Y >= AbsolutePosition.Y and p15.X <= v18.X) then
        v19 = p15.Y <= v18.Y;
    else
        v19 = false;
    end;

    return v19;
end;

local u20 = 0.016666666666666666;
RunService.Stepped:Connect(function(p21, p22) -- Line: 135
    -- upvalues: u20 (ref)
    u20 = p22;
end);
local v23 = {};
local u24 = {};
local u25 = 0;

local function incPanInputCount() -- Line: 145
    -- upvalues: u25 (ref)
    u25 = math.max(0, u25 + 1);
end;

local function decPanInputCount() -- Line: 149
    -- upvalues: u25 (ref)
    u25 = math.max(0, u25 - 1);
end;

local function resetPanInputCount() -- Line: 153
    -- upvalues: u25 (ref)
    u25 = 0;
end;

local u26 = {
    Thumbstick2 = Vector2.new()
};
local u27 = {
    Left = 0,
    Right = 0,
    I = 0,
    O = 0
};
local u28 = {
    Wheel = 0,
    Pinch = 0,
    Movement = Vector2.new(),
    Pan = Vector2.new()
};
local u29 = {
    Pinch = 0,
    Move = Vector2.new()
};
local BindableEvent3 = Instance.new("BindableEvent");
v23.gamepadZoomPress = BindableEvent3.Event;
local u30 = VRService.VREnabled and Instance.new("BindableEvent") or nil;

if VRService.VREnabled then
    v23.gamepadReset = u30.Event;
end;

function v23.getRotationActivated() -- Line: 186
    -- upvalues: u25 (ref), u26 (copy)
    return u25 > 0 and true or u26.Thumbstick2.Magnitude > 0;
end;

function v23.getRotation(p31: any, p32: boolean?) -- Line: 190
    -- upvalues: UserGameSettings (copy), UserFlag (copy), u27 (copy), u20 (ref), u26 (copy), u28 (copy), adjustTouchPitchSensitivity (copy), u29 (copy), u1 (ref), u2 (copy), u3 (copy), u4 (copy)
    local Vector2_new_ret = Vector2.new(1, UserGameSettings:GetCameraYInvertValue());
    local v33;

    if UserFlag then
        v33 = Vector2.new(u27.Right - u27.Left, 0) * p31;
    else
        v33 = Vector2.new(u27.Right - u27.Left, 0) * u20;
    end;

    local v34 = u26.Thumbstick2 * UserGameSettings.GamepadCameraSensitivity;

    if UserFlag then
        v34 = v34 * p31;
    end;

    local Movement = u28.Movement;
    local Pan = u28.Pan;
    local v35 = adjustTouchPitchSensitivity(u29.Move);

    if p32 then
        v33 = Vector2.new();
    end;

    return (v33 * 2.0943951023931953 + v34 * u1 * (_G.GamepadZoomScale or 1) + Movement * u2 + Pan * u3 + v35 * u4 * _G.MDS) * Vector2_new_ret;
end;

function v23.getZoomDelta() -- Line: 224
    -- upvalues: u27 (copy), u28 (copy), u29 (copy)
    return (u27.O - u27.I) * 0.1 + (-u28.Wheel + u28.Pinch) * 1 + -u29.Pinch * 0.04;
end;

local function thumbstick(p36, p37, p38) -- Line: 232
    -- upvalues: u26 (copy), thumbstickCurve (ref)
    local Position = p38.Position;
    u26[p38.KeyCode.Name] = Vector2.new(thumbstickCurve(Position.X), -thumbstickCurve(Position.Y));

    return Enum.ContextActionResult.Pass;
end;

local function mouseMovement(p39) -- Line: 238
    -- upvalues: u28 (copy)
    local Delta = p39.Delta;
    u28.Movement = Vector2.new(Delta.X, Delta.Y);
end;

local function mouseWheel(p40, p41, p42) -- Line: 243
    -- upvalues: u28 (copy)
    u28.Wheel = p42.Position.Z;

    return Enum.ContextActionResult.Pass;
end;

local function keypress(p43, p44, p45) -- Line: 248
    -- upvalues: u27 (copy)
    u27[p45.KeyCode.Name] = p44 == Enum.UserInputState.Begin and 1 or 0;
end;

local function gamepadZoomPress(p46, p47, p48) -- Line: 252
    -- upvalues: BindableEvent3 (copy)
    if p47 == Enum.UserInputState.Begin then
        BindableEvent3:Fire();
    end;
end;

local function gamepadReset(p49, p50, p51) -- Line: 258
    -- upvalues: u30 (copy)
    if p50 == Enum.UserInputState.Begin then
        u30:Fire();
    end;
end;

local function resetInputDevices() -- Line: 264
    -- upvalues: u26 (copy), u27 (copy), u28 (copy), u29 (copy), u25 (ref)
    for _, v in pairs({
        u26,
        u27,
        u28,
        u29
    }) do
        local v52 = v;

        for i, v2 in pairs(v) do
            if type(v2) == "boolean" then
                v52[i] = false;
            else
                v52[i] = v52[i] * 0;
            end;
        end;
    end;

    u25 = 0;
end;

local u53 = {};
local u54 = nil;
local u55 = nil;

local function touchBegan(p56: userdata, p57: boolean) -- Line: 290
    -- upvalues: u54 (ref), isInDynamicThumbstickArea (copy), u25 (ref), u53 (ref)
    assert(p56.UserInputType == Enum.UserInputType.Touch);
    assert(p56.UserInputState == Enum.UserInputState.Begin);

    if u54 == nil and (isInDynamicThumbstickArea(p56.Position) and not p57) then
        u54 = p56;

        return;
    end;

    if not p57 then
        u25 = math.max(0, u25 + 1);
    end;

    u53[p56] = p57;
end;

local function touchEnded(p58: userdata, p59: boolean) -- Line: 310
    -- upvalues: u54 (ref), u53 (ref), u55 (ref), u25 (ref)
    assert(p58.UserInputType == Enum.UserInputType.Touch);
    assert(p58.UserInputState == Enum.UserInputState.End);

    if p58 == u54 then
        u54 = nil;
    end;

    if u53[p58] == false then
        u55 = nil;
        u25 = math.max(0, u25 - 1);
    end;

    u53[p58] = nil;
end;

local function touchChanged(p60, p61) -- Line: 329
    -- upvalues: u54 (ref), u53 (ref), UserFlag2 (copy), u29 (copy), u55 (ref)
    assert(p60.UserInputType == Enum.UserInputType.Touch);
    assert(p60.UserInputState == Enum.UserInputState.Change);

    if p60 == u54 then
        return;
    end;

    if u53[p60] == nil then
        if UserFlag2 then
            u53[p60] = true;
        else
            u53[p60] = p61;
        end;
    end;

    local v62 = {};

    for i, v in pairs(u53) do
        if not v then
            table.insert(v62, i);
        end;
    end;

    if #v62 == 1 and u53[p60] == false then
        local Delta = p60.Delta;
        local v63 = u29;
        v63.Move = v63.Move + Vector2.new(Delta.X, Delta.Y);
    end;

    if #v62 ~= 2 then
        u55 = nil;

        return;
    end;

    local Magnitude = (v62[1].Position - v62[2].Position).Magnitude;

    if u55 then
        local v64 = u29;
        v64.Pinch = v64.Pinch + (Magnitude - u55);
    end;

    u55 = Magnitude;
end;

local function resetTouchState() -- Line: 377
    -- upvalues: u53 (ref), u54 (ref), u55 (ref), u25 (ref)
    u53 = {};
    u54 = nil;
    u55 = nil;
    u25 = 0;
end;

local function pointerAction(p65, p66, p67, p68) -- Line: 385
    -- upvalues: u28 (copy)
    if not p68 then
        u28.Wheel = p65;
        u28.Pan = p66;
        u28.Pinch = -p67;
    end;
end;

local function inputBegan(p69, p70) -- Line: 393
    -- upvalues: touchBegan (ref), u25 (ref)
    if p69.UserInputType == Enum.UserInputType.Touch then
        touchBegan(p69, p70);

        return;
    end;

    if p69.UserInputType == Enum.UserInputType.MouseButton2 and not p70 then
        u25 = math.max(0, u25 + 1);
    end;
end;

local function inputChanged(p71, p72) -- Line: 402
    -- upvalues: touchChanged (ref), u28 (copy)
    if p71.UserInputType == Enum.UserInputType.Touch then
        touchChanged(p71, p72);

        return;
    end;

    if p71.UserInputType == Enum.UserInputType.MouseMovement then
        local Delta = p71.Delta;
        u28.Movement = Vector2.new(Delta.X, Delta.Y);
    end;
end;

local function inputEnded(p73, p74) -- Line: 411
    -- upvalues: touchEnded (ref), u25 (ref)
    if p73.UserInputType == Enum.UserInputType.Touch then
        touchEnded(p73, p74);

        return;
    end;

    if p73.UserInputType == Enum.UserInputType.MouseButton2 then
        u25 = math.max(0, u25 - 1);
    end;
end;

local u75 = false;

function v23.setInputEnabled(p76) -- Line: 422
    -- upvalues: u75 (ref), resetInputDevices (copy), resetTouchState (ref), ContextActionService (copy), thumbstick (copy), Value (copy), keypress (copy), VRService (copy), gamepadReset (copy), gamepadZoomPress (copy), u24 (ref), UserInputService (copy), inputBegan (copy), inputChanged (copy), inputEnded (copy), pointerAction (copy), GuiService (copy)
    if u75 == p76 then
        return;
    end;

    u75 = p76;
    resetInputDevices();
    resetTouchState();

    if not u75 then
        ContextActionService:UnbindAction("RbxCameraThumbstick");
        ContextActionService:UnbindAction("RbxCameraMouseMove");
        ContextActionService:UnbindAction("RbxCameraMouseWheel");
        ContextActionService:UnbindAction("RbxCameraKeypress");
        ContextActionService:UnbindAction("RbxCameraGamepadZoom");

        if VRService.VREnabled then
            ContextActionService:UnbindAction("RbxCameraGamepadReset");
        end;

        for _, v in pairs(u24) do
            v:Disconnect();
        end;

        u24 = {};

        return;
    end;

    ContextActionService:BindActionAtPriority("RbxCameraThumbstick", thumbstick, false, Value, Enum.KeyCode.Thumbstick2);
    ContextActionService:BindActionAtPriority("RbxCameraKeypress", keypress, false, Value, Enum.KeyCode.Left, Enum.KeyCode.Right, Enum.KeyCode.I, Enum.KeyCode.O);

    if VRService.VREnabled then
        ContextActionService:BindAction("RbxCameraGamepadReset", gamepadReset, false, Enum.KeyCode.ButtonL3);
    end;

    ContextActionService:BindAction("RbxCameraGamepadZoom", gamepadZoomPress, false, Enum.KeyCode.ButtonR3);
    table.insert(u24, UserInputService.InputBegan:Connect(inputBegan));
    table.insert(u24, UserInputService.InputChanged:Connect(inputChanged));
    table.insert(u24, UserInputService.InputEnded:Connect(inputEnded));
    table.insert(u24, UserInputService.PointerAction:Connect(pointerAction));
    table.insert(u24, GuiService.MenuOpened:connect(resetTouchState));
end;

function v23.getInputEnabled() -- Line: 491
    -- upvalues: u75 (ref)
    return u75;
end;

function v23.resetInputForFrameEnd() -- Line: 495
    -- upvalues: u28 (copy), u29 (copy)
    u28.Movement = Vector2.new();
    u29.Move = Vector2.new();
    u29.Pinch = 0;
    u28.Wheel = 0;
    u28.Pan = Vector2.new();
    u28.Pinch = 0;
end;

UserInputService.WindowFocused:Connect(resetInputDevices);
UserInputService.WindowFocusReleased:Connect(resetInputDevices);

if UserFlag3 then
    UserInputService.TextBoxFocusReleased:Connect(resetInputDevices);
end;

local u77 = false;
local u78 = false;
local u79 = 0;

function v23.getHoldPan() -- Line: 519
    -- upvalues: u77 (ref)
    return u77;
end;

function v23.getTogglePan() -- Line: 523
    -- upvalues: u78 (ref)
    return u78;
end;

function v23.getPanning() -- Line: 527
    -- upvalues: u78 (ref), u77 (ref)
    return u78 or u77;
end;

function v23.setTogglePan(p80: boolean) -- Line: 531
    -- upvalues: u78 (ref)
    u78 = p80;
end;

local u81 = false;
local u82 = nil;
local u83 = nil;

function v23.enableCameraToggleInput() -- Line: 539
    -- upvalues: u81 (ref), u77 (ref), u78 (ref), u82 (ref), u83 (ref), Event (ref), u79 (ref), Event2 (ref), UserInputService (copy)
    if u81 then
        return;
    end;

    u81 = true;
    u77 = false;
    u78 = false;

    if u82 then
        u82:Disconnect();
    end;

    if u83 then
        u83:Disconnect();
    end;

    u82 = Event:Connect(function() -- Line: 556
        -- upvalues: u77 (ref), u79 (ref)
        u77 = true;
        u79 = tick();
    end);
    u83 = Event2:Connect(function() -- Line: 561
        -- upvalues: u77 (ref), u79 (ref), u78 (ref), UserInputService (ref)
        u77 = false;

        if tick() - u79 < 0.3 and (u78 or UserInputService:GetMouseDelta().Magnitude < 2) then
            u78 = not u78;
        end;
    end);
end;

function v23.disableCameraToggleInput() -- Line: 569
    -- upvalues: u81 (ref), u82 (ref), u83 (ref)
    if not u81 then
        return;
    end;

    u81 = false;

    if u82 then
        u82:Disconnect();
        u82 = nil;
    end;

    if u83 then
        u83:Disconnect();
        u83 = nil;
    end;
end;

return v23;
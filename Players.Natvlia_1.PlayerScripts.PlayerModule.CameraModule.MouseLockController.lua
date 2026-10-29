-- ============================================================
-- SCRIPT: MouseLockController
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerScripts.PlayerModule.CameraModule.MouseLockController
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Value = Enum.ContextActionPriority.Default.Value;
require(script.Parent:WaitForChild("CameraUtils"));
local Players = game:GetService("Players");
game:GetService("UserInputService");
local ContextActionService = game:GetService("ContextActionService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local GameSettings = UserSettings().GameSettings;
local Mouse = Players.LocalPlayer:GetMouse();
local u1 = {};
u1.__index = u1;
local SettingsChanged = ReplicatedStorage.Events2:WaitForChild("SettingsChanged");
local MouseLockChanged = ReplicatedStorage.Events2:WaitForChild("MouseLockChanged");
local ChangeMouseLock = ReplicatedStorage.Events2:WaitForChild("ChangeMouseLock");

local function UpdateSelfBoundKeys() -- Line: 34
end;

function u1.new() -- Line: 38
    -- upvalues: u1 (copy), GameSettings (copy), Players (copy), SettingsChanged (copy), ChangeMouseLock (copy)
    local u2 = setmetatable({}, u1);
    u2.isMouseLocked = false;
    u2.savedMouseCursor = nil;
    local v3 = { Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift };
    local v4 = { Enum.KeyCode.LeftControl, Enum.KeyCode.RightControl };

    if _G.GSettings and _G.GSettings.CTRL_lock then
        v3 = v4 or v3;
    end;

    u2.boundKeys = v3;
    u2.mouseLockToggledEvent = Instance.new("BindableEvent");
    local BoundKeys = script:FindFirstChild("BoundKeys");

    if not (BoundKeys and BoundKeys:IsA("StringValue")) then
        if BoundKeys then
            BoundKeys:Destroy();
        end;

        BoundKeys = Instance.new("StringValue");
        BoundKeys.Name = "BoundKeys";
        BoundKeys.Value = "LeftShift,RightShift";
        BoundKeys.Parent = script;
    end;

    if BoundKeys then
        BoundKeys.Changed:Connect(function(p5) -- Line: 64
            -- upvalues: u2 (copy)
            u2:OnBoundKeysObjectChanged(p5);
        end);
        u2:OnBoundKeysObjectChanged(BoundKeys.Value);
    end;

    GameSettings.Changed:Connect(function(p6) -- Line: 71
        -- upvalues: u2 (copy)
        if p6 == "ControlMode" or p6 == "ComputerMovementMode" then
            u2:UpdateMouseLockAvailability();
        end;
    end);
    Players.LocalPlayer:GetPropertyChangedSignal("DevEnableMouseLock"):Connect(function() -- Line: 78
        -- upvalues: u2 (copy)
        u2:UpdateMouseLockAvailability();
    end);
    Players.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function() -- Line: 83
        -- upvalues: u2 (copy)
        u2:UpdateMouseLockAvailability();
    end);
    SettingsChanged.Event:Connect(function() -- Line: 87
        -- upvalues: u2 (copy)
        if u2.enabled then
            u2:BindContextActions();
        end;
    end);
    u2:UpdateMouseLockAvailability();
    ChangeMouseLock.Event:Connect(function(p7, p8, p9) -- Line: 97
        -- upvalues: u2 (copy)
        u2:OnMouseLockToggled(p7, p8, p9);
    end);
    _G.isMouseLocked = false;
    _G.lastLockMouseState = false;

    return u2;
end;

function u1.GetIsMouseLocked(p10) -- Line: 107
    return p10.isMouseLocked;
end;

function u1.GetBindableToggleEvent(p11) -- Line: 111
    return p11.mouseLockToggledEvent.Event;
end;

function u1.GetMouseLockOffset(p12) -- Line: 115
    local CameraOffset = script:FindFirstChild("CameraOffset");

    if CameraOffset and CameraOffset:IsA("Vector3Value") then
        return CameraOffset.Value;
    end;

    if CameraOffset then
        CameraOffset:Destroy();
    end;

    local Vector3Value = Instance.new("Vector3Value");
    Vector3Value.Name = "CameraOffset";
    Vector3Value.Value = Vector3.new(1.75, 0, 0);
    Vector3Value.Parent = script;

    return not (Vector3Value and Vector3Value.Value) and Vector3.new(1.75, 0, 0) or Vector3Value.Value;
end;

function u1.UpdateMouseLockAvailability(p13) -- Line: 137
    -- upvalues: Players (copy), GameSettings (copy)
    local v14 = Players.LocalPlayer.DevEnableMouseLock and (GameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch and GameSettings.ComputerMovementMode ~= Enum.ComputerMovementMode.ClickToMove) and not (Players.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable);

    if v14 ~= p13.enabled then
        p13:EnableMouseLock(v14);
    end;
end;

function u1.OnBoundKeysObjectChanged(p15, p16) -- Line: 149
    p15.boundKeys = {};

    for i in string.gmatch(p16, "[^%s,]+") do
        local v17 = i;

        for _, v in pairs(Enum.KeyCode:GetEnumItems()) do
            if v17 == v.Name then
                p15.boundKeys[#p15.boundKeys + 1] = v;
                break;
            end;
        end;
    end;

    p15:UnbindContextActions();
    p15:BindContextActions();
end;

function u1.OnMouseLockToggled(p18, p19, p20, p21) -- Line: 164
    -- upvalues: MouseLockChanged (copy), Mouse (copy)
    if p19 == nil then
        p18.isMouseLocked = not p18.isMouseLocked;
    else
        p18.isMouseLocked = p19;
    end;

    if not p20 then
        p18.lastLockState = p18.isMouseLocked;
        _G.lastLockMouseState = p18.lastLockState;
    end;

    _G.isMouseLocked = p18.isMouseLocked;
    MouseLockChanged:Fire(p18.isMouseLocked, p21);

    if p18.isMouseLocked then
        local CursorImage = script:FindFirstChild("CursorImage");

        if CursorImage and (CursorImage:IsA("StringValue") and CursorImage.Value) then
            p18.savedMouseCursor = Mouse.Icon;
            Mouse.Icon = CursorImage.Value;
        else
            if CursorImage then
                CursorImage:Destroy();
            end;

            local StringValue = Instance.new("StringValue");
            StringValue.Name = "CursorImage";
            StringValue.Value = "rbxasset://textures/MouseLockedCursor.png";
            StringValue.Parent = script;
            p18.savedMouseCursor = Mouse.Icon;
            Mouse.Icon = "rbxasset://textures/MouseLockedCursor.png";
        end;
    elseif p18.savedMouseCursor then
        Mouse.Icon = p18.savedMouseCursor;
        p18.savedMouseCursor = nil;
    end;

    p18.mouseLockToggledEvent:Fire();
end;

function u1.DoMouseLockSwitch(p22, p23, p24, p25) -- Line: 208
    if p24 ~= Enum.UserInputState.Begin then
        return Enum.ContextActionResult.Pass;
    end;

    p22:OnMouseLockToggled();

    return Enum.ContextActionResult.Sink;
end;

function u1.BindContextActions(u26) -- Line: 216
    -- upvalues: ContextActionService (copy), Value (copy)
    local v27 = { Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift };
    local v28 = { Enum.KeyCode.LeftControl, Enum.KeyCode.RightControl };

    if _G.GSettings and _G.GSettings.CTRL_lock then
        v27 = v28 or v27;
    end;

    u26.boundKeys = v27;
    ContextActionService:BindActionAtPriority("MouseLockSwitchAction", function(p29, p30, p31) -- Line: 221
        -- upvalues: u26 (copy)
        return u26:DoMouseLockSwitch(p29, p30, p31);
    end, false, Value, unpack(u26.boundKeys));
end;

function u1.UnbindContextActions(p32) -- Line: 225
    -- upvalues: ContextActionService (copy)
    ContextActionService:UnbindAction("MouseLockSwitchAction");
end;

function u1.IsMouseLocked(p33) -- Line: 229
    return p33.enabled and p33.isMouseLocked;
end;

function u1.EnableMouseLock(p34, p35) -- Line: 233
    -- upvalues: Mouse (copy)
    if p35 ~= p34.enabled then
        p34.enabled = p35;

        if p34.enabled then
            p34:BindContextActions();

            return;
        end;

        if Mouse.Icon ~= "" then
            Mouse.Icon = "";
        end;

        p34:UnbindContextActions();

        if p34.isMouseLocked then
            p34.mouseLockToggledEvent:Fire();
        end;

        p34.isMouseLocked = false;
    end;
end;

return u1;
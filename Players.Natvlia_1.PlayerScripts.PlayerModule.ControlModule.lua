-- ============================================================
-- SCRIPT: ControlModule
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerScripts.PlayerModule.ControlModule
-- ============================================================

-- Decompiled with Potassium's decompiler.

local u1 = {};
u1.__index = u1;
local Players = game:GetService("Players");
local RunService = game:GetService("RunService");
local UserInputService = game:GetService("UserInputService");
local GuiService = game:GetService("GuiService");
local Workspace = game:GetService("Workspace");
local UserGameSettings = UserSettings():GetService("UserGameSettings");
local VRService = game:GetService("VRService");
local CommonUtils = script.Parent:WaitForChild("CommonUtils");
local Keyboard = require(script:WaitForChild("Keyboard"));
local Gamepad = require(script:WaitForChild("Gamepad"));
local DynamicThumbstick = require(script:WaitForChild("DynamicThumbstick"));
local FlagUtil = require(CommonUtils:WaitForChild("FlagUtil"));
local success, result = pcall(function() -- Line: 42
    return UserSettings():IsUserFeatureEnabled("UserDynamicThumbstickSafeAreaUpdate");
end);
local u2 = success and result;
local UserFlag = FlagUtil.getUserFlag("UserPreferredInputPlayerScripts2");
local UserFlag2 = FlagUtil.getUserFlag("UserPSRemoveTouchEnabled");

local function GameInputScheme() -- Line: 51
    -- upvalues: UserInputService (copy)
    local _G_InputType = _G.InputType;

    if _G_InputType == 1 or (_G_InputType == 2 or _G_InputType == 3) then
        return _G_InputType;
    end;

    local PreferredInput = UserInputService.PreferredInput;

    return PreferredInput == Enum.PreferredInput.Touch and 3 or (PreferredInput == Enum.PreferredInput.Gamepad and 2 or 1);
end;

local TouchThumbstick = require(script:WaitForChild("TouchThumbstick"));
local ClickToMoveController = require(script:WaitForChild("ClickToMoveController"));
local TouchJump = require(script:WaitForChild("TouchJump"));
local VehicleController = require(script:WaitForChild("VehicleController"));
local Value = Enum.ContextActionPriority.Medium.Value;
local u3 = {
    [Enum.TouchMovementMode.DPad] = DynamicThumbstick,
    [Enum.DevTouchMovementMode.DPad] = DynamicThumbstick,
    [Enum.TouchMovementMode.Thumbpad] = DynamicThumbstick,
    [Enum.DevTouchMovementMode.Thumbpad] = DynamicThumbstick,
    [Enum.TouchMovementMode.Thumbstick] = TouchThumbstick,
    [Enum.DevTouchMovementMode.Thumbstick] = TouchThumbstick,
    [Enum.TouchMovementMode.DynamicThumbstick] = DynamicThumbstick,
    [Enum.DevTouchMovementMode.DynamicThumbstick] = DynamicThumbstick,
    [Enum.TouchMovementMode.ClickToMove] = ClickToMoveController,
    [Enum.DevTouchMovementMode.ClickToMove] = ClickToMoveController,
    [Enum.TouchMovementMode.Default] = DynamicThumbstick,
    [Enum.ComputerMovementMode.Default] = Keyboard,
    [Enum.ComputerMovementMode.KeyboardMouse] = Keyboard,
    [Enum.DevComputerMovementMode.KeyboardMouse] = Keyboard,
    [Enum.DevComputerMovementMode.Scriptable] = nil,
    [Enum.ComputerMovementMode.ClickToMove] = ClickToMoveController,
    [Enum.DevComputerMovementMode.ClickToMove] = ClickToMoveController
};
local u4 = {
    [Enum.UserInputType.Keyboard] = Keyboard,
    [Enum.UserInputType.MouseButton1] = Keyboard,
    [Enum.UserInputType.MouseButton2] = Keyboard,
    [Enum.UserInputType.MouseButton3] = Keyboard,
    [Enum.UserInputType.MouseWheel] = Keyboard,
    [Enum.UserInputType.MouseMovement] = Keyboard,
    [Enum.UserInputType.Gamepad1] = Gamepad,
    [Enum.UserInputType.Gamepad2] = Gamepad,
    [Enum.UserInputType.Gamepad3] = Gamepad,
    [Enum.UserInputType.Gamepad4] = Gamepad
};
local u5 = nil;

function u1.new() -- Line: 115
    -- upvalues: u1 (copy), Players (copy), UserFlag (copy), VehicleController (copy), Value (copy), RunService (copy), UserInputService (copy), UserGameSettings (copy), GuiService (copy)
    local u6 = setmetatable({}, u1);
    u6.controllers = {};
    u6.activeControlModule = nil;
    u6.activeController = nil;
    u6.touchJumpController = nil;
    u6.moveFunction = Players.LocalPlayer.Move;
    u6.humanoid = nil;

    if not UserFlag then
        u6.lastInputType = Enum.UserInputType.None;
    end;

    u6.controlsEnabled = true;
    u6.humanoidSeatedConn = nil;
    u6.vehicleController = nil;
    u6.touchControlFrame = nil;
    u6.currentTorsoAngle = 0;
    u6.inputMoveVector = Vector3.new(0, 0, 0);
    u6.vehicleController = VehicleController.new(Value);
    Players.LocalPlayer.CharacterAdded:Connect(function(p7) -- Line: 143
        -- upvalues: u6 (copy)
        u6:OnCharacterAdded(p7);
    end);
    Players.LocalPlayer.CharacterRemoving:Connect(function(p8) -- Line: 144
        -- upvalues: u6 (copy)
        u6:OnCharacterRemoving(p8);
    end);

    if Players.LocalPlayer.Character then
        u6:OnCharacterAdded(Players.LocalPlayer.Character);
    end;

    RunService:BindToRenderStep("ControlScriptRenderstep", Enum.RenderPriority.Input.Value, function(p9) -- Line: 149
        -- upvalues: u6 (copy)
        u6:OnRenderStepped(p9);
    end);

    if not UserFlag then
        UserInputService.LastInputTypeChanged:Connect(function(p10) -- Line: 154
            -- upvalues: u6 (copy)
            u6:OnLastInputTypeChanged(p10);
        end);
    end;

    UserGameSettings:GetPropertyChangedSignal("TouchMovementMode"):Connect(function() -- Line: 159
        -- upvalues: UserFlag (ref), u6 (copy)
        if UserFlag then
            u6:UpdateMovementMode();

            return;
        end;

        u6:OnTouchMovementModeChange();
    end);
    Players.LocalPlayer:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function() -- Line: 166
        -- upvalues: UserFlag (ref), u6 (copy)
        if UserFlag then
            u6:UpdateMovementMode();

            return;
        end;

        u6:OnTouchMovementModeChange();
    end);
    UserGameSettings:GetPropertyChangedSignal("ComputerMovementMode"):Connect(function() -- Line: 174
        -- upvalues: UserFlag (ref), u6 (copy)
        if UserFlag then
            u6:UpdateMovementMode();

            return;
        end;

        u6:OnComputerMovementModeChange();
    end);
    Players.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function() -- Line: 181
        -- upvalues: UserFlag (ref), u6 (copy)
        if UserFlag then
            u6:UpdateMovementMode();

            return;
        end;

        u6:OnComputerMovementModeChange();
    end);
    u6.playerGui = nil;
    u6.touchGui = nil;
    u6.playerGuiAddedConn = nil;
    GuiService:GetPropertyChangedSignal("TouchControlsEnabled"):Connect(function() -- Line: 194
        -- upvalues: UserFlag (ref), u6 (copy)
        if UserFlag then
            u6:UpdateMovementMode();
        else
            u6:UpdateTouchGuiVisibility();
        end;

        u6:UpdateActiveControlModuleEnabled();
    end);

    if UserFlag then
        UserInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function() -- Line: 204
            -- upvalues: u6 (copy)
            u6:UpdateMovementMode();
        end);
        task.spawn(function() -- Line: 207
            -- upvalues: u6 (copy)
            game:GetService("ReplicatedStorage"):WaitForChild("Events2"):WaitForChild("InputTypeChanged").Event:Connect(function() -- Line: 209
                -- upvalues: u6 (ref)
                u6:UpdateMovementMode();
            end);
        end);
        u6.playerGui = Players.LocalPlayer:FindFirstChildOfClass("PlayerGui");

        if not u6.playerGui then
            u6.playerGuiAddedConn = Players.LocalPlayer.ChildAdded:Connect(function(p11) -- Line: 216
                -- upvalues: u6 (copy)
                if p11:IsA("PlayerGui") then
                    u6.playerGui = p11;
                    u6.playerGuiAddedConn:Disconnect();
                    u6.playerGuiAddedConn = nil;
                    u6:UpdateMovementMode();
                end;
            end);
        end;

        u6:UpdateMovementMode();

        return u6;
    end;

    if not UserInputService.TouchEnabled then
        u6:OnLastInputTypeChanged(UserInputService:GetLastInputType());

        return u6;
    end;

    u6.playerGui = Players.LocalPlayer:FindFirstChildOfClass("PlayerGui");

    if not u6.playerGui then
        u6.playerGuiAddedConn = Players.LocalPlayer.ChildAdded:Connect(function(p12) -- Line: 234
            -- upvalues: u6 (copy), UserInputService (ref)
            if p12:IsA("PlayerGui") then
                u6.playerGui = p12;
                u6:CreateTouchGuiContainer();
                u6.playerGuiAddedConn:Disconnect();
                u6.playerGuiAddedConn = nil;
                u6:OnLastInputTypeChanged(UserInputService:GetLastInputType());
            end;
        end);

        return u6;
    end;

    u6:CreateTouchGuiContainer();
    u6:OnLastInputTypeChanged(UserInputService:GetLastInputType());

    return u6;
end;

function u1.GetMoveVector(p13) -- Line: 255
    return not p13.activeController and Vector3.new(0, 0, 0) or p13.activeController:GetMoveVector();
end;

local function NormalizeAngle(p14) -- Line: 262
    local v15 = (p14 + 12.566370614359172) % 6.283185307179586;

    if v15 > 3.141592653589793 then
        v15 = v15 - 6.283185307179586;
    end;

    return v15;
end;

local function AverageAngle(p16, p17) -- Line: 270
    local v18 = (p17 - p16 + 12.566370614359172) % 6.283185307179586;

    if v18 > 3.141592653589793 then
        v18 = v18 - 6.283185307179586;
    end;

    local v19 = (p16 + v18 / 2 + 12.566370614359172) % 6.283185307179586;

    if v19 > 3.141592653589793 then
        v19 = v19 - 6.283185307179586;
    end;

    return v19;
end;

function u1.GetEstimatedVRTorsoFrame(p20) -- Line: 275
    -- upvalues: VRService (copy)
    local UserCFrame = VRService:GetUserCFrame(Enum.UserCFrame.Head);
    local _, v21, _ = UserCFrame:ToEulerAnglesYXZ();
    local v22 = -v21;

    if VRService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) and VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
        local UserCFrame2 = VRService:GetUserCFrame(Enum.UserCFrame.LeftHand);
        local UserCFrame3 = VRService:GetUserCFrame(Enum.UserCFrame.RightHand);
        local v23 = UserCFrame.Position - UserCFrame2.Position;
        local v24 = UserCFrame.Position - UserCFrame3.Position;
        local v25 = -math.atan2(v23.X, v23.Z);
        local v26 = (-math.atan2(v24.X, v24.Z) - v25 + 12.566370614359172) % 6.283185307179586;

        if v26 > 3.141592653589793 then
            v26 = v26 - 6.283185307179586;
        end;

        local v27 = (v25 + v26 / 2 + 12.566370614359172) % 6.283185307179586;

        if v27 > 3.141592653589793 then
            v27 = v27 - 6.283185307179586;
        end;

        local v28 = (v22 - p20.currentTorsoAngle + 12.566370614359172) % 6.283185307179586;

        if v28 > 3.141592653589793 then
            v28 = v28 - 6.283185307179586;
        end;

        local v29 = (v27 - p20.currentTorsoAngle + 12.566370614359172) % 6.283185307179586;

        if v29 > 3.141592653589793 then
            v29 = v29 - 6.283185307179586;
        end;

        local v30;

        if v29 > -1.5707963267948966 then
            v30 = v29 < 1.5707963267948966;
        else
            v30 = false;
        end;

        if not v30 then
            v29 = v28;
        end;

        local math_min_ret = math.min(v29, v28);
        local math_max_ret = math.max(v29, v28);
        local v31 = 0;

        if math_min_ret > 0 then
            math_max_ret = math_min_ret;
        elseif math_max_ret >= 0 then
            math_max_ret = v31;
        end;

        p20.currentTorsoAngle = math_max_ret + p20.currentTorsoAngle;
    else
        p20.currentTorsoAngle = v22;
    end;

    return CFrame.new(UserCFrame.Position) * CFrame.fromEulerAnglesYXZ(0, -p20.currentTorsoAngle, 0);
end;

function u1.GetActiveController(p32) -- Line: 319
    return p32.activeController;
end;

function u1.UpdateActiveControlModuleEnabled(u33) -- Line: 324
    -- upvalues: Players (copy), UserFlag (copy), UserInputService (copy), ClickToMoveController (copy), TouchThumbstick (copy), DynamicThumbstick (copy), TouchJump (copy), GuiService (copy)
    local function _() -- Line: 326
        -- upvalues: u33 (copy), Players (ref)
        u33.activeController:Enable(false);

        if u33.touchJumpController then
            u33.touchJumpController:Enable(false);
        end;

        if u33.moveFunction then
            u33.moveFunction(Players.LocalPlayer, Vector3.new(0, 0, 0), true);
        end;
    end;

    local function v34() -- Line: 337
        -- upvalues: u33 (copy), UserFlag (ref), UserInputService (ref), ClickToMoveController (ref), TouchThumbstick (ref), DynamicThumbstick (ref), TouchJump (ref), Players (ref)
        if u33.touchControlFrame then
            if UserFlag then
                local _G_InputType = _G.InputType;

                if _G_InputType ~= 1 and (_G_InputType ~= 2 and _G_InputType ~= 3) then
                    local PreferredInput = UserInputService.PreferredInput;
                    _G_InputType = PreferredInput == Enum.PreferredInput.Touch and 3 or (PreferredInput == Enum.PreferredInput.Gamepad and 2 or 1);
                end;

                if _G_InputType == 3 then
                    if u33.activeControlModule == ClickToMoveController or (u33.activeControlModule == TouchThumbstick or u33.activeControlModule == DynamicThumbstick) then
                        if not u33.controllers[TouchJump] then
                            u33.controllers[TouchJump] = TouchJump.new();
                        end;

                        u33.touchJumpController = u33.controllers[TouchJump];
                        u33.touchJumpController:Enable(true, u33.touchControlFrame);
                    elseif u33.touchJumpController then
                        u33.touchJumpController:Enable(false);
                    end;
                elseif u33.touchJumpController then
                    u33.touchJumpController:Enable(false);
                end;
            elseif u33.activeControlModule == ClickToMoveController or (u33.activeControlModule == TouchThumbstick or u33.activeControlModule == DynamicThumbstick) then
                if not u33.controllers[TouchJump] then
                    u33.controllers[TouchJump] = TouchJump.new();
                end;

                u33.touchJumpController = u33.controllers[TouchJump];
                u33.touchJumpController:Enable(true, u33.touchControlFrame);
            elseif u33.touchJumpController then
                u33.touchJumpController:Enable(false);
            end;
        elseif u33.touchJumpController then
            u33.touchJumpController:Enable(false);
        end;

        if u33.activeControlModule == ClickToMoveController then
            u33.activeController:Enable(true, Players.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice, u33.touchJumpController);

            return;
        end;

        if u33.touchControlFrame then
            u33.activeController:Enable(true, u33.touchControlFrame);

            return;
        end;

        u33.activeController:Enable(true);
    end;

    if not u33.activeController then
        return;
    end;

    if not u33.controlsEnabled then
        u33.activeController:Enable(false);

        if u33.touchJumpController then
            u33.touchJumpController:Enable(false);
        end;

        if u33.moveFunction then
            u33.moveFunction(Players.LocalPlayer, Vector3.new(0, 0, 0), true);
        end;

        return;
    end;

    local v35;

    if UserFlag then
        local _G_InputType = _G.InputType;

        if _G_InputType ~= 1 and (_G_InputType ~= 2 and _G_InputType ~= 3) then
            local PreferredInput = UserInputService.PreferredInput;
            _G_InputType = PreferredInput == Enum.PreferredInput.Touch and 3 or (PreferredInput == Enum.PreferredInput.Gamepad and 2 or 1);
        end;

        v35 = _G_InputType == 3;
    else
        v35 = UserInputService.TouchEnabled;
    end;

    if GuiService.TouchControlsEnabled or not (v35 and (u33.activeControlModule == ClickToMoveController or (u33.activeControlModule == TouchThumbstick or u33.activeControlModule == DynamicThumbstick))) then
        v34();

        return;
    end;

    u33.activeController:Enable(false);

    if u33.touchJumpController then
        u33.touchJumpController:Enable(false);
    end;

    if u33.moveFunction then
        u33.moveFunction(Players.LocalPlayer, Vector3.new(0, 0, 0), true);
    end;
end;

function u1.Enable(p36: table, p37: boolean?) -- Line: 403
    local v38 = p37 == nil and true or p37;

    if p36.controlsEnabled == v38 then
        return;
    end;

    p36.controlsEnabled = v38;

    if not p36.activeController then
        return;
    end;

    p36:UpdateActiveControlModuleEnabled();
end;

function u1.Disable(p39) -- Line: 418
    p39:Enable(false);
end;

function u1.SelectComputerMovementModule(p40) -- Line: 424
    -- upvalues: UserInputService (copy), Players (copy), UserFlag (copy), Gamepad (copy), Keyboard (copy), u4 (copy), u5 (ref), UserGameSettings (copy), ClickToMoveController (copy), u3 (copy)
    if not (UserInputService.KeyboardEnabled or UserInputService.GamepadEnabled) then
        return nil, false;
    end;

    local v41 = nil;
    local DevComputerMovementMode = Players.LocalPlayer.DevComputerMovementMode;

    if DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice then
        if UserFlag then
            local _G_InputType = _G.InputType;

            if _G_InputType ~= 1 and (_G_InputType ~= 2 and _G_InputType ~= 3) then
                local PreferredInput = UserInputService.PreferredInput;
                _G_InputType = PreferredInput == Enum.PreferredInput.Touch and 3 or (PreferredInput == Enum.PreferredInput.Gamepad and 2 or 1);
            end;

            if _G_InputType == 2 then
                v41 = Gamepad;
            elseif _G_InputType == 1 then
                v41 = Keyboard;
            end;
        else
            v41 = u4[u5];
        end;

        if UserGameSettings.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove and v41 == Keyboard then
            v41 = ClickToMoveController;
        end;
    else
        v41 = u3[DevComputerMovementMode];

        if not v41 and DevComputerMovementMode ~= Enum.DevComputerMovementMode.Scriptable then
            warn("No character control module is associated with DevComputerMovementMode ", DevComputerMovementMode);
        end;
    end;

    if v41 then
        return v41, true;
    end;

    if DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable then
        return nil, true;
    end;

    return nil, false;
end;

function u1.SelectTouchModule(p42) -- Line: 472
    -- upvalues: UserFlag2 (copy), UserInputService (copy), Players (copy), u3 (copy), UserGameSettings (copy)
    if not (UserFlag2 or UserInputService.TouchEnabled) then
        return nil, false;
    end;

    local DevTouchMovementMode = Players.LocalPlayer.DevTouchMovementMode;
    local v43;

    if DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice then
        v43 = u3[UserGameSettings.TouchMovementMode];
    else
        if DevTouchMovementMode == Enum.DevTouchMovementMode.Scriptable then
            return nil, true;
        end;

        v43 = u3[DevTouchMovementMode];
    end;

    return v43, true;
end;

local function getGamepadRightThumbstickPosition() -- Line: 490
    -- upvalues: UserInputService (copy)
    local GamepadState = UserInputService:GetGamepadState(Enum.UserInputType.Gamepad1);

    for _, v in pairs(GamepadState) do
        if v.KeyCode == Enum.KeyCode.Thumbstick2 then
            return v.Position;
        end;
    end;

    return Vector3.new(0, 0, 0);
end;

function u1.calculateRawMoveVector(p44: table, p45: userdata, p46: vector) -- Line: 500
    -- upvalues: Workspace (copy), VRService (copy), getGamepadRightThumbstickPosition (copy)
    local CurrentCamera = Workspace.CurrentCamera;

    if not CurrentCamera then
        return p46;
    end;

    local CFrame2 = CurrentCamera.CFrame;

    if VRService.VREnabled and p45.RootPart then
        VRService:GetUserCFrame(Enum.UserCFrame.Head);
        local EstimatedVRTorsoFrame = p44:GetEstimatedVRTorsoFrame();

        if (CurrentCamera.Focus.Position - CFrame2.Position).Magnitude < 3 then
            CFrame2 = CFrame2 * EstimatedVRTorsoFrame;
        else
            CFrame2 = CurrentCamera.CFrame * (EstimatedVRTorsoFrame.Rotation + EstimatedVRTorsoFrame.Position * CurrentCamera.HeadScale);
        end;
    end;

    if p45:GetState() ~= Enum.HumanoidStateType.Swimming then
        local _, _, _, v47, v48, v49, _, _, v50, _, _, v47 = CFrame2:GetComponents();

        if v50 >= 1 or v50 <= -1 then
            v49 = -v48 * math.sign(v50);
        end;

        local math_sqrt_ret = math.sqrt(v47 * v47 + v49 * v49);

        return Vector3.new((v47 * p46.X + v49 * p46.Z) / math_sqrt_ret, 0, (v47 * p46.Z - v49 * p46.X) / math_sqrt_ret);
    end;

    if not VRService.VREnabled then
        return CFrame2:VectorToWorldSpace(p46);
    end;

    local Vector3_new_ret = Vector3.new(p46.X, 0, p46.Z);

    if Vector3_new_ret.Magnitude < 0.01 then
        return Vector3.new(0, 0, 0);
    end;

    local v51 = -getGamepadRightThumbstickPosition().Y * 1.3962634015954636;
    local math_atan2_ret = math.atan2(-Vector3_new_ret.X, -Vector3_new_ret.Z);
    local _, v52, _ = CFrame2:ToEulerAnglesYXZ();

    return CFrame.fromEulerAnglesYXZ(v51, math_atan2_ret + v52, 0).LookVector;
end;

local Vector3_new_ret = Vector3.new();
local Vector3_new_ret2 = Vector3.new();
Vector3.new();

local function lerp(p53, p54, p55) -- Line: 577
    return p53 + (p54 - p53) * p55;
end;

function u1.OnRenderStepped(p56, p57) -- Line: 581
    -- upvalues: Gamepad (copy), Vector3_new_ret (ref), Vector3_new_ret2 (ref), VRService (copy), Players (copy)
    if p56.activeController and (p56.activeController.enabled and p56.humanoid) then
        local MoveVector = p56.activeController:GetMoveVector();
        local v58 = p56.activeController:IsMoveVectorCameraRelative();
        local ClickToMoveController2 = p56:GetClickToMoveController();

        if p56.activeController == ClickToMoveController2 then
            ClickToMoveController2:OnRenderStepped(p57);
        elseif MoveVector.Magnitude > 0 then
            ClickToMoveController2:CleanupPath();
        else
            ClickToMoveController2:OnRenderStepped(p57);
            MoveVector = ClickToMoveController2:GetMoveVector();
            v58 = ClickToMoveController2:IsMoveVectorCameraRelative();
        end;

        if p56.vehicleController then
            MoveVector = p56.vehicleController:Update(MoveVector, v58, p56.activeControlModule == Gamepad);
        end;

        if v58 then
            MoveVector = p56:calculateRawMoveVector(p56.humanoid, MoveVector);
        end;

        local v59 = p56.activeController:GetIsJumping() or p56.touchJumpController and p56.touchJumpController:GetIsJumping();
        local v60 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid");
        local v61;

        if v60 then
            v61 = v60:GetState();
        else
            v61 = v60;
        end;

        local v62;

        if v59 then
            v62 = v59;
        elseif v60 then
            v62 = v61 == Enum.HumanoidStateType.Freefall;
        else
            v62 = v60;
        end;

        Vector3_new_ret = MoveVector;
        local v63 = (_G.DownedCheck and _G.DownedCheck() and 1.5 or 7) * (p56.accel2 or 1);

        if v62 then
            v63 = v63 * 0.25;
        end;

        if v60 and v61 == Enum.HumanoidStateType.Swimming then
            v63 = v63 * 2;
        end;

        local math_clamp_ret = math.clamp(p57 * v63, 0, 1);
        Vector3_new_ret2 = Vector3_new_ret2 + (Vector3_new_ret - Vector3_new_ret2) * math_clamp_ret;

        if Vector3_new_ret.Magnitude < 1e-6 then
            local _ = p56.humanoid and p56.humanoid.FloorMaterial ~= Enum.Material.Air;
            local v64 = 0.55;

            if v64 > 0 and Vector3_new_ret2.Magnitude <= v64 then
                Vector3_new_ret2 = Vector3.new(0, 0, 0);
            end;
        end;

        p56.inputMoveVector = Vector3_new_ret2;

        if VRService and VRService.VREnabled then
            Vector3_new_ret2 = p56:updateVRMoveVector(Vector3_new_ret2);
        end;

        p56.moveFunction(Players.LocalPlayer, Vector3_new_ret2, false);
        p56.humanoid.Jump = v59;
    end;
end;

function u1.updateVRMoveVector(p65, p66) -- Line: 673
    -- upvalues: VRService (copy)
    local workspace_CurrentCamera = workspace.CurrentCamera;

    if p66.Magnitude ~= 0 or ((workspace_CurrentCamera.Focus.Position - workspace_CurrentCamera.CFrame.Position).Magnitude >= 5 or not (VRService.AvatarGestures and (p65.humanoid and not p65.humanoid.Sit))) then
        return p66;
    end;

    local UserCFrame = VRService:GetUserCFrame(Enum.UserCFrame.Head);
    local v67 = (workspace_CurrentCamera.CFrame * (UserCFrame.Rotation + UserCFrame.Position * workspace_CurrentCamera.HeadScale) * CFrame.new(0, -0.7 * p65.humanoid.RootPart.Size.Y / 2, 0)).Position - p65.humanoid.RootPart.CFrame.Position;

    return Vector3.new(v67.x, 0, v67.z);
end;

function u1.OnHumanoidSeated(p68: table, p69: boolean, p70: userdata) -- Line: 698
    -- upvalues: Value (copy)
    if p69 then
        if p70 and p70:IsA("VehicleSeat") then
            if not p68.vehicleController then
                p68.vehicleController = p68.vehicleController.new(Value);
            end;

            p68.vehicleController:Enable(true, p70);
        end;
    elseif p68.vehicleController then
        p68.vehicleController:Enable(false, p70);
    end;
end;

function u1.OnCharacterAdded(u71, p72) -- Line: 713
    -- upvalues: UserFlag (copy)
    u71.humanoid = p72:FindFirstChildOfClass("Humanoid");

    while not u71.humanoid do
        p72.ChildAdded:wait();
        u71.humanoid = p72:FindFirstChildOfClass("Humanoid");
    end;

    local u73 = _G.GVF and _G.GVF(p72.Name);
    u71.accel2 = 1;

    local function changedA() -- Line: 723
        -- upvalues: u71 (copy), u73 (copy)
        local math_min_ret = math.min(u73.AccelerationModifier.Value * u73.AccelerationModifier2.Value, 3);
        u71.accel2 = math.max(math_min_ret, 0.1);
    end;

    if u73 then
        u73.AccelerationModifier.Changed:Connect(changedA);
        u73.AccelerationModifier2.Changed:Connect(changedA);
        local math_min_ret = math.min(u73.AccelerationModifier.Value * u73.AccelerationModifier2.Value, 3);
        u71.accel2 = math.max(math_min_ret, 0.1);
    end;

    if not UserFlag then
        u71:UpdateTouchGuiVisibility();
    end;

    if u71.humanoidSeatedConn then
        u71.humanoidSeatedConn:Disconnect();
        u71.humanoidSeatedConn = nil;
    end;

    u71.humanoidSeatedConn = u71.humanoid.Seated:Connect(function(p74, p75) -- Line: 741
        -- upvalues: u71 (copy)
        u71:OnHumanoidSeated(p74, p75);
    end);

    if UserFlag then
        u71:UpdateMovementMode();
    end;
end;

function u1.OnCharacterRemoving(p76, p77) -- Line: 750
    -- upvalues: UserFlag (copy)
    p76.humanoid = nil;

    if UserFlag then
        p76:UpdateMovementMode();

        return;
    end;

    p76:UpdateTouchGuiVisibility();
end;

function u1.UpdateTouchGuiVisibility(p78) -- Line: 760
    -- upvalues: UserFlag (copy), GuiService (copy), UserInputService (copy)
    local v79;

    if UserFlag then
        v79 = p78.humanoid and GuiService.TouchControlsEnabled;

        if v79 then
            local _G_InputType = _G.InputType;

            if _G_InputType ~= 1 and (_G_InputType ~= 2 and _G_InputType ~= 3) then
                local PreferredInput = UserInputService.PreferredInput;
                _G_InputType = PreferredInput == Enum.PreferredInput.Touch and 3 or (PreferredInput == Enum.PreferredInput.Gamepad and 2 or 1);
            end;

            v79 = _G_InputType == 3;
        end;

        if v79 and not p78.touchGui then
            p78:CreateTouchGuiContainer();
        end;
    else
        v79 = p78.humanoid and GuiService.TouchControlsEnabled;
    end;

    if p78.touchGui then
        p78.touchGui.Enabled = v79 and true or false;
    end;
end;

function u1.SwitchToController(p80, p81) -- Line: 784
    -- upvalues: Value (copy)
    if p81 then
        if not p80.controllers[p81] then
            p80.controllers[p81] = p81.new(Value);
        end;

        if p80.activeController ~= p80.controllers[p81] then
            if p80.activeController then
                p80.activeController:Enable(false);
            end;

            p80.activeController = p80.controllers[p81];
            p80.activeControlModule = p81;
            p80:UpdateActiveControlModuleEnabled();
        end;

        return;
    end;

    if p80.activeController then
        p80.activeController:Enable(false);
    end;

    p80.activeController = nil;
    p80.activeControlModule = nil;
end;

function u1.UpdateMovementMode(p82) -- Line: 823
    -- upvalues: UserInputService (copy)
    p82:UpdateTouchGuiVisibility();
    local _G_InputType = _G.InputType;

    if _G_InputType ~= 1 and (_G_InputType ~= 2 and _G_InputType ~= 3) then
        local PreferredInput = UserInputService.PreferredInput;
        _G_InputType = PreferredInput == Enum.PreferredInput.Touch and 3 or (PreferredInput == Enum.PreferredInput.Gamepad and 2 or 1);
    end;

    if _G_InputType == 3 then
        local v83, v84 = p82:SelectTouchModule();

        if v84 and p82.touchControlFrame then
            p82:SwitchToController(v83);
        end;
    else
        p82:SwitchToController((p82:SelectComputerMovementModule()));
    end;
end;

function u1.OnLastInputTypeChanged(p85, p86) -- Line: 840
    -- upvalues: u5 (ref), u4 (copy)
    if u5 == p86 then
        warn("LastInputType Change listener called with current type.");
    end;

    u5 = p86;

    if u5 == Enum.UserInputType.Touch then
        local v87, v88 = p85:SelectTouchModule();

        if v88 then
            while not p85.touchControlFrame do
                wait();
            end;

            p85:SwitchToController(v87);
        end;
    elseif u4[u5] ~= nil then
        local v89 = p85:SelectComputerMovementModule();

        if v89 then
            p85:SwitchToController(v89);
        end;
    end;

    p85:UpdateTouchGuiVisibility();
end;

function u1.OnComputerMovementModeChange(p90) -- Line: 868
    local v91, v92 = p90:SelectComputerMovementModule();

    if v92 then
        p90:SwitchToController(v91);
    end;
end;

function u1.OnTouchMovementModeChange(p93) -- Line: 876
    local v94, v95 = p93:SelectTouchModule();

    if v95 then
        while not p93.touchControlFrame do
            wait();
        end;

        p93:SwitchToController(v94);
    end;
end;

function u1.CreateTouchGuiContainer(p96) -- Line: 886
    -- upvalues: UserFlag (copy), u2 (ref)
    if UserFlag and not p96.playerGui then
        return;
    end;

    if p96.touchGui then
        p96.touchGui:Destroy();
    end;

    p96.touchGui = Instance.new("ScreenGui");
    p96.touchGui.Name = "TouchGui";
    p96.touchGui.ResetOnSpawn = false;
    p96.touchGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;

    if not UserFlag then
        p96:UpdateTouchGuiVisibility();
    end;

    if u2 then
        p96.touchGui.ClipToDeviceSafeArea = false;
    end;

    p96.touchControlFrame = Instance.new("Frame");
    p96.touchControlFrame.Name = "TouchControlFrame";
    p96.touchControlFrame.Size = UDim2.new(1, 0, 1, 0);
    p96.touchControlFrame.BackgroundTransparency = 1;
    p96.touchControlFrame.Parent = p96.touchGui;
    p96.touchGui.Parent = p96.playerGui;
end;

function u1.GetClickToMoveController(p97) -- Line: 917
    -- upvalues: ClickToMoveController (copy), Value (copy)
    if not p97.controllers[ClickToMoveController] then
        p97.controllers[ClickToMoveController] = ClickToMoveController.new(Value);
    end;

    return p97.controllers[ClickToMoveController];
end;

return u1.new();
-- ============================================================
-- SCRIPT: BaseCamera
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerScripts.PlayerModule.CameraModule.BaseCamera
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");
local UserInputService = game:GetService("UserInputService");
local VRService = game:GetService("VRService");
local UserGameSettings = UserSettings():GetService("UserGameSettings");
local CommonUtils = script.Parent.Parent:WaitForChild("CommonUtils");
local ConnectionUtil = require(CommonUtils:WaitForChild("ConnectionUtil"));
local FlagUtil = require(CommonUtils:WaitForChild("FlagUtil"));
local CameraUtils = require(script.Parent:WaitForChild("CameraUtils"));
local ZoomController = require(script.Parent:WaitForChild("ZoomController"));
local CameraToggleStateController = require(script.Parent:WaitForChild("CameraToggleStateController"));
local CameraInput = require(script.Parent:WaitForChild("CameraInput"));
local CameraUI = require(script.Parent:WaitForChild("CameraUI"));
local LocalPlayer = Players.LocalPlayer;
local success, result = pcall(function() -- Line: 24
    return UserSettings():IsUserFeatureEnabled("UserFixGamepadMaxZoom");
end);
local u1 = success and result;
local UserFlag = FlagUtil.getUserFlag("UserPSRemoveTouchEnabled");
Vector2.new(0, 0);
local u2 = {};
u2.__index = u2;

function u2.new() -- Line: 80
    -- upvalues: u2 (copy), ConnectionUtil (copy), LocalPlayer (copy), UserFlag (copy), UserGameSettings (copy)
    local v3 = setmetatable({}, u2);
    v3._connections = ConnectionUtil.new();
    v3.gamepadZoomLevels = { 0, 10, 20 };
    v3.FIRST_PERSON_DISTANCE_THRESHOLD = 1;
    v3.cameraType = nil;
    v3.cameraMovementMode = nil;
    v3.lastCameraTransform = nil;
    v3.lastUserPanCamera = tick();
    v3.humanoidRootPart = nil;
    v3.humanoidCache = {};
    v3.lastSubject = nil;
    v3.lastSubjectPosition = Vector3.new(0, 5, 0);
    v3.lastSubjectCFrame = CFrame.new(v3.lastSubjectPosition);
    v3.currentSubjectDistance = math.clamp(12.5, LocalPlayer.CameraMinZoomDistance, LocalPlayer.CameraMaxZoomDistance);
    v3.inFirstPerson = false;
    v3.inMouseLockedMode = false;

    if not UserFlag then
        v3.portraitMode = false;
        v3.isSmallTouchScreen = false;
    end;

    v3.resetCameraAngle = true;
    v3.enabled = false;
    v3.cameraChangedConn = nil;

    if not UserFlag then
        v3.viewportSizeChangedConn = nil;
    end;

    v3.shouldUseVRRotation = false;
    v3.VRRotationIntensityAvailable = false;
    v3.lastVRRotationIntensityCheckTime = 0;
    v3.lastVRRotationTime = 0;
    v3.vrRotateKeyCooldown = {};
    v3.cameraTranslationConstraints = Vector3.new(1, 1, 1);
    v3.humanoidJumpOrigin = nil;
    v3.trackingHumanoid = nil;
    v3.cameraFrozen = false;
    v3.subjectStateChangedConn = nil;
    v3.gamepadZoomPressConnection = nil;
    v3.mouseLockOffset = Vector3.new(0, 0, 0);
    UserGameSettings:SetCameraYInvertVisible();
    UserGameSettings:SetGamepadCameraSensitivityVisible();

    return v3;
end;

function u2.GetModuleName(p4) -- Line: 147
    return "BaseCamera";
end;

function u2._setUpConfigurations(u5) -- Line: 151
    -- upvalues: LocalPlayer (copy)
    u5._connections:trackConnection("CHARACTER_ADDED", LocalPlayer.CharacterAdded:Connect(function(p6) -- Line: 152
        -- upvalues: u5 (copy)
        u5:OnCharacterAdded(p6);
    end));
    u5.humanoidRootPart = nil;
    u5._connections:trackConnection("CAMERA_MODE_CHANGED", LocalPlayer:GetPropertyChangedSignal("CameraMode"):Connect(function() -- Line: 157
        -- upvalues: u5 (copy)
        u5:OnPlayerCameraPropertyChange();
    end));
    u5._connections:trackConnection("CAMERA_MIN_DISTANCE_CHANGED", LocalPlayer:GetPropertyChangedSignal("CameraMinZoomDistance"):Connect(function() -- Line: 160
        -- upvalues: u5 (copy)
        u5:OnPlayerCameraPropertyChange();
    end));
    u5._connections:trackConnection("CAMERA_MAX_DISTANCE_CHANGED", LocalPlayer:GetPropertyChangedSignal("CameraMaxZoomDistance"):Connect(function() -- Line: 163
        -- upvalues: u5 (copy)
        u5:OnPlayerCameraPropertyChange();
    end));
    u5:OnPlayerCameraPropertyChange();
end;

function u2.OnCharacterAdded(p7, p8) -- Line: 169
    p7.resetCameraAngle = p7.resetCameraAngle or p7:GetEnabled();
    p7.humanoidRootPart = nil;
end;

function u2.GetHumanoidRootPart(p9) -- Line: 176
    -- upvalues: LocalPlayer (copy)
    local v10 = (not p9.humanoidRootPart and LocalPlayer.Character and true or false) and LocalPlayer.Character:FindFirstChildOfClass("Humanoid");

    if v10 then
        p9.humanoidRootPart = v10.RootPart;
    end;

    return p9.humanoidRootPart;
end;

function u2.GetBodyPartToFollow(p11: table, p12: userdata, p13: boolean) -- Line: 188
    if p12:GetState() == Enum.HumanoidStateType.Dead then
        local Parent = p12.Parent;

        if Parent and Parent:IsA("Model") then
            return Parent:FindFirstChild("Head") or p12.RootPart;
        end;
    end;

    return p12.RootPart;
end;

function u2.GetSubjectCFrame(p14) -- Line: 200
    local lastSubjectCFrame = p14.lastSubjectCFrame;
    local workspace_CurrentCamera = workspace.CurrentCamera;

    if workspace_CurrentCamera then
        workspace_CurrentCamera = workspace_CurrentCamera.CameraSubject;
    end;

    if not workspace_CurrentCamera then
        return lastSubjectCFrame;
    end;

    if workspace_CurrentCamera:IsA("Humanoid") then
        local v15 = workspace_CurrentCamera:GetState() == Enum.HumanoidStateType.Dead;
        local CameraOffset = workspace_CurrentCamera.CameraOffset;

        if p14:GetIsMouseLocked() then
            CameraOffset = Vector3.new();
        end;

        local RootPart = workspace_CurrentCamera.RootPart;

        if v15 and (workspace_CurrentCamera.Parent and workspace_CurrentCamera.Parent:IsA("Model")) then
            RootPart = workspace_CurrentCamera.Parent:FindFirstChild("Head") or RootPart;
        end;

        if RootPart and RootPart:IsA("BasePart") then
            local v16;

            if workspace_CurrentCamera.RigType == Enum.HumanoidRigType.R15 then
                if workspace_CurrentCamera.AutomaticScalingEnabled then
                    v16 = Vector3.new(0, 1.5, 0);
                    local RootPart2 = workspace_CurrentCamera.RootPart;

                    if RootPart == RootPart2 then
                        v16 = v16 + Vector3.new(0, (RootPart2.Size.Y - 2) / 2, 0);
                    end;
                else
                    v16 = Vector3.new(0, 2, 0);
                end;
            else
                v16 = Vector3.new(0, 1.5, 0);
            end;

            lastSubjectCFrame = RootPart.CFrame * CFrame.new((v15 and Vector3.new(0, 0, 0) or v16) + CameraOffset);
        end;
    elseif workspace_CurrentCamera:IsA("BasePart") then
        lastSubjectCFrame = workspace_CurrentCamera.CFrame;
    elseif workspace_CurrentCamera:IsA("Model") then
        if workspace_CurrentCamera.PrimaryPart then
            lastSubjectCFrame = workspace_CurrentCamera:GetPrimaryPartCFrame();
        else
            lastSubjectCFrame = CFrame.new();
        end;
    end;

    if lastSubjectCFrame then
        p14.lastSubjectCFrame = lastSubjectCFrame;
    end;

    return lastSubjectCFrame;
end;

function u2.GetSubjectVelocity(p17) -- Line: 274
    local workspace_CurrentCamera = workspace.CurrentCamera;

    if workspace_CurrentCamera then
        workspace_CurrentCamera = workspace_CurrentCamera.CameraSubject;
    end;

    if not workspace_CurrentCamera then
        return Vector3.new(0, 0, 0);
    end;

    if workspace_CurrentCamera:IsA("BasePart") then
        return workspace_CurrentCamera.Velocity;
    end;

    if workspace_CurrentCamera:IsA("Humanoid") then
        local RootPart = workspace_CurrentCamera.RootPart;

        if RootPart then
            return RootPart.Velocity;
        end;
    else
        local v18 = workspace_CurrentCamera:IsA("Model") and workspace_CurrentCamera.PrimaryPart;

        if v18 then
            return v18.Velocity;
        end;
    end;

    return Vector3.new(0, 0, 0);
end;

function u2.GetSubjectRotVelocity(p19) -- Line: 303
    local workspace_CurrentCamera = workspace.CurrentCamera;

    if workspace_CurrentCamera then
        workspace_CurrentCamera = workspace_CurrentCamera.CameraSubject;
    end;

    if not workspace_CurrentCamera then
        return Vector3.new(0, 0, 0);
    end;

    if workspace_CurrentCamera:IsA("BasePart") then
        return workspace_CurrentCamera.RotVelocity;
    end;

    if workspace_CurrentCamera:IsA("Humanoid") then
        local RootPart = workspace_CurrentCamera.RootPart;

        if RootPart then
            return RootPart.RotVelocity;
        end;
    else
        local v20 = workspace_CurrentCamera:IsA("Model") and workspace_CurrentCamera.PrimaryPart;

        if v20 then
            return v20.RotVelocity;
        end;
    end;

    return Vector3.new(0, 0, 0);
end;

function u2.StepZoom(p21) -- Line: 332
    -- upvalues: CameraInput (copy), ZoomController (copy)
    local currentSubjectDistance = p21.currentSubjectDistance;
    local ZoomDelta = CameraInput.getZoomDelta();

    if math.abs(ZoomDelta) > 0 then
        local v22;

        if ZoomDelta > 0 then
            v22 = math.max(currentSubjectDistance + ZoomDelta * (currentSubjectDistance * 0.5 + 1), p21.FIRST_PERSON_DISTANCE_THRESHOLD);
        else
            v22 = math.max((currentSubjectDistance + ZoomDelta) / (1 - ZoomDelta * 0.5), 0.5);
        end;

        p21:SetCameraToSubjectDistance(v22 < p21.FIRST_PERSON_DISTANCE_THRESHOLD and 0.5 or v22);
    end;

    return ZoomController.GetZoomRadius();
end;

function u2.GetSubjectPosition(p23) -- Line: 357
    local lastSubjectPosition = p23.lastSubjectPosition;
    local CurrentCamera = game.Workspace.CurrentCamera;

    if CurrentCamera then
        CurrentCamera = CurrentCamera.CameraSubject;
    end;

    if not CurrentCamera then
        return nil;
    end;

    if CurrentCamera:IsA("Humanoid") then
        local v24 = CurrentCamera:GetState() == Enum.HumanoidStateType.Dead;
        local CameraOffset = CurrentCamera.CameraOffset;

        if p23:GetIsMouseLocked() then
            CameraOffset = Vector3.new();
        end;

        local RootPart = CurrentCamera.RootPart;

        if v24 and (CurrentCamera.Parent and CurrentCamera.Parent:IsA("Model")) then
            RootPart = CurrentCamera.Parent:FindFirstChild("Head") or RootPart;
        end;

        if RootPart and RootPart:IsA("BasePart") then
            local v25;

            if CurrentCamera.RigType == Enum.HumanoidRigType.R15 then
                if CurrentCamera.AutomaticScalingEnabled then
                    v25 = Vector3.new(0, 1.5, 0);

                    if RootPart == CurrentCamera.RootPart then
                        v25 = v25 + Vector3.new(0, CurrentCamera.RootPart.Size.Y / 2 - 1, 0);
                    end;
                else
                    v25 = Vector3.new(0, 2, 0);
                end;
            else
                v25 = Vector3.new(0, 1.5, 0);
            end;

            lastSubjectPosition = RootPart.CFrame.p + RootPart.CFrame:vectorToWorldSpace((v24 and Vector3.new(0, 0, 0) or v25) + CameraOffset);
        end;
    elseif CurrentCamera:IsA("VehicleSeat") then
        lastSubjectPosition = CurrentCamera.CFrame.p + CurrentCamera.CFrame:vectorToWorldSpace(Vector3.new(0, 5, 0));
    elseif CurrentCamera:IsA("SkateboardPlatform") then
        lastSubjectPosition = CurrentCamera.CFrame.p + Vector3.new(0, 5, 0);
    elseif CurrentCamera:IsA("BasePart") then
        lastSubjectPosition = CurrentCamera.CFrame.p;
    elseif CurrentCamera:IsA("Model") then
        if CurrentCamera.PrimaryPart then
            lastSubjectPosition = CurrentCamera:GetPrimaryPartCFrame().p;
        else
            lastSubjectPosition = CurrentCamera:GetModelCFrame().p;
        end;
    end;

    p23.lastSubject = CurrentCamera;
    p23.lastSubjectPosition = lastSubjectPosition;

    return lastSubjectPosition;
end;

if not UserFlag then
    function u2.OnViewportSizeChanged(p26) -- Line: 435
        -- upvalues: UserInputService (copy)
        local ViewportSize = game.Workspace.CurrentCamera.ViewportSize;
        p26.portraitMode = ViewportSize.X < ViewportSize.Y;
        p26.isSmallTouchScreen = UserInputService.TouchEnabled and (ViewportSize.Y < 500 and true or ViewportSize.X < 700);
    end;
end;

function u2.OnCurrentCameraChanged(u27) -- Line: 444
    -- upvalues: UserFlag (copy), UserInputService (copy)
    if not UserFlag and UserInputService.TouchEnabled then
        if u27.viewportSizeChangedConn then
            u27.viewportSizeChangedConn:Disconnect();
            u27.viewportSizeChangedConn = nil;
        end;

        local CurrentCamera = game.Workspace.CurrentCamera;

        if CurrentCamera then
            u27:OnViewportSizeChanged();
            u27.viewportSizeChangedConn = CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() -- Line: 456
                -- upvalues: u27 (copy)
                u27:OnViewportSizeChanged();
            end);
        end;
    end;

    if u27.cameraSubjectChangedConn then
        u27.cameraSubjectChangedConn:Disconnect();
        u27.cameraSubjectChangedConn = nil;
    end;

    local CurrentCamera = game.Workspace.CurrentCamera;

    if CurrentCamera then
        u27.cameraSubjectChangedConn = CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(function() -- Line: 471
            -- upvalues: u27 (copy)
            u27:OnNewCameraSubject();
        end);
        u27:OnNewCameraSubject();
    end;
end;

function u2.OnPlayerCameraPropertyChange(p28) -- Line: 478
    p28:SetCameraToSubjectDistance(p28.currentSubjectDistance);
end;

function u2.InputTranslationToCameraAngleChange(p29, p30, p31) -- Line: 483
    return p30 * p31;
end;

function u2.GamepadZoomPress(p32) -- Line: 489
    -- upvalues: LocalPlayer (copy), u1 (ref)
    local CameraToSubjectDistance = p32:GetCameraToSubjectDistance();
    local CameraMaxZoomDistance = LocalPlayer.CameraMaxZoomDistance;

    for i = #p32.gamepadZoomLevels, 1, -1 do
        local v33 = p32.gamepadZoomLevels[i];
        local v34;

        if CameraMaxZoomDistance < v33 then
            v34 = i;
        else
            if v33 < LocalPlayer.CameraMinZoomDistance then
                v33 = LocalPlayer.CameraMinZoomDistance;

                if u1 and CameraMaxZoomDistance == v33 then
                    break;
                end;
            end;

            if not u1 and CameraMaxZoomDistance == v33 then
                break;
            end;

            if v33 + (CameraMaxZoomDistance - v33) / 2 < CameraToSubjectDistance then
                p32:SetCameraToSubjectDistance(v33);

                return;
            end;

            CameraMaxZoomDistance = v33;
            v34 = i;
        end;
    end;

    p32:SetCameraToSubjectDistance(p32.gamepadZoomLevels[#p32.gamepadZoomLevels]);
end;

function u2.Enable(p35: table, p36: boolean) -- Line: 534
    if p35.enabled ~= p36 then
        p35.enabled = p36;
        p35:OnEnabledChanged();
    end;
end;

function u2.OnEnabledChanged(u37) -- Line: 542
    -- upvalues: CameraInput (copy), LocalPlayer (copy)
    if not u37.enabled then
        u37._connections:disconnectAll();
        CameraInput.setInputEnabled(false);

        if u37.gamepadZoomPressConnection then
            u37.gamepadZoomPressConnection:Disconnect();
            u37.gamepadZoomPressConnection = nil;
        end;

        u37:Cleanup();

        return;
    end;

    u37:_setUpConfigurations();
    CameraInput.setInputEnabled(true);
    u37.gamepadZoomPressConnection = CameraInput.gamepadZoomPress:Connect(function() -- Line: 548
        -- upvalues: u37 (copy)
        u37:GamepadZoomPress();
    end);

    if LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
        u37.currentSubjectDistance = 0.5;

        if not u37.inFirstPerson then
            u37:EnterFirstPerson();
        end;
    end;

    if u37.cameraChangedConn then
        u37.cameraChangedConn:Disconnect();
        u37.cameraChangedConn = nil;
    end;

    u37.cameraChangedConn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() -- Line: 560
        -- upvalues: u37 (copy)
        u37:OnCurrentCameraChanged();
    end);
    u37:OnCurrentCameraChanged();
end;

function u2.GetEnabled(p38) -- Line: 578
    return p38.enabled;
end;

function u2.Cleanup(p39) -- Line: 582
    -- upvalues: UserFlag (copy), CameraUtils (copy)
    if p39.subjectStateChangedConn then
        p39.subjectStateChangedConn:Disconnect();
        p39.subjectStateChangedConn = nil;
    end;

    if not UserFlag and p39.viewportSizeChangedConn then
        p39.viewportSizeChangedConn:Disconnect();
        p39.viewportSizeChangedConn = nil;
    end;

    if p39.cameraChangedConn then
        p39.cameraChangedConn:Disconnect();
        p39.cameraChangedConn = nil;
    end;

    p39.lastCameraTransform = nil;
    p39.lastSubjectCFrame = nil;
    CameraUtils.restoreMouseBehavior();
end;

function u2.UpdateMouseBehavior(p40) -- Line: 605
    -- upvalues: UserGameSettings (copy), CameraUI (copy), CameraInput (copy), CameraToggleStateController (copy), CameraUtils (copy)
    if p40.isCameraToggle and UserGameSettings.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove == false then
        CameraUI.setCameraModeToastEnabled(true);
        CameraInput.enableCameraToggleInput();
        CameraToggleStateController(p40.inFirstPerson);

        return;
    end;

    CameraUI.setCameraModeToastEnabled(false);
    CameraInput.disableCameraToggleInput();

    if p40.inFirstPerson or p40.inMouseLockedMode then
        CameraUtils.setRotationTypeOverride(Enum.RotationType.CameraRelative);
        CameraUtils.setMouseBehaviorOverride(Enum.MouseBehavior.LockCenter);

        return;
    end;

    CameraUtils.restoreRotationType();

    if CameraInput.getRotationActivated() then
        CameraUtils.setMouseBehaviorOverride(Enum.MouseBehavior.LockCurrentPosition);

        return;
    end;

    CameraUtils.restoreMouseBehavior();
end;

function u2.UpdateForDistancePropertyChange(p41) -- Line: 633
    p41:SetCameraToSubjectDistance(p41.currentSubjectDistance);
end;

function u2.SetCameraToSubjectDistance(p42: table, p43: number) -- Line: 639
    -- upvalues: LocalPlayer (copy), ZoomController (copy)
    local currentSubjectDistance = p42.currentSubjectDistance;

    if LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
        p42.currentSubjectDistance = 0.5;

        if not p42.inFirstPerson then
            p42:EnterFirstPerson();
        end;
    else
        local math_clamp_ret = math.clamp(p43, LocalPlayer.CameraMinZoomDistance, LocalPlayer.CameraMaxZoomDistance);

        if math_clamp_ret < 1 then
            p42.currentSubjectDistance = 0.5;

            if not p42.inFirstPerson then
                p42:EnterFirstPerson();
            end;
        else
            p42.currentSubjectDistance = math_clamp_ret;

            if p42.inFirstPerson then
                p42:LeaveFirstPerson();
            end;
        end;
    end;

    ZoomController.SetZoomParameters(p42.currentSubjectDistance, (math.sign(p43 - currentSubjectDistance)));

    return p42.currentSubjectDistance;
end;

function u2.SetCameraType(p44, p45) -- Line: 673
    p44.cameraType = p45;
end;

function u2.GetCameraType(p46) -- Line: 678
    return p46.cameraType;
end;

function u2.SetCameraMovementMode(p47, p48) -- Line: 683
    p47.cameraMovementMode = p48;
end;

function u2.GetCameraMovementMode(p49) -- Line: 687
    return p49.cameraMovementMode;
end;

function u2.SetIsMouseLocked(p50: table, p51: boolean) -- Line: 691
    p50.inMouseLockedMode = p51;
end;

function u2.GetIsMouseLocked(p52) -- Line: 695
    return p52.inMouseLockedMode;
end;

function u2.SetMouseLockOffset(p53, p54) -- Line: 699
    p53.mouseLockOffset = p54;
end;

function u2.GetMouseLockOffset(p55) -- Line: 703
    return p55.mouseLockOffset;
end;

function u2.InFirstPerson(p56) -- Line: 707
    return p56.inFirstPerson;
end;

function u2.EnterFirstPerson(p57) -- Line: 711
    if _G.DoBodyGyroFunc then
        _G.DoBodyGyroFunc(true);
    end;

    p57.inFirstPerson = true;
    p57:UpdateMouseBehavior();
end;

function u2.LeaveFirstPerson(p58) -- Line: 719
    p58.inFirstPerson = false;
    p58:UpdateMouseBehavior();
end;

function u2.GetCameraToSubjectDistance(p59) -- Line: 725
    return p59.currentSubjectDistance;
end;

function u2.GetMeasuredDistanceToFocus(p60) -- Line: 732
    local CurrentCamera = game.Workspace.CurrentCamera;

    if CurrentCamera then
        return (CurrentCamera.CoordinateFrame.p - CurrentCamera.Focus.p).magnitude;
    end;

    return nil;
end;

function u2.GetCameraLookVector(p61) -- Line: 740
    return game.Workspace.CurrentCamera and game.Workspace.CurrentCamera.CFrame.LookVector or Vector3.new(0, 0, 1);
end;

function u2.CalculateNewLookCFrameFromArg(p62: table, p63: vector?, p64) -- Line: 744
    local v65 = p63 or p62:GetCameraLookVector();
    local math_asin_ret = math.asin(v65.Y);
    local math_clamp_ret = math.clamp(p64.Y, math_asin_ret + -1.3962634015954636, math_asin_ret + 1.3962634015954636);
    local Vector2_new_ret = Vector2.new(p64.X, math_clamp_ret);
    local CFrame_new_ret = CFrame.new(Vector3.new(0, 0, 0), v65);

    return CFrame.Angles(0, -Vector2_new_ret.X, 0) * CFrame_new_ret * CFrame.Angles(-Vector2_new_ret.Y, 0, 0);
end;

function u2.CalculateNewLookVectorFromArg(p66: table, p67: vector?, p68) -- Line: 754
    return p66:CalculateNewLookCFrameFromArg(p67, p68).LookVector;
end;

function u2.CalculateNewLookVectorVRFromArg(p69: table, p70) -- Line: 759
    local unit = ((p69:GetSubjectPosition() - game.Workspace.CurrentCamera.CFrame.p) * Vector3.new(1, 0, 1)).unit;
    local Vector2_new_ret = Vector2.new(p70.X, 0);
    local CFrame_new_ret = CFrame.new(Vector3.new(0, 0, 0), unit);

    return ((CFrame.Angles(0, -Vector2_new_ret.X, 0) * CFrame_new_ret * CFrame.Angles(-Vector2_new_ret.Y, 0, 0)).LookVector * Vector3.new(1, 0, 1)).unit;
end;

function u2.GetHumanoid(p71) -- Line: 769
    -- upvalues: LocalPlayer (copy)
    local v72 = LocalPlayer and LocalPlayer.Character;

    if not v72 then
        return nil;
    end;

    local v73 = p71.humanoidCache[LocalPlayer];

    if v73 and v73.Parent == v72 then
        return v73;
    end;

    p71.humanoidCache[LocalPlayer] = nil;
    local v74 = v72:FindFirstChildOfClass("Humanoid");

    if v74 then
        p71.humanoidCache[LocalPlayer] = v74;
    end;

    return v74;
end;

function u2.GetHumanoidPartToFollow(p75: table, p76: userdata, p77: any) -- Line: 787
    if p77 ~= Enum.HumanoidStateType.Dead then
        return p76.Torso;
    end;

    local Parent = p76.Parent;

    if Parent then
        return Parent:FindFirstChild("Head") or p76.Torso;
    end;

    return p76.Torso;
end;

function u2.OnNewCameraSubject(p78) -- Line: 801
    if p78.subjectStateChangedConn then
        p78.subjectStateChangedConn:Disconnect();
        p78.subjectStateChangedConn = nil;
    end;
end;

function u2.IsInFirstPerson(p79) -- Line: 808
    return p79.inFirstPerson;
end;

function u2.Update(p80, p81) -- Line: 812
    error("BaseCamera:Update() This is a virtual function that should never be getting called.", 2);
end;

function u2.GetCameraHeight(p82) -- Line: 816
    -- upvalues: VRService (copy)
    return (not VRService.VREnabled or p82.inFirstPerson) and 0 or 0.25881904510252074 * p82.currentSubjectDistance;
end;

return u2;
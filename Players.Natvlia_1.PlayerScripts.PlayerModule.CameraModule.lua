-- ============================================================
-- SCRIPT: CameraModule
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerScripts.PlayerModule.CameraModule
-- ============================================================

-- Decompiled with Potassium's decompiler.

local u1 = {};
u1.__index = u1;
local u2 = { "CameraMinZoomDistance", "CameraMaxZoomDistance", "CameraMode", "DevCameraOcclusionMode", "DevComputerCameraMode", "DevTouchCameraMode", "DevComputerMovementMode", "DevTouchMovementMode", "DevEnableMouseLock" };
local u3 = { "ComputerCameraMovementMode", "ComputerMovementMode", "ControlMode", "GamepadCameraSensitivity", "MouseSensitivity", "RotationType", "TouchCameraMovementMode", "TouchMovementMode" };
local Players = game:GetService("Players");
local RunService = game:GetService("RunService");
local UserInputService = game:GetService("UserInputService");
local VRService = game:GetService("VRService");
local UserGameSettings = UserSettings():GetService("UserGameSettings");
local CommonUtils = script.Parent:WaitForChild("CommonUtils");
local ConnectionUtil = require(CommonUtils:WaitForChild("ConnectionUtil"));
local FlagUtil = require(CommonUtils:WaitForChild("FlagUtil"));
local CameraUtils = require(script:WaitForChild("CameraUtils"));
local CameraInput = require(script:WaitForChild("CameraInput"));
local ClassicCamera = require(script:WaitForChild("ClassicCamera"));
local OrbitalCamera = require(script:WaitForChild("OrbitalCamera"));
local LegacyCamera = require(script:WaitForChild("LegacyCamera"));
local VehicleCamera = require(script:WaitForChild("VehicleCamera"));
local VRCamera = require(script:WaitForChild("VRCamera"));
local VRVehicleCamera = require(script:WaitForChild("VRVehicleCamera"));
local Invisicam = require(script:WaitForChild("Invisicam"));
local Poppercam = require(script:WaitForChild("Poppercam"));
local TransparencyController = require(script:WaitForChild("TransparencyController"));
local MouseLockController = require(script:WaitForChild("MouseLockController"));
local u4 = {};
local u5 = {};

if not Players.LocalPlayer then
    return {};
end;

assert(Players.LocalPlayer, "Strict typing check");
local PlayerScripts = Players.LocalPlayer:WaitForChild("PlayerScripts");
PlayerScripts:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Default);
PlayerScripts:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Follow);
PlayerScripts:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Classic);
PlayerScripts:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Default);
PlayerScripts:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Follow);
PlayerScripts:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Classic);
local UserFlag = FlagUtil.getUserFlag("UserRespectLegacyCameraOptions");
local UserFlag2 = FlagUtil.getUserFlag("UserPlayerConnectionMemoryLeak");
local UserFlag3 = FlagUtil.getUserFlag("UserPreferredInputPlayerScripts2");
local UserFlag4 = FlagUtil.getUserFlag("UserPSFixCameraControllerReset");

function u1.new() -- Line: 146
    -- upvalues: TransparencyController (copy), UserFlag2 (copy), ConnectionUtil (copy), u1 (copy), Players (copy), UserInputService (copy), UserFlag3 (copy), MouseLockController (copy), UserFlag (copy), RunService (copy), u2 (copy), u3 (copy), UserGameSettings (copy)
    local v6 = {
        activeTransparencyController = TransparencyController.new()
    };
    local v7;

    if UserFlag2 then
        v7 = ConnectionUtil.new();
    else
        v7 = nil;
    end;

    v6.connectionUtil = v7;
    local u8 = setmetatable(v6, u1);
    u8.activeCameraController = nil;
    u8.activeOcclusionModule = nil;
    u8.activeMouseLockController = nil;
    u8.currentComputerCameraMovementMode = nil;
    u8.cameraSubjectChangedConn = nil;
    u8.cameraTypeChangedConn = nil;

    for _, v in pairs(Players:GetPlayers()) do
        u8:OnPlayerAdded(v);
    end;

    Players.PlayerAdded:Connect(function(p9) -- Line: 169
        -- upvalues: u8 (copy)
        u8:OnPlayerAdded(p9);
    end);

    if UserFlag2 then
        Players.PlayerRemoving:Connect(function(p10) -- Line: 174
            -- upvalues: u8 (copy)
            u8:OnPlayerRemoving(p10);
        end);
    end;

    u8.activeTransparencyController:Enable(true);

    if not UserInputService.TouchEnabled or UserFlag3 then
        u8.activeMouseLockController = MouseLockController.new();
        assert(u8.activeMouseLockController, "Strict typing check");
        local BindableToggleEvent = u8.activeMouseLockController:GetBindableToggleEvent();

        if BindableToggleEvent then
            BindableToggleEvent:Connect(function() -- Line: 187
                -- upvalues: u8 (copy)
                u8:OnMouseLockToggled();
            end);
        end;
    end;

    if UserFlag then
        u8:ActivateCameraController();
    else
        u8:ActivateCameraController(u8:GetCameraControlChoice());
    end;

    u8:ActivateOcclusionModule(Players.LocalPlayer.DevCameraOcclusionMode);
    u8:OnCurrentCameraChanged();
    RunService:BindToRenderStep("cameraRenderUpdate", Enum.RenderPriority.Camera.Value, function(p11) -- Line: 200
        -- upvalues: u8 (copy)
        u8:Update(p11);
    end);

    for _, v in pairs(u2) do
        Players.LocalPlayer:GetPropertyChangedSignal(v):Connect(function() -- Line: 204
            -- upvalues: u8 (copy), v (copy)
            u8:OnLocalPlayerCameraPropertyChanged(v);
        end);
    end;

    for _, v in pairs(u3) do
        UserGameSettings:GetPropertyChangedSignal(v):Connect(function() -- Line: 210
            -- upvalues: u8 (copy), v (copy)
            u8:OnUserGameSettingsPropertyChanged(v);
        end);
    end;

    game.Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() -- Line: 214
        -- upvalues: u8 (copy)
        u8:OnCurrentCameraChanged();
    end);

    if UserFlag3 then
        UserInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function() -- Line: 218
            -- upvalues: u8 (copy)
            u8:OnPreferredInputChanged();
        end);
    end;

    return u8;
end;

function u1.GetCameraMovementModeFromSettings(p12) -- Line: 226
    -- upvalues: Players (copy), CameraUtils (copy), UserFlag3 (copy), UserInputService (copy), UserGameSettings (copy)
    if Players.LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
        return CameraUtils.ConvertCameraModeEnumToStandard(Enum.ComputerCameraMovementMode.Classic);
    end;

    local v13;

    if UserFlag3 then
        v13 = UserInputService.PreferredInput == Enum.PreferredInput.Touch;
    else
        v13 = UserInputService.TouchEnabled;
    end;

    local v14, v15;

    if v13 then
        v14 = CameraUtils.ConvertCameraModeEnumToStandard(Players.LocalPlayer.DevTouchCameraMode);
        v15 = CameraUtils.ConvertCameraModeEnumToStandard(UserGameSettings.TouchCameraMovementMode);
    else
        v14 = CameraUtils.ConvertCameraModeEnumToStandard(Players.LocalPlayer.DevComputerCameraMode);
        v15 = CameraUtils.ConvertCameraModeEnumToStandard(UserGameSettings.ComputerCameraMovementMode);
    end;

    if v14 == Enum.DevComputerCameraMovementMode.UserChoice then
        return v15;
    end;

    return v14;
end;

function u1.ActivateOcclusionModule(p16, p17) -- Line: 256
    -- upvalues: Poppercam (copy), Invisicam (copy), u5 (copy), Players (copy)
    local v18;

    if p17 == Enum.DevCameraOcclusionMode.Zoom then
        v18 = Poppercam;
    else
        if p17 ~= Enum.DevCameraOcclusionMode.Invisicam then
            warn("CameraScript ActivateOcclusionModule called with unsupported mode");

            return;
        end;

        v18 = Invisicam;
    end;

    p16.occlusionMode = p17;

    if p16.activeOcclusionModule and p16.activeOcclusionModule:GetOcclusionMode() == p17 then
        if not p16.activeOcclusionModule:GetEnabled() then
            p16.activeOcclusionModule:Enable(true);
        end;

        return;
    end;

    local activeOcclusionModule = p16.activeOcclusionModule;
    p16.activeOcclusionModule = u5[v18];

    if not p16.activeOcclusionModule then
        p16.activeOcclusionModule = v18.new();

        if p16.activeOcclusionModule then
            u5[v18] = p16.activeOcclusionModule;
        end;
    end;

    if p16.activeOcclusionModule then
        if p16.activeOcclusionModule:GetOcclusionMode() ~= p17 then
            warn("CameraScript ActivateOcclusionModule mismatch: ", p16.activeOcclusionModule:GetOcclusionMode(), "~=", p17);
        end;

        if activeOcclusionModule then
            if activeOcclusionModule == p16.activeOcclusionModule then
                warn("CameraScript ActivateOcclusionModule failure to detect already running correct module");
            else
                activeOcclusionModule:Enable(false);
            end;
        end;

        if p17 == Enum.DevCameraOcclusionMode.Invisicam then
            if Players.LocalPlayer.Character then
                p16.activeOcclusionModule:CharacterAdded(Players.LocalPlayer.Character, Players.LocalPlayer);
            end;
        else
            for _, v in pairs(Players:GetPlayers()) do
                if v and v.Character then
                    p16.activeOcclusionModule:CharacterAdded(v.Character, v);
                end;
            end;

            p16.activeOcclusionModule:OnCameraSubjectChanged(game.Workspace.CurrentCamera.CameraSubject);
        end;

        p16.activeOcclusionModule:Enable(true);
    end;
end;

function u1.ShouldUseVehicleCamera(p19) -- Line: 335
    local workspace_CurrentCamera = workspace.CurrentCamera;

    if not workspace_CurrentCamera then
        return false;
    end;

    local CameraType = workspace_CurrentCamera.CameraType;
    local CameraSubject = workspace_CurrentCamera.CameraSubject;
    local v20 = CameraType == Enum.CameraType.Custom and true or CameraType == Enum.CameraType.Follow;
    local v21 = CameraSubject and CameraSubject:IsA("VehicleSeat") or false;
    local v22 = p19.occlusionMode ~= Enum.DevCameraOcclusionMode.Invisicam;

    if v21 then
        if not v20 then
            v22 = v20;
        end;
    else
        v22 = v21;
    end;

    return v22;
end;

function u1.ActivateCameraController(p23, p24, p25) -- Line: 351
    -- upvalues: UserFlag (copy), LegacyCamera (copy), VRService (copy), VRCamera (copy), ClassicCamera (copy), OrbitalCamera (copy), VRVehicleCamera (copy), VehicleCamera (copy), u4 (copy), UserFlag4 (copy)
    if UserFlag then
        p25 = workspace.CurrentCamera.CameraType;
        p24 = p23:GetCameraMovementModeFromSettings();
    end;

    local v26 = nil;

    if UserFlag and true or p25 ~= nil then
        if p25 == Enum.CameraType.Scriptable then
            if p23.activeCameraController then
                p23.activeCameraController:Enable(false);
                p23.activeCameraController = nil;
            end;

            return;
        end;

        if p25 == Enum.CameraType.Custom then
            p24 = p23:GetCameraMovementModeFromSettings();
        elseif p25 == Enum.CameraType.Track then
            p24 = Enum.ComputerCameraMovementMode.Classic;
        elseif p25 == Enum.CameraType.Follow then
            p24 = Enum.ComputerCameraMovementMode.Follow;
        elseif p25 == Enum.CameraType.Orbital then
            p24 = Enum.ComputerCameraMovementMode.Orbital;
        elseif p25 == Enum.CameraType.Attach or (p25 == Enum.CameraType.Watch or p25 == Enum.CameraType.Fixed) then
            v26 = LegacyCamera;
        else
            warn("CameraScript encountered an unhandled Camera.CameraType value: ", p25);
        end;
    end;

    if p24 == Enum.ComputerCameraMovementMode.CameraToggle then
        p24 = Enum.ComputerCameraMovementMode.Classic;
    end;

    if not v26 then
        if VRService.VREnabled then
            v26 = VRCamera;
        elseif p24 == Enum.ComputerCameraMovementMode.Classic or (p24 == Enum.ComputerCameraMovementMode.Follow or (p24 == Enum.ComputerCameraMovementMode.Default or p24 == Enum.ComputerCameraMovementMode.CameraToggle)) then
            v26 = ClassicCamera;
        else
            if p24 ~= Enum.ComputerCameraMovementMode.Orbital then
                warn("ActivateCameraController did not select a module.");

                return;
            end;

            v26 = OrbitalCamera;
        end;
    end;

    if p23:ShouldUseVehicleCamera() then
        if VRService.VREnabled then
            v26 = VRVehicleCamera;
        else
            v26 = VehicleCamera;
        end;
    end;

    local v27;

    if u4[v26] then
        v27 = u4[v26];

        if UserFlag4 then
            if v27.Reset and p23.activeCameraController ~= v27 then
                v27:Reset();
            end;
        elseif v27.Reset then
            v27:Reset();
        end;
    else
        v27 = v26.new();
        u4[v26] = v27;
    end;

    if p23.activeCameraController then
        if p23.activeCameraController == v27 then
            if not p23.activeCameraController:GetEnabled() then
                p23.activeCameraController:Enable(true);
            end;
        else
            p23.activeCameraController:Enable(false);
            p23.activeCameraController = v27;
            p23.activeCameraController:Enable(true);
        end;
    elseif v27 ~= nil then
        p23.activeCameraController = v27;
        assert(p23.activeCameraController, "Strict typing check");
        p23.activeCameraController:Enable(true);
    end;

    if p23.activeCameraController then
        if UserFlag then
            p23.activeCameraController:SetCameraMovementMode(p24);
            p23.activeCameraController:SetCameraType(p25);
        elseif p24 == nil then
            if p25 ~= nil then
                p23.activeCameraController:SetCameraType(p25);
            end;
        else
            p23.activeCameraController:SetCameraMovementMode(p24);
        end;

        if p23.activeMouseLockController then
            p23.activeCameraController:SetIsMouseLocked(p23.activeMouseLockController:GetIsMouseLocked());
            p23.activeCameraController:SetMouseLockOffset(p23.activeMouseLockController:GetMouseLockOffset());
        end;
    end;
end;

function u1.OnCameraSubjectChanged(p28) -- Line: 481
    local workspace_CurrentCamera = workspace.CurrentCamera;
    local v29;

    if workspace_CurrentCamera then
        v29 = workspace_CurrentCamera.CameraSubject;
    else
        v29 = nil;
    end;

    if p28.activeTransparencyController then
        p28.activeTransparencyController:SetSubject(v29);
    end;

    if p28.activeOcclusionModule then
        p28.activeOcclusionModule:OnCameraSubjectChanged(v29);
    end;

    local v30;

    if workspace_CurrentCamera then
        v30 = workspace_CurrentCamera.CameraType;
    else
        v30 = nil;
    end;

    p28:ActivateCameraController(nil, v30);
end;

function u1.OnCameraTypeChanged(p31, p32) -- Line: 496
    -- upvalues: UserInputService (copy), CameraUtils (copy)
    if p32 == Enum.CameraType.Scriptable and UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter then
        CameraUtils.restoreMouseBehavior();
    end;

    p31:ActivateCameraController(nil, p32);
end;

function u1.OnCurrentCameraChanged(u33) -- Line: 508
    local CurrentCamera = game.Workspace.CurrentCamera;

    if not CurrentCamera then
        return;
    end;

    if u33.cameraSubjectChangedConn then
        u33.cameraSubjectChangedConn:Disconnect();
    end;

    if u33.cameraTypeChangedConn then
        u33.cameraTypeChangedConn:Disconnect();
    end;

    u33.cameraSubjectChangedConn = CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(function() -- Line: 520
        -- upvalues: u33 (copy)
        u33:OnCameraSubjectChanged();
    end);
    u33.cameraTypeChangedConn = CurrentCamera:GetPropertyChangedSignal("CameraType"):Connect(function() -- Line: 524
        -- upvalues: u33 (copy), CurrentCamera (copy)
        u33:OnCameraTypeChanged(CurrentCamera.CameraType);
    end);
    u33:OnCameraSubjectChanged();
    u33:OnCameraTypeChanged(CurrentCamera.CameraType);
end;

function u1.OnLocalPlayerCameraPropertyChanged(p34: table, p35: string) -- Line: 532
    -- upvalues: Players (copy), CameraUtils (copy)
    if p35 == "CameraMode" then
        if Players.LocalPlayer.CameraMode ~= Enum.CameraMode.LockFirstPerson then
            if Players.LocalPlayer.CameraMode ~= Enum.CameraMode.Classic then
                warn("Unhandled value for property player.CameraMode: ", Players.LocalPlayer.CameraMode);

                return;
            end;

            local CameraMovementModeFromSettings = p34:GetCameraMovementModeFromSettings();
            p34:ActivateCameraController(CameraUtils.ConvertCameraModeEnumToStandard(CameraMovementModeFromSettings));

            return;
        end;

        if not p34.activeCameraController or p34.activeCameraController:GetModuleName() ~= "ClassicCamera" then
            p34:ActivateCameraController(CameraUtils.ConvertCameraModeEnumToStandard(Enum.DevComputerCameraMovementMode.Classic));
        end;

        if p34.activeCameraController then
            p34.activeCameraController:UpdateForDistancePropertyChange();
        end;
    else
        if p35 == "DevComputerCameraMode" or p35 == "DevTouchCameraMode" then
            local CameraMovementModeFromSettings = p34:GetCameraMovementModeFromSettings();
            p34:ActivateCameraController(CameraUtils.ConvertCameraModeEnumToStandard(CameraMovementModeFromSettings));

            return;
        end;

        if p35 == "DevCameraOcclusionMode" then
            p34:ActivateOcclusionModule(Players.LocalPlayer.DevCameraOcclusionMode);

            return;
        end;

        if p35 == "CameraMinZoomDistance" or p35 == "CameraMaxZoomDistance" then
            if p34.activeCameraController then
                p34.activeCameraController:UpdateForDistancePropertyChange();
            end;
        else
            if p35 == "DevTouchMovementMode" then
                return;
            end;

            if p35 == "DevComputerMovementMode" then
                return;
            end;

            local _ = p35 == "DevEnableMouseLock";
        end;
    end;
end;

function u1.OnUserGameSettingsPropertyChanged(p36: table, p37: string) -- Line: 576
    -- upvalues: CameraUtils (copy)
    if p37 == "ComputerCameraMovementMode" then
        local CameraMovementModeFromSettings = p36:GetCameraMovementModeFromSettings();
        p36:ActivateCameraController(CameraUtils.ConvertCameraModeEnumToStandard(CameraMovementModeFromSettings));
    end;
end;

function u1.OnPreferredInputChanged(p38) -- Line: 583
    -- upvalues: CameraUtils (copy)
    local CameraMovementModeFromSettings = p38:GetCameraMovementModeFromSettings();
    p38:ActivateCameraController(CameraUtils.ConvertCameraModeEnumToStandard(CameraMovementModeFromSettings));
end;

function u1.Update(p39, p40) -- Line: 594
    -- upvalues: CameraInput (copy)
    if p39.activeCameraController then
        p39.activeCameraController:UpdateMouseBehavior();
        local v41, v42 = p39.activeCameraController:Update(p40);

        if p39.activeOcclusionModule then
            v41, v42 = p39.activeOcclusionModule:Update(p40, v41, v42);
        end;

        local CurrentCamera = game.Workspace.CurrentCamera;
        CurrentCamera.CFrame = v41;
        CurrentCamera.Focus = v42;

        if p39.activeTransparencyController then
            p39.activeTransparencyController:Update(p40);
        end;

        if CameraInput.getInputEnabled() then
            CameraInput.resetInputForFrameEnd();
        end;
    end;
end;

function u1.GetCameraControlChoice(p43) -- Line: 622
    -- upvalues: UserFlag (copy), UserInputService (copy), Players (copy), CameraUtils (copy), UserGameSettings (copy)
    assert(not UserFlag, "CameraModule:GetCameraControlChoice should not be called when FFlagUserRespectLegacyCameraOptions is enabled");

    if UserInputService:GetLastInputType() == Enum.UserInputType.Touch or UserInputService.TouchEnabled then
        if Players.LocalPlayer.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice then
            return CameraUtils.ConvertCameraModeEnumToStandard(UserGameSettings.TouchCameraMovementMode);
        end;

        return CameraUtils.ConvertCameraModeEnumToStandard(Players.LocalPlayer.DevTouchCameraMode);
    end;

    if Players.LocalPlayer.DevComputerCameraMode ~= Enum.DevComputerCameraMovementMode.UserChoice then
        return CameraUtils.ConvertCameraModeEnumToStandard(Players.LocalPlayer.DevComputerCameraMode);
    end;

    local v44 = CameraUtils.ConvertCameraModeEnumToStandard(UserGameSettings.ComputerCameraMovementMode);

    return CameraUtils.ConvertCameraModeEnumToStandard(v44);
end;

function u1.OnCharacterAdded(p45: table, p46: userdata, p47: userdata) -- Line: 642
    if p45.activeOcclusionModule then
        p45.activeOcclusionModule:CharacterAdded(p46, p47);
    end;
end;

function u1.OnCharacterRemoving(p48, p49, p50) -- Line: 648
    if p48.activeOcclusionModule then
        p48.activeOcclusionModule:CharacterRemoving(p49, p50);
    end;
end;

function u1.OnPlayerAdded(u51: table, u52: userdata) -- Line: 654
    -- upvalues: UserFlag2 (copy)
    if UserFlag2 then
        if u51.connectionUtil then
            u51.connectionUtil:trackConnection(`{u52.UserId}CharacterAdded`, u52.CharacterAdded:Connect(function(p53) -- Line: 658
                -- upvalues: u51 (copy), u52 (copy)
                u51:OnCharacterAdded(p53, u52);
            end));
            u51.connectionUtil:trackConnection(`{u52.UserId}CharacterRemoving`, u52.CharacterRemoving:Connect(function(p54) -- Line: 661
                -- upvalues: u51 (copy), u52 (copy)
                u51:OnCharacterRemoving(p54, u52);
            end));
        end;
    else
        u52.CharacterAdded:Connect(function(p55) -- Line: 666
            -- upvalues: u51 (copy), u52 (copy)
            u51:OnCharacterAdded(p55, u52);
        end);
        u52.CharacterRemoving:Connect(function(p56) -- Line: 669
            -- upvalues: u51 (copy), u52 (copy)
            u51:OnCharacterRemoving(p56, u52);
        end);
    end;
end;

function u1.OnPlayerRemoving(p57: table, p58: userdata) -- Line: 675
    if p57.connectionUtil then
        p57.connectionUtil:disconnect((`{p58.UserId}CharacterAdded`));
        p57.connectionUtil:disconnect((`{p58.UserId}CharacterRemoving`));
    end;
end;

function u1.OnMouseLockToggled(p59) -- Line: 683
    if p59.activeMouseLockController then
        local IsMouseLocked = p59.activeMouseLockController:GetIsMouseLocked();
        local MouseLockOffset = p59.activeMouseLockController:GetMouseLockOffset();

        if p59.activeCameraController then
            if _G.DoBodyGyroFunc then
                _G.DoBodyGyroFunc(IsMouseLocked);
            end;

            p59.activeCameraController:SetIsMouseLocked(IsMouseLocked);
            p59.activeCameraController:SetMouseLockOffset(MouseLockOffset);
        end;
    end;
end;

u1.new();

return {};
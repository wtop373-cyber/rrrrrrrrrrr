-- ============================================================
-- SCRIPT: Settings
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface.Modules.Settings
-- ============================================================

-- Decompiled with Potassium's decompiler.

local v1 = {};
local SoundService = game:GetService("SoundService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
game:GetService("TweenService");
local Chat = game:GetService("Chat");
local CollectionService = game:GetService("CollectionService");
local RunService = game:GetService("RunService");
local GamepadService = game:GetService("GamepadService");
local UserInputService = game:GetService("UserInputService");
local LocalPlayer = game.Players.LocalPlayer;
LocalPlayer:GetMouse();
local NewModules = ReplicatedStorage:WaitForChild("NewModules");
local DeepCopy = require(NewModules.Shared.Extensions.DeepCopy);

function v1.new(p2) -- Line: 18
    -- upvalues: ReplicatedStorage (copy), LocalPlayer (copy), DeepCopy (copy), SoundService (copy), Chat (copy), CollectionService (copy), GamepadService (copy), RunService (copy), NewModules (copy), UserInputService (copy)
    local SettingsFrame = p2:WaitForChild("SettingsFrame");
    local ToggleButton = p2:WaitForChild("StatsFrame"):WaitForChild("Frame2").Frame.Container.Settings.ToggleButton;
    local SettingsFrameM = SettingsFrame:WaitForChild("SettingsFrameM");
    local SettingsFrame2 = SettingsFrameM:WaitForChild("SettingsFrame2");
    local CloseButton = SettingsFrameM:WaitForChild("Header"):WaitForChild("CloseButton");
    local UISounds = ReplicatedStorage:WaitForChild("Storage"):WaitForChild("UISounds");
    local u3 = ReplicatedStorage:WaitForChild("PlayerbaseData2", 600):WaitForChild(LocalPlayer.Name, 1000);
    local u4 = {
        COLOR_TRUE = Color3.fromRGB(117, 255, 111),
        COLOR_FALSE = Color3.fromRGB(252, 87, 93)
    };
    local SettingsChanged = ReplicatedStorage:WaitForChild("Events2"):WaitForChild("SettingsChanged", 60);
    local Events = ReplicatedStorage:WaitForChild("Events", 60);
    local Events2 = ReplicatedStorage:WaitForChild("Events2", 60);
    ReplicatedStorage:WaitForChild("GameLoaded", 60);
    local u5 = Events.GetClientSettings:InvokeServer();
    local u6 = DeepCopy(u5);
    local Radios = SoundService:WaitForChild("Radios");
    local u7 = nil;
    local u8 = {};
    local u9 = {};
    local u10 = nil;
    local u11 = false;
    local u12 = {};
    local u13 = false;

    repeat
        wait(0.15);
    until _G.PlayerData;

    local u14 = false;
    local u15 = false;

    local function ApplyUselessObjects() -- Line: 64
        -- upvalues: u5 (ref), ReplicatedStorage (ref), u14 (ref), u10 (ref), ApplyUselessObjects (copy)
        local v16 = u5.UselessObjects and workspace.Filter.Parts or ReplicatedStorage.Storage;

        if u14 or u10.Parent == v16 then
            return;
        end;

        u14 = true;
        u10.Parent = v16;
        task.delay(3, function() -- Line: 71
            -- upvalues: u14 (ref), ApplyUselessObjects (ref)
            u14 = false;
            ApplyUselessObjects();
        end);
    end;

    local function Update(p17, p18, p19) -- Line: 77
        -- upvalues: u11 (ref), Chat (ref), u5 (ref), u12 (copy), ReplicatedStorage (ref), u4 (copy), Radios (copy), u10 (ref), CollectionService (ref), ApplyUselessObjects (copy), u15 (ref), SettingsChanged (copy), DeepCopy (ref), u9 (copy), u6 (ref), Events (copy)
        u11 = true;
        Chat.BubbleChatEnabled = u5.Chat and true or false;

        for i, v in pairs(u5) do
            if u12[i] then
                local v20 = u12[i].prime and not _G.PlayerData.Prime;
                local v21 = u12[i].disabled or u12[i].incog and ReplicatedStorage.Values.NoIncognito.Value or u12[i].incog2 and (ReplicatedStorage.Values.NoIncognito.Value or ReplicatedStorage.Values.NoRandomNames.Value);

                if v20 or v21 then
                    u12[i].frame.ToggleFrame.ImageColor3 = Color3.fromRGB(135, 135, 135);
                    u12[i].button.Visible = false;

                    if v21 then
                        u12[i].frame.ToggleFrame.Disabled.Visible = true;
                        u12[i].frame.ToggleFrame.Prime.Visible = false;
                    elseif v20 then
                        u12[i].frame.ToggleFrame.Prime.Visible = true;
                        u12[i].frame.ToggleFrame.Disabled.Visible = false;
                    end;
                else
                    u12[i].frame.ToggleFrame.ImageColor3 = v and u4.COLOR_TRUE or u4.COLOR_FALSE;
                    u12[i].button.TextColor3 = v and u4.COLOR_TRUE or u4.COLOR_FALSE;
                    u12[i].button.Text = v and "ON" or "OFF";
                    u12[i].button.Visible = true;

                    if u12[i].prime then
                        u12[i].frame.ToggleFrame.Prime.Visible = false;
                    end;
                end;
            end;
        end;

        Radios.Volume = u5.Radios and 1 or 0;

        if not u10 then
            u10 = Instance.new("Folder");

            for _, v in pairs(CollectionService:GetTagged("UselessObjects")) do
                v.Parent = u10;
            end;
        end;

        if p19 or p17 == "UselessObjects" then
            ApplyUselessObjects();
        end;

        if p17 == "AdvancedMaterials" and not u15 then
            u15 = true;
            task.delay(3, function() -- Line: 128
                -- upvalues: u15 (ref)
                u15 = false;
            end);
        end;

        _G.GSettings = u5;

        if p17 then
            SettingsChanged:Fire(p17, p18);
        end;

        if not p19 then
            local v22 = DeepCopy(u5);

            for i, _ in pairs(u9) do
                v22[i] = u6[i];
            end;

            Events.ClientSettingsUpdated:FireServer(DeepCopy(v22));
        end;

        u11 = false;
    end;

    local function Open(p23) -- Line: 189
        -- upvalues: u13 (ref), UISounds (copy), SettingsFrameM (copy), Events2 (copy), GamepadService (ref)
        if p23 and (_G.IsSkinTradeActive and _G.IsSkinTradeActive()) then
            return;
        end;

        if p23 and not u13 then
            UISounds.open:Play();
            SettingsFrameM.Visible = true;
            Events2.ToggleStoreUI:Fire(false);
            Events2.ToggleSkinsUI:Fire(false);
            Events2.ToggleReturnMenu:Fire(false);
        elseif not p23 and u13 then
            UISounds.close:Play();
            SettingsFrameM.Visible = false;
            Events2.SettingsClosed:Fire();
            GamepadService:DisableGamepadCursor();
        end;

        u13 = SettingsFrameM.Visible;
    end;

    local function UpdateTab(p24) -- Line: 214
        -- upvalues: u7 (ref), u8 (copy), SettingsFrame2 (copy), u12 (copy), SettingsFrame (copy), RunService (ref)
        if u7 then
            u7.TextTransparency = 0.5;
        end;

        if u7 ~= u8[p24] then
            SettingsFrame2.CanvasPosition = Vector2.new(0, 0);
        end;

        for _, v in pairs(u12) do
            local v25;

            if v.tab == p24 then
                v25 = not v.hidden;
            else
                v25 = false;
            end;

            v.frame.Visible = v25;
        end;

        coroutine.wrap(function() -- Line: 227
            -- upvalues: SettingsFrame (ref), RunService (ref)
            SettingsFrame.Size = UDim2.new(1, 0, 1, 15);
            RunService.RenderStepped:Wait();
            RunService.RenderStepped:Wait();
            SettingsFrame.Size = UDim2.new(1, 0, 1, 0);
        end)();
        u7 = u8[p24];
        u8[p24].TextTransparency = 0;
    end;

    (function() -- Line: 238, Name: SetUp
        -- upvalues: u5 (ref), NewModules (ref), u12 (copy), SettingsFrame2 (copy), LocalPlayer (ref), SettingsFrameM (copy), u8 (copy), UISounds (copy), UpdateTab (copy), u11 (ref), u14 (ref), u15 (ref), Update (copy), u7 (ref), UserInputService (ref), CloseButton (copy), u13 (ref), Events2 (copy), GamepadService (ref), ToggleButton (copy), Open (copy), u3 (copy), SettingsChanged (copy), Chat (ref), ReplicatedStorage (ref), u9 (copy)
        if typeof(u5) ~= "table" then
            warn("Failed to get ClientSettings, using default");
            u5 = require(NewModules.Shared.Configuration.DefaultClientSettings);
        end;

        if not _G.ClientLoaded then
            repeat
                task.wait(0.1);
            until _G.ClientLoaded;
        end;

        u12.RandomAvatar = {
            name = "RandomAvatar",
            typ = "bool",
            tab = "game",
            prime = true,
            incog = true
        };
        u12.HideName = {
            name = "HideName",
            typ = "bool",
            tab = "game",
            prime = true,
            incog = true,
            incog2 = true
        };
        u12.ClientStats = {
            name = "ClientStats",
            typ = "bool",
            tab = "game"
        };
        u12.Radios = {
            name = "Radios",
            typ = "bool",
            tab = "game"
        };
        u12.CTRL_lock = {
            name = "CTRL_lock",
            typ = "bool",
            tab = "game"
        };

        if not SettingsFrame2:FindFirstChild("PadShiftLock") then
            local v26 = SettingsFrame2:WaitForChild("CTRL_lock"):Clone();
            v26.Name = "PadShiftLock";
            v26.LayoutOrder = 32;
            v26.Title.Text = "CONTROLLER LOCK";
            v26.Parent = SettingsFrame2;
        end;

        if u5.PadShiftLock == nil then
            u5.PadShiftLock = true;
        end;

        u12.PadShiftLock = {
            name = "PadShiftLock",
            typ = "bool",
            tab = "game",
            new = os.time() < 1793836800
        };
        u12.Chat = {
            name = "Chat",
            typ = "bool",
            tab = "game"
        };
        u12.ToolDropping = {
            name = "ToolDropping",
            typ = "bool",
            tab = "game"
        };
        u12.GameMusic = {
            name = "GameMusic",
            typ = "bool",
            tab = "game"
        };
        u12.GameMusic2 = {
            name = "GameMusic2",
            typ = "bool",
            tab = "game"
        };
        u12.PBRTextures = {
            name = "PBRTextures",
            typ = "bool",
            tab = "display"
        };
        u12.AdvancedMaterials = {
            name = "AdvancedMaterials",
            typ = "bool",
            tab = "display"
        };
        u12.AdvancedEmitter = {
            name = "AdvancedEmitter",
            typ = "bool",
            tab = "display"
        };
        u12.ShopFromBank = {
            name = "ShopFromBank",
            typ = "bool",
            tab = "game"
        };
        u12.DisplayItems = {
            name = "DisplayItems",
            typ = "bool",
            tab = "display"
        };
        u12.PostFX = {
            name = "PostFX",
            typ = "bool",
            tab = "display"
        };
        u12.BloodEffects = {
            name = "BloodEffects",
            typ = "bool",
            tab = "display"
        };
        u12.BloodPools = {
            name = "BloodPools",
            typ = "bool",
            tab = "display"
        };
        u12.Gore = {
            name = "Gore",
            typ = "bool",
            tab = "display"
        };
        u12.ShellEjection = {
            name = "ShellEjection",
            typ = "bool",
            tab = "display"
        };
        u12.BulletHoles = {
            name = "BulletHoles",
            typ = "bool",
            tab = "display"
        };
        u12.BulletTracers = {
            name = "BulletTracers",
            typ = "bool",
            tab = "display"
        };
        u12.BulletSparks = {
            name = "BulletSparks",
            typ = "bool",
            tab = "display"
        };
        u12.UselessObjects = {
            name = "UselessObjects",
            typ = "bool",
            tab = "display"
        };
        u12.NameTags = {
            name = "NameTags",
            typ = "bool",
            tab = "display"
        };
        u12.ServerInfo = {
            name = "ServerInfo",
            typ = "bool",
            tab = "display"
        };
        u12.UITag = {
            name = "UITag",
            typ = "bool",
            tab = "display"
        };
        u12.Debug = {
            name = "Debug",
            typ = "bool",
            tab = "advanced"
        };
        u12.PingSync = {
            name = "PingSync",
            typ = "bool",
            tab = "advanced"
        };
        u12.ToggleCrouch = {
            name = "ToggleCrouch",
            typ = "bool",
            tab = "game",
            new = os.time() < 1686607269
        };
        u12.PlayerPackages = {
            name = "PlayerPackages",
            typ = "bool",
            tab = "display",
            new = os.time() < 1708535983
        };
        u12.ToggleDisplayNameBadge = {
            name = "ToggleDisplayNameBadge",
            typ = "bool",
            tab = "game",
            hidden = LocalPlayer:GetAttribute("ToggleDisplayNameBadge") ~= true
        };
        u12.StarterGear = {
            name = "StarterGear",
            typ = "bool",
            tab = "game"
        };
        SettingsFrameM:WaitForChild("Header");
        u8.game = SettingsFrameM.Header.GameButton;
        u8.display = SettingsFrameM.Header.DisplayButton;
        u8.advanced = SettingsFrameM.Header.AdvancedButton;

        for i, v in pairs(u8) do
            v.MouseButton1Down:Connect(function() -- Line: 474
                -- upvalues: UISounds (ref), UpdateTab (ref), i (copy)
                UISounds.click:Play();
                UpdateTab(i);
            end);
        end;

        for i, v in pairs(u12) do
            local _ = v.typ;
            local v27 = SettingsFrame2:WaitForChild(v.name);
            local TextButton = v27.ToggleFrame.TextButton;
            u12[i].frame = v27;
            u12[i].button = TextButton;
            script:WaitForChild("Prime"):Clone().Parent = v27.ToggleFrame;
            script:WaitForChild("Disabled"):Clone().Parent = v27.ToggleFrame;

            if v.new then
                local v28 = script.New:Clone();
                v28.Position = UDim2.new(v28.Position.X.Scale, string.len(v27.Title.Text) * 11.46153846153846, v28.Position.Y.Scale, v28.Position.Y.Offset);
                v28.Parent = v27;
            end;

            TextButton.MouseButton1Down:Connect(function() -- Line: 498
                -- upvalues: u11 (ref), i (copy), u14 (ref), u15 (ref), u5 (ref), Update (ref)
                if u11 or i == "UselessObjects" and u14 or i == "AdvancedMaterials" and u15 then
                    return;
                end;

                u5[i] = not u5[i];
                Update(i, u5[i]);
            end);
            TextButton.MouseEnter:Connect(function() -- Line: 505
                -- upvalues: UISounds (ref)
                UISounds.hover:Play();
            end);
            TextButton.MouseButton1Down:Connect(function() -- Line: 509
                -- upvalues: UISounds (ref)
                UISounds.click:Play();
            end);
        end;

        local function UpdateBadgeRow() -- Line: 516
            -- upvalues: u12 (ref), LocalPlayer (ref), u7 (ref), u8 (ref)
            local ToggleDisplayNameBadge = u12.ToggleDisplayNameBadge;
            ToggleDisplayNameBadge.hidden = LocalPlayer:GetAttribute("ToggleDisplayNameBadge") ~= true;
            local v29;

            if u7 == u8[ToggleDisplayNameBadge.tab] then
                v29 = not ToggleDisplayNameBadge.hidden;
            else
                v29 = false;
            end;

            ToggleDisplayNameBadge.frame.Visible = v29;
        end;

        LocalPlayer:GetAttributeChangedSignal("ToggleDisplayNameBadge"):Connect(UpdateBadgeRow);
        local ToggleDisplayNameBadge = u12.ToggleDisplayNameBadge;
        ToggleDisplayNameBadge.hidden = LocalPlayer:GetAttribute("ToggleDisplayNameBadge") ~= true;
        local v30;

        if u7 == u8[ToggleDisplayNameBadge.tab] then
            v30 = not ToggleDisplayNameBadge.hidden;
        else
            v30 = false;
        end;

        ToggleDisplayNameBadge.frame.Visible = v30;

        local function UpdatePadRow() -- Line: 524
            -- upvalues: u12 (ref), UserInputService (ref), u7 (ref), u8 (ref)
            local PadShiftLock = u12.PadShiftLock;
            PadShiftLock.hidden = _G.DeviceType ~= 2 and #UserInputService:GetConnectedGamepads() <= 0;
            local v31;

            if u7 == u8[PadShiftLock.tab] then
                v31 = not PadShiftLock.hidden;
            else
                v31 = false;
            end;

            PadShiftLock.frame.Visible = v31;
        end;

        UserInputService.GamepadConnected:Connect(function() -- Line: 529
            -- upvalues: UpdatePadRow (copy)
            task.defer(UpdatePadRow);
        end);
        UserInputService.GamepadDisconnected:Connect(function() -- Line: 532
            -- upvalues: UpdatePadRow (copy)
            task.defer(UpdatePadRow);
        end);
        local PadShiftLock = u12.PadShiftLock;
        PadShiftLock.hidden = _G.DeviceType ~= 2 and #UserInputService:GetConnectedGamepads() <= 0;
        local v32;

        if u7 == u8[PadShiftLock.tab] then
            v32 = not PadShiftLock.hidden;
        else
            v32 = false;
        end;

        PadShiftLock.frame.Visible = v32;
        CloseButton.MouseButton1Down:Connect(function() -- Line: 537
            -- upvalues: u13 (ref), UISounds (ref), SettingsFrameM (ref), Events2 (ref), GamepadService (ref)
            if u13 then
                UISounds.close:Play();
                SettingsFrameM.Visible = false;
                Events2.SettingsClosed:Fire();
                GamepadService:DisableGamepadCursor();
            end;

            u13 = SettingsFrameM.Visible;
        end);
        ToggleButton.MouseButton1Down:Connect(function() -- Line: 541
            -- upvalues: Open (ref), u13 (ref)
            Open(not u13);
        end);
        Events2.ToggleSettingsUI.Event:Connect(function(p33) -- Line: 545
            -- upvalues: Open (ref)
            Open(p33 or false);
        end);
        coroutine.wrap(function() -- Line: 549
            -- upvalues: u3 (ref)
            if not u3.Loaded.Value then
                u3.Loaded:GetPropertyChangedSignal("Value"):Wait(100);
            end;
        end)();
        ToggleButton.MouseEnter:Connect(function() -- Line: 557
        end);
        ToggleButton.MouseLeave:Connect(function() -- Line: 561
        end);
        LocalPlayer.CharacterAdded:Connect(function() -- Line: 565
            -- upvalues: SettingsChanged (ref), u5 (ref), Update (ref)
            SettingsChanged:Fire("CTRL_lock", u5.CTRL_lock);
            Update();
        end);

        local function updtInpType(p34) -- Line: 570
            -- upvalues: CloseButton (ref), UserInputService (ref)
            if p34 ~= 2 then
                CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255);
                CloseButton.Text = "X";
                CloseButton.ImageLabel.Visible = false;

                return;
            end;

            CloseButton.TextColor3 = Color3.fromRGB(255, 170, 0);
            CloseButton.Text = "";
            local ImageForKeyCode = UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonY);
            CloseButton.ImageLabel.Image = ImageForKeyCode or "";
            CloseButton.ImageLabel.Visible = true;
        end;

        UserInputService.InputBegan:Connect(function(p35, p36) -- Line: 586
            -- upvalues: u13 (ref), UISounds (ref), SettingsFrameM (ref), Events2 (ref), GamepadService (ref)
            if p35.KeyCode == Enum.KeyCode.ButtonY and (not p36 and u13) then
                if u13 then
                    UISounds.close:Play();
                    SettingsFrameM.Visible = false;
                    Events2.SettingsClosed:Fire();
                    GamepadService:DisableGamepadCursor();
                end;

                u13 = SettingsFrameM.Visible;
            end;
        end);
        Events2.InputTypeChanged.Event:Connect(updtInpType);
        updtInpType(_G.InputType);
        Chat.BubbleChatEnabled = false;
        UpdateTab("game");

        if ReplicatedStorage.Values.DisableBank.Value then
            u9.ShopFromBank = true;
            u5.ShopFromBank = false;
            u12.ShopFromBank.disabled = true;
            Update("ShopFromBank", false);
        end;

        wait(3);
        Update("DisplayItems", u5.DisplayItems);
        Update("PlayerPackages", u5.PlayerPackages);
        Update("PostFX", u5.PostFX);
        Update("AdvancedMaterials", u5.AdvancedMaterials);
        Update("ServerInfo", u5.ServerInfo, true);
        Update("Chat", u5.Chat, true);
    end)();
end;

return v1;
-- ============================================================
-- SCRIPT: IndependenceEvent
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface.Modules.IndependenceEvent
-- ============================================================

-- Decompiled with Potassium's decompiler.

local v1 = {};
local UserInputService = game:GetService("UserInputService");
game:GetService("RunService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local TweenService = game:GetService("TweenService");
local GamepadService = game:GetService("GamepadService");
local CollectionService = game:GetService("CollectionService");
ReplicatedStorage.Values:WaitForChild("IndependenceEvent2024", 60);
local u2 = ReplicatedStorage.Values:FindFirstChild("IndependenceEvent2024") and ReplicatedStorage.Values.IndependenceEvent2024;

if not u2 then
    return {};
end;

local RemoteFunction = u2.RemoteFunction;
local _ = script.Parent;
local workspace_CurrentCamera = workspace.CurrentCamera;
local EnlistBlur = workspace_CurrentCamera:FindFirstChild("EnlistBlur");

if not EnlistBlur then
    EnlistBlur = Instance.new("BlurEffect");
    EnlistBlur.Size = 0;
    EnlistBlur.Name = "EnlistBlur";
    EnlistBlur.Parent = workspace_CurrentCamera;
end;

EnlistBlur.Size = 0;
_G.ATM_Active = false;

repeat
    task.wait(0.5);
until _G.WaitForChar and (_G.GVF and _G.GVF());

_G.WaitForChar();
local LocalPlayer = game.Players.LocalPlayer;
local Character = LocalPlayer.Character;
local Humanoid = Character:WaitForChild("Humanoid");
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart");
local u3 = {
    toggle = Humanoid:LoadAnimation(ReplicatedStorage.Storage.Animations:WaitForChild("Toggle2"))
};
local u4 = ReplicatedStorage:WaitForChild("PlayerbaseData2", 100):WaitForChild(LocalPlayer.Name, 100);
ReplicatedStorage:WaitForChild("Events");
local Events2 = ReplicatedStorage:WaitForChild("Events2");
local UISounds = ReplicatedStorage:WaitForChild("Storage"):WaitForChild("UISounds");
local u5 = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("IndependenceDealers");
local u6 = ReplicatedStorage.Storage.GUIs.IndependenceEventFrame:Clone();
local EnlistFrame = u6.EnlistFrame;
local StartingFrame = u6.StartingFrame;
local CloseButton = EnlistFrame.TopBar.CloseButton;
local Cash = EnlistFrame.TopBar.Frame.Cash;
local AnswerMessage = EnlistFrame.AnswerMessage;
local u7 = false;
local u8 = nil;
local u9 = false;
local u10 = 0;
local u11 = nil;
local u12 = nil;
local u13 = nil;
local u14 = nil;
local u15 = nil;
local u16 = {};
local u17 = {};
local u18 = nil;
local u19 = false;

local function PositiveIntegerMask(p20) -- Line: 80
    return p20:gsub("[^%-%d]", "");
end;

local AddCommas = require(ReplicatedStorage.NewModules.Shared.Extensions.AddCommas);

local function Convert(p21) -- Line: 86
    local function Format(p22) -- Line: 87
        return string.format("%02i", p22);
    end;

    local v23 = (p21 - p21 % 60) / 60;

    return string.format("%02i", v23) .. ":" .. string.format("%02i", p21 - v23 * 60);
end;

local function MessageHandler(p24, p25, p26) -- Line: 96
    -- upvalues: u10 (ref), AnswerMessage (copy), u11 (ref), u12 (ref)
    local v27 = p25 or "An error occured in your request";
    local math_random_ret = math.random();
    u10 = math_random_ret;
    AnswerMessage.Visible = true;

    if p24 == true then
        AnswerMessage.TextColor3 = Color3.new(0, 1, 0);
        AnswerMessage.T.TextColor3 = Color3.new(0, 1, 0);
    elseif p24 then
        AnswerMessage.TextColor3 = Color3.new(1, 1, 1);
        AnswerMessage.T.TextColor3 = Color3.new(1, 1, 1);
    else
        AnswerMessage.TextColor3 = Color3.new(1, 0, 0);
        AnswerMessage.T.TextColor3 = Color3.new(1, 0, 0);
    end;

    if v27 == u11 then
        u12 = u12 + 1;
        v27 = v27 .. " x" .. u12;
    else
        u11 = v27;
        u12 = 1;
    end;

    AnswerMessage.Text = v27;
    AnswerMessage.T.Text = v27;
    task.delay(p26 or 2.5, function() -- Line: 129
        -- upvalues: u10 (ref), math_random_ret (copy), AnswerMessage (ref)
        if u10 == math_random_ret then
            AnswerMessage.Visible = false;
            AnswerMessage.Text = "";
            AnswerMessage.T.Text = "";
        end;
    end);
end;

local function updtInpType(p28) -- Line: 138
    -- upvalues: CloseButton (copy), UserInputService (copy)
    if p28 ~= 2 then
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

local function UpdateGUI() -- Line: 153
    -- upvalues: EnlistFrame (copy), u2 (copy), LocalPlayer (copy), u8 (ref), StartingFrame (copy)
    EnlistFrame.Frame.Button.TextButton.Text = `ENLIST NOW:   <b><font color="rgb(170, 255, 191)">${u2:GetAttribute("EnlistPrice")}</font></b>`;
    local Attribute = LocalPlayer:GetAttribute("IndependenceParticipating");

    if u2.Active.Value then
        if Attribute then
            EnlistFrame.Frame.Visible = false;
            EnlistFrame.Frame2.Boxes.Red.Visible = Attribute == "Red";
            EnlistFrame.Frame2.Boxes.Blue.Visible = Attribute == "Blue";
            EnlistFrame.Frame2.Visible = true;
        else
            EnlistFrame.Frame.Visible = true;
            EnlistFrame.Frame2.Visible = false;
            EnlistFrame.Frame.Button.TextButton.Visible = u8 ~= nil;

            for _, child in pairs(EnlistFrame.Frame.Boxes:GetChildren()) do
                if child:IsA("Frame") then
                    if u8 and child.Name == u8 then
                        child.BorderColor3 = Color3.new(1, 1, 1);
                        child.ImageButton.ImageColor3 = Color3.new(1, 1, 1);
                        child.ImageButton.BackgroundTransparency = 1;
                        child.BorderSizePixel = 3;
                    else
                        child.BorderColor3 = Color3.new(0, 0, 0);
                        child.ImageButton.ImageColor3 = Color3.fromRGB(121, 121, 121);
                        child.ImageButton.BackgroundTransparency = 0.5;
                        child.BorderSizePixel = 2;
                    end;
                end;
            end;
        end;

        StartingFrame.Visible = false;

        if Attribute and u2.Starting.Value then
            StartingFrame.ImageLabel.BackgroundColor3 = EnlistFrame.Frame.Boxes[Attribute].BackgroundColor3;
            local Value = u2.Starting.Timer.Value;

            local function _(p29) -- Line: 87
                return string.format("%02i", p29);
            end;

            local v30 = (Value - Value % 60) / 60;
            StartingFrame.TextLabel.Text = `WAR COMMENCING: {string.format("%02i", v30) .. ":" .. string.format("%02i", Value - v30 * 60)}`;
            StartingFrame.Visible = true;
        end;
    else
        StartingFrame.Visible = false;

        if Attribute and u2.Starting.Value then
            StartingFrame.ImageLabel.BackgroundColor3 = EnlistFrame.Frame.Boxes[Attribute].BackgroundColor3;
            local Value = u2.Starting.Timer.Value;

            local function _(p31) -- Line: 87
                return string.format("%02i", p31);
            end;

            local v32 = (Value - Value % 60) / 60;
            StartingFrame.TextLabel.Text = `WAR COMMENCING: {string.format("%02i", v32) .. ":" .. string.format("%02i", Value - v32 * 60)}`;
            StartingFrame.Visible = true;
        end;

        EnlistFrame.Frame.Visible = false;
        EnlistFrame.Frame2.Visible = false;
    end;
end;

function GuiToggle(p33, u34)
    -- upvalues: u7 (ref), u8 (ref), EnlistFrame (copy), UISounds (copy), UpdateGUI (copy), GamepadService (copy), CloseButton (copy), EnlistBlur (ref), Humanoid (ref), u14 (ref), TweenService (copy), u18 (ref), Character (ref), HumanoidRootPart (ref)
    if p33 == u7 then
        return;
    end;

    u8 = nil;

    for _, child in pairs(EnlistFrame.Frame.Boxes:GetChildren()) do
        if child:IsA("Frame") then
            child.Hover.Visible = false;
        end;
    end;

    if p33 then
        UISounds.open:Play();
        UpdateGUI();
        pcall(function() -- Line: 230
            -- upvalues: GamepadService (ref), CloseButton (ref)
            if _G.InputType == 2 then
                GamepadService:EnableGamepadCursor(CloseButton);
            end;
        end);
        EnlistFrame.WarnFrame.Continue.Visible = false;
        task.delay(2, function() -- Line: 237
            -- upvalues: EnlistFrame (ref)
            EnlistFrame.WarnFrame.Continue.Visible = true;
        end);
        EnlistFrame.Visible = true;
        pcall(function() -- Line: 243
            -- upvalues: EnlistBlur (ref)
            EnlistBlur:Cancel();
        end);
        Humanoid:UnequipTools();
        u14 = TweenService:Create(EnlistBlur, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = 10
        });

        if u34 then
            task.delay(0.1, function() -- Line: 250
                -- upvalues: u18 (ref), u34 (copy), u7 (ref), Character (ref), HumanoidRootPart (ref)
                u18 = u34.AncestryChanged:Connect(function(p35, p36) -- Line: 251
                    if not p36 then
                        GuiToggle(false);
                    end;
                end);

                while u7 do
                    task.wait(0.05);

                    if not _G.CheckIfCan(Character, "Any") or (HumanoidRootPart.Position - u34.Position).Magnitude > 6.5 then
                        GuiToggle(false);

                        return;
                    end;
                end;
            end);
        end;
    else
        pcall(function() -- Line: 266
            -- upvalues: u14 (ref)
            u14:Cancel();
        end);
        pcall(function() -- Line: 269
            -- upvalues: u18 (ref)
            if u18 then
                u18:Disconnect();
            end;

            u18 = nil;
        end);
        u14 = TweenService:Create(EnlistBlur, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Size = 0
        });
        UISounds.close:Play();
        EnlistFrame.Visible = false;
    end;

    u7 = p33;
end;

local function RevealEnemies(u37) -- Line: 285
    -- upvalues: TweenService (copy), LocalPlayer (copy), CollectionService (copy), Character (ref), u17 (ref), ReplicatedStorage (copy)
    local function DoTrack(p38) -- Line: 286
        -- upvalues: u37 (copy), TweenService (ref)
        local v39 = p38:FindFirstChildOfClass("Humanoid");

        if v39 and v39.Health > 0 then
            local Highlight = Instance.new("Highlight");
            Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
            Highlight.OutlineColor = Color3.new(1, 0, 0);
            Highlight.OutlineTransparency = 0;
            Highlight.FillTransparency = 0.9;
            Highlight.Adornee = p38;
            Highlight.Enabled = true;
            Highlight.Parent = p38;
            local u40 = v39.Died:Once(function() -- Line: 299
                -- upvalues: Highlight (copy)
                game.Debris:AddItem(Highlight, 0);
            end);
            task.delay(u37 - 1, function() -- Line: 303
                -- upvalues: u40 (ref), Highlight (copy), TweenService (ref)
                pcall(function() -- Line: 304
                    -- upvalues: u40 (ref)
                    u40:Disconnect();
                end);
                game.Debris:AddItem(Highlight, 1.5);
                TweenService:Create(Highlight, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                    FillTransparency = 1,
                    OutlineTransparency = 1
                }):Play();
            end);
        end;
    end;

    local Attribute = LocalPlayer:GetAttribute("IndependenceParticipating");

    if Attribute then
        for _, v in pairs(CollectionService:GetTagged("Infantry_" .. (Attribute == "Blue" and "Red" or "Blue"))) do
            if v ~= Character and not u17[v] then
                DoTrack(v);
            end;
        end;

        ReplicatedStorage.Events2.ClientWarn:Fire({
            "Revealing enemies",
            2,
            Color3.fromRGB(114, 255, 161),
            Color3.new(0, 0, 0),
            "BEEP"
        });
    end;
end;

local function UpdateTeamTracking() -- Line: 326
    -- upvalues: u17 (ref), TweenService (copy), LocalPlayer (copy), u15 (ref), CollectionService (copy), Character (ref)
    local function u47(u41) -- Line: 327
        -- upvalues: u17 (ref), TweenService (ref)
        local v42 = u41:FindFirstChildOfClass("Humanoid");

        if v42 and v42.Health > 0 then
            local Highlight = Instance.new("Highlight");
            Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
            Highlight.OutlineColor = Color3.new(1, 1, 1);
            Highlight.OutlineTransparency = 0;
            Highlight.FillTransparency = 1;
            Highlight.Adornee = u41;
            Highlight.Enabled = true;
            Highlight.Parent = u41;
            local u43 = nil;
            local u44 = nil;
            u43 = u41.AncestryChanged:Connect(function(p45, p46) -- Line: 341
                -- upvalues: u17 (ref), u41 (copy), u43 (ref), u44 (ref), Highlight (copy)
                if not p46 then
                    u17[u41] = nil;
                    u43:Disconnect();
                    pcall(function() -- Line: 345
                        -- upvalues: u44 (ref)
                        u44:Disconnect();
                    end);

                    if Highlight and Highlight.Parent then
                        Highlight:Destroy();
                    end;
                end;
            end);
            u44 = v42.Died:Once(function() -- Line: 354
                -- upvalues: Highlight (copy), TweenService (ref)
                if Highlight and Highlight.Parent then
                    TweenService:Create(Highlight, TweenInfo.new(4, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                        FillTransparency = 1,
                        OutlineTransparency = 1
                    }):Play();
                end;
            end);
            u17[u41] = { Highlight, u43 };
        end;
    end;

    local Attribute = LocalPlayer:GetAttribute("IndependenceParticipating");

    if Attribute ~= u15 then
        for _, v in pairs(u17) do
            pcall(function() -- Line: 368
                -- upvalues: v (copy)
                v[1]:Destroy();
            end);
            pcall(function() -- Line: 371
                -- upvalues: v (copy)
                v[2]:Destroy();
            end);
        end;

        u17 = {};
    end;

    u15 = Attribute;

    if Attribute then
        for _, v in pairs(CollectionService:GetTagged("Infantry_" .. Attribute)) do
            if v ~= Character and not u17[v] then
                task.spawn(function() -- Line: 383
                    -- upvalues: u47 (copy), v (copy)
                    u47(v);
                end);
            end;
        end;
    end;
end;

local function PlayGlobalSound(p48) -- Line: 391
    -- upvalues: u2 (copy)
    local v49 = u2.Sounds:FindFirstChild(p48);

    if v49 then
        local TimeLength = v49.TimeLength;
        local v50 = v49:Clone();
        game.Debris:AddItem(v50, TimeLength + 5);
        v50.SoundGroup = nil;
        v50.Parent = workspace.Audio;
        v50:Play();
    end;
end;

local function SetUp() -- Line: 403
    -- upvalues: u5 (copy), u16 (copy), CollectionService (copy), u8 (ref), UpdateGUI (copy), EnlistFrame (copy), UISounds (copy), u19 (ref), u9 (ref), RemoteFunction (copy), MessageHandler (copy), RevealEnemies (copy), PlayGlobalSound (copy), CloseButton (copy), u4 (copy), Cash (copy), AddCommas (copy), UserInputService (copy), u7 (ref), Events2 (copy), updtInpType (copy), LocalPlayer (copy), UpdateTeamTracking (copy), u2 (copy), Character (ref), Humanoid (ref), HumanoidRootPart (ref), u3 (ref), ReplicatedStorage (copy), u13 (ref), u17 (ref)
    local function ProximitySetup(u51) -- Line: 404
        -- upvalues: u5 (ref), u16 (ref)
        if not u51:IsDescendantOf(u5) then
            return;
        end;

        table.insert(u16, u51);
        u51.Triggered:Connect(function(p52: userdata, ...) -- Line: 409
            -- upvalues: u51 (copy)
            GuiToggle(true, u51:FindFirstAncestorWhichIsA("BasePart"));
        end);
    end;

    if u5 then
        for _, v in pairs(CollectionService:GetTagged("ProximityPrompt")) do
            if v:IsDescendantOf(u5) then
                table.insert(u16, v);
                v.Triggered:Connect(function(p53: userdata, ...) -- Line: 409
                    -- upvalues: v (copy)
                    GuiToggle(true, v:FindFirstAncestorWhichIsA("BasePart"));
                end);
            end;
        end;

        CollectionService:GetInstanceAddedSignal("ProximityPrompt"):Connect(ProximitySetup);
    end;

    local function SelectBox(p54) -- Line: 424
        -- upvalues: u8 (ref), UpdateGUI (ref)
        if p54 == u8 then
            p54 = nil;
        end;

        u8 = p54;
        UpdateGUI();
    end;

    for _, child in pairs(EnlistFrame.Frame.Boxes:GetChildren()) do
        if child:IsA("Frame") then
            child.ImageButton.MouseEnter:Connect(function() -- Line: 434
                -- upvalues: child (copy), UISounds (ref)
                child.Hover.Visible = true;
                UISounds.hover:Play();
            end);
            child.ImageButton.MouseLeave:Connect(function() -- Line: 438
                -- upvalues: child (copy)
                child.Hover.Visible = false;
            end);
            child.ImageButton.MouseButton1Click:Connect(function() -- Line: 442
                -- upvalues: u19 (ref), UISounds (ref), child (copy), u8 (ref), UpdateGUI (ref)
                if not u19 then
                    return;
                end;

                UISounds.click:Play();
                local Name = child.Name;

                if Name == u8 then
                    Name = nil;
                end;

                u8 = Name;
                UpdateGUI();
            end);
        end;
    end;

    EnlistFrame.WarnFrame.Continue.MouseButton1Click:Connect(function() -- Line: 455
        -- upvalues: u19 (ref), EnlistFrame (ref)
        u19 = true;
        EnlistFrame.WarnFrame.Visible = false;
    end);
    EnlistFrame.Frame.Button.TextButton.MouseButton1Click:Connect(function() -- Line: 460
        -- upvalues: u19 (ref), u9 (ref), u8 (ref), UISounds (ref), RemoteFunction (ref), MessageHandler (ref), UpdateGUI (ref)
        if not u19 then
            return;
        end;

        if u9 then
            return;
        end;

        if not u8 then
            return;
        end;

        UISounds.click:Play();
        u9 = true;
        local v55, v56 = RemoteFunction:InvokeServer("Enlist", u8);

        if v55 then
            UISounds.purchase:Play();
            UISounds.BEEP:Play();
        end;

        MessageHandler(v55, v56, 2.5);
        UpdateGUI();
        task.wait(0.5);
        u9 = false;
    end);

    function RemoteFunction.OnClientInvoke(p57, p58, p59) -- Line: 491
        -- upvalues: RevealEnemies (ref), PlayGlobalSound (ref)
        if p57 == "RevealEnemies" then
            RevealEnemies(p58);

            return;
        end;

        if p57 == "GlobalSound" then
            PlayGlobalSound(p58);
        end;
    end;

    EnlistFrame.Visible = false;
    CloseButton.MouseButton1Click:Connect(function() -- Line: 501
        GuiToggle(false);
    end);
    u4.Cash.Changed:Connect(function() -- Line: 505
        -- upvalues: Cash (ref), AddCommas (ref), u4 (ref)
        Cash.Text = "$" .. AddCommas(u4.Cash.Value);
    end);
    Cash.Text = "$" .. AddCommas(_G.PlayerData.Cash);
    UserInputService.InputBegan:Connect(function(p60, p61) -- Line: 512
        -- upvalues: u7 (ref)
        if p60.KeyCode == Enum.KeyCode.ButtonY and (not p61 and u7) then
            GuiToggle(false);
        end;
    end);
    Events2.InputTypeChanged.Event:Connect(updtInpType);
    updtInpType(_G.InputType);
    LocalPlayer:GetAttributeChangedSignal("IndependenceParticipating"):Connect(function() -- Line: 525
        -- upvalues: UpdateGUI (ref), UpdateTeamTracking (ref)
        UpdateGUI();
        UpdateTeamTracking();
    end);
    CollectionService:GetInstanceAddedSignal("Infantry_Blue"):Connect(UpdateTeamTracking);
    CollectionService:GetInstanceAddedSignal("Infantry_Red"):Connect(UpdateTeamTracking);
    u2.Starting.Timer.Changed:Connect(UpdateGUI);
    u2.Starting.Changed:Connect(UpdateGUI);
    UpdateGUI();

    local function NewChar(p62) -- Line: 541
        -- upvalues: Character (ref), Humanoid (ref), HumanoidRootPart (ref), u3 (ref), ReplicatedStorage (ref), u13 (ref), UpdateGUI (ref), u17 (ref), UpdateTeamTracking (ref), LocalPlayer (ref), CollectionService (ref)
        Character = p62;
        Humanoid = Character:WaitForChild("Humanoid");
        HumanoidRootPart = Character:WaitForChild("HumanoidRootPart");
        u3 = {
            toggle = Humanoid:LoadAnimation(ReplicatedStorage.Storage.Animations:WaitForChild("Toggle2"))
        };
        u13 = _G.GVF();
        GuiToggle(false);
        Humanoid.Died:Once(function() -- Line: 550
            -- upvalues: UpdateGUI (ref)
            UpdateGUI();
            GuiToggle(false);
        end);
        u13.Currents.ChildAdded:Connect(function(p63) -- Line: 555
            if p63.Name == "Flinching" then
                GuiToggle(false);
            end;
        end);

        for _, v in pairs(u17) do
            pcall(function() -- Line: 562
                -- upvalues: v (copy)
                v[1]:Destroy();
            end);
            pcall(function() -- Line: 565
                -- upvalues: v (copy)
                v[2]:Destroy();
            end);
        end;

        u17 = {};
        task.wait(0.25);
        UpdateTeamTracking();

        if LocalPlayer:GetAttribute("IndependenceParticipating") then
            for _, v in pairs(CollectionService:GetTagged("IndependenceBillboards")) do
                if v and v.Parent then
                    v.Enabled = false;
                end;
            end;
        end;
    end;

    LocalPlayer.CharacterAdded:Connect(NewChar);

    if LocalPlayer.Character then
        NewChar(LocalPlayer.Character);
    end;
end;

function v1.new(p64) -- Line: 591
    -- upvalues: SetUp (copy), u6 (copy)
    SetUp();
    u6.Parent = p64;
end;

return v1;
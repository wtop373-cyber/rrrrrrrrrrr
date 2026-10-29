-- ============================================================
-- SCRIPT: TheGamesEvent
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface.Modules.TheGamesEvent
-- ============================================================

-- Decompiled with Potassium's decompiler.

local v1 = {};
local UserInputService = game:GetService("UserInputService");
game:GetService("RunService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local TweenService = game:GetService("TweenService");
local GamepadService = game:GetService("GamepadService");
local CollectionService = game:GetService("CollectionService");
ReplicatedStorage.Values:WaitForChild("SquidValues", 60);
local SquidValues = ReplicatedStorage.Values:FindFirstChild("SquidValues");

if not SquidValues then
    return {};
end;

local RemoteFunction = SquidValues.RemoteFunction;
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
local u2 = {
    toggle = Humanoid:LoadAnimation(ReplicatedStorage.Storage.Animations:WaitForChild("Toggle2"))
};
local u3 = ReplicatedStorage:WaitForChild("PlayerbaseData2", 100):WaitForChild(LocalPlayer.Name, 100);
ReplicatedStorage:WaitForChild("Events");
local Events2 = ReplicatedStorage:WaitForChild("Events2");
local UISounds = ReplicatedStorage:WaitForChild("Storage"):WaitForChild("UISounds");
local u4 = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("SquidDealers");
local u5 = ReplicatedStorage.Storage.GUIs:WaitForChild("TheGamesEventFrame"):Clone();
local EnlistFrame = u5.EnlistFrame;
local StartingFrame = u5.StartingFrame;
local CloseButton = EnlistFrame.TopBar.CloseButton;
local Cash = EnlistFrame.TopBar.Frame.Cash;
local AnswerMessage = EnlistFrame.AnswerMessage;
local u6 = false;
local u7 = false;
local u8 = 0;
local u9 = nil;
local u10 = nil;
local u11 = nil;
local u12 = nil;
local u13 = {};
local u14 = nil;
local u15 = false;
local u16 = false;

local function PositiveIntegerMask(p17) -- Line: 81
    return p17:gsub("[^%-%d]", "");
end;

local AddCommas = require(ReplicatedStorage:WaitForChild("NewModules").Shared.Extensions.AddCommas);

local function Convert(p18) -- Line: 87
    local function Format(p19) -- Line: 88
        return string.format("%02i", p19);
    end;

    local v20 = (p18 - p18 % 60) / 60;

    return string.format("%02i", v20) .. ":" .. string.format("%02i", p18 - v20 * 60);
end;

local function MessageHandler(p21, p22, p23) -- Line: 97
    -- upvalues: u8 (ref), AnswerMessage (copy), u9 (ref), u10 (ref)
    local v24 = p22 or "An error occured in your request";
    local math_random_ret = math.random();
    u8 = math_random_ret;
    AnswerMessage.Visible = true;

    if p21 == true then
        AnswerMessage.TextColor3 = Color3.new(0, 1, 0);
        AnswerMessage.T.TextColor3 = Color3.new(0, 1, 0);
    elseif p21 then
        AnswerMessage.TextColor3 = Color3.new(1, 1, 1);
        AnswerMessage.T.TextColor3 = Color3.new(1, 1, 1);
    else
        AnswerMessage.TextColor3 = Color3.new(1, 0, 0);
        AnswerMessage.T.TextColor3 = Color3.new(1, 0, 0);
    end;

    if v24 == u9 then
        u10 = u10 + 1;
        v24 = v24 .. " x" .. u10;
    else
        u9 = v24;
        u10 = 1;
    end;

    AnswerMessage.Text = v24;
    AnswerMessage.T.Text = v24;
    task.delay(p23 or 2.5, function() -- Line: 130
        -- upvalues: u8 (ref), math_random_ret (copy), AnswerMessage (ref)
        if u8 == math_random_ret then
            AnswerMessage.Visible = false;
            AnswerMessage.Text = "";
            AnswerMessage.T.Text = "";
        end;
    end);
end;

local function updtInpType(p25) -- Line: 139
    -- upvalues: CloseButton (copy), UserInputService (copy)
    if p25 ~= 2 then
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

local function UpdateGUI() -- Line: 154
    -- upvalues: LocalPlayer (copy), SquidValues (copy), EnlistFrame (copy), u15 (ref), StartingFrame (copy)
    local Attribute = LocalPlayer:GetAttribute("TheGamesParticipating");
    Color3.fromRGB(170, 255, 191);

    if SquidValues.GamesActive.Value == 0 then
        StartingFrame.Visible = false;

        if Attribute and SquidValues.RecruitingActive.Value then
            local Value = SquidValues.Timer.Value;

            local function _(p26) -- Line: 88
                return string.format("%02i", p26);
            end;

            local v27 = (Value - Value % 60) / 60;
            StartingFrame.TextLabel.Text = `EVENT COMMENCING: {string.format("%02i", v27) .. ":" .. string.format("%02i", Value - v27 * 60)}`;
            StartingFrame.Visible = true;
        end;

        EnlistFrame.Frame.Visible = false;
        EnlistFrame.Frame2.Visible = false;
    else
        if Attribute then
            EnlistFrame.Frame.Visible = false;
            EnlistFrame.Frame2.Visible = true;
        else
            EnlistFrame.Frame.Visible = true;
            EnlistFrame.Frame2.Visible = false;
            EnlistFrame.Frame.Button.TextButton.Visible = u15;
        end;

        StartingFrame.Visible = false;

        if Attribute and SquidValues.RecruitingActive.Value then
            local Value = SquidValues.Timer.Value;

            local function _(p28) -- Line: 88
                return string.format("%02i", p28);
            end;

            local v29 = (Value - Value % 60) / 60;
            StartingFrame.TextLabel.Text = `EVENT COMMENCING: {string.format("%02i", v29) .. ":" .. string.format("%02i", Value - v29 * 60)}`;
            StartingFrame.Visible = true;
        end;
    end;
end;

function GuiToggle(p30, u31)
    -- upvalues: u6 (ref), EnlistFrame (copy), UISounds (copy), UpdateGUI (copy), GamepadService (copy), CloseButton (copy), u15 (ref), EnlistBlur (ref), Humanoid (ref), u12 (ref), TweenService (copy), u14 (ref), Character (ref), HumanoidRootPart (ref)
    if p30 == u6 then
        return;
    end;

    for _, child in pairs(EnlistFrame.Frame.Boxes:GetChildren()) do
        if child:IsA("Frame") then
            child.Hover.Visible = false;
        end;
    end;

    if p30 then
        UISounds.open:Play();
        UpdateGUI();
        pcall(function() -- Line: 210
            -- upvalues: GamepadService (ref), CloseButton (ref)
            if _G.InputType == 2 then
                GamepadService:EnableGamepadCursor(CloseButton);
            end;
        end);

        if not u15 then
            EnlistFrame.WarnFrame.Continue.Visible = false;
            task.delay(2, function() -- Line: 218
                -- upvalues: EnlistFrame (ref)
                EnlistFrame.WarnFrame.Continue.Visible = true;
            end);
        end;

        EnlistFrame.Visible = true;
        pcall(function() -- Line: 225
            -- upvalues: EnlistBlur (ref)
            EnlistBlur:Cancel();
        end);
        Humanoid:UnequipTools();
        u12 = TweenService:Create(EnlistBlur, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = 10
        });

        if u31 then
            task.delay(0.1, function() -- Line: 232
                -- upvalues: u14 (ref), u31 (copy), u6 (ref), Character (ref), HumanoidRootPart (ref)
                u14 = u31.AncestryChanged:Connect(function(p32, p33) -- Line: 233
                    if not p33 then
                        GuiToggle(false);
                    end;
                end);

                while u6 do
                    task.wait(0.05);

                    if not _G.CheckIfCan(Character, "Any") or (HumanoidRootPart.Position - u31.Position).Magnitude > 6.5 then
                        GuiToggle(false);

                        return;
                    end;
                end;
            end);
        end;
    else
        pcall(function() -- Line: 248
            -- upvalues: u12 (ref)
            u12:Cancel();
        end);
        pcall(function() -- Line: 251
            -- upvalues: u14 (ref)
            if u14 then
                u14:Disconnect();
            end;

            u14 = nil;
        end);
        u12 = TweenService:Create(EnlistBlur, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Size = 0
        });
        UISounds.close:Play();
        EnlistFrame.Visible = false;
    end;

    u6 = p30;
end;

local function PlayGlobalSound(p34) -- Line: 266
    -- upvalues: SquidValues (copy)
    local v35 = SquidValues.Sounds:FindFirstChild(p34);

    if v35 then
        local TimeLength = v35.TimeLength;
        local v36 = v35:Clone();
        game.Debris:AddItem(v36, TimeLength + 5);
        v36.SoundGroup = nil;
        v36.Parent = workspace.Audio;
        v36:Play();
    end;
end;

local function SetUp() -- Line: 278
    -- upvalues: u4 (copy), u13 (copy), CollectionService (copy), EnlistFrame (copy), u16 (ref), u15 (ref), UpdateGUI (copy), u7 (ref), UISounds (copy), RemoteFunction (copy), MessageHandler (copy), PlayGlobalSound (copy), CloseButton (copy), u3 (copy), Cash (copy), AddCommas (copy), UserInputService (copy), u6 (ref), Events2 (copy), updtInpType (copy), LocalPlayer (copy), SquidValues (copy), Character (ref), Humanoid (ref), HumanoidRootPart (ref), u2 (ref), ReplicatedStorage (copy), u11 (ref)
    local function ProximitySetup(u37) -- Line: 279
        -- upvalues: u4 (ref), u13 (ref)
        if not u37:IsDescendantOf(u4) then
            return;
        end;

        table.insert(u13, u37);
        u37.Triggered:Connect(function(p38: userdata, ...) -- Line: 284
            -- upvalues: u37 (copy)
            GuiToggle(true, u37:FindFirstAncestorWhichIsA("BasePart"));
        end);
    end;

    if u4 then
        for _, v in pairs(CollectionService:GetTagged("ProximityPrompt")) do
            if v:IsDescendantOf(u4) then
                table.insert(u13, v);
                v.Triggered:Connect(function(p39: userdata, ...) -- Line: 284
                    -- upvalues: v (copy)
                    GuiToggle(true, v:FindFirstAncestorWhichIsA("BasePart"));
                end);
            end;
        end;

        CollectionService:GetInstanceAddedSignal("ProximityPrompt"):Connect(ProximitySetup);
    end;

    EnlistFrame.WarnFrame.Continue.MouseButton1Click:Connect(function() -- Line: 299
        -- upvalues: u16 (ref), EnlistFrame (ref), u15 (ref), UpdateGUI (ref)
        u16 = true;
        EnlistFrame.WarnFrame.Visible = false;
        u15 = true;
        task.spawn(UpdateGUI);
    end);
    EnlistFrame.Frame.Button.TextButton.MouseButton1Click:Connect(function() -- Line: 307
        -- upvalues: u16 (ref), u7 (ref), UISounds (ref), RemoteFunction (ref), MessageHandler (ref), UpdateGUI (ref)
        if not u16 then
            return;
        end;

        if u7 then
            return;
        end;

        UISounds.click:Play();
        u7 = true;
        local v40, v41 = RemoteFunction:InvokeServer("Register");

        if v40 then
            UISounds.purchase:Play();
            UISounds.BEEP:Play();
        end;

        MessageHandler(v40, v41, 2.5);
        UpdateGUI();
        task.wait(0.5);
        u7 = false;
    end);

    function RemoteFunction.OnClientInvoke(p42, p43, p44) -- Line: 335
        -- upvalues: PlayGlobalSound (ref)
        if p42 == "GlobalSound" then
            PlayGlobalSound(p43);
        end;
    end;

    EnlistFrame.Visible = false;
    CloseButton.MouseButton1Click:Connect(function() -- Line: 343
        GuiToggle(false);
    end);
    u3.Cash.Changed:Connect(function() -- Line: 347
        -- upvalues: Cash (ref), AddCommas (ref)
        Cash.Text = "$" .. AddCommas(_G.PlayerData.Bank);
    end);
    Cash.Text = "$" .. AddCommas(_G.PlayerData.Bank);
    UserInputService.InputBegan:Connect(function(p45, p46) -- Line: 354
        -- upvalues: u6 (ref)
        if p45.KeyCode == Enum.KeyCode.ButtonY and (not p46 and u6) then
            GuiToggle(false);
        end;
    end);
    Events2.InputTypeChanged.Event:Connect(updtInpType);
    updtInpType(_G.InputType);
    LocalPlayer:GetAttributeChangedSignal("TheGamesParticipating"):Connect(function() -- Line: 367
        -- upvalues: UpdateGUI (ref)
        UpdateGUI();
    end);
    SquidValues.Timer.Changed:Connect(UpdateGUI);
    SquidValues.RecruitingActive.Changed:Connect(UpdateGUI);
    UpdateGUI();

    local function NewChar(p47) -- Line: 376
        -- upvalues: Character (ref), Humanoid (ref), HumanoidRootPart (ref), u2 (ref), ReplicatedStorage (ref), u11 (ref), UpdateGUI (ref), LocalPlayer (ref), CollectionService (ref)
        Character = p47;
        Humanoid = Character:WaitForChild("Humanoid");
        HumanoidRootPart = Character:WaitForChild("HumanoidRootPart");
        u2 = {
            toggle = Humanoid:LoadAnimation(ReplicatedStorage.Storage.Animations:WaitForChild("Toggle2"))
        };
        u11 = _G.GVF();
        GuiToggle(false);
        Humanoid.Died:Once(function() -- Line: 385
            -- upvalues: UpdateGUI (ref)
            UpdateGUI();
            GuiToggle(false);
        end);
        u11.Currents.ChildAdded:Connect(function(p48) -- Line: 390
            if p48.Name == "Flinching" then
                GuiToggle(false);
            end;
        end);
        task.wait(0.25);

        if LocalPlayer:GetAttribute("TheGamesParticipating") then
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

function v1.new(p49) -- Line: 414
    -- upvalues: SetUp (copy), u5 (copy)
    local success, result = pcall(SetUp);

    if not success then
        warn("TheGamesEvent SetUp Error:", result);
    end;

    u5.Parent = p49;
end;

return v1;
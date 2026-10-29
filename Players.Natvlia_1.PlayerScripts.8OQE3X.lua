-- ============================================================
-- SCRIPT: 8OQE3X
-- CLASS:  LocalScript
-- PATH:   Players.Natvlia_1.PlayerScripts.8OQE3X
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
local UserInputService = game:GetService("UserInputService");
local ProximityPromptService = game:GetService("ProximityPromptService");
local TweenService = game:GetService("TweenService");
local TextService = game:GetService("TextService");
local Players = game:GetService("Players");
game:GetService("ReplicatedStorage");
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui");
local u2 = {
    [Enum.KeyCode.ButtonX] = "rbxasset://textures/ui/Controls/xboxX.png",
    [Enum.KeyCode.ButtonY] = "rbxasset://textures/ui/Controls/xboxY.png",
    [Enum.KeyCode.ButtonA] = "rbxasset://textures/ui/Controls/xboxA.png",
    [Enum.KeyCode.ButtonB] = "rbxasset://textures/ui/Controls/xboxB.png",
    [Enum.KeyCode.DPadLeft] = "rbxasset://textures/ui/Controls/dpadLeft.png",
    [Enum.KeyCode.DPadRight] = "rbxasset://textures/ui/Controls/dpadRight.png",
    [Enum.KeyCode.DPadUp] = "rbxasset://textures/ui/Controls/dpadUp.png",
    [Enum.KeyCode.DPadDown] = "rbxasset://textures/ui/Controls/dpadDown.png",
    [Enum.KeyCode.ButtonSelect] = "rbxasset://textures/ui/Controls/xboxmenu.png",
    [Enum.KeyCode.ButtonL1] = "rbxasset://textures/ui/Controls/xboxLS.png",
    [Enum.KeyCode.ButtonR1] = "rbxasset://textures/ui/Controls/xboxRS.png"
};
local u3 = {
    [Enum.KeyCode.Backspace] = "rbxasset://textures/ui/Controls/backspace.png",
    [Enum.KeyCode.Return] = "rbxasset://textures/ui/Controls/return.png",
    [Enum.KeyCode.LeftShift] = "rbxasset://textures/ui/Controls/shift.png",
    [Enum.KeyCode.RightShift] = "rbxasset://textures/ui/Controls/shift.png",
    [Enum.KeyCode.Tab] = "rbxasset://textures/ui/Controls/tab.png"
};
local u4 = {
    ["\'"] = "rbxasset://textures/ui/Controls/apostrophe.png",
    [","] = "rbxasset://textures/ui/Controls/comma.png",
    ["`"] = "rbxasset://textures/ui/Controls/graveaccent.png",
    ["."] = "rbxasset://textures/ui/Controls/period.png",
    [" "] = "rbxasset://textures/ui/Controls/spacebar.png"
};
local u5 = {
    [Enum.KeyCode.LeftControl] = "Ctrl",
    [Enum.KeyCode.RightControl] = "Ctrl",
    [Enum.KeyCode.LeftAlt] = "Alt",
    [Enum.KeyCode.RightAlt] = "Alt",
    [Enum.KeyCode.F1] = "F1",
    [Enum.KeyCode.F2] = "F2",
    [Enum.KeyCode.F3] = "F3",
    [Enum.KeyCode.F4] = "F4",
    [Enum.KeyCode.F5] = "F5",
    [Enum.KeyCode.F6] = "F6",
    [Enum.KeyCode.F7] = "F7",
    [Enum.KeyCode.F8] = "F8",
    [Enum.KeyCode.F9] = "F9",
    [Enum.KeyCode.F10] = "F10",
    [Enum.KeyCode.F11] = "F11",
    [Enum.KeyCode.F12] = "F12"
};

local function getScreenGui() -- Line: 63
    -- upvalues: PlayerGui (copy)
    local ProximityPrompts = PlayerGui:FindFirstChild("ProximityPrompts");

    if ProximityPrompts == nil then
        ProximityPrompts = Instance.new("ScreenGui");
        ProximityPrompts.Name = "ProximityPrompts";
        ProximityPrompts.ResetOnSpawn = false;
        ProximityPrompts.Parent = PlayerGui;
    end;

    return ProximityPrompts;
end;

local function createProgressBarGradient(p6, p7) -- Line: 74
    local Frame = Instance.new("Frame");
    Frame.Size = UDim2.fromScale(0.5, 1);
    Frame.Position = UDim2.fromScale(p7 and 0 or 0.5, 0);
    Frame.BackgroundTransparency = 1;
    Frame.ClipsDescendants = true;
    Frame.Parent = p6;
    local ImageLabel = Instance.new("ImageLabel");
    ImageLabel.BackgroundTransparency = 1;
    ImageLabel.Size = UDim2.fromScale(2, 1);
    ImageLabel.Position = UDim2.fromScale(p7 and 0 or -1, 0);
    ImageLabel.Image = "rbxasset://textures/ui/Controls/RadialFill.png";
    ImageLabel.Parent = Frame;
    local UIGradient = Instance.new("UIGradient");
    UIGradient.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.4999, 0),
        NumberSequenceKeypoint.new(0.5, 1),
        NumberSequenceKeypoint.new(1, 1)
    });
    UIGradient.Rotation = p7 and 180 or 0;
    UIGradient.Parent = ImageLabel;

    return UIGradient;
end;

local function createCircularProgressBar() -- Line: 102
    local Frame = Instance.new("Frame");
    Frame.Name = "CircularProgressBar";
    Frame.BorderSizePixel = 0;
    Frame.Size = UDim2.new(0, 0, 1, 0);
    Frame.AnchorPoint = Vector2.new(0, 0.5);
    Frame.Position = UDim2.new(0, 0, 0.5, 0);
    Frame.BackgroundTransparency = 0.5;
    local NumberValue = Instance.new("NumberValue");
    NumberValue.Name = "Progress";
    NumberValue.Parent = Frame;
    NumberValue.Changed:Connect(function(p8) -- Line: 136
        -- upvalues: Frame (copy)
        Frame.Size = UDim2.new(p8, 0, 1, 0);
    end);

    return Frame;
end;

local function createPrompt(u9, u10, p11) -- Line: 143
    -- upvalues: TweenService (copy), u2 (copy), UserInputService (copy), u3 (copy), u4 (copy), u5 (copy), createCircularProgressBar (copy), TextService (copy)
    local function checkIfAvailable() -- Line: 144
        -- upvalues: u9 (copy)
        if u9:GetAttribute("Busy") or u9:GetAttribute("Busy2") then
            return false, 1;
        end;

        if u9:GetAttribute("Unavailable") or u9:GetAttribute("Unavailable2") then
            return false, 2;
        end;

        return true;
    end;

    local u12 = {};
    local u13 = {};
    local u14 = {};
    local u15 = {};
    local TweenInfo_new_ret = TweenInfo.new(u9.HoldDuration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
    local TweenInfo_new_ret2 = TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local TweenInfo_new_ret3 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local TweenInfo_new_ret4 = TweenInfo.new(0.06, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
    local BillboardGui = Instance.new("BillboardGui");
    BillboardGui.Name = "Prompt";
    BillboardGui.AlwaysOnTop = true;
    local Frame = Instance.new("Frame");
    Frame.Size = UDim2.fromScale(0.5, 1);
    Frame.BackgroundTransparency = 1;
    Frame.BackgroundColor3 = Color3.new(0, 0, 0);
    Frame.Parent = BillboardGui;
    local UIStroke = Instance.new("UIStroke");
    UIStroke.Color = Color3.fromRGB(58, 58, 58);
    UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
    UIStroke.Thickness = 2;
    UIStroke.Transparency = 1;
    UIStroke.Parent = Frame;
    table.insert(u14, TweenService:Create(UIStroke, TweenInfo_new_ret3, {
        Transparency = 1
    }));
    table.insert(u15, TweenService:Create(UIStroke, TweenInfo_new_ret3, {
        Transparency = 0
    }));
    local Frame2 = Instance.new("Frame");
    Frame2.Name = "InputFrame";
    Frame2.Size = UDim2.fromScale(1, 1);
    Frame2.BackgroundTransparency = 1;
    Frame2.SizeConstraint = Enum.SizeConstraint.RelativeYY;
    Frame2.Parent = Frame;
    local Frame3 = Instance.new("Frame");
    Frame3.ZIndex = 3;
    Frame3.Size = UDim2.fromScale(1, 1);
    Frame3.Position = UDim2.fromScale(0.5, 0.5);
    Frame3.AnchorPoint = Vector2.new(0.5, 0.5);
    Frame3.BackgroundTransparency = 1;
    Frame3.Parent = Frame2;
    local UIScale = Instance.new("UIScale");
    UIScale.Parent = Frame3;
    local _ = u10 == Enum.ProximityPromptInputType.Touch;
    table.insert(u12, TweenService:Create(UIScale, TweenInfo_new_ret3, {
        Scale = 1
    }));
    table.insert(u13, TweenService:Create(UIScale, TweenInfo_new_ret3, {
        Scale = 1
    }));
    local TextLabel = Instance.new("TextLabel");
    TextLabel.Name = "ActionText";
    TextLabel.Size = UDim2.fromScale(1, 1);
    TextLabel.Font = Enum.Font.GothamSemibold;
    TextLabel.TextSize = 19;
    TextLabel.BackgroundTransparency = 1;
    TextLabel.TextTransparency = 1;
    TextLabel.TextColor3 = Color3.new(1, 1, 1);
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
    TextLabel.ZIndex = 5;
    TextLabel.Parent = Frame;
    table.insert(u12, TweenService:Create(TextLabel, TweenInfo_new_ret3, {
        TextTransparency = 1
    }));
    table.insert(u13, TweenService:Create(TextLabel, TweenInfo_new_ret3, {
        TextTransparency = 0
    }));
    table.insert(u14, TweenService:Create(TextLabel, TweenInfo_new_ret3, {
        TextTransparency = 1
    }));
    table.insert(u15, TweenService:Create(TextLabel, TweenInfo_new_ret3, {
        TextTransparency = 0
    }));
    local TextLabel2 = Instance.new("TextLabel");
    TextLabel2.Name = "ObjectText";
    TextLabel2.Size = UDim2.fromScale(1, 1);
    TextLabel2.Font = Enum.Font.GothamSemibold;
    TextLabel2.TextSize = 14;
    TextLabel2.BackgroundTransparency = 1;
    TextLabel2.TextTransparency = 1;
    TextLabel2.TextColor3 = Color3.new(0.7, 0.7, 0.7);
    TextLabel2.TextXAlignment = Enum.TextXAlignment.Left;
    TextLabel2.ZIndex = 5;
    TextLabel2.Parent = Frame;
    table.insert(u12, TweenService:Create(TextLabel2, TweenInfo_new_ret3, {
        TextTransparency = 1
    }));
    table.insert(u13, TweenService:Create(TextLabel2, TweenInfo_new_ret3, {
        TextTransparency = 0
    }));
    table.insert(u14, TweenService:Create(TextLabel2, TweenInfo_new_ret3, {
        TextTransparency = 1
    }));
    table.insert(u15, TweenService:Create(TextLabel2, TweenInfo_new_ret3, {
        TextTransparency = 0
    }));
    local v16 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.5, 1)
    };
    table.insert(u14, TweenService:Create(Frame, TweenInfo_new_ret3, v16));
    local v17 = {
        BackgroundTransparency = 0.2,
        Size = UDim2.fromScale(1, 1)
    };
    table.insert(u15, TweenService:Create(Frame, TweenInfo_new_ret3, v17));
    local Frame4 = Instance.new("Frame");
    Frame4.Name = "RoundFrame";
    Frame4.Visible = true;
    Frame4.Size = UDim2.fromOffset(48, 48);
    Frame4.AnchorPoint = Vector2.new(0.5, 0.5);
    Frame4.Position = UDim2.fromScale(0.5, 0.5);
    Frame4.BackgroundTransparency = 1;
    Frame4.BackgroundColor3 = Color3.new(0, 0, 0);
    Frame4.Parent = Frame3;
    local u18 = nil;
    local v19 = nil;
    local u20 = nil;

    if u10 == Enum.ProximityPromptInputType.Gamepad then
        if u2[u9.GamepadKeyCode] then
            u20 = Instance.new("ImageLabel");
            u20.Name = "ButtonImage";
            u20.AnchorPoint = Vector2.new(0.5, 0.5);
            u20.Size = UDim2.new(0.8, 0, 0.8, 0);
            u20.ScaleType = Enum.ScaleType.Fit;
            u20.Position = UDim2.fromScale(0.5, 0.5);
            u20.BackgroundTransparency = 1;
            u20.ImageTransparency = 1;
            u20.Image = UserInputService:GetImageForKeyCode(u9.GamepadKeyCode) or "";
            u20.ZIndex = 5;
            u20.Parent = Frame3;
            table.insert(u14, TweenService:Create(u20, TweenInfo_new_ret4, {
                ImageTransparency = 1
            }));
            table.insert(u15, TweenService:Create(u20, TweenInfo_new_ret4, {
                ImageTransparency = 0
            }));
        end;
    elseif u10 == Enum.ProximityPromptInputType.Touch then
        u20 = Instance.new("ImageLabel");
        u20.Name = "ButtonImage";
        u20.BackgroundTransparency = 1;
        u20.ImageTransparency = 1;
        u20.Size = UDim2.new(0.8, 0, 0.8, 0);
        u20.ScaleType = Enum.ScaleType.Fit;
        u20.AnchorPoint = Vector2.new(0.5, 0.5);
        u20.Position = UDim2.fromScale(0.5, 0.5);
        u20.Image = "rbxasset://textures/ui/Controls/TouchTapIcon.png";
        u20.ZIndex = 5;
        u20.Parent = Frame3;
        table.insert(u14, TweenService:Create(u20, TweenInfo_new_ret4, {
            ImageTransparency = 1
        }));
        table.insert(u15, TweenService:Create(u20, TweenInfo_new_ret4, {
            ImageTransparency = 0
        }));
    else
        u20 = Instance.new("ImageLabel");
        u20.Name = "ButtonImage";
        u20.BackgroundTransparency = 1;
        u20.ImageTransparency = 1;
        u20.Size = UDim2.new(0.8, 0, 0.8, 0);
        u20.ScaleType = Enum.ScaleType.Fit;
        u20.AnchorPoint = Vector2.new(0.5, 0.5);
        u20.Position = UDim2.fromScale(0.5, 0.5);
        u20.Image = "rbxasset://textures/ui/Controls/key_single.png";
        u20.ZIndex = 5;
        u20.Parent = Frame3;
        table.insert(u14, TweenService:Create(u20, TweenInfo_new_ret4, {
            ImageTransparency = 1
        }));
        local StringForKeyCode = UserInputService:GetStringForKeyCode(u9.KeyboardKeyCode);
        local v21 = u3[u9.KeyboardKeyCode];

        if v21 == nil then
            v21 = u4[StringForKeyCode];
        end;

        if v21 == nil then
            StringForKeyCode = u5[u9.KeyboardKeyCode] or StringForKeyCode;
        end;

        if v21 then
            v19 = Instance.new("ImageLabel");
            v19.Name = "ButtonImage";
            v19.AnchorPoint = Vector2.new(0.5, 0.5);
            v19.Size = UDim2.fromOffset(36, 36);
            v19.Position = UDim2.fromScale(0.5, 0.5);
            v19.BackgroundTransparency = 1;
            v19.ImageTransparency = 1;
            v19.Image = v21;
            v19.ZIndex = 5;
            v19.Parent = Frame3;
            table.insert(u14, TweenService:Create(v19, TweenInfo_new_ret4, {
                ImageTransparency = 1
            }));
        elseif StringForKeyCode == nil or StringForKeyCode == "" then
            error("ProximityPrompt \'" .. u9.Name .. "\' has an unsupported keycode for rendering UI: " .. tostring(u9.KeyboardKeyCode));
        else
            u18 = Instance.new("TextLabel");
            u18.Name = "ButtonText";
            u18.Position = UDim2.fromOffset(0, -1);
            u18.Size = UDim2.fromScale(1, 1);
            u18.Font = Enum.Font.GothamSemibold;
            u18.TextSize = 30;
            u18.ZIndex = 5;
            u18.BackgroundTransparency = 1;
            u18.TextTransparency = 1;
            u18.TextColor3 = Color3.new(1, 1, 1);
            u18.TextXAlignment = Enum.TextXAlignment.Center;
            u18.Text = StringForKeyCode;
            u18.Parent = Frame3;
            table.insert(u14, TweenService:Create(u18, TweenInfo_new_ret4, {
                TextTransparency = 1
            }));
            table.insert(u15, TweenService:Create(u18, TweenInfo_new_ret4, {
                TextTransparency = 0
            }));
        end;
    end;

    if u10 == Enum.ProximityPromptInputType.Touch or u9.ClickablePrompt then
        local TextButton = Instance.new("TextButton");
        TextButton.BackgroundTransparency = 1;
        TextButton.TextTransparency = 1;
        TextButton.Size = UDim2.fromScale(1, 1);
        TextButton.Parent = BillboardGui;
        local u22 = false;

        if v19 then
            table.insert(u15, TweenService:Create(v19, TweenInfo_new_ret4, {
                ImageTransparency = 0
            }));
        end;

        TextButton.InputBegan:Connect(function(p23) -- Line: 393
            -- upvalues: u9 (copy), u22 (ref)
            if (p23.UserInputType == Enum.UserInputType.Touch or p23.UserInputType == Enum.UserInputType.MouseButton1) and p23.UserInputState ~= Enum.UserInputState.Change then
                u9:InputHoldBegin();
                u22 = true;
            end;
        end);
        TextButton.InputEnded:Connect(function(p24) -- Line: 400
            -- upvalues: u22 (ref), u9 (copy)
            if (p24.UserInputType == Enum.UserInputType.Touch or p24.UserInputType == Enum.UserInputType.MouseButton1) and u22 then
                u22 = false;
                u9:InputHoldEnd();
            end;
        end);
        BillboardGui.Active = true;
    end;

    if u9.HoldDuration > 0 then
        local v25 = createCircularProgressBar();
        v25.Parent = Frame;
        table.insert(u12, TweenService:Create(v25.Progress, TweenInfo_new_ret, {
            Value = 1
        }));
        table.insert(u13, TweenService:Create(v25.Progress, TweenInfo_new_ret2, {
            Value = 0
        }));
    end;

    local u26, u27;

    if u9.HoldDuration > 0 then
        u26 = u9.PromptButtonHoldBegan:Connect(function() -- Line: 425
            -- upvalues: u9 (copy), u12 (copy)
            local v28;

            if u9:GetAttribute("Busy") or u9:GetAttribute("Busy2") then
                v28 = false;
            else
                v28 = not (u9:GetAttribute("Unavailable") or u9:GetAttribute("Unavailable2"));
            end;

            if not v28 then
                return;
            end;

            for _, v in ipairs(u12) do
                v:Play();
            end;
        end);
        u27 = u9.PromptButtonHoldEnded:Connect(function() -- Line: 433
            -- upvalues: u9 (copy), u13 (copy)
            local v29;

            if u9:GetAttribute("Busy") or u9:GetAttribute("Busy2") then
                v29 = false;
            else
                v29 = not (u9:GetAttribute("Unavailable") or u9:GetAttribute("Unavailable2"));
            end;

            if not v29 then
                return;
            end;

            for _, v in ipairs(u13) do
                v:Play();
            end;
        end);
    else
        u26 = nil;
        u27 = nil;
    end;

    local u31 = u9.Triggered:Connect(function() -- Line: 442
        -- upvalues: u9 (copy), u14 (copy)
        local v30;

        if u9:GetAttribute("Busy") or u9:GetAttribute("Busy2") then
            v30 = false;
        else
            v30 = not (u9:GetAttribute("Unavailable") or u9:GetAttribute("Unavailable2"));
        end;

        if not v30 then
            return;
        end;

        for _, v in ipairs(u14) do
            v:Play();
        end;
    end);
    local u33 = u9.TriggerEnded:Connect(function() -- Line: 450
        -- upvalues: u9 (copy), u15 (copy)
        local v32;

        if u9:GetAttribute("Busy") or u9:GetAttribute("Busy2") then
            v32 = false;
        else
            v32 = not (u9:GetAttribute("Unavailable") or u9:GetAttribute("Unavailable2"));
        end;

        if not v32 then
            return;
        end;

        for _, v in ipairs(u15) do
            v:Play();
        end;
    end);

    local function updateUIFromPrompt() -- Line: 458
        -- upvalues: TextService (ref), u9 (copy), TextLabel (copy), TextLabel2 (copy), u18 (ref), u20 (ref), u10 (copy), BillboardGui (copy)
        local TextSize = TextService:GetTextSize(u9.ActionText, 19, Enum.Font.GothamSemibold, Vector2.new(1000, 1000));
        local TextSize2 = TextService:GetTextSize(u9.ObjectText, 14, Enum.Font.GothamSemibold, Vector2.new(1000, 1000));
        local math_max_ret = math.max(TextSize.X, TextSize2.X);
        local v34 = (u9.ActionText == nil or u9.ActionText == "") and (u9.ObjectText == nil or u9.ObjectText == "") and 72 or math_max_ret + 72 + 24;
        TextLabel.Position = UDim2.new(0.5, 72 - v34 / 2, 0, (u9.ObjectText == nil or u9.ObjectText == "") and 0 or 9);
        TextLabel2.Position = UDim2.new(0.5, 72 - v34 / 2, 0, -10);
        TextLabel.Text = u9.ActionText;
        TextLabel2.Text = u9.ObjectText;
        TextLabel.AutoLocalize = u9.AutoLocalize;
        TextLabel.RootLocalizationTable = u9.RootLocalizationTable;
        TextLabel2.AutoLocalize = u9.AutoLocalize;
        TextLabel2.RootLocalizationTable = u9.RootLocalizationTable;

        if not (u9:GetAttribute("Busy") or u9:GetAttribute("Busy2")) then
            local _ = u9:GetAttribute("Unavailable") or u9:GetAttribute("Unavailable2");
        end;

        local Attribute = u9:GetAttribute("Color3");
        local v35 = typeof(Attribute) == "Color3" and Attribute and Attribute or Color3.new(1, 1, 1);

        if u18 then
            u18.TextColor3 = v35;
        end;

        if u20 then
            u20.ImageColor3 = v35;
        end;

        local v36 = 0.4;
        local v37 = 15;

        if u10 == Enum.ProximityPromptInputType.Touch then
            v36 = v36 * 1.5;
            v37 = v37 * 1.5;
        end;

        BillboardGui.Size = UDim2.new(v36, v37, v36, v37);
        BillboardGui.SizeOffset = Vector2.new(u9.UIOffset.X / BillboardGui.Size.Width.Offset, u9.UIOffset.Y / BillboardGui.Size.Height.Offset);
    end;

    local u38 = u9.Changed:Connect(updateUIFromPrompt);
    local u39 = u9.AttributeChanged:Connect(updateUIFromPrompt);
    updateUIFromPrompt();
    BillboardGui.Adornee = u9.Parent;
    BillboardGui.Parent = p11;

    for _, v in ipairs(u15) do
        v:Play();
    end;

    return function() -- Line: 540, Name: cleanup
        -- upvalues: u26 (ref), u27 (ref), u31 (ref), u33 (ref), u38 (copy), u39 (copy), u14 (copy), BillboardGui (copy)
        if u26 then
            u26:Disconnect();
        end;

        if u27 then
            u27:Disconnect();
        end;

        u31:Disconnect();
        u33:Disconnect();
        u38:Disconnect();
        u39:Disconnect();

        for _, v in ipairs(u14) do
            v:Play();
        end;

        wait(0.2);
        BillboardGui:Destroy();
    end;
end;

local function onLoad() -- Line: 566
    -- upvalues: ProximityPromptService (copy), PlayerGui (copy), createPrompt (copy)
    ProximityPromptService.PromptShown:Connect(function(p40, p41) -- Line: 567
        -- upvalues: PlayerGui (ref), createPrompt (ref)
        if p40.Style == Enum.ProximityPromptStyle.Default then
            return;
        end;

        local ProximityPrompts = PlayerGui:FindFirstChild("ProximityPrompts");

        if ProximityPrompts == nil then
            ProximityPrompts = Instance.new("ScreenGui");
            ProximityPrompts.Name = "ProximityPrompts";
            ProximityPrompts.ResetOnSpawn = false;
            ProximityPrompts.Parent = PlayerGui;
        end;

        local v42 = createPrompt(p40, p41, ProximityPrompts);
        p40.PromptHidden:Wait();
        v42();
    end);
end;

ProximityPromptService.PromptShown:Connect(function(p43, p44) -- Line: 567
    -- upvalues: PlayerGui (copy), createPrompt (copy)
    if p43.Style == Enum.ProximityPromptStyle.Default then
        return;
    end;

    local ProximityPrompts = PlayerGui:FindFirstChild("ProximityPrompts");

    if ProximityPrompts == nil then
        ProximityPrompts = Instance.new("ScreenGui");
        ProximityPrompts.Name = "ProximityPrompts";
        ProximityPrompts.ResetOnSpawn = false;
        ProximityPrompts.Parent = PlayerGui;
    end;

    local v45 = createPrompt(p43, p44, ProximityPrompts);
    p43.PromptHidden:Wait();
    v45();
end);
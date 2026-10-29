-- ============================================================
-- SCRIPT: MobileControls
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.MobileControls
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
local u2 = {};
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local GuiService = game:GetService("GuiService");
local UserInputService = game:GetService("UserInputService");
local LocalPlayer = game:GetService("Players").LocalPlayer;
ReplicatedStorage:WaitForChild("Events2");
u2.ButtonStates = {};
u2.EnabledButtons = {};
local u3 = {};

local function FireToggle(p4, p5) -- Line: 18
    -- upvalues: u2 (copy)
    u2.InputEvent:Fire(p4, p5);
end;

function u2.FireToggle(...) -- Line: 22
    -- upvalues: u2 (copy)
    local v6, v7 = ...;
    u2.InputEvent:Fire(v6, v7);
end;

function u2.CheckButtonState(p8) -- Line: 26
    -- upvalues: u2 (copy)
    return u2.ButtonStates[p8];
end;

function u2.RenameButton(p9, p10) -- Line: 30
    -- upvalues: u2 (copy)
    if u2.Buttons[p9] then
        u2.Buttons[p9].button.Text = string.upper((tostring(p10)));

        return;
    end;

    warn("No mobile button for", p9, "(?)");
end;

function u2.ToggleButton(p11, p12, p13, p14) -- Line: 42
    -- upvalues: u2 (copy)
    if not u2.Buttons then
        return;
    end;

    local v15 = p12 ~= nil and p12 ~= false and true or p12;

    if not u2.Buttons[p11] then
        warn("No mobile button for", p11, "(?)");

        return;
    end;

    local v16 = u2.Buttons[p11];
    local button = v16.button;

    if v15 then
        if not p14 then
            u2.InputEvent:Fire(p11, true);
        end;

        if v16.isImageButton then
            button.ImageLabel.ImageColor3 = Color3.fromRGB(96, 178, 255);
        else
            button.TextColor3 = Color3.fromRGB(96, 178, 255);
        end;

        button.UIStroke.Color = Color3.fromRGB(96, 178, 255);
    else
        if not p14 then
            u2.InputEvent:Fire(p11, false);
        end;

        if v16.isImageButton then
            button.ImageLabel.ImageColor3 = Color3.new(1, 1, 1);
        else
            button.TextColor3 = Color3.new(1, 1, 1);
        end;

        button.UIStroke.Color = Color3.fromRGB(58, 58, 58);
    end;

    if p13 or v15 == false then
        u2.ButtonStates[p11] = v15;
    end;
end;

local function ReleaseHeld() -- Line: 90
    -- upvalues: u3 (copy), u2 (copy)
    for i in pairs(u3) do
        u3[i] = nil;
        local v17 = u2.Buttons and u2.Buttons[i];

        if v17 and not v17.isToggle then
            u2.ToggleButton(i, false);
        end;
    end;
end;

function u2.EnableButton(u18, u19, u20) -- Line: 100
    -- upvalues: u2 (copy)
    if not u2.Buttons or u2.EnabledButtons[u18] == u19 then
        return;
    end;

    pcall(function() -- Line: 104
        -- upvalues: u2 (ref), u18 (copy), u19 (ref), u20 (copy)
        if not u2.Buttons then
            return;
        end;

        if u2.EnabledButtons[u18] == u19 then
            return;
        end;

        if u19 ~= nil and u19 ~= false then
            u19 = true;
        end;

        u2.EnabledButtons[u18] = u19;

        if not u2.Buttons[u18] then
            warn("No mobile button for", u18, "(?)");

            return;
        end;

        local button = u2.Buttons[u18].button;

        if u19 then
            button.Visible = true;

            return;
        end;

        button.Visible = false;

        if not u20 and u2.ButtonStates[u18] == true then
            u2.ToggleButton(u18, false);
        end;
    end);
end;

function u2.UntoggleAll() -- Line: 138
    -- upvalues: u2 (copy)
    if not u2.Buttons then
        return;
    end;

    for i, _ in pairs(u2.Buttons) do
        u2.ToggleButton(i, false);
    end;
end;

function u2.DiedFunction() -- Line: 148
    -- upvalues: u2 (copy), u3 (copy)
    u2.ded = true;

    if not u2.ready then
        return;
    end;

    table.clear(u3);
    u2.touchFrame.Visible = false;
    u2.EnableButton("firstperson", false);
    u2.UntoggleAll();
    u2.DiedEvent:Fire(true);
end;

function u2.NewCharacterFunction() -- Line: 160
    -- upvalues: u2 (copy)
    u2.ded = false;

    if not u2.ready then
        return;
    end;

    u2.EnableButton("thermal", false);
    u2.EnableButton("flashlight", false);
    u2.touchFrame.LaserEyes.Visible = false;
    u2.EnableButton("firstperson", true);
    u2.touchFrame.Visible = true;
    u2.DiedEvent:Fire(false);
end;

function u2.ToggleGUI(p21) -- Line: 174
    -- upvalues: u2 (copy), ReleaseHeld (copy)
    u2.GuiOpen = p21;

    if not u2.GUI or u2.GUI.Enabled == p21 then
        return;
    end;

    u2.GUI.Enabled = p21;

    if not p21 then
        ReleaseHeld();
    end;
end;

function u2.DoSetUp() -- Line: 185
    -- upvalues: u2 (copy), u3 (copy), GuiService (copy), ReleaseHeld (copy), UserInputService (copy), ReplicatedStorage (copy), LocalPlayer (copy)
    if u2.setup then
        return;
    end;

    u2.setup = true;
    local u22 = u3;

    local function handleInput(u23, u24) -- Line: 191
        -- upvalues: u2 (ref), u22 (copy)
        local v25 = u2.Buttons[u23];
        local button = v25.button;
        v25.isToggle = u24;
        u22[u23] = nil;
        button.InputBegan:connect(function(p26) -- Line: 200
            -- upvalues: button (copy), u22 (ref), u23 (copy), u2 (ref), u24 (copy)
            if not button.Visible then
                return;
            end;

            local v27 = u22[u23];

            if v27 and (v27.UserInputState == Enum.UserInputState.End or v27.UserInputState == Enum.UserInputState.Cancel) then
                u22[u23] = nil;
            end;

            if u22[u23] or (p26.UserInputType ~= Enum.UserInputType.Touch or p26.UserInputState ~= Enum.UserInputState.Begin) then
                return;
            end;

            u22[u23] = p26;
            u2.ToggleButton(u23, not u2.ButtonStates[u23], u24);
        end);
        button.InputEnded:connect(function(p28: userdata) -- Line: 218
            -- upvalues: u22 (ref), u23 (copy), u24 (copy), u2 (ref)
            if p28 == u22[u23] then
                u22[u23] = nil;

                if not u24 then
                    u2.ToggleButton(u23, false);
                end;
            end;
        end);
    end;

    GuiService.MenuOpened:Connect(ReleaseHeld);
    UserInputService.WindowFocusReleased:Connect(ReleaseHeld);
    UserInputService.TouchEnded:Connect(function(p29) -- Line: 231
        -- upvalues: u22 (copy), u2 (ref)
        for i, v in pairs(u22) do
            if v == p29 then
                u22[i] = nil;

                if not u2.Buttons[i].isToggle then
                    u2.ToggleButton(i, false);
                end;
            end;
        end;
    end);
    u2.GUI = ReplicatedStorage:WaitForChild("Storage").GUIs.MobileButtonGUI:Clone();
    u2.GUI.Parent = LocalPlayer.PlayerGui;
    u2.touchFrame = u2.GUI:WaitForChild("TouchControlFrame");
    u2.InputEvent = Instance.new("BindableEvent");
    u2.DiedEvent = Instance.new("BindableEvent");
    u2.Buttons = {
        sprint = {
            button = u2.touchFrame.SprintButton
        },
        crouch = {
            button = u2.touchFrame.CrouchButton
        },
        jump = {
            button = u2.touchFrame.JumpButton
        },
        melee_attack = {
            button = u2.touchFrame.Melee.AttackButton
        },
        melee_attack2 = {
            button = u2.touchFrame.Melee.LeftFrame.Attack2Button
        },
        melee_block = {
            button = u2.touchFrame.Melee.BlockButton
        },
        melee_break = {
            button = u2.touchFrame.Melee.BreakButton
        },
        melee_finish = {
            button = u2.touchFrame.Melee.FinishButton
        },
        melee_revive = {
            button = u2.touchFrame.Melee.ReviveButton
        },
        melee_bodypickup = {
            button = u2.touchFrame.Melee.PickupButton
        },
        melee_bodydrop = {
            button = u2.touchFrame.Melee.DropButton
        },
        melee_bodythrow = {
            button = u2.touchFrame.Melee.ThrowButton
        },
        melee_inspect = {
            button = u2.touchFrame.Melee.LeftFrame.InspectButton
        },
        melee_snowball = {
            button = u2.touchFrame.Melee.SnowballButton
        },
        gun_fire = {
            button = u2.touchFrame.Gun.FireButton
        },
        gun_fire2 = {
            button = u2.touchFrame.Gun.LeftFrame.Fire2Button
        },
        gun_reload = {
            button = u2.touchFrame.Gun.ReloadButton
        },
        gun_aim = {
            button = u2.touchFrame.Gun.AimButton
        },
        gun_firemode = {
            button = u2.touchFrame.Gun.LeftFrame.FiremodeButton
        },
        gun_holster = {
            button = u2.touchFrame.Gun.LeftFrame.HolsterButton
        },
        gun_inspect = {
            button = u2.touchFrame.Gun.LeftFrame.InspectButton
        },
        gun_laser = {
            button = u2.touchFrame.Gun.LeftFrame.LaserButton
        },
        gun_bt = {
            button = u2.touchFrame.Gun.LeftFrame.BulletTypeButton
        },
        throwable_throw = {
            button = u2.touchFrame.Throwable.ThrowButton
        },
        fire2 = {
            button = u2.touchFrame.SecondaryFireButton
        },
        flashlight = {
            button = u2.touchFrame.Top.FlashlightButton
        },
        thermal = {
            button = u2.touchFrame.Top.ThermalButton
        },
        use = {
            button = u2.touchFrame.UseButton
        },
        use2 = {
            button = u2.touchFrame.UseButton2
        },
        inspect = {
            button = u2.touchFrame.InspectButton
        },
        charge = {
            button = u2.touchFrame.ChargeButton
        },
        drop_item = {
            button = u2.touchFrame.DropButton
        },
        firstperson = {
            button = u2.touchFrame.CamButton
        },
        backpack = {
            isImageButton = true,
            button = u2.touchFrame.BackpackButton
        },
        lv_fire = {
            button = u2.touchFrame.LaserEyes.FireButton
        },
        lv_fire2 = {
            button = u2.touchFrame.LaserEyes.Fire2Button
        },
        lv_eyes = {
            button = u2.touchFrame.LaserEyes.EyesButton
        },
        killer_select = {
            button = u2.touchFrame.Killer.SelectButton
        }
    };
    handleInput("sprint", true);
    handleInput("crouch", true);
    handleInput("jump", false);
    handleInput("melee_attack", false);
    handleInput("melee_attack2", false);
    handleInput("melee_block", true);
    handleInput("melee_break", false);
    handleInput("melee_finish", false);
    handleInput("melee_revive", true);
    handleInput("melee_bodypickup", false);
    handleInput("melee_bodythrow", false);
    handleInput("melee_bodydrop", false);
    handleInput("melee_inspect", true);
    handleInput("melee_snowball", false);
    handleInput("gun_fire", false);
    handleInput("gun_fire2", false);
    handleInput("gun_reload", false);
    handleInput("gun_aim", true);
    handleInput("gun_firemode", false);
    handleInput("gun_holster", false);
    handleInput("gun_inspect", true);
    handleInput("gun_laser", true);
    handleInput("gun_bt", false);
    handleInput("throwable_throw", false);
    handleInput("fire2", false);
    handleInput("flashlight", true);
    handleInput("thermal", true);
    handleInput("use", true);
    handleInput("use2", true);
    handleInput("inspect", false);
    handleInput("drop_item", false);
    handleInput("firstperson", true);
    handleInput("backpack", true);
    handleInput("lv_eyes", true);
    handleInput("lv_fire", false);
    handleInput("lv_fire2", false);
    handleInput("killer_select", false);
    handleInput("charge", false);
    u2.ready = true;

    if u2.ded == false then
        u2.NewCharacterFunction();
    end;
end;

return u2;
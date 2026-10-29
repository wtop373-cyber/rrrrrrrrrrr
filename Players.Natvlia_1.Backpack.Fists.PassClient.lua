-- ============================================================
-- SCRIPT: PassClient
-- CLASS:  LocalScript
-- PATH:   Players.Natvlia_1.Backpack.Fists.PassClient
-- ============================================================

-- Decompiled with Potassium's decompiler.

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local UserInputService = game:GetService("UserInputService");
local Players = game:GetService("Players");
local RunService = game:GetService("RunService");
local NewModules = ReplicatedStorage:WaitForChild("NewModules");

repeat
    wait(0.1);
until _G.GVF and (_G.WaitForChar and _G.GVF());

_G.GVF();
_G.WaitForChar();
local LocalPlayer = Players.LocalPlayer;
local u1 = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait();
local Humanoid = u1:WaitForChild("Humanoid");
local HumanoidRootPart = u1:WaitForChild("HumanoidRootPart");
local PAZ_TA = ReplicatedStorage:WaitForChild("Events"):WaitForChild("PAZ_TA");
local MobileControls = require(NewModules.Client.Services.MobileControls);
local script_Parent = script.Parent;
local PassConfig = require(script_Parent:WaitForChild("PassConfig"));
script_Parent:FindFirstChild(PassConfig.HandleName);
local u2 = false;
local u3 = false;
local u4 = false;
local u5 = false;

if PassConfig.Enabled then
    script_Parent:SetAttribute("canDrop", true);
end;

script_Parent.Equipped:Connect(function() -- Line: 40
    -- upvalues: u3 (ref), RunService (copy), u2 (ref)
    u3 = true;
    RunService.Heartbeat:Wait();

    if u3 then
        u2 = true;
    end;
end);
script_Parent.Unequipped:Connect(function() -- Line: 47
    -- upvalues: u3 (ref), RunService (copy), u2 (ref)
    u3 = false;
    RunService.Heartbeat:Wait();

    if not u3 then
        u2 = false;
    end;
end);

function RayFunc(p6, p7, p8, p9)
    local Ray_new_ret = Ray.new(p6, (p7 - p6).Unit * p8);
    local v10, v11 = workspace:FindPartOnRayWithIgnoreList(Ray_new_ret, p9, true);

    if not (v10 and v10.Parent) or (not v10:IsDescendantOf(workspace.Characters) or v10.Name == "HumanoidRootPart") and (v10:IsDescendantOf(workspace.Characters) or v10:IsDescendantOf(workspace.Map)) then
        return v10, v11;
    end;

    table.insert(p9, v10);

    return RayFunc(p6, p7, p8, p9);
end;

local function Lerp(p12, p13, p14) -- Line: 68
    return p12 + (p13 - p12) * p14;
end;

function TryDrop()
    -- upvalues: ReplicatedStorage (copy)
    if _G.GSettings and _G.GSettings.ToolDropping or not _G.GSettings then
        return true;
    end;

    ReplicatedStorage.Events2.Notification:Fire(
        {
            Title = "Dropping disabled",
            Text = "This action must be enabled in the settings",
            Duration = 2
        },
        "lost"
    );

    return false;
end;

function TryPass()
    -- upvalues: script_Parent (copy), u1 (copy), u2 (ref), LocalPlayer (copy), u4 (ref), HumanoidRootPart (copy), PAZ_TA (copy)
    if script_Parent:GetAttribute("BayoDropLocked") or u1:GetAttribute("BayonetCharging") then
        return;
    end;

    if u2 and (script_Parent.Parent == u1 and (LocalPlayer.Character == u1 and (_G.CheckIfCan() and not _G.CheckIfFlinching()))) then
        if u4 then
            return;
        end;

        local os_clock_ret = os.clock();

        if _G.ItemDropTime and os_clock_ret - _G.ItemDropTime < 0.35 then
            return;
        end;

        _G.ItemDropTime = os_clock_ret;

        if not u4 then
            u4 = true;

            if TryDrop() then
                local v15 = _G.YLookVecNUM or 0;
                local LookVector = HumanoidRootPart.CFrame.LookVector;
                local Velocity = HumanoidRootPart.Velocity;
                local Vector3_new_ret = Vector3.new(Velocity.X * 0.5, Velocity.Y * 0.5, Velocity.Z * 0.5);
                local v16 = 1 - math.abs(v15);
                local v17 = LookVector * 30 * v16 + LookVector * (0 + 0 * (1 - (v15 - 0.5))) + Vector3_new_ret + Vector3.new(0, 20 + v15 * 30, 0);
                _G.AffectChar("B", 0.2);
                PAZ_TA:FireServer(script_Parent, nil, v17, nil, nil);
            end;

            wait(0.35);
            u4 = false;
        end;
    end;
end;

local function mobileDrop() -- Line: 166
    -- upvalues: u5 (ref), script_Parent (copy), u1 (copy), ReplicatedStorage (copy), LocalPlayer (copy), u2 (ref), Humanoid (copy)
    if u5 or (script_Parent:GetAttribute("BayoDropLocked") or u1:GetAttribute("BayonetCharging")) then
        return;
    end;

    local v18 = tick();
    u5 = true;
    local v19 = ReplicatedStorage.Storage.GUIs.GBarGUI:Clone();
    game.Debris:AddItem(v19, 1);
    v19:WaitForChild("Frame").Msg.Text = "DROPPING ITEM...";
    v19.Frame.Size = UDim2.new(0.1, 100, 0.025, 15);
    v19.Parent = LocalPlayer.PlayerGui;
    v19.Frame.Bar.InnerBar:TweenSize(UDim2.new(1, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 1, true);

    while u5 and (u2 and (Humanoid.Health > 0 and (_G.CheckIfCan() and not (_G.CheckIfFlinching() or (script_Parent:GetAttribute("BayoDropLocked") or (u1:GetAttribute("BayonetCharging") or tick() - v18 >= 1)))))) do
        wait(0.1);
    end;

    if v19 and v19.Parent then
        v19:Destroy();
    end;

    if tick() - v18 >= 1 then
        TryPass();
    end;

    u5 = false;
end;

local u20 = 0;
UserInputService.InputBegan:Connect(function(p21, p22) -- Line: 202
    -- upvalues: u20 (ref)
    if p22 then
        return;
    end;

    if p21.KeyCode == Enum.KeyCode.Backspace then
        TryPass();

        return;
    end;

    if p21.KeyCode == Enum.KeyCode.DPadDown then
        if tick() - u20 < 0.2 then
            u20 = 0;
            TryPass();

            return;
        end;

        u20 = tick();
    end;
end);
npCon4 = MobileControls.InputEvent.Event:Connect(function(p23, p24) -- Line: 218
    -- upvalues: u2 (ref), mobileDrop (copy), u5 (ref)
    if not u2 then
        return;
    end;

    if p23 == "drop_item" then
        if p24 then
            mobileDrop();

            return;
        end;

        u5 = false;
    end;
end);
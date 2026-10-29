-- ============================================================
-- SCRIPT: TurnEffect
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.TurnEffect
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
local u2 = {};
u2.__index = u2;
game:GetService("RunService");
local NewModules = game:GetService("ReplicatedStorage"):WaitForChild("NewModules");
require(NewModules.Shared.Services.SmoothValue);
local workspace_CurrentCamera = workspace.CurrentCamera;

local function CanSeeCheck(p3) -- Line: 16
    -- upvalues: workspace_CurrentCamera (copy)
    local _, v4 = workspace_CurrentCamera:WorldToScreenPoint(p3);

    return v4;
end;

function u2.Stop(p5) -- Line: 22
    p5.smoothValue = 0;

    if p5.rJ and p5.rJ.Parent then
        p5.rJ.C0 = p5.original;
        p5.rJ:SetAttribute("TurnEffectAngle", nil);
    end;
end;

local function lerp(p6, p7, p8) -- Line: 32
    return p6 + (p7 - p6) * p8;
end;

function u2.New(p9, p10, p11, p12) -- Line: 36
    -- upvalues: u2 (copy)
    local u13 = {
        dir = nil,
        vel = nil,
        angle = 0,
        angle2 = 0,
        smoothValue = 0,
        smoothValue2 = 0,
        char = p9,
        hum = p10,
        root = p11
    };
    local v14 = p11 and p11:WaitForChild("RootJoint");
    u13.rJ = v14;
    u13.original = u13.rJ and u13.rJ.C0;
    u13.isClient = p12;
    local u15 = nil;
    local u16 = nil;
    local u17 = false;

    local function disconnect() -- Line: 62
        -- upvalues: u17 (ref), u13 (ref), u15 (ref), u16 (ref)
        if u17 then
            return;
        end;

        u17 = true;
        u13.setup = false;
        pcall(function() -- Line: 70
            -- upvalues: u15 (ref)
            u15:Disconnect();
        end);
        pcall(function() -- Line: 73
            -- upvalues: u16 (ref)
            u16:Disconnect();
        end);
        pcall(function() -- Line: 76
            -- upvalues: u13 (ref)
            u13:Stop();
        end);
        u13 = {};
        u13 = nil;
    end;

    u15 = p10.Died:Once(disconnect);
    u16 = p9.AncestryChanged:Connect(function(p18, p19) -- Line: 84
        -- upvalues: disconnect (copy)
        if not p19 then
            disconnect();
        end;
    end);
    u13.setup = true;

    return setmetatable(u13, u2);
end;

function u2.Update(p20, p21) -- Line: 95
    -- upvalues: workspace_CurrentCamera (copy)
    if not p20.isClient then
        local _, v22 = workspace_CurrentCamera:WorldToScreenPoint(p20.root.Position);

        if not v22 then
            return;
        end;
    end;

    if not (p20.rJ and p20.root) then
        return;
    end;

    p20.vel = p20.root.Velocity * Vector3.new(1, 0, 1);
    local Magnitude = p20.vel.Magnitude;
    p20.dir = p20.vel.Unit;
    p20.lastMag = Magnitude;

    if Magnitude > 1 and not (_G.DownedCheck(p20.char) or _G.RagdollCheck(p20.char)) then
        p20.angle = p20.root.CFrame.RightVector:Dot(p20.dir) * 0.1;
        p20.angle2 = p20.root.CFrame.LookVector:Dot(p20.dir) * 0.125;

        if p20.hum.WalkSpeed < 16 then
            p20.angle = p20.angle * (p20.hum.WalkSpeed / 16);
            p20.angle2 = p20.angle2 * (p20.hum.WalkSpeed / 16);
        end;
    else
        p20.angle = 0;
        p20.angle2 = 0;
    end;

    local _ = math.floor(p20.smoothValue * 1000) / 1000 == -0.001;
    local Magnitude2 = (p20.root.Position - workspace.CurrentCamera.CFrame.Position).Magnitude;
    local math_min_ret = math.min(p21 * 10, 1);
    local v23 = not p20.isClient and Magnitude2 > 250 and 1 or math_min_ret;
    local smoothValue = p20.smoothValue;
    p20.smoothValue = smoothValue + (p20.angle2 - smoothValue) * v23;
    local smoothValue2 = p20.smoothValue2;
    p20.smoothValue2 = smoothValue2 + (p20.angle - smoothValue2) * v23;
    local CFrame_Angles_ret = CFrame.Angles(math.min(p20.smoothValue, 0), -p20.smoothValue2, 0);
    p20.rJ.C0 = p20.original * CFrame_Angles_ret;

    if p20.smoothValue > 0 then
        p20.smoothValue = -p20.smoothValue;
    end;

    p20.rJ:SetAttribute("TurnEffectAngle", p20.smoothValue);
end;

return u2;
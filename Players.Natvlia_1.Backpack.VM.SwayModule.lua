-- ============================================================
-- SCRIPT: SwayModule
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.Backpack.VM.SwayModule
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
local u2 = {};
game:GetService("ReplicatedStorage");
local TweenService = game:GetService("TweenService");
local RunService = game:GetService("RunService");
local Players = game:GetService("Players");
local NumberValue = Instance.new("NumberValue", script);
local math_cos = math.cos;
local _ = math.sin;
local u3 = 0;
local CFrame_new = CFrame.new;
local CFrame_Angles = CFrame.Angles;
local u4 = CFrame_new(0, 0, 0);
local math_min = math.min;
local math_deg = math.deg;
local _ = math.max;
local math_abs = math.abs;
local math_rad = math.rad;
local math_asin = math.asin;
local math_atan2 = math.atan2;
local l_tick = tick;
local _ = os;

local function lerp(p5, p6, p7) -- Line: 44
    return p5 + (p6 - p5) * p7;
end;

local HumanoidRootPart = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart");
local Humanoid = HumanoidRootPart.Parent:WaitForChild("Humanoid");
local u8 = _G.GVF and _G.GVF();
local u9 = 0;
local u10 = 0;
local u11 = { 0, 0 };
local workspace_CurrentCamera = workspace.CurrentCamera;
Vector3.new();
local u12 = 0;
local u13 = 0;
local RenderStepped = RunService.RenderStepped;
local CFrame_new_ret = CFrame.new(0, 0, 0);
local u14 = {};
local u15 = CFrame_new();
local u16 = CFrame_new();
local u17 = 0;

local function clerp(p18, p19, p20) -- Line: 77
    local Components, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31 = p18:GetComponents();
    local Components2, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42 = p19:GetComponents();

    return CFrame.new(Components + (Components2 - Components) * p20, v21 + (v32 - v21) * p20, v22 + (v33 - v22) * p20, v23 + (v34 - v23) * p20, v24 + (v35 - v24) * p20, v25 + (v36 - v25) * p20, v26 + (v37 - v26) * p20, v27 + (v38 - v27) * p20, v28 + (v39 - v28) * p20, v29 + (v40 - v29) * p20, v30 + (v41 - v30) * p20, v31 + (v42 - v31) * p20);
end;

local function gspraycf_f(p43) -- Line: 83
    local _ = (_G.P23893189418293 or 60) > 30;
    local X = p43.X;
    local Y = p43.Y;
    local Z = p43.Z;
    local v44, v45, v46 = p43:ToEulerAnglesXYZ();

    return CFrame.new(X * 1 * 1, Y, Z) * CFrame.fromEulerAnglesXYZ(v44 * 1, v45 * 1, v46 * 1);
end;

RenderStepped:Connect(function(p47) -- Line: 103
    -- upvalues: workspace_CurrentCamera (copy), math_abs (copy), math_asin (copy), math_deg (copy), CFrame_new (copy), math_atan2 (copy), u9 (ref), u10 (ref), u14 (copy), gspraycf_f (copy), u11 (copy), math_min (copy), u12 (ref), u13 (ref), HumanoidRootPart (copy), u3 (ref), u2 (copy), l_tick (copy), u17 (ref), CFrame_Angles (copy), u8 (copy), CFrame_new_ret (ref), clerp (copy), u4 (copy), Humanoid (copy), math_cos (copy), math_rad (copy), u16 (ref), u15 (ref)
    local Magnitude = workspace_CurrentCamera.CoordinateFrame.lookVector.Magnitude;
    local y = workspace_CurrentCamera.CoordinateFrame.LookVector.y;
    local v48 = y == 0 and 0 or math_deg((math_asin(math_abs(y) / (Magnitude == 0 and 0.0001 or Magnitude)))) * (math_abs(y) / y);
    local CoordinateFrame = workspace_CurrentCamera.CoordinateFrame;
    local v49 = CoordinateFrame * CFrame_new(0, 0, -100);
    local v50 = math_deg((math_atan2(CoordinateFrame.p.x - v49.p.x, CoordinateFrame.p.z - v49.p.z))) + 180;
    local v51 = math_abs(v48 - u9);
    local v52 = v51 == 0 and 0 or (v48 - u9) / v51;
    local v53 = math_abs(v50 - u10);
    local v54 = 360 - v53;
    local v55;

    if v50 == u10 then
        v55 = 0;
        v53 = 0;
    elseif v53 < v54 then
        v55 = (v50 - u10) / v53;
    elseif v50 < u10 then
        v53 = v54;
        v55 = 1;
    else
        v53 = v54;
        v55 = -1;
    end;

    local v56 = CFrame_new();

    for i = #u14, 1, -1 do
        local v57;

        if time() > u14[i][2] then
            table.remove(u14, i);
            v57 = i;
        else
            v57 = i;
        end;
    end;

    for _, v in ipairs(u14) do
        v56 = v56 * v[1];
    end;

    local v58 = gspraycf_f(v56);
    local v59 = CFrame_new();
    u9 = v48;
    u10 = v50;
    u11[1] = u11[1] / 8.5 * p47;
    u11[2] = u11[2] / 8.5 * p47;
    local v60 = v51 * v52 * 0.25;

    if v60 ~= 0 then
        u11[1] = u11[1] + math_min(2, (math_abs(v60))) * (v60 / math_abs(v60));
    end;

    local v61 = v53 * v55 * 0.25;

    if v61 ~= 0 then
        u11[2] = u11[2] + math_min(2, (math_abs(v61))) * (v61 / math_abs(v61));
    end;

    if u11[1] ~= 0 then
        u11[1] = math_min(10, (math_abs(u11[1]))) * (math_abs(u11[1]) / u11[1]);
    end;

    if u11[2] ~= 0 then
        u11[2] = math_min(10, (math_abs(u11[2]))) * (math_abs(u11[2]) / u11[2]);
    end;

    local v62 = u12;
    u12 = v62 + (u11[2] - v62) * 0.4;
    local v63 = u13;
    u13 = v63 + (u11[1] - v63) * 0.4;
    local math_min_ret = math.min(HumanoidRootPart.Velocity.Magnitude, 50);

    if HumanoidRootPart and HumanoidRootPart.Parent then
        u3 = u3 + (0.1 + math_min_ret * 7.5) * p47;
    end;

    local state = u2.state;

    if state == Enum.HumanoidStateType.Landed or l_tick() - u17 < 0.05 then
        if state == Enum.HumanoidStateType.Landed then
            u17 = l_tick();
        end;

        v59 = CFrame_new(0, -0.1, 0) * CFrame_Angles(-0.06981317007977318, 0, 0);
    end;

    local v64 = 1;

    if u8 and (u8.Parent and (u8:FindFirstChild("Crouching") and u8.Crouching.Value)) then
        v64 = v64 * 0.25;
    end;

    if HumanoidRootPart and (HumanoidRootPart.Parent and math_min_ret > 1) then
        if state == Enum.HumanoidStateType.Freefall or state == Enum.HumanoidStateType.Jumping then
            v59 = CFrame_new(0, u2.adsing and -0.05 or 0, 0) * CFrame_Angles(0.026179938779914945, 0, 0);
            CFrame_new_ret = clerp(CFrame_new_ret, u4, 4.8 * p47);
        elseif Humanoid.MoveDirection.Magnitude > 0.1 then
            CFrame_new_ret = clerp(CFrame_new_ret, CFrame_new(0, math_cos(u3 / 7) * -20 * 0.016666666666666666 * v64, 0) * CFrame.Angles(0, math_rad(v64 * 600 * 0.016666666666666666) * math_cos(u3 / 14), math_rad(v64 * 400 * 0.016666666666666666) * math_cos(u3 / 14)), 3 * p47);
        end;
    else
        CFrame_new_ret = clerp(CFrame_new_ret, u4, 4.8 * p47);
    end;

    u16 = clerp(u16, v58, 12 * p47);
    u15 = clerp(u15, v59, 12 * p47);
end);
u2.DoWalkCF = false;

function u2.ToggleWalkCF(p65, p66) -- Line: 233
    -- upvalues: u2 (copy), TweenService (copy), NumberValue (copy)
    if p65 ~= u2.DoWalkCF then
        TweenService:Create(NumberValue, TweenInfo.new(p66, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
            Value = p65 and 1 or 0
        }):Play();
    end;

    u2.DoWalkCF = p65;
end;

function u2.GetSwayCF(p67) -- Line: 241
    -- upvalues: CFrame_Angles (copy), u13 (ref), math_rad (copy), u12 (ref)
    return CFrame_Angles(-math_rad(u13) * p67, -math_rad(u12) * p67, math_rad(u12 / 2) * p67);
end;

function u2.GetWalkCF(p68) -- Line: 246
    -- upvalues: clerp (copy), CFrame_new_ret (ref), u4 (copy), NumberValue (copy), u15 (ref)
    return clerp(CFrame_new_ret, u4, p68 * NumberValue.Value) * u15;
end;

function u2.GetSprayCF(p69) -- Line: 250
    -- upvalues: u16 (ref)
    return u16;
end;

function u2.SprayLerp(p70, p71, p72, p73) -- Line: 253
    -- upvalues: CFrame_new (copy), math_rad (copy), CFrame_Angles (copy), u14 (copy)
    local v74 = p70[1];
    local v75 = p70[2];
    local v76 = p70[3];
    local v77 = CFrame_new();
    local v78 = CFrame_new();
    local v79 = CFrame_new();

    if p72 then
        if v74 > 0 then
            v77 = math_rad(math.random(-v74 * 1000, v74 * 1000) / 1000);
        end;

        if v75 > 0 then
            v78 = math_rad(math.random(1, v75 * 1000) / 1000);
        end;

        if v76 > 0 then
            v79 = math_rad(math.random(-v76 * 1000, v76 * 1000) / 1000);
        end;
    else
        v77 = math_rad(v74);
        v78 = math_rad(v75);
        v79 = math_rad(v76);
    end;

    local v80 = CFrame_Angles(v78, v77, v79);

    if p73 then
        v80:Lerp(CFrame.new(), p73);
    end;

    local v81 = { v80, time() + p71 };
    table.insert(u14, v81);
end;

return u2;
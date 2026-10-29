-- ============================================================
-- SCRIPT: Glance
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Moments.Glance
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");
local RunService = game:GetService("RunService");
local GuiService = game:GetService("GuiService");
local Kit = script.Parent:WaitForChild("Kit", 5);

if not Kit then
    return {};
end;

local u1 = require(Kit);
local v2 = {};
local LocalPlayer = Players.LocalPlayer;
local Random_new_ret = Random.new();
local u3 = false;
local u4 = nil;
local u5 = nil;
local u6 = (-1 / 0);

local function watch(p7) -- Line: 30
    -- upvalues: u5 (ref), u6 (ref)
    if u5 == p7 then
        return;
    end;

    u5 = p7;
    local Health = p7.Health;
    p7.HealthChanged:Connect(function(p8) -- Line: 36
        -- upvalues: Health (ref), u6 (ref)
        if p8 < Health then
            u6 = os.clock();
        end;

        Health = p8;
    end);
end;

local function ready() -- Line: 44
    -- upvalues: LocalPlayer (copy), u5 (ref), u6 (ref), GuiService (copy)
    local Character = LocalPlayer.Character;
    local v9;

    if Character then
        v9 = Character:FindFirstChildOfClass("Humanoid");
    else
        v9 = Character;
    end;

    local v10;

    if Character then
        v10 = Character:FindFirstChild("HumanoidRootPart");
    else
        v10 = Character;
    end;

    if not (v9 and (v10 and v9.Health > 0)) then
        return;
    end;

    if u5 ~= v9 then
        u5 = v9;
        local Health = v9.Health;
        v9.HealthChanged:Connect(function(p11) -- Line: 36
            -- upvalues: Health (ref), u6 (ref)
            if p11 < Health then
                u6 = os.clock();
            end;

            Health = p11;
        end);
    end;

    if os.clock() - u6 < 30 then
        return;
    end;

    if _G.CheckIfCan and not _G.CheckIfCan(nil, "Any") then
        return;
    end;

    if _G.InCombatCheck and _G.InCombatCheck(LocalPlayer, true) then
        return;
    end;

    if _G.Shop_Active or GuiService.MenuIsOpen then
        return;
    end;

    local workspace_CurrentCamera = workspace.CurrentCamera;

    if not workspace_CurrentCamera or workspace_CurrentCamera.CameraType ~= Enum.CameraType.Custom then
        return;
    end;

    local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui");

    if not (PlayerGui and PlayerGui:FindFirstChild("Intro")) then
        return v9, Character, v10, workspace_CurrentCamera;
    end;
end;

local function place(p12, p13, p14) -- Line: 75
    local CFrame2 = p14.CFrame;
    local v15 = -CFrame2.LookVector;
    local Vector3_new_ret = Vector3.new(v15.X, 0, v15.Z);

    if Vector3_new_ret.Magnitude < 0.2 then
        return;
    end;

    local Unit = Vector3_new_ret.Unit;
    local RaycastParams_new_ret = RaycastParams.new();
    RaycastParams_new_ret.FilterType = Enum.RaycastFilterType.Exclude;
    RaycastParams_new_ret.FilterDescendantsInstances = { p12, p14 };
    local Position = CFrame2.Position;
    local v16 = workspace:Raycast(Position, Unit * 5.5, RaycastParams_new_ret);
    local v17;

    if v16 then
        v17 = (v16.Position - Position).Magnitude - 1.5;

        if v17 < 2.5 then
            return;
        end;
    else
        v17 = 4;
    end;

    local v18 = Position + Unit * v17;
    local v19 = workspace:Raycast(v18 + Vector3.new(0, 2, 0), Vector3.new(0, -14, 0), RaycastParams_new_ret);

    if not v19 then
        return;
    end;

    local v20 = v19.Position.Y + 3;

    if math.abs(v20 - p13.Position.Y) > 6 then
        return;
    end;

    local CFrame_lookAt_ret = CFrame.lookAt(Vector3.new(v18.X, v20, v18.Z), (Vector3.new(Position.X, v20, Position.Z)));
    local OverlapParams_new_ret = OverlapParams.new();
    OverlapParams_new_ret.FilterType = Enum.RaycastFilterType.Exclude;
    OverlapParams_new_ret.FilterDescendantsInstances = { p12, p14 };
    OverlapParams_new_ret.RespectCanCollide = true;

    if #workspace:GetPartBoundsInBox(CFrame_lookAt_ret + Vector3.new(0, 0.4, 0), Vector3.new(1.8, 4.4, 0.8), OverlapParams_new_ret) <= 0 then
        return CFrame_lookAt_ret;
    end;
end;

local function need(p21, p22) -- Line: 115
    local v23 = p22:WorldToViewportPoint(p21.Position);
    local ViewportSize = p22.ViewportSize;
    local math_abs_ret = math.abs(v23.X / ViewportSize.X - 0.5);
    local math_abs_ret2 = math.abs(v23.Y / ViewportSize.Y - 0.5);
    local v24 = math.max(math_abs_ret, math_abs_ret2) * 2;

    return math.clamp(v24, 0, 1) * 0.9 + 0.1;
end;

local function show(u25, u26, p27, u28) -- Line: 122
    -- upvalues: place (copy), u1 (copy), u3 (ref), RunService (copy)
    local v29 = place(u26, p27, u28);
    local u30;

    if v29 then
        u30 = u1.Figure();
    else
        u30 = v29;
    end;

    if not u30 then
        return false;
    end;

    u3 = true;
    u30:PivotTo(v29);
    u30.Parent = u28;
    local u31 = u30:FindFirstChild("GhostCurse") or u30.PrimaryPart;
    local os_clock_ret = os.clock();
    local u32 = false;
    local u33 = 0;
    local u34 = nil;
    u34 = RunService.RenderStepped:Connect(function(p35) -- Line: 136
        -- upvalues: u32 (ref), u30 (copy), u25 (copy), os_clock_ret (copy), u1 (ref), u31 (copy), u28 (copy), u26 (copy), u33 (ref), u34 (ref), u3 (ref)
        if u32 then
            return;
        end;

        local v36 = not u30.Parent or (u25.Health <= 0 and true or os.clock() - os_clock_ret > 30);
        local v37 = false;

        if not v36 and os.clock() - os_clock_ret > 0.3 then
            local success, result = pcall(u1.Visible, u31, u28, { u26 });
            v36 = not success;

            if success and result then
                local math_min_ret = math.min(p35, 0.1);
                local v38 = u28;
                local v39 = v38:WorldToViewportPoint(u31.Position);
                local ViewportSize = v38.ViewportSize;
                local math_abs_ret = math.abs(v39.X / ViewportSize.X - 0.5);
                local math_abs_ret2 = math.abs(v39.Y / ViewportSize.Y - 0.5);
                local v40 = math.max(math_abs_ret, math_abs_ret2) * 2;
                u33 = u33 + math_min_ret / (math.clamp(v40, 0, 1) * 0.9 + 0.1);

                if u33 >= 1 then
                    v37 = true;
                else
                    v37 = false;
                end;
            end;
        end;

        if v36 or v37 then
            u32 = true;
            u34:Disconnect();

            if v37 then
                pcall(u1.Flash, 0.12);
            end;

            u30:Destroy();
            u3 = false;
        end;
    end);

    return true;
end;

local function try(p41) -- Line: 163
    -- upvalues: u3 (ref), ready (copy), u4 (ref), show (copy)
    if u3 then
        return;
    end;

    local os_clock_ret = os.clock();

    while os.clock() - os_clock_ret < 60 do
        local v42, v43, v44, v45 = ready();

        if v42 and (p41 or u4 ~= v42) and not u3 then
            local success, result = pcall(show, v42, v43, v44, v45);

            if success then
                if result then
                    u4 = v42;

                    return;
                end;
            else
                u3 = false;
            end;
        end;

        task.wait(1);
    end;
end;

function v2.Start() -- Line: 183
    -- upvalues: u3 (ref), Random_new_ret (copy), try (copy)
    while true do
        repeat
            task.wait(300);
        until not u3 and Random_new_ret:NextInteger(1, 40) == 1;

        pcall(try, false);
    end;
end;

function v2.Force() -- Line: 192
    -- upvalues: try (copy)
    pcall(try, true);
end;

return v2;
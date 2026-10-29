-- ============================================================
-- SCRIPT: Seasonal
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Seasonal
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local Workspace = game:GetService("Workspace");
local HttpService = game:GetService("HttpService");
local CollectionService = game:GetService("CollectionService");
local LocalPlayer = Players.LocalPlayer;
local Color3_fromRGB_ret = Color3.fromRGB(120, 190, 255);
local Color3_fromRGB_ret2 = Color3.fromRGB(230, 230, 230);

local function setBoardActive(p1, p2) -- Line: 16
    local ScrollingFrame = p1:FindFirstChild("ScrollingFrame");
    local InactiveFrame = p1:FindFirstChild("InactiveFrame");

    if ScrollingFrame then
        ScrollingFrame.Visible = p2;
    end;

    if InactiveFrame then
        InactiveFrame.Visible = not p2;
    end;
end;

local function clearEntries(p3, p4) -- Line: 28
    for _, child in ipairs(p3:GetChildren()) do
        if child:IsA("TextLabel") and child ~= p4 then
            child:Destroy();
        end;
    end;
end;

local function fmtCountdown(p5) -- Line: 36
    if p5 <= 0 then
        return "now";
    end;

    local math_floor_ret = math.floor(p5 / 60);

    if math_floor_ret < 60 then
        return math_floor_ret .. "m";
    end;

    return math.floor(math_floor_ret / 60) .. "h";
end;

local function ordinalSuffix(p6) -- Line: 48
    local v7 = p6 % 100;

    if v7 >= 11 and v7 <= 13 then
        return "th";
    end;

    local v8 = p6 % 10;

    return v8 == 1 and "st" or (v8 == 2 and "nd" or (v8 == 3 and "rd" or "th"));
end;

local function localMidnightUnix(p9) -- Line: 60
    local os_date_ret = os.date("*t", p9);
    os_date_ret.hour = 0;
    os_date_ret.min = 0;
    os_date_ret.sec = 0;

    return os.time(os_date_ret);
end;

local function dayDiffLocal(p10, p11) -- Line: 66
    local os_date_ret = os.date("*t", p10);
    os_date_ret.hour = 0;
    os_date_ret.min = 0;
    os_date_ret.sec = 0;
    local os_time_ret = os.time(os_date_ret);
    local os_date_ret2 = os.date("*t", p11);
    os_date_ret2.hour = 0;
    os_date_ret2.min = 0;
    os_date_ret2.sec = 0;
    local v12 = (os.time(os_date_ret2) - os_time_ret) / 86400;

    return math.floor(v12);
end;

local function pad2(p13) -- Line: 72
    return p13 < 10 and "0" .. p13 or tostring(p13);
end;

local function timeStringLocal(p14) -- Line: 76
    local os_date_ret = os.date("*t", p14);
    local hour = os_date_ret.hour;
    local min = os_date_ret.min;
    local v15 = hour % 12;

    return string.format("%d:%s %s", v15 == 0 and 12 or v15, min < 10 and "0" .. min or tostring(min), hour >= 12 and "PM" or "AM");
end;

local function weekdayShort(p16) -- Line: 88
    return os.date("%a", p16);
end;

local function dateLabelLocal(p17) -- Line: 92
    local day = os.date("*t", p17).day;
    local string_format = string.format;
    local os_date_ret = os.date("%a", p17);
    local v18 = day % 100;
    local v19;

    if v18 >= 11 and v18 <= 13 then
        v19 = "th";
    else
        local v20 = day % 10;
        v19 = v20 == 1 and "st" or (v20 == 2 and "nd" or (v20 == 3 and "rd" or "th"));
    end;

    return string_format("%s %d%s", os_date_ret, day, v19);
end;

local function rightSideLabel(p21, p22, p23) -- Line: 98
    local os_date_ret = os.date("*t", p21);
    os_date_ret.hour = 0;
    os_date_ret.min = 0;
    os_date_ret.sec = 0;
    local os_time_ret = os.time(os_date_ret);
    local os_date_ret2 = os.date("*t", p22);
    os_date_ret2.hour = 0;
    os_date_ret2.min = 0;
    os_date_ret2.sec = 0;
    local v24 = (os.time(os_date_ret2) - os_time_ret) / 86400;
    local math_floor_ret = math.floor(v24);

    if math_floor_ret == 0 then
        local v25;

        if p23 <= 0 then
            v25 = "now";
        else
            local math_floor_ret2 = math.floor(p23 / 60);

            if math_floor_ret2 < 60 then
                v25 = math_floor_ret2 .. "m";
            else
                v25 = math.floor(math_floor_ret2 / 60) .. "h";
            end;
        end;

        return "today (" .. v25 .. ")";
    end;

    if math_floor_ret == 1 then
        local v26;

        if p23 <= 0 then
            v26 = "now";
        else
            local math_floor_ret2 = math.floor(p23 / 60);

            if math_floor_ret2 < 60 then
                v26 = math_floor_ret2 .. "m";
            else
                v26 = math.floor(math_floor_ret2 / 60) .. "h";
            end;
        end;

        return "tomorrow (" .. v26 .. ")";
    end;

    local day = os.date("*t", p22).day;
    local string_format = string.format;
    local os_date_ret3 = os.date("%a", p22);
    local v27 = day % 100;
    local v28;

    if v27 >= 11 and v27 <= 13 then
        v28 = "th";
    else
        local v29 = day % 10;
        v28 = v29 == 1 and "st" or (v29 == 2 and "nd" or (v29 == 3 and "rd" or "th"));
    end;

    local v30 = string_format("%s %d%s", os_date_ret3, day, v28);
    local v31;

    if p23 <= 0 then
        v31 = "now";
    else
        local math_floor_ret2 = math.floor(p23 / 60);

        if math_floor_ret2 < 60 then
            v31 = math_floor_ret2 .. "m";
        else
            v31 = math.floor(math_floor_ret2 / 60) .. "h";
        end;
    end;

    return v30 .. " (" .. v31 .. ")";
end;

local function render(p32) -- Line: 109
    -- upvalues: ReplicatedStorage (copy), clearEntries (copy), HttpService (copy), timeStringLocal (copy), Color3_fromRGB_ret (copy), rightSideLabel (copy), Color3_fromRGB_ret2 (copy)
    local v33;

    if p32 then
        v33 = p32:IsA("SurfaceGui");
    else
        v33 = p32;
    end;

    assert(v33, "Renderer.Render requires a SurfaceGui");
    local ScrollingFrame = p32:FindFirstChild("ScrollingFrame");
    local InactiveFrame = p32:FindFirstChild("InactiveFrame");

    if not (ScrollingFrame and ScrollingFrame:IsA("ScrollingFrame")) then
        error("BillboardGui must contain a ScrollingFrame");
    end;

    if not (InactiveFrame and InactiveFrame:IsA("Frame")) then
        error("BillboardGui must contain an InactiveFrame (Frame)");
    end;

    local EntryTemplate = script:FindFirstChild("EntryTemplate");

    if not (EntryTemplate and EntryTemplate:IsA("TextLabel")) then
        error("Script must contain a TextLabel named EntryTemplate");
    end;

    local Attribute = ReplicatedStorage:GetAttribute("GivingHourScheduleJson");

    if type(Attribute) ~= "string" or Attribute == "" then
        clearEntries(ScrollingFrame, EntryTemplate);
        local ScrollingFrame2 = p32:FindFirstChild("ScrollingFrame");
        local InactiveFrame2 = p32:FindFirstChild("InactiveFrame");

        if ScrollingFrame2 then
            ScrollingFrame2.Visible = false;
        end;

        if InactiveFrame2 then
            InactiveFrame2.Visible = true;
        end;

        return;
    end;

    local success, result = pcall(function() -- Line: 134
        -- upvalues: HttpService (ref), Attribute (copy)
        return HttpService:JSONDecode(Attribute);
    end);

    if not (success and (type(result) == "table" and type(result.times) == "table")) then
        clearEntries(ScrollingFrame, EntryTemplate);
        local ScrollingFrame2 = p32:FindFirstChild("ScrollingFrame");
        local InactiveFrame2 = p32:FindFirstChild("InactiveFrame");

        if ScrollingFrame2 then
            ScrollingFrame2.Visible = false;
        end;

        if InactiveFrame2 then
            InactiveFrame2.Visible = true;
        end;

        return;
    end;

    local os_time_ret = os.time();
    local v34 = {};

    for _, v in ipairs(result.times) do
        if type(v) == "number" and os_time_ret < v then
            table.insert(v34, v);
        end;
    end;

    if #v34 == 0 then
        clearEntries(ScrollingFrame, EntryTemplate);
        local ScrollingFrame2 = p32:FindFirstChild("ScrollingFrame");
        local InactiveFrame2 = p32:FindFirstChild("InactiveFrame");

        if ScrollingFrame2 then
            ScrollingFrame2.Visible = false;
        end;

        if InactiveFrame2 then
            InactiveFrame2.Visible = true;
        end;

        return;
    end;

    table.sort(v34);
    local ScrollingFrame2 = p32:FindFirstChild("ScrollingFrame");
    local InactiveFrame2 = p32:FindFirstChild("InactiveFrame");

    if ScrollingFrame2 then
        ScrollingFrame2.Visible = true;
    end;

    if InactiveFrame2 then
        InactiveFrame2.Visible = false;
    end;

    clearEntries(ScrollingFrame, EntryTemplate);
    local v35 = false;

    for _, v in ipairs(v34) do
        local v36 = v - os_time_ret;
        local v37 = EntryTemplate:Clone();
        v37.Visible = true;
        v37.Parent = ScrollingFrame;
        local v38 = timeStringLocal(v);

        if v35 then
            v37.Text = v38 .. "  •  " .. rightSideLabel(os_time_ret, v, v36);
            v37.TextColor3 = Color3_fromRGB_ret2;
            v37.TextTransparency = 0;
        else
            local v39;

            if v36 <= 0 then
                v39 = "now";
            else
                local math_floor_ret = math.floor(v36 / 60);

                if math_floor_ret < 60 then
                    v39 = math_floor_ret .. "m";
                else
                    v39 = math.floor(math_floor_ret / 60) .. "h";
                end;
            end;

            v37.Text = v38 .. "  •  next (" .. v39 .. ")";
            v37.TextColor3 = Color3_fromRGB_ret;
            v37.TextTransparency = 0;
            v35 = true;
        end;
    end;
end;

local function attach(u40) -- Line: 186
    -- upvalues: render (copy), ReplicatedStorage (copy)
    render(u40);
    ReplicatedStorage:GetAttributeChangedSignal("GivingHourScheduleJson"):Connect(function() -- Line: 189
        -- upvalues: render (ref), u40 (copy)
        render(u40);
    end);
    task.spawn(function() -- Line: 193
        -- upvalues: u40 (copy), render (ref)
        while u40.Parent do
            task.wait(10);
            render(u40);
        end;
    end);
end;

task.spawn(function() -- Line: 201, Name: startBillboard
    -- upvalues: Workspace (copy), attach (copy)
    local Map = Workspace:WaitForChild("Map", 100000);
    task.wait(1);
    local v41 = (Map:GetAttribute("MapName") == "07-EXTENDED" or Map:GetAttribute("MapName") == "TEST_MAP") and Map:WaitForChild("WinterBillboard", 10000):WaitForChild("Billboard2", 10000);

    if v41 then
        attach((v41:FindFirstChild("BillboardGui", true)));
    end;
end);
task.spawn(function() -- Line: 215, Name: startTrusses
    -- upvalues: Workspace (copy), ReplicatedStorage (copy), LocalPlayer (copy)
    local Debris = Workspace:WaitForChild("Debris");
    local u42 = nil;
    local u43 = nil;

    local function update() -- Line: 219
        -- upvalues: u42 (ref), ReplicatedStorage (ref), u43 (ref), Debris (copy)
        if not u42 then
            return;
        end;

        local v44 = ReplicatedStorage;

        if u43 and (u43.Parent and u43:GetAttribute("IsInfected") == true) then
            v44 = Debris;
        end;

        if u42.Parent ~= v44 then
            u42.Parent = v44;
        end;
    end;

    local function track(u45) -- Line: 232
        -- upvalues: u42 (ref), update (copy)
        if u45 == u42 or (u45.Name ~= "InfectedTrusses" or u45:GetAttribute("Horde") ~= true) then
            return;
        end;

        u42 = u45;
        u45.AncestryChanged:Connect(function() -- Line: 237
            -- upvalues: u42 (ref), u45 (copy)
            if u42 == u45 and u45.Parent == nil then
                u42 = nil;
            end;
        end);
        task.defer(update);
    end;

    local function onCharacter(p46) -- Line: 245
        -- upvalues: u43 (ref), update (copy), u42 (ref), ReplicatedStorage (ref), Debris (copy)
        u43 = p46;
        p46:GetAttributeChangedSignal("IsInfected"):Connect(update);

        if not u42 then
            return;
        end;

        local v47 = ReplicatedStorage;

        if u43 and (u43.Parent and u43:GetAttribute("IsInfected") == true) then
            v47 = Debris;
        end;

        if u42.Parent ~= v47 then
            u42.Parent = v47;
        end;
    end;

    Debris.ChildAdded:Connect(track);

    for _, child in ipairs(Debris:GetChildren()) do
        track(child);
    end;

    LocalPlayer.CharacterAdded:Connect(onCharacter);
    LocalPlayer.CharacterRemoving:Connect(function(p48) -- Line: 256
        -- upvalues: u43 (ref), u42 (ref), ReplicatedStorage (ref), Debris (copy)
        if u43 == p48 then
            u43 = nil;

            if not u42 then
                return;
            end;

            local v49 = ReplicatedStorage;

            if u43 and (u43.Parent and u43:GetAttribute("IsInfected") == true) then
                v49 = Debris;
            end;

            if u42.Parent ~= v49 then
                u42.Parent = v49;
            end;
        end;
    end);

    if LocalPlayer.Character then
        local Character = LocalPlayer.Character;
        u43 = Character;
        Character:GetAttributeChangedSignal("IsInfected"):Connect(update);

        if u42 then
            local v50 = ReplicatedStorage;

            if u43 and u43.Parent then
                if u43:GetAttribute("IsInfected") ~= true then
                    Debris = v50;
                end;
            else
                Debris = v50;
            end;

            if u42.Parent ~= Debris then
                u42.Parent = Debris;
            end;
        end;
    end;
end);
task.spawn(function() -- Line: 267, Name: startTrussFacing
    -- upvalues: Workspace (copy), LocalPlayer (copy)
    local RunService = game:GetService("RunService");
    local UserInputService = game:GetService("UserInputService");
    local Debris = Workspace:WaitForChild("Debris");
    local OverlapParams_new_ret = OverlapParams.new();
    OverlapParams_new_ret.FilterType = Enum.RaycastFilterType.Include;
    local RaycastParams_new_ret = RaycastParams.new();
    RaycastParams_new_ret.FilterType = Enum.RaycastFilterType.Exclude;
    RaycastParams_new_ret.RespectCanCollide = true;
    local u51 = nil;

    local function stop(p52) -- Line: 280
        -- upvalues: u51 (ref)
        if u51 and (p52 and (p52.Parent and p52.AutoRotate == false)) then
            p52.AutoRotate = u51.autoRotate;
        end;

        u51 = nil;
    end;

    local function findFacing(p53, p54, p55, p56) -- Line: 287
        -- upvalues: OverlapParams_new_ret (copy), Workspace (ref), RaycastParams_new_ret (copy)
        OverlapParams_new_ret.FilterDescendantsInstances = { p55 };
        local v57 = nil;
        local v58 = nil;

        for _, v in ipairs(Workspace:GetPartBoundsInBox(CFrame.lookAt(p53 + p54 * 2.2, p53 + p54 * 3), Vector3.new(2.6, 4, 4.4), OverlapParams_new_ret)) do
            local Size = v.Size;
            local RightVector = v.CFrame.RightVector;

            if Size.Z < Size.X and Size.Z < Size.Y then
                RightVector = v.CFrame.LookVector;
            end;

            local Vector3_new_ret = Vector3.new(RightVector.X, 0, RightVector.Z);

            if Vector3_new_ret.Magnitude > 0.5 then
                local Unit = Vector3_new_ret.Unit;

                if Unit:Dot(p54) < 0 then
                    Unit = -Unit;
                end;

                local v59 = (v.Position - p53):Dot(Unit);

                if v59 > 0 and (Unit:Dot(p54) > 0.35 and (not v57 or v59 < v57)) then
                    v58 = Unit;
                    v57 = v59;
                end;
            end;
        end;

        if not v58 or v57 > 4 then
            return;
        end;

        RaycastParams_new_ret.FilterDescendantsInstances = { p56, p55 };

        if not Workspace:Raycast(p53, v58 * math.max(v57 - 0.3, 0.1), RaycastParams_new_ret) then
            return v58;
        end;
    end;

    RunService.PreSimulation:Connect(function() -- Line: 318
        -- upvalues: LocalPlayer (ref), u51 (ref), Debris (copy), UserInputService (copy), findFacing (copy)
        local Character = LocalPlayer.Character;
        local v60;

        if Character then
            v60 = Character:FindFirstChildOfClass("Humanoid");
        else
            v60 = Character;
        end;

        if not v60 or Character:GetAttribute("IsInfected") ~= true then
            if u51 and (v60 and (v60.Parent and v60.AutoRotate == false)) then
                v60.AutoRotate = u51.autoRotate;
            end;

            u51 = nil;

            return;
        end;

        local InfectedTrusses = Debris:FindFirstChild("InfectedTrusses");
        local v61;

        if InfectedTrusses then
            v61 = v60.RootPart;
        else
            v61 = InfectedTrusses;
        end;

        if not (v61 and (v60.Health > 0 and not (v61:GetAttribute("NO_ROOT_ROT") or (v61:FindFirstChild("HealGyro") or (v61:FindFirstChildOfClass("BodyGyro") or UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter))))) then
            if u51 and (v60 and (v60.Parent and v60.AutoRotate == false)) then
                v60.AutoRotate = u51.autoRotate;
            end;

            u51 = nil;

            return;
        end;

        local State = v60:GetState();

        if State ~= Enum.HumanoidStateType.Running and State ~= Enum.HumanoidStateType.RunningNoPhysics then
            if u51 and (v60 and (v60.Parent and v60.AutoRotate == false)) then
                v60.AutoRotate = u51.autoRotate;
            end;

            u51 = nil;

            return;
        end;

        local MoveDirection = v60.MoveDirection;

        if MoveDirection.Magnitude < 0.1 then
            if u51 and (v60 and (v60.Parent and v60.AutoRotate == false)) then
                v60.AutoRotate = u51.autoRotate;
            end;

            u51 = nil;

            return;
        end;

        local Position = v61.Position;
        local v62 = findFacing(Position, MoveDirection.Unit, InfectedTrusses, Character);

        if not v62 then
            if u51 and (v60 and (v60.Parent and v60.AutoRotate == false)) then
                v60.AutoRotate = u51.autoRotate;
            end;

            u51 = nil;

            return;
        end;

        local LookVector = v61.CFrame.LookVector;
        local Vector3_new_ret = Vector3.new(LookVector.X, 0, LookVector.Z);

        if Vector3_new_ret.Magnitude < 0.1 then
            if u51 and (v60 and (v60.Parent and v60.AutoRotate == false)) then
                v60.AutoRotate = u51.autoRotate;
            end;

            u51 = nil;

            return;
        end;

        local Unit = Vector3_new_ret.Unit;

        if not u51 or u51.facing:Dot(v62) < 0.99 then
            if Unit:Dot(v62) > 0.996 and not u51 then
                return;
            end;

            u51 = {
                from = Unit,
                facing = v62,
                start = os.clock(),
                autoRotate = u51 and u51.autoRotate or v60.AutoRotate
            };
        end;

        local v63 = (os.clock() - u51.start) / 0.3;
        local math_min_ret = math.min(v63, 1);
        v60.AutoRotate = false;
        v61.CFrame = CFrame.lookAt(Position, Position + u51.from):Lerp(CFrame.lookAt(Position, Position + u51.facing), math_min_ret * math_min_ret * math_min_ret * (math_min_ret * (math_min_ret * 6 - 15) + 10));
    end);
end);
task.spawn(function() -- Line: 368, Name: startDoors
    -- upvalues: LocalPlayer (copy), CollectionService (copy)
    local function u66(u64) -- Line: 369
        -- upvalues: LocalPlayer (ref)
        local function check() -- Line: 370
            -- upvalues: u64 (copy), LocalPlayer (ref)
            if not (u64:GetAttribute("Busy") or (not u64:GetAttribute(LocalPlayer.UserId) or u64:FindFirstChild("SelectionBox"))) then
                local v65 = script.SelectionBox:Clone();
                v65.Parent = u64;
                v65.Adornee = u64;
            end;
        end;

        u64:GetAttributeChangedSignal(LocalPlayer.UserId):Connect(check);
        u64:GetAttributeChangedSignal("Busy"):Connect(check);
        task.spawn(check);
    end;

    CollectionService:GetInstanceAddedSignal("TOT_DOOR"):Connect(u66);

    for _, v in pairs(CollectionService:GetTagged("TOT_DOOR")) do
        task.spawn(function() -- Line: 389
            -- upvalues: u66 (copy), v (copy)
            u66(v);
        end);
    end;
end);
task.spawn(function() -- Line: 395, Name: startGhostView
    -- upvalues: Workspace (copy), ReplicatedStorage (copy), LocalPlayer (copy)
    local Characters = Workspace:WaitForChild("Characters", 100000);

    if not Characters then
        return;
    end;

    local TweenService = game:GetService("TweenService");

    local function tierOld(p67, p68) -- Line: 404
        -- upvalues: ReplicatedStorage (ref)
        local rig = p67.rig;

        if ReplicatedStorage:GetAttribute("GhostViewOff") or rig:GetAttribute("GhostFadeAt") == nil then
            p67.seen = nil;

            return 4;
        end;

        local HumanoidRootPart = rig:FindFirstChild("HumanoidRootPart");

        if not HumanoidRootPart then
            return 4;
        end;

        local Magnitude = (p68.CFrame.Position - HumanoidRootPart.Position).Magnitude;
        local v69 = math.max(Magnitude, 0.1) * 2;
        local math_clamp_ret = math.clamp(p68.FieldOfView, 1, 120);
        local v70 = math.rad(math_clamp_ret) / 2;
        local v71 = 6 / (v69 * math.tan(v70));
        local v72 = p68:WorldToViewportPoint(HumanoidRootPart.Position);
        local ViewportSize = p68.ViewportSize;
        local v73 = (p67.seen and 0.35 or 0.15) + v71;
        local v74 = v73 * ViewportSize.Y / math.max(ViewportSize.X, 1);
        local v75;

        if v72.Z > 0 and (v72.X > -ViewportSize.X * v74 and (v72.X < ViewportSize.X * (1 + v74) and v72.Y > -ViewportSize.Y * v73)) then
            v75 = v72.Y < ViewportSize.Y * (1 + v73);
        else
            v75 = false;
        end;

        p67.seen = v75;

        if not v75 then
            return 1;
        end;

        local v76;

        if v72.X >= 0 and (v72.X <= ViewportSize.X and v72.Y >= 0) then
            v76 = v72.Y <= ViewportSize.Y;
        else
            v76 = false;
        end;

        local v77 = v71 * (p67.tier >= 3 and 1.2 or 1) * (v76 and 1 or 0.01);

        if Magnitude < 20 or (v71 >= 0.05 or p67.tier == 4 and v71 >= 0.04000000000000001) then
            return 4, v77;
        end;

        if v71 >= 0.02 or p67.tier >= 2 and v71 >= 0.016 then
            return 3, v77;
        end;

        return 1;
    end;

    local u78 = {
        GhostMist = { "ParticleEmitter", 3 },
        GhostAura = { "Highlight", 2 },
        GhostTrail = { "Trail", 4 },
        GhostEyeTrail = { "Trail", 4 },
        EyeRay = { "Beam", 4 },
        PumpkinRay = { "Beam", 4 },
        GhostEyeLight = { "Light", 4 },
        GhostEyeBeam = { "Light", 4 },
        GhostBodyLight = { "Light", 4 }
    };
    local u79 = {
        GhostTrail = true,
        GhostEyeTrail = true,
        EyeRay = true,
        PumpkinRay = true
    };
    local UserInputService = game:GetService("UserInputService");
    local u80 = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled;
    local u81 = {};
    local u82 = false;
    local u83;

    if u80 then
        u83 = not ReplicatedStorage:GetAttribute("GhostViewOff");
    end;

    local RunService = game:GetService("RunService");
    local u84 = 6;
    pcall(function() -- Line: 455
        -- upvalues: u84 (ref), u80 (copy)
        local SavedQualityLevel = UserSettings():GetService("UserGameSettings").SavedQualityLevel;
        u84 = tonumber(string.match(SavedQualityLevel.Name, "(%d+)$")) or (u80 and 4 or 7);
    end);
    local math_floor_ret = math.floor(u84 * 0.8 + 0.5);
    local math_clamp_ret = math.clamp(math_floor_ret, 2, 8);
    local u85 = 60;
    RunService.RenderStepped:Connect(function(p86) -- Line: 464
        -- upvalues: u85 (ref)
        if p86 > 0 then
            u85 = u85 + (1 / p86 - u85) * math.min(p86 * 2, 1);
        end;
    end);
    local RaycastParams_new_ret = RaycastParams.new();
    RaycastParams_new_ret.FilterType = Enum.RaycastFilterType.Include;
    local u87 = RunService:IsStudio();

    local function need(p88) -- Line: 477
        -- upvalues: u78 (copy)
        local v89 = u78[p88.Name];

        if v89 and p88:IsA(v89[1]) then
            return v89[2];
        end;

        return nil;
    end;

    local function dying(p90) -- Line: 485
        local Attribute = p90.rig:GetAttribute("GhostFade");
        local v91;

        if typeof(Attribute) == "Vector3" then
            v91 = Attribute.Y >= 1;
        else
            v91 = false;
        end;

        return v91;
    end;

    local function wanted(p92, p93, p94) -- Line: 490
        -- upvalues: u79 (copy)
        local Attribute = p92.rig:GetAttribute("GhostFade");

        if p94.server and not p93:GetAttribute("GhostOn") then
            return (typeof(Attribute) ~= "Vector3" or Attribute.Y < 1 and (not u79[p93.Name] or Attribute.Y < 0.5)) and true or false;
        end;

        return false;
    end;

    local function drop(p95, p96, p97) -- Line: 501
        p95.items[p96] = nil;

        if p97.con then
            p97.con:Disconnect();
            p97.con = nil;
        end;

        if p97.tween then
            p97.tween:Cancel();
            p97.tween = nil;
        end;
    end;

    local function park(p98, u99, p100) -- Line: 513
        local Parent = u99.Parent;

        if p100.parked and not Parent then
            return;
        end;

        if Parent and (Parent:IsDescendantOf(p98.rig) and pcall(function() -- Line: 518
            -- upvalues: u99 (copy)
            u99.Parent = nil;
        end)) then
            p100.home = Parent;
            p100.parked = true;

            return;
        end;

        p98.items[u99] = nil;

        if p100.con then
            p100.con:Disconnect();
            p100.con = nil;
        end;

        if p100.tween then
            p100.tween:Cancel();
            p100.tween = nil;
        end;
    end;

    local function unpark(p101, u102, u103) -- Line: 527
        if not u103.parked then
            return;
        end;

        u103.parked = nil;

        if u102.Parent == nil and (u103.home and (u103.home:IsDescendantOf(p101.rig) and not pcall(function() -- Line: 533
            -- upvalues: u102 (copy), u103 (copy)
            u102.Parent = u103.home;
        end))) then
            p101.items[u102] = nil;

            if u103.con then
                u103.con:Disconnect();
                u103.con = nil;
            end;

            if u103.tween then
                u103.tween:Cancel();
                u103.tween = nil;
            end;
        end;
    end;

    local function hide(p104, u105, u106) -- Line: 541
        -- upvalues: park (copy), TweenService (copy)
        if u106.light then
            if not _G.Y8OTOP then
                u106.hidden = true;
                park(p104, u105, u106);
            end;

            return;
        end;

        if not u105.Parent then
            p104.items[u105] = nil;

            if u106.con then
                u106.con:Disconnect();
                u106.con = nil;
            end;

            if u106.tween then
                u106.tween:Cancel();
                u106.tween = nil;
            end;

            return;
        end;

        if u106.hidden then
            if u105.Enabled and not u106.tween then
                u105.Enabled = false;
            end;

            return;
        end;

        u106.hidden = true;
        u106.pending = nil;
        u106.offAt = os.clock();

        if not u105.Enabled then
            return;
        end;

        if not u106.w0 then
            u105.Enabled = false;

            return;
        end;

        local u107 = TweenService:Create(u105, TweenInfo.new(0.25), {
            Width0 = 0,
            Width1 = 0
        });
        u106.tween = u107;
        u107.Completed:Connect(function(p108) -- Line: 568
            -- upvalues: u106 (copy), u107 (copy), u105 (copy)
            if u106.tween == u107 then
                u106.tween = nil;

                if p108 == Enum.PlaybackState.Completed and (u106.hidden and u105.Parent) then
                    u105.Enabled = false;
                end;
            end;
        end);
        u107:Play();
    end;

    local function show(p109, p110, u111) -- Line: 582
        -- upvalues: unpark (copy), wanted (copy), TweenService (copy)
        if u111.light then
            if not _G.Y8OTOP then
                u111.hidden = nil;
                unpark(p109, p110, u111);
            end;

            return;
        end;

        if not p110.Parent then
            p109.items[p110] = nil;

            if u111.con then
                u111.con:Disconnect();
                u111.con = nil;
            end;

            if u111.tween then
                u111.tween:Cancel();
                u111.tween = nil;
            end;

            return;
        end;

        if not (u111.hidden or u111.pending) then
            return;
        end;

        u111.hidden = nil;

        if u111.tween then
            u111.tween:Cancel();
            u111.tween = nil;
        end;

        if not wanted(p109, p110, u111) then
            u111.pending = true;

            if u111.w0 then
                local w1 = u111.w1;
                p110.Width0 = u111.w0;
                p110.Width1 = w1;
            end;

            return;
        end;

        u111.pending = nil;

        if p110.Enabled and not u111.w0 then
            return;
        end;

        if not u111.w0 then
            if p110:IsA("Trail") and (not p110.Enabled and os.clock() - (u111.offAt or 0) > p110.Lifetime) then
                p110:Clear();
            end;

            p110.Enabled = true;

            return;
        end;

        if not p110.Enabled then
            p110.Width0 = 0;
            p110.Width1 = 0;
        end;

        p110.Enabled = true;
        local u112 = TweenService:Create(p110, TweenInfo.new(0.25), {
            Width0 = u111.w0,
            Width1 = u111.w1
        });
        u111.tween = u112;
        u112.Completed:Connect(function() -- Line: 620
            -- upvalues: u111 (copy), u112 (copy)
            if u111.tween == u112 then
                u111.tween = nil;
            end;
        end);
        u112:Play();
    end;

    local function boss(p113) -- Line: 646
        return (p113:GetAttribute("RageSpan") ~= nil or p113:FindFirstChild("RageLook") ~= nil) and true or p113:FindFirstChild("RageCracks") ~= nil;
    end;

    local function setRate(p114, p115) -- Line: 650
        -- upvalues: u83 (ref)
        local Rate = p114.Rate;

        if p115.mine ~= nil and Rate ~= p115.mine then
            p115.base = Rate;
        end;

        local v116 = u83 and p115.base * 0.5 or p115.base;

        if Rate ~= v116 then
            p115.busy = true;
            p114.Rate = v116;
            p115.busy = nil;
        end;

        p115.mine = p114.Rate;
    end;

    local function addRate(u117, u118) -- Line: 664
        -- upvalues: u83 (ref)
        local u119 = {
            base = u118.Rate
        };
        u117.rates[u118] = u119;
        u119.con = u118:GetPropertyChangedSignal("Rate"):Connect(function() -- Line: 667
            -- upvalues: u117 (copy), u118 (copy), u119 (copy), u83 (ref)
            if u117.rates[u118] == u119 and (not u119.busy and u118.Rate ~= u119.mine) then
                local v120 = u118;
                local v121 = u119;
                local Rate = v120.Rate;

                if v121.mine ~= nil and Rate ~= v121.mine then
                    v121.base = Rate;
                end;

                local v122 = u83 and v121.base * 0.5 or v121.base;

                if Rate ~= v122 then
                    v121.busy = true;
                    v120.Rate = v122;
                    v121.busy = nil;
                end;

                v121.mine = v120.Rate;
            end;
        end);
        local Rate = u118.Rate;

        if u119.mine ~= nil and Rate ~= u119.mine then
            u119.base = Rate;
        end;

        local v123 = u83 and u119.base * 0.5 or u119.base;

        if Rate ~= v123 then
            u119.busy = true;
            u118.Rate = v123;
            u119.busy = nil;
        end;

        u119.mine = u118.Rate;
    end;

    local function dropRate(p124, p125, p126) -- Line: 675
        p124.rates[p125] = nil;
        p126.con:Disconnect();

        if p125.Rate == p126.mine and p126.mine ~= p126.base then
            p125.Rate = p126.base;
        end;
    end;

    local function setHz(p127, p128) -- Line: 683
        if p127.hz ~= p128 then
            p127.hz = p128;
            pcall(p127.rig.SetAttribute, p127.rig, "GhostPoseHz", p128);
        end;
    end;

    local function release(u129) -- Line: 690
        -- upvalues: unpark (copy), wanted (copy), dropRate (copy)
        u129.skip = true;

        if u129.hz ~= nil then
            u129.hz = nil;
            pcall(u129.rig.SetAttribute, u129.rig, "GhostPoseHz", nil);
        end;

        if u129.tag then
            u129.tag:Destroy();
            u129.tag = nil;
        end;

        if u129.con then
            u129.con:Disconnect();
            u129.con = nil;
        end;

        if u129.out then
            u129.out:Disconnect();
            u129.out = nil;
        end;

        if u129.rage then
            u129.rage:Disconnect();
            u129.rage = nil;
        end;

        for i, v in pairs(u129.items) do
            if v.tween then
                v.tween:Cancel();
                v.tween = nil;
            end;

            pcall(function() -- Line: 714
                -- upvalues: v (copy), unpark (ref), u129 (copy), i (copy), wanted (ref)
                if v.light then
                    unpark(u129, i, v);

                    return;
                end;

                if v.w0 then
                    local w1 = v.w1;
                    i.Width0 = v.w0;
                    i.Width1 = w1;
                end;

                if v.hidden and (i.Parent and wanted(u129, i, v)) then
                    i.Enabled = true;
                end;
            end);
            v.hidden = nil;
            v.pending = nil;
            u129.items[i] = nil;

            if v.con then
                v.con:Disconnect();
                v.con = nil;
            end;

            if v.tween then
                v.tween:Cancel();
                v.tween = nil;
            end;
        end;

        table.clear(u129.items);

        for i, v in pairs(u129.rates) do
            pcall(dropRate, u129, i, v);
        end;

        table.clear(u129.rates);
    end;

    local function add(p130, u131) -- Line: 736
        -- upvalues: u80 (copy), addRate (copy), u78 (copy), hide (copy)
        if p130.skip then
            return;
        end;

        if u80 and not (p130.rates[u131] or (not u131:IsA("ParticleEmitter") or p130.rig:GetAttribute("RageSpan") ~= nil)) then
            addRate(p130, u131);
        end;

        if p130.items[u131] then
            return;
        end;

        local v132 = u78[u131.Name];
        local v133;

        if v132 and u131:IsA(v132[1]) then
            v133 = v132[2];
        else
            v133 = nil;
        end;

        if v133 then
            local u134 = {
                need = v133,
                server = u131.Enabled
            };
            p130.items[u131] = u134;

            if u131:IsA("Light") then
                u134.light = true;

                if p130.tier < v133 then
                    hide(p130, u131, u134);
                end;

                return;
            end;

            if u131:IsA("Beam") then
                local Width1 = u131.Width1;
                u134.w0 = u131.Width0;
                u134.w1 = Width1;
            end;

            u134.con = u131:GetPropertyChangedSignal("Enabled"):Connect(function() -- Line: 760
                -- upvalues: u131 (copy), u134 (copy)
                local Enabled = u131.Enabled;

                if u134.hidden then
                    if Enabled then
                        u134.server = true;

                        if not u134.tween then
                            u131.Enabled = false;
                        end;
                    end;

                    return;
                end;

                u134.server = Enabled;
            end);

            if p130.tier < v133 then
                hide(p130, u131, u134);
            end;
        end;
    end;

    local function v140(p135) -- Line: 777
        -- upvalues: u81 (copy), add (copy), release (copy), u80 (copy), dropRate (copy)
        if u81[p135] or string.sub(p135.Name, 1, 5) ~= "GHST_" then
            return;
        end;

        local u136 = {
            tier = 4,
            want = 4,
            since = 0,
            applied = 0,
            rig = p135,
            items = {},
            rates = {}
        };
        u81[p135] = u136;

        if (p135:GetAttribute("RageSpan") ~= nil or p135:FindFirstChild("RageLook") ~= nil) and true or p135:FindFirstChild("RageCracks") ~= nil then
            u136.skip = true;

            return;
        end;

        for _, descendant in ipairs(p135:GetDescendants()) do
            add(u136, descendant);
        end;

        u136.con = p135.DescendantAdded:Connect(function(p137) -- Line: 790
            -- upvalues: release (ref), u136 (copy), add (ref)
            if p137.Name == "RageLook" or p137.Name == "RageCracks" then
                release(u136);

                return;
            end;

            add(u136, p137);
        end);

        if u80 then
            u136.rage = p135:GetAttributeChangedSignal("RageSpan"):Connect(function() -- Line: 798
                -- upvalues: release (ref), u136 (copy)
                release(u136);
            end);
            u136.out = p135.DescendantRemoving:Connect(function(p138) -- Line: 801
                -- upvalues: u136 (copy), dropRate (ref)
                local v139 = u136.rates[p138];

                if v139 then
                    pcall(dropRate, u136, p138, v139);
                end;
            end);
        end;
    end;

    Characters.ChildAdded:Connect(v140);
    Characters.ChildRemoved:Connect(function(p141) -- Line: 810, Name: untrack
        -- upvalues: u81 (copy), release (copy)
        local v142 = u81[p141];

        if v142 then
            u81[p141] = nil;
            release(v142);
        end;
    end);
    local v143 = math_clamp_ret;
    local u144 = (-1 / 0);
    local u145 = nil;
    local v146 = nil;
    local v147 = 0;
    local v148 = 0;

    local function apply(p149) -- Line: 634
        -- upvalues: hide (copy), show (copy)
        local Attribute = p149.rig:GetAttribute("GhostFade");
        local v150;

        if typeof(Attribute) == "Vector3" then
            v150 = Attribute.Y >= 1;
        else
            v150 = false;
        end;

        for i, v in pairs(p149.items) do
            if p149.tier < v.need then
                hide(p149, i, v);
            elseif not v150 then
                show(p149, i, v);
            end;
        end;

        p149.applied = os.clock();
    end;

    local v151 = 0;
    local v152 = false;

    for _, child in ipairs(Characters:GetChildren()) do
        v140(child);
    end;

    local u153 = nil;

    local function watch(p154) -- Line: 825
        -- upvalues: u153 (ref), u82 (ref)
        if p154 and p154 ~= u153 then
            u153 = p154;
            p154:GetPropertyChangedSignal("FieldOfView"):Connect(function() -- Line: 828
                -- upvalues: u82 (ref)
                u82 = true;
            end);
        end;
    end;

    local function losFilter() -- Line: 834
        -- upvalues: u144 (ref), Workspace (ref), RaycastParams_new_ret (copy)
        local os_clock_ret = os.clock();

        if os_clock_ret - u144 > 5 then
            u144 = os_clock_ret;
            local Map = Workspace:FindFirstChild("Map");
            RaycastParams_new_ret.FilterDescendantsInstances = Map and { Workspace.Terrain, Map } or { Workspace.Terrain };
        end;
    end;

    local function clear(p155, p156) -- Line: 843
        -- upvalues: Workspace (ref), RaycastParams_new_ret (copy)
        local v157 = p156 - p155;

        for i = 1, 3 do
            local v158 = Workspace:Raycast(p155, v157, RaycastParams_new_ret);

            if not v158 then
                return true;
            end;

            local Instance2 = v158.Instance;

            if not (Instance2:IsA("BasePart") and (Instance2.Transparency >= 0.3 or Instance2.LocalTransparencyModifier >= 0.3)) then
                return false;
            end;

            p155 = v158.Position + v157.Unit * 0.05;
            v157 = p156 - p155;
            local _ = i;
        end;

        return false;
    end;

    local function threat(p159, p160, p161) -- Line: 871
        -- upvalues: u145 (ref)
        if p161 < 20 then
            return true;
        end;

        local PoseTarget = p159:FindFirstChild("PoseTarget");
        local v162 = u145 and u145:FindFirstChild("HumanoidRootPart");
        local v163;

        if v162 == nil or (PoseTarget == nil or PoseTarget.Value ~= v162) then
            v163 = false;
        else
            v163 = p159:GetAttribute("PoseArms") == true and true or p161 < 60;
        end;

        return v163;
    end;

    local function tierOf(p164, p165, p166) -- Line: 880
        -- upvalues: ReplicatedStorage (ref), threat (copy)
        local rig = p164.rig;

        if ReplicatedStorage:GetAttribute("GhostViewOff") or rig:GetAttribute("GhostFadeAt") == nil then
            p164.seen = nil;
            p164.threat = true;

            return 4;
        end;

        local HumanoidRootPart = rig:FindFirstChild("HumanoidRootPart");

        if not HumanoidRootPart then
            return 4;
        end;

        local Magnitude = (p165.CFrame.Position - HumanoidRootPart.Position).Magnitude;
        p164.threat = threat(rig, HumanoidRootPart, Magnitude);
        local v167 = math.max(Magnitude, 0.1) * 2;
        local math_clamp_ret2 = math.clamp(p165.FieldOfView, 1, 120);
        local v168 = math.rad(math_clamp_ret2) / 2;
        local v169 = 6 / (v167 * math.tan(v168));
        local v170 = p165:WorldToViewportPoint(HumanoidRootPart.Position);
        local ViewportSize = p165.ViewportSize;
        local v171 = (p164.seen and 0.4 or 0.25) + v169 + p166;
        local v172 = v171 * ViewportSize.Y / math.max(ViewportSize.X, 1);
        local v173;

        if v170.Z > 0 and (v170.X > -ViewportSize.X * v172 and (v170.X < ViewportSize.X * (1 + v172) and v170.Y > -ViewportSize.Y * v171)) then
            v173 = v170.Y < ViewportSize.Y * (1 + v171);
        else
            v173 = false;
        end;

        p164.seen = v173;

        if not v173 then
            p164.los = nil;

            return p164.threat and 2 or 1;
        end;

        local v174;

        if v170.X >= 0 and (v170.X <= ViewportSize.X and v170.Y >= 0) then
            v174 = v170.Y <= ViewportSize.Y;
        else
            v174 = false;
        end;

        local v175 = v170.X / math.max(ViewportSize.X, 1) * 2 - 1;
        local v176 = v170.Y / math.max(ViewportSize.Y, 1) * 2 - 1;
        local v177 = math.sqrt(v175 * v175 + v176 * v176) / 1.414;
        local math_clamp_ret3 = math.clamp(v177, 0, 1);
        local v178;

        if p164.losSeen == nil then
            v178 = false;
        else
            v178 = os.clock() - p164.losSeen < 0.5;
        end;

        p164.los = v178;
        local v179 = (math.min(v169 / 0.05, 2) * 0.45 + (1 - math_clamp_ret3) * 0.35 + 0.2 * (v178 and 1 or 0)) * (p164.tier >= 3 and 1.2 or 1) * (v174 and 1 or 0.05);

        if p164.threat then
            v179 = v179 + 10;
        end;

        if not (v178 or p164.threat) then
            return 2, v179;
        end;

        if Magnitude < 20 or (v169 >= 0.05 or p164.tier == 4 and v169 >= 0.04000000000000001) then
            return 4, v179;
        end;

        if v169 >= 0.02 or p164.tier >= 2 and v169 >= 0.016 then
            return 3, v179;
        end;

        return p164.threat and 3 or 1, v179;
    end;

    local function tag(p180) -- Line: 924
        -- upvalues: u87 (copy), Workspace (ref), LocalPlayer (ref)
        if not (u87 and Workspace:GetAttribute("GhostViewDebug")) then
            if p180.tag then
                p180.tag:Destroy();
                p180.tag = nil;
            end;

            return;
        end;

        local Head = p180.rig:FindFirstChild("Head");

        if not Head then
            return;
        end;

        if not p180.tag then
            local BillboardGui = Instance.new("BillboardGui");
            BillboardGui.Size = UDim2.fromOffset(60, 18);
            BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0);
            BillboardGui.AlwaysOnTop = true;
            local TextLabel = Instance.new("TextLabel");
            TextLabel.Size = UDim2.fromScale(1, 1);
            TextLabel.BackgroundTransparency = 1;
            TextLabel.TextScaled = true;
            TextLabel.Font = Enum.Font.GothamBold;
            TextLabel.Parent = BillboardGui;
            BillboardGui.Parent = LocalPlayer:FindFirstChildOfClass("PlayerGui");
            p180.tag = BillboardGui;
        end;

        p180.tag.Adornee = Head;
        local v181 = p180.tag:FindFirstChildOfClass("TextLabel");
        v181.TextColor3 = ({
            Color3.fromRGB(120, 120, 120),
            Color3.fromRGB(230, 180, 60),
            Color3.fromRGB(80, 160, 255),
            Color3.fromRGB(90, 230, 110)
        })[p180.tier] or Color3.new(1, 1, 1);
        v181.Text = string.format("T%d %s%s", p180.tier, p180.hz == nil and "-" or (p180.hz < 0 and "max" or tostring(p180.hz)), p180.threat and " !" or "");
    end;

    local function sight(p182, p183) -- Line: 860
        -- upvalues: clear (copy)
        local Position = p182.CFrame.Position;

        for _, v in ipairs({ "Head", "Torso" }) do
            local v184 = p183:FindFirstChild(v);

            if v184 and clear(Position, v184.Position) then
                return true;
            end;
        end;

        return false;
    end;

    local function byScore(p185, p186) -- Line: 957
        return p185.score > p186.score;
    end;

    while true do
        task.wait(0.2);
        local CurrentCamera = Workspace.CurrentCamera;
        local v187;

        if CurrentCamera then
            if CurrentCamera and CurrentCamera ~= u153 then
                u153 = CurrentCamera;
                CurrentCamera:GetPropertyChangedSignal("FieldOfView"):Connect(function() -- Line: 828
                    -- upvalues: u82 (ref)
                    u82 = true;
                end);
            end;

            local v188;

            if u80 then
                v188 = not ReplicatedStorage:GetAttribute("GhostViewOff");
            else
                v188 = u80;
            end;

            if v188 ~= u83 then
                u83 = v188;

                for _, v in pairs(u81) do
                    for i, v2 in pairs(v.rates) do
                        pcall(setRate, i, v2);
                    end;
                end;
            end;

            local os_clock_ret = os.clock();
            local u189 = u82;
            u82 = false;

            if ReplicatedStorage:GetAttribute("GhostHuntUpdate") == true then
                v152 = true;
                u145 = LocalPlayer.Character;
                v187 = CurrentCamera.CFrame.LookVector;

                if v146 then
                    local v190 = v187:Dot(v146);
                    local math_clamp_ret2 = math.clamp(v190, -1, 1);
                    v147 = v147 + (math.acos(math_clamp_ret2) / 0.2 - v147) * 0.5;
                end;

                local math_clamp_ret2 = math.clamp(CurrentCamera.FieldOfView, 1, 120);
                local v191 = v147 * 0.3 / math.rad(math_clamp_ret2);
                local math_clamp_ret3 = math.clamp(v191, 0, 0.5);

                if u85 < 45 then
                    if v143 > 2 then
                        v151 = os_clock_ret;
                        v143 = 2;
                    end;
                elseif u85 < 58 then
                    if os_clock_ret - v151 >= 0.5 and v143 > 2 then
                        v143 = v143 - 1;
                        v151 = os_clock_ret;
                    end;

                    v148 = os_clock_ret;
                elseif os_clock_ret - v148 >= 3 and (os_clock_ret - v151 >= 3 and v143 < math_clamp_ret) then
                    v143 = v143 + 1;
                    v148 = os_clock_ret;
                end;

                local v192 = v143 * 2;
                losFilter();
                local u193 = {};
                local u194 = 0;

                for i, v in pairs(u81) do
                    v.next = nil;

                    if i.Parent == Characters then
                        if not v.skip then
                            pcall(function() -- Line: 1068
                                -- upvalues: i (copy), release (copy), v (copy), u194 (ref), os_clock_ret (copy), sight (copy), CurrentCamera (copy), tierOf (copy), math_clamp_ret3 (copy), u193 (copy)
                                local v195 = i;

                                if (v195:GetAttribute("RageSpan") ~= nil or v195:FindFirstChild("RageLook") ~= nil) and true or v195:FindFirstChild("RageCracks") ~= nil then
                                    release(v);

                                    return;
                                end;

                                if v.seen and (u194 < 10 and os_clock_ret - (v.losAt or (-1 / 0)) >= 0.4) then
                                    u194 = u194 + 1;
                                    v.losAt = os_clock_ret;

                                    if sight(CurrentCamera, i) then
                                        v.losSeen = os_clock_ret;
                                    end;
                                end;

                                local v196, v197 = tierOf(v, CurrentCamera, math_clamp_ret3);
                                v.next = v196;
                                v.score = v197;

                                if v196 >= 2 and v197 then
                                    table.insert(u193, v);
                                end;
                            end);
                        end;
                    else
                        local v198 = u81[i];

                        if v198 then
                            u81[i] = nil;
                            release(v198);
                        end;
                    end;
                end;

                table.sort(u193, byScore);
                local v199 = 0;
                local v200 = 0;

                for _, v in ipairs(u193) do
                    if v.next == 4 then
                        if v199 < v143 then
                            v199 = v199 + 1;
                        else
                            v.next = 3;
                        end;
                    end;

                    if v.next == 3 then
                        if v200 < v192 or v.threat then
                            v200 = v200 + 1;
                        else
                            v.next = 2;
                        end;
                    end;
                end;

                for _, v in pairs(u81) do
                    local next = v.next;

                    if next and not v.skip then
                        pcall(function() -- Line: 1109
                            -- upvalues: next (copy), v (copy), os_clock_ret (copy), apply (copy), u189 (copy), u85 (ref), tag (copy)
                            if next == v.tier then
                                v.want = next;

                                if os_clock_ret - v.applied >= 2 then
                                    apply(v);
                                end;
                            elseif next > v.tier or u189 then
                                v.tier = next;
                                v.want = next;
                                apply(v);
                            else
                                if next ~= v.want then
                                    v.want = next;
                                    v.since = os_clock_ret;
                                end;

                                if os_clock_ret - v.since >= 0.6 then
                                    v.tier = next;
                                    apply(v);
                                end;
                            end;

                            local tier = v.tier;
                            local v201;

                            if tier >= 4 then
                                v201 = -1;
                            elseif tier == 3 then
                                v201 = u85 < 45 and 15 or 30;
                            else
                                v201 = tier == 2 and (v.threat and 15 or 0) or 0;
                            end;

                            local v202 = v;

                            if v202.hz ~= v201 then
                                v202.hz = v201;
                                pcall(v202.rig.SetAttribute, v202.rig, "GhostPoseHz", v201);
                            end;

                            tag(v);
                        end);
                    end;
                end;
            else
                if v152 then
                    v152 = false;

                    for _, v in pairs(u81) do
                        if v.hz ~= nil then
                            v.hz = nil;
                            pcall(v.rig.SetAttribute, v.rig, "GhostPoseHz", nil);
                        end;
                    end;
                end;

                local u203 = {};

                for i, v in pairs(u81) do
                    v.next = nil;

                    if i.Parent == Characters then
                        if not v.skip then
                            pcall(function() -- Line: 991
                                -- upvalues: i (copy), release (copy), v (copy), tierOld (copy), CurrentCamera (copy), u203 (copy)
                                local v204 = i;

                                if (v204:GetAttribute("RageSpan") ~= nil or v204:FindFirstChild("RageLook") ~= nil) and true or v204:FindFirstChild("RageCracks") ~= nil then
                                    release(v);

                                    return;
                                end;

                                local v205, v206 = tierOld(v, CurrentCamera);
                                v.next = v205;
                                v.score = v206;

                                if v205 >= 3 and v206 then
                                    table.insert(u203, v);
                                end;
                            end);
                        end;
                    else
                        local v207 = u81[i];

                        if v207 then
                            u81[i] = nil;
                            release(v207);
                        end;
                    end;
                end;

                if #u203 > 4 then
                    table.sort(u203, byScore);

                    for i = 5, #u203 do
                        u203[i].next = 2;
                        local _ = i;
                    end;
                end;

                v187 = v146;

                for _, v in pairs(u81) do
                    local next = v.next;

                    if next and not v.skip then
                        pcall(function() -- Line: 1013
                            -- upvalues: next (copy), v (copy), os_clock_ret (copy), apply (copy), u189 (copy)
                            if next == v.tier then
                                v.want = next;

                                if os_clock_ret - v.applied >= 2 then
                                    apply(v);
                                end;
                            else
                                if next > v.tier or u189 then
                                    v.tier = next;
                                    v.want = next;
                                    apply(v);

                                    return;
                                end;

                                if next ~= v.want then
                                    v.want = next;
                                    v.since = os_clock_ret;
                                end;

                                if os_clock_ret - v.since >= 0.6 then
                                    v.tier = next;
                                    apply(v);
                                end;
                            end;
                        end);
                        v146 = v187;
                    else
                        v146 = v187;
                    end;

                    v187 = v146;
                end;
            end;
        else
            v187 = v146;
        end;

        v146 = v187;
    end;
end);

return {};
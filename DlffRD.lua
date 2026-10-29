-- ============================================================
-- SCRIPT: DlffRD
-- CLASS:  ModuleScript
-- PATH:   DlffRD
-- ============================================================

-- Decompiled with Potassium's decompiler.

local v1 = {};
local RunService = game:GetService("RunService");
local TweenService = game:GetService("TweenService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local LocalPlayer = game.Players.LocalPlayer;
local u2 = nil;
local TweenInfo_new_ret = TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
local TweenInfo_new_ret2 = TweenInfo.new(0.075, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
local TweenInfo_new_ret3 = TweenInfo.new(0.025, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);

function v1.NC() -- Line: 27
    -- upvalues: LocalPlayer (copy), u2 (ref), ReplicatedStorage (copy), RunService (copy), TweenService (copy), TweenInfo_new_ret (copy), TweenInfo_new_ret2 (copy), TweenInfo_new_ret3 (copy)
    local v3 = tick();

    repeat
        wait(0.15);
    until _G.WaitForChar and (_G.GVF and _G.GVF() ~= nil) or (LocalPlayer.Character == nil or tick() - v3 > 30);

    local Character = LocalPlayer.Character;

    if u2 == Character or not Character then
        return;
    end;

    local Torso = Character:WaitForChild("Torso");
    local Humanoid = Character:WaitForChild("Humanoid");
    local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart");
    local _G_GVF_ret = _G.GVF();
    local RagdollSwitch = _G_GVF_ret:WaitForChild("RagdollTime"):WaitForChild("RagdollSwitch");
    local NumberValue = Instance.new("NumberValue", script);
    local NumberValue2 = Instance.new("NumberValue", script);
    local Events = ReplicatedStorage:WaitForChild("Events");
    local __RZDONL = Events:WaitForChild("__RZDONL");
    u2 = Character;
    local u4 = false;
    local u5 = nil;
    local u6 = false;
    local u7 = 0;
    local u8 = false;
    local u9 = false;
    local u10 = 0;
    local l_tick = tick;
    local u11 = 0;
    local u12 = {};
    local u13 = false;
    local u14 = 0;
    local u15 = 0;
    _G.lastClimb = u14;
    _G.lastFall = u15;
    local u16 = {};

    local function ForceChar(p17, p18, p19) -- Line: 85
        if not p17 and p17.Parent then
            return;
        end;

        local BodyForce = Instance.new("BodyForce");
        BodyForce.Force = p18;
        _G.cTag(BodyForce, "BM");
        BodyForce.Parent = p17;
        game.Debris:AddItem(BodyForce, p19);
    end;

    local function AddDB(u20, p21) -- Line: 95
        -- upvalues: u16 (copy)
        u16[u20] = true;
        delay(p21, function() -- Line: 97
            -- upvalues: u16 (ref), u20 (copy)
            u16[u20] = nil;
        end);
    end;

    local u22 = false;
    local u23 = false;
    local u24 = false;

    local function cAdded(p25) -- Line: 106
        -- upvalues: u22 (ref), u24 (ref)
        if p25.Name == "ADONIS_FLIGHT" then
            u22 = true;

            return;
        end;

        if p25:IsA("ForceField") then
            u24 = true;
        end;
    end;

    local function cRemoved(p26) -- Line: 113
        -- upvalues: HumanoidRootPart (copy), u22 (ref), Character (copy), u24 (ref)
        wait();

        if p26.Name == "ADONIS_FLIGHT" and not HumanoidRootPart:FindFirstChild("ADONIS_FLIGHT") then
            u22 = false;

            return;
        end;

        if p26:IsA("ForceField") and not Character:FindFirstChildOfClass("ForceField") then
            u24 = false;
        end;
    end;

    Character.ChildAdded:Connect(cAdded);
    Character.ChildRemoved:Connect(cRemoved);
    HumanoidRootPart.ChildAdded:Connect(cAdded);
    HumanoidRootPart.ChildRemoved:Connect(cRemoved);
    spawn(function() -- Line: 128
        -- upvalues: Character (copy), u22 (ref), u24 (ref), HumanoidRootPart (copy)
        for _, child in pairs(Character:GetChildren()) do
            if child.Name == "ADONIS_FLIGHT" then
                u22 = true;
            elseif child:IsA("ForceField") then
                u24 = true;
            end;
        end;

        for _, child in pairs(HumanoidRootPart:GetChildren()) do
            if child.Name == "ADONIS_FLIGHT" then
                u22 = true;
            elseif child:IsA("ForceField") then
                u24 = true;
            end;
        end;
    end);

    local function RayXD() -- Line: 137
        -- upvalues: HumanoidRootPart (copy)
        local Ray_new_ret = Ray.new(HumanoidRootPart.Position, (HumanoidRootPart.Position - Vector3.new(0, 100, 0) - HumanoidRootPart.Position).Unit * 20);
        local v27, _ = workspace:FindPartOnRayWithWhitelist(Ray_new_ret, { workspace.Map }, true);

        return v27 ~= nil;
    end;

    local function RayXD2(p28, p29) -- Line: 144
        -- upvalues: RayXD2 (copy)
        if p28 and p28.Parent then
            local Ray_new_ret = Ray.new(p28.Position, (p28.Position - Vector3.new(0, 100, 0) - p28.Position).Unit * 3.5);
            local v30, _ = workspace:FindPartOnRayWithIgnoreList(Ray_new_ret, p29, false, true);

            if not (v30 and (v30:IsDescendantOf(workspace.Characters) and not v30.Parent:FindFirstChild("Humanoid"))) then
                return v30;
            end;

            table.insert(p29, v30);

            return RayXD2(p29);
        end;
    end;

    local function BarbedHit(p31) -- Line: 157
    end;

    local v32 = {
        Character:FindFirstChild("Head"),
        Character:FindFirstChild("Torso"),
        Character:FindFirstChild("Right Arm"),
        Character:FindFirstChild("Left Arm"),
        Character:FindFirstChild("Left Leg"),
        Character:FindFirstChild("Right Leg")
    };
    local u33 = 0;

    for _, v in pairs(v32) do
        local v53 = v.Touched:Connect(function(u34) -- Line: 166
            -- upvalues: u22 (ref), u23 (ref), Character (copy), v (copy), u16 (copy), __RZDONL (copy), u6 (ref), NumberValue2 (copy), HumanoidRootPart (copy), Torso (copy), RunService (ref), _G_GVF_ret (copy), u24 (ref), NumberValue (copy), Humanoid (copy), u33 (ref), u8 (ref), u13 (ref), u9 (ref)
            if u22 or u23 then
                return;
            end;

            if u34:IsDescendantOf(Character) then
                return;
            end;

            if u34.Name == "Grinder" and v.Parent == Character then
                if not u16.GH then
                    u16.GH = true;
                    local u35 = "GH";
                    delay(0.3, function() -- Line: 97
                        -- upvalues: u16 (ref), u35 (copy)
                        u16[u35] = nil;
                    end);
                    __RZDONL:FireServer("G_Gh", v, u34);
                    local v36 = false;

                    for _, child in ipairs(Character:GetChildren()) do
                        if child:IsA("ForceField") and child.Name ~= "SpawnFF" then
                            v36 = true;
                        end;
                    end;

                    if v36 or _G.Compliance and _G.Compliance.NoGrinders then
                        u6 = true;

                        return;
                    end;

                    v.RotVelocity = u34.RotVelocity;
                    local u37 = HumanoidRootPart.Velocity + Vector3.new(0, NumberValue2.Value * 2.5, 0);
                    local v38 = math.random() * 100;
                    local v39 = math.random() * 100;
                    local v40 = math.random() * 100;
                    local Vector3_new_ret = Vector3.new(v38, v39, v40);
                    coroutine.wrap(function() -- Line: 199
                        -- upvalues: HumanoidRootPart (ref), u37 (copy), Torso (ref), Vector3_new_ret (copy), RunService (ref)
                        HumanoidRootPart.Velocity = u37;
                        Torso.RotVelocity = Vector3_new_ret;
                        RunService.Heartbeat:Wait();
                        HumanoidRootPart.Velocity = u37;
                        Torso.RotVelocity = Vector3_new_ret;
                        RunService.Heartbeat:Wait();
                        HumanoidRootPart.Velocity = u37;
                        Torso.RotVelocity = Vector3_new_ret;
                        RunService.Heartbeat:Wait();
                    end)();
                    _G.RagdollChar(3);
                    local v41 = HumanoidRootPart;

                    if v41 or not v41.Parent then
                        local BodyForce = Instance.new("BodyForce");
                        BodyForce.Force = Vector3.new(0, 100, 0);
                        _G.cTag(BodyForce, "BM");
                        BodyForce.Parent = v41;
                        game.Debris:AddItem(BodyForce, 0.2);
                    end;
                end;

                u6 = true;
            end;

            if _G_GVF_ret.Grabbed.Value then
                return;
            end;

            if not u24 then
                if NumberValue.Value >= 40 and u34.Name == "Spike" then
                    if not u16.SH then
                        RunService.Stepped:Wait();
                        _G.RagdollChar(1);
                        __RZDONL:FireServer("SSsH", NumberValue.Value, v, u34, HumanoidRootPart.CFrame);
                        u16.SH = true;
                        local u42 = "SH";
                        delay(5, function() -- Line: 97
                            -- upvalues: u16 (ref), u42 (copy)
                            u16[u42] = nil;
                        end);

                        return;
                    end;
                elseif NumberValue.Value >= 0 and (v.Name == "Torso" or v.Name == "Head") and u34.Name == "BarbedWire" then
                    if not (u16.BH or _G_GVF_ret.Currents:FindFirstChild("RBTMVB")) then
                        __RZDONL:FireServer("BHHh", NumberValue.Value, v, u34, HumanoidRootPart.CFrame, HumanoidRootPart.Velocity.Y);
                        u16.BH = true;
                        local u43 = "BH";
                        delay(0.5, function() -- Line: 97
                            -- upvalues: u16 (ref), u43 (copy)
                            u16[u43] = nil;
                        end);
                    end;
                elseif u34.Name == "Kill_Brick" then
                    if not u16.KL_B then
                        __RZDONL:FireServer("KL_B");
                        Humanoid.Health = 0;
                        Humanoid:ChangeState(Enum.HumanoidStateType.Dead);
                        u16.KL_B = true;
                        local u44 = "KL_B";
                        delay(2, function() -- Line: 97
                            -- upvalues: u16 (ref), u44 (copy)
                            u16[u44] = nil;
                        end);
                    end;
                elseif u34.Name == "Zap_Brick" and v == Torso then
                    local function __f() -- Line: 254
                        -- upvalues: u16 (ref), __RZDONL (ref), NumberValue (ref), Torso (ref), u34 (copy), HumanoidRootPart (ref)
                        if not u16._ZB then
                            __RZDONL:FireServer("ZZBb", NumberValue.Value, Torso, u34, HumanoidRootPart.CFrame, HumanoidRootPart.Velocity.Y);
                            u16._ZB = true;
                            local u45 = "_ZB";
                            delay(0.1, function() -- Line: 97
                                -- upvalues: u16 (ref), u45 (copy)
                                u16[u45] = nil;
                            end);
                        end;
                    end;

                    if not u16._ZB then
                        __RZDONL:FireServer("ZZBb", NumberValue.Value, Torso, u34, HumanoidRootPart.CFrame, HumanoidRootPart.Velocity.Y);
                        u16._ZB = true;
                        local u46 = "_ZB";
                        delay(0.1, function() -- Line: 97
                            -- upvalues: u16 (ref), u46 (copy)
                            u16[u46] = nil;
                        end);
                    end;

                    task.spawn(function() -- Line: 261
                        -- upvalues: u33 (ref), Torso (ref), u16 (ref), u34 (copy), __RZDONL (ref), NumberValue (ref), HumanoidRootPart (ref)
                        local math_random_ret = math.random();
                        u33 = math_random_ret;

                        for i = 1, 30 do
                            if u33 ~= math_random_ret or not (Torso and Torso.Parent) then
                                break;
                            end;

                            local v47;

                            if u16._ZB then
                                v47 = i;
                            else
                                v47 = i;

                                for _, v2 in pairs(Torso:GetTouchingParts()) do
                                    if v2 == u34 and not u16._ZB then
                                        __RZDONL:FireServer("ZZBb", NumberValue.Value, Torso, u34, HumanoidRootPart.CFrame, HumanoidRootPart.Velocity.Y);
                                        u16._ZB = true;
                                        local u48 = "_ZB";
                                        delay(0.1, function() -- Line: 97
                                            -- upvalues: u16 (ref), u48 (copy)
                                            u16[u48] = nil;
                                        end);
                                    end;
                                end;
                            end;

                            task.wait(0.04);
                        end;
                    end);
                end;
            end;

            if u34.Name ~= "RG_Part" or (u16.RGP or (_G.RagdollCheck(Character) or Character:GetAttribute("N_RGP_H"))) then
                if not u8 then
                    return;
                end;

                if NumberValue2.Value >= 5 and (u34.Name == "Trampoline" and (NumberValue2.Value >= 25 and not u16.Tramp)) then
                    u6 = true;
                    u13 = false;
                    local X = HumanoidRootPart.Velocity.X;
                    local math_min_ret = math.min(NumberValue2.Value, 500);
                    local Vector3_new_ret = Vector3.new(X, math_min_ret, HumanoidRootPart.Velocity.Z);
                    coroutine.wrap(function() -- Line: 305
                        -- upvalues: Character (ref), Vector3_new_ret (copy), RunService (ref)
                        for i = 1, 3 do
                            local _ = i;

                            for _, child in pairs(Character:GetChildren()) do
                                if child:IsA("BasePart") then
                                    child.Velocity = Vector3_new_ret;
                                end;
                            end;

                            RunService.Heartbeat:Wait();
                        end;
                    end)();
                    u16.Tramp = true;
                    local u49 = "Tramp";
                    delay(1, function() -- Line: 97
                        -- upvalues: u16 (ref), u49 (copy)
                        u16[u49] = nil;
                    end);
                    _G.RagdollChar(1);
                    __RZDONL:FireServer("Tt__h", NumberValue2.Value, u34);
                end;

                if not (u6 or (NumberValue.Value < 5 or not (u34.CanCollide and (not u34:FindFirstChild("NFDD") and (_G.RagdollCheck() or u9)))) or u16["FH" .. v.Name]) then
                    __RZDONL:FireServer("FllH", v, u34, NumberValue.Value);
                    local u50 = "FH" .. v.Name;
                    u16[u50] = true;
                    delay(0.35, function() -- Line: 97
                        -- upvalues: u16 (ref), u50 (copy)
                        u16[u50] = nil;
                    end);
                end;

                if u6 then
                    delay(0.3, function() -- Line: 330
                        -- upvalues: u6 (ref)
                        u6 = false;
                    end);
                end;

                return;
            end;

            __RZDONL:FireServer("HITRGP", u34);
            _G.RagdollChar(1);
            local v51 = HumanoidRootPart;

            if v51 or not v51.Parent then
                local BodyForce = Instance.new("BodyForce");
                BodyForce.Force = Vector3.new(0, 100, 0);
                _G.cTag(BodyForce, "BM");
                BodyForce.Parent = v51;
                game.Debris:AddItem(BodyForce, 0.1);
            end;

            u16.RGP = true;
            local u52 = "RGP";
            delay(0.5, function() -- Line: 97
                -- upvalues: u16 (ref), u52 (copy)
                u16[u52] = nil;
            end);
        end);
        table.insert(u12, v53);
    end;

    local v54 = RagdollSwitch:GetPropertyChangedSignal("Value"):Connect(function() -- Line: 340
        -- upvalues: RagdollSwitch (copy), u5 (ref), HumanoidRootPart (copy), u11 (ref), _G_GVF_ret (copy), u7 (ref), u8 (ref), u4 (ref)
        local Value = RagdollSwitch.Value;
        pcall(function() -- Line: 343
            -- upvalues: u5 (ref)
            u5:Cancel();
        end);

        if not Value then
            u8 = false;
            u4 = false;

            return;
        end;

        if HumanoidRootPart and (HumanoidRootPart.Parent and (u11 and typeof(u11) == "Vector3")) then
            if _G_GVF_ret.Handcuffed.Value then
                HumanoidRootPart.Velocity = u11 * 2;
            else
                HumanoidRootPart.Velocity = u11 * 1.25;
            end;
        end;

        u7 = 0;
        u8 = true;
    end);
    table.insert(u12, v54);

    local function Fall(p55) -- Line: 363
        -- upvalues: Humanoid (copy), RagdollSwitch (copy), u8 (ref), Character (copy), u13 (ref), HumanoidRootPart (copy), u22 (ref), u23 (ref), _G_GVF_ret (copy), __RZDONL (copy), u9 (ref), u10 (ref), u6 (ref)
        local v56 = false;

        if p55 then
            spawn(function() -- Line: 366
                -- upvalues: Humanoid (ref)
                for i = 1, 3 do
                    Humanoid:ChangeState(Enum.HumanoidStateType.Freefall);
                    wait();
                    local _ = i;
                end;
            end);
        end;

        if not RagdollSwitch.Value then
            u8 = false;
        end;

        if Character:FindFirstChildOfClass("ForceField") then
            u13 = false;

            return;
        end;

        local v57 = 0;
        local Y = HumanoidRootPart.CFrame.Position.Y;
        local Position = HumanoidRootPart.CFrame.Position;
        local v58 = 0;
        local v59 = false;
        u13 = true;

        while true do
            local task_wait_ret = task.wait(0.05);
            v57 = v57 + math.min(task_wait_ret, 0.25);

            if Y < HumanoidRootPart.CFrame.Position.Y then
                Y = HumanoidRootPart.CFrame.Position.Y;
            end;

            if (HumanoidRootPart.CFrame.Position - Position).Magnitude < 5 then
                v58 = v58 + 1;
            end;

            if u22 or u23 then
                break;
            end;

            v59 = v58 > 500 and true or v59;

            if not ((p55 and 15 or 45) / _G_GVF_ret.FHPR.Value >= Y - HumanoidRootPart.CFrame.Position.Y and (v57 < 3 or _G_GVF_ret.Handcuffed.Value) or (v56 or Humanoid:GetAttribute("NACTIVFD"))) then
                v56 = true;
                u8 = true;
                __RZDONL:FireServer("__---r", HumanoidRootPart.Velocity, HumanoidRootPart.CFrame, nil);
                u9 = true;
                local math_random_ret = math.random();
                u10 = math_random_ret;
                delay(1, function() -- Line: 416
                    -- upvalues: u10 (ref), math_random_ret (copy), u9 (ref)
                    if u10 == math_random_ret then
                        u9 = false;
                    end;
                end);
                local _ = HumanoidRootPart.Velocity;
                _G.RagdollChar(2);
            end;

            Position = HumanoidRootPart.CFrame.Position;

            if Humanoid:GetState() ~= Enum.HumanoidStateType.Freefall or v59 then
                break;
            end;
        end;

        local Y2 = HumanoidRootPart.CFrame.Position.Y;
        local State = Humanoid:GetState();

        if not (u22 or (Y - Y2 <= 15 or (not u13 or (u6 or State ~= Enum.HumanoidStateType.Landed and (State ~= Enum.HumanoidStateType.Running and State ~= Enum.HumanoidStateType.RunningNoPhysics))))) then
            if u23 then
                Y2 = math.max(Y2, Y - 16);
            end;

            __RZDONL:FireServer("FlllD", Y, Y2, v59);
        end;

        u13 = false;
    end;

    local v62 = Humanoid.StateChanged:Connect(function(p60, p61) -- Line: 454
        -- upvalues: u15 (ref), l_tick (copy), Fall (copy), Character (copy), u14 (ref)
        if p61 == Enum.HumanoidStateType.Freefall then
            u15 = l_tick();
            _G.lastFall = u15;
            Fall(_G.DownedCheck(Character));
        end;

        if p60 == Enum.HumanoidStateType.Climbing and (p61 == Enum.HumanoidStateType.Jumping or p61 == Enum.HumanoidStateType.Freefall) then
            u14 = l_tick();
            _G.lastClimb = u14;
        end;
    end);
    table.insert(u12, v62);
    local v63 = Events:WaitForChild("FallTing").OnClientEvent:Connect(function() -- Line: 473
        -- upvalues: Fall (copy)
        Fall(true);
    end);
    table.insert(u12, v63);
    local u64 = false;

    local function Disconnect() -- Line: 479
        -- upvalues: u64 (ref), u12 (copy)
        if u64 then
            return;
        end;

        u64 = true;

        for _, v in pairs(u12) do
            v:Disconnect();
        end;
    end;

    local u65 = nil;
    u65 = HumanoidRootPart.AncestryChanged:Connect(function(p66, p67) -- Line: 488
        -- upvalues: u65 (ref), u64 (ref), u12 (copy)
        if not p67 then
            u65:Disconnect();
            u65 = nil;

            if u64 then
                return;
            end;

            u64 = true;

            for _, v in pairs(u12) do
                v:Disconnect();
            end;
        end;
    end);
    pcall(function() -- Line: 496
        -- upvalues: _G_GVF_ret (copy), u23 (ref)
        _G_GVF_ret:WaitForChild("Currents", 2).ChildAdded:Connect(function(p68) -- Line: 497
            -- upvalues: u23 (ref)
            if p68.Name == "IGZNFD" then
                u23 = true;
            end;
        end);
        _G_GVF_ret:WaitForChild("Currents", 2).ChildRemoved:Connect(function(p69) -- Line: 502
            -- upvalues: _G_GVF_ret (ref), u23 (ref)
            if p69.Name == "IGZNFD" then
                wait();

                if not _G_GVF_ret.Currents:FindFirstChild("IGZNFD") then
                    u23 = false;
                end;
            end;
        end);
    end);
    local v70 = time();

    while HumanoidRootPart and (HumanoidRootPart.Parent and (u65 ~= nil and not u64)) do
        RunService.Heartbeat:Wait();

        if u5 then
            u5:Cancel();
        end;

        local Velocity = HumanoidRootPart.Velocity;
        u5 = TweenService:Create(NumberValue2, TweenInfo_new_ret, {
            Value = Velocity.Magnitude
        });
        u5:Play();
        local v71 = TweenInfo_new_ret2;

        if u7 < Velocity.Magnitude then
            u7 = Torso.Velocity.Magnitude;
            v71 = TweenInfo_new_ret3;
        end;

        TweenService:Create(NumberValue, v71, {
            Value = Velocity.Magnitude
        }):Play();
        u11 = Velocity;

        if time() - v70 >= 0.5 then
            v70 = time();
            pcall(function() -- Line: 534
                -- upvalues: Torso (copy), u16 (copy), _G_GVF_ret (copy), __RZDONL (copy), NumberValue (copy), HumanoidRootPart (copy), Humanoid (copy)
                for _, v in pairs(Torso:GetTouchingParts()) do
                    if v.Name == "BarbedWire" and not (u16.BH or _G_GVF_ret.Currents:FindFirstChild("RBTMVB")) then
                        __RZDONL:FireServer("BHHh", NumberValue.Value, Torso, v, HumanoidRootPart.CFrame, HumanoidRootPart.Velocity.Y);
                        u16.BH = true;
                        local u72 = "BH";
                        delay(0.5, function() -- Line: 97
                            -- upvalues: u16 (ref), u72 (copy)
                            u16[u72] = nil;
                        end);

                        return;
                    end;

                    if v.Name == "Zap_Brick" and not u16._ZB then
                        __RZDONL:FireServer("ZZBb", NumberValue.Value, Torso, v, HumanoidRootPart.CFrame, HumanoidRootPart.Velocity.Y);
                        u16._ZB = true;
                        local u73 = "_ZB";
                        delay(0.1, function() -- Line: 97
                            -- upvalues: u16 (ref), u73 (copy)
                            u16[u73] = nil;
                        end);
                    elseif v.Name == "Kill_Brick" and not u16.KL_B then
                        __RZDONL:FireServer("KL_B");
                        Humanoid.Health = 0;
                        Humanoid:ChangeState(Enum.HumanoidStateType.Dead);
                        u16.KL_B = true;
                        local u74 = "KL_B";
                        delay(2, function() -- Line: 97
                            -- upvalues: u16 (ref), u74 (copy)
                            u16[u74] = nil;
                        end);
                    end;
                end;
            end);
        end;
    end;
end;

return v1;
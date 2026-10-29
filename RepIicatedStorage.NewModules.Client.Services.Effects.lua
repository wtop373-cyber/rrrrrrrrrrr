-- ============================================================
-- SCRIPT: Effects
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Effects
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
game:GetService("UserInputService");
game:GetService("RunService");
game:GetService("TweenService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local RunService = game:GetService("RunService");
game:GetService("Debris");
workspace:WaitForChild("Debris");
local NewModules = ReplicatedStorage:WaitForChild("NewModules");
require(NewModules.Shared.Services.Damage);
local RayHandler = require(NewModules.Shared.Services.RayHandler);
local workspace_CurrentCamera = workspace.CurrentCamera;
local LocalPlayer = game.Players.LocalPlayer;
local Storage = ReplicatedStorage:WaitForChild("Storage");
local Events = ReplicatedStorage:WaitForChild("Events");
local Events2 = ReplicatedStorage:WaitForChild("Events2");
local u2 = {};
local u3 = {};

local function ProjectHandle(u4, p5, p6) -- Line: 30
    -- upvalues: RayHandler (copy), LocalPlayer (copy), RunService (copy)
    local u7 = nil;
    local u8 = nil;
    local u9 = nil;
    local u10 = nil;
    local u11 = nil;
    local u12 = nil;
    local CFrame2 = u4.CFrame;
    local _ = u4.Size;
    u4.Anchored = false;
    local u13 = false;
    local u14 = 0;
    local BindableEvent = Instance.new("BindableEvent");

    local function DISC() -- Line: 45
        -- upvalues: u11 (ref), u12 (ref), BindableEvent (copy)
        if not (u11 and u12) then
            return;
        end;

        u11:Disconnect();
        u12:Disconnect();
        u11 = nil;
        u12 = nil;
        BindableEvent:Fire();
    end;

    local u15 = tick();

    local function Do(p16) -- Line: 56
        -- upvalues: CFrame2 (ref), u4 (copy), RayHandler (ref), LocalPlayer (ref), u14 (ref), u7 (ref), u8 (ref), u9 (ref), u10 (ref), u15 (copy), u11 (ref), u12 (ref), BindableEvent (copy)
        local p = CFrame2.p;
        local p2 = u4.CFrame.p;

        if 1200 * p16 < (p - p2).Magnitude then
            u4.CFrame = CFrame2;

            return;
        end;

        local v17 = math.min(u4.Velocity.Magnitude, 1000) / 233;
        local math_max_ret = math.max(v17, 1);
        local Ray_new_ret = Ray.new(p, math_max_ret * (p2 - p));
        local u18 = { u4, workspace.CurrentCamera };

        local function rayDo() -- Line: 77
            -- upvalues: RayHandler (ref), Ray_new_ret (copy), u18 (copy), LocalPlayer (ref), u14 (ref), rayDo (copy)
            local v19, v20, v21 = RayHandler.CastRay(Ray_new_ret, u18, {
                type = "m"
            });

            if not v19 or (v19:FindFirstChild("CanHitT") or v19.Name ~= "DFrame" and not (v19:FindFirstChild("FilterV") or v19:IsDescendantOf(LocalPlayer.Character) and u14 <= 4)) then
                return v19, v20, v21;
            end;

            table.insert(u18, v19);

            return rayDo();
        end;

        local v22, v23, v24 = rayDo();

        if v22 and (v23 and v24) then
            u7 = v22.CFrame;
            u8 = v23;
            u9 = v24;
            u10 = v22;
        end;

        if u7 or time() - u15 >= 30 then
            if u11 then
                if not u12 then
                    return;
                end;

                u11:Disconnect();
                u12:Disconnect();
                u11 = nil;
                u12 = nil;
                BindableEvent:Fire();
            end;

            return;
        end;

        CFrame2 = u4.CFrame;
        u14 = u14 + 1;
    end;

    u11 = u4.AncestryChanged:Connect(function(p25, p26) -- Line: 117
        -- upvalues: u13 (ref), u7 (ref), u11 (ref), u12 (ref), BindableEvent (copy)
        if not p26 then
            u13 = true;
            u7 = "";

            if u11 then
                if not u12 then
                    return;
                end;

                u11:Disconnect();
                u12:Disconnect();
                u11 = nil;
                u12 = nil;
                BindableEvent:Fire();
            end;
        end;
    end);
    u12 = RunService.Heartbeat:Connect(Do);
    BindableEvent.Event:Wait();
    BindableEvent:Destroy();

    if u4 and u4.Parent then
        u4.Anchored = true;
    end;

    if not p5 or u7 == "" then
        return u7, u8, u9, u10;
    end;

    p5:FireServer(u4, u7, u8, u9, u10);
end;

function ExplosionHandle(p27, p28, p29)
    -- upvalues: Events2 (copy)
    if not (p27 and p27.Parent) then
        return;
    end;

    if p27:GetAttribute("PartEmit") then
        for _, child in pairs(p27:GetChildren()) do
            if child:IsA("ParticleEmitter") then
                local v30 = child:GetAttribute("EmitCount") or child:FindFirstChild("Emit") and child:FindFirstChild("Emit").Value;

                if v30 then
                    child:Emit(v30);
                end;
            end;
        end;
    elseif p27:FindFirstChild("Attachment") then
        for _, child in pairs(p27.Attachment:GetChildren()) do
            if child:IsA("ParticleEmitter") then
                local v31 = child:GetAttribute("EmitCount") or child:FindFirstChild("Emit") and child:FindFirstChild("Emit").Value;

                if v31 then
                    child:Emit(v31);
                end;
            end;
        end;
    end;

    if p28 then
        p28:Play();
        Events2.MonitorSound:Fire(unpack(p29));
    end;
end;

local function MonitorChain(p32) -- Line: 171
    math.random();
    local HHandle = p32:WaitForChild("HHandle");
    local u33 = true;
    p32.AncestryChanged:Connect(function(p34, p35) -- Line: 177
        -- upvalues: u33 (ref)
        if not (p35 and p35:FindFirstChild("Humanoid")) then
            u33 = false;
        end;
    end);
    local _ = HHandle.Chain.Chain1;
    local _ = HHandle.Chain.Chain2;
    tick();

    while u33 do
        task.wait();

        if not (u33 and HHandle.Parent) then
            break;
        end;

        local Chain1 = HHandle.Chain.Chain1;
        local Chain2 = HHandle.Chain.Chain2;

        if _G.VM and _G.VM.Check(p32) then
            if HHandle == p32.HHandle then
                HHandle.Chain.Chain1.Transparency = 1;
                HHandle.Chain.Chain2.Transparency = 1;
            end;

            Chain1 = _G.VM.CloneTool:FindFirstChild("Chain1");
            Chain2 = _G.VM.CloneTool:FindFirstChild("Chain2");
        else
            HHandle = p32.HHandle;
        end;

        Chain1.Transparency = 0;
        Chain2.Transparency = 1;
        task.wait();
        Chain1.Transparency = 1;
        Chain2.Transparency = 0;
    end;
end;

function Remove(u36, p37)
    -- upvalues: u3 (copy)
    if u3[u36] then
        if p37 then
            u3[u36].Anchored = true;
            u3[u36].Transparency = 1;

            if u3[u36]:FindFirstChild("Trail") then
                u3[u36].Trail.Enabled = false;
            end;

            for _, child in pairs(u3[u36]:GetChildren()) do
                if child:IsA("Trail") or child:IsA("Attachment") then
                    if child:IsA("Attachment") then
                        for _, child2 in pairs(child:GetChildren()) do
                            if child2:IsA("ParticleEmitter") then
                                child2:Destroy();
                            end;
                        end;
                    end;
                else
                    child:Destroy();
                end;
            end;
        else
            pcall(function() -- Line: 220
                -- upvalues: u3 (ref), u36 (copy)
                u3[u36]:Destroy();
            end);
        end;

        u3[u36] = nil;
    end;
end;

local v38 = not _G.ClientEffectsMLoaded;
_G.ClientEffectsMLoaded = true;

if v38 then
    Events:WaitForChild("Create_C4").OnClientEvent:Connect(function(p39, u40, p41, p42, u43) -- Line: 252
        -- upvalues: workspace_CurrentCamera (copy), LocalPlayer (copy), Storage (copy), u3 (copy), RunService (copy), RayHandler (copy)
        local _, v44 = workspace_CurrentCamera:WorldToScreenPoint(p41.p);

        if u40 ~= LocalPlayer and ((p41.p - workspace_CurrentCamera.CFrame.p).Magnitude >= 150 and not v44) then
            return;
        end;

        local u45 = Storage:WaitForChild("F_C4"):Clone();
        game.Debris:AddItem(u45, 60);
        u45.Name = "TransIgnore";
        local _ = u45.Size;
        u45.CFrame = p41 * CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966);
        u45.Parent = workspace.Debris.VParts;
        u45.CanCollide = false;
        u45.Anchored = false;
        u45.Beep.Playing = true;
        u45.X.EM.Enabled = true;
        u3[p39] = u45;

        if p42 then
            u45.Velocity = typeof(p42) == "CFrame" and Vector3.new(0, 0, 0) or p42;
        end;

        local BodyForce = Instance.new("BodyForce");
        _G.cTag(BodyForce, "BM");
        BodyForce.Force = Vector3.new(0, 2, 0);
        BodyForce.Parent = u45;
        local u46 = nil;

        local function GotFunc(u47, u48, u49) -- Line: 285
            -- upvalues: u45 (copy), u46 (ref), u40 (copy), LocalPlayer (ref), u43 (copy)
            pcall(function() -- Line: 286
                -- upvalues: u45 (ref), u48 (ref), u46 (ref), u49 (copy), u40 (ref), LocalPlayer (ref), u43 (ref), u47 (copy)
                local _ = u45.CFrame;
                local Y = u45.Orientation.Y;
                u48 = u48 + Vector3.new(0, 0.2, 0);

                if u46 then
                    u46:Disconnect();
                    u46 = nil;
                end;

                local v50 = CFrame.new(u48, u48 + u49) * CFrame.Angles(-1.5707963267948966, 0, 0);
                local v51 = (v50 + v50.UpVector * 0.2) * CFrame.Angles(0, math.rad(Y), 0);
                u45.CFrame = v51;
                u45.Massless = true;
                u45.CanCollide = false;
                u45.Anchored = true;

                if u40 == LocalPlayer then
                    u43:FireServer("Do", u47, v51);
                end;

                return true;
            end);

            return false;
        end;

        local u52 = p41;
        u46 = RunService.Heartbeat:Connect(function(p53) -- Line: 318
            -- upvalues: u52 (ref), u45 (copy), u43 (copy), RayHandler (ref), u46 (ref), u40 (copy), LocalPlayer (ref)
            local p = u52.p;
            local p2 = u45.CFrame.p;

            if u43 and 600 * p53 < (p - p2).Magnitude then
                u45.CFrame = u52;

                return;
            end;

            local Ray_new_ret = Ray.new(p, 2.5 * (p2 - p));
            local u54 = { workspace.Characters };

            local function u58() -- Line: 356
                -- upvalues: RayHandler (ref), Ray_new_ret (copy), u54 (copy), u58 (copy)
                local v55, v56, v57 = RayHandler.CastRay(Ray_new_ret, u54, {
                    type = "m"
                });

                if not (v55 and (v55 ~= workspace.Terrain and (v55.Name == "DFrame" or not v55.CanCollide))) then
                    return v55, v56, v57;
                end;

                table.insert(u54, v55);

                return u58();
            end;

            local u59, v60, u61 = u58();

            if u59 then
                local u62 = v60;
                pcall(function() -- Line: 286
                    -- upvalues: u45 (ref), u62 (ref), u46 (ref), u61 (copy), u40 (ref), LocalPlayer (ref), u43 (ref), u59 (copy)
                    local _ = u45.CFrame;
                    local Y = u45.Orientation.Y;
                    u62 = u62 + Vector3.new(0, 0.2, 0);

                    if u46 then
                        u46:Disconnect();
                        u46 = nil;
                    end;

                    local v63 = CFrame.new(u62, u62 + u61) * CFrame.Angles(-1.5707963267948966, 0, 0);
                    local v64 = (v63 + v63.UpVector * 0.2) * CFrame.Angles(0, math.rad(Y), 0);
                    u45.CFrame = v64;
                    u45.Massless = true;
                    u45.CanCollide = false;
                    u45.Anchored = true;

                    if u40 == LocalPlayer then
                        u43:FireServer("Do", u59, v64);
                    end;

                    return true;
                end);

                if false then
                    u46:Disconnect();
                end;
            end;

            u52 = u45.CFrame;
        end);
        local u65 = nil;
        u65 = u45.AncestryChanged:Connect(function(p66, p67) -- Line: 380
            -- upvalues: u43 (copy), u46 (ref), u65 (ref)
            if not p67 then
                if u43 then
                    u43:FireServer("Lost");
                end;

                if u46 then
                    u46:Disconnect();
                end;

                if u65 then
                    u65:Disconnect();
                end;

                u46 = nil;
                u65 = nil;
            end;
        end);
        task.wait(10);

        if u46 then
            u46:Disconnect();
        end;

        if u65 then
            u65:Disconnect();
        end;
    end);
    Events:WaitForChild("Monitor_C4").OnClientEvent:Connect(function(u68, p69, p70) -- Line: 406
        -- upvalues: LocalPlayer (copy), Events2 (copy)
        local Character = LocalPlayer.Character;
        local _ = Character.HumanoidRootPart;
        local _ = Character.Humanoid;
        Events2.AddExtraInteract:Fire(p69, p70, { "Pickup" }, 0, Enum.KeyCode.E, function() -- Line: 411, Name: customFunc
            -- upvalues: Character (copy), u68 (copy)
            return Character:FindFirstChild(u68.Name);
        end);
    end);
    Events:WaitForChild("MonitorTool").OnClientEvent:Connect(MonitorChain);
    Events:WaitForChild("RemoveObject").OnClientEvent:Connect(Remove);
    Events:WaitForChild("ExplosionEffect").OnClientEvent:Connect(ExplosionHandle);
    Events:WaitForChild("SupplyPlaneHandler").OnClientEvent:Connect(function(p71) -- Line: 424
    end);
    Events:WaitForChild("SupplyBoxHandler").OnClientEvent:Connect(function(p72) -- Line: 428
        local _ = p72.Box.HitBox;
        local Attachment = p72.Parachute.Canister.Attachment;
        Attachment.ParticleEmitter.Enabled = false;
        task.wait();
        Attachment.ParticleEmitter.Enabled = true;
    end);
    Events:WaitForChild("ForceClientParticles").OnClientEvent:Connect(function(p73) -- Line: 440
        -- upvalues: RunService (copy)
        for _, v in pairs(p73) do
            v.Enabled = false;
        end;

        RunService.Heartbeat:Wait();

        for _, v in pairs(p73) do
            v.Enabled = true;
        end;
    end);
    Events:WaitForChild("ProjectileHandle").OnClientInvoke = ProjectHandle;
    Events:WaitForChild("ProjectileHandle2").OnClientEvent:Connect(ProjectHandle);
end;

local function doEffect(p74, ...) -- Line: 454
    -- upvalues: u2 (copy)
    if not u2[p74] and script:FindFirstChild(p74) then
        u2[p74] = require(script[p74]);
    end;

    if u2[p74] then
        return u2[p74](...);
    end;
end;

if v38 then
    Events:WaitForChild("Effect").OnClientEvent:connect(function(...) -- Line: 467
        -- upvalues: doEffect (copy)
        doEffect(...);
    end);

    function _G._DoEffect(...) -- Line: 471
        -- upvalues: doEffect (copy)
        return doEffect(...);
    end;
end;

return doEffect;
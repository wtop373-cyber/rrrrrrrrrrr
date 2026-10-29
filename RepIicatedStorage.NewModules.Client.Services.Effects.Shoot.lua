-- ============================================================
-- SCRIPT: Shoot
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Effects.Shoot
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 15
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
local ReplicatedStorage = game:GetService("ReplicatedStorage");
game:GetService("TweenService");
game:GetService("RunService");
game:GetService("SoundService");
game:GetService("PhysicsService");
local Workspace = game:GetService("Workspace");
local Debris = game:GetService("Debris");
local CurrentCamera = Workspace.CurrentCamera;
Workspace:WaitForChild("Debris");
local NewModules = ReplicatedStorage:WaitForChild("NewModules");
local GetConfig = require(NewModules.Shared.Extensions.GetConfig);
local ShellOut = require(script.Parent:WaitForChild("ShellOut"));
local LocalPlayer = game.Players.LocalPlayer;

local function DistToBullet(p2, p3, p4) -- Line: 41
    local v5 = p3:Dot(p4) / (p3.Magnitude * p4.Magnitude);
    local math_clamp_ret = math.clamp(v5, -1, 1);
    local math_acos_ret = math.acos(math_clamp_ret);
    local Magnitude = p3.Magnitude;

    if math_acos_ret > 1.5707963267948966 then
        return Magnitude;
    end;

    return math.sin(math_acos_ret) * Magnitude;
end;

local function u6(...) -- Line: 52
    -- upvalues: ShellOut (copy)
    ShellOut(...);
end;

return function(p7, p8, u9, u10, p11, p12, p13) -- Line: 56
    -- upvalues: LocalPlayer (copy), GetConfig (copy), ReplicatedStorage (copy), CurrentCamera (copy), Debris (copy), u6 (copy)
    if p7 == LocalPlayer then
        return;
    end;

    local success, result = pcall(function() -- Line: 59
        -- upvalues: GetConfig (ref), u10 (copy)
        return GetConfig(u10, true);
    end);

    if not (success and result) then
        return;
    end;

    ReplicatedStorage.Events2.Visualize:Fire(p7, p8, result, u10, u9, p11, p12, p13);

    local function CanSeeCheck(p14, p15) -- Line: 69
        -- upvalues: CurrentCamera (ref), u9 (copy)
        local _, v16 = CurrentCamera:WorldToScreenPoint(p14);
        local v17 = u9;

        if v17 then
            v16 = v17;
        elseif v16 then
            v16 = (CurrentCamera.CFrame.p - p14).Magnitude < p15;
        end;

        return v16;
    end;

    local _ = p13.BulletType;
    local fpT = p13.fpT;
    local v18 = u10:FindFirstChild(result.HandleName or "Handle");
    local Muzzle = v18.Muzzle;
    local _ = v18.FirePos;
    local Value = u10.Values.Ammo.Value;
    u10:FindFirstChild("Attachments");

    if v18:FindFirstChild("ReloadSound_Clone") then
        v18.ReloadSound_Clone:Destroy();
    end;

    local v19 = 0;

    for _, child in pairs(Muzzle:GetChildren()) do
        if string.match(child.Name, "FireSound%d+") then
            v19 = v19 + 1;
        end;
    end;

    local u20 = nil;
    local u21;

    if result.MinigunEnabled then
        u21 = Muzzle:FindFirstChild("FireLoop______");
    else
        local v22 = Muzzle["FireSound" .. tostring(math.random(v19))];
        u21 = v22:Clone();
        u21.Name = "FireSound_Clone";
        u21.Parent = Muzzle;
        Debris:AddItem(u21, v22.TimeLength / u21.PlaybackSpeed + 0.5);

        if Muzzle:FindFirstChild("FFireSoundTWO") then
            u20 = Muzzle.FFireSoundTWO:Clone();
            u20.Name = "FireSound_2_Clone";
            u20.Parent = Muzzle;
            Debris:AddItem(u20, Muzzle.FFireSoundTWO.TimeLength / u20.PlaybackSpeed + 0.5);
        end;
    end;

    if u21 then
        local math_floor_ret = math.floor(result.MagSize * 0.45);

        if Value < math_floor_ret then
            local v23 = (math_floor_ret - Value) / math_floor_ret;
            local AmmoEqualizer = u21:FindFirstChild("AmmoEqualizer");

            if not AmmoEqualizer then
                AmmoEqualizer = script.AmmoEqualizer:Clone();
                AmmoEqualizer.Parent = u21;
            end;

            AmmoEqualizer.LowGain = -7 * v23;
            AmmoEqualizer.HighGain = 7 * v23;

            if u20 then
                local AmmoEqualizer2 = u20:FindFirstChild("AmmoEqualizer");

                if not AmmoEqualizer2 then
                    AmmoEqualizer2 = script.AmmoEqualizer:Clone();
                    AmmoEqualizer2.Parent = u20;
                end;

                AmmoEqualizer2.LowGain = -7 * v23;
                AmmoEqualizer2.HighGain = 7 * v23;
            end;
        end;

        local math_min_ret = math.min(((CurrentCamera.CFrame.p - p11).Magnitude / 500) ^ 3, 2);

        if math_min_ret >= 0.1 then
            local v24 = script.DistanceEqualizer:Clone();
            v24.HighGain = math_min_ret * -10;
            v24.MidGain = math_min_ret * -5;
            v24.LowGain = math_min_ret * -5;
            v24.Parent = u21;

            if u20 then
                local v25 = script.DistanceEqualizer:Clone();
                v25.HighGain = math_min_ret * -10;
                v25.MidGain = math_min_ret * -5;
                v25.LowGain = math_min_ret * -5;
                v25.Parent = u20;
            end;
        end;

        if not result.MinigunEnabled then
            if u9 and fpT then
                u21 = u21:Clone();
                u21.Parent = CurrentCamera;
                Debris:AddItem(u21, 4);

                if u20 then
                    u20 = u20:Clone();
                    u20.Parent = CurrentCamera;
                    Debris:AddItem(u20, 4);
                end;
            end;

            if u10:GetAttribute("HasShotM") and u10:FindFirstChild("ShotM") then
                pcall(function() -- Line: 190
                    -- upvalues: u10 (copy), u21 (ref), u20 (ref)
                    require(u10.ShotM)(u21, u20);
                end);
            end;

            u21.PlaybackSpeed = u21.PlaybackSpeed * (math.random(900, 1100) / 1000);
            u21:Play();

            if u20 then
                u20.PlaybackSpeed = u20.PlaybackSpeed * (math.random(900, 1100) / 1000);
                u20:Play();
            end;
        end;
    end;

    local FlashSettings = result.FlashSettings;

    if not _G.Y8OTOP and FlashSettings.Enabled then
        local Position = v18.Position;
        local _, v26 = CurrentCamera:WorldToScreenPoint(Position);

        if u9 then
            v26 = u9;
        elseif v26 then
            v26 = (CurrentCamera.CFrame.p - Position).Magnitude < 100;
        end;

        if v26 then
            local PointLight = Instance.new("PointLight");
            PointLight.Brightness = FlashSettings.Brightness;
            PointLight.Color = FlashSettings.Color;
            PointLight.Shadows = FlashSettings.Shadows;
            PointLight.Range = FlashSettings.Range;
            PointLight.Parent = Muzzle;
            Debris:AddItem(PointLight, FlashSettings.Time);
        end;
    end;

    if result.Silenced then
        u21.PlaybackSpeed = u21.PlaybackSpeed * 1.5;
        script.SilencedEqualizer:Clone().Parent = u21;
    else
        local Position = v18.Position;
        local _, v27 = CurrentCamera:WorldToScreenPoint(Position);

        if u9 then
            v27 = u9;
        elseif v27 then
            v27 = (CurrentCamera.CFrame.p - Position).Magnitude < 150;
        end;

        if v27 then
            local v28;

            if u9 and fpT then
                v28 = fpT[v18.Name][Muzzle.Name];
            else
                v28 = Muzzle;
            end;

            local MuzzleFlashEmitCount = result.MuzzleFlashEmitCount;

            if _G.Y8OTOP then
                MuzzleFlashEmitCount = math.max(MuzzleFlashEmitCount / 2, 1);
            end;

            if v28:GetAttribute("AdvancedEmitter") and (_G.GSettings ~= nil and _G.GSettings.AdvancedEmitter) then
                for _, child in pairs(v28:GetChildren()) do
                    if child:isA("ParticleEmitter") and not child:GetAttribute("AdvancedIgnore") then
                        local v29 = child:GetAttribute("EmitCount") or 1;
                        local Attribute = child:GetAttribute("Chance1");

                        if not Attribute or math.random(1, Attribute) == 1 then
                            child:Emit(v29);
                        end;
                    end;
                end;
            else
                if Muzzle:FindFirstChild("FlashEmitter") then
                    v28.FlashEmitter:Emit(MuzzleFlashEmitCount);
                end;

                if v28:FindFirstChild("FlashEmitter2") then
                    v28.FlashEmitter2:Emit(MuzzleFlashEmitCount);
                end;

                if v28:FindFirstChild("SmokeEmitter") then
                    v28.SmokeEmitter:Emit(result.MuzzleFlashEmitCount);
                end;
            end;
        end;
    end;

    if _G.GSettings ~= nil and (_G.GSettings.ShellEjection and not (result.ShotgunSettings.FirePump or result.SniperReload)) then
        local Position = v18.Position;
        local _, v30 = CurrentCamera:WorldToScreenPoint(Position);

        if u9 then
            v30 = u9;
        elseif v30 then
            v30 = (CurrentCamera.CFrame.p - Position).Magnitude < 50;
        end;

        if v30 then
            local v31 = u10:GetAttribute("HasShellModifyM") and u10.ShellModifyM;
            u6(result, v18, nil, fpT, u9, v31);
        end;
    end;
end;
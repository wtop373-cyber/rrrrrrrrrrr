-- ============================================================
-- SCRIPT: ShellOut
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Effects.ShellOut
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
local ReplicatedStorage = game:GetService("ReplicatedStorage");
game:GetService("TweenService");
local PhysicsService = game:GetService("PhysicsService");
local Workspace = game:GetService("Workspace");
game:GetService("Debris");
local CurrentCamera = Workspace.CurrentCamera;
local Debris = Workspace:WaitForChild("Debris");

local function CanSeeCheck(p2, p3, p4) -- Line: 13
    -- upvalues: CurrentCamera (copy)
    local _, v5 = CurrentCamera:WorldToScreenPoint(p2);

    if p4 or v5 then
        v5 = (CurrentCamera.CFrame.p - p2).Magnitude < p3;
    end;

    return v5;
end;

return function(u6, p7, p8, p9, p10, p11) -- Line: 19
    -- upvalues: CurrentCamera (copy), ReplicatedStorage (copy), PhysicsService (copy), Debris (copy)
    if u6.ShellOutSettings.Do then
        local Position = p7.Position;
        local _, v12 = CurrentCamera:WorldToScreenPoint(Position);

        if p10 or v12 then
            v12 = (CurrentCamera.CFrame.p - Position).Magnitude < 75;
        end;

        if v12 then
            local ShellType = u6.ShellType;
            local Vel = u6.ShellOutSettings.Vel;
            local Vec = u6.ShellOutSettings.Vec;
            local RotVel = u6.ShellOutSettings.RotVel;

            if not (p7 and p7.Parent) then
                return;
            end;

            local ShellOutPos = p7:FindFirstChild("ShellOutPos");

            if not ShellOutPos then
                return;
            end;

            if p9 and p9:FindFirstChild(p7.Name) then
                ShellOutPos = p9[p7.Name].ShellOutPos;
            end;

            local u13 = ReplicatedStorage.Storage.Shells[ShellType]:Clone();

            if p8 == "RB" then
                u13.BrickColor = BrickColor.new("Institutional white");
                u13.TextureID = "";
            end;

            local v14 = u13:GetAttribute("IgnorePBR") and not (p10 and (not _G.GSettings or _G.GSettings.PBRTextures)) and u13:FindFirstChildOfClass("SurfaceAppearance");

            if v14 then
                v14:Destroy();
            end;

            game.Debris:AddItem(u13, 2);
            local WorldCFrame = ShellOutPos.WorldCFrame;
            local CFrame_Angles = CFrame.Angles;
            local v15 = math.random(-700, 700) / 100;
            local math_rad_ret = math.rad(v15);
            local v16 = math.random(-700, 700) / 100;
            local v17 = WorldCFrame * CFrame_Angles(math_rad_ret, 0, (math.rad(v16)));
            u13.Velocity = u13:GetMass() * (v17.LookVector * Vel * Vec) + p7.Velocity;

            if u6.ShellOutSettings.RotSpawn ~= nil then
                v17 = v17 * u6.ShellOutSettings.RotSpawn;
            end;

            u13.CFrame = v17;
            local v18 = math.random(RotVel / 100, RotVel * 100) / 100;
            local v19 = math.random(RotVel / 100, RotVel * 100) / 100;
            local v20 = math.random(RotVel / 100, RotVel * 100) / 100;
            u13.RotVelocity = Vector3.new(v18, v19, v20);
            pcall(function() -- Line: 61
                -- upvalues: u13 (copy), PhysicsService (ref)
                u13.CollisionGroupId = PhysicsService:GetCollisionGroupId("NoCharCollide");
                u13.CanCollide = true;
            end);
            u13.Anchored = false;

            if p11 then
                local Attribute = p11:GetAttribute("LimitedHolder");

                if not Attribute or Attribute == p7.Parent.Name then
                    require(p11)(u13);
                end;
            end;

            u13.Parent = Debris.VParts;
            delay(0.15, function() -- Line: 78
                -- upvalues: u13 (copy), u6 (copy), ReplicatedStorage (ref)
                if u13.Parent then
                    local u21 = nil;
                    u21 = u13.Touched:Connect(function() -- Line: 81
                        -- upvalues: u21 (ref), u6 (ref), ReplicatedStorage (ref), u13 (ref)
                        u21:Disconnect();
                        local v22;

                        if u6.ShellOutSettings.ShellSound then
                            local v23 = ReplicatedStorage.Storage.GunClient[(u6.ShellOutSettings.IsSG and "ShellCasing" or "BulletCasing") .. math.random(1, 2)]:Clone();
                            v22 = u6.ShellOutSettings.ShellSound_PitchMulti or 1;
                            v23.PlaybackSpeed = v23.PlaybackSpeed * (math.random(80, 120) / 100 * v22);
                            v23.Parent = u13;
                            v23:Play();
                        else
                            v22 = 1;
                        end;

                        game.Debris:AddItem(u13, 0.5 / v22);
                    end);
                end;
            end);
        end;
    end;
end;
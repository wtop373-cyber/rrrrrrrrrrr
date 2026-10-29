-- ============================================================
-- SCRIPT: Damage
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Effects.Damage
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
game:GetService("RunService");
local Workspace = game:GetService("Workspace");
local Debris = game:GetService("Debris");
Workspace:WaitForChild("Debris");
local Events2 = ReplicatedStorage:WaitForChild("Events2");
local HitStuff = ReplicatedStorage:WaitForChild("Storage"):WaitForChild("HitStuff");
local Main = HitStuff.Main;
local NewModules = ReplicatedStorage:WaitForChild("NewModules");
local PlaceDecals = require(NewModules.Shared.Extensions.PlaceDecals);
local LocalPlayer = game.Players.LocalPlayer;

local function lookAt(p2, p3) -- Line: 40
    local Unit = (p3 - p2).Unit;
    local v4 = Unit:Cross(Vector3.new(0, 1, 0));
    local v5 = v4:Cross(Unit);

    return CFrame.fromMatrix(p3, v4, v5);
end;

local math_acos = math.acos;
local math_sin = math.sin;
local math_cos = math.cos;
local math_random = math.random;
local Vector3_new = Vector3.new;
local workspace_CurrentCamera = workspace.CurrentCamera;

local function vector_random(p6, p7) -- Line: 58
    -- upvalues: math_random (copy), math_acos (copy), math_sin (copy), math_cos (copy), Vector3_new (copy)
    local v8 = math_acos(1 - 2 * math_random()) / 3;
    local v9 = math_sin(v8) * 1.7320508075688772 - math_cos(v8);
    local v10 = ((1 - v9 * v9) * math_random()) ^ 0.5;
    local v11 = 6.28318 * math_random();
    local v12 = v10 * math_cos(v11);
    local v13 = v10 * math_sin(v11);

    if p7 then
        local v14 = (p6 + (p7 - p6) * math_random()) / (v12 * v12 + v13 * v13 + v9 * v9) ^ 0.5;

        return Vector3_new(v14 * v12, v14 * v13, v14 * v9);
    end;

    if p6 then
        return Vector3_new(p6 * v12, p6 * v13, p6 * v9);
    end;

    return Vector3_new(v12, v13, v9);
end;

return function(p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27, p28) -- Line: 76
    -- upvalues: LocalPlayer (copy), workspace_CurrentCamera (copy), Debris (copy), HitStuff (copy), Main (copy), Workspace (copy), Events2 (copy), PlaceDecals (copy)
    if p15 == LocalPlayer then
        return;
    end;

    if not (p19 and p19.Parent) then
        return;
    end;

    local u29 = p19 and p19.Parent and p19.Parent:FindFirstChild("Humanoid");

    local function CanSeeCheck(p30, p31) -- Line: 86
        -- upvalues: workspace_CurrentCamera (ref), u29 (copy), LocalPlayer (ref)
        local _, v32 = workspace_CurrentCamera:WorldToScreenPoint(p30);

        if u29.Parent == LocalPlayer.Character then
            v32 = true;
        elseif v32 then
            v32 = (workspace_CurrentCamera.CFrame.p - p30).Magnitude < p31;
        end;

        return v32;
    end;

    local Parent = u29.Parent;
    local v33 = Parent == LocalPlayer.Character;
    local _, v34 = workspace_CurrentCamera:WorldToScreenPoint(p20);

    if u29.Parent == LocalPlayer.Character then
        v34 = true;
    elseif v34 then
        v34 = (workspace_CurrentCamera.CFrame.p - p20).Magnitude < 250;
    end;

    if v34 then
        local v35 = "HitSounds";
        local v36 = nil;

        if p22 and p22.SHKW then
            local Attachment = Instance.new("Attachment");
            Debris:AddItem(Attachment, 3);
            Attachment.Parent = p19;
            local CFrame_new_ret = CFrame.new(p20, p20 + p21);
            local CFrame_Angles = CFrame.Angles;
            local math_random_ret = math.random(0, 360);
            Attachment.WorldCFrame = CFrame_new_ret * CFrame_Angles(0, 0, (math.rad(math_random_ret)));
            local Absorb = HitStuff.HitEffects.Absorb;

            if _G.GSettings ~= nil and _G.GSettings.BulletSparks then
                local Children = Absorb:GetChildren();

                if u29 and u29:GetAttribute("GhostSparks") then
                    for _, child in ipairs(HitStuff.HitEffects.RiotShield:GetChildren()) do
                        table.insert(Children, child);
                    end;
                end;

                for i = 1, #Children do
                    local v37;

                    if Children[i].ClassName == "ParticleEmitter" then
                        local u38 = Children[i]:Clone();
                        u38.Parent = Attachment;

                        if u38.PartColor.Value then
                            u38.Color = ColorSequence.new(p19.Color, p19.Color);
                        end;

                        delay(0.01, function() -- Line: 127
                            -- upvalues: u38 (copy), Debris (ref)
                            u38:Emit(u38.EmitCount.Value);
                            Debris:AddItem(u38, u38.Lifetime.Max);
                        end);
                        v37 = i;
                    else
                        v37 = i;
                    end;
                end;
            end;

            local v39 = Absorb.Sounds:GetChildren()[math.random(1, #Absorb.Sounds:GetChildren())]:Clone();
            Debris:AddItem(v39, 5);
            v39.Parent = Attachment;
            v39.PlaybackSpeed = Random.new():NextNumber(v39.PlaybackSpeed * 0.9, v39.PlaybackSpeed * 1.1) * 1.3;
            v39:Play();

            return v36;
        end;

        if not (p22 and p22.HIP) then
            if u29:GetAttribute("NoBloodFX") then
                local Attachment = Instance.new("Attachment");
                Debris:AddItem(Attachment, 3);
                Attachment.Parent = p19;
                local CFrame_new_ret = CFrame.new(p20, p20 + p21);
                local CFrame_Angles = CFrame.Angles;
                local math_random_ret = math.random(0, 360);
                Attachment.WorldCFrame = CFrame_new_ret * CFrame_Angles(0, 0, (math.rad(math_random_ret)));
                local Attribute = u29:GetAttribute("NoBloodFX");
                local v40;

                if type(Attribute) == "string" then
                    v40 = HitStuff.HitEffects:FindFirstChild(Attribute);
                else
                    v40 = false;
                end;

                if not (v40 and (v40:FindFirstChild("Sounds") and v40)) then
                    v40 = HitStuff.HitEffects.Concrete;
                end;

                if _G.GSettings ~= nil and _G.GSettings.BulletSparks then
                    local Children = v40:GetChildren();

                    for i = 1, #Children do
                        local v41;

                        if Children[i].ClassName == "ParticleEmitter" then
                            local u42 = Children[i]:Clone();
                            u42.Parent = Attachment;

                            if u42.PartColor.Value then
                                u42.Color = ColorSequence.new(p19.Color, p19.Color);
                            end;

                            delay(0.01, function() -- Line: 197
                                -- upvalues: u42 (copy), Debris (ref)
                                u42:Emit(u42.EmitCount.Value);
                                Debris:AddItem(u42, u42.Lifetime.Max);
                            end);
                            v41 = i;
                        else
                            v41 = i;
                        end;
                    end;
                end;

                local v43 = v40.Sounds:GetChildren()[math.random(1, #v40.Sounds:GetChildren())]:Clone();
                Debris:AddItem(v43, 5);
                v43.Parent = Attachment;
                v43.PlaybackSpeed = Random.new():NextNumber(v43.PlaybackSpeed * 0.9, v43.PlaybackSpeed * 1.1);
                v43:Play();

                if p19.Name == "Head" and u29.Health > 0 then
                    local Children = Main[(p27 or Parent:FindFirstChild("hasHelmet")) and "HitSounds_Helmet" or "HitSounds_Head"]:GetChildren();
                    local v44 = Children[math.random(1, #Children)]:Clone();
                    v44.PlaybackSpeed = v44.PlaybackSpeed * math.random(850, 1150) / 1000;
                    local Attachment2 = Instance.new("Attachment");
                    Attachment2.WorldPosition = p20;
                    Attachment2.Parent = Workspace.Terrain;
                    Debris:AddItem(Attachment2, 3);
                    v44.Parent = Attachment2;
                    v44:Play();

                    return v36;
                end;
            else
                if p19.Name == "Head" then
                    local v45 = (p27 or Parent:FindFirstChild("hasHelmet")) and "HitSounds_Helmet" or "HitSounds_Head";
                    local v46 = Main[v45]:GetChildren()[math.random(1, #Main[v45]:GetChildren())]:Clone();
                    v46.PlaybackSpeed = v46.PlaybackSpeed * math.random(850, 1150) / 1000;
                    v46:Play();
                    Debris:AddItem(v46);
                    v46.Parent = p19;

                    if p27 and v33 then
                        local v47 = Main.Hit_PlayerHelmet:GetChildren()[math.random(1, #Main.Hit_PlayerHelmet:GetChildren())]:Clone();
                        Debris:AddItem(v47);
                        v47.PlaybackSpeed = v46.PlaybackSpeed * math.random(1900, 2100) / 1000;
                        v47.Parent = workspace_CurrentCamera;
                        v47.SoundGroup = nil;
                        v47:Play();

                        local function CheckIfFacing(p48, p49, p50) -- Line: 245
                            return p48.LookVector:Dot((p49.Position - p48.Position).Unit) > math.cos(nil or 3.141592653589793 / (p50 or 1.5));
                        end;

                        Events2.NewCrack:Fire(p19, p17, p18, p20, p21, p28);
                    end;
                else
                    v35 = (Parent:FindFirstChild("HasKevlar") or p27) and "HitSounds_Kevlar" or v35;
                end;

                local v51 = Main[v35]:GetChildren()[math.random(1, #Main[v35]:GetChildren())]:Clone();
                v51.PlaybackSpeed = v51.PlaybackSpeed * math.random(750, 1250) / 1000;
                v51.Parent = p19;
                v51:Play();
                Debris:AddItem(v51);
                local Attachment = Instance.new("Attachment");
                Debris:AddItem(Attachment, 3);
                local v52 = _G.FP and Parent == LocalPlayer.Character;

                if p25 then
                    Attachment.Parent = p19;
                    Attachment.WorldCFrame = CFrame.new(p20, p20 + p18);

                    if not v52 then
                        Events2.BloodHitEvent:Fire(Attachment, nil, u29);
                    end;

                    if p19.Name ~= "Head" then
                        local v53 = p26 * 25;

                        if p16 == "Create" then
                            v36 = PlaceDecals("Create", Main.Decals:GetChildren()[math.random(1, #Main.Decals:GetChildren())].Texture, v53, p19, p19.CFrame, p20, p21, true);

                            if v36 then
                                local v54 = v36[4];
                                v54.Rotation = math.random(0, 360);

                                if _G.GSettings and not _G.GSettings.BloodEffects or _G.Compliance and (_G.Compliance.BloodMultiplier and math.random() >= _G.Compliance.BloodMultiplier) then
                                    v54.ImageTransparency = 1;
                                else
                                    v54.ImageTransparency = math.random(150, 300) / 1000;
                                end;

                                v36[4].Parent.Parent.LightInfluence = 1;
                                v36[4] = nil;
                            end;
                        elseif p16 == "Place" and (_G.GSettings and (_G.GSettings.BloodEffects and not (_G.Compliance and (_G.Compliance.BloodMultiplier and math.random() >= _G.Compliance.BloodMultiplier)))) and p23 ~= nil then
                            v36 = PlaceDecals("Place", p19, p23, Main.Decals:GetChildren()[math.random(1, #Main.Decals:GetChildren())].Texture, v53);
                        end;
                    end;

                    Events2.BloodTrailEvent:Fire(Attachment, p25.A, true, { 0.2, 1 });

                    return v36;
                end;

                Attachment:Destroy();
            end;

            return v36;
        end;

        local Attachment = Instance.new("Attachment");
        Debris:AddItem(Attachment, 3);
        Attachment.Parent = p19;
        local CFrame_new_ret = CFrame.new(p20, p20 + p21);
        local CFrame_Angles = CFrame.Angles;
        local math_random_ret = math.random(0, 360);
        Attachment.WorldCFrame = CFrame_new_ret * CFrame_Angles(0, 0, (math.rad(math_random_ret)));
        local RiotShield = HitStuff.HitEffects.RiotShield;

        if _G.GSettings ~= nil and _G.GSettings.BulletSparks then
            local Children = RiotShield:GetChildren();

            for i = 1, #Children do
                local v55;

                if Children[i].ClassName == "ParticleEmitter" then
                    local u56 = Children[i]:Clone();
                    u56.Parent = Attachment;

                    if u56.PartColor.Value then
                        u56.Color = ColorSequence.new(p19.Color, p19.Color);
                    end;

                    delay(0.01, function() -- Line: 161
                        -- upvalues: u56 (copy), Debris (ref)
                        u56:Emit(u56.EmitCount.Value);
                        Debris:AddItem(u56, u56.Lifetime.Max);
                    end);
                    v55 = i;
                else
                    v55 = i;
                end;
            end;
        end;

        local v57 = RiotShield.Sounds:GetChildren()[math.random(1, #RiotShield.Sounds:GetChildren())]:Clone();
        Debris:AddItem(v57, 5);
        v57.Parent = Attachment;
        v57.PlaybackSpeed = Random.new():NextNumber(v57.PlaybackSpeed * 0.9, v57.PlaybackSpeed * 1.1) * 1.3;
        v57:Play();

        return v36;
    end;
end;
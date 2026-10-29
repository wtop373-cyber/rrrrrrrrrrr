-- ============================================================
-- SCRIPT: ToolHandler
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.Backpack.VM.ToolHandler
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
local u2 = {};
local RunService = game:GetService("RunService");
local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local SettingsChanged = ReplicatedStorage.Events2:WaitForChild("SettingsChanged");
local LocalPlayer = Players.LocalPlayer;
local Character = LocalPlayer.Character;
u2.FirstPerson = false;
u2.ViewModel = nil;
u2.TransparencyModifier = 0;
local u3 = nil;
local u4 = nil;
local u5 = {};
local u6 = {};
local u7 = {};
u2.ReplicationParts = {};
u2.PartPairs = {};
u2.Transparency = nil;
u2.tS = {};
u2.tS2 = {};
local u8 = {};
local u9 = {};
local PBRTextures = ReplicatedStorage:WaitForChild("Storage"):WaitForChild("PBRTextures");

local function SG_Check(p10) -- Line: 50
    local v11 = p10:IsA("ImageLabel") and (p10.Parent.Parent:IsA("SurfaceGui") or p10.Parent:IsA("SurfaceGui") or (p10.Parent:IsA("Frame") or p10.Parent:IsA("ImageLabel")));

    return v11;
end;

local function updtReplicate(u12, u13, p14) -- Line: 54
    -- upvalues: u7 (ref), u2 (copy), SG_Check (copy), u4 (ref)
    if u12:IsA("BasePart") then
        u7[u12] = u12.Transparency;
        local v15 = u2.ReplicationParts[u12];

        if v15 then
            v15.CanCollide = false;
            v15.Massless = true;
            v15.Anchored = true;
            v15.Transparency = u12.Transparency;
            v15.Color = u12.Color;
            v15.Material = u12.Material;

            if v15:IsA("MeshPart") then
                v15.TextureID = u12.TextureID;
            end;

            v15.LocalTransparencyModifier = u2.TransparencyModifier;
        end;
    elseif not u12:IsA("SpecialMesh") then
        if u12:IsA("Decal") or u12:IsA("Texture") then
            u7[u12] = u12.Transparency;
            local v16 = u2.ReplicationParts[u12];
            v16.Transparency = u12.Transparency;
            v16.LocalTransparencyModifier = u2.TransparencyModifier;
        elseif SG_Check(u12) then
            if p14 then
                u7[u12] = u12.ImageTransparency;
            end;

            u2.ReplicationParts[u12].ImageTransparency = u7[u12] * u2.TransparencyModifier;
        elseif not u12:IsA("Frame") then
            if u12:IsA("Attachment") then
                return;
            end;

            if p14 then
                u7[u12] = u12.Enabled;
                local _ = u12.Enabled;
            end;

            local v17 = u2.ReplicationParts[u12];

            if v17 and v17.Parent then
                v17.Enabled = u7[u12];
            end;

            if u2.FirstPerson and not u12:FindFirstChild("brah") then
                u12.Enabled = false;
            end;
        end;
    end;

    if ((u13 or not (u12:IsA("Beam") or u12:IsA("ParticleEmitter"))) and true or false) and (u2.ReplicationParts and u2.ReplicationParts[u12]) then
        pcall(function() -- Line: 129
            -- upvalues: u2 (ref), u12 (copy), u13 (copy), u4 (ref)
            u2.ReplicationParts[u12].Parent = u13 or u4;
        end);
    end;
end;

local u18 = false;

local function stripClone() -- Line: 140
    -- upvalues: u4 (ref)
    if u4 and #u4:GetChildren() > 0 then
        for _, descendant in pairs(u4:GetDescendants()) do
            if descendant:IsA("JointInstance") or (descendant:IsA("RopeConstraint") or (descendant:IsA("Constraint") or (descendant:IsA("BallSocketConstraint") or (descendant:IsA("WeldConstraint") or descendant:IsA("Sound"))))) then
                descendant:Destroy();
            end;
        end;
    end;
end;

local function u27(p19, p20, p21) -- Line: 150
    -- upvalues: u2 (copy), u9 (ref), updtReplicate (copy), u18 (ref), stripClone (copy)
    if not u2.ReplicationParts[p19] then
        u2.ReplicationParts[p19] = p19:Clone();

        if u2.ReplicationParts[p19]:IsA("BasePart") then
            u2.ReplicationParts[p19].CanCollide = false;
            u2.ReplicationParts[p19].CanTouch = false;
            u2.ReplicationParts[p19].CanQuery = false;
            table.insert(u2.PartPairs, { p19, u2.ReplicationParts[p19] });

            for _, descendant in pairs(u2.ReplicationParts[p19]:GetDescendants()) do
                if descendant:IsA("Motor6D") or (descendant:IsA("Weld") or (descendant:IsA("WeldConstraint") or descendant:IsA("ManualWeld"))) then
                    descendant:Destroy();
                end;
            end;

            if u2.ReplicationParts[p19]:GetAttribute("ActiveBones") then
                for _, descendant in pairs(u2.ReplicationParts[p19]:GetDescendants()) do
                    if descendant:IsA("Bone") then
                        task.delay(0.05, function() -- Line: 169
                            -- upvalues: descendant (copy), u2 (ref), u9 (ref)
                            if not (descendant and descendant.Parent) then
                                return;
                            end;

                            local v22 = descendant:FindFirstAncestorWhichIsA("BasePart");

                            if not v22 then
                                return;
                            end;

                            local v23 = v22:GetAttribute("FollowOG") or v22.Name;

                            if string.sub(v23, -6) == "_Clone" then
                                v23 = string.sub(v23, 1, -7);
                            end;

                            local v24 = u2.ActiveTool and u2.ActiveTool:FindFirstChild(v23, true);

                            if not v24 then
                                return;
                            end;

                            local v25 = v24:FindFirstChild(descendant.Name, true);

                            if not (v25 and v25:IsA("Bone")) then
                                return;
                            end;

                            local v26 = u9[v25];

                            if not v26 then
                                v26 = { v25, nil, nil };
                                u9[v25] = v26;
                            end;

                            if string.sub(v22.Name, -6) == "_Clone" then
                                v26[3] = descendant;

                                return;
                            end;

                            v26[2] = descendant;
                        end);
                    end;
                end;
            end;
        end;

        for _, descendant in pairs(u2.ReplicationParts[p19]:GetDescendants()) do
            if descendant:IsA("BasePart") then
                descendant:Destroy();
            elseif (descendant:IsA("Beam") or (descendant:IsA("ParticleEmitter") or descendant:IsA("Fire"))) and not descendant:FindFirstChild("brah") then
                descendant.Enabled = false;
            end;
        end;

        updtReplicate(p19, p20, true);
    end;

    if not u18 then
        stripClone();
    end;

    return u2.ReplicationParts[p19];
end;

local function ReplicateAppearance(p28) -- Line: 224
    -- upvalues: u2 (copy)
    local Parent = p28.Parent;

    if not (Parent and Parent:IsA("MeshPart")) then
        return;
    end;

    local v29 = u2.ReplicationParts[Parent];

    if not v29 then
        return;
    end;

    local v30 = u2.ReplicationParts[p28];

    if v30 then
        v30:Destroy();
    end;

    for _, child in ipairs(v29:GetChildren()) do
        if child:IsA("SurfaceAppearance") then
            child:Destroy();
        end;
    end;

    local v31 = p28:Clone();
    v31.Parent = v29;
    u2.ReplicationParts[p28] = v31;
end;

local function u61(u32, p33) -- Line: 239
    -- upvalues: updtReplicate (copy), u6 (ref), u27 (copy), u2 (copy), ReplicateAppearance (copy), SG_Check (copy)
    local function monitorV(u34, u35) -- Line: 240
        -- upvalues: updtReplicate (ref), u6 (ref)
        local v36 = u34:GetPropertyChangedSignal(u35):Connect(function() -- Line: 242
            -- upvalues: u34 (copy), u35 (copy), updtReplicate (ref)
            local _ = u34[u35];
            updtReplicate(u34, nil, u35 == "Enabled");
        end);
        table.insert(u6, v36);
    end;

    if u32:IsA("BasePart") then
        u27(u32, nil, p33);

        if u2.FirstPerson then
            u32.LocalTransparencyModifier = 1;
        end;

        local u37 = "Transparency";
        local v38 = u32:GetPropertyChangedSignal("Transparency"):Connect(function() -- Line: 242
            -- upvalues: u32 (copy), u37 (copy), updtReplicate (ref)
            local _ = u32[u37];
            updtReplicate(u32, nil, u37 == "Enabled");
        end);
        table.insert(u6, v38);
        local u39 = "Color";
        local v40 = u32:GetPropertyChangedSignal("Color"):Connect(function() -- Line: 242
            -- upvalues: u32 (copy), u39 (copy), updtReplicate (ref)
            local _ = u32[u39];
            updtReplicate(u32, nil, u39 == "Enabled");
        end);
        table.insert(u6, v40);
        local u41 = "Material";
        local v42 = u32:GetPropertyChangedSignal("Material"):Connect(function() -- Line: 242
            -- upvalues: u32 (copy), u41 (copy), updtReplicate (ref)
            local _ = u32[u41];
            updtReplicate(u32, nil, u41 == "Enabled");
        end);
        table.insert(u6, v42);

        if u32:IsA("MeshPart") then
            local u43 = "TextureID";
            local v44 = u32:GetPropertyChangedSignal("TextureID"):Connect(function() -- Line: 242
                -- upvalues: u32 (copy), u43 (copy), updtReplicate (ref)
                local _ = u32[u43];
                updtReplicate(u32, nil, u43 == "Enabled");
            end);
            table.insert(u6, v44);
        end;
    else
        if u32:IsA("SurfaceAppearance") and u32.Parent:IsA("MeshPart") then
            ReplicateAppearance(u32);
            table.insert(u6, u32.Changed:Connect(function() -- Line: 266
                -- upvalues: ReplicateAppearance (ref), u32 (copy)
                ReplicateAppearance(u32);
            end));

            return;
        end;

        if u32:IsA("Highlight") then
            local u45 = "Enabled";
            local v46 = u32:GetPropertyChangedSignal("Enabled"):Connect(function() -- Line: 242
                -- upvalues: u32 (copy), u45 (copy), updtReplicate (ref)
                local _ = u32[u45];
                updtReplicate(u32, nil, u45 == "Enabled");
            end);
            table.insert(u6, v46);
            local u47 = "FillColor";
            local v48 = u32:GetPropertyChangedSignal("FillColor"):Connect(function() -- Line: 242
                -- upvalues: u32 (copy), u47 (copy), updtReplicate (ref)
                local _ = u32[u47];
                updtReplicate(u32, nil, u47 == "Enabled");
            end);
            table.insert(u6, v48);
            local u49 = "FillTransparency";
            local v50 = u32:GetPropertyChangedSignal("FillTransparency"):Connect(function() -- Line: 242
                -- upvalues: u32 (copy), u49 (copy), updtReplicate (ref)
                local _ = u32[u49];
                updtReplicate(u32, nil, u49 == "Enabled");
            end);
            table.insert(u6, v50);
            local u51 = "OutlineColor";
            local v52 = u32:GetPropertyChangedSignal("OutlineColor"):Connect(function() -- Line: 242
                -- upvalues: u32 (copy), u51 (copy), updtReplicate (ref)
                local _ = u32[u51];
                updtReplicate(u32, nil, u51 == "Enabled");
            end);
            table.insert(u6, v52);
            local u53 = "OutlineTransparency";
            local v54 = u32:GetPropertyChangedSignal("OutlineTransparency"):Connect(function() -- Line: 242
                -- upvalues: u32 (copy), u53 (copy), updtReplicate (ref)
                local _ = u32[u53];
                updtReplicate(u32, nil, u53 == "Enabled");
            end);
            table.insert(u6, v54);

            return;
        end;

        if u32:IsA("Decal") or u32:IsA("Texture") then
            u27(u32, (u27(u32.Parent)));

            if u2.FirstPerson then
                u32.LocalTransparencyModifier = 1;
            end;

            local u55 = "Transparency";
            local v56 = u32:GetPropertyChangedSignal("Transparency"):Connect(function() -- Line: 242
                -- upvalues: u32 (copy), u55 (copy), updtReplicate (ref)
                local _ = u32[u55];
                updtReplicate(u32, nil, u55 == "Enabled");
            end);
            table.insert(u6, v56);

            return;
        end;

        if SG_Check(u32) then
            u27(u32, (u27(u32.Parent)));

            if u2.FirstPerson then
                u32.ImageTransparency = 11;
            end;

            local u57 = "ImageTransparency";
            local v58 = u32:GetPropertyChangedSignal("ImageTransparency"):Connect(function() -- Line: 242
                -- upvalues: u32 (copy), u57 (copy), updtReplicate (ref)
                local _ = u32[u57];
                updtReplicate(u32, nil, u57 == "Enabled");
            end);
            table.insert(u6, v58);

            return;
        end;

        if (u32:IsA("ParticleEmitter") or (u32:IsA("Fire") or (u32:IsA("Smoke") or (u32:IsA("Sparkles") or (u32:IsA("SpecialMesh") or u32:IsA("Beam")))))) and (u32.Parent:IsA("BasePart") or u32.Parent:IsA("Attachment")) then
            u27(u32, (u27(u32.Parent)));

            if not u32:IsA("SpecialMesh") then
                local _ = u2.FirstPerson;
                local u59 = "Enabled";
                local v60 = u32:GetPropertyChangedSignal("Enabled"):Connect(function() -- Line: 242
                    -- upvalues: u32 (copy), u59 (copy), updtReplicate (ref)
                    local _ = u32[u59];
                    updtReplicate(u32, nil, u59 == "Enabled");
                end);
                table.insert(u6, v60);
            end;
        end;
    end;
end;

local function DisconnectTool() -- Line: 303
    -- upvalues: u2 (copy)
    for _, v in pairs(u2.tS2) do
        v:Disconnect();
    end;

    u2.tS2 = {};
    u2.tS = {};
end;

function u2.UpdateBones() -- Line: 311
    -- upvalues: u9 (ref)
    for i, v in pairs(u9) do
        if i and i.Parent then
            local Transform = i.Transform;
            local v62 = v[2];

            if v62 and v62.Parent then
                v62.Transform = Transform;
            end;

            local v63 = v[3];

            if v63 and v63.Parent then
                v63.Transform = Transform;
            end;
        else
            u9[i] = nil;
        end;
    end;
end;

function u2.ToolAdded(u64) -- Line: 334
    -- upvalues: u3 (ref), u9 (ref), u5 (copy), u61 (copy), RunService (copy), Character (copy), u2 (copy), u7 (ref), DisconnectTool (copy)
    if u64.ClassName == "Tool" then
        local v65 = u3 ~= u64;
        u3 = u64;
        u9 = {};
        u5.DAdded = u64.DescendantAdded:Connect(function(p66) -- Line: 343
            -- upvalues: u61 (ref)
            u61(p66, true);
        end);
        u5.DRemoved = u64.DescendantRemoving:Connect(function(p67) -- Line: 347
            -- upvalues: RunService (ref), u64 (copy), Character (ref), u2 (ref), u7 (ref)
            RunService.Heartbeat:Wait();

            if u64 and (u64.Parent == Character and (p67:IsA("BasePart") or (p67:IsA("SurfaceAppearance") or (p67:IsA("Fire") or (p67:IsA("Smoke") or (p67:IsA("Sparkles") or (p67:IsA("ParticleEmitter") or (p67:IsA("Beam") or p67:IsA("SpecialMesh"))))))))) and u2.ReplicationParts[p67] then
                u2.ReplicationParts[p67]:Destroy();

                if p67 and (p67:IsA("BasePart") or p67:IsA("Decal")) then
                    p67.LocalTransparencyModifier = 0;
                end;

                u7[p67] = nil;
            end;
        end);
        local u68 = { "FP_Offset", "FP_Offset4", "FP_Offset2", "FP_Offset3", "FP_Offset_Angle", "NoArmTing", "IsGun", "FPASHAHSHBRUUUUH", "LA_Offset", "LA_Offset_Angle", "RA_Offset", "RA_Offset_Angle", "Tool_Offset", "Tool_Offset2", "FP_Offset5", "FP_Offset6", "FP_Offset_Angle2", "FP_Offset7", "LA_Offset2" };

        local function newTPart(u69) -- Line: 386
            -- upvalues: u68 (copy), u2 (ref)
            if not table.find(u68, u69.Name) then
                if u69.Name == "Values" and u69:FindFirstChild("AimDown") then
                    u2.tS.AimDown = u69.AimDown;
                end;

                return;
            end;

            local v70 = u69:IsA("ValueBase");

            if u2.tS2[u69.Name] then
                u2.tS2[u69.Name]:Disconnect();
            end;

            local v71;

            if v70 then
                local Value = u69.Value;
                v71 = (Value == nil or Value == false) and true or Value;
                local v72 = u69.Changed:Connect(function() -- Line: 403
                    -- upvalues: u2 (ref), u69 (copy)
                    u2.tS[u69.Name] = u69.Value;
                end);
                u2.tS2[u69.Name] = v72;
            else
                v71 = u69;
            end;

            u2.tS[u69.Name] = v71;
        end;

        u5.CAdded = u64.ChildAdded:Connect(newTPart);
        u5.CRemoved = u64.ChildRemoved:Connect(function(p73) -- Line: 419
            -- upvalues: RunService (ref), u64 (copy), u2 (ref)
            RunService.Heartbeat:Wait();

            if not (p73 and p73.Parent or u64:FindFirstChild(p73.Name)) then
                u2.tS[p73.Name] = nil;
            end;
        end);

        if u2.FirstPerson then
            u2.CreateViewModelTool();
        end;

        if v65 then
            DisconnectTool();

            for _, child in pairs(u64:GetChildren()) do
                newTPart(child);
            end;
        end;

        u2.ActiveTool = u64;
        u3 = u64;
    end;
end;

Character.ChildAdded:Connect(u2.ToolAdded);

for _, child in pairs(Character:GetChildren()) do
    if child:IsA("Tool") then
        u2.ToolAdded(child);
        break;
    end;
end;

function u2.ToolRemoved(p74) -- Line: 452
    -- upvalues: u2 (copy), DisconnectTool (copy), u3 (ref), u7 (ref), u5 (copy)
    if p74.ClassName == "Tool" then
        u2.RemoveViewModelTool(true);
        DisconnectTool();
        u3 = nil;
        u2.ActiveTool = nil;
        u7 = {};
        u2.ReplicationParts = {};
        u2.PartPairs = {};

        if u5.DAdded then
            u5.DAdded:Disconnect();
        end;

        if u5.DRemoved then
            u5.DRemoved:Disconnect();
        end;

        if u5.CAdded then
            u5.CAdded:Disconnect();
        end;

        if u5.CRemoved then
            u5.CRemoved:Disconnect();
        end;
    end;
end;

Character.ChildRemoved:Connect(u2.ToolRemoved);

function u2.CreateViewModelTool() -- Line: 484
    -- upvalues: u4 (ref), u7 (ref), SG_Check (copy), u2 (copy), u3 (ref), u18 (ref), u61 (copy), stripClone (copy)
    if u4 and u4.Parent then
        for i, _ in pairs(u7) do
            if i:IsA("BasePart") then
                i.LocalTransparencyModifier = 1;
            elseif i:IsA("Decal") or i:IsA("Texture") then
                i.LocalTransparencyModifier = 1;
            elseif SG_Check(i) then
                i.ImageTransparency = 11;
            elseif (i:IsA("PointLight") or (i:IsA("SurfaceLight") or (i:IsA("Beam") or i:IsA("ParticleEmitter")))) and not i:FindFirstChild("brah") then
                i.Enabled = false;
            end;
        end;

        u4.Parent = u2.ViewModel;

        return;
    end;

    u4 = Instance.new("Tool");
    u4.Name = "Tool";
    _G.VM.CloneTool = u4;

    if u3 and #u3:GetChildren() > 0 then
        u18 = true;
        local success, result = pcall(function() -- Line: 510
            -- upvalues: u3 (ref), u61 (ref)
            for _, descendant in pairs(u3:GetDescendants()) do
                u61(descendant);
            end;
        end);
        u18 = false;
        stripClone();

        if not success then
            error(result, 0);
        end;
    end;

    u4.Parent = u2.ViewModel;
    _G.VM.ChangeEvent2:Fire();
end;

function u2.RemoveViewModelTool(p75) -- Line: 526
    -- upvalues: u3 (ref), u7 (ref), SG_Check (copy), u4 (ref), u9 (ref), u6 (ref)
    if u3 then
        for i, v in pairs(u7) do
            if i:IsA("BasePart") then
                i.LocalTransparencyModifier = 0;
            elseif i:IsA("Decal") or i:IsA("Texture") then
                i.LocalTransparencyModifier = 0;
            elseif SG_Check(i) then
                i.ImageTransparency = v;
            elseif (i:IsA("PointLight") or (i:IsA("SurfaceLight") or (i:IsA("Beam") or i:IsA("ParticleEmitter")))) and not i:FindFirstChild("brah") then
                i.Enabled = v;
            end;
        end;

        if p75 and u4 then
            u4:Destroy();
            u4 = nil;
            u9 = {};

            for _, v in pairs(u6) do
                if v then
                    v:Disconnect();
                end;
            end;

            u6 = {};

            return;
        end;

        if u4 and u4.Parent then
            u4.Parent = game.ReplicatedFirst.ViewModels;
        end;
    end;
end;

function u2.ChangePerson(p76) -- Line: 564
    -- upvalues: u2 (copy), u3 (ref)
    u2.FirstPerson = p76;

    if p76 then
        if u3 then
            u2.CreateViewModelTool();
        end;
    else
        u2.RemoveViewModelTool();
    end;
end;

pcall(function() -- Line: 575
    -- upvalues: LocalPlayer (copy), u8 (copy), PBRTextures (copy), Character (copy), SettingsChanged (copy)
    local u77 = {};
    local u78 = {};
    local u79 = {};
    local Backpack = LocalPlayer:WaitForChild("Backpack");

    local function owns(p80) -- Line: 580
        -- upvalues: Backpack (copy), LocalPlayer (ref)
        return p80.Parent == Backpack and true or p80.Parent == LocalPlayer.Character;
    end;

    local function clear(p81) -- Line: 583
        -- upvalues: u78 (copy), u8 (ref)
        u78[p81] = nil;
        local v82 = u8[p81];

        if not v82 then
            return;
        end;

        for _, v in ipairs(v82.nsas) do
            v:Destroy();
        end;

        for i, v in pairs(v82.setMetals) do
            if i.Parent then
                i.Material = v;
            end;
        end;

        u8[p81] = nil;
    end;

    local function refresh(p83) -- Line: 593
        -- upvalues: clear (copy), Backpack (copy), LocalPlayer (ref), u8 (ref), PBRTextures (ref)
        clear(p83);

        if not ((p83.Parent == Backpack or p83.Parent == LocalPlayer.Character) and (not _G.GSettings or _G.GSettings.PBRTextures)) then
            return;
        end;

        local v84 = {
            t = p83,
            nsas = {},
            setMetals = {}
        };
        u8[p83] = v84;
        local Attribute = p83:GetAttribute("AppliedSkinPBR_ID");
        local v85 = nil;

        if Attribute then
            v85 = p83:FindFirstChild((tostring(Attribute)));
        elseif not p83:GetAttribute("AppliedSkin") then
            local Attribute2 = p83:GetAttribute("SATPID");
            v85 = Attribute2 and PBRTextures:FindFirstChild((tostring(Attribute2))) or PBRTextures:FindFirstChild(p83.Name);
        end;

        for _, descendant in ipairs(p83:GetDescendants()) do
            if descendant:IsA("MeshPart") then
                local v86 = nil;

                if descendant:GetAttribute("SATP2") then
                    v86 = PBRTextures:FindFirstChild((tostring(descendant:GetAttribute("SATP2"))));
                elseif descendant:GetAttribute("SATP") then
                    if not descendant:GetAttribute("IgnorePBR") then
                        v86 = v85;
                    end;
                end;

                if v86 and (v86:IsA("SurfaceAppearance") and not descendant:FindFirstChildOfClass("SurfaceAppearance")) then
                    local v87 = v86:Clone();
                    v87.Name = "SurfaceAppearance";
                    table.insert(v84.nsas, v87);
                    v87.Parent = descendant;
                end;

                if descendant:GetAttribute("PBR_SetMetal") then
                    v84.setMetals[descendant] = descendant.Material;
                    descendant.Material = Enum.Material.Metal;
                end;
            end;
        end;

        u8[p83] = v84;
    end;

    local function schedule(u88) -- Line: 628
        -- upvalues: u78 (copy), refresh (copy)
        local u89 = {};
        u78[u88] = u89;
        task.defer(function() -- Line: 631
            -- upvalues: u78 (ref), u88 (copy), u89 (copy), refresh (ref)
            if u78[u88] == u89 then
                refresh(u88);
            end;
        end);
    end;

    local function unwatch(p90) -- Line: 635
        -- upvalues: clear (copy), u77 (copy)
        clear(p90);
        local v91 = u77[p90];

        if not v91 then
            return;
        end;

        for _, v in ipairs(v91.connections) do
            v:Disconnect();
        end;

        for _, v in pairs(v91.descendants) do
            v:Disconnect();
        end;

        u77[p90] = nil;
    end;

    local function watch(u92) -- Line: 643
        -- upvalues: Backpack (copy), LocalPlayer (ref), u77 (copy), u78 (copy), refresh (copy), u8 (ref), unwatch (copy)
        if not (u92:IsA("Tool") and (u92.Parent == Backpack or u92.Parent == LocalPlayer.Character)) then
            return;
        end;

        if not u77[u92] then
            local u93 = {
                connections = {},
                descendants = {}
            };
            u77[u92] = u93;

            local function added(p94) -- Line: 648
                -- upvalues: u93 (copy), u92 (copy), u78 (ref), refresh (ref), u8 (ref)
                if u93.descendants[p94] then
                    return;
                end;

                if not p94:IsA("MeshPart") then
                    if p94:IsA("SurfaceAppearance") and (p94.Parent and p94.Parent:IsA("MeshPart")) then
                        local v95 = u8[u92];

                        if not (v95 and table.find(v95.nsas, p94)) then
                            local u96 = u92;
                            local u97 = {};
                            u78[u96] = u97;
                            task.defer(function() -- Line: 631
                                -- upvalues: u78 (ref), u96 (copy), u97 (copy), refresh (ref)
                                if u78[u96] == u97 then
                                    refresh(u96);
                                end;
                            end);

                            return;
                        end;
                    elseif p94:IsA("SurfaceAppearance") and p94.Parent == u92 then
                        u93.descendants[p94] = p94.Changed:Connect(function(p98) -- Line: 659
                            -- upvalues: u92 (ref), u78 (ref), refresh (ref)
                            if p98 ~= "Parent" then
                                local u99 = u92;
                                local u100 = {};
                                u78[u99] = u100;
                                task.defer(function() -- Line: 631
                                    -- upvalues: u78 (ref), u99 (copy), u100 (copy), refresh (ref)
                                    if u78[u99] == u100 then
                                        refresh(u99);
                                    end;
                                end);
                            end;
                        end);
                        local u101 = u92;
                        local u102 = {};
                        u78[u101] = u102;
                        task.defer(function() -- Line: 631
                            -- upvalues: u78 (ref), u101 (copy), u102 (copy), refresh (ref)
                            if u78[u101] == u102 then
                                refresh(u101);
                            end;
                        end);
                    end;

                    return;
                end;

                u93.descendants[p94] = p94.AttributeChanged:Connect(function(p103) -- Line: 651
                    -- upvalues: u92 (ref), u78 (ref), refresh (ref)
                    if p103 == "SATP" or (p103 == "SATP2" or (p103 == "IgnorePBR" or p103 == "PBR_SetMetal")) then
                        local u104 = u92;
                        local u105 = {};
                        u78[u104] = u105;
                        task.defer(function() -- Line: 631
                            -- upvalues: u78 (ref), u104 (copy), u105 (copy), refresh (ref)
                            if u78[u104] == u105 then
                                refresh(u104);
                            end;
                        end);
                    end;
                end);
                local u106 = u92;
                local u107 = {};
                u78[u106] = u107;
                task.defer(function() -- Line: 631
                    -- upvalues: u78 (ref), u106 (copy), u107 (copy), refresh (ref)
                    if u78[u106] == u107 then
                        refresh(u106);
                    end;
                end);
            end;

            table.insert(u93.connections, u92.AttributeChanged:Connect(function(p108) -- Line: 665
                -- upvalues: u92 (copy), u78 (ref), refresh (ref)
                if p108 == "AppliedSkin" or (p108 == "AppliedSkinPBR_ID" or p108 == "SATPID") then
                    local u109 = u92;
                    local u110 = {};
                    u78[u109] = u110;
                    task.defer(function() -- Line: 631
                        -- upvalues: u78 (ref), u109 (copy), u110 (copy), refresh (ref)
                        if u78[u109] == u110 then
                            refresh(u109);
                        end;
                    end);
                end;
            end));
            table.insert(u93.connections, u92.DescendantAdded:Connect(added));
            table.insert(u93.connections, u92.DescendantRemoving:Connect(function(p111) -- Line: 669
                -- upvalues: u8 (ref), u92 (copy), u78 (ref), refresh (ref), u93 (copy)
                if p111:IsA("SurfaceAppearance") and (p111.Parent and p111.Parent:IsA("MeshPart")) then
                    local v112 = u8[u92];

                    if not (v112 and table.find(v112.nsas, p111)) then
                        local u113 = u92;
                        local u114 = {};
                        u78[u113] = u114;
                        task.defer(function() -- Line: 631
                            -- upvalues: u78 (ref), u113 (copy), u114 (copy), refresh (ref)
                            if u78[u113] == u114 then
                                refresh(u113);
                            end;
                        end);
                    end;
                end;

                if u93.descendants[p111] then
                    u93.descendants[p111]:Disconnect();
                    u93.descendants[p111] = nil;
                    local u115 = u92;
                    local u116 = {};
                    u78[u115] = u116;
                    task.defer(function() -- Line: 631
                        -- upvalues: u78 (ref), u115 (copy), u116 (copy), refresh (ref)
                        if u78[u115] == u116 then
                            refresh(u115);
                        end;
                    end);
                end;
            end));
            table.insert(u93.connections, u92.AncestryChanged:Connect(function() -- Line: 680
                -- upvalues: u92 (copy), Backpack (ref), LocalPlayer (ref), unwatch (ref)
                local v117 = u92;

                if v117.Parent ~= Backpack and v117.Parent ~= LocalPlayer.Character then
                    unwatch(u92);
                end;
            end));

            for _, descendant in ipairs(u92:GetDescendants()) do
                added(descendant);
            end;

            local u118 = {};
            u78[u92] = u118;
            task.defer(function() -- Line: 631
                -- upvalues: u78 (ref), u92 (copy), u118 (copy), refresh (ref)
                if u78[u92] == u118 then
                    refresh(u92);
                end;
            end);
        end;
    end;

    table.insert(u79, Backpack.ChildAdded:Connect(watch));
    table.insert(u79, Character.ChildAdded:Connect(watch));
    table.insert(u79, PBRTextures.ChildAdded:Connect(function() -- Line: 689
        -- upvalues: u77 (copy), u78 (copy), refresh (copy)
        for i in pairs(u77) do
            local u119 = {};
            u78[i] = u119;
            task.defer(function() -- Line: 631
                -- upvalues: u78 (ref), i (copy), u119 (copy), refresh (ref)
                if u78[i] == u119 then
                    refresh(i);
                end;
            end);
        end;
    end));
    table.insert(u79, PBRTextures.ChildRemoved:Connect(function() -- Line: 692
        -- upvalues: u77 (copy), u78 (copy), refresh (copy)
        for i in pairs(u77) do
            local u120 = {};
            u78[i] = u120;
            task.defer(function() -- Line: 631
                -- upvalues: u78 (ref), i (copy), u120 (copy), refresh (ref)
                if u78[i] == u120 then
                    refresh(i);
                end;
            end);
        end;
    end));
    table.insert(u79, SettingsChanged.Event:Connect(function(p121) -- Line: 695
        -- upvalues: u77 (copy), u78 (copy), refresh (copy)
        if p121 == "PBRTextures" then
            for i in pairs(u77) do
                local u122 = {};
                u78[i] = u122;
                task.defer(function() -- Line: 631
                    -- upvalues: u78 (ref), i (copy), u122 (copy), refresh (ref)
                    if u78[i] == u122 then
                        refresh(i);
                    end;
                end);
            end;
        end;
    end));
    table.insert(u79, script.Destroying:Connect(function() -- Line: 700
        -- upvalues: u77 (copy), unwatch (copy), u79 (copy)
        for i in pairs(u77) do
            unwatch(i);
        end;

        for _, v in ipairs(u79) do
            v:Disconnect();
        end;
    end));

    for _, child in ipairs(Backpack:GetChildren()) do
        watch(child);
    end;

    for _, child in ipairs(Character:GetChildren()) do
        watch(child);
    end;
end);

return u2;
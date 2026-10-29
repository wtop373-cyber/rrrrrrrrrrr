-- ============================================================
-- SCRIPT: Blood
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Blood
-- ============================================================

-- Decompiled with Potassium's decompiler.

local TweenService = game:GetService("TweenService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local RunService = game:GetService("RunService");
local Debris = game:GetService("Debris");
local RaycastParams_new_ret = RaycastParams.new();
RaycastParams_new_ret.FilterType = Enum.RaycastFilterType.Exclude;
local BloodStuff = ReplicatedStorage:WaitForChild("Storage"):WaitForChild("BloodStuff");
local u1 = BloodStuff.BloodSpray:Clone();
local u2 = BloodStuff.BloodPool:Clone();
local u3 = BloodStuff.BloodHit3:Clone();
local Events = ReplicatedStorage:WaitForChild("Events");
local Events2 = ReplicatedStorage:WaitForChild("Events2");
local BloodTrailEvent = Events:WaitForChild("BloodTrailEvent");
local BloodHitEvent = Events:WaitForChild("BloodHitEvent");
local GorePart = Events:WaitForChild("GorePart");
local BloodOnPart = Events:WaitForChild("BloodOnPart");
local BloodTrailEvent2 = Events2:WaitForChild("BloodTrailEvent");
local BloodHitEvent2 = Events2:WaitForChild("BloodHitEvent");
local SettingsChanged = Events2:WaitForChild("SettingsChanged");
local Debris2 = workspace:WaitForChild("Debris");
local workspace_CurrentCamera = workspace.CurrentCamera;
local Folder = Instance.new("Folder", Debris2);
Folder.Name = "BloodInstances";
local u4 = {
    workspace:WaitForChild("Filter", 1000),
    workspace:WaitForChild("Debris"),
    workspace.Characters,
    workspace.Map.Security,
    workspace.Map.BredMakurz
};
RaycastParams_new_ret.FilterDescendantsInstances = u4;
local u5 = {};

local function Raycast(p6, p7) -- Line: 88
    -- upvalues: RaycastParams_new_ret (copy), u4 (copy), Raycast (copy)
    local v8 = workspace:Raycast(p7, (p6.Position - p7) * 1.25, RaycastParams_new_ret);

    if v8 then
        if v8.Instance.Transparency <= 0.9 and v8.Instance.Name ~= "Grinder" then
            return v8;
        end;

        table.insert(u4, v8.Instance);
        RaycastParams_new_ret.FilterDescendantsInstances = u4;

        return Raycast(p6, p7);
    end;
end;

local function CreateBlood(p9, p10, p11, u12, p13, p14, p15, u16) -- Line: 104
    -- upvalues: workspace_CurrentCamera (copy), u5 (copy), u1 (copy), Folder (copy), Debris (copy), u2 (copy), TweenService (copy)
    if (p9.WorldCFrame.p - workspace_CurrentCamera.CFrame.p).Magnitude > 400 or #u5 >= 300 then
        return;
    end;

    local v17 = p10 or 10;

    if p15 and (typeof(p15) == "table" and (p15[1] and p15[2])) then
        u12 = u12 * math.random(p15[1] * 100, p15[2] * 100) / 100;
    end;

    local u18 = false;
    local u19 = u1:Clone();
    u19.Trail.WidthScale = NumberSequence.new(p13);

    if u16 then
        local Color3_fromRGB_ret = Color3.fromRGB(u16.R * 0.6, u16.G * 0.6, u16.B * 0.6);
        u19.ParticleEmitter.Color = ColorSequence.new(Color3_fromRGB_ret);
        u19.Trail.Color = ColorSequence.new(Color3_fromRGB_ret);
    end;

    if _G.Y8OTOP then
        local Color3_fromRGB_ret = Color3.fromRGB(255, 255, 255);
        u19.ParticleEmitter.Color = ColorSequence.new(Color3_fromRGB_ret);
        u19.ParticleEmitter.LightEmission = 1;
        u19.Trail.Color = ColorSequence.new(Color3_fromRGB_ret);
        u19.Trail.LightEmission = 1;
    end;

    u19.Parent = Folder;
    local WorldCFrame = p9.WorldCFrame;
    local CFrame_Angles = CFrame.Angles;
    local math_random_ret = math.random(p11[1], p11[2]);
    local math_rad_ret = math.rad(math_random_ret);
    local math_random_ret2 = math.random(p11[1], p11[2]);
    local v20 = WorldCFrame * CFrame_Angles(math_rad_ret, math.rad(math_random_ret2), 0);
    u19.CFrame = v20;
    u19.Velocity = v20.LookVector * math.random(v17 * 0.8, v17 * 1.2) + (p14 or Vector3.new(0, 0, 0));
    Debris:AddItem(u19, 10);

    if u12 > 1 then
        local v21 = u12 * math.random(350, 1000) / 1000;
        u12 = math.max(v21, 1);
    end;

    local u22 = {};

    local function removeFromTable() -- Line: 158
        -- upvalues: u5 (ref), u22 (copy)
        local table_find_ret = table.find(u5, u22);

        if table_find_ret then
            table.remove(u5, table_find_ret);
        end;
    end;

    local function Land(p23, p24, p25) -- Line: 165
        -- upvalues: u18 (ref), u5 (ref), u22 (copy), u19 (copy), u2 (ref), u16 (copy), Debris (ref), Folder (ref), u12 (ref), TweenService (ref)
        if u18 then
            return;
        end;

        local table_find_ret = table.find(u5, u22);

        if table_find_ret then
            table.remove(u5, table_find_ret);
        end;

        u18 = true;
        u19.Anchored = true;
        u19.Trail.Enabled = false;
        u19.ParticleEmitter.Enabled = false;
        local u26 = u2:Clone();

        if u16 then
            u26.Color = u16;
        end;

        Debris:AddItem(u26, 60);
        u26.Parent = Folder;
        u26.CFrame = CFrame.new(p24, p24 + p25);

        if p23 and not p23.Anchored then
            local ManualWeld = Instance.new("ManualWeld");
            ManualWeld.Part0 = p23;
            ManualWeld.Part1 = u26;
            ManualWeld.C0 = p23.CFrame:inverse() * CFrame.new(p23.Position);
            ManualWeld.C1 = u26.CFrame:inverse() * CFrame.new(p23.Position);
            ManualWeld.Parent = u26;
            u26.Anchored = false;
        else
            u26.Anchored = true;
        end;

        u19:Destroy();
        local v27 = math.random(u12 * 100 * 0.8, u12 * 100 * 1.2) / 100;
        local math_random_ret3 = math.random(1.5, 2);
        TweenService:Create(u26.Mesh, TweenInfo.new(math_random_ret3 / 2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
            Scale = Vector3.new(1, 1, 1)
        }):Play();
        TweenService:Create(u26, TweenInfo.new(math_random_ret3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
            Size = Vector3.new(v27, v27, 0.1),
            Transparency = math.random(0.2, 0.3)
        }):Play();
        local v28 = v27 * 8;
        task.delay(math.random(v28 * 0.9, v28 * 1.1), function() -- Line: 204
            -- upvalues: Debris (ref), u26 (copy), TweenService (ref)
            Debris:AddItem(u26, 3);
            TweenService:Create(u26, TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Transparency = 1
            }):Play();
        end);
    end;

    table.insert(u22, u19);
    table.insert(u22, Land);
    table.insert(u5, u22);
    u19.AncestryChanged:Once(function(p29, p30) -- Line: 216
        -- upvalues: u5 (ref), u22 (copy)
        local v31 = not p30 and table.find(u5, u22);

        if v31 then
            table.remove(u5, v31);
        end;
    end);
end;

local function BloodTrailFunc(u32, p33, p34, u35, p36) -- Line: 223
    -- upvalues: workspace_CurrentCamera (copy), u5 (copy), CreateBlood (copy), RunService (copy)
    if _G.GSettings and not _G.GSettings.BloodPools or _G.Compliance and (_G.Compliance.BloodMultiplier and math.random() >= _G.Compliance.BloodMultiplier) then
        return;
    end;

    if not (u32 and u32.Parent) then
        return;
    end;

    if (u32.WorldCFrame.p - workspace_CurrentCamera.CFrame.p).Magnitude > 400 or #u5 >= 300 then
        return;
    end;

    if p36 and p36:GetAttribute("_NoBloodTrail") then
        return;
    end;

    local v37, u38, u39, u40, u41, u42, v43, v44, u45;

    if p34 then
        v37 = p33.Amount;
        u38 = p33.Speed;
        u39 = p33.Spread;
        u40 = p33.Size;
        u41 = p33.WidthScale;
        u42 = p33.UpVector;
        v43 = p33.RepeatCount;
        v44 = p33.RepeatTick;
        u45 = p33.CustomColor;
    else
        v37 = p33[1];
        u38 = p33[2];
        u39 = p33[3];
        u40 = p33[4];
        u41 = p33[5];
        u42 = p33[6];
        v43 = p33[7];
        v44 = p33[8];
        u45 = p33[9];
    end;

    local u46 = true;
    local u47 = nil;
    u47 = u32.AncestryChanged:Connect(function(p48, p49) -- Line: 260
        -- upvalues: u47 (ref), u46 (ref)
        if not p49 then
            u47:Disconnect();
            u46 = false;
            u47 = nil;
        end;
    end);

    for i = 1, v43 do
        if #u5 >= 300 or not u46 then
            break;
        end;

        local _ = i;

        for i2 = 1, math.random(v37[1], v37[2]) do
            if #u5 >= 300 or not u46 then
                break;
            end;

            coroutine.wrap(function() -- Line: 274
                -- upvalues: CreateBlood (ref), u32 (copy), u38 (ref), u39 (ref), u40 (ref), u41 (ref), u42 (ref), u35 (copy), u45 (ref)
                CreateBlood(u32, u38, u39, u40, u41, u42, u35, u45);
            end)();
            RunService.RenderStepped:Wait();
            local _ = i2;
        end;

        task.wait(v44);
    end;

    if u47 then
        u47:Disconnect();
    end;
end;

local function BloodHitFunc(p50, p51, p52) -- Line: 295
    -- upvalues: BloodStuff (copy), u3 (copy), Debris (copy)
    if _G.GSettings and not _G.GSettings.BloodEffects or _G.Compliance and (_G.Compliance.BloodMultiplier and math.random() >= _G.Compliance.BloodMultiplier) then
        return;
    end;

    local v53 = typeof(p51) ~= "number" and 1 or p51;
    local math_max_ret = math.max(v53, 0.1);
    local math_min_ret = math.min(math_max_ret, 5);
    local v54;

    if p52 and p52:GetAttribute("IsFallen") then
        v54 = BloodStuff.FlipbookLightning:Clone();
    else
        v54 = u3:Clone();
    end;

    Debris:AddItem(v54, 1.5);

    if math_min_ret ~= 1 then
        local v55 = {};

        for _, v in pairs(v54.Size.Keypoints) do
            local NumberSequenceKeypoint_new_ret = NumberSequenceKeypoint.new(v.Time, v.Value * math_min_ret, v.Envelope * math_min_ret);
            table.insert(v55, NumberSequenceKeypoint_new_ret);
        end;

        v54.Size = NumberSequence.new({ unpack(v55) });
    end;

    v54.Parent = p50;
    v54:Emit(math.random(10, 20));
end;

BloodTrailEvent.OnClientEvent:Connect(BloodTrailFunc);
BloodHitEvent.OnClientEvent:Connect(BloodHitFunc);
BloodTrailEvent2.Event:Connect(BloodTrailFunc);
BloodHitEvent2.Event:Connect(BloodHitFunc);
GorePart.OnClientEvent:Connect(function(p56, p57) -- Line: 356, Name: GorePartFunc
    -- upvalues: RunService (copy)
    if _G.GSettings and not _G.GSettings.Gore or _G.Compliance and _G.Compliance.NoGore then
        RunService.Heartbeat:Wait();

        for _, v in pairs(p57) do
            v:ClearAllChildren();
        end;
    end;
end);
BloodOnPart.OnClientEvent:Connect(function(p58, p59, p60, p61) -- Line: 338, Name: BloodOnPartFunc
    -- upvalues: TweenService (copy)
    if _G.GSettings and not _G.GSettings.BloodPools or _G.Compliance and (_G.Compliance.BloodMultiplier and math.random() >= _G.Compliance.BloodMultiplier) then
        return;
    end;

    for _, v in pairs(p58) do
        local u62 = p59[v];

        if u62 then
            u62.Transparency = u62.Transparency * p60;
            u62.Parent = v;
            delay(p61, function() -- Line: 346
                -- upvalues: u62 (copy), TweenService (ref)
                if u62 and u62.Parent then
                    TweenService:Create(u62, TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                        Transparency = 1
                    }):Play();
                    game.Debris:AddItem(u62, 3);
                end;
            end);
        end;
    end;
end);
SettingsChanged.Event:Connect(function(p63, p64) -- Line: 374
    -- upvalues: u5 (copy), Folder (copy)
    if p63 == "BloodPools" and not p64 then
        table.clear(u5);
        Folder:ClearAllChildren();
    end;
end);
RunService.Heartbeat:Connect(function() -- Line: 381
    -- upvalues: u5 (copy), Raycast (copy)
    for i, v in pairs(u5) do
        if v then
            local v65 = v[1];
            local v66 = v[2];
            local v67 = v[3] or v65.Position;

            if not (v65 and (v65.Parent and v65:FindFirstChild("cPos"))) then
                table.remove(u5, i);

                return;
            end;

            local v68 = Raycast(v65, v67);

            if v68 then
                v66(v68.Instance, v68.Position, v68.Normal);
            end;

            v[3] = v65.Position;
        else
            table.remove(u5, i);
        end;
    end;
end);

return nil;
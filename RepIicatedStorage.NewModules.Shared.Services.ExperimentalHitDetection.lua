-- ============================================================
-- SCRIPT: ExperimentalHitDetection
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Services.ExperimentalHitDetection
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
local u26 = {
    IgnoreList = {},

    NewAttachment = function(p2, p3, p4, p5, p6, p7) -- Line: 9, Name: NewAttachment
        local Attachment = Instance.new("Attachment");
        Attachment.Parent = p2;
        Attachment.Name = "RaycastA";

        if p7 then
            Attachment.Position = Vector3.new(p4, p5, p6);

            return Attachment;
        end;

        local v8 = p3 + Vector3.new(p4, p5, p6);
        local Ray_new_ret = Ray.new(p3, v8 - p3);
        local u9 = {
            workspace.Filter,
            workspace.Characters,
            workspace.Debris,
            p2
        };

        local function GetHit() -- Line: 23
            -- upvalues: Ray_new_ret (copy), u9 (copy), GetHit (copy)
            local v10, v11 = workspace:FindPartOnRayWithIgnoreList(Ray_new_ret, u9, false, true);

            if not v10 or (v10:FindFirstChild("CanHitT") or v10.CanCollide and v10.Transparency < 1) then
                return v10, v11;
            end;

            table.insert(u9, v10);

            return GetHit();
        end;

        local _, v12 = GetHit();
        Attachment.WorldPosition = v12;

        return Attachment;
    end,

    UpdateAttachment = function(p13, p14, p15, p16, p17, p18, p19) -- Line: 84, Name: UpdateAttachment
        if p19 then
            p13.Position = Vector3.new(p16, p17, p18);

            return p13;
        end;

        local v20 = p15 + Vector3.new(p16, p17, p18);
        local Ray_new_ret = Ray.new(p15, v20 - p15);
        local u21 = {
            workspace.Filter,
            workspace.Characters,
            workspace.Debris,
            p14
        };

        local function u24() -- Line: 93
            -- upvalues: Ray_new_ret (copy), u21 (copy), u24 (copy)
            local v22, v23 = workspace:FindPartOnRayWithIgnoreList(Ray_new_ret, u21, false, true);

            if not v22 or (v22:FindFirstChild("CanHitT") or v22.CanCollide and v22.Transparency < 1) then
                return v22, v23;
            end;

            table.insert(u21, v22);

            return u24();
        end;

        local _, v25 = u24();
        p13.WorldPosition = v25;

        return p13;
    end
};

local function IGA(u27) -- Line: 120
    -- upvalues: u26 (copy)
    if not table.find(u26.IgnoreList, u27) then
        table.insert(u26.IgnoreList, u27);
        delay(30, function() -- Line: 124
            -- upvalues: u26 (ref), u27 (copy)
            local table_find_ret = table.find(u26.IgnoreList, u27);

            if table_find_ret then
                table.remove(u26.IgnoreList, table_find_ret);
            end;
        end);
    end;
end;

function u26.CastRay(p28, u29, p30, p31) -- Line: 133
    -- upvalues: u26 (copy)
    local u32, v33 = workspace:FindPartOnRayWithIgnoreList(p28, u29, true);
    local _, v34 = workspace:FindPartOnRayWithWhitelist(p28, { p30 }, true);

    local function checkName(p35) -- Line: 138
        for _, v in pairs({ "Head", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "Torso", "FHead2" }) do
            if p35.Name == v then
                return true;
            end;
        end;

        return false;
    end;

    local function addIg(p36) -- Line: 150
        -- upvalues: u29 (copy)
        table.insert(u29, p36);
    end;

    if u32 and not u32:FindFirstChild("CanHitT") then
        if u32:IsDescendantOf(workspace.Debris) and not u32:FindFirstChild("CanForce") then
            if not table.find(u26.IgnoreList, u32) then
                table.insert(u26.IgnoreList, u32);
                delay(30, function() -- Line: 124
                    -- upvalues: u26 (ref), u32 (copy)
                    local table_find_ret = table.find(u26.IgnoreList, u32);

                    if table_find_ret then
                        table.remove(u26.IgnoreList, table_find_ret);
                    end;
                end);
            end;

            table.insert(u29, u32);

            return u26.CastRay(p28, u29, p30, p31);
        end;

        if u32:IsDescendantOf(workspace.Map.Doors) and not u32.Parent:FindFirstChild("IsElevator1") and (u32.Name ~= "DoorBase" and u32.Name ~= "DoorBase2" or u32.Parent:FindFirstChild("Values") and u32.Parent.Values.Broken.Value) then
            if not table.find(u26.IgnoreList, u32) then
                table.insert(u26.IgnoreList, u32);
                delay(30, function() -- Line: 124
                    -- upvalues: u26 (ref), u32 (copy)
                    local table_find_ret = table.find(u26.IgnoreList, u32);

                    if table_find_ret then
                        table.remove(u26.IgnoreList, table_find_ret);
                    end;
                end);
            end;

            table.insert(u29, u32);

            return u26.CastRay(p28, u29, p30, p31);
        end;

        if u32:IsDescendantOf(workspace.Characters) then
            if not checkName(u32) then
                if not table.find(u26.IgnoreList, u32) then
                    table.insert(u26.IgnoreList, u32);
                    delay(30, function() -- Line: 124
                        -- upvalues: u26 (ref), u32 (copy)
                        local table_find_ret = table.find(u26.IgnoreList, u32);

                        if table_find_ret then
                            table.remove(u26.IgnoreList, table_find_ret);
                        end;
                    end);
                end;

                table.insert(u29, u32);

                return u26.CastRay(p28, u29, p30, p31);
            end;

            if u32.Parent:FindFirstChild("HumanoidRootPart") and u32.Parent ~= p30 then
                table.insert(u29, u32.Parent);

                return u26.CastRay(p28, u29, p30, p31);
            end;
        else
            if u32:IsDescendantOf(workspace.Map.BredMakurz) and u32.Name ~= "MainPart" then
                table.insert(u29, u32);

                return u26.CastRay(p28, u29, p30, p31);
            end;

            local v37 = true;

            if p31 or u32.Name ~= "DoorBase" and u32.Name ~= "DoorBase2" then
                if u32.Parent.Parent == workspace.Map.BredMakurz then
                    v37 = false;
                end;
            else
                v37 = false;
            end;

            if u32.Transparency > 0.999 and (not u32.CanCollide and v37) then
                table.insert(u29, u32);

                return u26.CastRay(p28, u29, p30, p31);
            end;
        end;
    end;

    return u32, v33, v34;
end;

local DeepCopy = require(game:GetService("ReplicatedStorage").NewModules.Shared.Extensions.DeepCopy);

function u26.Cast(p38, u39, p40, u41, u42, u43, u44, u45) -- Line: 209
    -- upvalues: u26 (copy), DeepCopy (copy)
    local u46 = false;

    for i, v in ipairs(p40) do
        local function DoDoRay() -- Line: 213
            -- upvalues: v (copy), u41 (copy), u42 (copy), i (copy), u43 (copy), u26 (ref), DeepCopy (ref), u39 (copy), u44 (copy), u46 (ref), u45 (copy), DoDoRay (copy)
            local WorldPosition = v.WorldPosition;
            local p = u41.CFrame.p;
            local v47 = WorldPosition - CFrame.new(WorldPosition, p).LookVector;
            local _ = CFrame.new(v47, p).RightVector;

            if i ~= 5 then
                local _ = i == 6;
            end;

            local Ray_new_ret = Ray.new(v47, (p - v47).Unit * ((u41.Position - v47).Magnitude + 1));
            local v48 = u43 and u41.Parent or u41;
            local v49, v50, v51 = u26.CastRay(Ray_new_ret, DeepCopy(u26.IgnoreList), v48, true);
            local _ = (v50 - u39.Position).Magnitude;
            local _ = (v50 - v51).Magnitude;

            if v49 == u41 or u43 and (v49 and v49.Parent == u41.Parent) or u44 and (v49 and v49:IsDescendantOf(u41.Parent)) then
                u46 = true;

                return;
            end;

            if u45 and (v49 and v49.Transparency > 0.2) then
                table.insert(u26.IgnoreList, v49);
                DoDoRay();
            end;
        end;

        DoDoRay();

        if u46 then
            break;
        end;
    end;

    return u46;
end;

return u26;
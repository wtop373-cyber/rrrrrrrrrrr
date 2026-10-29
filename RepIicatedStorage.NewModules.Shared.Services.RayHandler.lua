-- ============================================================
-- SCRIPT: RayHandler
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Services.RayHandler
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
local CollectionService = game:GetService("CollectionService");
game:GetService("Players");
local RunService = game:GetService("RunService");
game:GetService("PhysicsService");
local u2 = {};
local u3 = {};
local u4 = {};
local u5 = {};
local u6 = {};
local u7 = {};
local u8 = {};
local u9 = nil;
local u10 = nil;
local u11 = nil;
local u12 = RunService:IsClient();

local function Warn(...) -- Line: 29
end;

local function checkCharPartName(p13) -- Line: 40
    return (p13.Name == "Head" or (p13.Name == "Torso" or (p13.Name == "Left Arm" or (p13.Name == "Right Arm" or p13.Name == "Left Leg")))) and true or p13.Name == "Right Leg";
end;

function u2.CastRay(u14, u15, p16, u17) -- Line: 44
    -- upvalues: u2 (copy), u9 (ref), u10 (ref), u11 (ref), u4 (copy), u5 (copy), u3 (copy), Warn (copy)
    if u2.HasSetUp then
        local u18 = nil;
        local u19 = nil;
        local u20 = nil;
        local u21 = nil;

        local function resetHitResult() -- Line: 51
            -- upvalues: u18 (ref), u19 (ref), u20 (ref), u21 (ref), u14 (copy)
            u18 = nil;
            u19 = u14.Origin + u14.Direction;
            u20 = Vector3.new(0, 1, 0);
            u21 = Enum.Material.Air;
        end;

        local u22 = p16 or {};
        local u23 = nil;
        (function() -- Line: 58, Name: DoRay
            -- upvalues: u9 (ref), u22 (ref), u10 (ref), u11 (ref), u4 (ref), u5 (ref), u3 (ref), u15 (copy), u14 (copy), u18 (ref), u19 (ref), u20 (ref), u21 (ref), u2 (ref), u17 (copy), u23 (ref), Warn (ref)
            local u24 = u9;

            if u22 then
                if u22.type then
                    if u22.type == "m" then
                        u24 = u10;
                    elseif u22.type == "f" then
                        u24 = u11;
                    end;
                end;

                if u22.cg then
                    u24.CollisionGroup = u22.cg;
                end;
            end;

            if not u24 then
                return;
            end;

            local table_clone_ret = table.clone(u24 == u10 and u4 or (u24 == u11 and u5 or u3));

            if u15 and typeof(u15) == "table" then
                for _, v in pairs(u15) do
                    table.insert(table_clone_ret, v);
                end;
            end;

            local function RedoRay() -- Line: 84
                -- upvalues: u24 (ref), table_clone_ret (copy), u14 (ref), u18 (ref), u19 (ref), u20 (ref), u21 (ref), u2 (ref), u22 (ref), u17 (ref), u23 (ref), Warn (ref), RedoRay (copy)
                local RaycastParams_new_ret = RaycastParams.new();
                RaycastParams_new_ret.CollisionGroup = u24.CollisionGroup;
                RaycastParams_new_ret.IgnoreWater = u24.IgnoreWater;
                RaycastParams_new_ret.FilterType = u24.FilterType;
                RaycastParams_new_ret.FilterDescendantsInstances = table_clone_ret;
                local v25 = workspace:Raycast(u14.Origin, u14.Direction, RaycastParams_new_ret);

                if v25 then
                    u18 = v25.Instance;
                    u19 = v25.Position;
                    u20 = v25.Normal;
                    u21 = v25.Material;

                    if u18 and (u2 and u2.CheckAfterRay ~= nil) then
                        local v26, v27 = u2.CheckAfterRay(u18, u22 and u22.type, u17);

                        if v27 and not u23 then
                            u23 = v27;
                        end;

                        if v26 == true then
                            local v28 = u18 and u18:GetFullName();
                            Warn("REDO", (tostring(v28)));
                            table.insert(table_clone_ret, 1, u18);
                            RedoRay();
                        end;
                    end;
                else
                    u18 = nil;
                    u19 = u14.Origin + u14.Direction;
                    u20 = Vector3.new(0, 1, 0);
                    u21 = Enum.Material.Air;
                end;
            end;

            RedoRay();
        end)();

        if u18 == nil and u19 == nil then
            u18 = nil;
            u19 = u14.Origin + u14.Direction;
            u20 = Vector3.new(0, 1, 0);
            u21 = Enum.Material.Air;
        end;

        return u18, u19, u20, u21, u23;
    end;
end;

function u2.SetUp() -- Line: 139
    -- upvalues: u2 (copy), RunService (copy), Warn (copy), u9 (ref), u10 (ref), u11 (ref), u3 (copy), u4 (copy), u5 (copy), CollectionService (copy), u6 (copy), u7 (copy), u8 (copy), u12 (copy)
    if u2.HasSetUp then
        return;
    end;

    u2.HasSetUp = true;
    u2.IsClient = RunService:IsClient();
    Warn("RayHandler: Setting up..");
    u9 = RaycastParams.new();
    u9.FilterType = Enum.RaycastFilterType.Blacklist;
    u9.IgnoreWater = true;
    u9.CollisionGroup = "Default";
    u10 = RaycastParams.new();
    u10.FilterType = Enum.RaycastFilterType.Blacklist;
    u10.IgnoreWater = true;
    u10.CollisionGroup = "Default";

    if u2.IsClient then
        u11 = RaycastParams.new();
        u11.FilterType = Enum.RaycastFilterType.Blacklist;
        u11.IgnoreWater = true;
        u11.CollisionGroup = "Default";
    end;

    local Map = workspace:WaitForChild("Map", 1000);
    local Filter = workspace:WaitForChild("Filter", 1000);
    local Debris = workspace:WaitForChild("Debris");
    local Characters = workspace:WaitForChild("Characters");
    Filter:WaitForChild("Parts", 60);
    Map:WaitForChild("Parts", 60);

    local function Update() -- Line: 171
        -- upvalues: u9 (ref), u3 (ref), u10 (ref), u4 (ref), u2 (ref), u11 (ref), u5 (ref), Warn (ref)
        u9.FilterDescendantsInstances = u3;
        u10.FilterDescendantsInstances = u4;

        if u2.IsClient then
            u11.FilterDescendantsInstances = u5;
        end;

        Warn("RHTC:", #u3, #u4, #u5, 0 + #u5 + #u4 + #u3);
    end;

    Warn("RayHandler: Created base Params up..");

    local function MonitorMap() -- Line: 336
        -- upvalues: u2 (ref), u12 (ref), Map (copy), Filter (copy), Characters (copy), Debris (copy), Warn (ref)
        function u2.CheckAfterRay(p29, p30, p31) -- Line: 340
            -- upvalues: u12 (ref), u2 (ref), Map (ref), Filter (ref)
            local v32 = false;
            local v33 = nil;
            local v34 = false;

            if not p29:FindFirstChild("CanHitT") then
                if p29:IsDescendantOf(workspace.Characters) and (p29.Name ~= "Head" and (p29.Name ~= "Torso" and (p29.Name ~= "Left Arm" and (p29.Name ~= "Right Arm" and p29.Name ~= "Left Leg"))) and p29.Name ~= "Right Leg" or p29.Transparency >= 1) then
                    v32 = true;
                    v34 = true;

                    if u12 and (p29.Transparency < 1 or p29:GetAttribute("ARp")) and p29:GetAttribute("ARv") then
                        v33 = {
                            HIP = p29,
                            ARv = p29:GetAttribute("ARv")
                        };
                    elseif p29.Name ~= "Head" and (p29.Name ~= "Torso" and (p29.Name ~= "Left Arm" and (p29.Name ~= "Right Arm" and p29.Name ~= "Left Leg"))) and p29.Name ~= "Right Leg" then
                        u2.HFuncs.MIP_0_A(p29);
                    end;
                end;

                if not v34 then
                    local v35 = p29.Name == "DoorBase" and true or p29.Name == "DoorBase2";

                    if p30 and (p30 == "g" and p29:FindFirstChild("FilterV")) then
                        return true, v33;
                    end;

                    if p29:IsDescendantOf(Map.Parts) and (p29.Transparency >= 1 and not p29.CanCollide) then
                        p29.Parent = Filter.Parts;

                        return true, v33;
                    end;

                    if p29.Transparency >= 1 and (p29.Name ~= "MainPart" and (p30 ~= "m" or not v35)) then
                        v32 = true;

                        if not v35 then
                            u2.HFuncs.MIP_0_A(p29);

                            return v32, v33;
                        end;
                    elseif p29:GetAttribute("RayHandlerIG") then
                        v32 = true;
                    end;
                end;
            end;

            return v32, v33;
        end;

        if u2.IsClient then
            u2.HFuncs.MIP_0_A(workspace.CurrentCamera);
            u2.HFuncs.MIP_3_A(Characters);
        end;

        for _, child in pairs(Filter:GetChildren()) do
            if child.Name == "SpawnedPiles" or child.Name == "SpawnedSupplyPlanes" then
                u2.HFuncs.MIP_0_A(child, true);
            else
                u2.HFuncs.MIP_0_A(child);
            end;
        end;

        u2.HFuncs.MIP_0_A(Debris);
        Warn("Total CSP:", 0);
    end;

    (function() -- Line: 189, Name: HandleRemovals
        -- upvalues: u2 (ref), Warn (ref), CollectionService (ref), u6 (ref), u3 (ref), u7 (ref), u4 (ref), u8 (ref), u5 (ref), u9 (ref), u10 (ref), u11 (ref)
        u2.HFuncs = {};

        local function removeFrom(p36, p37) -- Line: 192
            local table_find_ret = table.find(p36, p37);

            if table_find_ret then
                table.remove(p36, table_find_ret);
            end;
        end;

        function u2.HFuncs.MIP_0_A(p38, p39) -- Line: 199
            -- upvalues: Warn (ref), CollectionService (ref), u6 (ref), u3 (ref), u7 (ref), u4 (ref), u2 (ref), u8 (ref), u5 (ref), u9 (ref), u10 (ref), u11 (ref)
            Warn("AddedTag0:", p38:GetFullName());
            CollectionService:AddTag(p38, "MainIgnorePart");

            if not u6[p38] then
                u6[p38] = #u3;
            end;

            if not (p39 or u7[p38]) then
                table.insert(u4, p38);
                u7[p38] = #u4;
            end;

            if u2.IsClient and not u8[p38] then
                table.insert(u5, p38);
                u8[p38] = #u5;
            end;

            u9.FilterDescendantsInstances = u3;
            u10.FilterDescendantsInstances = u4;

            if u2.IsClient then
                u11.FilterDescendantsInstances = u5;
            end;

            Warn("RHTC:", #u3, #u4, #u5, 0 + #u5 + #u4 + #u3);
        end;

        function u2.HFuncs.MIP_0_R(p40) -- Line: 221
            -- upvalues: Warn (ref), u6 (ref), u3 (ref), u7 (ref), u4 (ref), u8 (ref), u5 (ref), u9 (ref), u10 (ref), u2 (ref), u11 (ref)
            Warn("RemovedTag0 " .. p40:GetFullName());

            if u6[p40] then
                local v41 = u3;
                local table_find_ret = table.find(v41, p40);

                if table_find_ret then
                    table.remove(v41, table_find_ret);
                end;

                u6[p40] = nil;
            end;

            if u7[p40] then
                local v42 = u4;
                local table_find_ret = table.find(v42, p40);

                if table_find_ret then
                    table.remove(v42, table_find_ret);
                end;

                u7[p40] = nil;
            end;

            if u8[p40] then
                local v43 = u5;
                local table_find_ret = table.find(v43, p40);

                if table_find_ret then
                    table.remove(v43, table_find_ret);
                end;

                u8[p40] = nil;
            end;

            u9.FilterDescendantsInstances = u3;
            u10.FilterDescendantsInstances = u4;

            if u2.IsClient then
                u11.FilterDescendantsInstances = u5;
            end;

            Warn("RHTC:", #u3, #u4, #u5, 0 + #u5 + #u4 + #u3);
        end;

        CollectionService:GetInstanceRemovedSignal("MainIgnorePart"):Connect(u2.HFuncs.MIP_0_R);

        function u2.HFuncs.MIP_1_A(p44) -- Line: 245
            -- upvalues: CollectionService (ref), Warn (ref), u6 (ref), u3 (ref), u9 (ref), u10 (ref), u4 (ref), u2 (ref), u11 (ref), u5 (ref)
            CollectionService:AddTag(p44, "MainIgnorePart_1");
            Warn("AddedTag1:", p44:GetFullName());

            if not u6[p44] then
                table.insert(u3, p44);
                u6[p44] = #u3;
            end;

            u9.FilterDescendantsInstances = u3;
            u10.FilterDescendantsInstances = u4;

            if u2.IsClient then
                u11.FilterDescendantsInstances = u5;
            end;

            Warn("RHTC:", #u3, #u4, #u5, 0 + #u5 + #u4 + #u3);
        end;

        function u2.HFuncs.MIP_1_R(p45) -- Line: 257
            -- upvalues: Warn (ref), u6 (ref), u3 (ref), u9 (ref), u10 (ref), u4 (ref), u2 (ref), u11 (ref), u5 (ref)
            Warn("RemovedTag1:", p45:GetFullName());

            if u6[p45] then
                local v46 = u3;
                local table_find_ret = table.find(v46, p45);

                if table_find_ret then
                    table.remove(v46, table_find_ret);
                end;

                u6[p45] = nil;
            end;

            u9.FilterDescendantsInstances = u3;
            u10.FilterDescendantsInstances = u4;

            if u2.IsClient then
                u11.FilterDescendantsInstances = u5;
            end;

            Warn("RHTC:", #u3, #u4, #u5, 0 + #u5 + #u4 + #u3);
        end;

        CollectionService:GetInstanceRemovedSignal("MainIgnorePart_1"):Connect(u2.HFuncs.MIP_1_R);

        function u2.HFuncs.MIP_2_A(p47) -- Line: 269
            -- upvalues: Warn (ref), CollectionService (ref), u7 (ref), u4 (ref), u9 (ref), u3 (ref), u10 (ref), u2 (ref), u11 (ref), u5 (ref)
            Warn("AddedTag2:", p47:GetFullName());
            CollectionService:AddTag(p47, "MainIgnorePart_2");

            if not u7[p47] then
                table.insert(u4, p47);
                u7[p47] = #u4;
            end;

            u9.FilterDescendantsInstances = u3;
            u10.FilterDescendantsInstances = u4;

            if u2.IsClient then
                u11.FilterDescendantsInstances = u5;
            end;

            Warn("RHTC:", #u3, #u4, #u5, 0 + #u5 + #u4 + #u3);
        end;

        function u2.HFuncs.MIP_2_R(p48) -- Line: 282
            -- upvalues: Warn (ref), u7 (ref), u4 (ref), u9 (ref), u3 (ref), u10 (ref), u2 (ref), u11 (ref), u5 (ref)
            Warn("RemovedTag2:", p48:GetFullName());

            if u7[p48] then
                local v49 = u4;
                local table_find_ret = table.find(v49, p48);

                if table_find_ret then
                    table.remove(v49, table_find_ret);
                end;

                u7[p48] = nil;
            end;

            u9.FilterDescendantsInstances = u3;
            u10.FilterDescendantsInstances = u4;

            if u2.IsClient then
                u11.FilterDescendantsInstances = u5;
            end;

            Warn("RHTC:", #u3, #u4, #u5, 0 + #u5 + #u4 + #u3);
        end;

        CollectionService:GetInstanceRemovedSignal("MainIgnorePart_2"):Connect(u2.HFuncs.MIP_2_R);

        function u2.HFuncs.MIP_3_A(p50) -- Line: 295
            -- upvalues: u2 (ref), Warn (ref), CollectionService (ref), u8 (ref), u5 (ref), u9 (ref), u3 (ref), u10 (ref), u4 (ref), u11 (ref)
            if not u2.IsClient then
                return;
            end;

            Warn("AddedTag3:", p50:GetFullName());
            CollectionService:AddTag(p50, "MainIgnorePart_3");

            if not u8[p50] then
                table.insert(u5, p50);
                u8[p50] = #u5;
            end;

            u9.FilterDescendantsInstances = u3;
            u10.FilterDescendantsInstances = u4;

            if u2.IsClient then
                u11.FilterDescendantsInstances = u5;
            end;

            Warn("RHTC:", #u3, #u4, #u5, 0 + #u5 + #u4 + #u3);
        end;

        function u2.HFuncs.MIP_3_R(p51) -- Line: 311
            -- upvalues: u2 (ref), Warn (ref), u8 (ref), u5 (ref), u9 (ref), u3 (ref), u10 (ref), u4 (ref), u11 (ref)
            if not u2.IsClient then
                return;
            end;

            Warn("RemovedTag3:", p51:GetFullName());

            if u8[p51] then
                local v52 = u5;
                local table_find_ret = table.find(v52, p51);

                if table_find_ret then
                    table.remove(v52, table_find_ret);
                end;

                u8[p51] = nil;
            end;

            u9.FilterDescendantsInstances = u3;
            u10.FilterDescendantsInstances = u4;

            if u2.IsClient then
                u11.FilterDescendantsInstances = u5;
            end;

            Warn("RHTC:", #u3, #u4, #u5, 0 + #u5 + #u4 + #u3);
        end;

        CollectionService:GetInstanceRemovedSignal("MainIgnorePart_3"):Connect(u2.HFuncs.MIP_3_R);

        for _, v in pairs(CollectionService:GetTagged("MainIgnorePart_1")) do
            u2.HFuncs.MIP_1_A(v);
        end;

        for _, v in pairs(CollectionService:GetTagged("MainIgnorePart_2")) do
            u2.HFuncs.MIP_2_A(v);
        end;

        for _, v in pairs(CollectionService:GetTagged("MainIgnorePart_3")) do
            u2.HFuncs.MIP_3_A(v);
        end;
    end)();
    Warn("RayHandler: Handled removals..");
    task.wait(0.1);
    MonitorMap();
    Warn("RayHandler: Monitored map..");
    Warn("RayHandler: Monitored players..");
    task.wait(0.1);
    u9.FilterDescendantsInstances = u3;
    u10.FilterDescendantsInstances = u4;

    if u2.IsClient then
        u11.FilterDescendantsInstances = u5;
    end;

    Warn("RHTC:", #u3, #u4, #u5, 0 + #u5 + #u4 + #u3);
    Warn("RayHandler: Completed.");
end;

return u2;
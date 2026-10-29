-- ============================================================
-- SCRIPT: FastCastRedux
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Services.FastCastRedux
-- ============================================================

-- Decompiled with Potassium's decompiler.

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local u1 = {
    DebugLogging = false,
    VisualizeCasts = false,
    RayExit = false
};
u1.__index = u1;
local NewModules = ReplicatedStorage:WaitForChild("NewModules");
local RayHandler = require(NewModules.Shared.Services.RayHandler);
local RunService = game:GetService("RunService");
local Workspace = game:GetService("Workspace");
local Players = game:GetService("Players");
game:GetService("ReplicatedStorage");
local Signal = require(script:WaitForChild("Signal"));
local Table = require(script:WaitForChild("Table"));
require(script:WaitForChild("Thread"));

local function MandateType(p2, p3, p4, p5) -- Line: 80
    if p5 and p2 == nil then
        return;
    end;

    local v6 = typeof(p2) == p3;
    local v7 = typeof(p2);
    assert(v6, ("Invalid type for parameter \'%s\' (Expected %s, got %s)"):format(p4 or "ERR_NO_PARAM_NAME", p3, v7));
end;

local function GetFastCastVisualizationContainer() -- Line: 86
    -- upvalues: Workspace (copy)
    local FastCastVisualizationObjects = Workspace.Terrain:FindFirstChild("FastCastVisualizationObjects");

    if FastCastVisualizationObjects ~= nil then
        return FastCastVisualizationObjects;
    end;

    local Folder = Instance.new("Folder");
    Folder.Name = "FastCastVisualizationObjects";
    Folder.Archivable = false;
    Folder.Parent = Workspace.Terrain;

    return Folder;
end;

local function PrintDebug(p8) -- Line: 104
    -- upvalues: u1 (copy)
    if u1.DebugLogging == true then
        print(p8);
    end;
end;

function DbgVisualizeSegment(p9, p10)
    -- upvalues: u1 (copy), Workspace (copy)
    if u1.VisualizeCasts == true then
        local ConeHandleAdornment = Instance.new("ConeHandleAdornment");
        ConeHandleAdornment.Adornee = Workspace.Terrain;
        ConeHandleAdornment.CFrame = p9;
        ConeHandleAdornment.Height = p10;
        ConeHandleAdornment.Color3 = Color3.new();
        ConeHandleAdornment.Radius = 0.25;
        ConeHandleAdornment.Transparency = 0.5;
        local FastCastVisualizationObjects = Workspace.Terrain:FindFirstChild("FastCastVisualizationObjects");

        if FastCastVisualizationObjects == nil then
            FastCastVisualizationObjects = Instance.new("Folder");
            FastCastVisualizationObjects.Name = "FastCastVisualizationObjects";
            FastCastVisualizationObjects.Archivable = false;
            FastCastVisualizationObjects.Parent = Workspace.Terrain;
        end;

        ConeHandleAdornment.Parent = FastCastVisualizationObjects;

        return ConeHandleAdornment;
    end;
end;

function DbgVisualizeHit(p11, p12)
    -- upvalues: u1 (copy), Workspace (copy)
    if u1.VisualizeCasts == true then
        local SphereHandleAdornment = Instance.new("SphereHandleAdornment");
        SphereHandleAdornment.Adornee = Workspace.Terrain;
        SphereHandleAdornment.CFrame = p11;
        SphereHandleAdornment.Radius = 0.4;
        SphereHandleAdornment.Transparency = 0.25;
        SphereHandleAdornment.Color3 = p12;
        local FastCastVisualizationObjects = Workspace.Terrain:FindFirstChild("FastCastVisualizationObjects");

        if FastCastVisualizationObjects == nil then
            FastCastVisualizationObjects = Instance.new("Folder");
            FastCastVisualizationObjects.Name = "FastCastVisualizationObjects";
            FastCastVisualizationObjects.Archivable = false;
            FastCastVisualizationObjects.Parent = Workspace.Terrain;
        end;

        SphereHandleAdornment.Parent = FastCastVisualizationObjects;

        return SphereHandleAdornment;
    end;
end;

local function Cast(p13, p14, p15, p16) -- Line: 142
    -- upvalues: Workspace (copy)
    return Workspace:FindPartOnRay(Ray.new(p13, p14), p15, false, p16);
end;

local function CastWithWhitelist(p17, p18, p19, p20) -- Line: 148
    -- upvalues: Workspace (copy)
    if not p19 or typeof(p19) ~= "table" then
        error("Call in CastWhitelist failed! Whitelist table is either nil, or is not actually a table.", 0);
    end;

    return Workspace:FindPartOnRayWithWhitelist(Ray.new(p17, p18), p19, p20);
end;

local LocalPlayer = Players.LocalPlayer;
local u21 = { "Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg" };
local u22 = { { "X", Vector3.new(1, 0, 0) }, { "Y", Vector3.new(0, 1, 0) }, { "Z", Vector3.new(0, 0, 1) } };

local function RayBox(p23, p24, p25) -- Line: 162
    -- upvalues: u22 (copy)
    local CFrame2 = p23.CFrame;
    local v26 = CFrame2:PointToObjectSpace(p24);
    local v27 = CFrame2:VectorToObjectSpace(p25);
    local v28 = p23.Size / 2;
    local v29 = 0;
    local v30 = 1;
    local v31 = nil;

    for _, v in ipairs(u22) do
        local v32 = v26[v[1]];
        local v33 = v27[v[1]];
        local v34 = v28[v[1]];

        if math.abs(v33) < 1e-8 then
            if v34 < math.abs(v32) then
                return nil;
            end;
        else
            local v35 = (-v34 - v32) / v33;
            local v36 = (v34 - v32) / v33;
            local v37;

            if v36 < v35 then
                v37 = 1;
            else
                local v38 = v35;
                v35 = v36;
                v36 = v38;
                v37 = -1;
            end;

            if v29 < v36 then
                v31 = v[2] * v37;
            else
                v36 = v29;
            end;

            v30 = math.min(v30, v35);

            if v30 < v36 then
                return nil;
            end;

            v29 = v36;
        end;
    end;

    if v31 then
        return v29, CFrame2:VectorToWorldSpace(v31);
    end;

    return nil;
end;

local function HitLocalBody(p39, p40, p41, p42, p43, p44, p45, p46) -- Line: 194
    -- upvalues: LocalPlayer (copy), Table (copy), u21 (copy), RayBox (copy)
    local v47 = LocalPlayer and LocalPlayer.Character;

    if not (v47 and (p43 and not Table.contains(p41, v47))) then
        return p42, p43, p44, p45, p46;
    end;

    local v48 = v47:FindFirstChild("HumanoidRootPart") or v47:FindFirstChild("Torso");

    if v48 and v48:IsA("BasePart") then
        local v49 = p43 - p39;
        local v50 = v48.Position - p39;
        local v51 = v49:Dot(v49);
        local v52;

        if v51 > 0 then
            local v53 = v50:Dot(v49) / v51;
            v52 = math.clamp(v53, 0, 1) or 0;
        else
            v52 = 0;
        end;

        if (v50 - v49 * v52).Magnitude > math.max(12, v48.Size.Magnitude * 4) then
            return p42, p43, p44, p45, p46;
        end;
    end;

    local Magnitude = p40.Magnitude;
    local v54 = (p43 - p39).Magnitude - 0.01;

    for _, v in ipairs(u21) do
        local v55 = v47:FindFirstChild(v);

        if v55 and (v55:IsA("BasePart") and (v55.CanQuery and v55.Transparency < 1)) then
            local v56, v57 = RayBox(v55, p39, p40);

            if v56 and v56 * Magnitude < v54 then
                v54 = v56 * Magnitude;
                p43 = p39 + p40 * v56;
                p45 = v55.Material;
                p44 = v57;
                p42 = v55;
            end;
        end;
    end;

    return p42, p43, p44, p45, p46;
end;

local function CastWithBlacklist(p58, p59, p60, p61) -- Line: 225
    -- upvalues: HitLocalBody (copy), RayHandler (copy)
    if not p60 or typeof(p60) ~= "table" then
        error("Call in CastBlacklist failed! Blacklist table is either nil, or is not actually a table.", 0);
    end;

    local Ray_new_ret = Ray.new(p58, p59);

    return HitLocalBody(p58, p59, p60, RayHandler.CastRay(Ray_new_ret, p60, {
        type = "g",
        cg = "Default"
    }));
end;

local function CastWithBlacklistAndNoHumPenetration(p62, p63, p64, p65) -- Line: 235
    -- upvalues: HitLocalBody (copy), RayHandler (copy)
    if not p64 or typeof(p64) ~= "table" then
        error("Call in CastBlacklist failed! Blacklist table is either nil, or is not actually a table.", 0);
    end;

    local Ray_new_ret = Ray.new(p62, p63);

    return HitLocalBody(p62, p63, p64, RayHandler.CastRay(Ray_new_ret, p64, {
        type = "g",
        cg = "Default"
    }));
end;

local function GetPositionAtTime(p66, p67, p68, p69) -- Line: 248
    local Vector3_new_ret = Vector3.new(p69.X * p66 ^ 2 / 2, p69.Y * p66 ^ 2 / 2, p69.Z * p66 ^ 2 / 2);

    return p67 + p68 * p66 + Vector3_new_ret;
end;

local function GetVelocityAtTime(p70, p71, p72) -- Line: 254
    return p71 + p72 * p70;
end;

local function SimulateCast(u73, u74, p75, p76, u77, u78, u79, u80, u81, u82, u83, p84, u85, u86, u87, u88, u89) -- Line: 259
    -- upvalues: u1 (copy), RunService (copy), Table (copy), Workspace (copy), CastWithWhitelist (copy), CastWithBlacklistAndNoHumPenetration (copy), CastWithBlacklist (copy)
    if u1.DebugLogging == true then
        print("Cast simulation requested.");
    end;

    if type(p76) == "number" then
        p76 = p75.Unit * p76;
    end;

    local u90 = u88 == nil and 0 or (u88.penetrationDepth or 0);
    local u91 = u88 == nil and 0 or (u88.penetrationAmount or 0);
    local u92 = p84 or Vector3.new();
    local Magnitude = p75.Magnitude;
    local u93 = (p75.Unit + p76).Unit * p76.Magnitude;
    local u94 = 0;
    local u95 = 0;
    local u96 = u74;
    local u97 = nil;
    local u98 = false;
    local u99 = false;
    local u100;

    if RunService:IsClient() then
        u100 = RunService.RenderStepped;
    else
        u100 = RunService.Heartbeat;
    end;

    local Attribute = u81:GetAttribute("TracerName");

    if Attribute then
        task.delay(0.0165, function() -- Line: 292
            -- upvalues: u81 (copy), Attribute (copy)
            pcall(function() -- Line: 293
                -- upvalues: u81 (ref), Attribute (ref)
                u81[Attribute].Enabled = true;
            end);
        end);
    end;

    local function Fire(p101, p102) -- Line: 299
        -- upvalues: u1 (ref), u94 (ref), u74 (copy), u93 (copy), u92 (copy), u96 (ref), u77 (ref), u82 (ref), u83 (copy), u78 (copy), u81 (copy), u85 (copy), u86 (copy), u87 (copy), u89 (copy), u73 (copy), Table (ref), u95 (ref), Workspace (ref), u88 (copy), u90 (ref), u91 (ref), u98 (ref), u99 (ref), u97 (ref), u79 (copy), CastWithWhitelist (ref), u80 (copy), CastWithBlacklistAndNoHumPenetration (ref), CastWithBlacklist (ref), Fire (copy), Magnitude (copy)
        if u1.DebugLogging == true then
            print("Casting for frame.");
        end;

        u94 = u94 + p101;

        if not p102 then
            local v103 = u94;
            local v104 = u92;
            local Vector3_new_ret = Vector3.new(v104.X * v103 ^ 2 / 2, v104.Y * v103 ^ 2 / 2, v104.Z * v103 ^ 2 / 2);
            p102 = u74 + u93 * v103 + Vector3_new_ret;
        end;

        local v105 = u93 + u92 * u94;
        local v106 = (p102 - u96).Unit * v105.Magnitude * p101;
        local v107, v108, v109, v110, v111 = u77(u96, v106, u82, u83);

        if not (v108 and u96) then
            return;
        end;

        local Magnitude2 = (v108 - u96).Magnitude;
        u78:Fire(u74, u96, v106.Unit, Magnitude2, v105, u81, u85, u86, u87);
        local v112;

        if p101 > 0 then
            v112 = DbgVisualizeSegment(CFrame.new(u96, u96 + v106), Magnitude2);
        else
            v112 = nil;
        end;

        local v113 = v107 and (v107 ~= u81 and (u89 and type(u82) == "table")) and u89(u73, u74, v106.Unit, v107, v108, v109, v110, v111);

        if v113 then
            Table.insert(u82, v113);
            u96 = v108;
            u95 = u95 + Magnitude2;

            return;
        end;

        if not v107 or v107 == u81 then
            u96 = v108;
            u95 = u95 + Magnitude2;

            if Magnitude < u95 then
                u97:Disconnect();
                u97 = nil;
                u79:Fire(u73, u74, v106.Unit, nil, u96, nil, nil, nil, Vector3.new(), u81, u87);
            end;

            return;
        end;

        tick();
        local v114 = v107.Size.Magnitude * v106.Unit;
        local v115 = { v107 };

        if not v115 or typeof(v115) ~= "table" then
            error("Call in CastWhitelist failed! Whitelist table is either nil, or is not actually a table.", 0);
        end;

        local v116, v117, v118, v119 = Workspace:FindPartOnRayWithWhitelist(Ray.new(v108 + v114, -v114), v115, u83);
        local Magnitude3 = (v117 - v108).Magnitude;

        if u88 ~= nil and (u88.penetrationType == "WallPenetraion" and (u88.canPenetrateFunction ~= nil and Magnitude3 < u90) or u88.penetrationType == "HumanoidPenetration" and (u88.canPenetrateHumanoidFunction ~= nil and u91 > 0)) then
            if u98 then
                error("ERROR: The latest call to canPenetrateFunction/canPenetrateHumanoidFunction took too long to complete! This cast is going to suffer desyncs which WILL cause unexpected behavior and errors.");
            end;

            u98 = true;
            u99 = false;
        end;

        if u88 == nil or u88 ~= nil and (u88.penetrationType == "WallPenetraion" and u90 < Magnitude3 or u88.penetrationType == "HumanoidPenetration" and (u88.canPenetrateHumanoidFunction(u74, v106.Unit, v107, v108, v109, v110, v105, u91, u87) == false or u91 <= 0)) then
            if u1.DebugLogging == true then
                print("Penetrating data is nil or penetrationPower is lower than dist/penetrationCount is at 0. Ending cast and firing RayHit.");
            end;

            u98 = false;

            if u97 then
                u97:Disconnect();
            end;

            u97 = nil;
            u79:Fire(u73, u74, v106.Unit, v107, v108, v109, v110, v111, v105, u81, u87);
            DbgVisualizeHit(CFrame.new(v108), Color3.new(0.2, 1, 0.5));

            return;
        end;

        if v112 ~= nil then
            v112.Color3 = Color3.new(0.4, 0.05, 0.05);
        end;

        DbgVisualizeHit(CFrame.new(v108), Color3.new(1, 0.2, 0.2));

        if u1.DebugLogging == true then
            print("Penetrating returned \'penetratedHumanoid\' or \'penetratedObject\'/TRUE to penetrate this hit. Processing...");
        end;

        u98 = false;

        if u88.penetrationType == "WallPenetraion" then
            local v120;

            if u88 == nil then
                v120 = false;
            else
                v120 = u88.canPenetrateFunction(u74, v106.Unit, v107, v108, v109, v110, v105, u87);
            end;

            if u77 == CastWithWhitelist then
                if v120 == "penetratedHumanoid" and (v107.Parent:FindFirstChildOfClass("Humanoid") and v107.Parent:FindFirstChildOfClass("Humanoid").Health > 0) or v107.Parent.Parent:FindFirstChildOfClass("Humanoid") and v107.Parent.Parent:FindFirstChildOfClass("Humanoid").Health > 0 then
                    if v116 and u1.RayExit then
                        u80:Fire(v108 + v114, -v114, v116, v117, v118, v119, v105, u87);
                        DbgVisualizeHit(CFrame.new(v117), Color3.fromRGB(13, 105, 172));
                    end;

                    local v121 = v107.Parent:FindFirstChildOfClass("Humanoid") or v107.Parent.Parent:FindFirstChildOfClass("Humanoid");
                    Table.removeObject(u82, v121.Parent);
                    u90 = u90 * (1 - Magnitude3 / u90 / 1.1);
                    local v122 = "Whitelist cast detected, removed " .. tostring(v121.Parent) .. " from the whitelist.";

                    if u1.DebugLogging == true then
                        print(v122);
                    end;
                elseif v120 == "penetratedObject" then
                    if v116 and u1.RayExit then
                        u80:Fire(v108 + v114, -v114, v116, v117, v118, v119, v105, u87);
                        DbgVisualizeHit(CFrame.new(v117), Color3.fromRGB(13, 105, 172));
                    end;

                    Table.removeObject(u82, v107);
                    u90 = u90 * (1 - Magnitude3 / u90 / 1.1);
                    local v123 = "Whitelist cast detected, removed " .. tostring(v107) .. " from the whitelist.";

                    if u1.DebugLogging == true then
                        print(v123);
                    end;
                end;
            elseif u77 == CastWithBlacklistAndNoHumPenetration then
                if v120 == "penetratedHumanoid" and (v107.Parent:FindFirstChildOfClass("Humanoid") and v107.Parent:FindFirstChildOfClass("Humanoid").Health > 0) or v107.Parent.Parent:FindFirstChildOfClass("Humanoid") and v107.Parent.Parent:FindFirstChildOfClass("Humanoid").Health > 0 then
                    if v116 and u1.RayExit then
                        u80:Fire(v108 + v114, -v114, v116, v117, v118, v119, v105, u87);
                        DbgVisualizeHit(CFrame.new(v117), Color3.fromRGB(13, 105, 172));
                    end;

                    local v124 = v107.Parent:FindFirstChildOfClass("Humanoid") or v107.Parent.Parent:FindFirstChildOfClass("Humanoid");
                    Table.insert(u82, v124.Parent);
                    u90 = u90 * (1 - Magnitude3 / u90 / 1.1);
                    local v125 = "Blacklist cast detected, added " .. tostring(v124.Parent) .. " to the blacklist.";

                    if u1.DebugLogging == true then
                        print(v125);
                    end;
                elseif v120 == "penetratedObject" then
                    if v116 and u1.RayExit then
                        u80:Fire(v108 + v114, -v114, v116, v117, v118, v119, v105, u87);
                        DbgVisualizeHit(CFrame.new(v117), Color3.fromRGB(13, 105, 172));
                    end;

                    Table.insert(u82, v107);
                    u90 = u90 * (1 - Magnitude3 / u90 / 1.1);
                    local v126 = "Blacklist cast detected, added " .. tostring(v107) .. " to the blacklist.";

                    if u1.DebugLogging == true then
                        print(v126);
                    end;
                end;
            else
                u77 = CastWithBlacklistAndNoHumPenetration;
                u82 = u82:GetDescendants();

                if v120 == "penetratedHumanoid" and (v107.Parent:FindFirstChildOfClass("Humanoid") and v107.Parent:FindFirstChildOfClass("Humanoid").Health > 0) or v107.Parent.Parent:FindFirstChildOfClass("Humanoid") and v107.Parent.Parent:FindFirstChildOfClass("Humanoid").Health > 0 then
                    if v116 and u1.RayExit then
                        u80:Fire(v108 + v114, -v114, v116, v117, v118, v119, v105, u87);
                        DbgVisualizeHit(CFrame.new(v117), Color3.fromRGB(13, 105, 172));
                    end;

                    local v127 = v107.Parent:FindFirstChildOfClass("Humanoid") or v107.Parent.Parent:FindFirstChildOfClass("Humanoid");
                    Table.insert(u82, v127.Parent);
                    u90 = u90 * (1 - Magnitude3 / u90 / 1.1);
                    local v128 = "Stock cast detected, transformed cast into blacklist cast and added " .. tostring(v127.Parent) .. " to the blacklist.";

                    if u1.DebugLogging == true then
                        print(v128);
                    end;
                elseif v120 == "penetratedObject" then
                    if v116 and u1.RayExit then
                        u80:Fire(v108 + v114, -v114, v116, v117, v118, v119, v105, u87);
                        DbgVisualizeHit(CFrame.new(v117), Color3.fromRGB(13, 105, 172));
                    end;

                    Table.insert(u82, v107);
                    u90 = u90 * (1 - Magnitude3 / u90 / 1.1);
                    local v129 = "Stock cast detected, transformed cast into blacklist cast and added " .. tostring(v107) .. " to the blacklist.";

                    if u1.DebugLogging == true then
                        print(v129);
                    end;
                end;
            end;
        elseif u88.penetrationType == "HumanoidPenetration" then
            if u77 == CastWithWhitelist then
                if v107.Parent:FindFirstChildOfClass("Humanoid") and v107.Parent:FindFirstChildOfClass("Humanoid").Health > 0 or v107.Parent.Parent:FindFirstChildOfClass("Humanoid") and v107.Parent.Parent:FindFirstChildOfClass("Humanoid").Health > 0 then
                    u99 = true;
                    local v130 = v107.Parent:FindFirstChildOfClass("Humanoid") or v107.Parent.Parent:FindFirstChildOfClass("Humanoid");
                    Table.removeObject(u82, v130.Parent);
                    local v131 = "Whitelist cast detected, removed " .. tostring(v130.Parent) .. " from the whitelist.";

                    if u1.DebugLogging == true then
                        print(v131);
                    end;
                else
                    u99 = false;
                    Table.removeObject(u82, v107);
                    local v132 = "Whitelist cast detected, removed " .. tostring(v107) .. " from the whitelist.";

                    if u1.DebugLogging == true then
                        print(v132);
                    end;
                end;
            elseif u77 == CastWithBlacklist then
                if v107.Parent:FindFirstChildOfClass("Humanoid") and v107.Parent:FindFirstChildOfClass("Humanoid").Health > 0 or v107.Parent.Parent:FindFirstChildOfClass("Humanoid") and v107.Parent.Parent:FindFirstChildOfClass("Humanoid").Health > 0 then
                    u99 = true;
                    local v133 = v107.Parent:FindFirstChildOfClass("Humanoid") or v107.Parent.Parent:FindFirstChildOfClass("Humanoid");
                    Table.insert(u82, v133.Parent);
                    local v134 = "Blacklist cast detected, added " .. tostring(v133.Parent) .. " to the blacklist.";

                    if u1.DebugLogging == true then
                        print(v134);
                    end;
                else
                    u99 = false;
                    Table.insert(u82, v107);
                    local v135 = "Blacklist cast detected, added " .. tostring(v107) .. " to the blacklist.";

                    if u1.DebugLogging == true then
                        print(v135);
                    end;
                end;
            else
                u77 = CastWithBlacklist;
                u82 = u82:GetDescendants();

                if v107.Parent:FindFirstChildOfClass("Humanoid") and v107.Parent:FindFirstChildOfClass("Humanoid").Health > 0 or v107.Parent.Parent:FindFirstChildOfClass("Humanoid") and v107.Parent.Parent:FindFirstChildOfClass("Humanoid").Health > 0 then
                    u99 = true;
                    local v136 = v107.Parent:FindFirstChildOfClass("Humanoid") or v107.Parent.Parent:FindFirstChildOfClass("Humanoid");
                    Table.insert(u82, v136.Parent);
                    local v137 = "Stock cast detected, transformed cast into blacklist cast and added " .. tostring(v136.Parent) .. " to the blacklist.";

                    if u1.DebugLogging == true then
                        print(v137);
                    end;
                else
                    u99 = false;
                    Table.insert(u82, v107);
                    local v138 = "Stock cast detected, transformed cast into blacklist cast and added " .. tostring(v107) .. " to the blacklist.";

                    if u1.DebugLogging == true then
                        print(v138);
                    end;
                end;
            end;
        end;

        if u1.DebugLogging == true then
            print("Recasting for penetration...");
        end;

        Fire(0, p102);
        u96 = v108;

        if u88 ~= nil then
            if u88.penetrationType == "WallPenetraion" then
                local v139 = "DISTANCE: " .. Magnitude3 .. " studs";

                if u1.DebugLogging == true then
                    print(v139);
                end;

                local v140 = "CURRENT PENETRATION DEPTH: " .. u90 .. " studs";

                if u1.DebugLogging == true then
                    print(v140);
                end;
            elseif u99 then
                u91 = v107 and u91 - 1 or 0;
                local v141 = "penetrationCount is reduced to... " .. u91 .. " for hitting humanoid.";

                if u1.DebugLogging == true then
                    print(v141);
                end;
            elseif u1.DebugLogging == true then
                print("penetrationCount is not reduced for not hitting humanoid (or the humanoid died).");
            end;
        end;
    end;

    if RunService:IsClient() then
        spawn(function() -- Line: 553
            -- upvalues: u97 (ref), u100 (ref), Fire (copy)
            u97 = u100:Connect(Fire);
        end);
    else
        coroutine.resume(coroutine.create(function() -- Line: 557
            -- upvalues: u97 (ref), u100 (ref), Fire (copy)
            u97 = u100:Connect(Fire);
        end));
    end;
end;

local function BaseFireMethod(u142, u143, u144, u145, u146, u147, u148, u149, u150, u151, u152, u153, p154, p155, u156) -- Line: 563
    -- upvalues: Cast (copy), CastWithWhitelist (copy), CastWithBlacklist (copy), CastWithBlacklistAndNoHumPenetration (copy), SimulateCast (copy)
    local v157 = typeof(u144) == "Vector3";
    local v158 = typeof(u144);
    assert(v157, ("Invalid type for parameter \'%s\' (Expected %s, got %s)"):format("origin", "Vector3", v158));
    local v159 = typeof(u145) == "Vector3";
    local v160 = typeof(u145);
    assert(v159, ("Invalid type for parameter \'%s\' (Expected %s, got %s)"):format("directionWithMagnitude", "Vector3", v160));
    local v161 = typeof(u146) == "Vector3" and true or typeof(u146) == "number";
    local v162 = typeof(u146);
    assert(v161, ("Invalid type for parameter \'%s\' (Expected %s, got %s)"):format("velocity", "Variant<Vector3, number>", v162));

    if u147 ~= nil then
        local v163 = typeof(u147) == "Instance";
        local v164 = typeof(u147);
        assert(v163, ("Invalid type for parameter \'%s\' (Expected %s, got %s)"):format("cosmeticBulletObject", "Instance", v164));
    end;

    if u148 ~= nil then
        local v165 = typeof(u148) == "Instance";
        local v166 = typeof(u148);
        assert(v165, ("Invalid type for parameter \'%s\' (Expected %s, got %s)"):format("ignoreDescendantsInstance", "Instance", v166));
    end;

    if u149 ~= nil then
        local v167 = typeof(u149) == "boolean";
        local v168 = typeof(u149);
        assert(v167, ("Invalid type for parameter \'%s\' (Expected %s, got %s)"):format("ignoreWater", "boolean", v168));
    end;

    if u150 ~= nil then
        local v169 = typeof(u150) == "Vector3";
        local v170 = typeof(u150);
        assert(v169, ("Invalid type for parameter \'%s\' (Expected %s, got %s)"):format("bulletAcceleration", "Vector3", v170));
    end;

    if p154 ~= nil then
        local v171 = typeof(p154) == "table";
        local v172 = typeof(p154);
        assert(v171, ("Invalid type for parameter \'%s\' (Expected %s, got %s)"):format("list", "table", v172));
    end;

    if u156 ~= nil then
        local v173 = typeof(u156) == "table";
        local v174 = typeof(u156);
        assert(v173, ("Invalid type for parameter \'%s\' (Expected %s, got %s)"):format("penetrationData", "table", v174));
    end;

    local u175 = Cast;

    if p154 ~= nil then
        u148 = p154;

        if p155 then
            u175 = CastWithWhitelist;
        else
            u175 = u156 and u156.penetrationType ~= "WallPenetraion" and CastWithBlacklist or (CastWithBlacklistAndNoHumPenetration or CastWithBlacklistAndNoHumPenetration);
        end;
    end;

    local _, _ = pcall(function() -- Line: 589
        -- upvalues: SimulateCast (ref), u143 (copy), u144 (copy), u145 (copy), u146 (copy), u175 (ref), u142 (copy), u147 (copy), u148 (ref), u149 (copy), u150 (copy), u151 (copy), u152 (copy), u153 (copy), u156 (copy)
        SimulateCast(u143, u144, u145, u146, u175, u142.LengthChanged, u142.RayHit, u142.RayExited, u147, u148, u149, u150, u151, u152, u153, u156, u142.CanPierce);
    end);
end;

function u1.new() -- Line: 599
    -- upvalues: Signal (copy), u1 (copy)
    local v176 = {
        LengthChanged = Signal:CreateNewSignal(),
        RayHit = Signal:CreateNewSignal(),
        RayExited = Signal:CreateNewSignal()
    };

    return setmetatable(v176, u1);
end;

function u1.Fire(p177, p178, p179, p180, p181, p182, p183, p184, p185, p186, p187, p188, p189) -- Line: 608
    -- upvalues: u1 (copy), BaseFireMethod (copy)
    local v190 = getmetatable(p177) == u1;
    assert(v190, ("Cannot statically invoke method \'%s\' - It is an instance method. Call it on an instance of this class created via %s"):format("Fire", "FastCast.new()"));
    BaseFireMethod(p177, p178, p179, p180, p181, p182, p183, p184, p185, p186, p187, p188, nil, nil, p189);
end;

function u1.FireWithWhitelist(p191, p192, p193, p194, p195, p196, p197, p198, p199, p200, p201, p202, p203) -- Line: 614
    -- upvalues: u1 (copy), BaseFireMethod (copy)
    local v204 = getmetatable(p191) == u1;
    assert(v204, ("Cannot statically invoke method \'%s\' - It is an instance method. Call it on an instance of this class created via %s"):format("FireWithWhitelist", "FastCast.new()"));
    BaseFireMethod(p191, p192, p193, p194, p195, p197, nil, p198, p199, p200, p201, p202, p196, true, p203);
end;

function u1.FireWithBlacklist(p205, p206, p207, p208, p209, p210, p211, p212, p213, p214, p215, p216, p217) -- Line: 620
    -- upvalues: u1 (copy), BaseFireMethod (copy)
    local v218 = getmetatable(p205) == u1;
    assert(v218, ("Cannot statically invoke method \'%s\' - It is an instance method. Call it on an instance of this class created via %s"):format("FireWithBlacklist", "FastCast.new()"));
    BaseFireMethod(p205, p206, p207, p208, p209, p211, nil, p212, p213, p214, p215, p216, p210, false, p217);
end;

return u1;
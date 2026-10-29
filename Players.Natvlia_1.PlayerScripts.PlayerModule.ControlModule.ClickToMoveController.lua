-- ============================================================
-- SCRIPT: ClickToMoveController
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerScripts.PlayerModule.ControlModule.ClickToMoveController
-- ============================================================

-- Decompiled with Potassium's decompiler.

local success, result = pcall(function() -- Line: 10
    return UserSettings():IsUserFeatureEnabled("UserExcludeNonCollidableForPathfinding");
end);
local u1 = success and result;
local success2, result2 = pcall(function() -- Line: 14
    return UserSettings():IsUserFeatureEnabled("UserClickToMoveSupportAgentCanClimb2");
end);
local u2 = success2 and result2;
local UserInputService = game:GetService("UserInputService");
local PathfindingService = game:GetService("PathfindingService");
local Players = game:GetService("Players");
game:GetService("Debris");
local StarterGui = game:GetService("StarterGui");
local Workspace = game:GetService("Workspace");
local CollectionService = game:GetService("CollectionService");
local GuiService = game:GetService("GuiService");
local CommonUtils = script.Parent.Parent:WaitForChild("CommonUtils");
local FlagUtil = require(CommonUtils:WaitForChild("FlagUtil"));
local UserFlag = FlagUtil.getUserFlag("UserRaycastUpdateAPI");
local UserFlag2 = FlagUtil.getUserFlag("UserPreferredInputPlayerScripts2");
local u3 = true;
local u4 = true;
local u5 = false;
local u6 = 1;
local u7 = 8;
local u8 = {
    [Enum.KeyCode.W] = true,
    [Enum.KeyCode.A] = true,
    [Enum.KeyCode.S] = true,
    [Enum.KeyCode.D] = true,
    [Enum.KeyCode.Up] = true,
    [Enum.KeyCode.Down] = true
};
local LocalPlayer = Players.LocalPlayer;
local ClickToMoveDisplay = require(script.Parent:WaitForChild("ClickToMoveDisplay"));
local RaycastParams_new_ret = RaycastParams.new();
RaycastParams_new_ret.FilterType = Enum.RaycastFilterType.Exclude;
local u9 = {};

if not UserFlag then
    local function FindCharacterAncestor(p10) -- Line: 66
        -- upvalues: FindCharacterAncestor (copy)
        if p10 then
            local v11 = p10:FindFirstChildOfClass("Humanoid");

            if v11 then
                return p10, v11;
            end;

            return FindCharacterAncestor(p10.Parent);
        end;
    end;

    u9.FindCharacterAncestor = FindCharacterAncestor;

    local function Raycast(p12: any, p13: boolean, p14: table) -- Line: 78
        -- upvalues: Workspace (copy), FindCharacterAncestor (copy), Raycast (copy)
        local v15 = p14 or {};
        local v16, v17, v18, v19 = Workspace:FindPartOnRayWithIgnoreList(p12, v15);

        if not v16 then
            return nil, nil;
        end;

        if p13 and v16.CanCollide == false then
            local v20;

            if v16 then
                v20 = v16:FindFirstChildOfClass("Humanoid");

                if not v20 then
                    local v21;
                    v21, v20 = FindCharacterAncestor(v16.Parent);
                end;
            else
                v20 = nil;
            end;

            if v20 == nil then
                table.insert(v15, v16);

                return Raycast(p12, p13, v15);
            end;
        end;

        return v16, v17, v18, v19;
    end;

    u9.Raycast = Raycast;
end;

local u22 = {};

local function findPlayerHumanoid(p23: userdata) -- Line: 100
    -- upvalues: u22 (copy)
    local v24;

    if p23 then
        v24 = p23.Character;
    else
        v24 = p23;
    end;

    if v24 then
        local v25 = u22[p23];

        if v25 and v25.Parent == v24 then
            return v25;
        end;

        u22[p23] = nil;
        local v26 = v24:FindFirstChildOfClass("Humanoid");

        if v26 then
            u22[p23] = v26;
        end;

        return v26;
    end;
end;

local u27 = nil;
local u28 = nil;
local u29 = nil;
local u30 = nil;

local function GetCharacter() -- Line: 124
    -- upvalues: LocalPlayer (copy)
    return LocalPlayer and LocalPlayer.Character;
end;

local function UpdateIgnoreTag(p31) -- Line: 128
    -- upvalues: u28 (ref), u29 (ref), u30 (ref), u27 (ref), LocalPlayer (copy), CollectionService (copy)
    if p31 == u28 then
        return;
    end;

    if u29 then
        u29:Disconnect();
        u29 = nil;
    end;

    if u30 then
        u30:Disconnect();
        u30 = nil;
    end;

    u28 = p31;
    local v32 = {};
    v32[1] = LocalPlayer and LocalPlayer.Character;
    u27 = v32;

    if u28 ~= nil then
        local Tagged = CollectionService:GetTagged(u28);

        for _, v in ipairs(Tagged) do
            table.insert(u27, v);
        end;

        u29 = CollectionService:GetInstanceAddedSignal(u28):Connect(function(p33) -- Line: 148
            -- upvalues: u27 (ref)
            table.insert(u27, p33);
        end);
        u30 = CollectionService:GetInstanceRemovedSignal(u28):Connect(function(p34) -- Line: 152
            -- upvalues: u27 (ref)
            for i = 1, #u27 do
                if u27[i] == p34 then
                    u27[i] = u27[#u27];
                    table.remove(u27);

                    return;
                end;

                local _ = i;
            end;
        end);
    end;
end;

local function getIgnoreList() -- Line: 164
    -- upvalues: u27 (ref), LocalPlayer (copy)
    if u27 then
        return u27;
    end;

    u27 = {};
    assert(u27, "");
    table.insert(u27, LocalPlayer and LocalPlayer.Character);

    return u27;
end;

local function minV(p35: vector, p36: vector) -- Line: 174
    local math_min_ret = math.min(p35.X, p36.X);
    local math_min_ret2 = math.min(p35.Y, p36.Y);
    local math_min_ret3 = math.min(p35.Z, p36.Z);

    return Vector3.new(math_min_ret, math_min_ret2, math_min_ret3);
end;

local function maxV(p37, p38) -- Line: 177
    local math_max_ret = math.max(p37.X, p38.X);
    local math_max_ret2 = math.max(p37.Y, p38.Y);
    local math_max_ret3 = math.max(p37.Z, p38.Z);

    return Vector3.new(math_max_ret, math_max_ret2, math_max_ret3);
end;

local function getCollidableExtentsSize(p39: userdata?) -- Line: 180
    if p39 ~= nil and p39.PrimaryPart ~= nil then
        assert(p39, "");
        assert(p39.PrimaryPart, "");
        local v40 = p39.PrimaryPart.CFrame:Inverse();
        local v41 = Vector3.new(inf, inf, inf);
        local v42 = Vector3.new(-inf, -inf, -inf);

        for _, descendant in pairs(p39:GetDescendants()) do
            if descendant:IsA("BasePart") and descendant.CanCollide then
                local v43 = v40 * descendant.CFrame;
                local Vector3_new_ret = Vector3.new(descendant.Size.X / 2, descendant.Size.Y / 2, descendant.Size.Z / 2);
                local v44 = {
                    Vector3.new(Vector3_new_ret.X, Vector3_new_ret.Y, Vector3_new_ret.Z),
                    Vector3.new(Vector3_new_ret.X, Vector3_new_ret.Y, -Vector3_new_ret.Z),
                    Vector3.new(Vector3_new_ret.X, -Vector3_new_ret.Y, Vector3_new_ret.Z),
                    Vector3.new(Vector3_new_ret.X, -Vector3_new_ret.Y, -Vector3_new_ret.Z),
                    Vector3.new(-Vector3_new_ret.X, Vector3_new_ret.Y, Vector3_new_ret.Z),
                    Vector3.new(-Vector3_new_ret.X, Vector3_new_ret.Y, -Vector3_new_ret.Z),
                    Vector3.new(-Vector3_new_ret.X, -Vector3_new_ret.Y, Vector3_new_ret.Z),
                    (Vector3.new(-Vector3_new_ret.X, -Vector3_new_ret.Y, -Vector3_new_ret.Z))
                };

                for _, v in ipairs(v44) do
                    local v45 = v43 * v;
                    local math_min_ret = math.min(v41.X, v45.X);
                    local math_min_ret2 = math.min(v41.Y, v45.Y);
                    local math_min_ret3 = math.min(v41.Z, v45.Z);
                    v41 = Vector3.new(math_min_ret, math_min_ret2, math_min_ret3);
                    local math_max_ret = math.max(v42.X, v45.X);
                    local math_max_ret2 = math.max(v42.Y, v45.Y);
                    local math_max_ret3 = math.max(v42.Z, v45.Z);
                    v42 = Vector3.new(math_max_ret, math_max_ret2, math_max_ret3);
                end;
            end;
        end;

        local v46 = v42 - v41;

        if v46.X < 0 or (v46.Y < 0 or v46.Z < 0) then
            return nil;
        end;

        return v46;
    end;
end;

local function Pather(p47: any, p48: any, p49: boolean?) -- Line: 215
    -- upvalues: u5 (ref), LocalPlayer (copy), u22 (copy), u6 (ref), u1 (copy), getCollidableExtentsSize (copy), u2 (copy), PathfindingService (copy), u3 (ref), ClickToMoveDisplay (copy), u7 (ref), UserFlag (copy), RaycastParams_new_ret (copy), u27 (ref), Workspace (copy)
    local u50 = {};
    local v51;

    if p49 == nil then
        v51 = u5;
        p49 = true;
    else
        v51 = p49;
    end;

    u50.Cancelled = false;
    u50.Started = false;
    u50.Finished = Instance.new("BindableEvent");
    u50.PathFailed = Instance.new("BindableEvent");
    u50.PathComputing = false;
    u50.PathComputed = false;
    u50.OriginalTargetPoint = p47;
    u50.TargetPoint = p47;
    u50.TargetSurfaceNormal = p48;
    u50.DiedConn = nil;
    u50.SeatedConn = nil;
    u50.BlockedConn = nil;
    u50.TeleportedConn = nil;
    u50.CurrentPoint = 0;
    u50.HumanoidOffsetFromPath = Vector3.new(0, 0, 0);
    u50.CurrentWaypointPosition = nil;
    u50.CurrentWaypointPlaneNormal = Vector3.new(0, 0, 0);
    u50.CurrentWaypointPlaneDistance = 0;
    u50.CurrentWaypointNeedsJump = false;
    u50.CurrentHumanoidPosition = Vector3.new(0, 0, 0);
    u50.CurrentHumanoidVelocity = 0;
    u50.NextActionMoveDirection = Vector3.new(0, 0, 0);
    u50.NextActionJump = false;
    u50.Timeout = 0;
    local v52 = LocalPlayer;
    local v53;

    if v52 then
        v53 = v52.Character;
    else
        v53 = v52;
    end;

    local v54;

    if v53 then
        v54 = u22[v52];

        if not v54 or v54.Parent ~= v53 then
            u22[v52] = nil;
            v54 = v53:FindFirstChildOfClass("Humanoid");

            if v54 then
                u22[v52] = v54;
            end;
        end;
    else
        v54 = nil;
    end;

    u50.Humanoid = v54;
    u50.OriginPoint = nil;
    u50.AgentCanFollowPath = false;
    u50.DirectPath = false;
    u50.DirectPathRiseFirst = false;
    u50.stopTraverseFunc = nil;
    u50.setPointFunc = nil;
    u50.pointList = nil;
    local v55 = u50.Humanoid and u50.Humanoid.RootPart;

    if v55 then
        u50.OriginPoint = v55.CFrame.Position;
        local v56 = 2;
        local v57 = 5;
        local v58 = true;
        local SeatPart = u50.Humanoid.SeatPart;

        if SeatPart and SeatPart:IsA("VehicleSeat") then
            local v59 = SeatPart:FindFirstAncestorOfClass("Model");

            if v59 then
                local PrimaryPart = v59.PrimaryPart;
                v59.PrimaryPart = SeatPart;

                if p49 then
                    local ExtentsSize = v59:GetExtentsSize();
                    v56 = u6 * 0.5 * math.sqrt(ExtentsSize.X * ExtentsSize.X + ExtentsSize.Z * ExtentsSize.Z);
                    v57 = u6 * ExtentsSize.Y;
                    u50.AgentCanFollowPath = true;
                    u50.DirectPath = p49;
                    v58 = false;
                end;

                v59.PrimaryPart = PrimaryPart;
            end;
        else
            local v60 = nil;

            if u1 then
                local v61 = LocalPlayer and LocalPlayer.Character;

                if v61 ~= nil then
                    v60 = getCollidableExtentsSize(v61);
                end;
            end;

            if v60 == nil then
                v60 = (LocalPlayer and LocalPlayer.Character):GetExtentsSize();
            end;

            assert(v60, "");
            v56 = u6 * 0.5 * math.sqrt(v60.X * v60.X + v60.Z * v60.Z);
            v57 = u6 * v60.Y;
            v58 = u50.Humanoid.JumpPower > 0;
            u50.AgentCanFollowPath = true;
            u50.DirectPath = v51;
            u50.DirectPathRiseFirst = u50.Humanoid.Sit;
        end;

        if u2 then
            u50.pathResult = PathfindingService:CreatePath({
                AgentCanClimb = true,
                AgentRadius = v56,
                AgentHeight = v57,
                AgentCanJump = v58
            });
        else
            u50.pathResult = PathfindingService:CreatePath({
                AgentRadius = v56,
                AgentHeight = v57,
                AgentCanJump = v58
            });
        end;
    end;

    function u50.Cleanup(p62) -- Line: 333
        -- upvalues: u50 (copy)
        if u50.stopTraverseFunc then
            u50.stopTraverseFunc();
            u50.stopTraverseFunc = nil;
        end;

        if u50.BlockedConn then
            u50.BlockedConn:Disconnect();
            u50.BlockedConn = nil;
        end;

        if u50.DiedConn then
            u50.DiedConn:Disconnect();
            u50.DiedConn = nil;
        end;

        if u50.SeatedConn then
            u50.SeatedConn:Disconnect();
            u50.SeatedConn = nil;
        end;

        if u50.TeleportedConn then
            u50.TeleportedConn:Disconnect();
            u50.TeleportedConn = nil;
        end;

        u50.Started = false;
    end;

    function u50.Cancel(p63) -- Line: 362
        -- upvalues: u50 (copy)
        u50.Cancelled = true;
        u50:Cleanup();
    end;

    function u50.IsActive(p64) -- Line: 367
        -- upvalues: u50 (copy)
        return u50.AgentCanFollowPath and u50.Started and not u50.Cancelled;
    end;

    function u50.OnPathInterrupted(p65) -- Line: 371
        -- upvalues: u50 (copy)
        u50.Cancelled = true;
        u50:OnPointReached(false);
    end;

    function u50.ComputePath(p66) -- Line: 377
        -- upvalues: u50 (copy)
        if u50.OriginPoint then
            if u50.PathComputed or u50.PathComputing then
                return;
            end;

            u50.PathComputing = true;

            if u50.AgentCanFollowPath then
                if u50.DirectPath then
                    u50.pointList = { PathWaypoint.new(u50.OriginPoint, Enum.PathWaypointAction.Walk), PathWaypoint.new(u50.TargetPoint, u50.DirectPathRiseFirst and Enum.PathWaypointAction.Jump or Enum.PathWaypointAction.Walk) };
                    u50.PathComputed = true;
                else
                    u50.pathResult:ComputeAsync(u50.OriginPoint, u50.TargetPoint);
                    u50.pointList = u50.pathResult:GetWaypoints();
                    u50.BlockedConn = u50.pathResult.Blocked:Connect(function(p67) -- Line: 391
                        -- upvalues: u50 (ref)
                        u50:OnPathBlocked(p67);
                    end);
                    u50.PathComputed = u50.pathResult.Status == Enum.PathStatus.Success;
                end;
            end;

            u50.PathComputing = false;
        end;
    end;

    function u50.IsValidPath(p68) -- Line: 399
        -- upvalues: u50 (copy)
        u50:ComputePath();

        return u50.PathComputed and u50.AgentCanFollowPath;
    end;

    u50.Recomputing = false;

    function u50.OnPathBlocked(p69, p70) -- Line: 405
        -- upvalues: u50 (copy), u3 (ref), ClickToMoveDisplay (ref)
        if u50.CurrentPoint > p70 or u50.Recomputing then
            return;
        end;

        u50.Recomputing = true;

        if u50.stopTraverseFunc then
            u50.stopTraverseFunc();
            u50.stopTraverseFunc = nil;
        end;

        u50.OriginPoint = u50.Humanoid.RootPart.CFrame.p;
        u50.pathResult:ComputeAsync(u50.OriginPoint, u50.TargetPoint);
        u50.pointList = u50.pathResult:GetWaypoints();

        if #u50.pointList > 0 then
            u50.HumanoidOffsetFromPath = u50.pointList[1].Position - u50.OriginPoint;
        end;

        u50.PathComputed = u50.pathResult.Status == Enum.PathStatus.Success;

        if u3 then
            local v71, v72 = ClickToMoveDisplay.CreatePathDisplay(u50.pointList);
            u50.stopTraverseFunc = v71;
            u50.setPointFunc = v72;
        end;

        if u50.PathComputed then
            u50.CurrentPoint = 1;
            u50:OnPointReached(true);
        else
            u50.PathFailed:Fire();
            u50:Cleanup();
        end;

        u50.Recomputing = false;
    end;

    function u50.OnRenderStepped(p73: table, p74: number) -- Line: 441
        -- upvalues: u50 (copy), u7 (ref)
        if u50.Started and not u50.Cancelled then
            u50.Timeout = u50.Timeout + p74;

            if u7 < u50.Timeout then
                u50:OnPointReached(false);

                return;
            end;

            u50.CurrentHumanoidPosition = u50.Humanoid.RootPart.Position + u50.HumanoidOffsetFromPath;
            u50.CurrentHumanoidVelocity = u50.Humanoid.RootPart.Velocity;

            while u50.Started and u50:IsCurrentWaypointReached() do
                u50:OnPointReached(true);
            end;

            if u50.Started then
                u50.NextActionMoveDirection = u50.CurrentWaypointPosition - u50.CurrentHumanoidPosition;

                if u50.NextActionMoveDirection.Magnitude > 1e-6 then
                    u50.NextActionMoveDirection = u50.NextActionMoveDirection.Unit;
                else
                    u50.NextActionMoveDirection = Vector3.new(0, 0, 0);
                end;

                if u50.CurrentWaypointNeedsJump then
                    u50.NextActionJump = true;
                    u50.CurrentWaypointNeedsJump = false;

                    return;
                end;

                u50.NextActionJump = false;
            end;
        end;
    end;

    function u50.IsCurrentWaypointReached(p75) -- Line: 479
        -- upvalues: u50 (copy)
        local v76;

        if u50.CurrentWaypointPlaneNormal == Vector3.new(0, 0, 0) then
            v76 = true;
        else
            local v77 = u50.CurrentWaypointPlaneNormal:Dot(u50.CurrentHumanoidPosition) - u50.CurrentWaypointPlaneDistance;
            local v78 = 0.0625 * -u50.CurrentWaypointPlaneNormal:Dot(u50.CurrentHumanoidVelocity);
            v76 = v77 < math.max(1, v78);
        end;

        if v76 then
            u50.CurrentWaypointPosition = nil;
            u50.CurrentWaypointPlaneNormal = Vector3.new(0, 0, 0);
            u50.CurrentWaypointPlaneDistance = 0;
        end;

        return v76;
    end;

    function u50.OnPointReached(p79, p80) -- Line: 505
        -- upvalues: u50 (copy)
        if not p80 or u50.Cancelled then
            u50.PathFailed:Fire();
            u50:Cleanup();

            return;
        end;

        if u50.setPointFunc then
            u50.setPointFunc(u50.CurrentPoint);
        end;

        local v81 = u50.CurrentPoint + 1;

        if #u50.pointList < v81 then
            if u50.stopTraverseFunc then
                u50.stopTraverseFunc();
            end;

            u50.Finished:Fire();
            u50:Cleanup();

            return;
        end;

        local v82 = u50.pointList[u50.CurrentPoint];
        local v83 = u50.pointList[v81];
        local State = u50.Humanoid:GetState();

        if (State == Enum.HumanoidStateType.FallingDown or State == Enum.HumanoidStateType.Freefall) and true or State == Enum.HumanoidStateType.Jumping then
            local v84 = v83.Action == Enum.PathWaypointAction.Jump;

            if not v84 and u50.CurrentPoint > 1 then
                local v85 = v82.Position - u50.pointList[u50.CurrentPoint - 1].Position;
                local v86 = v83.Position - v82.Position;
                v84 = Vector2.new(v85.x, v85.z).Unit:Dot(Vector2.new(v86.x, v86.z).Unit) < 0.996;
            end;

            if v84 then
                u50.Humanoid.FreeFalling:Wait();
                wait(0.1);
            end;
        end;

        u50:MoveToNextWayPoint(v82, v83, v81);
    end;

    function u50.MoveToNextWayPoint(p87: table, p88: userdata, p89: userdata, p90: number) -- Line: 568
        -- upvalues: u50 (copy), u2 (ref)
        u50.CurrentWaypointPlaneNormal = p88.Position - p89.Position;

        if not u2 or p89.Label ~= "Climb" then
            u50.CurrentWaypointPlaneNormal = Vector3.new(u50.CurrentWaypointPlaneNormal.X, 0, u50.CurrentWaypointPlaneNormal.Z);
        end;

        if u50.CurrentWaypointPlaneNormal.Magnitude > 1e-6 then
            u50.CurrentWaypointPlaneNormal = u50.CurrentWaypointPlaneNormal.Unit;
            u50.CurrentWaypointPlaneDistance = u50.CurrentWaypointPlaneNormal:Dot(p89.Position);
        else
            u50.CurrentWaypointPlaneNormal = Vector3.new(0, 0, 0);
            u50.CurrentWaypointPlaneDistance = 0;
        end;

        u50.CurrentWaypointNeedsJump = p89.Action == Enum.PathWaypointAction.Jump;
        u50.CurrentWaypointPosition = p89.Position;
        u50.CurrentPoint = p90;
        u50.Timeout = 0;
    end;

    function u50.Start(p91, p92) -- Line: 600
        -- upvalues: u50 (copy), ClickToMoveDisplay (ref), u3 (ref)
        if not u50.AgentCanFollowPath then
            u50.PathFailed:Fire();

            return;
        end;

        if u50.Started then
            return;
        end;

        u50.Started = true;
        ClickToMoveDisplay.CancelFailureAnimation();

        if u3 and (p92 == nil or p92) then
            local v93, v94 = ClickToMoveDisplay.CreatePathDisplay(u50.pointList, u50.OriginalTargetPoint);
            u50.stopTraverseFunc = v93;
            u50.setPointFunc = v94;
        end;

        if #u50.pointList <= 0 then
            u50.PathFailed:Fire();

            if u50.stopTraverseFunc then
                u50.stopTraverseFunc();
            end;

            return;
        end;

        u50.HumanoidOffsetFromPath = Vector3.new(0, u50.pointList[1].Position.Y - u50.OriginPoint.Y, 0);
        u50.CurrentHumanoidPosition = u50.Humanoid.RootPart.Position + u50.HumanoidOffsetFromPath;
        u50.CurrentHumanoidVelocity = u50.Humanoid.RootPart.Velocity;
        u50.SeatedConn = u50.Humanoid.Seated:Connect(function(p95, p96) -- Line: 627
            -- upvalues: u50 (ref)
            u50:OnPathInterrupted();
        end);
        u50.DiedConn = u50.Humanoid.Died:Connect(function() -- Line: 628
            -- upvalues: u50 (ref)
            u50:OnPathInterrupted();
        end);
        u50.TeleportedConn = u50.Humanoid.RootPart:GetPropertyChangedSignal("CFrame"):Connect(function() -- Line: 629
            -- upvalues: u50 (ref)
            u50:OnPathInterrupted();
        end);
        u50.CurrentPoint = 1;
        u50:OnPointReached(true);
    end;

    local v97 = u50.TargetPoint + u50.TargetSurfaceNormal * 1.5;

    if UserFlag then
        local v98;

        if u27 then
            v98 = u27;
        else
            u27 = {};
            assert(u27, "");
            table.insert(u27, LocalPlayer and LocalPlayer.Character);
            v98 = u27;
        end;

        RaycastParams_new_ret.FilterDescendantsInstances = v98;
        local v99 = Workspace:Raycast(v97, Vector3.new(-0, -50, -0), RaycastParams_new_ret);

        if v99 then
            u50.TargetPoint = v99.Position;
        end;
    else
        local Ray_new_ret = Ray.new(v97, Vector3.new(0, -50, 0));
        local v100;

        if u27 then
            v100 = u27;
        else
            u27 = {};
            assert(u27, "");
            table.insert(u27, LocalPlayer and LocalPlayer.Character);
            v100 = u27;
        end;

        local v101, v102 = Workspace:FindPartOnRayWithIgnoreList(Ray_new_ret, v100);

        if v101 then
            u50.TargetPoint = v102;
        end;
    end;

    u50:ComputePath();

    return u50;
end;

local function CheckAlive() -- Line: 665
    -- upvalues: LocalPlayer (copy), u22 (copy)
    local v103 = LocalPlayer;
    local v104;

    if v103 then
        v104 = v103.Character;
    else
        v104 = v103;
    end;

    local v105;

    if v104 then
        v105 = u22[v103];

        if not v105 or v105.Parent ~= v104 then
            u22[v103] = nil;
            v105 = v104:FindFirstChildOfClass("Humanoid");

            if v105 then
                u22[v103] = v105;
            end;
        end;
    else
        v105 = nil;
    end;

    local v106;

    if v105 == nil then
        v106 = false;
    else
        v106 = v105.Health > 0;
    end;

    return v106;
end;

local function GetEquippedTool(p107: userdata?) -- Line: 670
    if p107 ~= nil then
        for _, child in pairs(p107:GetChildren()) do
            if child:IsA("Tool") then
                return child;
            end;
        end;
    end;
end;

local u108 = nil;
local u109 = nil;
local u110 = nil;

local function CleanupPath() -- Line: 685
    -- upvalues: u108 (ref), u109 (ref), u110 (ref)
    if u108 then
        u108:Cancel();
        u108 = nil;
    end;

    if u109 then
        u109:Disconnect();
        u109 = nil;
    end;

    if u110 then
        u110:Disconnect();
        u110 = nil;
    end;
end;

local function HandleMoveTo(p111, u112, u113, u114, u115) -- Line: 703
    -- upvalues: u108 (ref), u109 (ref), u110 (ref), GetEquippedTool (copy), u4 (ref), ClickToMoveDisplay (copy)
    if u108 then
        if u108 then
            u108:Cancel();
            u108 = nil;
        end;

        if u109 then
            u109:Disconnect();
            u109 = nil;
        end;

        if u110 then
            u110:Disconnect();
            u110 = nil;
        end;
    end;

    u108 = p111;
    p111:Start(u115);
    u109 = p111.Finished.Event:Connect(function() -- Line: 710
        -- upvalues: u108 (ref), u109 (ref), u110 (ref), u113 (copy), GetEquippedTool (ref), u114 (copy)
        if u108 then
            u108:Cancel();
            u108 = nil;
        end;

        if u109 then
            u109:Disconnect();
            u109 = nil;
        end;

        if u110 then
            u110:Disconnect();
            u110 = nil;
        end;

        local v116 = u113 and GetEquippedTool(u114);

        if v116 then
            v116:Activate();
        end;
    end);
    u110 = p111.PathFailed.Event:Connect(function() -- Line: 719
        -- upvalues: u108 (ref), u109 (ref), u110 (ref), u115 (copy), u4 (ref), ClickToMoveDisplay (ref), u112 (copy)
        if u108 then
            u108:Cancel();
            u108 = nil;
        end;

        if u109 then
            u109:Disconnect();
            u109 = nil;
        end;

        if u110 then
            u110:Disconnect();
            u110 = nil;
        end;

        if u115 == nil or u115 then
            local v117 = u4;

            if v117 then
                local v118 = u108 and u108:IsActive();
                v117 = not v118;
            end;

            if v117 then
                ClickToMoveDisplay.PlayFailureAnimation();
            end;

            ClickToMoveDisplay.DisplayFailureWaypoint(u112);
        end;
    end);
end;

local function ShowPathFailedFeedback(p119) -- Line: 731
    -- upvalues: u108 (ref), u4 (ref), ClickToMoveDisplay (copy)
    if u108 and u108:IsActive() then
        u108:Cancel();
    end;

    if u4 then
        ClickToMoveDisplay.PlayFailureAnimation();
    end;

    ClickToMoveDisplay.DisplayFailureWaypoint(p119);
end;

function OnTap(p120: table, p121: vector?, p122: boolean?)
    -- upvalues: Workspace (copy), LocalPlayer (copy), u22 (copy), UserFlag (copy), u27 (ref), RaycastParams_new_ret (copy), StarterGui (copy), Players (copy), u108 (ref), u109 (ref), u110 (ref), Pather (copy), HandleMoveTo (copy), u4 (ref), ClickToMoveDisplay (copy), u9 (copy), GetEquippedTool (copy)
    local CurrentCamera = Workspace.CurrentCamera;
    local Character = LocalPlayer.Character;
    local v123 = LocalPlayer;
    local v124;

    if v123 then
        v124 = v123.Character;
    else
        v124 = v123;
    end;

    local v125;

    if v124 then
        v125 = u22[v123];

        if not v125 or v125.Parent ~= v124 then
            u22[v123] = nil;
            v125 = v124:FindFirstChildOfClass("Humanoid");

            if v125 then
                u22[v123] = v125;
            end;
        end;
    else
        v125 = nil;
    end;

    local v126;

    if v125 == nil then
        v126 = false;
    else
        v126 = v125.Health > 0;
    end;

    if not v126 then
        return;
    end;

    if #p120 ~= 1 and not p121 then
        local v127 = #p120 >= 2 and (CurrentCamera and GetEquippedTool(Character));

        if v127 then
            v127:Activate();
        end;

        return;
    end;

    if not CurrentCamera then
        return;
    end;

    local v128 = CurrentCamera:ScreenPointToRay(p120[1].X, p120[1].Y);

    if not UserFlag then
        local Ray_new_ret = Ray.new(v128.Origin, v128.Direction * 1000);
        local Raycast = u9.Raycast;
        local v129;

        if u27 then
            v129 = u27;
        else
            u27 = {};
            assert(u27, "");
            table.insert(u27, LocalPlayer and LocalPlayer.Character);
            v129 = u27;
        end;

        local v130, v131, v132 = Raycast(Ray_new_ret, true, v129);
        local v133, v134 = u9.FindCharacterAncestor(v130);

        if p122 and (v134 and (StarterGui:GetCore("AvatarContextMenuEnabled") and Players:GetPlayerFromCharacter(v134.Parent))) then
            if u108 then
                u108:Cancel();
                u108 = nil;
            end;

            if u109 then
                u109:Disconnect();
                u109 = nil;
            end;

            if u110 then
                u110:Disconnect();
                u110 = nil;
            end;

            return;
        end;

        if p121 then
            v133 = nil;
        else
            p121 = v131;
        end;

        if p121 and Character then
            if u108 then
                u108:Cancel();
                u108 = nil;
            end;

            if u109 then
                u109:Disconnect();
                u109 = nil;
            end;

            if u110 then
                u110:Disconnect();
                u110 = nil;
            end;

            local v135 = Pather(p121, v132);

            if v135:IsValidPath() then
                HandleMoveTo(v135, p121, v133, Character);

                return;
            end;

            v135:Cleanup();

            if u108 and u108:IsActive() then
                u108:Cancel();
            end;

            if u4 then
                ClickToMoveDisplay.PlayFailureAnimation();
            end;

            ClickToMoveDisplay.DisplayFailureWaypoint(p121);

            return;
        end;

        return;
    end;

    local v136 = nil;
    local v137 = nil;
    local v138;

    if u27 then
        v138 = u27;
    else
        u27 = {};
        assert(u27, "");
        table.insert(u27, LocalPlayer and LocalPlayer.Character);
        v138 = u27;
    end;

    if not v138 then
        v138 = {};
    end;

    while true do
        local v139, v140;
        local v139, v136, v140, v137;
        local v141 = 0;

        while true do
            if v141 == 0 then
                v141 = -1;
                v140 = true;
                RaycastParams_new_ret.FilterDescendantsInstances = v138;
                v139 = Workspace:Raycast(v128.Origin, v128.Direction * 1000, RaycastParams_new_ret);

                if v139 then
                    local Instance2 = v139.Instance;

                    if not Instance2.CanCollide then
                        local v142;

                        while true do
                            v136 = Instance2:FindFirstChildOfClass("Humanoid");
                            v142 = Instance2.Parent;

                            if v136 or (not v142 or v142 == Workspace) then
                                break;
                            end;

                            Instance2 = v142;
                        end;

                        if v136 then
                            v137 = Instance2;
                        else
                            table.insert(v138, v142);
                            v140 = false;
                            v137 = nil;
                        end;

                        v141 = 1;
                        continue;
                    end;
                end;

                v141 = 1;
                continue;
            elseif v141 == 1 then
                v141 = -1;

                if v140 then
                    if p122 and (v136 and (StarterGui:GetCore("AvatarContextMenuEnabled") and Players:GetPlayerFromCharacter(v136.Parent))) then
                        if u108 then
                            u108:Cancel();
                            u108 = nil;
                        end;

                        if u109 then
                            u109:Disconnect();
                            u109 = nil;
                        end;

                        if u110 then
                            u110:Disconnect();
                            u110 = nil;
                        end;

                        return;
                    end;

                    if not (v139 and Character) then
                        return;
                    end;

                    local Position = v139.Position;

                    if p121 then
                        v137 = nil;
                    else
                        p121 = Position;
                    end;

                    if u108 then
                        u108:Cancel();
                        u108 = nil;
                    end;

                    if u109 then
                        u109:Disconnect();
                        u109 = nil;
                    end;

                    if u110 then
                        u110:Disconnect();
                        u110 = nil;
                    end;

                    local v143 = Pather(p121, v139.Normal);

                    if v143:IsValidPath() then
                        HandleMoveTo(v143, p121, v137, Character);

                        return;
                    end;

                    v143:Cleanup();

                    if u108 and u108:IsActive() then
                        u108:Cancel();
                    end;

                    if u4 then
                        ClickToMoveDisplay.PlayFailureAnimation();
                    end;

                    ClickToMoveDisplay.DisplayFailureWaypoint(p121);

                    return;
                end;

                break;
            else
                break;
            end;
        end;
    end;
end;

local function DisconnectEvent(p144) -- Line: 851
    if p144 then
        p144:Disconnect();
    end;
end;

local Keyboard = require(script.Parent:WaitForChild("Keyboard"));
local u145 = setmetatable({}, Keyboard);
u145.__index = u145;

function u145.new(p146) -- Line: 862
    -- upvalues: Keyboard (copy), u145 (copy)
    local v147 = Keyboard.new(p146);
    local v148 = setmetatable(v147, u145);
    v148.fingerTouches = {};
    v148.numUnsunkTouches = 0;
    v148.mouse2DownTime = tick();
    v148.mouse2DownPos = Vector2.new();
    v148.mouse2UpTime = tick();
    v148.keyboardMoveVector = Vector3.new(0, 0, 0);
    v148.tapConn = nil;
    v148.inputBeganConn = nil;
    v148.inputChangedConn = nil;
    v148.inputEndedConn = nil;
    v148.humanoidDiedConn = nil;
    v148.characterChildAddedConn = nil;
    v148.onCharacterAddedConn = nil;
    v148.characterChildRemovedConn = nil;
    v148.renderSteppedConn = nil;
    v148.menuOpenedConnection = nil;
    v148.preferredInputChangedConnection = nil;
    v148.running = false;
    v148.wasdEnabled = false;

    return v148;
end;

function u145.DisconnectEvents(p149) -- Line: 893
    -- upvalues: UserFlag2 (copy)
    local tapConn = p149.tapConn;

    if tapConn then
        tapConn:Disconnect();
    end;

    local inputBeganConn = p149.inputBeganConn;

    if inputBeganConn then
        inputBeganConn:Disconnect();
    end;

    local inputChangedConn = p149.inputChangedConn;

    if inputChangedConn then
        inputChangedConn:Disconnect();
    end;

    local inputEndedConn = p149.inputEndedConn;

    if inputEndedConn then
        inputEndedConn:Disconnect();
    end;

    local humanoidDiedConn = p149.humanoidDiedConn;

    if humanoidDiedConn then
        humanoidDiedConn:Disconnect();
    end;

    local characterChildAddedConn = p149.characterChildAddedConn;

    if characterChildAddedConn then
        characterChildAddedConn:Disconnect();
    end;

    local onCharacterAddedConn = p149.onCharacterAddedConn;

    if onCharacterAddedConn then
        onCharacterAddedConn:Disconnect();
    end;

    local renderSteppedConn = p149.renderSteppedConn;

    if renderSteppedConn then
        renderSteppedConn:Disconnect();
    end;

    local characterChildRemovedConn = p149.characterChildRemovedConn;

    if characterChildRemovedConn then
        characterChildRemovedConn:Disconnect();
    end;

    local menuOpenedConnection = p149.menuOpenedConnection;

    if menuOpenedConnection then
        menuOpenedConnection:Disconnect();
    end;

    local v150 = UserFlag2 and p149.preferredInputChangedConnection;

    if v150 then
        v150:Disconnect();
    end;
end;

function u145.OnTouchBegan(p151, p152, p153) -- Line: 909
    if p151.fingerTouches[p152] == nil and not p153 then
        p151.numUnsunkTouches = p151.numUnsunkTouches + 1;
    end;

    p151.fingerTouches[p152] = p153;
end;

function u145.OnTouchChanged(p154, p155, p156) -- Line: 916
    if p154.fingerTouches[p155] == nil then
        p154.fingerTouches[p155] = p156;

        if not p156 then
            p154.numUnsunkTouches = p154.numUnsunkTouches + 1;
        end;
    end;
end;

function u145.OnTouchEnded(p157, p158, p159) -- Line: 925
    if p157.fingerTouches[p158] ~= nil and p157.fingerTouches[p158] == false then
        p157.numUnsunkTouches = p157.numUnsunkTouches - 1;
    end;

    p157.fingerTouches[p158] = nil;
end;

function u145.OnPreferredInputChanged(p160) -- Line: 932
    -- upvalues: LocalPlayer (copy), UserInputService (copy)
    local Character = LocalPlayer.Character;

    if Character then
        local v161 = UserInputService.PreferredInput == Enum.PreferredInput.Touch;

        for _, child in pairs(Character:GetChildren()) do
            if child:IsA("Tool") then
                child.ManualActivationOnly = v161;
            end;
        end;
    end;
end;

function u145.OnCharacterAdded(u162, p163) -- Line: 944
    -- upvalues: UserInputService (copy), u8 (copy), u108 (ref), u109 (ref), u110 (ref), ClickToMoveDisplay (copy), GuiService (copy), UserFlag2 (copy)
    u162:DisconnectEvents();
    u162.inputBeganConn = UserInputService.InputBegan:Connect(function(p164, p165) -- Line: 947
        -- upvalues: u162 (copy), u8 (ref), u108 (ref), u109 (ref), u110 (ref), ClickToMoveDisplay (ref)
        if p164.UserInputType == Enum.UserInputType.Touch then
            u162:OnTouchBegan(p164, p165);
        end;

        if u162.wasdEnabled and (p165 == false and (p164.UserInputType == Enum.UserInputType.Keyboard and u8[p164.KeyCode])) then
            if u108 then
                u108:Cancel();
                u108 = nil;
            end;

            if u109 then
                u109:Disconnect();
                u109 = nil;
            end;

            if u110 then
                u110:Disconnect();
                u110 = nil;
            end;

            ClickToMoveDisplay.CancelFailureAnimation();
        end;

        if p164.UserInputType == Enum.UserInputType.MouseButton2 then
            u162.mouse2DownTime = tick();
            u162.mouse2DownPos = p164.Position;
        end;
    end);
    u162.inputChangedConn = UserInputService.InputChanged:Connect(function(p166, p167) -- Line: 964
        -- upvalues: u162 (copy)
        if p166.UserInputType == Enum.UserInputType.Touch then
            u162:OnTouchChanged(p166, p167);
        end;
    end);
    u162.inputEndedConn = UserInputService.InputEnded:Connect(function(p168, p169) -- Line: 970
        -- upvalues: u162 (copy), u108 (ref)
        if p168.UserInputType == Enum.UserInputType.Touch then
            u162:OnTouchEnded(p168, p169);
        end;

        if p168.UserInputType == Enum.UserInputType.MouseButton2 then
            u162.mouse2UpTime = tick();
            local Position = p168.Position;

            if u162.mouse2UpTime - u162.mouse2DownTime < 0.25 and ((Position - u162.mouse2DownPos).magnitude < 5 and (u108 or u162.keyboardMoveVector.Magnitude <= 0)) then
                OnTap({ Position });
            end;
        end;
    end);
    u162.tapConn = UserInputService.TouchTap:Connect(function(p170, p171) -- Line: 987
        if not p171 then
            OnTap(p170, nil, true);
        end;
    end);
    u162.menuOpenedConnection = GuiService.MenuOpened:Connect(function() -- Line: 993
        -- upvalues: u108 (ref), u109 (ref), u110 (ref)
        if u108 then
            u108:Cancel();
            u108 = nil;
        end;

        if u109 then
            u109:Disconnect();
            u109 = nil;
        end;

        if u110 then
            u110:Disconnect();
            u110 = nil;
        end;
    end);

    local function OnCharacterChildAdded(p172) -- Line: 997
        -- upvalues: UserFlag2 (ref), UserInputService (ref), u162 (copy)
        local v173;

        if UserFlag2 then
            v173 = UserInputService.PreferredInput == Enum.PreferredInput.Touch;
        else
            v173 = UserInputService.TouchEnabled;
        end;

        if v173 and p172:IsA("Tool") then
            p172.ManualActivationOnly = true;
        end;

        if p172:IsA("Humanoid") then
            local humanoidDiedConn = u162.humanoidDiedConn;

            if humanoidDiedConn then
                humanoidDiedConn:Disconnect();
            end;

            u162.humanoidDiedConn = p172.Died:Connect(function() -- Line: 1011
            end);
        end;
    end;

    u162.characterChildAddedConn = p163.ChildAdded:Connect(function(p174) -- Line: 1019
        -- upvalues: OnCharacterChildAdded (copy)
        OnCharacterChildAdded(p174);
    end);
    u162.characterChildRemovedConn = p163.ChildRemoved:Connect(function(p175) -- Line: 1022
        -- upvalues: UserFlag2 (ref), UserInputService (ref)
        local v176;

        if UserFlag2 then
            v176 = UserInputService.PreferredInput == Enum.PreferredInput.Touch;
        else
            v176 = UserInputService.TouchEnabled;
        end;

        if v176 and p175:IsA("Tool") then
            p175.ManualActivationOnly = false;
        end;
    end);

    for _, child in pairs(p163:GetChildren()) do
        OnCharacterChildAdded(child);
    end;

    if UserFlag2 then
        u162.preferredInputChangedConnection = UserInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function() -- Line: 1040
            -- upvalues: u162 (copy)
            u162:OnPreferredInputChanged();
        end);
    end;
end;

function u145.Start(p177) -- Line: 1046
    p177:Enable(true);
end;

function u145.Stop(p178) -- Line: 1050
    p178:Enable(false);
end;

function u145.CleanupPath(p179) -- Line: 1054
    -- upvalues: u108 (ref), u109 (ref), u110 (ref)
    if u108 then
        u108:Cancel();
        u108 = nil;
    end;

    if u109 then
        u109:Disconnect();
        u109 = nil;
    end;

    if u110 then
        u110:Disconnect();
        u110 = nil;
    end;
end;

function u145.Enable(u180: table, p181: boolean, p182: boolean, p183: any) -- Line: 1058
    -- upvalues: LocalPlayer (copy), u108 (ref), u109 (ref), u110 (ref), UserFlag2 (copy), UserInputService (copy), Keyboard (copy)
    if p181 then
        if not u180.running then
            if LocalPlayer.Character then
                u180:OnCharacterAdded(LocalPlayer.Character);
            end;

            u180.onCharacterAddedConn = LocalPlayer.CharacterAdded:Connect(function(p184) -- Line: 1064
                -- upvalues: u180 (copy)
                u180:OnCharacterAdded(p184);
            end);
            u180.running = true;
        end;

        u180.touchJumpController = p183;

        if u180.touchJumpController then
            u180.touchJumpController:Enable(u180.jumpEnabled);
        end;
    else
        if u180.running then
            u180:DisconnectEvents();

            if u108 then
                u108:Cancel();
                u108 = nil;
            end;

            if u109 then
                u109:Disconnect();
                u109 = nil;
            end;

            if u110 then
                u110:Disconnect();
                u110 = nil;
            end;

            local v185;

            if UserFlag2 then
                v185 = UserInputService.PreferredInput == Enum.PreferredInput.Touch;
            else
                v185 = UserInputService.TouchEnabled;
            end;

            if v185 then
                local Character = LocalPlayer.Character;

                if Character then
                    for _, child in pairs(Character:GetChildren()) do
                        if child:IsA("Tool") then
                            child.ManualActivationOnly = false;
                        end;
                    end;
                end;
            end;

            u180.running = false;
        end;

        if u180.touchJumpController and not u180.jumpEnabled then
            u180.touchJumpController:Enable(true);
        end;

        u180.touchJumpController = nil;
    end;

    Keyboard.Enable(u180, p181);
    u180.wasdEnabled = p181 and p182 and p182 or false;
    u180.enabled = p181;
end;

function u145.OnRenderStepped(p186, p187) -- Line: 1109
    -- upvalues: u108 (ref)
    p186.isJumping = false;

    if u108 then
        u108:OnRenderStepped(p187);

        if u108 then
            p186.moveVector = u108.NextActionMoveDirection;
            p186.moveVectorIsCameraRelative = false;

            if u108.NextActionJump then
                p186.isJumping = true;
            end;
        else
            p186.moveVector = p186.keyboardMoveVector;
            p186.moveVectorIsCameraRelative = true;
        end;
    else
        p186.moveVector = p186.keyboardMoveVector;
        p186.moveVectorIsCameraRelative = true;
    end;

    if p186.jumpRequested then
        p186.isJumping = true;
    end;
end;

function u145.UpdateMovement(p188, p189) -- Line: 1144
    if p189 == Enum.UserInputState.Cancel then
        p188.keyboardMoveVector = Vector3.new(0, 0, 0);

        return;
    end;

    if p188.wasdEnabled then
        p188.keyboardMoveVector = Vector3.new(p188.leftValue + p188.rightValue, 0, p188.forwardValue + p188.backwardValue);
    end;
end;

function u145.UpdateJump(p190) -- Line: 1153
end;

function u145.SetShowPath(p191, p192) -- Line: 1158
    -- upvalues: u3 (ref)
    u3 = p192;
end;

function u145.GetShowPath(p193) -- Line: 1162
    -- upvalues: u3 (ref)
    return u3;
end;

function u145.SetWaypointTexture(p194, p195) -- Line: 1166
    -- upvalues: ClickToMoveDisplay (copy)
    ClickToMoveDisplay.SetWaypointTexture(p195);
end;

function u145.GetWaypointTexture(p196) -- Line: 1170
    -- upvalues: ClickToMoveDisplay (copy)
    return ClickToMoveDisplay.GetWaypointTexture();
end;

function u145.SetWaypointRadius(p197, p198) -- Line: 1174
    -- upvalues: ClickToMoveDisplay (copy)
    ClickToMoveDisplay.SetWaypointRadius(p198);
end;

function u145.GetWaypointRadius(p199) -- Line: 1178
    -- upvalues: ClickToMoveDisplay (copy)
    return ClickToMoveDisplay.GetWaypointRadius();
end;

function u145.SetEndWaypointTexture(p200, p201) -- Line: 1182
    -- upvalues: ClickToMoveDisplay (copy)
    ClickToMoveDisplay.SetEndWaypointTexture(p201);
end;

function u145.GetEndWaypointTexture(p202) -- Line: 1186
    -- upvalues: ClickToMoveDisplay (copy)
    return ClickToMoveDisplay.GetEndWaypointTexture();
end;

function u145.SetWaypointsAlwaysOnTop(p203, p204) -- Line: 1190
    -- upvalues: ClickToMoveDisplay (copy)
    ClickToMoveDisplay.SetWaypointsAlwaysOnTop(p204);
end;

function u145.GetWaypointsAlwaysOnTop(p205) -- Line: 1194
    -- upvalues: ClickToMoveDisplay (copy)
    return ClickToMoveDisplay.GetWaypointsAlwaysOnTop();
end;

function u145.SetFailureAnimationEnabled(p206, p207) -- Line: 1198
    -- upvalues: u4 (ref)
    u4 = p207;
end;

function u145.GetFailureAnimationEnabled(p208) -- Line: 1202
    -- upvalues: u4 (ref)
    return u4;
end;

function u145.SetIgnoredPartsTag(p209, p210) -- Line: 1206
    -- upvalues: UpdateIgnoreTag (copy)
    UpdateIgnoreTag(p210);
end;

function u145.GetIgnoredPartsTag(p211) -- Line: 1210
    -- upvalues: u28 (ref)
    return u28;
end;

function u145.SetUseDirectPath(p212, p213) -- Line: 1214
    -- upvalues: u5 (ref)
    u5 = p213;
end;

function u145.GetUseDirectPath(p214) -- Line: 1218
    -- upvalues: u5 (ref)
    return u5;
end;

function u145.SetAgentSizeIncreaseFactor(p215: table, p216: number) -- Line: 1222
    -- upvalues: u6 (ref)
    u6 = p216 / 100 + 1;
end;

function u145.GetAgentSizeIncreaseFactor(p217) -- Line: 1226
    -- upvalues: u6 (ref)
    return (u6 - 1) * 100;
end;

function u145.SetUnreachableWaypointTimeout(p218, p219) -- Line: 1230
    -- upvalues: u7 (ref)
    u7 = p219;
end;

function u145.GetUnreachableWaypointTimeout(p220) -- Line: 1234
    -- upvalues: u7 (ref)
    return u7;
end;

function u145.SetUserJumpEnabled(p221, p222) -- Line: 1238
    p221.jumpEnabled = p222;

    if p221.touchJumpController then
        p221.touchJumpController:Enable(p222);
    end;
end;

function u145.GetUserJumpEnabled(p223) -- Line: 1245
    return p223.jumpEnabled;
end;

function u145.MoveTo(p224, p225, p226, p227) -- Line: 1249
    -- upvalues: LocalPlayer (copy), Pather (copy), HandleMoveTo (copy)
    local Character = LocalPlayer.Character;

    if Character == nil then
        return false;
    end;

    local v228 = Pather(p225, Vector3.new(0, 1, 0), p227);

    if not (v228 and v228:IsValidPath()) then
        return false;
    end;

    HandleMoveTo(v228, p225, nil, Character, p226);

    return true;
end;

return u145;
-- ============================================================
-- SCRIPT: Interact
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interact
-- ============================================================

-- Decompiled with Potassium's decompiler.

game:GetService("UserInputService");
local RunService = game:GetService("RunService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
game:GetService("TweenService");
local CollectionService = game:GetService("CollectionService");
local NewModules = ReplicatedStorage:WaitForChild("NewModules");
require(NewModules.Shared.Extensions.CheckWater2);
local GetDoor = require(script:WaitForChild("GetDoor"));
local GetMP = require(script:WaitForChild("GetMP"));
local GetDrops = require(script:WaitForChild("GetDrops"));
script:ClearAllChildren();
local Events = ReplicatedStorage:WaitForChild("Events");
local Events2 = ReplicatedStorage:WaitForChild("Events2");
local LocalPlayer = game.Players.LocalPlayer;
local _ = workspace.CurrentCamera;
local u1 = nil;
local u2 = nil;
local u3 = nil;

repeat
    task.wait(1);
until _G.WaitForChar and _G.GVF;

local u4 = {};
local ProximityPrompt = ReplicatedStorage.Storage.GUIs:WaitForChild("ProximityPrompt");
table.insert(u4, ProximityPrompt:Clone());
local Map = workspace:WaitForChild("Map");
Map:WaitForChild("Doors");
Map:WaitForChild("ATMz");
Map:WaitForChild("Shopz");
local u5 = Vector3.new(0, 0, 0);
local u6 = {};
local u7 = {};
local u8 = {};
local u9 = {};
local u10 = {};
local u11 = {};
local u12 = {};
local u13 = {};
local u14 = 1;
local u15 = {
    toggle1 = false,
    toggle2 = false
};
local u16 = {};
local u17 = {};
local u18 = {};
local u19 = {};
local u20 = {};
local u21 = {};
local u22 = nil;
local u23 = nil;
local u24 = nil;
local u25 = nil;
local u26 = nil;
local u27 = nil;
local u28 = nil;
local u29 = nil;
local u30 = nil;
local u31 = nil;
local u32 = nil;
local u33 = nil;

local function RayCheck(p34, p35, p36, p37, p38, p39) -- Line: 82
    local Ray_new_ret = Ray.new(p34, (p35.Position - p34).Unit * p36);
    local v40, v41 = workspace:FindPartOnRayWithWhitelist(Ray_new_ret, p37, true);

    if v40 == p35 then
        v40 = true;
    else
        local v42 = p38 and v40 and v40:IsDescendantOf(p35);

        if v42 then
            v40 = v42;
        elseif p39 then
            if v40 then
                v40 = v40:IsDescendantOf(p35.Parent);
            end;
        else
            v40 = p39;
        end;
    end;

    return v40, v41;
end;

local function InPart(p43, p44) -- Line: 89
    local v45 = p44.CFrame:PointToObjectSpace(p43);
    local v46 = p44.Size / 2;
    local v47;

    if math.abs(v45.X) <= v46.X and math.abs(v45.Y) <= v46.Y then
        v47 = math.abs(v45.Z) <= v46.Z;
    else
        v47 = false;
    end;

    return v47;
end;

local function ViewFrom(p48, p49, p50, p51, p52) -- Line: 95
    local v53 = p49.CFrame:PointToObjectSpace(p48);
    local v54 = p49.Size / 2;
    local v55;

    if math.abs(v53.X) <= v54.X and math.abs(v53.Y) <= v54.Y then
        v55 = math.abs(v53.Z) <= v54.Z;
    else
        v55 = false;
    end;

    if v55 then
        return true, p49.Position;
    end;

    if p52 then
        p50 = math.min((p49.Position - p48).Magnitude + 0.01, p50);
    end;

    local Ray_new_ret = Ray.new(p48, (p49.Position - p48).Unit * p50);
    local v56, v57 = workspace:FindPartOnRayWithWhitelist(Ray_new_ret, p51, true);
    local v58;

    if v56 == p49 then
        v58 = true;
    elseif v56 then
        v58 = v56:IsDescendantOf(p49) or false;
    else
        v58 = false;
    end;

    return v58 or (v57 - p49.Position).Magnitude <= 0.1, v57;
end;

local function PartInView(p59, p60, p61, p62) -- Line: 106
    -- upvalues: ViewFrom (copy), u1 (ref), u2 (ref)
    local v63, v64 = ViewFrom(u1.Position, p59, p60, p61, p62);
    local v65 = u2 and u2.HipHeight or 0;

    if not v63 and v65 < 0 then
        v63 = ViewFrom(u1.Position - Vector3.new(0, v65, 0), p59, p60, p61, p62);
    end;

    return v63, v64;
end;

local function KeyTxt(p66) -- Line: 115
    local v67 = tostring(p66);
    local v68 = tostring(p66);
    local string_len_ret = string.len(v68);

    return string.sub(v67, 14, string_len_ret);
end;

local function AliveCheck() -- Line: 119
    -- upvalues: u3 (ref), u1 (ref), u2 (ref), u22 (ref)
    local v69 = u3 and u3.Parent and (u1 and u1.Parent and (u2 and u2.Parent));

    if v69 then
        if u2:GetState() == Enum.HumanoidStateType.Dead then
            v69 = false;
        else
            v69 = not u22 or u22 and u22.RagdollTime.Value <= 0;
        end;
    end;

    return v69;
end;

local function CancelDo(p70) -- Line: 123
    -- upvalues: u18 (copy)
    if u18[p70] then
        u18[p70] = nil;
    end;
end;

local function DoorCheck() -- Line: 129
    -- upvalues: GetDoor (copy), u1 (ref), u7 (copy), u18 (copy), u23 (ref), u24 (ref), u25 (ref), u3 (ref)
    local v71, v72 = GetDoor(u1, u7, u18);
    local E = Enum.KeyCode.E;
    local G = Enum.KeyCode.G;
    local K = Enum.KeyCode.K;

    if v71 and v72 then
        local Events3 = v71.Events;
        local Values = v71.Values;
        local _ = Values.Health;
        local Open = Values.Open;
        local Broken = Values.Broken;
        local Busy = Values.Busy;
        local Busy2 = Values.Busy2;
        local Busy2_5 = Values.Busy2_5;
        local Busy3 = Values.Busy3;
        local Busy4 = Values.Busy4;
        local Locked = Values.Locked;
        local Lock = v71:FindFirstChild("Lock");

        if u23 ~= v72 then
            local v73 = u23;

            if u18[v73] then
                u18[v73] = nil;
            end;
        end;

        if u24 ~= Lock then
            local v74 = u24;

            if u18[v74] then
                u18[v74] = nil;
            end;
        end;

        if v71.DoorBase:FindFirstChild("KnockPos") and u25 ~= v71.DoorBase.KnockPos then
            local v75 = u25;

            if u18[v75] then
                u18[v75] = nil;
            end;
        end;

        u23 = v72;
        u24 = Lock;
        u25 = v71.DoorBase:FindFirstChild("KnockPos");

        if not Broken.Value then
            local Position = u1.Position;
            local v76 = { workspace.Map };
            local Ray_new_ret = Ray.new(Position, (v72.Position - Position).Unit * Values.ActiveDistance.Value);
            local v77, _ = workspace:FindPartOnRayWithWhitelist(Ray_new_ret, v76, true);

            if v77 == v72 and true or nil then
                local v78 = u3:FindFirstChildOfClass("Tool");
                local v79 = not (_G.CheckIfFlinching(u3, true) or _G.GVF().Currents:FindFirstChild("AntiDoor"));

                if v79 then
                    local v80 = v78 and not v78:FindFirstChild("DoorAllow") and v78:FindFirstChild("DoorUnable");
                    v79 = not v80;
                end;

                if _G.DoorOpenCheck and not _G.DoorOpenCheck() then
                    v79 = false;
                end;

                local v81 = {};

                if v79 then
                    if Busy.Value or Busy2.Value then
                        v81[1] = {
                            false,
                            0,
                            v72,
                            Color3.new(0.5, 0.5, 0.5),
                            E
                        };
                    elseif Busy3.Value then
                        v81[1] = {
                            false,
                            0,
                            v72,
                            Color3.new(1, 0, 0),
                            E
                        };
                    else
                        local v82 = (v71:FindFirstChild("IsGarageDoor") or v71:FindFirstChild("IsElevator1")) and "Do" or (Open.Value and "Close" or "Open");
                        v81[1] = {
                            true,
                            0,
                            v72,
                            Color3.new(1, 1, 1),
                            E,
                            Events3.Toggle,
                            { v82, v72 }
                        };
                    end;

                    local v83;

                    if Lock then
                        local Position2 = u1.Position;
                        local Lock2 = v71.Lock;
                        local v84 = { workspace.Map };
                        local Ray_new_ret2 = Ray.new(Position2, (Lock2.Position - Position2).Unit * Values.ActiveDistance.Value);
                        local v85, _ = workspace:FindPartOnRayWithWhitelist(Ray_new_ret2, v84, true);
                        v83 = v85 == Lock2 and true or (v85 and v85:IsDescendantOf(Lock2) or nil);
                    else
                        v83 = Lock;
                    end;

                    if Lock and (Values.CanLock.Value and not (Busy2.Value or (Busy2_5.Value or (Open.Value or (Busy.Value or not v83))))) then
                        if Locked.Value then
                            v81[2] = {
                                true,
                                0.15,
                                Lock,
                                Color3.fromRGB(24, 147, 255),
                                G,
                                Events3.Toggle,
                                { "Unlock", v71.Lock }
                            };
                        else
                            v81[2] = {
                                true,
                                0.15,
                                Lock,
                                Color3.new(1, 1, 1),
                                G,
                                Events3.Toggle,
                                { "Lock", v71.Lock }
                            };
                        end;
                    elseif Lock and (Values.CanLock.Value and (not Open.Value and v83)) then
                        v81[2] = {
                            false,
                            0.15,
                            Lock,
                            Color3.new(0.5, 0.5, 0.5),
                            G
                        };
                    elseif not (v83 or (Open.Value or not v71.DoorBase:FindFirstChild("KnockPos"))) then
                        if Busy4.Value or (Busy.Value or (Busy2.Value or Busy3.Value)) then
                            v81[2] = {
                                false,
                                0,
                                v71.DoorBase.KnockPos,
                                Color3.new(0.5, 0.5, 0.5),
                                K
                            };
                        else
                            v81[2] = {
                                true,
                                0,
                                v71.DoorBase.KnockPos,
                                Color3.new(1, 1, 1),
                                K,
                                Events3.Toggle,
                                { "Knock", v72 }
                            };
                        end;
                    end;
                else
                    v81[1] = {
                        false,
                        0,
                        v72,
                        Color3.new(0.5, 0.5, 0.5),
                        E
                    };
                end;

                local v86 = 0;

                if v81[1] then
                    v86 = v86 + 1;
                end;

                if v81[2] then
                    v86 = v86 + 1;
                end;

                if v81[3] then
                    v86 = v86 + 1;
                end;

                return v81[1] and v81, v86;
            end;
        end;
    else
        local v87 = u23;

        if u18[v87] then
            u18[v87] = nil;
        end;

        local v88 = u24;

        if u18[v88] then
            u18[v88] = nil;
        end;

        local v89 = u25;

        if u18[v89] then
            u18[v89] = nil;
        end;
    end;
end;

local function ATMCheck() -- Line: 256
    -- upvalues: GetMP (copy), u1 (ref), u6 (copy), u18 (copy), u3 (ref), u26 (ref), Events2 (copy)
    local v90 = GetMP(u1, u6, u18);
    local E = Enum.KeyCode.E;

    if v90 then
        local Position = u1.Position;
        local v91 = { workspace.Map };
        local Ray_new_ret = Ray.new(Position, (v90.Position - Position).Unit * 4.5);
        local v92, _ = workspace:FindPartOnRayWithWhitelist(Ray_new_ret, v91, true);

        if v92 == v90 then
            v92 = true;
        else
            local v93 = v92 and v92:IsDescendantOf(v90);

            if v93 then
                v92 = v93;
            elseif v92 then
                v92 = v92:IsDescendantOf(v90.Parent);
            end;
        end;

        if v92 then
            u3:FindFirstChildOfClass("Tool");
            local v94 = not _G.CheckIfFlinching();

            if _G.DoorOpenCheck and not _G.DoorOpenCheck() then
                v94 = false;
            end;

            local v95 = {};

            if u26 and u26 ~= v90 then
                local v96 = u26;

                if u18[v96] then
                    u18[v96] = nil;
                end;
            end;

            u26 = v90;

            if v94 then
                v95[1] = {
                    true,
                    0,
                    v90.posA,
                    Color3.new(1, 1, 1),
                    E,
                    Events2.ATM,
                    { v90 }
                };
            else
                v95[1] = {
                    false,
                    0,
                    v90.posA,
                    Color3.new(0.5, 0.5, 0.5),
                    E
                };
            end;

            return v95, 1;
        end;
    end;

    local v97 = u26;

    if u18[v97] then
        u18[v97] = nil;
    end;
end;

local function ShopCheck() -- Line: 286
    -- upvalues: GetMP (copy), u1 (ref), u8 (copy), u18 (copy), u3 (ref), u2 (ref), u27 (ref), Events2 (copy), u15 (ref)
    local v98 = GetMP(u1, u8, u18);
    local E = Enum.KeyCode.E;

    if v98 then
        local Position = u1.Position;
        local v99 = { workspace.Map };
        local Ray_new_ret = Ray.new(Position, (v98.Position - Position).Unit * 4.5);
        local v100, _ = workspace:FindPartOnRayWithWhitelist(Ray_new_ret, v99, true);

        if v100 == v98 then
            v100 = true;
        else
            local v101 = v100 and v100:IsDescendantOf(v98);

            if v101 then
                v100 = v101;
            elseif v100 then
                v100 = v100:IsDescendantOf(v98.Parent);
            end;
        end;

        if v100 then
            local v102 = u3:FindFirstChildOfClass("Tool");
            local v103 = not _G.CheckIfFlinching();

            if v103 and (_G.DoorOpenCheck and not _G.DoorOpenCheck()) then
                v103 = false;
            end;

            if v103 and (v102 and (v102:FindFirstChild("CantDrop") and v102.CantDrop.Value)) then
                v103 = false;
            end;

            if v103 and (u2 and (u2.Parent and u2:GetAttribute("NoShopInteract"))) then
                v103 = false;
            end;

            if v103 and not (u2 and (u2.Parent and (u2.FloorMaterial ~= Enum.Material.Air and (u2:GetState() ~= Enum.HumanoidStateType.Jumping and u2:GetState() ~= Enum.HumanoidStateType.Freefall)))) then
                v103 = false;
            end;

            local v104 = {};

            if u27 ~= v98 then
                local v105 = u27;

                if u18[v105] then
                    u18[v105] = nil;
                end;
            end;

            u27 = v98;

            if v103 then
                v104[1] = {
                    true,
                    0,
                    v98.posA,
                    Color3.new(1, 1, 1),
                    E,
                    Events2.Shop,
                    { v98 },
                    u15.toggle1
                };
            else
                v104[1] = {
                    false,
                    0,
                    v98.posA,
                    Color3.new(0.5, 0.5, 0.5),
                    E
                };
            end;

            return v104, 1;
        end;
    end;

    local v106 = u27;

    if u18[v106] then
        u18[v106] = nil;
    end;
end;

local function VendingCheck() -- Line: 319
    -- upvalues: GetMP (copy), u1 (ref), u9 (copy), u18 (copy), u3 (ref), u28 (ref), Events2 (copy)
    local v107 = GetMP(u1, u9, u18);
    local E = Enum.KeyCode.E;

    if v107 then
        local v108 = v107.CFrame.LookVector:Dot((u1.Position - v107.Position).Unit);

        if math.acos(v108) < 1.3962634015954636 then
            local Position = u1.Position;
            local v109 = { workspace.Map };
            local Ray_new_ret = Ray.new(Position, (v107.Position - Position).Unit * 4.5);
            local v110, _ = workspace:FindPartOnRayWithWhitelist(Ray_new_ret, v109, true);

            if v110 == v107 then
                v110 = true;
            else
                local v111 = v110 and v110:IsDescendantOf(v107);

                if v111 then
                    v110 = v111;
                elseif v110 then
                    v110 = v110:IsDescendantOf(v107.Parent);
                end;
            end;

            if v110 then
                u3:FindFirstChildOfClass("Tool");
                local v112 = not _G.CheckIfFlinching();

                if v107.Parent.Values.Busy.Value or (v107.Parent.Values.Broken.Value or v107.Parent.Values.Stuck.Value) then
                    v112 = false;
                elseif _G.DoorOpenCheck and not _G.DoorOpenCheck() then
                    v112 = false;
                end;

                local v113 = {};

                if u28 and u28 ~= v107 then
                    local v114 = u28;

                    if u18[v114] then
                        u18[v114] = nil;
                    end;
                end;

                u28 = v107;

                if v112 then
                    v113[1] = {
                        true,
                        0,
                        v107.posA,
                        Color3.new(1, 1, 1),
                        E,
                        Events2.VendingMachine,
                        { v107 }
                    };
                else
                    v113[1] = {
                        false,
                        0,
                        v107.posA,
                        Color3.new(0.5, 0.5, 0.5),
                        E
                    };
                end;

                return v113, 1;
            end;
        end;
    end;

    local v115 = u28;

    if u18[v115] then
        u18[v115] = nil;
    end;
end;

local function ScrapDropCheck() -- Line: 353
    -- upvalues: GetDrops (copy), u1 (ref), u10 (copy), u18 (copy), u2 (ref), u3 (ref), u29 (ref), Events (copy), u15 (ref)
    local v116 = GetDrops(u1, u10, u18, 3, -1, 4);
    local E = Enum.KeyCode.E;

    if not (u1 and u1.Parent) then
        return;
    end;

    local v117, v118;

    if v116 then
        local v119 = {
            workspace.Map.MysteryBoxes,
            workspace.Map.Parts,
            workspace.Map.Doors,
            workspace.Map.ATMz,
            workspace.Map.StreetLights,
            unpack(u10)
        };
        local Position = u1.Position;
        local v120 = 6;
        local v121 = v116.CFrame:PointToObjectSpace(Position);
        local v122 = v116.Size / 2;
        local v123;

        if math.abs(v121.X) <= v122.X and math.abs(v121.Y) <= v122.Y then
            v123 = math.abs(v121.Z) <= v122.Z;
        else
            v123 = false;
        end;

        if v123 then
            v117 = v116.Position;
            v118 = true;
        else
            local Ray_new_ret = Ray.new(Position, (v116.Position - Position).Unit * v120);
            local v124;
            v124, v117 = workspace:FindPartOnRayWithWhitelist(Ray_new_ret, v119, true);
            local v125;

            if v124 == v116 then
                v125 = true;
            elseif v124 then
                v125 = v124:IsDescendantOf(v116) or false;
            else
                v125 = false;
            end;

            v118 = v125 or (v117 - v116.Position).Magnitude <= 0.1;
        end;

        local v126 = u2 and u2.HipHeight or 0;

        if not v118 and v126 < 0 then
            local v127 = u1.Position - Vector3.new(0, v126, 0);
            local v128 = 6;
            local v129 = v116.CFrame:PointToObjectSpace(v127);
            local v130 = v116.Size / 2;
            local v131;

            if math.abs(v129.X) <= v130.X and math.abs(v129.Y) <= v130.Y then
                v131 = math.abs(v129.Z) <= v130.Z;
            else
                v131 = false;
            end;

            if v131 then
                local _ = v116.Position;
                v118 = true;
            else
                local Ray_new_ret = Ray.new(v127, (v116.Position - v127).Unit * v128);
                local v132, v133 = workspace:FindPartOnRayWithWhitelist(Ray_new_ret, v119, true);
                local v134;

                if v132 == v116 then
                    v134 = true;
                elseif v132 then
                    v134 = v132:IsDescendantOf(v116) or false;
                else
                    v134 = false;
                end;

                v118 = v134 or (v133 - v116.Position).Magnitude <= 0.1;
            end;
        end;
    else
        v117 = nil;
        v118 = nil;
    end;

    if v116 and (v117 and (v118 or (v117 - v116.Position).Magnitude <= 0.1)) then
        u3:FindFirstChildOfClass("Tool");
        local v135 = not _G.CheckIfFlinching();

        if _G.DoorOpenCheck and not _G.DoorOpenCheck() then
            v135 = false;
        end;

        local v136 = {};

        if u29 ~= v116 then
            local v137 = u29;

            if u18[v137] then
                u18[v137] = nil;
            end;
        end;

        u29 = v116;

        if v135 then
            local Attribute = v116.Parent:GetAttribute("jzu");
            local Attribute2 = v116.Parent:GetAttribute("cot_");
            local v138 = {};

            if Attribute then
                Attribute = string.reverse(Attribute);
            end;

            v138[1] = Attribute;
            v116.Parent:GetAttribute("IsCrate");
            local v139 = {};
            local Color3_new_ret = Color3.new(1, 1, 1);
            local PIC_PU = Events.PIC_PU;
            local v140 = _G.CheckIfCan(u3, "Left Arm") and u15.pickup1 or u15.pickup2;
            local v141;

            if v116.Position.Y + 1 < u1.Position.Y and u2:GetState() ~= Enum.HumanoidStateType.Swimming then
                v141 = u2:GetState() ~= Enum.HumanoidStateType.Climbing;
            else
                v141 = false;
            end;

            v139[1], v139[2], v139[3], v139[4], v139[5], v139[6], v139[7], v139[8], v139[9] = true, Attribute2 or 3, v116, Color3_new_ret, E, PIC_PU, v138, v140, v141;
            v136[1] = v139;
        else
            v136[1] = {
                false,
                3,
                v116,
                Color3.new(0.5, 0.5, 0.5),
                E
            };
        end;

        return v136, 1;
    end;

    local v142 = u29;

    if u18[v142] then
        u18[v142] = nil;
    end;
end;

local RaycastParams_new_ret = RaycastParams.new();
RaycastParams_new_ret.FilterType = Enum.RaycastFilterType.Include;
RaycastParams_new_ret.IgnoreWater = true;
RaycastParams_new_ret.RespectCanCollide = true;

local function SetToolViewFilter() -- Line: 424
    -- upvalues: Map (copy), RaycastParams_new_ret (copy)
    local v143 = {};

    for _, v in ipairs({ "MysteryBoxes", "Parts", "Doors", "ATMz", "StreetLights" }) do
        local v144 = Map:FindFirstChild(v);

        if v144 then
            table.insert(v143, v144);
        end;
    end;

    RaycastParams_new_ret.FilterDescendantsInstances = v143;
end;

local function ToolInView(p145, p146, p147) -- Line: 435
    -- upvalues: RaycastParams_new_ret (copy)
    local v148 = p146.Position - p145;
    local Magnitude = v148.Magnitude;

    if p147 < Magnitude then
        return false;
    end;

    return Magnitude <= 0.25 and true or workspace:Raycast(p145, v148.Unit * (Magnitude - 0.2), RaycastParams_new_ret) == nil;
end;

local function ToolDropCheck() -- Line: 443
    -- upvalues: GetDrops (copy), u1 (ref), u12 (copy), u18 (copy), SetToolViewFilter (copy), RaycastParams_new_ret (copy), u3 (ref), u30 (ref), Events (copy), u15 (ref), u2 (ref)
    local v149 = GetDrops(u1, u12, u18, 6, -1, 4, true);
    local E = Enum.KeyCode.E;

    if not (u1 and u1.Parent) then
        return;
    end;

    local v150 = nil;

    if v149 then
        local Head = u1.Parent:FindFirstChild("Head");
        SetToolViewFilter();

        for i = 1, math.min(#v149, 4) do
            local v151 = v149[i];
            local Position = u1.Position;
            local v152 = v151.Position - Position;
            local Magnitude = v152.Magnitude;
            local v153;

            if Magnitude > 6 then
                v153 = false;
            else
                v153 = Magnitude <= 0.25 and true or workspace:Raycast(Position, v152.Unit * (Magnitude - 0.2), RaycastParams_new_ret) == nil;
            end;

            if v153 then
                v150 = v151;
                break;
            end;

            local v154;

            if Head then
                local Position2 = Head.Position;
                local v155 = v151.Position - Position2;
                local Magnitude2 = v155.Magnitude;
                local v156;

                if Magnitude2 > 5 then
                    v156 = false;
                else
                    v156 = Magnitude2 <= 0.25 and true or workspace:Raycast(Position2, v155.Unit * (Magnitude2 - 0.2), RaycastParams_new_ret) == nil;
                end;

                if v156 then
                    v150 = v151;
                    break;
                end;

                v154 = i;
            else
                v154 = i;
            end;
        end;
    end;

    if v150 then
        u3:FindFirstChildOfClass("Tool");
        local v157 = not _G.CheckIfFlinching();

        if _G.DoorOpenCheck and not _G.DoorOpenCheck() then
            v157 = false;
        end;

        local v158 = {};

        if u30 ~= v150 then
            local v159 = u30;

            if u18[v159] then
                u18[v159] = nil;
            end;
        end;

        u30 = v150;

        if v157 then
            local v160 = {};
            local Color3_new_ret = Color3.new(1, 1, 1);
            local PIC_TLO = Events.PIC_TLO;
            local table_pack_ret = table.pack(v150, nil, nil);
            local v161 = _G.CheckIfCan(u3, "Left Arm") and u15.pickup1 or u15.pickup2;
            local v162;

            if v150.Position.Y + 1 < u1.Position.Y and u2:GetState() ~= Enum.HumanoidStateType.Swimming then
                v162 = u2:GetState() ~= Enum.HumanoidStateType.Climbing;
            else
                v162 = false;
            end;

            v160[1], v160[2], v160[3], v160[4], v160[5], v160[6], v160[7], v160[8], v160[9] = true, 1, v150, Color3_new_ret, E, PIC_TLO, table_pack_ret, v161, v162;
            v158[1] = v160;
        else
            v158[1] = {
                false,
                1,
                v150,
                Color3.new(0.5, 0.5, 0.5),
                E
            };
        end;

        return v158, 1;
    end;

    local v163 = u30;

    if u18[v163] then
        u18[v163] = nil;
    end;
end;

local function CashDropCheck() -- Line: 505
    -- upvalues: GetDrops (copy), u1 (ref), u11 (copy), u18 (copy), u2 (ref), u3 (ref), u31 (ref), Events (copy), u15 (ref)
    local v164 = GetDrops(u1, u11, u18, 6, -1);
    local E = Enum.KeyCode.E;

    if not (u1 and u1.Parent) then
        return;
    end;

    local v165, v166;

    if v164 then
        local v167 = {
            workspace.Map.MysteryBoxes,
            workspace.Map.Parts,
            workspace.Map.Doors,
            workspace.Map.ATMz,
            workspace.Map.StreetLights,
            workspace.Filter.SpawnedBread
        };
        local Position = u1.Position;
        local v168 = 6;
        local v169 = v164.CFrame:PointToObjectSpace(Position);
        local v170 = v164.Size / 2;
        local v171;

        if math.abs(v169.X) <= v170.X and math.abs(v169.Y) <= v170.Y then
            v171 = math.abs(v169.Z) <= v170.Z;
        else
            v171 = false;
        end;

        if v171 then
            v165 = v164.Position;
            v166 = true;
        else
            local Ray_new_ret = Ray.new(Position, (v164.Position - Position).Unit * v168);
            local v172;
            v172, v165 = workspace:FindPartOnRayWithWhitelist(Ray_new_ret, v167, true);
            local v173;

            if v172 == v164 then
                v173 = true;
            elseif v172 then
                v173 = v172:IsDescendantOf(v164) or false;
            else
                v173 = false;
            end;

            v166 = v173 or (v165 - v164.Position).Magnitude <= 0.1;
        end;

        local v174 = u2 and u2.HipHeight or 0;

        if not v166 and v174 < 0 then
            local v175 = u1.Position - Vector3.new(0, v174, 0);
            local v176 = 6;
            local v177 = v164.CFrame:PointToObjectSpace(v175);
            local v178 = v164.Size / 2;
            local v179;

            if math.abs(v177.X) <= v178.X and math.abs(v177.Y) <= v178.Y then
                v179 = math.abs(v177.Z) <= v178.Z;
            else
                v179 = false;
            end;

            if v179 then
                local _ = v164.Position;
                v166 = true;
            else
                local Ray_new_ret = Ray.new(v175, (v164.Position - v175).Unit * v176);
                local v180, v181 = workspace:FindPartOnRayWithWhitelist(Ray_new_ret, v167, true);
                local v182;

                if v180 == v164 then
                    v182 = true;
                elseif v180 then
                    v182 = v180:IsDescendantOf(v164) or false;
                else
                    v182 = false;
                end;

                v166 = v182 or (v181 - v164.Position).Magnitude <= 0.1;
            end;
        end;

        if not v166 then
            local Position2 = u1.Parent.Head.Position;
            local v183 = 5;
            local v184 = {
                workspace.Map.MysteryBoxes,
                workspace.Map.Parts,
                workspace.Map.Doors,
                workspace.Map.ATMz,
                workspace.Map.StreetLights,
                workspace.Filter.SpawnedBread
            };
            local v185 = v164.CFrame:PointToObjectSpace(Position2);
            local v186 = v164.Size / 2;
            local v187;

            if math.abs(v185.X) <= v186.X and math.abs(v185.Y) <= v186.Y then
                v187 = math.abs(v185.Z) <= v186.Z;
            else
                v187 = false;
            end;

            if v187 then
                v165 = v164.Position;
                v166 = true;
            else
                local Ray_new_ret = Ray.new(Position2, (v164.Position - Position2).Unit * v183);
                local v188;
                v188, v165 = workspace:FindPartOnRayWithWhitelist(Ray_new_ret, v184, true);
                local v189;

                if v188 == v164 then
                    v189 = true;
                elseif v188 then
                    v189 = v188:IsDescendantOf(v164) or false;
                else
                    v189 = false;
                end;

                v166 = v189 or (v165 - v164.Position).Magnitude <= 0.1;
            end;
        end;
    else
        v165 = nil;
        v166 = nil;
    end;

    if v164 and (v165 and (v166 or (v165 - v164.Position).Magnitude <= 0.1)) then
        u3:FindFirstChildOfClass("Tool");
        local v190 = not _G.CheckIfFlinching();

        if _G.DoorOpenCheck and not _G.DoorOpenCheck() then
            v190 = false;
        end;

        local v191 = {};

        if v164.Parent ~= workspace.Filter.SpawnedBread then
            v164 = v164.Parent;
        end;

        if u31 ~= v164 then
            local v192 = u31;

            if u18[v192] then
                u18[v192] = nil;
            end;
        end;

        u31 = v164;

        if v190 then
            local v193 = {};
            local Color3_new_ret = Color3.new(1, 1, 1);
            local CZDPZUS = Events.CZDPZUS;
            local table_pack_ret = table.pack(v164, nil);
            local v194 = _G.CheckIfCan(u3, "Left Arm") and u15.pickup1 or u15.pickup2;
            local v195;

            if v164.Position.Y + 1 < u1.Position.Y and u2:GetState() ~= Enum.HumanoidStateType.Swimming then
                v195 = u2:GetState() ~= Enum.HumanoidStateType.Climbing;
            else
                v195 = false;
            end;

            v193[1], v193[2], v193[3], v193[4], v193[5], v193[6], v193[7], v193[8], v193[9] = true, 1, v164, Color3_new_ret, E, CZDPZUS, table_pack_ret, v194, v195;
            v191[1] = v193;
        else
            v191[1] = {
                false,
                1,
                v164,
                Color3.new(0.5, 0.5, 0.5),
                E
            };
        end;

        return v191, 1;
    end;

    local v196 = u31;

    if u18[v196] then
        u18[v196] = nil;
    end;
end;

local function GetExtrasCheck() -- Line: 575
    -- upvalues: u20 (copy), GetDrops (copy), u1 (ref), u18 (copy), RayCheck (copy), u3 (ref), u32 (ref), u15 (ref)
    local v197 = {};
    local v198 = {};

    for _, v in pairs(u20) do
        if v[1] and (v[1].Parent and v[1]:IsA("BasePart")) then
            table.insert(v197, v[1]);
            v198[v[1]] = {
                v[1],
                v[2],
                v[3],
                v[4],
                v[5],
                v[6],
                v[7]
            };
        end;
    end;

    local v199 = GetDrops(u1, v197, u18, 5, 0);

    if not (u1 and u1.Parent) then
        return;
    end;

    local v200;

    if v199 then
        local Position = u1.Position;
        local Ray_new_ret = Ray.new(Position, (v199.Position - Position).Unit * 6);
        local v201;
        v201, v200 = workspace:FindPartOnRayWithWhitelist(Ray_new_ret, v197, true);
        local v202;

        if v201 == v199 then
            v202 = true;
        elseif v201 then
            v202 = v201:IsDescendantOf(v199) or false;
        else
            v202 = false;
        end;
    else
        v200 = nil;
    end;

    if v199 and (RayCheck or (v200 - v199.Position).Magnitude <= 1.5) then
        u3:FindFirstChildOfClass("Tool");
        local v203 = not _G.CheckIfFlinching();
        local v204 = v198[v199];
        local v205 = v204[5];

        if _G.DoorOpenCheck and not _G.DoorOpenCheck() then
            v203 = false;
        end;

        local v206 = {};

        if u32 ~= v199 then
            local v207 = u32;

            if u18[v207] then
                u18[v207] = nil;
            end;
        end;

        u32 = v199;
        local v208 = v204[4] or 0;

        if v204[6] then
            v204[6]();
        end;

        if v203 then
            v206[1] = {
                true,
                v208,
                v199,
                Color3.new(1, 1, 1),
                v205,
                v204[2],
                v204[3],
                _G.CheckIfCan(u3, "Left Arm") and u15.pickup1 or u15.pickup2
            };
        else
            v206[1] = {
                false,
                v208,
                v199,
                Color3.new(0.5, 0.5, 0.5),
                v205
            };
        end;

        return v206, 1;
    end;

    local v209 = u32;

    if u18[v209] then
        u18[v209] = nil;
    end;
end;

local function MysteryBoxCheck() -- Line: 642
    -- upvalues: GetMP (copy), u1 (ref), u13 (copy), u18 (copy), u33 (ref), LocalPlayer (copy), Events2 (copy)
    local v210 = GetMP(u1, u13, u18);
    local E = Enum.KeyCode.E;

    if not (u1 and u1.Parent) then
        return;
    end;

    local v211 = nil;
    local v212 = nil;

    if v210 then
        local v213 = v210.CFrame.LookVector:Dot((u1.Position - v210.Position).Unit);

        if math.acos(v213) < 2.0943951023931953 then
            local Position = u1.Position;
            local v214 = {
                workspace.Map.MysteryBoxes,
                workspace.Map.Parts,
                workspace.Map.Doors,
                workspace.Map.ATMz,
                workspace.Map.StreetLights,
                workspace.Filter.SpawnedTools
            };
            local Ray_new_ret = Ray.new(Position, (v210.Position - Position).Unit * 6);
            v211, v212 = workspace:FindPartOnRayWithWhitelist(Ray_new_ret, v214, true);

            if v211 == v210 then
                v211 = true;
            else
                local v215 = v211 and v211:IsDescendantOf(v210);

                if v215 then
                    v211 = v215;
                elseif v211 then
                    v211 = v211:IsDescendantOf(v210.Parent);
                end;
            end;
        end;
    end;

    if v210 and (v212 and (v211 or (v212 - v210.Position).Magnitude <= 0.1)) then
        local v216 = not _G.CheckIfFlinching();

        if _G.DoorOpenCheck and not _G.DoorOpenCheck() then
            v216 = false;
        end;

        local v217 = {};

        if u33 ~= v210 then
            local v218 = u33;

            if u18[v218] then
                u18[v218] = nil;
            end;
        end;

        u33 = v210;
        local Parent = v210.Parent;
        local v219 = true;
        local v220 = "PosA";
        local v221 = "Buy";

        if not Parent.Values.Active.Value then
            local v222 = u33;

            if u18[v222] then
                u18[v222] = nil;
            end;

            return nil;
        end;

        if Parent.Values.Open.Value then
            if not Parent.Values.CanTake.Value or Parent.Values.UsePlayer.Value ~= LocalPlayer then
                local v223 = u33;

                if u18[v223] then
                    u18[v223] = nil;
                end;

                return nil;
            end;

            v220 = "PosB";
            v221 = "Take";
        elseif not Parent.Values.Open.Value and Parent.Values.Busy.Value then
            v219 = false;
        end;

        if not v216 then
            v219 = false;
        end;

        if v216 and v219 then
            v217[1] = {
                true,
                0,
                v210[v220],
                Color3.new(1, 1, 1),
                E,
                Events2.MysteryBoxInteract,
                { v210, v221 }
            };
        else
            v217[1] = {
                false,
                0,
                v210[v220],
                Color3.new(0.5, 0.5, 0.5),
                E
            };
        end;

        return v217, 1;
    end;

    local v224 = u33;

    if u18[v224] then
        u18[v224] = nil;
    end;
end;

local function RemoveGuiCon(p225, p226) -- Line: 726
    -- upvalues: u19 (ref)
    local v227 = u19[p225];

    if v227 then
        if p226 and v227[10] ~= p226 then
            return;
        end;

        if typeof(v227[12]) == "function" then
            pcall(v227[12]);
        end;

        if v227[11] and v227[11].Parent then
            v227[11]:Destroy();
        end;

        u19[p225] = nil;
    end;
end;

local function IsValid() -- Line: 745
    -- upvalues: u2 (ref)
    return u2 and u2.Parent and u2.Health > 0;
end;

local function MonitorNormalPrompt(u228) -- Line: 749
    -- upvalues: u3 (ref), LocalPlayer (copy), u19 (ref), u10 (copy), u1 (ref), u2 (ref), u15 (ref), RunService (copy), u21 (copy)
    local u229 = false;
    local u230 = nil;
    local u231 = false;
    local MaxActivationDistance = u228.MaxActivationDistance;
    local u232 = u228.Parent:IsA("Attachment") and u228.Parent.WorldPosition or u228.Parent.Position;

    local function Triggered() -- Line: 762
        -- upvalues: u229 (ref)
        u229 = false;
    end;

    local function CantCheck() -- Line: 778
        -- upvalues: u3 (ref), u228 (copy), LocalPlayer (ref), u19 (ref), MaxActivationDistance (copy), u10 (ref), u1 (ref), u2 (ref)
        local _G_CheckIfFlinching_ret = _G.CheckIfFlinching(u3);

        if _G_CheckIfFlinching_ret then
            return _G_CheckIfFlinching_ret;
        end;

        if u228:GetAttribute("TOTDoor") then
            if u228:GetAttribute("Triggered") or LocalPlayer:GetAttribute("TOT_DB") then
                return true;
            end;

            local v233 = u228.Parent and u228.Parent.Parent and u228.Parent.Parent.Parent;

            if v233 then
                v233 = v233:FindFirstChild("DoorModel");
            end;

            if v233 and (LocalPlayer.UserId > 0 and v233:GetAttribute((tostring(LocalPlayer.UserId)))) then
                return true;
            end;

            local SpawnedBread = workspace.Filter:FindFirstChild("SpawnedBread");

            for i in pairs(u19) do
                if SpawnedBread and i.Parent == SpawnedBread then
                    return true;
                end;
            end;

            return false;
        end;

        local v234 = u228:FindFirstAncestorWhichIsA("BasePart");

        if v234 then
            local v235 = MaxActivationDistance + 0.01;
            local v236 = {
                workspace.Map.MysteryBoxes,
                workspace.Map.Parts,
                workspace.Map.Doors,
                workspace.Map.ATMz,
                workspace.Map.StreetLights,
                unpack(u10)
            };
            local Position = u1.Position;
            local v237 = v234.CFrame:PointToObjectSpace(Position);
            local v238 = v234.Size / 2;
            local v239;

            if math.abs(v237.X) <= v238.X and math.abs(v237.Y) <= v238.Y then
                v239 = math.abs(v237.Z) <= v238.Z;
            else
                v239 = false;
            end;

            local v240, v241;

            if v239 then
                v240 = v234.Position;
                v241 = true;
            else
                local math_min_ret = math.min((v234.Position - Position).Magnitude + 0.01, v235);
                local Ray_new_ret = Ray.new(Position, (v234.Position - Position).Unit * math_min_ret);
                local v242;
                v242, v240 = workspace:FindPartOnRayWithWhitelist(Ray_new_ret, v236, true);
                local v243;

                if v242 == v234 then
                    v243 = true;
                elseif v242 then
                    v243 = v242:IsDescendantOf(v234) or false;
                else
                    v243 = false;
                end;

                v241 = v243 or (v240 - v234.Position).Magnitude <= 0.1;
            end;

            local v244 = u2 and u2.HipHeight or 0;

            if not v241 and v244 < 0 then
                local v245 = u1.Position - Vector3.new(0, v244, 0);
                local v246 = v234.CFrame:PointToObjectSpace(v245);
                local v247 = v234.Size / 2;
                local v248;

                if math.abs(v246.X) <= v247.X and math.abs(v246.Y) <= v247.Y then
                    v248 = math.abs(v246.Z) <= v247.Z;
                else
                    v248 = false;
                end;

                if v248 then
                    local _ = v234.Position;
                    v241 = true;
                else
                    local math_min_ret = math.min((v234.Position - v245).Magnitude + 0.01, v235);
                    local Ray_new_ret = Ray.new(v245, (v234.Position - v245).Unit * math_min_ret);
                    local v249, v250 = workspace:FindPartOnRayWithWhitelist(Ray_new_ret, v236, true);
                    local v251;

                    if v249 == v234 then
                        v251 = true;
                    elseif v249 then
                        v251 = v249:IsDescendantOf(v234) or false;
                    else
                        v251 = false;
                    end;

                    v241 = v251 or (v250 - v234.Position).Magnitude <= 0.1;
                end;
            end;

            return not (v234 and (v240 and (v241 or (v240 - v234.Position).Magnitude <= 0.1)));
        end;
    end;

    local function ShowPrompt() -- Line: 823
        -- upvalues: u231 (ref), u228 (copy), MaxActivationDistance (copy)
        u231 = true;
        u228.MaxActivationDistance = MaxActivationDistance;
    end;

    local function TriggerEnded() -- Line: 829
        -- upvalues: u229 (ref)
        u229 = false;
    end;

    local function TriggerHoldEnd() -- Line: 834
        -- upvalues: u229 (ref), u15 (ref)
        if u229 then
            u15.grabbing1:Stop(0.15);
            u15.grabbing2:Stop(0.15);
            u15.openloop:Stop(0.15);
        end;

        u229 = false;
    end;

    local function TriggerHoldStart() -- Line: 845
        -- upvalues: u229 (ref), u230 (ref), u15 (ref), u3 (ref), u232 (copy), u1 (ref), u2 (ref), u228 (copy), RunService (ref)
        u229 = true;

        if u230 then
            u230:Stop(0.05);
        end;

        u230 = u15.grabbing1;

        if not _G.CheckIfCan(u3, "Left Arm") then
            u230 = u15.grabbing2;
        end;

        u230:Play(0.15);
        local v252;

        if u232.Y + 1 < u1.Position.Y and u2:GetState() ~= Enum.HumanoidStateType.Swimming then
            v252 = u2:GetState() ~= Enum.HumanoidStateType.Climbing;
        else
            v252 = false;
        end;

        if v252 then
            v252 = _G.AffectChar("FORCEC", u228.HoldDuration + 0.15);
        end;

        local v253 = tick();

        while u229 and (u228 ~= nil and (u228.Parent and tick() - v253 < u228.HoldDuration)) do
            RunService.Heartbeat:Wait();
        end;

        if v252 and v252.Parent then
            v252:Destroy();
        end;

        if u230 then
            u230:Stop(0.05);
        end;
    end;

    local function CheckPrompt2() -- Line: 881
        -- upvalues: CantCheck (copy), u231 (ref), u228 (copy), MaxActivationDistance (copy)
        if CantCheck() then
            if u231 then
                u231 = false;
                u228.MaxActivationDistance = 0;
            end;
        elseif not u231 then
            u231 = true;
            u228.MaxActivationDistance = MaxActivationDistance;
        end;

        return u231;
    end;

    u21[u228] = { function() -- Line: 897, Name: CheckPrompt
            -- upvalues: u1 (ref), u232 (copy), MaxActivationDistance (copy), CantCheck (copy), u231 (ref), u228 (copy)
            if u1 and u1.Parent then
                local Magnitude = (u1.Position - u232).Magnitude;
                local v254;

                if Magnitude < MaxActivationDistance then
                    if CantCheck() then
                        if u231 then
                            u231 = false;
                            u228.MaxActivationDistance = 0;
                        end;
                    elseif not u231 then
                        u231 = true;
                        u228.MaxActivationDistance = MaxActivationDistance;
                    end;

                    v254 = u231;
                else
                    v254 = false;
                end;

                return v254, Magnitude;
            end;
        end, function() -- Line: 817, Name: HidePrompt
            -- upvalues: u231 (ref), u228 (copy)
            u231 = false;
            u228.MaxActivationDistance = 0;
        end, function() -- Line: 907, Name: ResetPrompt
            -- upvalues: u231 (ref), u228 (copy), MaxActivationDistance (copy)
            u231 = true;
            u228.MaxActivationDistance = MaxActivationDistance;
        end };
    local u255 = {};
    local u256 = nil;
    local u257 = nil;
    u257 = u228.AncestryChanged:Connect(function(p258, p259) -- Line: 918
        -- upvalues: u257 (ref), u229 (ref), u15 (ref), u256 (ref), u21 (ref), u228 (copy)
        if not p259 then
            u257:Disconnect();
            pcall(function() -- Line: 921
                -- upvalues: u229 (ref), u15 (ref)
                if u229 then
                    u15.grabbing1:Stop(0.15);
                    u15.grabbing2:Stop(0.15);
                    u15.openloop:Stop(0.15);
                end;

                u229 = false;
            end);

            if u256 then
                pcall(u256);
            end;

            u21[u228] = nil;
        end;
    end);
    table.insert(u255, u228.Triggered:Connect(Triggered));
    table.insert(u255, u228.TriggerEnded:Connect(TriggerEnded));
    table.insert(u255, u228.PromptButtonHoldBegan:Connect(TriggerHoldStart));
    table.insert(u255, u228.PromptButtonHoldEnded:Connect(TriggerHoldEnd));

    u256 = function() -- Line: 937
        -- upvalues: u255 (copy), TriggerEnded (copy), TriggerHoldEnd (copy)
        if u255 then
            for _, v in pairs(u255) do
                if v then
                    v:Disconnect();
                end;
            end;
        end;

        pcall(TriggerEnded);
        pcall(TriggerHoldEnd);
    end;
end;

local function AddGuiCon(p260, p261, u262, p263) -- Line: 951
    -- upvalues: u19 (ref), u4 (copy), u2 (ref), u17 (ref), u3 (ref), u15 (ref), u18 (copy), RunService (copy)
    local v264;

    if u19[p260] then
        if typeof(u19[p260][12]) == "function" then
            u19[p260][12]();
        end;

        v264 = u19[p260][11];
    else
        v264 = nil;
    end;

    local u265 = u262[1];
    local v266 = u262[2];
    local v267 = u262[3];
    local v268 = u262[4];
    local v269 = u262[5];
    local v270 = u262[6];
    local v271 = u262[7];
    local v272 = u262[8];
    local v273 = u262[9];
    local u274 = v264 or u4[1]:Clone();
    u274:SetAttribute("Color3", v268);
    u274.Parent = v267;
    u274.KeyboardKeyCode = v269;
    local _ = v266 <= 0;
    u274.HoldDuration = v266;
    u274.Enabled = true;
    local u275 = {
        v270,
        v266,
        v271,
        v267,
        v272,
        u274,
        p261,
        p263,
        v273
    };
    local u276 = u275[1];
    local u277 = u275[2];
    local u278 = u275[3];
    local u279 = u275[4];
    local u280 = u275[5];
    local u281 = u275[6];
    local _ = u275[7];
    local _ = u275[8];
    local u282 = u275[9];

    local function Fire() -- Line: 1013
        -- upvalues: u2 (ref), u276 (copy), u277 (copy), u278 (copy), u279 (copy), u281 (copy), u17 (ref), u3 (ref), u15 (ref), u280 (copy)
        if not (u2 and u2.Parent and u2.Health > 0) then
            return;
        end;

        if u276 and (u277 and (u278 and (u279 and (u281 and not u17[u279])))) then
            local function ToggleType() -- Line: 1017
                -- upvalues: u3 (ref), u15 (ref)
                if _G.CheckIfCan(u3, "Left Arm") then
                    return u15.toggle2;
                end;

                return u15.toggle1;
            end;

            local v283 = u280;

            if not v283 then
                if _G.CheckIfCan(u3, "Left Arm") then
                    v283 = u15.toggle2;
                else
                    v283 = u15.toggle1;
                end;
            end;

            v283:Play(0.1);

            if u276:IsA("RemoteEvent") then
                u276:FireServer(unpack(u278, 1, u278.n or #u278));
            elseif u276:IsA("BindableEvent") then
                u276:Fire(unpack(u278));
            end;

            u17[u279] = true;
            task.delay(0.25, function() -- Line: 1035
                -- upvalues: u17 (ref), u279 (ref)
                pcall(function() -- Line: 1036
                    -- upvalues: u17 (ref), u279 (ref)
                    u17[u279] = nil;
                end);
            end);
        end;
    end;

    local u284 = false;
    local u285 = nil;

    local function u286() -- Line: 1046
        -- upvalues: u284 (ref), u265 (copy), u285 (ref), Fire (ref)
        u284 = false;

        if not u265 then
            return;
        end;

        if u285 then
            u285:Stop(0.05);
            u285 = nil;
        end;

        Fire();
    end;

    local function u287() -- Line: 1059
        -- upvalues: u284 (ref)
        u284 = false;
    end;

    local function u288() -- Line: 1063
        -- upvalues: u284 (ref), u15 (ref)
        if u284 then
            u15.grabbing1:Stop(0.15);
            u15.grabbing2:Stop(0.15);
            u15.openloop:Stop(0.15);
        end;

        u284 = false;
    end;

    local function u292() -- Line: 1072
        -- upvalues: u265 (copy), u284 (ref), u18 (ref), u279 (copy), u285 (ref), u15 (ref), u3 (ref), u282 (copy), u277 (copy), u274 (ref), u288 (ref), RunService (ref)
        if not u265 then
            return;
        end;

        u284 = true;
        local u289 = {};
        u18[u279] = u289;

        if u285 then
            u285:Stop(0.05);
        end;

        u285 = u15.grabbing1;

        if not _G.CheckIfCan(u3, "Left Arm") then
            u285 = u15.grabbing2;
        end;

        u285:Play(0.15);
        local v290 = u282 and _G.AffectChar("FORCEC", u277 + 0.15);
        local v291 = tick();

        while tick() - v291 < u277 and (u284 and (u274 ~= nil and u274.Parent)) do
            if _G.CheckIfFlinching(u3) then
                u274:InputHoldEnd();
                u288();
                break;
            end;

            RunService.Heartbeat:Wait();
        end;

        if v290 and v290.Parent then
            v290:Destroy();
        end;

        if u285 then
            u285:Stop(0.05);
        end;

        task.delay(0.15, function() -- Line: 1112
            -- upvalues: u18 (ref), u279 (ref), u289 (copy)
            if u18[u279] == u289 then
                u18[u279] = nil;
            end;
        end);
    end;

    local u293 = nil;
    u293 = u274.AncestryChanged:Connect(function(p294, p295) -- Line: 1120
        -- upvalues: u293 (ref), u262 (copy), u288 (ref)
        if not p295 then
            u293:Disconnect();
            pcall(function() -- Line: 1123
                -- upvalues: u262 (ref), u288 (ref)
                if u262 then
                    u262[12]();
                end;

                u288();
            end);
        end;
    end);
    local u296 = {};
    table.insert(u296, u274.Triggered:Connect(u286));
    table.insert(u296, u274.TriggerEnded:Connect(u287));
    table.insert(u296, u274.PromptButtonHoldBegan:Connect(u292));
    table.insert(u296, u274.PromptButtonHoldEnded:Connect(u288));
    u262[10] = math.random();
    u262[11] = u274;

    u262[12] = function() -- Line: 1142
        -- upvalues: u296 (ref), u287 (ref), u288 (ref), u275 (ref), u274 (ref), u286 (ref), u292 (ref), Fire (ref)
        if u296 then
            for _, v in pairs(u296) do
                if v then
                    v:Disconnect();
                end;
            end;
        end;

        pcall(u287);
        pcall(u288);
        u296 = nil;
        u275 = nil;
        u274 = nil;
        u286 = nil;
        u287 = nil;
        u288 = nil;
        u292 = nil;
        Fire = nil;
    end;

    u19[v267] = u262;
end;

function Main()
    -- upvalues: u3 (ref), u19 (ref), u21 (copy), u22 (ref), ATMCheck (copy), ShopCheck (copy), DoorCheck (copy), CashDropCheck (copy), ScrapDropCheck (copy), ToolDropCheck (copy), VendingCheck (copy), MysteryBoxCheck (copy), GetExtrasCheck (copy), u1 (ref), u18 (copy), u2 (ref), u14 (ref), AddGuiCon (copy)
    if _G.ATM_Active or (_G.Shop_Active or not _G.CheckIfCan(u3, "Any")) then
        for i, v in pairs(u19) do
            local v297 = v[10];
            local v298 = u19[i];

            if v298 then
                if not v297 or v298[10] == v297 then
                    if typeof(v298[12]) == "function" then
                        pcall(v298[12]);
                    end;

                    if v298[11] and v298[11].Parent then
                        v298[11]:Destroy();
                    end;

                    u19[i] = nil;
                end;
            end;
        end;

        for _, v in pairs(u21) do
            local _ = v[1];
            local _ = v[3];
            v[2]();
        end;

        return;
    end;

    if not (u22 and u22.Parent) then
        u22 = _G.GVF();
    end;

    if not u22 then
        return;
    end;

    local function GetInteract() -- Line: 1212
        -- upvalues: ATMCheck (ref), ShopCheck (ref), DoorCheck (ref), CashDropCheck (ref), ScrapDropCheck (ref), ToolDropCheck (ref), VendingCheck (ref), MysteryBoxCheck (ref), GetExtrasCheck (ref), u21 (ref), u1 (ref), u18 (ref)
        local v299 = {
            ATMCheck,
            ShopCheck,
            DoorCheck,
            CashDropCheck,
            ScrapDropCheck,
            ToolDropCheck,
            VendingCheck,
            MysteryBoxCheck,
            GetExtrasCheck
        };
        local v300 = (1 / 0);
        local v301 = {};
        local v302 = nil;
        local v303 = nil;
        local v304 = nil;
        local v305 = nil;
        local v306 = nil;

        for i, v in pairs(u21) do
            local _ = v[2];
            local v307, v308 = v[1]();

            if v307 then
                if v300 >= v308 then
                    v308 = v300;
                end;

                if i:GetAttribute("TOTDoor") then
                    table.insert(v301, i);
                    v300 = v308;
                else
                    v300 = v308;
                end;
            end;
        end;

        for _, v in pairs(v299) do
            local v309, v310 = v();

            if v309 and v309[1] then
                local v311 = v309[1][3];
                local v312 = v311:IsA("Attachment") and v311.WorldPosition or v311.Position;
                local Magnitude = (v312 - u1.Position).Magnitude;
                v309[9] = v;

                if u18[v311] then
                    return v309, v310;
                end;

                if v == DoorCheck then
                    v306 = v310;
                    v303 = v309;
                else
                    v312 = v304;
                end;

                if Magnitude < v300 then
                    v305 = v310;
                    v304 = v312;
                    v302 = v309;
                    v300 = Magnitude;
                else
                    v304 = v312;
                end;
            end;
        end;

        local workspace_CurrentCamera = workspace.CurrentCamera;

        if v302 and (v302[9] == ToolDropCheck and workspace_CurrentCamera) then
            local function Aim(p313) -- Line: 1268
                -- upvalues: workspace_CurrentCamera (copy)
                local v314 = p313 - workspace_CurrentCamera.CFrame.Position;

                return v314.Magnitude > 0 and workspace_CurrentCamera.CFrame.LookVector:Dot(v314.Unit) or 1;
            end;

            local Position = v302[1][3].Position;

            if v303 then
                local v315 = v304 - workspace_CurrentCamera.CFrame.Position;
                local v316 = v315.Magnitude > 0 and (workspace_CurrentCamera.CFrame.LookVector:Dot(v315.Unit) or 1) or 1;
                local v317 = Position - workspace_CurrentCamera.CFrame.Position;

                if (v317.Magnitude > 0 and (workspace_CurrentCamera.CFrame.LookVector:Dot(v317.Unit) or 1) or 1) <= v316 then
                    return v303, v306;
                end;
            end;

            for _, v in ipairs(v301) do
                local Parent = v.Parent;
                local v318;

                if Parent then
                    v318 = Parent:IsA("Attachment") and Parent.WorldPosition or Parent:IsA("BasePart") and Parent.Position;
                else
                    v318 = Parent;
                end;

                if v318 then
                    local v319 = v318 - workspace_CurrentCamera.CFrame.Position;
                    local v320 = v319.Magnitude > 0 and (workspace_CurrentCamera.CFrame.LookVector:Dot(v319.Unit) or 1) or 1;
                    local v321 = Position - workspace_CurrentCamera.CFrame.Position;

                    if (v321.Magnitude > 0 and (workspace_CurrentCamera.CFrame.LookVector:Dot(v321.Unit) or 1) or 1) <= v320 then
                        return nil, nil;
                    end;
                end;
            end;
        end;

        return v302, v305;
    end;

    local v322, v323;

    if u2:GetAttribute("NoInteract") then
        v322 = nil;
        v323 = nil;
    else
        v322, v323 = GetInteract();
    end;

    local v324;

    if v322 then
        v324 = v322[9];
    else
        v324 = v322;
    end;

    local v325 = {};

    if v322 then
        u14 = 2;

        for i = 1, v323 do
            local v326 = v322[i];
            local v327;

            if v326 then
                local _ = v326[1];
                local _ = v326[2];
                local v328 = v326[3];
                local _ = v326[4];
                local _ = v326[5];
                local _ = v326[6];
                local _ = v326[7];
                local _ = v326[8];
                local _ = v326[9];
                v325[v328] = true;

                if u19[v328] and (not u19[v328] or u19[v328][1] == v326[1]) then
                    v327 = i;
                else
                    AddGuiCon(v328, i, v326, v324);
                    v327 = i;
                end;
            else
                v327 = i;
            end;
        end;
    else
        u14 = 1;
    end;

    for i, v in pairs(u19) do
        if not v325[i] then
            local v329 = v[10];
            local v330 = u19[i];

            if v330 then
                if not v329 or v330[10] == v329 then
                    if typeof(v330[12]) == "function" then
                        pcall(v330[12]);
                    end;

                    if v330[11] and v330[11].Parent then
                        v330[11]:Destroy();
                    end;

                    u19[i] = nil;
                end;
            end;
        end;
    end;
end;

local function newChar() -- Line: 1374
    -- upvalues: u3 (ref), LocalPlayer (copy), u19 (ref), u2 (ref), u1 (ref), ReplicatedStorage (copy), u15 (ref), u14 (ref), u16 (ref), u17 (ref), u5 (ref)
    u3 = LocalPlayer.Character;

    if not (u3 and u3.Parent) then
        return;
    end;

    _G.WaitForChar();
    u19 = {};

    if not (u3 and u3.Parent) then
        return;
    end;

    u2 = u3:WaitForChild("Humanoid");
    u1 = u3:WaitForChild("HumanoidRootPart");

    local function newAnim(p331) -- Line: 1387
        -- upvalues: ReplicatedStorage (ref), u2 (ref)
        return u2:LoadAnimation(ReplicatedStorage.Storage.Animations[p331]);
    end;

    u15 = {
        toggle1 = u2:LoadAnimation(ReplicatedStorage.Storage.Animations.Toggle1),
        toggle2 = u2:LoadAnimation(ReplicatedStorage.Storage.Animations.Toggle2),
        pickup1 = u2:LoadAnimation(ReplicatedStorage.Storage.Animations.Pickup1),
        pickup2 = u2:LoadAnimation(ReplicatedStorage.Storage.Animations.Pickup2),
        grabbing1 = u2:LoadAnimation(ReplicatedStorage.Storage.Animations.Grabbing1),
        grabbing2 = u2:LoadAnimation(ReplicatedStorage.Storage.Animations.Grabbing2),
        openloop = u2:LoadAnimation(ReplicatedStorage.Storage.Animations.OpenLoop)
    };
    u15.toggle1.Priority = Enum.AnimationPriority.Action;
    u15.toggle2.Priority = Enum.AnimationPriority.Action;
    u15.pickup1.Priority = Enum.AnimationPriority.Action;
    u15.pickup2.Priority = Enum.AnimationPriority.Action;
    u15.openloop.Priority = Enum.AnimationPriority.Action;
    u15.grabbing1.Priority = Enum.AnimationPriority.Action;
    u15.grabbing2.Priority = Enum.AnimationPriority.Action;
    local u332 = nil;
    local u333 = true;
    u332 = u3.AncestryChanged:Connect(function(p334, p335) -- Line: 1410
        -- upvalues: u333 (ref), u332 (ref)
        if not p335 then
            u333 = nil;
            u332:Disconnect();
        end;
    end);
    u14 = 1;
    u16 = {};
    u17 = {};

    while u333 do
        task.wait(0.05);
        local success, result = pcall(Main);

        if not success then
            warn("IE:", result);
        end;

        u5 = u1.Position;
    end;
end;

(function() -- Line: 1439, Name: SetUp
    -- upvalues: u7 (copy), Map (copy), u6 (copy), u8 (copy), u9 (copy), u10 (copy), u11 (copy), u12 (copy), u13 (copy), Events2 (copy), u20 (copy), CollectionService (copy), MonitorNormalPrompt (copy), LocalPlayer (copy), newChar (copy)
    local function ATM_Setup() -- Line: 1473
        -- upvalues: Map (ref), u6 (ref)
        for _, child in pairs(Map.ATMz:GetChildren()) do
            if child:FindFirstChild("MainPart") then
                table.insert(u6, child.MainPart);
            else
                warn("ATM: Not a MainPart!");
            end;
        end;
    end;

    local function Shop_Setup() -- Line: 1483
        -- upvalues: Map (ref), u8 (ref)
        for _, child in pairs(Map.Shopz:GetChildren()) do
            if child:FindFirstChild("MainPart") then
                table.insert(u8, child.MainPart);
            else
                warn("Shop: Not a MainPart!");
            end;
        end;

        Map.Shopz.ChildAdded:Connect(function(p336) -- Line: 1491
            -- upvalues: u8 (ref)
            if p336:WaitForChild("MainPart", 4) then
                table.insert(u8, p336.MainPart);
            end;
        end);
    end;

    local function Vending_Setup() -- Line: 1499
        -- upvalues: Map (ref), u9 (ref)
        if Map:FindFirstChild("VendingMachines") then
            for _, child in pairs(Map.VendingMachines:GetChildren()) do
                if child:FindFirstChild("MainPart") then
                    table.insert(u9, child.MainPart);
                else
                    warn("VendingMachine: Not a MainPart!");
                end;
            end;
        end;
    end;

    local function Piles_Setup() -- Line: 1511
        -- upvalues: u10 (ref)
        local function newPile(p337) -- Line: 1512
            -- upvalues: u10 (ref)
            task.wait(0.1);

            if p337 and (p337.Parent and (p337.ClassName == "Model" and (p337.PrimaryPart and not p337:GetAttribute("IsLocked")))) then
                local PrimaryPart = p337.PrimaryPart;
                table.insert(u10, PrimaryPart);
                local u338 = nil;
                u338 = PrimaryPart.AncestryChanged:Connect(function(p339, p340) -- Line: 1519
                    -- upvalues: u338 (ref), u10 (ref), PrimaryPart (copy)
                    if not p340 then
                        u338:Disconnect();
                        local table_find_ret = table.find(u10, PrimaryPart);

                        if table_find_ret then
                            table.remove(u10, table_find_ret);
                        end;
                    end;
                end);
            end;
        end;

        workspace.Filter.SpawnedPiles.ChildAdded:Connect(newPile);

        for _, child in pairs(workspace.Filter.SpawnedPiles:GetChildren()) do
            newPile(child);
        end;
    end;

    local function Cash_Setup() -- Line: 1537
        -- upvalues: u11 (ref)
        local function newCash(u341) -- Line: 1538
            -- upvalues: u11 (ref)
            task.wait();

            if u341 and u341.Parent then
                u341:WaitForChild("Value", 60);
            end;

            if u341 and (u341.Parent and u341:FindFirstChild("Value")) then
                table.insert(u11, u341);
                local u342 = nil;
                u342 = u341.AncestryChanged:Connect(function(p343, p344) -- Line: 1547
                    -- upvalues: u342 (ref), u11 (ref), u341 (copy)
                    if not p344 then
                        u342:Disconnect();
                        local table_find_ret = table.find(u11, u341);

                        if table_find_ret then
                            table.remove(u11, table_find_ret);
                        end;
                    end;
                end);
            end;
        end;

        workspace.Filter.SpawnedBread.ChildAdded:Connect(newCash);

        for _, child in pairs(workspace.Filter.SpawnedBread:GetChildren()) do
            newCash(child);
        end;
    end;

    local function Tools_Setup() -- Line: 1565
        -- upvalues: u12 (ref)
        local function newTool(u345) -- Line: 1566
            -- upvalues: u12 (ref)
            if not (u345 and u345:IsA("Model")) then
                return;
            end;

            local u346 = nil;
            local u347 = nil;

            local function drop() -- Line: 1569
                -- upvalues: u347 (ref), u346 (ref), u12 (ref)
                if u347 then
                    u347:Disconnect();
                    u347 = nil;
                end;

                if u346 then
                    local table_find_ret = table.find(u12, u346);

                    if table_find_ret then
                        table.remove(u12, table_find_ret);
                    end;

                    u346 = nil;
                end;
            end;

            local function sync() -- Line: 1582
                -- upvalues: u345 (copy), u346 (ref), u347 (ref), u12 (ref)
                local v348 = u345.Parent and u345.PrimaryPart;

                if v348 and not v348.Parent then
                    v348 = nil;
                end;

                if v348 == u346 then
                    return;
                end;

                if u347 then
                    u347:Disconnect();
                    u347 = nil;
                end;

                if u346 then
                    local table_find_ret = table.find(u12, u346);

                    if table_find_ret then
                        table.remove(u12, table_find_ret);
                    end;

                    u346 = nil;
                end;

                if v348 then
                    u346 = v348;
                    table.insert(u12, v348);
                    u347 = v348.AncestryChanged:Connect(function(p349, p350) -- Line: 1592
                        -- upvalues: u347 (ref), u346 (ref), u12 (ref)
                        if not p350 then
                            if u347 then
                                u347:Disconnect();
                                u347 = nil;
                            end;

                            if u346 then
                                local table_find_ret = table.find(u12, u346);

                                if table_find_ret then
                                    table.remove(u12, table_find_ret);
                                end;

                                u346 = nil;
                            end;
                        end;
                    end);
                end;
            end;

            local u351 = u345:GetPropertyChangedSignal("PrimaryPart"):Connect(sync);
            local u352 = nil;
            u352 = u345.AncestryChanged:Connect(function(p353, p354) -- Line: 1601
                -- upvalues: u351 (copy), u352 (ref), u347 (ref), u346 (ref), u12 (ref), sync (copy)
                if p354 then
                    sync();
                else
                    u351:Disconnect();
                    u352:Disconnect();

                    if u347 then
                        u347:Disconnect();
                        u347 = nil;
                    end;

                    if u346 then
                        local table_find_ret = table.find(u12, u346);

                        if table_find_ret then
                            table.remove(u12, table_find_ret);
                        end;

                        u346 = nil;
                    end;
                end;
            end);
            sync();
        end;

        workspace.Filter.SpawnedTools.ChildAdded:Connect(newTool);

        for _, child in pairs(workspace.Filter.SpawnedTools:GetChildren()) do
            newTool(child);
        end;
    end;

    local function Mystery_SetUp() -- Line: 1619
        -- upvalues: Map (ref), u13 (ref)
        if Map:WaitForChild("MysteryBoxes", 2) then
            local function newBox(p355) -- Line: 1621
                -- upvalues: u13 (ref)
                if p355:WaitForChild("MainPart", 5) then
                    table.insert(u13, p355.MainPart);

                    return;
                end;

                warn("MysteryBox: Not a MainPart!");
            end;

            for _, child in pairs(Map.MysteryBoxes:GetChildren()) do
                task.spawn(function() -- Line: 1630
                    -- upvalues: child (copy), u13 (ref)
                    local v356 = child;

                    if v356:WaitForChild("MainPart", 5) then
                        table.insert(u13, v356.MainPart);

                        return;
                    end;

                    warn("MysteryBox: Not a MainPart!");
                end);
            end;

            Map.MysteryBoxes.ChildAdded:Connect(newBox);
        end;
    end;

    (function() -- Line: 1440, Name: Door_Setup
        -- upvalues: u7 (ref), Map (ref)
        local function x_d(p357) -- Line: 1441
            -- upvalues: u7 (ref)
            if p357:WaitForChild("DFrame", 2) == nil then
                warn("No DFrame in door!");

                return;
            end;

            local DFrame = p357.DFrame;
            table.insert(u7, DFrame);
            local u358 = nil;
            u358 = DFrame.AncestryChanged:Connect(function(p359, p360) -- Line: 1448
                -- upvalues: u358 (ref), u7 (ref), DFrame (copy)
                if not p360 then
                    u358:Disconnect();

                    for i, v in pairs(u7) do
                        if v == DFrame then
                            table.remove(u7, i);
                        end;
                    end;
                end;
            end);
        end;

        for _, child in pairs(Map.Doors:GetChildren()) do
            spawn(function() -- Line: 1466
                -- upvalues: x_d (copy), child (copy)
                x_d(child);
            end);
        end;

        Map.Doors.ChildAdded:Connect(x_d);
    end)();
    ATM_Setup();
    Shop_Setup();
    Piles_Setup();
    Cash_Setup();
    Tools_Setup();
    Vending_Setup();
    spawn(Mystery_SetUp);
    Events2.AddExtraInteract.Event:Connect(function(u361, p362, p363, p364, p365, p366) -- Line: 1648
        -- upvalues: u20 (ref)
        if not (u361 and u361:IsA("BasePart") or u20[u361]) then
            return;
        end;

        u20[u361] = {
            u361,
            p362,
            p363,
            p364,
            p365,
            p366
        };
        local u367 = nil;
        u367 = u361.AncestryChanged:Connect(function(p368, p369) -- Line: 1654
            -- upvalues: u20 (ref), u361 (copy), u367 (ref)
            if not p369 then
                u20[u361] = nil;
                u367:Disconnect();
            end;
        end);
    end);
    CollectionService:GetInstanceAddedSignal("ProximityPrompt"):Connect(function(p370) -- Line: 1662
        -- upvalues: MonitorNormalPrompt (ref)
        MonitorNormalPrompt(p370);
    end);

    for _, v in pairs(CollectionService:GetTagged("ProximityPrompt")) do
        MonitorNormalPrompt(v);
    end;

    LocalPlayer.CharacterAdded:Connect(newChar);
    task.spawn(newChar);
end)();

return nil;
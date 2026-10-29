-- ============================================================
-- SCRIPT: RotatedRegion3
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Services.RotatedRegion3
-- ============================================================

-- Decompiled with Potassium's decompiler.

local GJK = require(script:WaitForChild("GJK"));
local Supports = require(script:WaitForChild("Supports"));
local Vertices = require(script:WaitForChild("Vertices"));
local u1 = {};
u1.__index = u1;

local function getCorners(p2, p3) -- Line: 86
    return {
        p2:PointToWorldSpace((Vector3.new(-p3.x, p3.y, p3.z))),
        p2:PointToWorldSpace((Vector3.new(-p3.x, -p3.y, p3.z))),
        p2:PointToWorldSpace((Vector3.new(-p3.x, -p3.y, -p3.z))),
        p2:PointToWorldSpace((Vector3.new(p3.x, -p3.y, -p3.z))),
        p2:PointToWorldSpace((Vector3.new(p3.x, p3.y, -p3.z))),
        p2:PointToWorldSpace((Vector3.new(p3.x, p3.y, p3.z))),
        p2:PointToWorldSpace((Vector3.new(p3.x, -p3.y, p3.z))),
        p2:PointToWorldSpace((Vector3.new(-p3.x, p3.y, -p3.z)))
    };
end;

local function worldBoundingBox(p4) -- Line: 99
    local v5 = {};
    local v6 = {};
    local v7 = {};

    for i = 1, #p4 do
        local y = p4[i].y;
        local z = p4[i].z;
        v5[i] = p4[i].x;
        v6[i] = y;
        v7[i] = z;
        local _ = i;
    end;

    local math_min_ret = math.min(unpack(v5));
    local math_min_ret2 = math.min(unpack(v6));
    local math_min_ret3 = math.min(unpack(v7));
    local Vector3_new_ret = Vector3.new(math_min_ret, math_min_ret2, math_min_ret3);
    local math_max_ret = math.max(unpack(v5));
    local math_max_ret2 = math.max(unpack(v6));
    local math_max_ret3 = math.max(unpack(v7));

    return Vector3_new_ret, Vector3.new(math_max_ret, math_max_ret2, math_max_ret3);
end;

function u1.new(p8, p9) -- Line: 109
    -- upvalues: u1 (copy), Vertices (copy), Supports (copy), worldBoundingBox (copy)
    local v10 = setmetatable({}, u1);
    v10.CFrame = p8;
    v10.Size = p9;
    v10.Shape = "Block";
    v10.Set = Vertices.Block(p8, p9 / 2);
    v10.Support = Supports.PointCloud;
    v10.Centroid = p8.p;
    v10.AlignedRegion3 = Region3.new(worldBoundingBox(v10.Set));

    return v10;
end;

u1.Block = u1.new;

function u1.Wedge(p11, p12) -- Line: 127
    -- upvalues: u1 (copy), Vertices (copy), Supports (copy), worldBoundingBox (copy)
    local v13 = setmetatable({}, u1);
    v13.CFrame = p11;
    v13.Size = p12;
    v13.Shape = "Wedge";
    v13.Set = Vertices.Wedge(p11, p12 / 2);
    v13.Support = Supports.PointCloud;
    v13.Centroid = Vertices.GetCentroid(v13.Set);
    v13.AlignedRegion3 = Region3.new(worldBoundingBox(v13.Set));

    return v13;
end;

function u1.CornerWedge(p14, p15) -- Line: 143
    -- upvalues: u1 (copy), Vertices (copy), Supports (copy), worldBoundingBox (copy)
    local v16 = setmetatable({}, u1);
    v16.CFrame = p14;
    v16.Size = p15;
    v16.Shape = "CornerWedge";
    v16.Set = Vertices.CornerWedge(p14, p15 / 2);
    v16.Support = Supports.PointCloud;
    v16.Centroid = Vertices.GetCentroid(v16.Set);
    v16.AlignedRegion3 = Region3.new(worldBoundingBox(v16.Set));

    return v16;
end;

function u1.Cylinder(p17, p18) -- Line: 159
    -- upvalues: u1 (copy), Supports (copy), worldBoundingBox (copy), getCorners (copy)
    local v19 = setmetatable({}, u1);
    v19.CFrame = p17;
    v19.Size = p18;
    v19.Shape = "Cylinder";
    v19.Set = { p17, p18 / 2 };
    v19.Support = Supports.Cylinder;
    v19.Centroid = p17.p;
    v19.AlignedRegion3 = Region3.new(worldBoundingBox((getCorners(unpack(v19.Set)))));

    return v19;
end;

function u1.Ball(p20, p21) -- Line: 175
    -- upvalues: u1 (copy), Supports (copy), worldBoundingBox (copy), getCorners (copy)
    local v22 = setmetatable({}, u1);
    v22.CFrame = p20;
    v22.Size = p21;
    v22.Shape = "Ball";
    v22.Set = { p20, p21 / 2 };
    v22.Support = Supports.Ellipsoid;
    v22.Centroid = p20.p;
    v22.AlignedRegion3 = Region3.new(worldBoundingBox((getCorners(unpack(v22.Set)))));

    return v22;
end;

function u1.FromPart(p23) -- Line: 191
    -- upvalues: u1 (copy), Vertices (copy)
    return u1[Vertices.Classify(p23)](p23.CFrame, p23.Size);
end;

function u1.CastPoint(p24, p25) -- Line: 197
    -- upvalues: GJK (copy), Supports (copy)
    return GJK.new(p24.Set, { p25 }, p24.Centroid, p25, p24.Support, Supports.PointCloud):IsColliding();
end;

function u1.CastPart(p26, p27) -- Line: 202
    -- upvalues: u1 (copy), GJK (copy)
    local v28 = u1.FromPart(p27);

    return GJK.new(p26.Set, v28.Set, p26.Centroid, v28.Centroid, p26.Support, v28.Support):IsColliding();
end;

function u1.FindPartsInRegion3(p29, p30, p31) -- Line: 208
    local v32 = workspace:FindPartsInRegion3(p29.AlignedRegion3, p30, p31);
    local v33 = {};

    for i = 1, #v32 do
        local v34;

        if p29:CastPart(v32[i]) then
            table.insert(v33, v32[i]);
            v34 = i;
        else
            v34 = i;
        end;
    end;

    return v33;
end;

function u1.FindPartsInRegion3WithIgnoreList(p35, p36, p37) -- Line: 219
    local v38 = workspace:FindPartsInRegion3WithIgnoreList(p35.AlignedRegion3, p36 or {}, p37);
    local v39 = {};

    for i = 1, #v38 do
        local v40;

        if p35:CastPart(v38[i]) then
            table.insert(v39, v38[i]);
            v40 = i;
        else
            v40 = i;
        end;
    end;

    return v39;
end;

function u1.FindPartsInRegion3WithWhiteList(p41, p42, p43) -- Line: 231
    local v44 = workspace:FindPartsInRegion3WithWhiteList(p41.AlignedRegion3, p42 or {}, p43);
    local v45 = {};

    for i = 1, #v44 do
        local v46;

        if p41:CastPart(v44[i]) then
            table.insert(v45, v44[i]);
            v46 = i;
        else
            v46 = i;
        end;
    end;

    return v45;
end;

function u1.Cast(p47, p48, p49) -- Line: 243
    return p47:FindPartsInRegion3WithIgnoreList(type(p48) == "table" and p48 and p48 or { p48 }, p49);
end;

return u1;
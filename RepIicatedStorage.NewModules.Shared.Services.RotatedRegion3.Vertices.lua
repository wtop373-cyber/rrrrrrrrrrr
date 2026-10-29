-- ============================================================
-- SCRIPT: Vertices
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Services.RotatedRegion3.Vertices
-- ============================================================

-- Decompiled with Potassium's decompiler.

local u1 = { Vector3.new(1, 1, 1), Vector3.new(-1, 1, 1), Vector3.new(-1, 1, -1), Vector3.new(1, 1, -1), Vector3.new(1, -1, 1), Vector3.new(-1, -1, 1), Vector3.new(-1, -1, -1), Vector3.new(1, -1, -1) };
local v2 = { 1, 2, 3, 4, 5, 6, 7, 8 };

local function fromIndexArray(p3) -- Line: 32
    -- upvalues: u1 (copy)
    local v4 = {};

    for i = 1, #p3 do
        v4[i] = u1[p3[i]];
        local _ = i;
    end;

    return v4;
end;

local u5 = {};
local v6 = { 1, 2, 5, 6, 7, 8 };
local v7 = { 4, 5, 6, 7, 8 };

local function cylinder(p8) -- Line: 40
    local v9 = 6.283185307179586 / p8;
    local v10 = {};

    for i = 1, p8 do
        local v11 = CFrame.fromAxisAngle(Vector3.new(1, 0, 0), i * v9) * Vector3.new(0, 1, 0);
        v10[i] = Vector3.new(1, 0, 0) + v11;
        v10[p8 + i] = Vector3.new(-1, 0, 0) + v11;
        local _ = i;
    end;

    return v10;
end;

local function icoSphere(p12) -- Line: 51
    local u13 = { Vector3.new(-1, 1.618034, 0), Vector3.new(1, 1.618034, 0), Vector3.new(-1, -1.618034, 0), Vector3.new(1, -1.618034, 0), Vector3.new(0, -1, 1.618034), Vector3.new(0, 1, 1.618034), Vector3.new(0, -1, -1.618034), Vector3.new(0, 1, -1.618034), Vector3.new(1.618034, 0, -1), Vector3.new(1.618034, 0, 1), Vector3.new(-1.618034, 0, -1), Vector3.new(-1.618034, 0, 1) };
    local u14 = {};

    local function split(p15, p16) -- Line: 97
        -- upvalues: u14 (copy), u13 (copy)
        local v17 = p15 < p16 and p15 .. "," .. p16 or p16 .. "," .. p15;

        if not u14[v17] then
            u13[#u13 + 1] = (u13[p15] + u13[p16]) / 2;
            u14[v17] = #u13;
        end;

        return u14[v17];
    end;

    local v18 = { 1, 12, 6, 1, 6, 2, 1, 2, 8, 1, 8, 11, 1, 11, 12, 2, 6, 10, 6, 12, 5, 12, 11, 3, 11, 8, 7, 8, 2, 9, 4, 10, 5, 4, 5, 3, 4, 3, 7, 4, 7, 9, 4, 9, 10, 5, 10, 6, 3, 5, 12, 7, 3, 11, 9, 7, 8, 10, 9, 2 };

    for i = 1, p12 do
        local _ = i;

        for i2 = #v18, 1, -3 do
            local v19 = v18[i2 - 2];
            local v20 = v18[i2 - 1];
            local v21 = v18[i2];
            local v22 = v19 < v20 and v19 .. "," .. v20 or v20 .. "," .. v19;

            if not u14[v22] then
                u13[#u13 + 1] = (u13[v19] + u13[v20]) / 2;
                u14[v22] = #u13;
            end;

            local v23 = u14[v22];
            local v24 = v20 < v21 and v20 .. "," .. v21 or v21 .. "," .. v20;

            if not u14[v24] then
                u13[#u13 + 1] = (u13[v20] + u13[v21]) / 2;
                u14[v24] = #u13;
            end;

            local v25 = u14[v24];
            local v26 = v21 < v19 and v21 .. "," .. v19 or v19 .. "," .. v21;

            if not u14[v26] then
                u13[#u13 + 1] = (u13[v21] + u13[v19]) / 2;
                u14[v26] = #u13;
            end;

            local v27 = u14[v26];
            v18[#v18 + 1] = v19;
            v18[#v18 + 1] = v23;
            v18[#v18 + 1] = v27;
            v18[#v18 + 1] = v20;
            v18[#v18 + 1] = v25;
            v18[#v18 + 1] = v23;
            v18[#v18 + 1] = v21;
            v18[#v18 + 1] = v27;
            v18[#v18 + 1] = v25;
            v18[#v18 + 1] = v23;
            v18[#v18 + 1] = v25;
            v18[#v18 + 1] = v27;
            table.remove(v18, i2);
            table.remove(v18, i2 - 1);
            table.remove(v18, i2 - 2);
            local _ = i2;
        end;
    end;

    for i = 1, #u13 do
        u13[i] = u13[i].Unit;
        local _ = i;
    end;

    return u13;
end;

local function vertShape(p28, p29, p30) -- Line: 147
    local v31 = {};

    for i = 1, #p30 do
        v31[i] = p28:PointToWorldSpace(p30[i] * p29);
        local _ = i;
    end;

    return v31;
end;

local function getCentroidFromSet(p32) -- Line: 155
    local v33 = p32[1];

    for i = 2, #p32 do
        v33 = v33 + p32[2];
        local _ = i;
    end;

    return v33 / #p32;
end;

local function classify(p34) -- Line: 163
    if p34.ClassName == "Part" then
        if p34.Shape == Enum.PartType.Block then
            return "Block";
        end;

        if p34.Shape == Enum.PartType.Cylinder then
            return "Cylinder";
        end;

        if p34.Shape == Enum.PartType.Ball then
            return "Ball";
        end;
    else
        if p34.ClassName == "WedgePart" then
            return "Wedge";
        end;

        if p34.ClassName == "CornerWedgePart" then
            return "CornerWedge";
        end;

        if p34:IsA("BasePart") then
            return "Block";
        end;
    end;
end;

for i = 1, #v2 do
    u5[i] = u1[v2[i]];
    local _ = i;
end;

local u35 = {};

for i = 1, #v6 do
    u35[i] = u1[v6[i]];
    local _ = i;
end;

local u36 = {};

for i = 1, #v7 do
    u36[i] = u1[v7[i]];
    local _ = i;
end;

local u37 = cylinder(20);
local u38 = icoSphere(2);

return {
    Block = function(p39, p40) -- Line: 190, Name: Block
        -- upvalues: vertShape (copy), u5 (copy)
        return vertShape(p39, p40, u5);
    end,

    Wedge = function(p41, p42) -- Line: 191, Name: Wedge
        -- upvalues: vertShape (copy), u35 (copy)
        return vertShape(p41, p42, u35);
    end,

    CornerWedge = function(p43, p44) -- Line: 192, Name: CornerWedge
        -- upvalues: vertShape (copy), u36 (copy)
        return vertShape(p43, p44, u36);
    end,

    Cylinder = function(p45, p46) -- Line: 193, Name: Cylinder
        -- upvalues: vertShape (copy), u37 (copy)
        return vertShape(p45, p46, u37);
    end,

    Ball = function(p47, p48) -- Line: 194, Name: Ball
        -- upvalues: vertShape (copy), u38 (copy)
        return vertShape(p47, p48, u38);
    end,

    GetCentroid = getCentroidFromSet,
    Classify = classify
};
-- ============================================================
-- SCRIPT: GJK
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Services.RotatedRegion3.GJK
-- ============================================================

-- Decompiled with Potassium's decompiler.

local u1 = {};
u1.__index = u1;

local function tripleProduct(p2, p3, p4) -- Line: 11
    return p3 * p4:Dot(p2) - p2 * p4:Dot(p3);
end;

local function containsOrigin(p5, p6, p7) -- Line: 15
    local v8 = p6[#p6];
    local v9 = -v8;
    local v10;

    if #p6 == 4 then
        local v11 = p6[3] - v8;
        local v12 = p6[2] - v8;
        local v13 = p6[1] - v8;
        v10 = v11:Cross(v12);
        local v14 = v12:Cross(v13);
        local v15 = v13:Cross(v11);

        if v10:Dot(v13) > 0 then
            v10 = -v10 or v10;
        end;

        if v14:Dot(v11) > 0 then
            v14 = -v14 or v14;
        end;

        if v15:Dot(v12) > 0 then
            v15 = -v15 or v15;
        end;

        if v10:Dot(v9) > 0 then
            table.remove(p6, 1);
        elseif v14:Dot(v9) > 0 then
            table.remove(p6, 2);
            v10 = v14;
        else
            if v15:Dot(v9) <= 0 then
                return true;
            end;

            table.remove(p6, 3);
            v10 = v15;
        end;
    elseif #p6 == 3 then
        local v16 = p6[2] - v8;
        local v17 = p6[1] - v8;
        local v18 = v16:Cross(v17);
        v10 = (v16 * v16:Dot(v17) - v17 * v16:Dot(v16)).Unit;
        local Unit = (v17 * v17:Dot(v16) - v16 * v17:Dot(v17)).Unit;

        if v10:Dot(v9) > 0 then
            table.remove(p6, 1);
        elseif Unit:Dot(v9) > 0 then
            table.remove(p6, 2);
            v10 = Unit;
        else
            if v8 - v8 ~= Vector3.new(0, 0, 0) then
                return true;
            end;

            v10 = v18:Dot(v9) > 0 and v18 and v18 or -v18;
        end;
    else
        local v19 = p6[1] - v8;
        v10 = (v9 * v19:Dot(v19) - v19 * v19:Dot(v9)).Unit;
    end;

    return false, v10;
end;

function u1.new(p20, p21, p22, p23, p24, p25) -- Line: 74
    -- upvalues: u1 (copy)
    local v26 = setmetatable({}, u1);
    v26.SetA = p20;
    v26.SetB = p21;
    v26.CentroidA = p22;
    v26.CentroidB = p23;
    v26.SupportA = p24;
    v26.SupportB = p25;

    return v26;
end;

function u1.IsColliding(p27) -- Line: 89
    -- upvalues: containsOrigin (copy)
    local Unit = (p27.CentroidA - p27.CentroidB).Unit;
    local v28 = { p27.SupportA(p27.SetA, Unit) - p27.SupportB(p27.SetB, -Unit) };
    local v29 = -Unit;

    for i = 1, 20 do
        local v30 = p27.SupportA(p27.SetA, v29) - p27.SupportB(p27.SetB, -v29);
        table.insert(v28, v30);

        if v28[#v28]:Dot(v29) <= 0 then
            return false;
        end;

        local v31;
        v31, v29 = containsOrigin(p27, v28, v29);

        if v31 then
            return true;
        end;

        local _ = i;
    end;

    return false;
end;

return u1;
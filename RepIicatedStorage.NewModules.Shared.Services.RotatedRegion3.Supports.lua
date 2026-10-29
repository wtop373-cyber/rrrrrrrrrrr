-- ============================================================
-- SCRIPT: Supports
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Services.RotatedRegion3.Supports
-- ============================================================

-- Decompiled with Potassium's decompiler.

local function rayPlane(p1, p2, p3, p4) -- Line: 6
    local v5 = -(p1 - p3):Dot(p4) / p2:Dot(p4);

    return p1 + v5 * p2, v5;
end;

return {
    PointCloud = function(p6, p7) -- Line: 16, Name: PointCloud
        local v8 = p6[1];
        local v9 = p6[1]:Dot(p7);

        for i = 2, #p6 do
            local v10 = p6[i]:Dot(p7);
            local v11;

            if v9 < v10 then
                v8 = p6[i];
                v9 = v10;
                v11 = i;
            else
                v11 = i;
            end;
        end;

        return v8;
    end,

    Cylinder = function(p12, p13) -- Line: 28, Name: Cylinder
        local v14, v15 = unpack(p12);
        local v16 = v14:VectorToObjectSpace(p13);
        local math_min_ret = math.min(v15.y, v15.z);
        local v17 = v16:Dot(Vector3.new(1, 0, 0));
        local Vector3_new_ret = Vector3.new(v15.x, 0, 0);
        local v18;

        if v17 == 0 then
            v18 = v16.Unit * math_min_ret;
        else
            local v19 = v17 > 0 and Vector3_new_ret and Vector3_new_ret or -Vector3_new_ret;
            v18 = v19 + (Vector3.new(0, 0, 0) + -(Vector3.new(0, 0, 0) - v19):Dot(Vector3.new(1, 0, 0)) / v16:Dot(Vector3.new(1, 0, 0)) * v16 - v19).Unit * math_min_ret;
        end;

        return v14:PointToWorldSpace(v18);
    end,

    Ellipsoid = function(p20, p21) -- Line: 46, Name: Ellipsoid
        local v22, v23 = unpack(p20);

        return v22:PointToWorldSpace(v23 * (v23 * v22:VectorToObjectSpace(p21)).Unit);
    end
};
-- ============================================================
-- SCRIPT: GetDrops
-- CLASS:  ModuleScript
-- PATH:   GetDrops
-- ============================================================

-- Decompiled with Potassium's decompiler.

return function(p1, p2, u3, p4, p5, p6, p7) -- Line: 1
    if not (p1 and p1.Parent) then
        return;
    end;

    local v8 = p1.Position + Vector3.new(0, p5, 0);
    local v9 = v8 - Vector3.new(p4, p6 or p4 / 2, p4);
    local v10 = v8 + Vector3.new(p4, p6 or p4 / 2, p4);
    local Region3_new_ret = Region3.new(v9, v10);
    local v11 = #p2 <= 0 and {} or workspace:FindPartsInRegion3WithWhiteList(Region3_new_ret, p2, 30, true);

    if #v11 <= 0 then
        return;
    end;

    if p7 then
        local v12 = {};

        for _, v in pairs(v11) do
            if v.CanQuery or u3[v] then
                table.insert(v12, v);
            end;
        end;

        local Position = p1.Position;
        table.sort(v12, function(p13, p14) -- Line: 22
            -- upvalues: u3 (copy), Position (copy)
            if u3[p13] ~= nil == (u3[p14] ~= nil) then
                return (Position - p13.Position).Magnitude < (Position - p14.Position).Magnitude;
            end;

            return u3[p13] ~= nil;
        end);

        return v12;
    end;

    local v15 = (1 / 0);
    local v16 = nil;

    for _, v in pairs(v11) do
        local Magnitude = (p1.Position - v.Position).Magnitude;

        if v.CanQuery and Magnitude < v15 or u3[v] then
            if u3[v] then
                v16 = v;
                break;
            end;

            v16 = v;
            v15 = Magnitude;
        end;
    end;

    return v16;
end;
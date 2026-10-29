-- ============================================================
-- SCRIPT: GetMP
-- CLASS:  ModuleScript
-- PATH:   GetMP
-- ============================================================

-- Decompiled with Potassium's decompiler.

return function(p1, p2, p3) -- Line: 1
    if not (p1 and p1.Parent) then
        return;
    end;

    local Region3_new_ret = Region3.new(p1.Position - Vector3.new(4, 2, 4), p1.Position + Vector3.new(4, 2, 4));
    local v4 = #p2 <= 0 and {} or workspace:FindPartsInRegion3WithWhiteList(Region3_new_ret, p2, 5, true);

    if #v4 <= 0 then
        return;
    end;

    local v5 = (1 / 0);
    local v6 = nil;

    for _, v in pairs(v4) do
        local Magnitude = (p1.Position - v.Position).Magnitude;

        if Magnitude < v5 or p3[v] then
            if p3[v] then
                v6 = v;
                break;
            end;

            v6 = v;
            v5 = Magnitude;
        end;
    end;

    return v6;
end;
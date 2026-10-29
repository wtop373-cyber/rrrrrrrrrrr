-- ============================================================
-- SCRIPT: ColorHueAdjuster
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Extensions.ColorHueAdjuster
-- ============================================================

-- Decompiled with Potassium's decompiler.

return function(p1, p2) -- Line: 1
    local u3, _, _ = p2:ToHSV();

    local function Adjust(p4) -- Line: 4
        -- upvalues: u3 (copy)
        local _, v5, v6 = p4:ToHSV();

        return Color3.fromHSV(u3, v5, v6);
    end;

    if typeof(p1) ~= "ColorSequence" then
        return Adjust(p1);
    end;

    local v7 = {};

    for _, v in pairs(p1.Keypoints) do
        table.insert(v7, ColorSequenceKeypoint.new(v.Time, Adjust(v.Value)));
    end;

    return ColorSequence.new(v7);
end;
-- ============================================================
-- SCRIPT: StyleSheet
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Services.SBPView.StyleSheet
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
local u2 = {};
u2.__index = u2;

function u2.new(p3) -- Line: 6
    -- upvalues: u2 (copy)
    return setmetatable(p3, u2);
end;

function u2.bindFromProps(p4) -- Line: 10
    local v5 = {};

    for i, v in pairs(p4) do
        local v6 = i;
        local v7 = {};

        for _, v2 in ipairs(v) do
            v7[v2] = v6[v2];
        end;

        v5[v6] = v7;
    end;

    return v5;
end;

function u2.applyBindingProps(p8) -- Line: 22
    for i, v in pairs(p8) do
        local v9 = i;

        for i2, v2 in pairs(v) do
            v9[i2] = v2;
        end;
    end;
end;

function u2.Clone(p10) -- Line: 30
    -- upvalues: u2 (copy)
    local v11 = {};

    for i, v in pairs(p10) do
        v11[i] = table.clone(v);
    end;

    return setmetatable(v11, u2);
end;

function u2.Union(p12, p13) -- Line: 38
    for i, v in pairs(p13) do
        local v14 = p12[i];

        if v14 then
            for i2, v2 in pairs(v) do
                v14[i2] = v2;
            end;
        else
            p12[i] = table.clone(v);
        end;
    end;

    return p12;
end;

function u2.Bind(p15, p16) -- Line: 52
    local v17 = {};

    for i, v in pairs(p16) do
        v17[v] = p15[i];
    end;

    return v17;
end;

function u2.Apply(p18, p19) -- Line: 60
    for i, v in pairs(p19) do
        local v20 = p18[i];

        if v20 then
            local v21 = v;

            for i2, v2 in pairs(v20) do
                v21[i2] = v2;
            end;
        end;
    end;
end;

return u2;
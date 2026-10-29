-- ============================================================
-- SCRIPT: Table
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Services.FastCastRedux.Table
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Random_new_ret = Random.new();
local l_table = table;
local u1 = {};

function u1.contains(p2, p3) -- Line: 24
    -- upvalues: u1 (copy)
    return u1.indexOf(p2, p3) ~= nil;
end;

function u1.indexOf(p4, p5) -- Line: 29
    -- upvalues: u1 (copy)
    return table.find(p4, p5) or u1.keyOf(p4, p5);
end;

function u1.keyOf(p6, p7) -- Line: 38
    for i, v in pairs(p6) do
        if v == p7 then
            return i;
        end;
    end;

    return nil;
end;

function u1.skip(p8, p9) -- Line: 48
    return table.move(p8, p9 + 1, #p8, 1, table.create(#p8 - p9));
end;

function u1.take(p10, p11) -- Line: 53
    return table.move(p10, 1, p11, 1, table.create(p11));
end;

function u1.range(p12, p13, p14) -- Line: 58
    return table.move(p12, p13, p14, 1, table.create(p14 - p13 + 1));
end;

function u1.skipAndTake(p15, p16, p17) -- Line: 63
    return table.move(p15, p16 + 1, p16 + p17, 1, table.create(p17));
end;

function u1.random(p18) -- Line: 68
    -- upvalues: Random_new_ret (copy)
    return p18[Random_new_ret:NextInteger(1, #p18)];
end;

function u1.join(p19, p20) -- Line: 73
    local table_create_ret = table.create(#p19 + #p20);
    table.move(p19, 1, #p19, 1, table_create_ret);

    return table.move(p20, 1, #p20, #p19 + 1, table_create_ret);
end;

function u1.removeObject(p21, p22) -- Line: 80
    -- upvalues: u1 (copy)
    local v23 = u1.indexOf(p21, p22);

    if v23 then
        table.remove(p21, v23);
    end;
end;

return setmetatable({}, {
    __index = function(p24, p25) -- Line: 88, Name: __index
        -- upvalues: u1 (copy), l_table (copy)
        if u1[p25] == nil then
            return l_table[p25];
        end;

        return u1[p25];
    end,

    __newindex = function(p26, p27, p28) -- Line: 96, Name: __newindex
        error("Add new table entries by editing the Module itself.");
    end
});
-- ============================================================
-- SCRIPT: FiOne
-- CLASS:  ModuleScript
-- PATH:   .Shared.FiOne
-- ============================================================

-- Decompiled with Potassium's decompiler.

local l_bit32 = bit32;
local u1 = table.unpack or unpack;
local u2 = nil;
local u3 = nil;
local u4 = {
    [22] = 18,
    [31] = 8,
    [33] = 28,
    [0] = 3,
    [1] = 13,
    [2] = 23,
    [26] = 33,
    [12] = 1,
    [13] = 6,
    [14] = 10,
    [15] = 16,
    [16] = 20,
    [17] = 26,
    [18] = 30,
    [19] = 36,
    [3] = 0,
    [4] = 2,
    [5] = 4,
    [6] = 7,
    [7] = 9,
    [8] = 12,
    [9] = 14,
    [10] = 17,
    [20] = 19,
    [21] = 22,
    [23] = 24,
    [24] = 27,
    [25] = 29,
    [27] = 32,
    [32] = 34,
    [34] = 37,
    [11] = 5,
    [28] = 11,
    [29] = 15,
    [30] = 21,
    [35] = 25,
    [36] = 31,
    [37] = 35
};
local u5 = { "ABC", "ABx", "ABC", "ABC", "ABC", "ABx", "ABC", "ABx", "ABC", "ABC", "ABC", "ABC", "ABC", "ABC", "ABC", "ABC", "ABC", "ABC", "ABC", "ABC", "ABC", "ABC", "AsBx", "ABC", "ABC", "ABC", "ABC", "ABC", "ABC", "ABC", "ABC", "AsBx", "AsBx", "ABC", "ABC", "ABC", "ABx", "ABC" };
local u6 = {
    {
        b = "OpArgR",
        c = "OpArgN"
    },
    {
        b = "OpArgK",
        c = "OpArgN"
    },
    {
        b = "OpArgU",
        c = "OpArgU"
    },
    {
        b = "OpArgR",
        c = "OpArgN"
    },
    {
        b = "OpArgU",
        c = "OpArgN"
    },
    {
        b = "OpArgK",
        c = "OpArgN"
    },
    {
        b = "OpArgR",
        c = "OpArgK"
    },
    {
        b = "OpArgK",
        c = "OpArgN"
    },
    {
        b = "OpArgU",
        c = "OpArgN"
    },
    {
        b = "OpArgK",
        c = "OpArgK"
    },
    {
        b = "OpArgU",
        c = "OpArgU"
    },
    {
        b = "OpArgR",
        c = "OpArgK"
    },
    {
        b = "OpArgK",
        c = "OpArgK"
    },
    {
        b = "OpArgK",
        c = "OpArgK"
    },
    {
        b = "OpArgK",
        c = "OpArgK"
    },
    {
        b = "OpArgK",
        c = "OpArgK"
    },
    {
        b = "OpArgK",
        c = "OpArgK"
    },
    {
        b = "OpArgK",
        c = "OpArgK"
    },
    {
        b = "OpArgR",
        c = "OpArgN"
    },
    {
        b = "OpArgR",
        c = "OpArgN"
    },
    {
        b = "OpArgR",
        c = "OpArgN"
    },
    {
        b = "OpArgR",
        c = "OpArgR"
    },
    {
        b = "OpArgR",
        c = "OpArgN"
    },
    {
        b = "OpArgK",
        c = "OpArgK"
    },
    {
        b = "OpArgK",
        c = "OpArgK"
    },
    {
        b = "OpArgK",
        c = "OpArgK"
    },
    {
        b = "OpArgR",
        c = "OpArgU"
    },
    {
        b = "OpArgR",
        c = "OpArgU"
    },
    {
        b = "OpArgU",
        c = "OpArgU"
    },
    {
        b = "OpArgU",
        c = "OpArgU"
    },
    {
        b = "OpArgU",
        c = "OpArgN"
    },
    {
        b = "OpArgR",
        c = "OpArgN"
    },
    {
        b = "OpArgR",
        c = "OpArgN"
    },
    {
        b = "OpArgN",
        c = "OpArgU"
    },
    {
        b = "OpArgU",
        c = "OpArgU"
    },
    {
        b = "OpArgN",
        c = "OpArgN"
    },
    {
        b = "OpArgU",
        c = "OpArgN"
    },
    {
        b = "OpArgU",
        c = "OpArgN"
    }
};

local function rd_int_basic(p7, p8, p9, p10) -- Line: 147
    local v11 = 0;

    for i = p8, p9, p10 do
        v11 = v11 + string.byte(p7, i, i) * 256 ^ (i - p8);
        local _ = i;
    end;

    return v11;
end;

local function rd_flt_basic(p12, p13, p14, p15) -- Line: 162
    -- upvalues: l_bit32 (copy)
    local v16 = (-1) ^ l_bit32.rshift(p15, 7);
    local v17 = l_bit32.rshift(p14, 7);
    local v18 = l_bit32.band(p15, 127);
    local v19 = v17 + l_bit32.lshift(v18, 1);
    local v20 = p12 + l_bit32.lshift(p13, 8);
    local v21 = l_bit32.band(p14, 127);
    local v22 = v20 + l_bit32.lshift(v21, 16);
    local v23 = 1;

    if v19 == 0 then
        if v22 == 0 then
            return v16 * 0;
        end;

        v19 = 1;
        v23 = 0;
    elseif v19 == 127 then
        if v22 == 0 then
            return v16 * (1 / 0);
        end;

        return v16 * (0 / 0);
    end;

    return v16 * 2 ^ (v19 - 127) * (v23 / 8388608 + 1);
end;

local function rd_dbl_basic(p24, p25, p26, p27, p28, p29, p30, p31) -- Line: 188
    -- upvalues: l_bit32 (copy)
    local v32 = (-1) ^ l_bit32.rshift(p31, 7);
    local v33 = l_bit32.band(p31, 127);
    local v34 = l_bit32.lshift(v33, 4) + l_bit32.rshift(p30, 4);
    local v35 = 1;
    local v36 = l_bit32.band(p30, 15) * 281474976710656 + p29 * 1099511627776 + p28 * 4294967296 + p27 * 16777216 + p26 * 65536 + p25 * 256 + p24;

    if v34 == 0 then
        if v36 == 0 then
            return v32 * 0;
        end;

        v34 = 1;
        v35 = 0;
    elseif v34 == 2047 then
        if v36 == 0 then
            return v32 * (1 / 0);
        end;

        return v32 * (0 / 0);
    end;

    return v32 * 2 ^ (v34 - 1023) * (v35 + v36 / 4503599627370496);
end;

local function rd_int_le(p37, p38, p39) -- Line: 218
    local v40 = 0;

    for i = p38, p39 - 1 do
        v40 = v40 + string.byte(p37, i, i) * 256 ^ (i - p38);
        local _ = i;
    end;

    return v40;
end;

local function rd_int_be(p41, p42, p43) -- Line: 224
    local v44 = p43 - 1;
    local v45 = 0;

    for i = v44, p42, -1 do
        v45 = v45 + string.byte(p41, i, i) * 256 ^ (i - v44);
        local _ = i;
    end;

    return v45;
end;

local u64 = {
    [4] = {
        little = function(p46, p47) -- Line: 229, Name: rd_flt_le
            -- upvalues: rd_flt_basic (copy)
            return rd_flt_basic(string.byte(p46, p47, p47 + 3));
        end,

        big = function(p48, p49) -- Line: 234, Name: rd_flt_be
            -- upvalues: rd_flt_basic (copy)
            local string_byte_ret, v50, v51, v52 = string.byte(p48, p49, p49 + 3);

            return rd_flt_basic(v52, v51, v50, string_byte_ret);
        end
    },
    [8] = {
        little = function(p53, p54) -- Line: 242, Name: rd_dbl_le
            -- upvalues: rd_dbl_basic (copy)
            return rd_dbl_basic(string.byte(p53, p54, p54 + 7));
        end,

        big = function(p55, p56) -- Line: 247, Name: rd_dbl_be
            -- upvalues: rd_dbl_basic (copy)
            local string_byte_ret, v57, v58, v59, v60, v61, v62, v63 = string.byte(p55, p56, p56 + 7);

            return rd_dbl_basic(v63, v62, v61, v60, v59, v58, v57, string_byte_ret);
        end
    }
};

local function stm_byte(p65) -- Line: 260
    local index = p65.index;
    local string_byte_ret = string.byte(p65.source, index, index);
    p65.index = index + 1;

    return string_byte_ret;
end;

local function stm_string(p66, p67) -- Line: 271
    local v68 = p66.index + p67;
    local string_sub_ret = string.sub(p66.source, p66.index, v68 - 1);
    p66.index = v68;

    return string_sub_ret;
end;

local function stm_lstring(p69) -- Line: 281
    local v70 = p69:s_szt();
    local v71;

    if v70 == 0 then
        v71 = nil;
    else
        local v72 = p69.index + v70;
        local string_sub_ret = string.sub(p69.source, p69.index, v72 - 1);
        p69.index = v72;
        v71 = string.sub(string_sub_ret, 1, -2);
    end;

    return v71;
end;

local function cst_int_rdr(u73, u74) -- Line: 293
    return function(p75) -- Line: 294
        -- upvalues: u73 (copy), u74 (copy)
        local v76 = p75.index + u73;
        local v77 = u74(p75.source, p75.index, v76);
        p75.index = v76;

        return v77;
    end;
end;

local function cst_flt_rdr(u78, u79) -- Line: 306
    return function(p80) -- Line: 307
        -- upvalues: u79 (copy), u78 (copy)
        local v81 = u79(p80.source, p80.index);
        p80.index = p80.index + u78;

        return v81;
    end;
end;

local function stm_instructions(p82) -- Line: 315
    -- upvalues: l_bit32 (copy), u5 (copy), u6 (copy), u4 (copy)
    local v83 = {};

    for i = 1, p82:s_int() do
        local v84 = p82:s_ins();
        local v85 = l_bit32.band(v84, 63);
        local v86 = u5[v85];
        local v87 = u6[v85];
        local v88 = {
            value = v84,
            op = u4[v85]
        };
        local v89 = l_bit32.rshift(v84, 6);
        v88.A = l_bit32.band(v89, 255);

        if v86 == "ABC" then
            local v90 = l_bit32.rshift(v84, 23);
            v88.B = l_bit32.band(v90, 511);
            local v91 = l_bit32.rshift(v84, 14);
            v88.C = l_bit32.band(v91, 511);
            local v92;

            if v87.b == "OpArgK" then
                v92 = v88.B > 255;
            else
                v92 = false;
            end;

            v88.is_KB = v92;
            local v93;

            if v87.c == "OpArgK" then
                v93 = v88.C > 255;
            else
                v93 = false;
            end;

            v88.is_KC = v93;
        elseif v86 == "ABx" then
            local v94 = l_bit32.rshift(v84, 14);
            v88.Bx = l_bit32.band(v94, 262143);
            v88.is_K = v87.b == "OpArgK";
        elseif v86 == "AsBx" then
            local v95 = l_bit32.rshift(v84, 14);
            v88.sBx = l_bit32.band(v95, 262143) - 131071;
        end;

        v83[i] = v88;
        local _ = i;
    end;

    return v83;
end;

local function stm_constants(p96) -- Line: 344
    local v97 = {};

    for i = 1, p96:s_int() do
        local index = p96.index;
        local string_byte_ret = string.byte(p96.source, index, index);
        p96.index = index + 1;
        local v98 = nil;

        if string_byte_ret == 1 then
            local index2 = p96.index;
            local string_byte_ret2 = string.byte(p96.source, index2, index2);
            p96.index = index2 + 1;
            v98 = string_byte_ret2 ~= 0;
        elseif string_byte_ret == 3 then
            v98 = p96:s_num();
        elseif string_byte_ret == 4 then
            local v99 = p96:s_szt();

            if v99 == 0 then
                v98 = nil;
            else
                local v100 = p96.index + v99;
                local string_sub_ret = string.sub(p96.source, p96.index, v100 - 1);
                p96.index = v100;
                v98 = string.sub(string_sub_ret, 1, -2);
            end;
        end;

        v97[i] = v98;
        local _ = i;
    end;

    return v97;
end;

local function stm_subfuncs(p101, p102) -- Line: 366
    -- upvalues: u3 (ref)
    local v103 = {};

    for i = 1, p101:s_int() do
        v103[i] = u3(p101, p102);
        local _ = i;
    end;

    return v103;
end;

local function stm_lineinfo(p104) -- Line: 377
    local v105 = {};

    for i = 1, p104:s_int() do
        v105[i] = p104:s_int();
        local _ = i;
    end;

    return v105;
end;

local function stm_locvars(p106) -- Line: 386
    local v107 = {};

    for i = 1, p106:s_int() do
        local v108 = {};
        local v109 = p106:s_szt();
        local v110;

        if v109 == 0 then
            v110 = nil;
        else
            local v111 = p106.index + v109;
            local string_sub_ret = string.sub(p106.source, p106.index, v111 - 1);
            p106.index = v111;
            v110 = string.sub(string_sub_ret, 1, -2);
        end;

        v108.varname = v110;
        v108.startpc = p106:s_int();
        v108.endpc = p106:s_int();
        v107[i] = v108;
        local _ = i;
    end;

    return v107;
end;

local function stm_upvals(p112) -- Line: 395
    local v113 = {};

    for i = 1, p112:s_int() do
        local v114 = p112:s_szt();
        local v115;

        if v114 == 0 then
            v115 = nil;
        else
            local v116 = p112.index + v114;
            local string_sub_ret = string.sub(p112.source, p112.index, v116 - 1);
            p112.index = v116;
            v115 = string.sub(string_sub_ret, 1, -2);
        end;

        v113[i] = v115;
        local _ = i;
    end;

    return v113;
end;

u3 = function(p117, p118) -- Line: 404, Name: stm_lua_func
    -- upvalues: stm_instructions (copy), stm_constants (copy), stm_subfuncs (copy), stm_lineinfo (copy), stm_locvars (copy), stm_upvals (copy)
    local v119 = {};
    local v120 = p117:s_szt();
    local v121;

    if v120 == 0 then
        v121 = nil;
    else
        local v122 = p117.index + v120;
        local string_sub_ret = string.sub(p117.source, p117.index, v122 - 1);
        p117.index = v122;
        v121 = string.sub(string_sub_ret, 1, -2);
    end;

    local v123 = v121 or p118;
    v119.source = v123;
    p117:s_int();
    p117:s_int();
    local index = p117.index;
    local string_byte_ret = string.byte(p117.source, index, index);
    p117.index = index + 1;
    v119.numupvals = string_byte_ret;
    local index2 = p117.index;
    local string_byte_ret2 = string.byte(p117.source, index2, index2);
    p117.index = index2 + 1;
    v119.numparams = string_byte_ret2;
    local index3 = p117.index;
    string.byte(p117.source, index3, index3);
    p117.index = index3 + 1;
    local index4 = p117.index;
    string.byte(p117.source, index4, index4);
    p117.index = index4 + 1;
    v119.code = stm_instructions(p117);
    v119.const = stm_constants(p117);
    v119.subs = stm_subfuncs(p117, v123);
    v119.lines = stm_lineinfo(p117);
    stm_locvars(p117);
    stm_upvals(p117);

    for _, v in ipairs(v119.code) do
        if v.is_K then
            v.const = v119.const[v.Bx + 1];
        else
            if v.is_KB then
                v.const_B = v119.const[v.B - 255];
            end;

            if v.is_KC then
                v.const_C = v119.const[v.C - 255];
            end;
        end;
    end;

    return v119;
end;

local function stm_lua_bytecode(p124) -- Line: 441
    -- upvalues: rd_int_le (copy), rd_int_be (copy), u64 (copy), u3 (ref)
    local v125 = {
        index = 1,
        source = p124
    };
    local v126 = v125.index + 4;
    local string_sub_ret = string.sub(v125.source, v125.index, v126 - 1);
    v125.index = v126;
    assert(string_sub_ret == "\27Lua", "invalid Lua signature");
    local index = v125.index;
    local string_byte_ret = string.byte(v125.source, index, index);
    v125.index = index + 1;
    assert(string_byte_ret == 81, "invalid Lua version");
    local index2 = v125.index;
    local string_byte_ret2 = string.byte(v125.source, index2, index2);
    v125.index = index2 + 1;
    assert(string_byte_ret2 == 0, "invalid Lua format");
    local index3 = v125.index;
    local string_byte_ret3 = string.byte(v125.source, index3, index3);
    v125.index = index3 + 1;
    local v127 = string_byte_ret3 ~= 0;
    local index4 = v125.index;
    local string_byte_ret4 = string.byte(v125.source, index4, index4);
    v125.index = index4 + 1;
    local index5 = v125.index;
    local string_byte_ret5 = string.byte(v125.source, index5, index5);
    v125.index = index5 + 1;
    local index6 = v125.index;
    local string_byte_ret6 = string.byte(v125.source, index6, index6);
    v125.index = index6 + 1;
    local index7 = v125.index;
    local string_byte_ret7 = string.byte(v125.source, index7, index7);
    v125.index = index7 + 1;
    local index8 = v125.index;
    local string_byte_ret8 = string.byte(v125.source, index8, index8);
    v125.index = index8 + 1;
    local u128 = v127 and rd_int_le or rd_int_be;

    function v125.s_int(p129) -- Line: 294
        -- upvalues: string_byte_ret4 (copy), u128 (copy)
        local v130 = p129.index + string_byte_ret4;
        local v131 = u128(p129.source, p129.index, v130);
        p129.index = v130;

        return v131;
    end;

    function v125.s_szt(p132) -- Line: 294
        -- upvalues: string_byte_ret5 (copy), u128 (copy)
        local v133 = p132.index + string_byte_ret5;
        local v134 = u128(p132.source, p132.index, v133);
        p132.index = v133;

        return v134;
    end;

    function v125.s_ins(p135) -- Line: 294
        -- upvalues: string_byte_ret6 (copy), u128 (copy)
        local v136 = p135.index + string_byte_ret6;
        local v137 = u128(p135.source, p135.index, v136);
        p135.index = v136;

        return v137;
    end;

    if string_byte_ret8 ~= 0 then
        function v125.s_num(p138) -- Line: 294
            -- upvalues: string_byte_ret7 (copy), u128 (copy)
            local v139 = p138.index + string_byte_ret7;
            local v140 = u128(p138.source, p138.index, v139);
            p138.index = v139;

            return v140;
        end;
    elseif u64[string_byte_ret7] then
        local u141 = u64[string_byte_ret7][v127 and "little" or "big"];

        function v125.s_num(p142) -- Line: 307
            -- upvalues: u141 (copy), string_byte_ret7 (copy)
            local v143 = u141(p142.source, p142.index);
            p142.index = p142.index + string_byte_ret7;

            return v143;
        end;
    else
        error("unsupported float size");
    end;

    return u3(v125, "@virtual");
end;

local function close_lua_upvalues(p144, p145) -- Line: 487
    for i, v in pairs(p144) do
        if p145 <= v.index then
            v.value = v.store[v.index];
            v.store = v;
            v.index = "value";
            p144[i] = nil;
        end;
    end;
end;

local function open_lua_upvalue(p146, p147, p148) -- Line: 498
    local v149 = p146[p147];

    if not v149 then
        v149 = {
            index = p147,
            store = p148
        };
        p146[p147] = v149;
    end;

    return v149;
end;

local function wrap_lua_variadic(...) -- Line: 509
    return select("#", ...), { ... };
end;

local function on_lua_error(p150, p151) -- Line: 511
    local source = p150.source;
    local v152 = p150.lines[p150.pc - 1];
    local string_match_ret, v153, v154 = string.match(p151 or "", "^(.-):(%d+):%s+(.+)");
    error(string.format("%s:%i: [%s:%i] %s", source, v152 or "0", string_match_ret or "?", v153 or "0", v154 or (p151 or "")), 0);
end;

local function exec_lua_func(p155) -- Line: 525
    -- upvalues: wrap_lua_variadic (copy), u1 (copy), close_lua_upvalues (copy), u4 (copy), u2 (ref)
    local code = p155.code;
    local subs = p155.subs;
    local env = p155.env;
    local upvals = p155.upvals;
    local varargs = p155.varargs;
    local stack = p155.stack;
    local pc = p155.pc;
    local v156 = -1;
    local v157 = {};

    while true do
        local v158 = code[pc];
        local op = v158.op;
        pc = pc + 1;

        if op < 18 then
            if op < 8 then
                if op < 3 then
                    if op < 1 then
                        for i = v158.A, v158.B do
                            stack[i] = nil;
                            local _ = i;
                        end;
                    elseif op > 1 then
                        local v159 = upvals[v158.B];
                        stack[v158.A] = v159.store[v159.index];
                    else
                        local v160;

                        if v158.is_KB then
                            v160 = v158.const_B;
                        else
                            v160 = stack[v158.B];
                        end;

                        local v161;

                        if v158.is_KC then
                            v161 = v158.const_C;
                        else
                            v161 = stack[v158.C];
                        end;

                        stack[v158.A] = v160 + v161;
                    end;
                elseif op > 3 then
                    if op < 6 then
                        if op > 4 then
                            local A = v158.A;
                            local B = v158.B;
                            local v162;

                            if v158.is_KC then
                                v162 = v158.const_C;
                            else
                                v162 = stack[v158.C];
                            end;

                            stack[A + 1] = stack[B];
                            stack[A] = stack[B][v162];
                        else
                            stack[v158.A] = env[v158.const];
                        end;
                    elseif op > 6 then
                        local v163;

                        if v158.is_KC then
                            v163 = v158.const_C;
                        else
                            v163 = stack[v158.C];
                        end;

                        stack[v158.A] = stack[v158.B][v163];
                    else
                        local v164;

                        if v158.is_KB then
                            v164 = v158.const_B;
                        else
                            v164 = stack[v158.B];
                        end;

                        local v165;

                        if v158.is_KC then
                            v165 = v158.const_C;
                        else
                            v165 = stack[v158.C];
                        end;

                        stack[v158.A] = v164 - v165;
                    end;
                else
                    stack[v158.A] = stack[v158.B];
                end;
            elseif op > 8 then
                if op < 13 then
                    if op < 10 then
                        env[v158.const] = stack[v158.A];
                    elseif op > 10 then
                        if op < 12 then
                            local A = v158.A;
                            local B = v158.B;
                            local C = v158.C;
                            local v166;

                            if B == 0 then
                                v166 = v156 - A;
                            else
                                v166 = B - 1;
                            end;

                            local v167, v168 = wrap_lua_variadic(stack[A](u1(stack, A + 1, A + v166)));

                            if C == 0 then
                                v156 = A + v167 - 1;
                            else
                                v167 = C - 1;
                            end;

                            for i = 1, v167 do
                                stack[A + i - 1] = v168[i];
                                local _ = i;
                            end;
                        else
                            local v169 = upvals[v158.B];
                            v169.store[v169.index] = stack[v158.A];
                        end;
                    else
                        local v170;

                        if v158.is_KB then
                            v170 = v158.const_B;
                        else
                            v170 = stack[v158.B];
                        end;

                        local v171;

                        if v158.is_KC then
                            v171 = v158.const_C;
                        else
                            v171 = stack[v158.C];
                        end;

                        stack[v158.A] = v170 * v171;
                    end;
                elseif op > 13 then
                    if op < 16 then
                        if op > 14 then
                            local A = v158.A;
                            local B = v158.B;
                            local v172;

                            if B == 0 then
                                v172 = v156 - A;
                            else
                                v172 = B - 1;
                            end;

                            close_lua_upvalues(v157, 0);

                            return wrap_lua_variadic(stack[A](u1(stack, A + 1, A + v172)));
                        end;

                        local v173;

                        if v158.is_KB then
                            v173 = v158.const_B;
                        else
                            v173 = stack[v158.B];
                        end;

                        local v174;

                        if v158.is_KC then
                            v174 = v158.const_C;
                        else
                            v174 = stack[v158.C];
                        end;

                        stack[v158.A][v173] = v174;
                    elseif op > 16 then
                        stack[v158.A] = {};
                    else
                        local v175;

                        if v158.is_KB then
                            v175 = v158.const_B;
                        else
                            v175 = stack[v158.B];
                        end;

                        local v176;

                        if v158.is_KC then
                            v176 = v158.const_C;
                        else
                            v176 = stack[v158.C];
                        end;

                        stack[v158.A] = v175 / v176;
                    end;
                else
                    stack[v158.A] = v158.const;
                end;
            else
                local A = v158.A;
                local v177 = stack[A + 2];
                local v178 = stack[A] + v177;
                local v179 = stack[A + 1];
                local v180;

                if v177 == math.abs(v177) then
                    v180 = v178 <= v179;
                else
                    v180 = v179 <= v178;
                end;

                if v180 then
                    stack[v158.A] = v178;
                    stack[v158.A + 3] = v178;
                    pc = pc + v158.sBx;
                end;
            end;
        elseif op > 18 then
            if op < 28 then
                if op < 23 then
                    if op < 20 then
                        stack[v158.A] = #stack[v158.B];
                    elseif op > 20 then
                        if op < 22 then
                            local A = v158.A;
                            local B = v158.B;
                            local v181 = {};
                            local v182;

                            if B == 0 then
                                v182 = v156 - A + 1;
                            else
                                v182 = B - 1;
                            end;

                            for i = 1, v182 do
                                v181[i] = stack[A + i - 1];
                                local _ = i;
                            end;

                            close_lua_upvalues(v157, 0);

                            return v182, v181;
                        end;

                        local v183 = stack[v158.B];

                        for i = v158.B + 1, v158.C do
                            v183 = v183 .. stack[i];
                            local _ = i;
                        end;

                        stack[v158.A] = v183;
                    else
                        local v184;

                        if v158.is_KB then
                            v184 = v158.const_B;
                        else
                            v184 = stack[v158.B];
                        end;

                        local v185;

                        if v158.is_KC then
                            v185 = v158.const_C;
                        else
                            v185 = stack[v158.C];
                        end;

                        stack[v158.A] = v184 % v185;
                    end;
                elseif op > 23 then
                    if op < 26 then
                        if op > 24 then
                            close_lua_upvalues(v157, v158.A);
                        else
                            local v186;

                            if v158.is_KB then
                                v186 = v158.const_B;
                            else
                                v186 = stack[v158.B];
                            end;

                            local v187;

                            if v158.is_KC then
                                v187 = v158.const_C;
                            else
                                v187 = stack[v158.C];
                            end;

                            if v186 == v187 == (v158.A ~= 0) then
                                pc = pc + code[pc].sBx;
                            end;

                            pc = pc + 1;
                        end;
                    elseif op > 26 then
                        local v188;

                        if v158.is_KB then
                            v188 = v158.const_B;
                        else
                            v188 = stack[v158.B];
                        end;

                        local v189;

                        if v158.is_KC then
                            v189 = v158.const_C;
                        else
                            v189 = stack[v158.C];
                        end;

                        if v188 < v189 == (v158.A ~= 0) then
                            pc = pc + code[pc].sBx;
                        end;

                        pc = pc + 1;
                    else
                        local v190;

                        if v158.is_KB then
                            v190 = v158.const_B;
                        else
                            v190 = stack[v158.B];
                        end;

                        local v191;

                        if v158.is_KC then
                            v191 = v158.const_C;
                        else
                            v191 = stack[v158.C];
                        end;

                        stack[v158.A] = v190 ^ v191;
                    end;
                else
                    stack[v158.A] = v158.B ~= 0;

                    if v158.C ~= 0 then
                        pc = pc + 1;
                    end;
                end;
            elseif op > 28 then
                if op < 33 then
                    if op < 30 then
                        local v192;

                        if v158.is_KB then
                            v192 = v158.const_B;
                        else
                            v192 = stack[v158.B];
                        end;

                        local v193;

                        if v158.is_KC then
                            v193 = v158.const_C;
                        else
                            v193 = stack[v158.C];
                        end;

                        if v192 <= v193 == (v158.A ~= 0) then
                            pc = pc + code[pc].sBx;
                        end;

                        pc = pc + 1;
                    elseif op > 30 then
                        if op < 32 then
                            local v194 = subs[v158.Bx + 1];
                            local numupvals = v194.numupvals;
                            local v195;

                            if numupvals == 0 then
                                v195 = nil;
                            else
                                v195 = {};

                                for i = 1, numupvals do
                                    local v196 = code[pc + i - 1];
                                    local v197;

                                    if v196.op == u4[0] then
                                        local B = v196.B;
                                        local v198 = v157[B];

                                        if not v198 then
                                            v198 = {
                                                index = B,
                                                store = stack
                                            };
                                            v157[B] = v198;
                                        end;

                                        v195[i - 1] = v198;
                                        v197 = i;
                                    elseif v196.op == u4[4] then
                                        v195[i - 1] = upvals[v196.B];
                                        v197 = i;
                                    else
                                        v197 = i;
                                    end;
                                end;

                                pc = pc + numupvals;
                            end;

                            stack[v158.A] = u2(v194, env, v195);
                        else
                            local A = v158.A;
                            local B = v158.B;

                            if not stack[B] == (v158.C ~= 0) then
                                pc = pc + 1;
                            else
                                stack[A] = stack[B];
                            end;
                        end;
                    else
                        stack[v158.A] = -stack[v158.B];
                    end;
                elseif op > 33 then
                    if op < 36 then
                        if op > 34 then
                            local A = v158.A;
                            local B = v158.B;

                            if B == 0 then
                                B = varargs.size;
                                v156 = A + B - 1;
                            end;

                            for i = 1, B do
                                stack[A + i - 1] = varargs.list[i];
                                local _ = i;
                            end;
                        else
                            local A = v158.A;
                            local v199 = tonumber(stack[A]);
                            local v200 = assert(v199, "`for` initial value must be a number");
                            local v201 = tonumber(stack[A + 1]);
                            local v202 = assert(v201, "`for` limit must be a number");
                            local v203 = tonumber(stack[A + 2]);
                            local v204 = assert(v203, "`for` step must be a number");
                            stack[A] = v200 - v204;
                            stack[A + 1] = v202;
                            stack[A + 2] = v204;
                            pc = pc + v158.sBx;
                        end;
                    elseif op > 36 then
                        local A = v158.A;
                        local C = v158.C;
                        local B = v158.B;
                        local v205 = stack[A];

                        if B == 0 then
                            B = v156 - A;
                        end;

                        if C == 0 then
                            C = v158[pc].value;
                            pc = pc + 1;
                        end;

                        local v206 = (C - 1) * 50;

                        for i = 1, B do
                            v205[i + v206] = stack[A + i];
                            local _ = i;
                        end;
                    else
                        stack[v158.A] = not stack[v158.B];
                    end;
                elseif not stack[v158.A] == (v158.C ~= 0) then
                    pc = pc + 1;
                end;
            else
                local A = v158.A;
                local v207 = stack[A];
                local v208 = stack[A + 1];
                local v209 = stack[A + 2];
                local v210 = A + 3;
                local v211;

                if v209 or (v208 or type(v207) ~= "table") then
                    v211 = v207;
                    v207 = v208;
                else
                    local success = pcall(getmetatable, v207);
                    local v212;

                    if success then
                        local l_setmetatable = setmetatable;
                        local v213 = getmetatable(v207);
                        v212 = not (pcall(l_setmetatable, v207, v213) and success);
                    else
                        v212 = not success;
                    end;

                    if success then
                        success = getmetatable(v207);
                    end;

                    if not (table.isfrozen and table.isfrozen(v207) or (not v212 or success)) then
                        warn("[FiOne]: The table has a metatable buts it\'s hidden, __iter and __call won\'t work in forloop.");
                    end;

                    if type(success) == "table" and rawget(success, "__call") then
                        v211 = v207;
                        v207 = v208;
                    else
                        v211 = type(success) == "table" and rawget(success, "__iter") or next;
                        v209 = nil;
                        stack[A] = v211;
                        stack[A + 1] = v207;
                        stack[A + 2] = v209;
                    end;
                end;

                stack[v210 + 2] = v209;
                stack[v210 + 1] = v207;
                stack[v210] = v211;
                local v214 = { v211(v207, v209) };

                for i = 1, v158.C do
                    stack[v210 + i - 1] = v214[i];
                    local _ = i;
                end;

                if stack[v210] == nil then
                    pc = pc + 1;
                else
                    stack[A + 2] = stack[v210];
                end;
            end;
        else
            pc = pc + v158.sBx;
        end;

        p155.pc = pc;
    end;
end;

u2 = function(p215, u216, u217) -- Line: 1041, Name: wrap_lua_func
    -- upvalues: wrap_lua_variadic (copy), exec_lua_func (copy), u1 (copy), on_lua_error (copy)
    local code = p215.code;
    local subs = p215.subs;
    local lines = p215.lines;
    local source = p215.source;
    local numparams = p215.numparams;

    return function(...) -- Line: 1048, Name: exec_wrap
        -- upvalues: wrap_lua_variadic (ref), numparams (copy), code (copy), subs (copy), lines (copy), source (copy), u216 (copy), u217 (copy), exec_lua_func (ref), u1 (ref), on_lua_error (ref)
        local v218, v219 = wrap_lua_variadic(...);
        local v220 = {};
        local v221 = {};
        local v222 = 0;

        for i = 1, numparams do
            v220[i - 1] = v219[i];
            local _ = i;
        end;

        if numparams < v218 then
            v222 = v218 - numparams;

            for i = 1, v222 do
                v221[i] = v219[numparams + i];
                local _ = i;
            end;
        end;

        local v223 = {
            pc = 1,
            varargs = {
                list = v221,
                size = v222
            },
            code = code,
            subs = subs,
            lines = lines,
            source = source,
            env = u216,
            upvals = u217,
            stack = v220
        };
        local v224, v225, v226 = pcall(exec_lua_func, v223, ...);

        if v224 then
            return u1(v226, 1, v225);
        end;

        on_lua_error(v223, v225);
    end;
end;

return function(p227, p228) -- Line: 1090
    -- upvalues: u2 (ref), stm_lua_bytecode (ref)
    return u2(stm_lua_bytecode(p227), p228 or {});
end;
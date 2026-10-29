-- ============================================================
-- SCRIPT: Spring
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Services.Spring
-- ============================================================

-- Decompiled with Potassium's decompiler.

local v1 = {};
local _ = table.sort;
local math_atan2 = math.atan2;
local math_cos = math.cos;
local math_sin = math.sin;
local l_setmetatable = setmetatable;
local l_tick = tick;
local Dot = Vector3.new().Dot;
v1.spring = {};
local v2 = {};
v1.spring = v2;
local math_cos2 = math.cos;
local math_sin2 = math.sin;

function v2.new(p3) -- Line: 21
    -- upvalues: l_tick (copy), math_cos2 (copy), math_sin2 (copy), l_setmetatable (copy)
    local u4 = 0 * (p3 or 0);
    local u5 = 1;
    local u6 = 1;
    local u7 = p3 or u4;
    local u8 = u4;
    local u9 = p3 or u4;
    local u10 = l_tick();
    local u11 = 0;
    local u12 = u4;
    local u13 = u4;
    local v14 = {};
    local v15 = {};

    local function updateconstants() -- Line: 34
        -- upvalues: u6 (ref), u11 (ref), u12 (ref), u4 (copy), u13 (ref), u5 (ref), u7 (ref), u9 (ref), u8 (ref)
        if u6 == 0 then
            u11 = 0;
            u12 = u4;
            u13 = u4;

            return;
        end;

        if u5 < 0.99999999 then
            u11 = (1 - u5 * u5) ^ 0.5;
            u12 = u7 - u9;
            u13 = u5 / u11 * u12 + u8 / (u11 * u6);

            return;
        end;

        if u5 < 1.00000001 then
            u11 = 0;
            u12 = u7 - u9;
            u13 = u12 + u8 / u6;

            return;
        end;

        u11 = (u5 * u5 - 1) ^ 0.5;
        local v16 = -u8 / (u6 * 2 * u11);
        local v17 = -(u9 - u7) / 2;
        u12 = (1 - u5 / u11) * v17 + v16;
        u13 = (u5 / u11 + 1) * v17 - v16;
    end;

    local function pos(p18) -- Line: 55
        -- upvalues: u7 (ref), u6 (ref), u5 (ref), u11 (ref), math_cos2 (ref), math_sin2 (ref), u12 (ref), u13 (ref), u9 (ref)
        if p18 < 0.001 then
            return u7;
        end;

        if u6 == 0 then
            return u7;
        end;

        if u5 >= 0.99999999 then
            if u5 < 1.00000001 then
                return (u12 + u6 * p18 * u13) / 2.718281828459045 ^ (u6 * p18) + u9;
            end;

            return u12 * 2.718281828459045 ^ ((-u5 - u11) * u6 * p18) + u13 * 2.718281828459045 ^ ((-u5 + u11) * u6 * p18) + u9;
        end;

        local v19 = math_cos2(u11 * u6 * p18);
        local v20 = math_sin2(u11 * u6 * p18);
        local v21 = 2.718281828459045 ^ (u5 * u6 * p18);

        return v19 / v21 * u12 + v20 / v21 * u13 + u9;
    end;

    local function vel(p22) -- Line: 75
        -- upvalues: u8 (ref), u6 (ref), u7 (ref), u5 (ref), u11 (ref), math_cos2 (ref), math_sin2 (ref), u13 (ref), u12 (ref)
        if p22 < 0.001 then
            return u8;
        end;

        if u6 == 0 then
            return u7;
        end;

        if u5 >= 0.99999999 then
            if u5 < 1.00000001 then
                return -u6 / 2.718281828459045 ^ (u6 * p22) * (u12 + (u6 * p22 - 1) * u13);
            end;

            return 2.718281828459045 ^ ((-u5 + u11) * u6 * p22) * (u11 - u5) * u6 * u13 - 2.718281828459045 ^ ((-u5 - u11) * u6 * p22) * (u5 + u11) * u6 * u12;
        end;

        local v23 = math_cos2(u11 * u6 * p22);
        local v24 = math_sin2(u11 * u6 * p22);
        local v25 = 2.718281828459045 ^ (u5 * u6 * p22);

        return u6 * (v23 * u11 - u5 * v24) / v25 * u13 - u6 * (v23 * u5 + u11 * v24) / v25 * u12;
    end;

    local function posvel(p26) -- Line: 95
        -- upvalues: u6 (ref), u7 (ref), u5 (ref), u11 (ref), math_cos2 (ref), math_sin2 (ref), u12 (ref), u13 (ref), u9 (ref)
        if u6 == 0 then
            return u7;
        end;

        if u5 < 0.99999999 then
            local v27 = math_cos2(u11 * u6 * p26);
            local v28 = math_sin2(u11 * u6 * p26);
            local v29 = 2.718281828459045 ^ (u5 * u6 * p26);

            return v27 / v29 * u12 + v28 / v29 * u13 + u9, u6 * (v27 * u11 - u5 * v28) / v29 * u13 - u6 * (v27 * u5 + u11 * v28) / v29 * u12;
        end;

        if u5 < 1.00000001 then
            local v30 = 2.718281828459045 ^ (u6 * p26);

            return (u12 + u6 * p26 * u13) / v30 + u9, -u6 / v30 * (u12 + (u6 * p26 - 1) * u13);
        end;

        local v31 = 2.718281828459045 ^ ((-u5 - u11) * u6 * p26);
        local v32 = 2.718281828459045 ^ ((-u5 + u11) * u6 * p26);

        return u12 * v31 + u13 * v32 + u9, v32 * (u11 - u5) * u6 * u13 - v31 * (u5 + u11) * u6 * u12;
    end;

    updateconstants();

    function v14.getpv() -- Line: 113
        -- upvalues: posvel (copy), l_tick (ref), u10 (ref)
        return posvel(l_tick() - u10);
    end;

    function v14.setpv(p33, p34) -- Line: 116
        -- upvalues: l_tick (ref), u7 (ref), u8 (ref), u10 (ref), updateconstants (copy)
        local v35 = l_tick();
        u7 = p33;
        u8 = p34;
        u10 = v35;
        updateconstants();
    end;

    function v14.accelerate(p36, p37) -- Line: 122
        -- upvalues: l_tick (ref), posvel (copy), u10 (ref), u7 (ref), u8 (ref), updateconstants (copy)
        local v38 = l_tick();
        local v39, v40 = posvel(v38 - u10);
        u7 = v39;
        u8 = v40 + p37;
        u10 = v38;
        updateconstants();
    end;

    function v15.__index(p41, p42) -- Line: 129
        -- upvalues: l_tick (ref), pos (copy), u10 (ref), vel (copy), u9 (ref), u5 (ref), u6 (ref)
        local v43 = l_tick();

        if p42 == "p" then
            return pos(v43 - u10);
        end;

        if p42 == "v" then
            return vel(v43 - u10);
        end;

        if p42 == "t" then
            return u9;
        end;

        if p42 == "d" then
            return u5;
        end;

        if p42 == "s" then
            return u6;
        end;
    end;

    function v15.__newindex(p44, p45, p46) -- Line: 143
        -- upvalues: l_tick (ref), u7 (ref), u8 (ref), vel (copy), u10 (ref), pos (copy), posvel (copy), u9 (ref), u5 (ref), u6 (ref), updateconstants (copy)
        local v47 = l_tick();

        if p45 == "p" then
            local v48 = vel(v47 - u10);
            u7 = p46;
            u8 = v48;
        elseif p45 == "v" then
            u7 = pos(v47 - u10);
            u8 = p46;
        elseif p45 == "t" then
            local v49, v50 = posvel(v47 - u10);
            u7 = v49;
            u8 = v50;
            u9 = p46;
        elseif p45 == "d" then
            if p46 == nil then
                warn("nil value for d");
                warn(debug.stacktrace());
                p46 = u5;
            end;

            local v51, v52 = posvel(v47 - u10);
            u7 = v51;
            u8 = v52;
            u5 = p46;
        elseif p45 == "s" then
            if p46 == nil then
                warn("nil value for s");
                warn(debug.stacktrace());
                p46 = u6;
            end;

            local v53, v54 = posvel(v47 - u10);
            u7 = v53;
            u8 = v54;
            u6 = p46;
        elseif p45 == "a" then
            local v55, v56 = posvel(v47 - u10);
            u7 = v55;
            u8 = v56 + p46;
        end;

        u10 = v47;
        updateconstants();
    end;

    return l_setmetatable(v14, v15);
end;

local function solve(p57, p58, p59, p60, p61) -- Line: 179
    -- upvalues: solve (copy), math_atan2 (copy), math_cos (copy), math_sin (copy)
    if not p57 then
        return;
    end;

    if p57 > -1e-10 and p57 < 1e-10 then
        return solve(p58, p59, p60, p61);
    end;

    if not p61 then
        if p60 then
            local v62 = -p58 / (3 * p57);
            local v63 = (3 * p57 * p59 - p58 * p58) / (9 * p57 * p57);
            local v64 = (2 * p58 * p58 * p58 - 9 * p57 * p58 * p59 + 27 * p57 * p57 * p60) / (54 * p57 * p57 * p57);
            local v65 = v63 * v63 * v63 + v64 * v64;
            local v66 = v65 ^ 0.5 + v64;

            if v66 > -1e-10 and v66 < 1e-10 then
                if v64 < 0 then
                    return v62 + (-2 * v64) ^ 0.3333333333333333;
                end;

                return v62 - (2 * v64) ^ 0.3333333333333333;
            end;

            if v65 >= 0 then
                if v66 < 0 then
                    local v67 = -(-v66) ^ 0.3333333333333333;

                    return v62 + v63 / v67 - v67;
                end;

                local v68 = v66 ^ 0.3333333333333333;

                return v62 + v63 / v68 - v68;
            end;

            local v69 = (-v63) ^ 0.5;
            local v70 = math_atan2((-v65) ^ 0.5, v64) / 3;
            local v71 = v69 * math_cos(v70);
            local v72 = v69 * math_sin(v70);

            return v62 - 2 * v71, v62 + v71 - 1.7320508075688772 * v72, v62 + v71 + 1.7320508075688772 * v72;
        end;

        if not p59 then
            if p58 then
                return -p58 / p57;
            end;

            return;
        end;

        local v73 = -p58 / (2 * p57);
        local v74 = v73 * v73 - p59 / p57;

        if v74 >= 0 then
            local v75 = v74 ^ 0.5;

            return v73 - v75, v73 + v75;
        end;

        return;
    end;

    local v76 = -p58 / (4 * p57);
    local v77 = (8 * p57 * p59 - 3 * p58 * p58) / (8 * p57 * p57);
    local v78 = (p58 * p58 * p58 + 8 * p57 * p57 * p60 - 4 * p57 * p58 * p59) / (8 * p57 * p57 * p57);
    local v79 = (16 * p57 * p57 * p58 * p58 * p59 + 256 * p57 * p57 * p57 * p57 * p61 - 3 * p57 * p58 * p58 * p58 * p58 - 64 * p57 * p57 * p57 * p58 * p60) / (256 * p57 * p57 * p57 * p57 * p57);
    local v80, _, v81 = solve(1, 2 * v77, v77 * v77 - 4 * v79, -v78 * v78);
    local v82 = v81 or v80;

    if v82 < 1e-10 then
        local _, v83 = solve(1, v77, v79);

        if v83 and v83 >= 0 then
            local v84 = v83 ^ 0.5;

            return v76 - v84, v76 + v84;
        end;

        return;
    end;

    local v85 = v82 ^ 0.5;
    local v86 = (v85 * v85 * v85 + v85 * v77 - v78) / (2 * v85);

    if v86 > -1e-10 and v86 < 1e-10 then
        return v76 - v85, v76;
    end;

    local v87, v88 = solve(1, v85, v86);
    local v89, v90 = solve(1, -v85, v79 / v86);

    if v87 and v89 then
        return v76 + v87, v76 + v88, v76 + v89, v76 + v90;
    end;

    if v87 then
        return v76 + v87, v76 + v88;
    end;

    if v89 then
        return v76 + v89, v76 + v90;
    end;
end;

v1.solve = solve;

local function u95(p91, p92, p93, p94) -- Line: 260
    if p91 and p91 >= 0 then
        return p91;
    end;

    if p92 and p92 >= 0 then
        return p92;
    end;

    if p93 and p93 >= 0 then
        return p93;
    end;

    if p94 and p94 >= 0 then
        return p94;
    end;
end;

v1.minpos = u95;

function v1.minposroot(p96, p97, p98, p99, p100) -- Line: 272
    -- upvalues: u95 (copy), solve (copy)
    return u95(solve(p96, p97, p98, p99, p100));
end;

function v1.cpoint_traj_point(p101, p102, p103) -- Line: 276
    -- upvalues: Dot (copy), solve (copy)
    local v104 = -2 * Dot(p103, p101);
    local v105 = 2 * (Dot(p101, p101) - Dot(p102, p103));
    local v106 = 3 * Dot(p102, p101);
    local v107, v107, v107, v107 = solve(Dot(p102, p102), v106, v105, v104);

    if not v107 or v107 < 0 then
        if not v107 or v107 < 0 then
            if not v107 or v107 < 0 then
                if not v107 or v107 < 0 then
                    v107 = nil;
                end;
            end;
        end;
    end;

    if v107 then
        return v107, v107 * p101 + v107 * v107 / 2 * p102;
    end;
end;

function v1.simple_trajectory(p108, p109, p110) -- Line: 286
    -- upvalues: Dot (copy), solve (copy)
    local v111 = 4 * Dot(p110, p110);
    local v112 = -4 * (Dot(p109, p110) + p108 * p108);
    local v113 = Dot(p109, p109);
    local v114, v115, v116, v117;

    if v113 then
        if v113 > -1e-10 and v113 < 1e-10 then
            v114, v115, v116, v117 = solve(v112, v111, nil, nil);
        elseif v111 then
            local v118 = -v112 / (2 * v113);
            local v119 = v118 * v118 - v111 / v113;

            if v119 < 0 then
                v114 = nil;
                v115 = nil;
                v116 = nil;
                v117 = nil;
            else
                local v120 = v119 ^ 0.5;
                v114 = v118 - v120;
                v115 = v118 + v120;
                v116 = nil;
                v117 = nil;
            end;
        elseif v112 then
            v114 = -v112 / v113;
            v115 = nil;
            v116 = nil;
            v117 = nil;
        else
            v114 = nil;
            v115 = nil;
            v116 = nil;
            v117 = nil;
        end;
    else
        v114 = nil;
        v115 = nil;
        v116 = nil;
        v117 = nil;
    end;

    if v114 and v114 >= 0 then
        v117 = v114;
    elseif v115 and v115 >= 0 then
        v117 = v115;
    elseif v116 and v116 >= 0 then
        v117 = v116;
    elseif not v117 or v117 < 0 then
        v117 = nil;
    end;

    if v117 then
        local v121 = v117 ^ 0.5;

        return p110 / v121 - v121 / 2 * p109;
    end;
end;

function v1.trajectory(p122, p123, p124, p125, p126, p127, p128) -- Line: 296
    -- upvalues: solve (copy), Dot (copy)
    local v129 = p125 - p122;
    local v130 = p126 - p123;
    local v131 = p127 - p124;
    local v132, v133, v134, v135 = solve(Dot(v131, v131) / 4, Dot(v131, v130), Dot(v131, v129) + Dot(v130, v130) - p128 * p128, 2 * Dot(v129, v130), Dot(v129, v129));

    if v132 and v132 > 0 then
        return v131 * v132 / 2 + p126 + v129 / v132, v132;
    end;

    if v133 and v133 > 0 then
        return v131 * v133 / 2 + p126 + v129 / v133, v133;
    end;

    if v134 and v134 > 0 then
        return v131 * v134 / 2 + p126 + v129 / v134, v134;
    end;

    if v135 and v135 > 0 then
        return v131 * v135 / 2 + p126 + v129 / v135, v135;
    end;
end;

return v1;
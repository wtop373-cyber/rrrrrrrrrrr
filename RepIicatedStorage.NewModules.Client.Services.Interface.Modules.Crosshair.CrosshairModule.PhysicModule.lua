-- ============================================================
-- SCRIPT: PhysicModule
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface.Modules.Crosshair.CrosshairModule.PhysicModule
-- ============================================================

-- Decompiled with Potassium's decompiler.

local v1 = {};
local table_sort = table.sort;
local math_atan2 = math.atan2;
local math_cos = math.cos;
local math_sin = math.sin;
local l_setmetatable = setmetatable;
local l_tick = tick;
local Dot = Vector3.new().Dot;
v1.spring = {};
local math_cos2 = math.cos;
local math_sin2 = math.sin;
local l_error = error;
local l_tostring = tostring;

local function posvel(p2, p3, p4, p5, p6, p7, p8) -- Line: 24
    -- upvalues: math_cos2 (copy), math_sin2 (copy)
    if p3 == 0 then
        return p4, p5;
    end;

    if p2 < 0.99999999 then
        local v9 = (1 - p2 * p2) ^ 0.5;
        local v10 = p4 - p6 + 2 * p2 / p3 * p7;
        local v11 = p2 / v9 * (p4 - p6) + p5 / (v9 * p3) + (2 * p2 * p2 - 1) / (v9 * p3) * p7;
        local v12 = math_cos2(v9 * p3 * p8);
        local v13 = math_sin2(v9 * p3 * p8);
        local v14 = 2.718281828459045 ^ (p2 * p3 * p8);

        return v12 / v14 * v10 + v13 / v14 * v11 + p6 + (p8 - 2 * p2 / p3) * p7, p3 * (v12 * v9 - p2 * v13) / v14 * v11 - p3 * (v12 * p2 + v9 * v13) / v14 * v10 + p7;
    end;

    if p2 < 1.00000001 then
        local v15 = p4 - p6 + 2 / p3 * p7;
        local v16 = p4 - p6 + (p5 + p7) / p3;
        local v17 = 2.718281828459045 ^ (p3 * p8);

        return (v15 + v16 * p3 * p8) / v17 + p6 + (p8 - 2 / p3) * p7, p7 - p3 / v17 * (v15 + (p3 * p8 - 1) * v16);
    end;

    local v18 = (p2 * p2 - 1) ^ 0.5;
    local v19 = (p7 - p5) / (2 * p3 * v18);
    local v20 = p2 / p3 * p7 - (p6 - p4) / 2;
    local v21 = (1 - p2 / v18) * v20 + v19;
    local v22 = (1 + p2 / v18) * v20 - v19;
    local v23 = 2.718281828459045 ^ (-(v18 + p2) * p3 * p8);
    local v24 = 2.718281828459045 ^ ((v18 - p2) * p3 * p8);

    return v21 * v23 + v22 * v24 + p6 + (p8 - 2 * p2 / p3) * p7, v24 * (v18 - p2) * p3 * v22 - v23 * (p2 + v18) * p3 * v21 + p7;
end;

local function targposvel(p25, p26, p27) -- Line: 55
    return p25 + p27 * p26, p26;
end;

function v1.spring.new(p28) -- Line: 59
    -- upvalues: l_tick (copy), posvel (copy), l_error (copy), l_tostring (copy), l_setmetatable (copy)
    local u29 = 1;
    local u30 = 1;
    local u31 = p28 or 0;
    local u32 = 0 * u31;
    local u33 = u31;
    local u34 = u32;
    local u35 = l_tick();
    local v36 = {};
    local v37 = {};

    function v36.getpv() -- Line: 71
        -- upvalues: posvel (ref), u29 (ref), u30 (ref), u31 (ref), u32 (ref), u33 (ref), u34 (ref), l_tick (ref), u35 (ref)
        return posvel(u29, u30, u31, u32, u33, u34, l_tick() - u35);
    end;

    function v36.setpv(p38, p39) -- Line: 75
        -- upvalues: l_tick (ref), u33 (ref), u34 (ref), u35 (ref), u31 (ref), u32 (ref)
        local v40 = l_tick();
        local v41 = u34;
        u31 = p38;
        u32 = p39;
        u33 = u33 + (v40 - u35) * v41;
        u34 = v41;
        u35 = v40;
    end;

    function v36.settargetpv(p42, p43) -- Line: 83
        -- upvalues: l_tick (ref), posvel (ref), u29 (ref), u30 (ref), u31 (ref), u32 (ref), u33 (ref), u34 (ref), u35 (ref)
        local v44 = l_tick();
        local v45, v46 = posvel(u29, u30, u31, u32, u33, u34, v44 - u35);
        u31 = v45;
        u32 = v46;
        u33 = p42;
        u34 = p43;
        u35 = v44;
    end;

    function v36.accelerate(p47, p48) -- Line: 91
        -- upvalues: l_tick (ref), posvel (ref), u29 (ref), u30 (ref), u31 (ref), u32 (ref), u33 (ref), u34 (ref), u35 (ref)
        local v49 = l_tick();
        local v50, v51 = posvel(u29, u30, u31, u32, u33, u34, v49 - u35);
        local v52 = u34;
        u31 = v50;
        u32 = v51 + p48;
        u33 = u33 + (v49 - u35) * v52;
        u34 = v52;
        u35 = v49;
    end;

    function v37.__index(p53, p54) -- Line: 100
        -- upvalues: l_tick (ref), posvel (ref), u29 (ref), u30 (ref), u31 (ref), u32 (ref), u33 (ref), u34 (ref), u35 (ref), l_error (ref), l_tostring (ref)
        local v55 = l_tick();

        if p54 == "p" or p54 == "position" then
            local v56, _ = posvel(u29, u30, u31, u32, u33, u34, v55 - u35);

            return v56;
        end;

        if p54 == "v" or p54 == "velocity" then
            local _, v57 = posvel(u29, u30, u31, u32, u33, u34, v55 - u35);

            return v57;
        end;

        if p54 == "tp" or (p54 == "t" or p54 == "targetposition") then
            return u33 + (v55 - u35) * u34;
        end;

        if p54 == "tv" or p54 == "targetvelocity" then
            local v58 = u34;
            local _ = u33 + (v55 - u35) * v58;

            return v58;
        end;

        if p54 == "d" or p54 == "damper" then
            return u29;
        end;

        if p54 == "s" or p54 == "speed" then
            return u30;
        end;

        l_error("no value " .. l_tostring(p54) .. " exists");
    end;

    function v37.__newindex(p59, p60, p61) -- Line: 123
        -- upvalues: l_tick (ref), posvel (ref), u29 (ref), u30 (ref), u31 (ref), u32 (ref), u33 (ref), u34 (ref), u35 (ref), l_error (ref), l_tostring (ref)
        local v62 = l_tick();

        if p60 == "p" or p60 == "position" then
            local _, v63 = posvel(u29, u30, u31, u32, u33, u34, v62 - u35);
            local v64 = u34;
            u31 = p61;
            u32 = v63;
            u33 = u33 + (v62 - u35) * v64;
            u34 = v64;
        elseif p60 == "v" or p60 == "velocity" then
            local v65, _ = posvel(u29, u30, u31, u32, u33, u34, v62 - u35);
            local v66 = u34;
            u31 = v65;
            u32 = p61;
            u33 = u33 + (v62 - u35) * v66;
            u34 = v66;
        elseif p60 == "tp" or (p60 == "t" or p60 == "targetposition") then
            local v67, v68 = posvel(u29, u30, u31, u32, u33, u34, v62 - u35);
            local v69 = u34;
            local _ = u33 + (v62 - u35) * v69;
            u31 = v67;
            u32 = v68;
            u33 = p61;
            u34 = v69;
        elseif p60 == "tv" or p60 == "targetvelocity" then
            local v70, v71 = posvel(u29, u30, u31, u32, u33, u34, v62 - u35);
            u31 = v70;
            u32 = v71;
            u33 = u33 + (v62 - u35) * u34;
            u34 = p61;
        elseif p60 == "d" or p60 == "damper" then
            local v72, v73 = posvel(u29, u30, u31, u32, u33, u34, v62 - u35);
            local v74 = u34;
            u31 = v72;
            u32 = v73;
            u33 = u33 + (v62 - u35) * v74;
            u34 = v74;
            u29 = p61;
        elseif p60 == "s" or p60 == "speed" then
            local v75, v76 = posvel(u29, u30, u31, u32, u33, u34, v62 - u35);
            local v77 = u34;
            u31 = v75;
            u32 = v76;
            u33 = u33 + (v62 - u35) * v77;
            u34 = v77;
            u30 = p61;
        elseif p60 == "a" or p60 == "acceleration" then
            local v78 = l_tick();
            local v79, v80 = posvel(u29, u30, u31, u32, u33, u34, v78 - u35);
            local v81 = u34;
            u31 = v79;
            u32 = v80 + p61;
            u33 = u33 + (v78 - u35) * v81;
            u34 = v81;
            u35 = v78;
        else
            l_error("no value " .. l_tostring(p60) .. " exists");
        end;

        u35 = v62;
    end;

    return l_setmetatable(v36, v37);
end;

local function rootreals4(p82, p83, p84, p85, p86) -- Line: 174
    -- upvalues: math_atan2 (copy), math_cos (copy)
    local v87 = 3 * p82;
    local v88 = -p83 / (4 * p82);
    local v89 = p84 * p84 - 3 * p83 * p85 + 12 * p82 * p86;
    local v90 = (p83 * p83 / (4 * p82) - 0.6666666666666666 * p84) / p82;
    local v91 = (p83 * (4 * p84 - p83 * p83 / p82) / p82 - 8 * p85) / p82;
    local v92 = p84 * (2 * p84 * p84 - 9 * p83 * p85 - 72 * p82 * p86) + 27 * p82 * p85 * p85 + 27 * p83 * p83 * p86;
    local v93 = v92 * v92 - 4 * v89 * v89 * v89;
    local v94;

    if v93 < 0 then
        local v95 = math_atan2((-v93) ^ 0.5, v92) / 3;
        local v96 = ((v92 * v92 - v93) / 4) ^ 0.16666666666666666;
        v94 = (v89 / v96 + v96) / v87 * math_cos(v95);
    else
        local v97 = (v92 + v93 ^ 0.5) / 2;
        local v98 = v97 < 0 and -(-v97) ^ 0.3333333333333333 or v97 ^ 0.3333333333333333;
        v94 = (v89 / v98 + v98) / v87;
    end;

    local v99 = 2 * v90 - v94;
    local v100 = v90 + v94;

    if v100 < 0 then
        local v101 = v91 / (4 * (-v100) ^ 0.5);
        local v102 = (v101 * v101 + v99 * v99) ^ 0.25 * math_cos(math_atan2(v101, v99) / 2) / 2;

        return v88 - v102, v88 - v102, v88 + v102, v88 + v102;
    end;

    local v103 = v100 ^ 0.5;
    local v104 = v91 / (4 * v103);
    local v105 = v99 - v104;
    local v106 = v99 + v104;
    local v107, v108;

    if v105 < 0 then
        v107 = v88 - v103 / 2;
        v108 = v88 - v103 / 2;
    else
        local v109 = v105 ^ 0.5;
        v107 = v88 - (v103 + v109) / 2;
        v108 = v88 - (v103 - v109) / 2;
    end;

    local v110, v111;

    if v106 < 0 then
        v110 = v88 + v103 / 2;
        v111 = v88 + v103 / 2;
    else
        local v112 = v106 ^ 0.5;
        v110 = v88 + (v103 - v112) / 2;
        v111 = v88 + (v103 + v112) / 2;
    end;

    if v108 >= v107 then
        local v113 = v108;
        v108 = v107;
        v107 = v113;
    end;

    if v110 >= v107 then
        local v114 = v110;
        v110 = v107;
        v107 = v114;
    end;

    if v111 >= v107 then
        local v115 = v107;
        v107 = v111;
        v111 = v115;
    end;

    if v110 >= v108 then
        local v116 = v110;
        v110 = v108;
        v108 = v116;
    end;

    if v111 >= v108 then
        local v117 = v108;
        v108 = v111;
        v111 = v117;
    end;

    if v111 >= v110 then
        local v118 = v110;
        v110 = v111;
        v111 = v118;
    end;

    return v111, v110, v108, v107;
end;

local function rootreals3(p119, p120, p121, p122) -- Line: 238
    -- upvalues: math_atan2 (copy), math_cos (copy), math_sin (copy)
    local v123 = p120 * p120 - 3 * p119 * p121;
    local v124 = 2 * p120 * p120 * p120 + 27 * p119 * p119 * p122 - 9 * p119 * p120 * p121;
    local v125 = v124 * v124 - 4 * v123 * v123 * v123;
    local v126 = -1 / (3 * p119);
    local v127, v128, v129;

    if v125 < 0 then
        local v130 = v124 / 2;
        local v131 = (-v125) ^ 0.5 / 2;
        local v132 = math_atan2(v131, v130) / 3;
        local v133 = (v130 * v130 + v131 * v131) ^ 0.16666666666666666;
        local v134 = v133 * math_cos(v132);
        local v135 = v133 * math_sin(v132);
        local _ = (1 + v123 / (v133 * v133)) / 2;
        local v136 = (v134 * v123 + (v134 - 2 * p120) * v133 * v133) / (6 * p119 * v133 * v133);
        local v137 = v135 * (v123 + v133 * v133) / (3.4641016151377544 * p119 * v133 * v133);
        v127 = -(p120 + v134 * (1 + v123 / (v133 * v133))) / (3 * p119);
        v128 = v136 - v137;
        v129 = v136 + v137;
    else
        local v138 = (v124 + v125 ^ 0.5) / 2;
        local v139 = v138 < 0 and -(-v138) ^ 0.3333333333333333 or v138 ^ 0.3333333333333333;
        v127 = v126 * (p120 + v139 + v123 / v139);
        v128 = v126 * (p120 - (v139 * v139 + v123) / (2 * v139));
        v129 = v128;
    end;

    if v128 >= v127 then
        local v140 = v128;
        v128 = v127;
        v127 = v140;
    end;

    if v129 >= v127 then
        local v141 = v127;
        v127 = v129;
        v129 = v141;
    end;

    if v129 >= v128 then
        local v142 = v128;
        v128 = v129;
        v129 = v142;
    end;

    return v129, v128, v127;
end;

local function rootreals2(p143, p144, p145) -- Line: 268
    local v146 = -p144 / (2 * p143);
    local v147 = v146 * v146 - p145 / p143;

    if v147 <= 0 then
        return v146, v146;
    end;

    local v148 = v147 ^ 0.5;

    return v146 - v148, v146 + v148;
end;

local u149 = nil;

local function solve(p150, p151, p152, p153, p154) -- Line: 281
    -- upvalues: solve (copy), u149 (ref), table_sort (copy), rootreals4 (copy), rootreals3 (copy)
    if p150 * p150 < 1e-32 then
        return solve(p151, p152, p153, p154);
    end;

    if p154 then
        if p154 * p154 < 1e-32 then
            return u149(p150, p151, p152, p153);
        end;

        if p151 * p151 < 1e-12 and p153 * p153 < 1e-12 then
            local v155 = {};
            local v156, v157 = solve(p150, p152, p154);

            if v156 then
                if v156 > 0 then
                    local v158 = v156 ^ 0.5;
                    v155[#v155 + 1] = -v158;
                    v155[#v155 + 1] = v158;
                elseif v156 * v156 < 1e-32 then
                    v155[#v155 + 1] = 0;
                end;
            end;

            if v157 then
                if v157 > 0 then
                    local v159 = v157 ^ 0.5;
                    v155[#v155 + 1] = -v159;
                    v155[#v155 + 1] = v159;
                elseif v157 * v157 < 1e-32 then
                    v155[#v155 + 1] = 0;
                end;
            end;

            table_sort(v155);

            return unpack(v155);
        end;

        local v160 = {};
        local v161 = {};
        local v162, v163, v164, v165 = rootreals4(p150, p151, p152, p153, p154);
        local v166, v167, v168 = rootreals3(4 * p150, 3 * p151, 2 * p152, p153);
        local v169 = (((p150 * v166 + p151) * v166 + p152) * v166 + p153) * v166 + p154;
        local v170 = (((p150 * v167 + p151) * v167 + p152) * v167 + p153) * v167 + p154;
        local v171 = (((p150 * v168 + p151) * v168 + p152) * v168 + p153) * v168 + p154;

        if p150 * (1 / 0) <= 0 == (v169 >= 0) then
            v160[#v160 + 1] = v162;
            v161[v162] = true;
        end;

        if v169 <= 0 == (v170 >= 0) and not v161[v163] then
            v160[#v160 + 1] = v163;
            v161[v163] = true;
        end;

        if v170 <= 0 == (v171 >= 0) and not v161[v164] then
            v160[#v160 + 1] = v164;
            v161[v164] = true;
        end;

        if v171 <= 0 == (p150 * (1 / 0) >= 0) and not v161[v165] then
            v160[#v160 + 1] = v165;
        end;

        return unpack(v160);
    end;

    if p153 then
        if p153 * p153 < 1e-32 then
            return u149(p150, p151, p152);
        end;

        if p151 * p151 < 1e-12 and p152 * p152 < 1e-12 then
            local v172 = p153 / p150;

            return v172 < 0 and (-v172) ^ 0.3333333333333333 or -v172 ^ 0.3333333333333333;
        end;

        local v173 = {};
        local v174 = {};
        local v175, v176, v177 = rootreals3(p150, p151, p152, p153);
        local v178 = 3 * p150;
        local v179 = -(2 * p151) / (2 * v178);
        local v180 = v179 * v179 - p152 / v178;
        local v181;

        if v180 > 0 then
            local v182 = v180 ^ 0.5;
            v181 = v179 - v182;
            v179 = v179 + v182;
        else
            v181 = v179;
        end;

        local v183 = ((p150 * v181 + p151) * v181 + p152) * v181 + p153;
        local v184 = ((p150 * v179 + p151) * v179 + p152) * v179 + p153;

        if -p150 * (1 / 0) <= 0 == (v183 >= 0) then
            v173[#v173 + 1] = v175;
            v174[v175] = true;
        end;

        if v183 <= 0 == (v184 >= 0) and not v174[v176] then
            v173[#v173 + 1] = v176;
            v174[v176] = true;
        end;

        if v184 <= 0 == (p150 * (1 / 0) >= 0) and not v174[v177] then
            v173[#v173 + 1] = v177;
        end;

        return unpack(v173);
    end;

    if p152 then
        local v185 = -p151 / (2 * p150);
        local v186 = v185 * v185 - p152 / p150;

        if v186 > 0 then
            local v187 = v186 ^ 0.5;

            return v185 - v187, v185 + v187;
        end;

        if v186 == 0 then
            return v185;
        end;
    elseif p151 and p150 * p150 > 1e-32 then
        return -p151 / p150;
    end;
end;

u149 = function(p188, p189, p190, p191, p192) -- Line: 376, Name: solvemoar
    -- upvalues: solve (copy), table_sort (copy)
    local v193 = { solve(p188, p189, p190, p191, p192) };
    local v194 = true;

    for i = 1, #v193 do
        if v193[i] == 0 then
            v194 = false;
            break;
        end;

        local _ = i;
    end;

    if v194 then
        v193[#v193 + 1] = 0;
        table_sort(v193);
    end;

    return unpack(v193);
end;

function v1.trajectory(p195, p196, p197, p198, p199, p200, p201) -- Line: 392
    -- upvalues: solve (copy), Dot (copy)
    local v202 = p198 - p195;
    local v203 = p199 - p196;
    local v204 = p200 - p197;
    local v205, v206, v207, v208 = solve(Dot(v204, v204) / 4, Dot(v204, v203), Dot(v204, v202) + Dot(v203, v203) - p201 * p201, 2 * Dot(v202, v203), Dot(v202, v202));

    if v205 and v205 > 0 then
        return v204 * v205 / 2 + p199 + v202 / v205, v205;
    end;

    if v206 and v206 > 0 then
        return v204 * v206 / 2 + p199 + v202 / v206, v206;
    end;

    if v207 and v207 > 0 then
        return v204 * v207 / 2 + p199 + v202 / v207, v207;
    end;

    if v208 and v208 > 0 then
        return v204 * v208 / 2 + p199 + v202 / v208, v208;
    end;
end;

return v1;
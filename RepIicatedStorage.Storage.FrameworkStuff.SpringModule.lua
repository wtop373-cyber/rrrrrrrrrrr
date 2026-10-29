-- ============================================================
-- SCRIPT: SpringModule
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.Storage.FrameworkStuff.SpringModule
-- ============================================================

-- Decompiled with Potassium's decompiler.

local v1 = {
    mt = {}
};
v1.mt.__index = v1;

function v1.new(p2) -- Line: 10
    local u3 = tick();
    local u4 = p2 or 0;
    local u5 = p2 and (0 * p2 or 0) or 0;
    local u6 = p2 or 0;
    local u7 = 1;
    local u8 = 1;

    local function positionvelocity(p9) -- Line: 18
        -- upvalues: u3 (ref), u4 (ref), u6 (ref), u8 (ref), u7 (ref), u5 (ref)
        local v10 = p9 - u3;
        local v11 = u4 - u6;

        if u8 == 0 then
            return u4, 0;
        end;

        if u7 >= 1 then
            local v12 = u5 / u8 + v11;
            local v13 = 2.718281828459045 ^ (u8 * v10);

            return u6 + (v11 + v12 * u8 * v10) / v13, u8 * (v12 - v11 - v12 * u8 * v10) / v13;
        end;

        local v14 = (1 - u7 * u7) ^ 0.5;
        local v15 = (u5 / u8 + u7 * v11) / v14;
        local math_cos_ret = math.cos(v14 * u8 * v10);
        local math_sin_ret = math.sin(v14 * u8 * v10);
        local v16 = 2.718281828459045 ^ (u7 * u8 * v10);

        return u6 + (v11 * math_cos_ret + v15 * math_sin_ret) / v16, u8 * ((v14 * v15 - u7 * v11) * math_cos_ret - (v14 * v11 + u7 * v15) * math_sin_ret) / v16;
    end;

    return setmetatable({}, {
        __index = function(p17, p18) -- Line: 39, Name: __index
            -- upvalues: positionvelocity (copy), u3 (ref), u4 (ref), u6 (ref), u8 (ref), u7 (ref), u5 (ref)
            if p18 == "value" or (p18 == "position" or p18 == "p") then
                local v19, _ = positionvelocity(tick());

                return v19;
            end;

            if p18 == "velocity" or p18 == "v" then
                local _, v20 = positionvelocity(tick());

                return v20;
            end;

            if p18 == "acceleration" or p18 == "a" then
                local v21 = tick() - u3;
                local v22 = u4 - u6;

                if u8 == 0 then
                    return 0;
                end;

                if u7 >= 1 then
                    local v23 = u5 / u8 + v22;

                    return u8 * u8 * (v22 - 2 * v23 + v23 * u8 * v21) / 2.718281828459045 ^ (u8 * v21);
                end;

                local v24 = (1 - u7 * u7) ^ 0.5;
                local v25 = (u5 / u8 + u7 * v22) / v24;

                return u8 * u8 * ((u7 * u7 * v22 - v24 * 2 * u7 * v25 - v24 * v24 * v22) * math.cos(v24 * u8 * v21) + (u7 * u7 * v25 + v24 * 2 * u7 * v22 - v24 * v24 * v25) * math.sin(v24 * u8 * v21)) / 2.718281828459045 ^ (u7 * u8 * v21);
            end;

            if p18 == "target" or p18 == "t" then
                return u6;
            end;

            if p18 == "damper" or p18 == "d" then
                return u7;
            end;

            if p18 == "speed" or p18 == "s" then
                return u8;
            end;
        end,

        __newindex = function(p26, p27, p28) -- Line: 70, Name: __newindex
            -- upvalues: positionvelocity (copy), u4 (ref), u5 (ref), u6 (ref), u7 (ref), u8 (ref), u3 (ref)
            local v29 = tick();

            if p27 == "value" or (p27 == "position" or p27 == "p") then
                local _, v30 = positionvelocity(v29);
                u4 = p28;
                u5 = v30;
            elseif p27 == "velocity" or p27 == "v" then
                local v31, _ = positionvelocity(v29);
                u4 = v31;
                u5 = p28;
            elseif p27 == "acceleration" or p27 == "a" then
                local v32, v33 = positionvelocity(v29);
                u4 = v32;
                u5 = v33 + p28;
            elseif p27 == "target" or p27 == "t" then
                local v34, v35 = positionvelocity(v29);
                u4 = v34;
                u5 = v35;
                u6 = p28;
            elseif p27 == "damper" or p27 == "d" then
                local v36, v37 = positionvelocity(v29);
                u4 = v36;
                u5 = v37;
                u7 = p28 < 0 and 0 or (p28 < 1 and p28 and p28 or 1);
            elseif p27 == "speed" or p27 == "s" then
                local v38, v39 = positionvelocity(v29);
                u4 = v38;
                u5 = v39;
                u8 = p28 < 0 and 0 or p28;
            end;

            u3 = v29;
        end
    });
end;

return v1;
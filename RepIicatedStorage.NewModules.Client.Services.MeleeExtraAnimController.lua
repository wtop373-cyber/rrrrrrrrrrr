-- ============================================================
-- SCRIPT: MeleeExtraAnimController
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.MeleeExtraAnimController
-- ============================================================

-- Decompiled with Potassium's decompiler.

local v1 = {};

local function safeNumber(p2, p3) -- Line: 58
    return typeof(p2) == "number" and p2 and p2 or p3;
end;

local function getAnimator(u4: userdata) -- Line: 62
    if not (u4 and u4.Parent) then
        return nil;
    end;

    local v5 = u4:FindFirstChildOfClass("Animator");

    if v5 then
        return v5;
    end;

    local success, result = pcall(function() -- Line: 67
        -- upvalues: u4 (copy)
        local Animator = Instance.new("Animator");
        Animator.Parent = u4;

        return Animator;
    end);

    return success and result and result or nil;
end;

local function cacheAnimations(u6: userdata) -- Line: 75
    local u7 = {};

    local function add(p8: string) -- Line: 77
        -- upvalues: u6 (copy), u7 (copy)
        local v9 = u6:FindFirstChild(p8);

        if v9 and v9:IsA("Animation") then
            u7[p8] = v9;
        end;
    end;

    local Equip = u6:FindFirstChild("Equip");

    if Equip and Equip:IsA("Animation") then
        u7.Equip = Equip;
    end;

    local Idle = u6:FindFirstChild("Idle");

    if Idle and Idle:IsA("Animation") then
        u7.Idle = Idle;
    end;

    local Inspect = u6:FindFirstChild("Inspect");

    if Inspect and Inspect:IsA("Animation") then
        u7.Inspect = Inspect;
    end;

    return u7;
end;

local function readConfig(p10: userdata) -- Line: 89
    local success, result = pcall(require, p10);

    if not success or typeof(result) ~= "table" then
        return nil, nil;
    end;

    local v11 = result.Controller or result.AnimationController;
    local v12 = result.AnimationsSource or p10;

    if typeof(v11) ~= "Instance" or not v11:IsA("AnimationController") then
        return nil, nil;
    end;

    if typeof(v12) == "Instance" then
        p10 = v12;
    end;

    return v11, p10;
end;

local function makeAddon(p13: userdata, p14: userdata) -- Line: 108
    -- upvalues: cacheAnimations (copy)
    local v15 = {};
    local u16 = p13;
    local u17 = p14;
    local u18 = nil;
    local u19 = {};
    local u20 = {};
    local u21 = false;

    local function invalidate() -- Line: 118
        -- upvalues: u18 (ref), u20 (copy), u19 (ref)
        u18 = nil;
        table.clear(u20);
        table.clear(u19);
    end;

    local function refresh() -- Line: 124
        -- upvalues: u21 (ref), u16 (ref), u18 (ref), u20 (copy), u19 (ref), u17 (ref), cacheAnimations (ref)
        if u21 then
            return false;
        end;

        if u16 and u16.Parent then
            if not (u18 and u18.Parent) then
                local u22 = u16;
                local v23;

                if u22 and u22.Parent then
                    v23 = u22:FindFirstChildOfClass("Animator");

                    if not v23 then
                        local success, result = pcall(function() -- Line: 67
                            -- upvalues: u22 (copy)
                            local Animator = Instance.new("Animator");
                            Animator.Parent = u22;

                            return Animator;
                        end);
                        v23 = success and result and result or nil;
                    end;
                else
                    v23 = nil;
                end;

                u18 = v23;
                table.clear(u20);
            end;

            if next(u19) == nil and (u17 and u17.Parent) then
                u19 = cacheAnimations(u17);
            end;

            return u18 ~= nil;
        end;

        u18 = nil;
        table.clear(u20);
        table.clear(u19);

        return false;
    end;

    local function loadTrack(p24: string) -- Line: 143
        -- upvalues: u21 (ref), u20 (copy), refresh (copy), u19 (ref), u18 (ref)
        if u21 then
            return nil;
        end;

        local v25 = u20[p24];

        if v25 and v25.Parent then
            return v25;
        end;

        if not refresh() then
            return nil;
        end;

        local u26 = u19[p24];

        if not u26 then
            return nil;
        end;

        local success, result = pcall(function() -- Line: 156
            -- upvalues: u18 (ref), u26 (copy)
            return u18:LoadAnimation(u26);
        end);

        if not (success and result) then
            return nil;
        end;

        u20[p24] = result;

        return result;
    end;

    function v15.Play(p27: table, p28: string, p29: number?, p30: number?, p31: number?) -- Line: 165
        -- upvalues: u21 (ref), loadTrack (copy)
        if u21 then
            return;
        end;

        if typeof(p28) ~= "string" then
            return;
        end;

        local u32 = loadTrack(p28);

        if not u32 then
            return;
        end;

        local v33 = p29;
        local v34 = typeof(v33) == "number" and (v33 or 0.1) or 0.1;
        local v35 = p30;
        local v36 = typeof(v35) == "number" and (v35 or 1) or 1;
        local v37 = p31;
        local u38 = typeof(v37) == "number" and (v37 or 1) or 1;
        local u39 = v34 < 0 and 0 or v34;
        local u40 = v36 < 0 and 0 or v36;
        pcall(function() -- Line: 179
            -- upvalues: u32 (copy), u39 (ref), u40 (ref), u38 (ref)
            u32:Play(u39, u40, u38);
        end);
    end;

    function v15.Stop(p41: table, p42: string, p43: number?) -- Line: 184
        -- upvalues: u21 (ref), u20 (copy)
        if u21 then
            return;
        end;

        if typeof(p42) ~= "string" then
            return;
        end;

        local u44 = u20[p42];

        if not u44 then
            return;
        end;

        local v45 = p43;
        local v46 = typeof(v45) == "number" and (v45 or 0.1) or 0.1;
        local u47 = v46 < 0 and 0 or v46;
        pcall(function() -- Line: 194
            -- upvalues: u44 (copy), u47 (ref)
            u44:Stop(u47);
        end);
    end;

    function v15.StopAll(p48: table, p49: number?) -- Line: 199
        -- upvalues: u21 (ref), u20 (copy)
        if u21 then
            return;
        end;

        local v50 = p49;
        local v51 = typeof(v50) == "number" and v50 or 0.1;
        local u52 = v51 < 0 and 0 or v51;

        for _, v in pairs(u20) do
            if v and v.Parent then
                pcall(function() -- Line: 206
                    -- upvalues: v (copy), u52 (ref)
                    v:Stop(u52);
                end);
            end;
        end;
    end;

    function v15.Disconnect(p53) -- Line: 213
        -- upvalues: u21 (ref), u20 (copy), u18 (ref), u19 (ref), u16 (ref), u17 (ref)
        if u21 then
            return;
        end;

        u21 = true;

        for _, v in pairs(u20) do
            if v and v.Parent then
                pcall(function() -- Line: 221
                    -- upvalues: v (copy)
                    v:Stop(0);
                end);
            end;
        end;

        u18 = nil;
        table.clear(u20);
        table.clear(u19);
        u16 = nil;
        u17 = nil;
    end;

    return v15;
end;

function v1.SetUp(p54: userdata) -- Line: 236
    -- upvalues: readConfig (copy), makeAddon (copy)
    if typeof(p54) ~= "Instance" or not p54:IsA("ModuleScript") then
        return nil;
    end;

    local v55, v56 = readConfig(p54);

    if v55 then
        return makeAddon(v55, v56);
    end;

    return nil;
end;

return v1;
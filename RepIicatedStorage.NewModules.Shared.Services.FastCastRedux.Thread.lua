-- ============================================================
-- SCRIPT: Thread
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Services.FastCastRedux.Thread
-- ============================================================

-- Decompiled with Potassium's decompiler.

local v1 = {};
local RunService = game:GetService("RunService");
local u2 = nil;

local function pushThread(p3, p4) -- Line: 24
    -- upvalues: u2 (ref)
    local v5 = { p3, p4 };

    if not u2 then
        u2 = v5;

        return;
    end;

    if p4 <= u2[2] then
        v5[3] = u2;
        u2 = v5;

        return;
    end;

    local v6 = u2;

    while v6[3] and v6[3][2] < p4 do
        v6 = v6[3];
    end;

    v5[3] = v6[3];

    if v6[3] then
        v5[3][4] = v5;
    end;

    v6[3] = v5;
    v5[4] = v6;
end;

RunService.Heartbeat:Connect(function() -- Line: 56, Name: popThreads
    -- upvalues: u2 (ref)
    local v7 = tick();

    while u2 and u2[2] - v7 < 0.005 do
        local v8 = u2[1];
        local v9 = u2[3];

        if v9 then
            v9[4] = nil;
        end;

        u2 = v9;
        coroutine.resume(v8, v7);
    end;
end);

function v1.Wait(p10, p11) -- Line: 83
    -- upvalues: pushThread (copy)
    local v12 = tonumber(p11);
    local v13 = tick();
    pushThread(coroutine.running(), v13 + (v12 or 0));

    return coroutine.yield() - v13, elapsedTime();
end;

function v1.Spawn(p14, u15, ...) -- Line: 95
    debug.profilebegin("Thread:Spawn");
    local u16 = { ... };
    local u17 = select("#", ...);
    local BindableEvent = Instance.new("BindableEvent");
    BindableEvent.Event:Connect(function(p18) -- Line: 102
        -- upvalues: u15 (copy)
        u15(p18());
    end);
    BindableEvent:Fire(function() -- Line: 106
        -- upvalues: u16 (copy), u17 (copy)
        return unpack(u16, 1, u17);
    end);
    debug.profileend();
end;

function v1.Delay(u19, u20, u21) -- Line: 113
    u19:Spawn(function() -- Line: 114
        -- upvalues: u19 (copy), u20 (copy), u21 (copy)
        local v22, v23 = u19:Wait(u20);
        u21(v22, v23);
    end);
end;

return v1;
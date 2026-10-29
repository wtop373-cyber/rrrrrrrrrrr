-- ============================================================
-- SCRIPT: Postie
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Services.Ping.Postie
-- ============================================================

-- Decompiled with Potassium's decompiler.

local HttpService = game:GetService("HttpService");
local RunService = game:GetService("RunService");
game:GetService("ReplicatedStorage");
local script_Sent = script.Sent;
local script_Received = script.Received;
local u1 = RunService:IsServer();
local u2 = {};
local u3 = {};

local function spawnNow(u4, ...) -- Line: 83
    local BindableEvent = Instance.new("BindableEvent");
    local table_pack_ret = table.pack(...);
    BindableEvent.Event:Connect(function() -- Line: 86
        -- upvalues: u4 (copy), table_pack_ret (copy)
        u4(table.unpack(table_pack_ret, 1, table_pack_ret.n));
    end);
    BindableEvent:Fire();
    BindableEvent:Destroy();
end;

local v27 = {
    InvokeClient = function(p5, u6, u7, ...) -- Line: 98, Name: InvokeClient
        -- upvalues: u1 (copy), HttpService (copy), u3 (copy), spawnNow (copy), script_Sent (copy)
        assert(u1, "Postie.InvokeClient can only be called from the server");
        local v8 = typeof(p5) == "string";
        assert(v8, "bad argument #1 to Postie.InvokeClient, expects string");
        local v9;

        if typeof(u6) == "Instance" then
            v9 = u6:IsA("Player");
        else
            v9 = false;
        end;

        assert(v9, "bad argument #2 to Postie.InvokeClient, expects Instance<Player>");
        local v10 = typeof(u7) == "number";
        assert(v10, "bad argument #3 to Postie.InvokeClient, expects number");
        local BindableEvent = Instance.new("BindableEvent");
        local u11 = false;
        local u12 = HttpService:GenerateGUID(false);

        u3[u12] = function(p13, p14, ...) -- Line: 108
            -- upvalues: u6 (copy), u12 (copy), u11 (ref), u3 (ref), BindableEvent (copy)
            if p13 ~= u6 or p14 ~= u12 then
                return false;
            end;

            u11 = true;
            u3[u12] = nil;
            BindableEvent:Fire(true, ...);

            return true;
        end;

        spawnNow(function() -- Line: 116
            -- upvalues: u7 (copy), u11 (ref), u3 (ref), u12 (copy), BindableEvent (copy)
            wait(u7);

            if u11 then
                return;
            end;

            u3[u12] = nil;
            BindableEvent:Fire(false);
        end);
        script_Sent:FireClient(u6, p5, u12, ...);

        return BindableEvent.Event:Wait();
    end,

    InvokeServer = function(p15, u16, ...) -- Line: 128, Name: InvokeServer
        -- upvalues: u1 (copy), HttpService (copy), u3 (copy), spawnNow (copy), script_Sent (copy)
        assert(not u1, "Postie.InvokeServer can only be called from the client");
        local v17 = typeof(p15) == "string";
        assert(v17, "bad argument #1 to Postie.InvokeServer, expects string");
        local v18 = typeof(u16) == "number";
        assert(v18, "bad argument #2 to Postie.InvokeServer, expects number");
        local BindableEvent = Instance.new("BindableEvent");
        local u19 = false;
        local u20 = HttpService:GenerateGUID(false);

        u3[u20] = function(p21, ...) -- Line: 137
            -- upvalues: u20 (copy), u19 (ref), u3 (ref), BindableEvent (copy)
            if p21 ~= u20 then
                return false;
            end;

            u19 = true;
            u3[u20] = nil;
            BindableEvent:Fire(true, ...);

            return true;
        end;

        spawnNow(function() -- Line: 145
            -- upvalues: u16 (copy), u19 (ref), u3 (ref), u20 (copy), BindableEvent (copy)
            wait(u16);

            if u19 then
                return;
            end;

            u3[u20] = nil;
            BindableEvent:Fire(false);
        end);
        script_Sent:FireServer(p15, u20, ...);

        return BindableEvent.Event:Wait();
    end,

    SetCallback = function(p22, p23) -- Line: 157, Name: SetCallback
        -- upvalues: u2 (copy)
        local v24 = typeof(p22) == "string";
        assert(v24, "bad argument #1 to Postie.SetCallback, expects string");
        u2[p22] = p23;
    end,

    GetCallback = function(p25) -- Line: 163, Name: GetCallback
        -- upvalues: u2 (copy)
        local v26 = typeof(p25) == "string";
        assert(v26, "bad argument #1 to Postie.GetCallback, expects string");

        return u2[p25];
    end
};

if u1 then
    script_Received.OnServerEvent:Connect(function(p28, p29, ...) -- Line: 173
        -- upvalues: u3 (copy)
        local v30 = u3[p29];

        if v30 then
            v30(p28, p29, ...);
        end;
    end);
    script_Sent.OnServerEvent:Connect(function(p31, p32, p33, ...) -- Line: 180
        -- upvalues: u2 (copy), script_Received (copy)
        local v34 = u2[p32];

        if v34 == nil then
            script_Received:FireClient(p31, p33);

            return;
        end;

        script_Received:FireClient(p31, p33, v34(p31, ...));
    end);

    return v27;
end;

script_Received.OnClientEvent:Connect(function(p35, ...) -- Line: 190
    -- upvalues: u3 (copy)
    local v36 = u3[p35];

    if v36 then
        v36(p35, ...);
    end;
end);
script_Sent.OnClientEvent:Connect(function(p37, p38, ...) -- Line: 197
    -- upvalues: u2 (copy), script_Received (copy)
    local v39 = u2[p37];

    if v39 == nil then
        script_Received:FireServer(p38);

        return;
    end;

    script_Received:FireServer(p38, v39(...));
end);

return v27;
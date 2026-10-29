-- ============================================================
-- SCRIPT: RemoteEventHandler
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.Shared.Utils.RemoteEventHandler
-- ============================================================

-- Decompiled with Potassium's decompiler.

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local RunService = game:GetService("RunService");
local GobEvents = ReplicatedStorage:WaitForChild("Assets").GobEvents;
local u1 = RunService:IsServer();
local RemoteEvent = GobEvents.RemoteEvent;
local u2 = {};
local u3 = nil;

local function disconnect(p4: table) -- Line: 26
    -- upvalues: u2 (copy)
    if not p4.Connected then
        return;
    end;

    p4.Connected = false;
    local v5 = u2[p4._key];

    if not v5 then
        return;
    end;

    local table_find_ret = table.find(v5, p4);

    if table_find_ret then
        table.remove(v5, table_find_ret);
    end;

    if #v5 == 0 then
        u2[p4._key] = nil;
    end;
end;

local function dispatch(p6, ...) -- Line: 44
    -- upvalues: u2 (copy)
    local v7 = u2[p6];

    if not v7 then
        return;
    end;

    for _, v in table.clone(v7) do
        if v.Connected then
            task.spawn(v._callback, ...);
        end;
    end;
end;

local function ensureDispatcher() -- Line: 65
    -- upvalues: u3 (ref), u1 (copy), RemoteEvent (copy), dispatch (copy)
    if u3 and u3.Connected then
        return;
    end;

    if u1 then
        u3 = RemoteEvent.OnServerEvent:Connect(function(p8: userdata, p9: any, ...) -- Line: 71
            -- upvalues: dispatch (ref)
            dispatch(p9, p8, ...);
        end);

        return;
    end;

    u3 = RemoteEvent.OnClientEvent:Connect(dispatch);
end;

local function attachCallback(p10: string, p11: function) -- Line: 79
    -- upvalues: disconnect (copy), u2 (copy), u3 (ref), u1 (copy), RemoteEvent (copy), dispatch (copy)
    local v12 = {
        Connected = true,
        Disconnect = disconnect,
        _key = p10,
        _callback = p11
    };
    local v13 = u2[p10];

    if not v13 then
        v13 = {};
        u2[p10] = v13;
    end;

    table.insert(v13, v12);

    if u3 and u3.Connected then
        return v12;
    end;

    if u1 then
        u3 = RemoteEvent.OnServerEvent:Connect(function(p14: userdata, p15: any, ...) -- Line: 71
            -- upvalues: dispatch (ref)
            dispatch(p15, p14, ...);
        end);

        return v12;
    end;

    u3 = RemoteEvent.OnClientEvent:Connect(dispatch);

    return v12;
end;

local function disconnectAll() -- Line: 99
    -- upvalues: u2 (copy), u3 (ref)
    for _, v in u2 do
        for _, v2 in v do
            v2.Connected = false;
        end;
    end;

    table.clear(u2);

    if u3 then
        u3:Disconnect();
        u3 = nil;
    end;
end;

local v16 = {};
v16.__index = v16;

if u1 then
    function v16.FireClient(p17: userdata, p18: string, ...) -- Line: 116
        -- upvalues: RemoteEvent (copy)
        RemoteEvent:FireClient(p17, p18, ...);
    end;

    function v16.FireAllClients(p19: string, ...) -- Line: 120
        -- upvalues: RemoteEvent (copy)
        RemoteEvent:FireAllClients(p19, ...);
    end;

    v16.AttachCallback = attachCallback;
    v16.DisconnectAll = disconnectAll;
else
    v16.AttachCallback = attachCallback;
    v16.DisconnectAll = disconnectAll;

    function v16.FireServer(...) -- Line: 132
        -- upvalues: u2 (copy), u3 (ref), u1 (copy), RemoteEvent (copy), dispatch (copy)
        if next(u2) and not (u3 and u3.Connected) then
            if u1 then
                u3 = RemoteEvent.OnServerEvent:Connect(function(p20: userdata, p21: any, ...) -- Line: 71
                    -- upvalues: dispatch (ref)
                    dispatch(p21, p20, ...);
                end);
            else
                u3 = RemoteEvent.OnClientEvent:Connect(dispatch);
            end;
        end;

        RemoteEvent:FireServer(...);
    end;
end;

return v16;
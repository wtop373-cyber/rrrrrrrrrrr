-- ============================================================
-- SCRIPT: BindableEventHandler
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.Shared.Utils.BindableEventHandler
-- ============================================================

-- Decompiled with Potassium's decompiler.

local u1 = {};
local u2 = {};
u1.__index = u1;

local function CreateBindable(p3: string) -- Line: 5
    local BindableEvent = Instance.new("BindableEvent");
    BindableEvent.Name = p3;
    BindableEvent.Parent = script;

    return BindableEvent;
end;

function u1.GetBindableEvents() -- Line: 12
    -- upvalues: u2 (copy)
    return u2;
end;

function u1.GetBindableEvent(p4: string) -- Line: 16
    -- upvalues: u2 (copy)
    return u2[p4];
end;

function u1.New(p5: string) -- Line: 20
    -- upvalues: u1 (copy), u2 (copy)
    if u1.GetBindableEvent(p5) ~= nil then
        return u1.GetBindableEvent(p5);
    end;

    local v6 = setmetatable({}, u1);
    v6.Name = p5;
    local BindableEvent = Instance.new("BindableEvent");
    BindableEvent.Name = p5;
    BindableEvent.Parent = script;
    v6.BindableEvent = BindableEvent;
    v6.Connections = {};
    u2[p5] = v6;

    return v6;
end;

function u1.Fire(p7, ...) -- Line: 32
    p7.BindableEvent:Fire(...);
end;

function u1.AttachCallback(p8, u9) -- Line: 36
    local v10 = p8.BindableEvent.Event:Connect(function(...) -- Line: 37
        -- upvalues: u9 (copy)
        u9(...);
    end);
    table.insert(p8.Connections, v10);

    return v10;
end;

function u1.DisconnectAll(p11) -- Line: 44
    for _, v in p11.Connections do
        v:Disconnect();
    end;

    table.clear(p11.Connections);
end;

return u1;
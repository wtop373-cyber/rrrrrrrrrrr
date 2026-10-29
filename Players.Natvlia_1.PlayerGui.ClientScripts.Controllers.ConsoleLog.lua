-- ============================================================
-- SCRIPT: ConsoleLog
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.ConsoleLog
-- ============================================================

-- Decompiled with Potassium's decompiler.

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local LogService = game:GetService("LogService");
local v1 = {};

local function pack(p2: table, p3: number, p4: number) -- Line: 15
    local table_create_ret = table.create((math.max(0, p4 - p3 + 1)));

    for i = p3, p4 do
        local v5 = p2[i];
        table.insert(table_create_ret, {
            message = v5.message,
            messageType = v5.messageType,
            timestamp = v5.timestamp
        });
        local _ = i;
    end;

    return table_create_ret;
end;

local function continuesFrom(p6: table, p7: table) -- Line: 31
    local Total = p7.Total;

    if typeof(Total) ~= "number" or (Total < 0 or (Total % 1 ~= 0 or #p6 < Total)) then
        return false;
    end;

    if Total == 0 then
        return true;
    end;

    local v8 = p6[Total];
    local v9;

    if v8.timestamp == p7.Timestamp and (p7.Length == nil or #v8.message == p7.Length) then
        v9 = string.sub(v8.message, 1, 200) == p7.Message;
    else
        v9 = false;
    end;

    return v9;
end;

ReplicatedStorage:WaitForChild("Assets").GobEvents.ReturnLogs.OnClientInvoke = function(p10) -- Line: 48
    -- upvalues: LogService (copy), pack (copy), continuesFrom (copy)
    local LogHistory = LogService:GetLogHistory();
    local v11 = #LogHistory;

    if typeof(p10) == "table" then
        return not continuesFrom(LogHistory, p10) and {
            Mode = "full",
            Total = v11,
            Entries = pack(LogHistory, 1, v11)
        } or (p10.Total == v11 and {
            Mode = "unchanged"
        } or {
            Mode = "append",
            Total = v11,
            Entries = pack(LogHistory, p10.Total + 1, v11)
        });
    end;

    return pack(LogHistory, 1, v11);
end;

function v1.init() -- Line: 63
end;

return v1;
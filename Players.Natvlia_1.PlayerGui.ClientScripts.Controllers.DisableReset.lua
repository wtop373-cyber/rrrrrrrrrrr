-- ============================================================
-- SCRIPT: DisableReset
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.DisableReset
-- ============================================================

-- Decompiled with Potassium's decompiler.

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local StarterGui = game:GetService("StarterGui");
local RunService = game:GetService("RunService");
local RemoteEventHandler = require(ReplicatedStorage.Shared.Utils.RemoteEventHandler);
local v1 = {};

local function coreCall(p2, ...) -- Line: 11
    -- upvalues: StarterGui (copy), RunService (copy)
    local v3 = {};

    for i = 1, 8 do
        v3 = { pcall(StarterGui[p2], StarterGui, ...) };

        if v3[1] then
            break;
        end;

        RunService.Stepped:Wait();
        local _ = i;
    end;

    return unpack(v3);
end;

function v1.init() -- Line: 23
    -- upvalues: RemoteEventHandler (copy), coreCall (copy)
    RemoteEventHandler.AttachCallback("DisableReset", function() -- Line: 24
        -- upvalues: coreCall (ref)
        assert(coreCall("SetCore", "ResetButtonCallback", false));
    end);
    RemoteEventHandler.AttachCallback("EnableReset", function() -- Line: 30
        -- upvalues: coreCall (ref)
        assert(coreCall("SetCore", "ResetButtonCallback", true));
    end);
end;

return v1;
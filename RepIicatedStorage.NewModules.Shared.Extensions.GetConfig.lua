-- ============================================================
-- SCRIPT: GetConfig
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Extensions.GetConfig
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local DeepCopy = require(ReplicatedStorage.NewModules.Shared.Extensions.DeepCopy);
local GetConfigAddon = require(ReplicatedStorage.NewModules.Shared.Extensions.GetConfigAddon);
local u2 = setmetatable({}, {
    __mode = "k"
});

return function(u3, p4) -- Line: 10
    -- upvalues: u2 (copy), DeepCopy (copy), GetConfigAddon (copy)
    if p4 and typeof(u3) == "Instance" then
        local Config = u3:FindFirstChild("Config");

        if Config and not (Config:FindFirstChild("Addon") or Config:FindFirstChild("Addon2")) then
            local v5 = u2[Config];

            if v5 then
                return v5;
            end;

            local success, result = pcall(function() -- Line: 18
                -- upvalues: DeepCopy (ref), Config (copy)
                return DeepCopy(require(Config));
            end);

            if success and result ~= nil then
                u2[Config] = result;

                return result;
            end;
        end;
    end;

    local success, result = pcall(function() -- Line: 29
        -- upvalues: DeepCopy (ref), u3 (copy), GetConfigAddon (ref)
        local v6 = DeepCopy(require(u3:WaitForChild("Config", 3)));

        if v6 then
            v6 = GetConfigAddon(u3, v6);
        end;

        return v6;
    end);

    if success then
        return result;
    end;

    warn("Config-get error:", (tostring(u3)));

    return nil;
end;
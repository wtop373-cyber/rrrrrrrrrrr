-- ============================================================
-- SCRIPT: Moments
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Moments
-- ============================================================

-- Decompiled with Potassium's decompiler.

local LocalPlayer = game:GetService("Players").LocalPlayer;
local u1 = {};
local v2 = {};

for _, v in ipairs({ "Glance", "Shelf", "Drift" }) do
    local u3 = script:FindFirstChild(v);
    local success, result = pcall(function() -- Line: 10
        -- upvalues: u3 (copy)
        local v4 = u3 and require(u3);

        return v4;
    end);

    if success and type(result) == "table" then
        u1[v] = result;

        if result.Start then
            task.spawn(result.Start);
        end;
    end;
end;

LocalPlayer:GetAttributeChangedSignal("Cue"):Connect(function() -- Line: 21, Name: cue
    -- upvalues: LocalPlayer (copy), u1 (copy)
    local Attribute = LocalPlayer:GetAttribute("Cue");
    local v5;

    if type(Attribute) == "string" then
        v5 = string.match(Attribute, "^(%a+):");
    else
        v5 = false;
    end;

    if v5 then
        v5 = u1[v5];
    end;

    if v5 and v5.Force then
        task.spawn(v5.Force);
    end;
end);

return v2;
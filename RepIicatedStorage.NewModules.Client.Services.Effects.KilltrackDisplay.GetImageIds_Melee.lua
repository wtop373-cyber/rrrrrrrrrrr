-- ============================================================
-- SCRIPT: GetImageIds_Melee
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Effects.KilltrackDisplay.GetImageIds_Melee
-- ============================================================

-- Decompiled with Potassium's decompiler.

local u1 = {
    [" "] = "",
    ["0"] = "rbxassetid://15053143264",
    ["1"] = "rbxassetid://15053683216",
    I = "rbxassetid://12713351699",
    ["2"] = "rbxassetid://15053682963",
    ["3"] = "rbxassetid://15053682650",
    ["4"] = "rbxassetid://15053682438",
    ["5"] = "rbxassetid://15053682105",
    ["6"] = "rbxassetid://15053681861",
    ["7"] = "rbxassetid://15053681620",
    ["8"] = "rbxassetid://15053681391",
    ["9"] = "rbxassetid://15053681148",
    a = "rbxassetid://15063973654",
    d = "rbxassetid://15063973414",
    f = "rbxassetid://15063973194",
    r = "rbxassetid://15063972981",
    u = "rbxassetid://15063972690",
    ["!"] = "rbxassetid://15064360084"
};

return function(p2) -- Line: 31
    -- upvalues: u1 (copy)
    local v3 = ("%6i"):format(p2);
    local v4 = {};

    for i = 1, #v3 do
        local v5 = u1[v3:sub(i, i)];
        table.insert(v4, i, v5);
        local _ = i;
    end;

    return v4;
end;
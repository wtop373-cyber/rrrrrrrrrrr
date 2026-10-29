-- ============================================================
-- SCRIPT: GetImageIds_Gun
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Effects.KilltrackDisplay.GetImageIds_Gun
-- ============================================================

-- Decompiled with Potassium's decompiler.

local u1 = {
    ["0"] = "rbxassetid://12713475328",
    ["1"] = "rbxassetid://12713351699",
    I = "rbxassetid://12713351699",
    ["2"] = "rbxassetid://12713351597",
    ["3"] = "rbxassetid://12713351460",
    ["4"] = "rbxassetid://12713351334",
    ["5"] = "rbxassetid://12713351194",
    ["6"] = "rbxassetid://12713351045",
    ["7"] = "rbxassetid://12713350835",
    ["8"] = "rbxassetid://12713350680",
    ["9"] = "rbxassetid://12713350502",
    a = "rbxassetid://12715163294",
    b = "rbxassetid://12792717002",
    c = "rbxassetid://12724261515",
    d = "rbxassetid://12724261250",
    e = "rbxassetid://12715165445",
    f = "rbxassetid://12715163486",
    g = "rbxassetid://12723346337",
    h = "rbxassetid://12724261362",
    l = "rbxassetid://12723346070",
    m = "rbxassetid://12715163632",
    n = "rbxassetid://12723345781",
    o = "rbxassetid://12715163792",
    p = "rbxassetid://12766780760",
    r = "rbxassetid://12715163977",
    s = "rbxassetid://12715164144",
    t = "rbxassetid://12715164291",
    u = "rbxassetid://12715164442",
    w = "rbxassetid://12715164582",
    ["-"] = "rbxassetid://12715062334",
    [":"] = "rbxassetid://12713352314",
    ["<"] = "rbxassetid://12724488049",
    [">"] = "rbxassetid://12724488266",
    ["~"] = "rbxassetid://12724488421",
    ["?"] = "rbxassetid://12724488546",
    ["!"] = "rbxassetid://12724488685",
    ["."] = "rbxassetid://12725172656",
    ["%"] = "rbxassetid://12767086930"
};

return function(p2) -- Line: 44
    -- upvalues: u1 (copy)
    local v3 = ("%0.6i"):format(p2);
    local v4 = {};

    for i = 1, #v3 do
        local v5 = u1[v3:sub(i, i)];
        table.insert(v4, i, v5);
        local _ = i;
    end;

    return v4;
end;
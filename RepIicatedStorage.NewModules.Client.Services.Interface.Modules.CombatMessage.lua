-- ============================================================
-- SCRIPT: CombatMessage
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface.Modules.CombatMessage
-- ============================================================

-- Decompiled with Potassium's decompiler.

local RunService = game:GetService("RunService");
local CombatZone = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("CombatZone");
local Value = script:WaitForChild("F1A").Value;
local Value2 = script:WaitForChild("F1B").Value;
local Value3 = script:WaitForChild("F2").Value;
local CoreGUI = script.Parent.Parent.CoreGUI;
local u1 = script:WaitForChild("CombatMsg"):Clone();
CombatZone.OnClientEvent:Connect(function(p2, p3, p4) -- Line: 17, Name: new
    -- upvalues: CoreGUI (copy), u1 (copy), Value (copy), Value2 (copy), Value3 (copy), RunService (copy)
    local v5 = "Entering " .. p4 .. ": ";
    local v6;

    if p2 == "Leaving" then
        v5 = "Leaving " .. p4;
        v6 = "";
    else
        v6 = "\"" .. p3 .. "\"";
    end;

    if CoreGUI:FindFirstChild(u1.Name) then
        CoreGUI[u1.Name]:Destroy();
    end;

    local v7 = u1:Clone();
    game.Debris:AddItem(v7, 10);
    v7.Text = v5 .. (p4 == "Combat-Zone" and Value or Value2) .. v6 .. Value3;
    v7.Parent = CoreGUI;
    local v8 = tick();
    local v9 = 0;

    while v7 and (v7.Parent and v9 < 1) do
        local v10 = tick() - v8;
        local NumberSequence_new_ret = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(math.min(v9 + 0, 0.9999), 0),
            NumberSequenceKeypoint.new(math.min(v9 + 0.15, 1), 1),
            NumberSequenceKeypoint.new(1, 1)
        });
        v7.G.Transparency = NumberSequence_new_ret;
        v9 = math.min(v9 + v10 * 0.7, 1);
        v8 = tick();
        RunService.RenderStepped:Wait();
    end;

    if v7 and v7.Parent then
        v7.G.Transparency = NumberSequence.new(0);
        wait(5);
        local v11 = tick();
        local v12 = 0;

        while v7 and (v7.Parent and v12 < 1) do
            local v13 = tick() - v11;
            v7.G.Transparency = NumberSequence.new(v12);
            v12 = math.min(v12 + v13 * 0.7, 1);
            v11 = tick();
            RunService.RenderStepped:Wait();
        end;

        if v7 and v7.Parent then
            v7:Destroy();
        end;
    end;
end);

return {};
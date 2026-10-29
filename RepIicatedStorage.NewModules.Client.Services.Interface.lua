-- ============================================================
-- SCRIPT: Interface
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface
-- ============================================================

-- Decompiled with Potassium's decompiler.

game:GetService("Players");
game:GetService("ReplicatedStorage");
local script_CoreGUI = script.CoreGUI;
local u1 = { "Stats", "Reputation", "Settings", "Warn", "Store", "Skins", "Kill", "Starterpack", "SocialRewards", "UgcEvent", "Shop", "Hud", "Crosshair", "Backpack", "AtmVending", "CombatMessage", "IndependenceEvent", "TheGamesEvent", "Last" };
local Children = script.Modules:GetChildren();
table.sort(Children, function(p2, p3) -- Line: 36
    -- upvalues: u1 (copy)
    return (table.find(u1, p2.Name) or (1 / 0)) < (table.find(u1, p3.Name) or (1 / 0));
end);

for _, v in pairs(Children) do
    task.spawn(function() -- Line: 41
        -- upvalues: v (copy), script_CoreGUI (copy)
        local v4 = require(v);

        if v4.new then
            v4.new(script_CoreGUI);
        end;
    end);
end;

return nil;
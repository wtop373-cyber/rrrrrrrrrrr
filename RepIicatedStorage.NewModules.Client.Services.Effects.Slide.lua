-- ============================================================
-- SCRIPT: Slide
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Effects.Slide
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
local ReplicatedStorage = game:GetService("ReplicatedStorage");
game:GetService("Debris");
local SoundService = game:GetService("SoundService");
local FrameworkStuff = ReplicatedStorage.Storage.FrameworkStuff;
local LocalPlayer = game.Players.LocalPlayer;

return function(p2) -- Line: 26
    -- upvalues: LocalPlayer (copy), FrameworkStuff (copy), SoundService (copy)
    if not (p2 and p2.Parent) then
        return;
    end;

    if p2:FindFirstChild("Torso") then
        if p2 ~= LocalPlayer.Character and p2.Torso:GetAttribute("Invisible") then
            return;
        end;

        local v3 = FrameworkStuff.SlideSound:Clone();
        game.Debris:AddItem(v3, 3);
        v3.EmitterSize = v3.EmitterSize * 1.2;

        if p2 == LocalPlayer.Character then
            v3.Volume = v3.Volume / 4;
            v3.RollOffMinDistance = v3.RollOffMinDistance * 5;
            v3.RollOffMaxDistance = v3.RollOffMaxDistance * 1.5;
        else
            v3.Volume = v3.Volume * 4.25;
            v3.RollOffMaxDistance = v3.RollOffMaxDistance * 1.25;
        end;

        v3.SoundGroup = SoundService.Main;

        if p2 == LocalPlayer.Character and _G.FP then
            v3.Parent = workspace.CurrentCamera;
        else
            v3.Parent = p2:FindFirstChild("Torso");
        end;

        v3:Play();
    end;
end;
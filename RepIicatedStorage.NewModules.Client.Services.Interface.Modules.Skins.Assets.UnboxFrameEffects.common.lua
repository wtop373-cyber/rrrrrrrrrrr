-- ============================================================
-- SCRIPT: common
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface.Modules.Skins.Assets.UnboxFrameEffects.common
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
local TweenService = game:GetService("TweenService");

return function(p2, p3, p4) -- Line: 7
    -- upvalues: TweenService (copy)
    p2.ZIndex = 5;
    local v5 = script.Frame:Clone();
    v5.BackgroundColor3 = p4.RarityBands[p3] or Color3.new(1, 1, 1);
    game.Debris:AddItem(v5, 2);
    v5.Parent = p2;
    TweenService:Create(v5, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        BackgroundTransparency = 1
    }):Play();

    return true;
end;
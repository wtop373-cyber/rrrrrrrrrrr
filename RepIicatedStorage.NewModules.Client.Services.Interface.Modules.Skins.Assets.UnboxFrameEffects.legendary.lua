-- ============================================================
-- SCRIPT: legendary
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface.Modules.Skins.Assets.UnboxFrameEffects.legendary
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
local TweenService = game:GetService("TweenService");

return function(u2, p3, p4) -- Line: 12
    -- upvalues: TweenService (copy)
    local u5 = script.Frame:Clone();
    local Color3_new_ret = Color3.new(1, 0, 0);
    u5.BackgroundColor3 = Color3_new_ret;
    game.Debris:AddItem(u5, 3);
    u5.Parent = u2;
    TweenService:Create(u5, TweenInfo.new(1.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        BackgroundTransparency = 1
    }):Play();
    task.delay(0, function() -- Line: 23
        -- upvalues: u2 (copy), TweenService (ref), Color3_new_ret (copy), u5 (copy)
        for i = 1, 8 do
            local v6 = script.Frame2:Clone();
            game.Debris:AddItem(v6, 2);
            v6.BackgroundTransparency = 0.75;
            v6.Parent = u2;
            local v7 = 1;

            if i == 2 then
                v7 = v7 * 1.5;
            end;

            TweenService:Create(v6, TweenInfo.new(v7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0)
            }):Play();
            local v8 = script.Frame2:Clone();
            game.Debris:AddItem(v8, 2);
            v8.BackgroundTransparency = 0.65;
            v8.BackgroundColor3 = Color3_new_ret;
            v8.Size = UDim2.new(1, 0, 0, 0);
            v8.Parent = u2;
            TweenService:Create(v8, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0)
            }):Play();
            local _ = i;

            for i2 = 1, 10 do
                local v9 = script.ImageLabel:Clone();
                game.Debris:AddItem(v9, 2);
                v9.ImageTransparency = 0;
                v9.Rotation = math.random(-360, 360);
                v9.ImageTransparency = math.random(0, 60) / 100;
                v9.Position = UDim2.new(math.random(5, 95) / 100, 0, math.random(15, 85) / 100, 0);
                v9.Parent = u2;
                TweenService:Create(v9, TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    ImageTransparency = 1
                }):Play();
                local _ = i2;
            end;

            local v10 = u5:FindFirstChildOfClass("UIStroke");

            if v10 then
                v10:Destroy();
            end;

            local UIStroke = Instance.new("UIStroke");
            game.Debris:AddItem(UIStroke, 1);
            UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
            UIStroke.LineJoinMode = Enum.LineJoinMode.Miter;
            UIStroke.Color = Color3_new_ret:Lerp(Color3.new(1, 1, 1), 0.2);
            UIStroke.Thickness = 0;
            UIStroke.Transparency = 0;
            UIStroke.Parent = u5;
            TweenService:Create(UIStroke, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Thickness = 25,
                Transparency = 1
            }):Play();
            task.wait(0.15);
        end;
    end);

    return true;
end;
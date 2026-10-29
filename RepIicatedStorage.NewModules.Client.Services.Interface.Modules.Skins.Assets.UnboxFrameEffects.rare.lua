-- ============================================================
-- SCRIPT: rare
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface.Modules.Skins.Assets.UnboxFrameEffects.rare
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
local TweenService = game:GetService("TweenService");

return function(u2, u3, u4) -- Line: 11
    -- upvalues: TweenService (copy)
    local u5 = script.Frame:Clone();
    u5.BackgroundColor3 = u4.RarityBands[u3] or Color3.new(1, 1, 1);
    game.Debris:AddItem(u5, 3);
    u5.Parent = u2;
    TweenService:Create(u5, TweenInfo.new(1.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        BackgroundTransparency = 1
    }):Play();
    task.delay(0, function() -- Line: 19
        -- upvalues: u2 (copy), TweenService (ref), u4 (copy), u3 (copy), u5 (copy)
        for i = 1, 2 do
            local v6 = script.Frame2:Clone();
            game.Debris:AddItem(v6, 2);
            v6.BackgroundTransparency = 0.5;
            v6.Parent = u2;
            local v7 = 1;

            if i == 2 then
                v7 = v7 * 1.5;
            end;

            TweenService:Create(v6, TweenInfo.new(v7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0)
            }):Play();

            if i == 1 then
                local v8 = script.Frame2:Clone();
                game.Debris:AddItem(v8, 2);
                v8.BackgroundTransparency = 0.65;
                v8.BackgroundColor3 = u4.RarityBands[u3] and u4.RarityBands[u3]:Lerp(Color3.new(1, 1, 1), 0.5) or Color3.new(1, 1, 1);
                v8.Size = UDim2.new(0, 0, 1, 0);
                v8.Parent = u2;
                TweenService:Create(v8, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 1, 0)
                }):Play();
            end;

            local _ = i;

            for i2 = 1, 4 do
                local v9 = script.ImageLabel:Clone();
                game.Debris:AddItem(v9, 2);
                v9.ImageColor3 = u4.RarityBands[u3] and u4.RarityBands[u3]:Lerp(Color3.new(1, 1, 1), 0.75) or Color3.new(1, 1, 1);
                v9.ImageTransparency = 0;
                v9.Rotation = math.random(-360, 360);
                v9.Position = UDim2.new(math.random(15, 85) / 100, 0, 0.5, 0);
                v9.Parent = u2;
                TweenService:Create(v9, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
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
            UIStroke.Color = u4.RarityBands[u3] and u4.RarityBands[u3]:Lerp(Color3.new(1, 1, 1), 0.5) or Color3.new(1, 1, 1);
            UIStroke.Thickness = 0;
            UIStroke.Transparency = 0;
            UIStroke.Parent = u5;
            TweenService:Create(UIStroke, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Thickness = 15,
                Transparency = 1
            }):Play();
            task.wait(0.4);
        end;
    end);

    return true;
end;
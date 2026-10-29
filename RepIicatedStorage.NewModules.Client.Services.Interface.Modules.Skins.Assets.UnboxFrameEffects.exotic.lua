-- ============================================================
-- SCRIPT: exotic
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface.Modules.Skins.Assets.UnboxFrameEffects.exotic
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
    local NumberValue = Instance.new("NumberValue");
    NumberValue.Name = "FOV_AOSD(SDLIMITED";
    game.Debris:AddItem(NumberValue, 16);
    local v6 = _G.GVF and _G.GVF();

    if v6 then
        NumberValue.Parent = v6.FOVs;
    end;

    local u7 = nil;
    local u8 = nil;
    local success, result = pcall(function() -- Line: 29
        -- upvalues: u7 (ref), u2 (copy), u8 (ref)
        u7 = u2.Parent.ViewportFrame:FindFirstChildOfClass("Camera");
        u8 = u7.FieldOfView;
    end);

    if not success then
        warn(result);
    end;

    local Color3_new_ret = Color3.new(1, 0.54902, 0);
    u5.BackgroundColor3 = Color3_new_ret;
    game.Debris:AddItem(u5, 3);
    u5.Parent = u2;
    TweenService:Create(u5, TweenInfo.new(1.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        BackgroundTransparency = 1
    }):Play();
    task.delay(0, function() -- Line: 45
        -- upvalues: u2 (copy), NumberValue (copy), TweenService (ref), u7 (ref), u8 (ref), Color3_new_ret (copy), u5 (copy)
        for i = 1, 27 do
            local v9 = script.Frame2:Clone();
            game.Debris:AddItem(v9, 2);
            v9.BackgroundTransparency = 0.875;
            v9.Parent = u2;
            local v10 = 1;

            if i == 2 then
                v10 = v10 * 1.5;
            end;

            if NumberValue and NumberValue.Parent then
                NumberValue.Value = 1;
                TweenService:Create(NumberValue, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    Value = 0
                }):Play();
            end;

            if u7 then
                u7.FieldOfView = u8 + 1;
                TweenService:Create(u7, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    FieldOfView = u8
                }):Play();
            end;

            TweenService:Create(v9, TweenInfo.new(v10, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0)
            }):Play();
            local v11 = script.Frame2:Clone();
            game.Debris:AddItem(v11, 2);
            v11.BackgroundTransparency = 0.85;
            v11.BackgroundColor3 = Color3_new_ret;
            v11.Size = UDim2.new(1, 0, 0, 0);
            v11.Parent = u2;
            TweenService:Create(v11, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0)
            }):Play();
            local _ = i;

            for i2 = 1, 10 do
                local v12 = script.ImageLabel:Clone();
                game.Debris:AddItem(v12, 2);
                v12.ImageTransparency = 0;
                v12.Rotation = math.random(-360, 360);
                v12.ImageTransparency = math.random(70, 90) / 100;
                v12.Position = UDim2.new(math.random(5, 95) / 100, 0, math.random(15, 85) / 100, 0);
                v12.Parent = u2;
                TweenService:Create(v12, TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    ImageTransparency = 1
                }):Play();
                local _ = i2;
            end;

            local v13 = u5:FindFirstChildOfClass("UIStroke");

            if v13 then
                v13:Destroy();
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
            task.wait(0.1);
        end;
    end);

    return true;
end;
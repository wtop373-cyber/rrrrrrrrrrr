-- ============================================================
-- SCRIPT: limited
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface.Modules.Skins.Assets.UnboxFrameEffects.limited
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
local TweenService = game:GetService("TweenService");

return function(u2, p3, p4, p5) -- Line: 12
    -- upvalues: TweenService (copy)
    local u6 = p5;

    if not u6 then
        u6 = script.unbox_limited:Clone();
        u6.Parent = u2.Parent.Parent.Parent;
        u6:Play();
    end;

    u2.ZIndex = 5;
    local NumberValue = Instance.new("NumberValue");
    NumberValue.Name = "FOV_AOSD(SDLIMITED";
    game.Debris:AddItem(NumberValue, 16);
    local v7 = _G.GVF and _G.GVF();

    if v7 then
        NumberValue.Parent = v7.FOVs;
    end;

    local u8 = nil;
    local u9 = nil;
    local success, result = pcall(function() -- Line: 34
        -- upvalues: u8 (ref), u2 (copy), u9 (ref)
        u8 = u2.Parent.ViewportFrame:FindFirstChildOfClass("Camera");
        u9 = u8.FieldOfView;
        u2.Parent.ViewportFrame.LightColor = Color3.new(1, 1, 1);
        u2.Parent.ViewportFrame.Ambient = Color3.fromRGB(38, 38, 38);

        if not u2.Parent.ViewportFrame:GetAttribute("HasCustomLightDirection") then
            u2.Parent.ViewportFrame.LightDirection = Vector3.new(0.8, 0.5, 0);
        end;
    end);

    if not success then
        warn(result);
    end;

    local u10 = script.Frame:Clone();
    local limited = p4.RarityBands.limited;
    u10.BackgroundColor3 = limited:Lerp(Color3.new(1, 1, 1), 0.5);
    task.delay(16, function() -- Line: 54
        -- upvalues: u10 (copy)
        if u10 and u10.Parent then
            u10:Destroy();
        end;
    end);
    u10.Parent = u2;

    local function DoHit1() -- Line: 61
        -- upvalues: u10 (copy), TweenService (ref)
        u10.BackgroundTransparency = 0.5;
        TweenService:Create(u10, TweenInfo.new(1.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            BackgroundTransparency = 1
        }):Play();
    end;

    local function DoHit2() -- Line: 66
        -- upvalues: u2 (copy), NumberValue (copy), TweenService (ref), u8 (ref), u9 (ref), limited (copy), u10 (copy)
        local v11 = script.Frame2:Clone();
        game.Debris:AddItem(v11, 2);
        v11.BackgroundTransparency = 0.75;
        v11.Parent = u2;
        local v12 = 1;

        if i == 2 then
            v12 = v12 * 1.5;
        end;

        if NumberValue and NumberValue.Parent then
            NumberValue.Value = 15;
            TweenService:Create(NumberValue, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Value = 0
            }):Play();
        end;

        if u8 then
            u8.FieldOfView = u9 + 5;
            TweenService:Create(u8, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                FieldOfView = u9
            }):Play();
        end;

        TweenService:Create(v11, TweenInfo.new(v12, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 1, 0)
        }):Play();
        local v13 = script.Frame2:Clone();
        game.Debris:AddItem(v13, 2);
        v13.BackgroundTransparency = 0.65;
        v13.BackgroundColor3 = limited;
        v13.Size = UDim2.new(1, 0, 0, 0);
        v13.Parent = u2;
        TweenService:Create(v13, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 1, 0)
        }):Play();

        for i2 = 1, 7 do
            local v14 = script.ImageLabel:Clone();
            game.Debris:AddItem(v14, 2);
            v14.ImageColor3 = limited:Lerp(Color3.new(1, 1, 1), 0.75);
            v14.ImageTransparency = 0;
            v14.Rotation = math.random(-360, 360);
            v14.ImageTransparency = math.random(0, 60) / 100;
            v14.Position = UDim2.new(math.random(5, 95) / 100, 0, math.random(15, 85) / 100, 0);
            v14.Parent = u2;
            TweenService:Create(v14, TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                ImageTransparency = 1
            }):Play();
            local _ = i2;
        end;

        local v15 = u10:FindFirstChildOfClass("UIStroke");

        if v15 then
            v15:Destroy();
        end;

        local UIStroke = Instance.new("UIStroke");
        game.Debris:AddItem(UIStroke, 1);
        UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
        UIStroke.LineJoinMode = Enum.LineJoinMode.Miter;
        UIStroke.Color = limited:Lerp(Color3.new(1, 1, 1), 0.2);
        UIStroke.Thickness = 0;
        UIStroke.Transparency = 0;
        UIStroke.Parent = u10;
        TweenService:Create(UIStroke, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Thickness = 25,
            Transparency = 1
        }):Play();
    end;

    local u16 = nil;
    local u18 = game:GetService("RunService").RenderStepped:Connect(function(p17) -- Line: 138
        -- upvalues: u6 (ref), DoHit2 (copy), DoHit1 (copy)
        if u6.PlaybackLoudness > 300 then
            DoHit2();

            return;
        end;

        if u6.PlaybackLoudness >= 270 then
            DoHit1();
        end;
    end);
    u16 = u10.AncestryChanged:Connect(function(p19, p20) -- Line: 148
        -- upvalues: u16 (ref), u18 (ref)
        if not p20 then
            u16:Disconnect();
            u18:Disconnect();
        end;
    end);

    return true;
end;
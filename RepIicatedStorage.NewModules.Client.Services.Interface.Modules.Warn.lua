-- ============================================================
-- SCRIPT: Warn
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface.Modules.Warn
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 16
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);

return {
    new = function(u2) -- Line: 28, Name: new
        local ReplicatedStorage = game:GetService("ReplicatedStorage");
        game:GetService("RunService");
        local Players = game:GetService("Players");
        local TweenService = game:GetService("TweenService");
        local Events = ReplicatedStorage:WaitForChild("Events");
        local Events2 = ReplicatedStorage:WaitForChild("Events2");
        local _ = Players.LocalPlayer;
        local UISounds = ReplicatedStorage:WaitForChild("Storage"):WaitForChild("UISounds");

        local function NewWarn(p3) -- Line: 41
            -- upvalues: u2 (copy), UISounds (copy), TweenService (copy)
            local v4 = p3[1];
            local v5 = p3[2];
            local v6 = p3[3];
            local v7 = p3[4];
            local v8 = p3[5];

            if not v4 or tostring(v4) == "" then
                return;
            end;

            local v9 = v5 or 1;
            local v10 = p3[6];

            if v10 then
                for _, child in ipairs(u2:GetChildren()) do
                    if child:GetAttribute("WarnKey") == v10 then
                        child:Destroy();
                    end;
                end;
            end;

            local u11 = script.TextLabel:Clone();
            game.Debris:AddItem(u11, v9 + 1);
            u11.Text = v4;

            if v10 then
                u11:SetAttribute("WarnKey", v10);
            end;

            u11.TextColor3 = v6 or u11.TextColor3;
            u11.TextStrokeColor3 = v7 or u11.TextStrokeColor3;
            u11.Parent = u2;

            if v8 and UISounds:FindFirstChild((tostring(v8))) then
                UISounds:FindFirstChild((tostring(v8))):Play();
            end;

            delay(v9, function() -- Line: 71
                -- upvalues: TweenService (ref), u11 (copy)
                TweenService:Create(u11, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    TextTransparency = 1,
                    TextStrokeTransparency = 1,
                    Position = UDim2.new(0.5, 0, 0, 50)
                }):Play();
            end);
        end;

        Events.ClientWarn.OnClientEvent:Connect(NewWarn);
        Events2.ClientWarn.Event:Connect(NewWarn);
    end
};
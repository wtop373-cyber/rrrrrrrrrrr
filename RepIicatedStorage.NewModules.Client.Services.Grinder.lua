-- ============================================================
-- SCRIPT: Grinder
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Grinder
-- ============================================================

-- Decompiled with Potassium's decompiler.

local RunService = game:GetService("RunService");
local workspace_CurrentCamera = workspace.CurrentCamera;

if _G.Compliance and _G.Compliance.NoGrinders then
    return nil;
end;

task.spawn(function() -- Line: 8
    -- upvalues: workspace_CurrentCamera (copy), RunService (copy)
    local Parts = workspace:WaitForChild("Map"):WaitForChild("Parts");
    local v1 = Parts and Parts:FindFirstChild("Grinders");
    local u2 = v1;
    local success, result = pcall(function() -- Line: 11
        -- upvalues: u2 (ref), workspace_CurrentCamera (ref), RunService (ref)
        if not (u2 and u2:FindFirstChild("Grinder")) then
            return;
        end;

        while true do
            while (workspace_CurrentCamera.CFrame.Position - u2.Grinder.Position).Magnitude <= 100 do
                local _, v3 = workspace_CurrentCamera:WorldToScreenPoint(u2.Grinder.Position);

                if v3 then
                    for _, child in pairs(u2:GetChildren()) do
                        local CFrame2 = child.CFrame;
                        local CFrame_Angles = CFrame.Angles;
                        local v4 = 25 * (math.random(100, 165) / 100);
                        child.CFrame = CFrame2 * CFrame_Angles(0, math.rad(v4), 0);
                        child.Velocity = child.CFrame.LookVector * 15;
                    end;
                end;

                RunService.Heartbeat:Wait();
            end;

            task.wait(0.5);
        end;
    end);

    if not success then
        warn("Grinder error: " .. tostring(result));
    end;
end);

return nil;
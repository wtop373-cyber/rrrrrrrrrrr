-- ============================================================
-- SCRIPT: ViewportCharacter
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.ViewportCharacter
-- ============================================================

-- Decompiled with Potassium's decompiler.

local RunService = game:GetService("RunService");

return function(p1, p2, p3, p4) -- Line: 3
    -- upvalues: RunService (copy)
    local Camera = Instance.new("Camera");
    Camera.FieldOfView = p4 or 40;
    local v5 = p1:Clone();

    if v5:FindFirstChildOfClass("Tool") then
        v5:FindFirstChildOfClass("Tool"):Destroy();
    end;

    v5.Parent = p2;
    local Head = v5.Head;
    v5:FindFirstChild("Torso");
    v5:FindFirstChild("Left Arm");
    v5:FindFirstChild("Right Arm");
    local v6 = v5:FindFirstChild("Left Leg");
    local v7 = v5:FindFirstChild("Right Leg");
    v5.Parent = workspace;

    if v5.PrimaryPart then
        v5.PrimaryPart.CFrame = v5.PrimaryPart.CFrame + Vector3.new(0, 100000, 0);
    end;

    RunService.Heartbeat:Wait();
    v5.Parent = p2;

    if v6 then
        v6:Destroy();
    end;

    if v7 then
        v7:Destroy();
    end;

    local _ = Head.CFrame;
    Camera.CFrame = (Head.CFrame + Head.CFrame.LookVector * (p3 or 3)) * CFrame.Angles(0, 3.141592653589793, 0);
    p2.CurrentCamera = Camera;

    return Camera;
end;
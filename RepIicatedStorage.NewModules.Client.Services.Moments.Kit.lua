-- ============================================================
-- SCRIPT: Kit
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Moments.Kit
-- ============================================================

-- Decompiled with Potassium's decompiler.

local u1 = {};
local LocalPlayer = game:GetService("Players").LocalPlayer;
local Figure = script.Parent:FindFirstChild("Figure");

function u1.Figure() -- Line: 8
    -- upvalues: Figure (ref)
    Figure = Figure or script.Parent:FindFirstChild("Figure");
    local v2 = Figure and Figure:Clone();

    return v2;
end;

function u1.Screen(p3) -- Line: 13
    -- upvalues: LocalPlayer (copy)
    local ScreenGui = Instance.new("ScreenGui");
    ScreenGui.Name = "Overlay";
    ScreenGui.IgnoreGuiInset = true;
    ScreenGui.ResetOnSpawn = false;
    ScreenGui.DisplayOrder = p3 or 1000;
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui");

    return ScreenGui;
end;

function u1.Fill(p4, p5, p6) -- Line: 24
    local Frame = Instance.new("Frame");
    Frame.Size = UDim2.fromScale(1, 1);
    Frame.BackgroundColor3 = p5;
    Frame.BorderSizePixel = 0;
    Frame.ZIndex = p6 or 1;
    Frame.Parent = p4;

    return Frame;
end;

function u1.Flash(p7) -- Line: 34
    -- upvalues: u1 (copy)
    local u8 = u1.Screen(100000);
    u1.Fill(u8, Color3.new(0, 0, 0));
    task.delay(p7 or 0.15, function() -- Line: 37
        -- upvalues: u8 (copy)
        u8:Destroy();
    end);

    return u8;
end;

function u1.Visible(p9, p10, p11) -- Line: 43
    local _, v12 = p10:WorldToViewportPoint(p9.Position);

    if not v12 then
        return false;
    end;

    local Position = p10.CFrame.Position;
    local v13 = p9.Position - Position;
    local table_clone_ret = table.clone(p11 or {});
    local RaycastParams_new_ret = RaycastParams.new();
    RaycastParams_new_ret.FilterType = Enum.RaycastFilterType.Exclude;

    for i = 1, 4 do
        RaycastParams_new_ret.FilterDescendantsInstances = table_clone_ret;
        local v14 = workspace:Raycast(Position, v13, RaycastParams_new_ret);

        if not v14 or (v14.Position - Position).Magnitude >= v13.Magnitude - 1 then
            return true;
        end;

        if v14.Instance.Transparency < 0.5 then
            return false;
        end;

        table.insert(table_clone_ret, v14.Instance);
        local _ = i;
    end;

    return false;
end;

return u1;
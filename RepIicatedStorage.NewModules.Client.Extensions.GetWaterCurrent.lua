-- ============================================================
-- SCRIPT: GetWaterCurrent
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Extensions.GetWaterCurrent
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 2
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
local NewModules = game:GetService("ReplicatedStorage"):WaitForChild("NewModules");
require(NewModules.Shared.Services.RotatedRegion3);
local WaterCurrents = workspace.Filter.WaterCurrents;

return function(p2, p3) -- Line: 10
    -- upvalues: WaterCurrents (copy)
    local v4 = p2.Position - Vector3.new(p3, p3, p3);
    local v5 = p2.Position + Vector3.new(p3, p3, p3);
    local Region3_new_ret = Region3.new(v4, v5);
    local v6 = workspace:FindPartsInRegion3WithWhiteList(Region3_new_ret, { WaterCurrents }, 10);
    local v7 = Vector3.new(0, 0, 0);

    for _, _ in pairs(v6) do
        v7 = v7 + v6[1].CFrame.LookVector * (v6[1].Force.Value * 10);
    end;

    return v7;
end;
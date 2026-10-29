-- ============================================================
-- SCRIPT: BBOV
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.Storage.FrameworkStuff.BBOV
-- ============================================================

-- Decompiled with Potassium's decompiler.

local v1 = {};

local function Lerp(p2, p3, p4) -- Line: 3
    return p2 + (p3 - p2) * p4;
end;

local _ = workspace.CurrentCamera;
game.Players.LocalPlayer:GetMouse();
game:GetService("TweenService");
local UserInputService = game:GetService("UserInputService");
local Movement = require(script:FindFirstChild("Movement"));
local script_LogicModule = require(script.LogicModule);
local u5 = Movement.create();

function v1.Movement(p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17) -- Line: 31
    -- upvalues: UserInputService (copy), script_LogicModule (copy), u5 (copy)
    local v18;

    if p7 and p8 then
        local v19 = math.min(p7.WalkSpeed, p8.Velocity.Magnitude) / p7.WalkSpeed * p7.WalkSpeed;
        v18 = math.min(v19, 35);
    else
        v18 = 0;
    end;

    UserInputService:GetMouseDelta();
    local Bobbing = script_LogicModule.getBobbing(p12, p17, p9);
    local Bobbing2 = script_LogicModule.getBobbing(p13, p17, p10);
    u5:shove(Vector3.new(Bobbing, Bobbing2, script_LogicModule.getBobbing(p14, p17, p11)) / 100 * p6 * 60 * (v18 * (p6 * 60)));
    local v20 = u5:update(p6);

    return CFrame.Angles(v20.y, v20.x, v20.z) * CFrame.new(v20.x, v20.y, 0);
end;

return v1;
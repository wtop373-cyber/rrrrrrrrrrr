-- ============================================================
-- SCRIPT: ReloadM
-- CLASS:  ModuleScript
-- PATH:   Players.MACHAK00.Backpack.Deagle.ReloadM
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
local u2 = {
    RCode = 0,
    Reloading = false
};
game:GetService("SoundService");
local PhysicsService = game:GetService("PhysicsService");
local RunService = game:GetService("RunService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local script_Parent = script.Parent;
local Config = require(script_Parent:WaitForChild("Config"));
local u3 = require(ReplicatedStorage.NewModules.Shared.Extensions.GetConfigAddon)(script_Parent, Config);
local u4 = require(ReplicatedStorage.NewModules.Shared.Extensions.GetReloadModifierConfig)(script_Parent);
local u5 = script_Parent:WaitForChild(u3.HandleName or "Handle");
local MagPart = u5:FindFirstChild("Parts"):FindFirstChild("MagPart");
local u6 = nil;

local function PS(p7, p8) -- Line: 31
    -- upvalues: u6 (ref), u4 (copy), u5 (copy), MagPart (copy)
    if p8:FindFirstChild(p7) then
        p8[p7]:Play();
        u6 = p8[p7];

        if u4 then
            u4.PS(p7, p8, u5, MagPart);
        end;
    end;
end;

local function GetA(p9) -- Line: 42
    -- upvalues: u5 (copy)
    if not p9 then
        return u5:FindFirstChild("ReloadA_Clone_Server");
    end;

    local v10 = u5:FindFirstChild("ReloadA"):Clone();
    v10.Name = "ReloadA_Clone";
    v10.Parent = u5;
    game.Debris:AddItem(v10, 10);

    return v10;
end;

local function ammoTransNum(p11) -- Line: 55
    -- upvalues: script_Parent (copy)
    return p11 and script_Parent.Values.SERVER_Ammo.Value <= 0 and 1 or ((p11 or script_Parent.Values.Ammo.Value > 0) and 0 or 1);
end;

local function isReloading(p12) -- Line: 59
    -- upvalues: u2 (copy)
    return u2.Reloading and u2.RCode == p12;
end;

function u2.R(p13, p14, p15) -- Line: 63
    -- upvalues: u5 (copy), u3 (ref), u2 (copy), MagPart (copy), script_Parent (copy), RunService (copy), PhysicsService (copy), u6 (ref), u4 (copy)
    local u16;

    if p13 then
        u16 = u5:FindFirstChild("ReloadA"):Clone();
        u16.Name = "ReloadA_Clone";
        u16.Parent = u5;
        game.Debris:AddItem(u16, 10);
    else
        u16 = u5:FindFirstChild("ReloadA_Clone_Server");
    end;

    local u17 = u3.ReloadAnimSpeed * (p15 or 1);

    if u16 then
        u2.Reloading = true;
        local math_random_ret = math.random();
        u2.RCode = math_random_ret;
        coroutine.wrap(function() -- Line: 72
            -- upvalues: u3 (ref), MagPart (ref), u17 (copy), u16 (copy), math_random_ret (copy), u2 (ref), script_Parent (ref), RunService (ref), PhysicsService (ref)
            if u3.MagSettings.DropMag and (MagPart and MagPart.Parent) then
                task.wait(u3.MagSettings.DropWait / u17);

                if u16 and (u16.Parent and (MagPart and MagPart.Parent)) then
                    if u2.Reloading and u2.RCode == math_random_ret then
                        MagPart.Transparency = 1;
                        MagPart.BulletPart.Transparency = 1;
                        local u18 = MagPart:Clone();
                        game.Debris:AddItem(u18, 5);
                        u18.Transparency = 0;
                        u18.BulletPart.Transparency = script_Parent.Values.Ammo.Value <= 0 and 1 or 0;
                        local v19 = (function() -- Line: 87, Name: fpCheck
                            -- upvalues: RunService (ref), script_Parent (ref), MagPart (ref)
                            if RunService:IsClient() and (script_Parent.Parent == game.Players.LocalPlayer.Character and (_G.VM and (_G.VM.Enabled and (_G.VM.Check(script_Parent) and (_G.VM.CloneTool and _G.VM.CloneTool:FindFirstChild(MagPart.Name)))))) then
                                return _G.VM.CloneTool:FindFirstChild(MagPart.Name);
                            end;
                        end)();
                        u18.CFrame = v19 and v19.CFrame or MagPart.CFrame;
                        u18.Parent = workspace.Debris;
                        pcall(function() -- Line: 97
                            -- upvalues: u18 (copy), PhysicsService (ref)
                            u18.CanCollide = false;
                            u18.CollisionGroupId = PhysicsService:GetCollisionGroupId("NoCharCollide");
                            u18.CanCollide = true;
                            u18.SurfaceAppearance:Destroy();
                        end);
                        local v20 = v19 or MagPart;
                        u18.Velocity = v20.CFrame.UpVector * u3.MagSettings.DropForce + v20.CFrame.UpVector * -10 + v20.CFrame.RightVector * 10 + MagPart.Velocity;
                    end;
                end;
            end;
        end)();
        coroutine.wrap(function() -- Line: 117
            -- upvalues: u17 (copy), math_random_ret (copy), u2 (ref), MagPart (ref)
            task.wait(1.03 / u17);

            if not (u2.Reloading and u2.RCode == math_random_ret) then
                return;
            end;

            MagPart.Transparency = 0;
            MagPart.BulletPart.Transparency = 0;
        end)();
        MagPart.Transparency = 0;
        MagPart.BulletPart.Transparency = 1;
        task.wait(0.25 / u17);

        if u16:FindFirstChild("MagOut") then
            u16.MagOut:Play();
            u6 = u16.MagOut;

            if u4 then
                u4.PS("MagOut", u16, u5, MagPart);
            end;
        end;

        task.wait(1.3 / u17);

        if u16:FindFirstChild("MagIn") then
            u16.MagIn:Play();
            u6 = u16.MagIn;

            if u4 then
                u4.PS("MagIn", u16, u5, MagPart);
            end;
        end;

        task.wait(0.6 / u17);
        task.wait(0.25 / u17);

        if u16:FindFirstChild("SlideIn") then
            u16.SlideIn:Play();
            u6 = u16.SlideIn;

            if u4 then
                u4.PS("SlideIn", u16, u5, MagPart);
            end;
        end;

        if u6 and u6.Parent then
            task.wait(u6.TimeLength);
        end;

        task.wait(2);

        if u16 and u16.Parent then
            u16:Destroy();
        end;
    end;
end;

function u2.OF(p21) -- Line: 148
    -- upvalues: u2 (copy), script_Parent (copy), MagPart (copy)
    u2.Reloading = false;
    u2.RCode = math.random();
    local v22 = script_Parent.Values.Ammo.Value <= 0 and 1 or 0;
    MagPart.Transparency = 0;
    MagPart.BulletPart.Transparency = v22;
end;

function u2.C(p23) -- Line: 158
    -- upvalues: u2 (copy), MagPart (copy), script_Parent (copy)
    local math_random_ret = math.random();
    u2.RCode = math_random_ret;
    u2.Reloading = false;
    MagPart.Transparency = 1;
    MagPart.BulletPart.Transparency = 1;
    task.wait(0.2);

    if u2.RCode == math_random_ret then
        local v24 = script_Parent.Values.Ammo.Value <= 0 and 1 or 0;
        MagPart.Transparency = 0;
        MagPart.BulletPart.Transparency = v24;
    end;
end;

function M__newindex()
    error("Can\'t change protected table.");
end;

u2.__index = u2;

function u2.__tostring(p25) -- Line: 182
    local v26 = "";

    for i, v in pairs(p25) do
        v26 = v26 .. "Key: " .. tostring(i) .. " - Value: " .. tostring(v) .. " \n";
    end;

    return v26;
end;

function u2.__concat(p27, p28) -- Line: 191
    return tostring(p27) .. tostring(p28);
end;

function u2.__call() -- Line: 194
    return "Version: 0.0.0";
end;

return u2;
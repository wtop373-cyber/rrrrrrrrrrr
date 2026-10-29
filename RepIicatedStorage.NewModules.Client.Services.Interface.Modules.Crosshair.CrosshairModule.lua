-- ============================================================
-- SCRIPT: CrosshairModule
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface.Modules.Crosshair.CrosshairModule
-- ============================================================

-- Decompiled with Potassium's decompiler.

local RunService = game:GetService("RunService");
local TweenService = game:GetService("TweenService");
game:GetService("UserInputService");
local CoreGUI = script.Parent.Parent.Parent.CoreGUI;
local PhysicModule = require(script:WaitForChild("PhysicModule"));
CoreGUI:WaitForChild("Crosshair");
script:WaitForChild("Main");
local UserInputService = game:GetService("UserInputService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local u1 = 0;
local u2 = u1 * 0;
local u3 = u1;
local u4 = u2;
local u5 = tick();

local function posvel(p6, p7, p8, p9, p10, p11, p12) -- Line: 27
    if p7 == 0 then
        return p8;
    end;

    if p6 < 0.99999999 then
        local v13 = (1 - p6 * p6) ^ 0.5;
        local v14 = p8 - p10 + 2 * p6 / p7 * p11;
        local v15 = p6 / v13 * (p8 - p10) + p9 / (v13 * p7) + (2 * p6 * p6 - 1) / (v13 * p7) * p11;
        local math_cos_ret = math.cos(v13 * p7 * p12);
        local math_sin_ret = math.sin(v13 * p7 * p12);
        local v16 = 2.718281828459045 ^ (p6 * p7 * p12);

        return math_cos_ret / v16 * v14 + math_sin_ret / v16 * v15 + p10 + (p12 - 2 * p6 / p7) * p11, p7 * (math_cos_ret * v13 - p6 * math_sin_ret) / v16 * v15 - p7 * (math_cos_ret * p6 + v13 * math_sin_ret) / v16 * v14 + p11;
    end;

    if p6 < 1.00000001 then
        local v17 = p8 - p10 + 2 / p7 * p11;
        local v18 = p8 - p10 + (p9 + p11) / p7;
        local v19 = 2.718281828459045 ^ (p7 * p12);

        return (v17 + v18 * p7 * p12) / v19 + p10 + (p12 - 2 / p7) * p11, p11 - p7 / v19 * (v17 + (p7 * p12 - 1) * v18);
    end;

    local v20 = (p6 * p6 - 1) ^ 0.5;
    local v21 = (p11 - p9) / (2 * p7 * v20);
    local v22 = p6 / p7 * p11 - (p10 - p8) / 2;
    local v23 = (1 - p6 / v20) * v22 + v21;
    local v24 = (1 + p6 / v20) * v22 - v21;
    local v25 = 2.718281828459045 ^ (-(v20 + p6) * p7 * p12);
    local v26 = 2.718281828459045 ^ ((v20 - p6) * p7 * p12);

    return v23 * v25 + v24 * v26 + p10 + (p12 - 2 * p6 / p7) * p11, v26 * (v20 - p6) * p7 * v24 - v25 * (p6 + v20) * p7 * v23 + p11;
end;

local function targposvel(p27, p28, p29) -- Line: 58
    return p27 + p29 * p28, p28;
end;

({}).accelerate = function(p30, p31) -- Line: 64, Name: accelerate
    -- upvalues: u1 (ref), u2 (ref), u3 (ref), u4 (ref), u5 (ref)
    local v32 = tick();
    local v33 = u1;
    local v34 = u3;
    local v35 = u4;
    local v36 = v32 - u5;
    local v37 = v33 - v34 + 2 * v35;
    local v38 = v33 - v34 + (u2 + v35) / 1;
    local v39 = 2.718281828459045 ^ (1 * v36);
    local v40 = u4;
    u1 = (v37 + v38 * 1 * v36) / v39 + v34 + (v36 - 2) * v35;
    u2 = v35 - 1 / v39 * (v37 + (1 * v36 - 1) * v38) + p31;
    u3 = u3 + (v32 - u5) * v40;
    u4 = v40;
    u5 = v32;

    return setmetatable(p30);
end;

local u41 = {};
local u42 = nil;
local u43 = nil;
local u44 = nil;

local function updatecross(u45) -- Line: 81
    local success, result = pcall(function() -- Line: 82
        -- upvalues: u45 (copy)
        local v46 = u45.crossspring.p * 4 * u45.crossscale.p;
        u45.crossParts[1].BackgroundTransparency = 1 - v46 / 3;
        u45.crossParts[2].BackgroundTransparency = 1 - v46 / 3;
        u45.crossParts[3].BackgroundTransparency = 1 - v46 / 3;
        u45.crossParts[4].BackgroundTransparency = 1 - v46 / 3;
        u45.crossParts[1].Position = UDim2.new(0, v46 - 3, 0, 0);
        u45.crossParts[2].Position = UDim2.new(0, -v46 - 7, 0, 0);
        u45.crossParts[3].Position = UDim2.new(0, 0, 0, v46 - 3);
        u45.crossParts[4].Position = UDim2.new(0, 0, 0, -v46 - 7);
    end);

    if not success then
        warn("Error with CrosshairModule", result);
    end;
end;

u41.crosses = {};

function u41.clearup() -- Line: 99
    -- upvalues: u44 (ref), u41 (copy)
    u44 = nil;

    for _, v in pairs(u41.crosses) do
        if v and v.crossFrame then
            v:destroy();
        end;
    end;

    u41.crosses = {};
end;

function u41.new(p47) -- Line: 109
    -- upvalues: PhysicModule (copy), CoreGUI (copy), u43 (ref), u44 (ref), u41 (copy), ReplicatedStorage (copy), TweenService (copy)
    local u48 = {
        Code = math.random(),
        crossscale = PhysicModule.spring.new(0)
    };
    u48.crossscale.s = 10;
    u48.crossscale.d = 0.8;
    u48.crossscale.t = 1;
    u48.crossspring = PhysicModule.spring.new(0);
    u48.crossspring.s = 12;
    u48.crossspring.d = 0.65;
    local Crosshair = CoreGUI.Crosshair;
    local u49 = script.Main:Clone();
    u49.Parent = Crosshair;
    u48.crossFrame = u49;
    u48.crossParts = {
        game.WaitForChild(u49, "HR"),
        game.WaitForChild(u49, "HL"),
        game.WaitForChild(u49, "VD"),
        game.WaitForChild(u49, "VU")
    };
    u48.hitmarkers = {};
    u48.bar2Code = 0;
    u48.enabled = false;

    function u48.setcrossscale(p50, p51) -- Line: 142
        -- upvalues: u48 (ref)
        u48.crossscale.t = p51;
    end;

    function u48.setcrosssize(p52, p53) -- Line: 146
        -- upvalues: u48 (ref)
        u48.crossspring.t = p53;
    end;

    function u48.setcrosssettings(p54, p55, p56, p57) -- Line: 150
        -- upvalues: u48 (ref)
        u48.crossspring.t = p55;
        u48.crossspring.s = p56;
        u48.crossspring.d = p57;
    end;

    function u48.connect(p58) -- Line: 156
        -- upvalues: u48 (ref), u43 (ref), u44 (ref), u49 (copy)
        u48.enabled = true;

        if u48 ~= u43 then
            u44 = u48;
        end;

        for _, v in pairs(u48.crossParts) do
            v.Visible = true;
        end;

        u48:setcrossscale(1);
        u49.Center.Visible = true;
        u49.Visible = true;
        u48:active();
    end;

    function u48.destroy(p59) -- Line: 174
        -- upvalues: u49 (copy), u41 (ref), u48 (ref)
        u49:Destroy();

        for i, v in pairs(u41.crosses) do
            if v == u48 then
                table.remove(u41.crosses, i);
            end;
        end;

        for i, _ in pairs(u48) do
            u48[i] = nil;
        end;

        u48 = nil;
    end;

    function u48.disconnect(p60, p61) -- Line: 189
        -- upvalues: u49 (copy), u48 (ref), u43 (ref), u44 (ref)
        u49.Center.Visible = false;
        u48:setcrossscale(-10);
        u48.enabled = false;

        for _, v in pairs(u48.crossParts) do
            v.Visible = false;
        end;

        u49.Visible = false;

        if p61 and u48 ~= u43 then
            u44 = nil;
        end;
    end;

    function u48.GCH(p62) -- Line: 209
        -- upvalues: Crosshair (copy)
        return Crosshair;
    end;

    function u48.GetPos(p63) -- Line: 213
        -- upvalues: u48 (ref)
        return u48.crossFrame.Center.AbsolutePosition;
    end;

    function u48.active(p64) -- Line: 217
        -- upvalues: u48 (ref), u49 (copy)
        for _, v in pairs(u48.crossParts) do
            v.Visible = true;
        end;

        u49.Center.Visible = u48.enabled;

        for _, child in pairs(u48.crossFrame:GetChildren()) do
            child.BackgroundColor3 = Color3.new(1, 1, 1);
        end;
    end;

    function u48.inactive(p65, p66) -- Line: 228
        -- upvalues: u48 (ref), u49 (copy)
        for _, v in pairs(u48.crossParts) do
            v.Visible = false;
        end;

        u49.Center.Visible = not p66 and u48.enabled;

        for _, child in pairs(u48.crossFrame:GetChildren()) do
            child.BackgroundColor3 = Color3.new(0.85, 0.85, 0.85);
        end;
    end;

    function u48.hideall(p67) -- Line: 239
        -- upvalues: u49 (copy)
        for _, descendant in pairs(u49:GetDescendants()) do
            if descendant ~= u49.BarFrame and descendant:IsA("Frame") then
                descendant.Visible = false;
            end;
        end;

        u49.Visible = true;
    end;

    function u48.clearactivebars(p68) -- Line: 250
        -- upvalues: u49 (copy)
        if u49 and (u49.Parent and u49:FindFirstChild("BarFrame")) then
            for _, child in pairs(u49.BarFrame:GetChildren()) do
                if child.Name == "ActiveBar" then
                    child:Destroy();
                end;
            end;
        end;
    end;

    function u48.bar(p69, p70, p71) -- Line: 260
        -- upvalues: u49 (copy)
        if not p70 or typeof(p70) ~= "number" then
            return;
        end;

        local v72 = script:WaitForChild("Bar"):Clone();
        v72.Name = "ActiveBar";
        local Bar2 = v72.Bar2;
        v72.Parent = u49.BarFrame;
        Bar2:TweenSize(UDim2.new(1, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, p70);
        game.Debris:AddItem(v72, p70 + 0.01);
    end;

    function u48.bar2(p73, p74) -- Line: 272
        -- upvalues: u49 (copy), u48 (ref)
        if not u49.BarFrame.Bar2.Visible then
            u48:resetbar2s();
        end;

        u49.BarFrame.Bar2.Visible = true;
        local math_random_ret = math.random();
        u48.bar2Code = math_random_ret;
        delay(p74 + 0.01, function() -- Line: 282
            -- upvalues: u48 (ref), math_random_ret (copy), u49 (ref)
            if u48 and u48.bar2Code == math_random_ret then
                u49.BarFrame.Bar2.Visible = false;
            end;
        end);
    end;

    function u48.incbar2(p75, p76) -- Line: 289
        -- upvalues: u49 (copy)
        if not p76 or typeof(p76) ~= "number" then
            return;
        end;

        for i = 1, 3 do
            local v77 = u49.BarFrame.Bar2["P" .. i];

            if i <= p76 then
                v77.Bar:TweenSize(UDim2.new(1, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 0.25);
            else
                v77.Bar:TweenSize(UDim2.new(0, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 0);
            end;

            local v78;

            if p76 >= 3 then
                v77.Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 127);
                v78 = i;
            else
                v77.Bar.BackgroundColor3 = Color3.new(1, 1, 1);
                v78 = i;
            end;
        end;
    end;

    function u48.resetbar2s(p79) -- Line: 308
        -- upvalues: u49 (copy)
        for i = 1, 3 do
            u49.BarFrame.Bar2["P" .. i].Bar:TweenSize(UDim2.new(0, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0);
            local _ = i;
        end;
    end;

    function u48.hitmarker(p80, u81, p82, p83) -- Line: 314
        -- upvalues: ReplicatedStorage (ref), u48 (ref), u49 (copy), TweenService (ref), CoreGUI (ref)
        local Events2 = ReplicatedStorage:FindFirstChild("Events2");

        if Events2 then
            Events2 = Events2:FindFirstChild("PVE_Hitmarker");
        end;

        if Events2 then
            Events2:Fire(u81 or false, p82 or false, p83 or false);
        end;

        local u84 = p82 or 0.5;

        for _, v in pairs(u48.hitmarkers) do
            if v and v.Parent then
                v:Destroy();
            end;
        end;

        u48.hitmarkers = {};

        local function CreateFramesNew() -- Line: 330
            -- upvalues: u49 (ref), u84 (ref), u81 (copy), TweenService (ref)
            local v85 = script.Hitmarker:Clone();
            v85.Parent = u49;
            local v86 = u84;
            local Color3_new_ret = Color3.new(1, 1, 1);

            if u81 == "AR" then
                Color3_new_ret = Color3.new(0.333333, 0.623529, 1);
                v85.ZIndex = 2;
                v86 = v86 * 1.25;
            elseif u81 == "SH" then
                Color3_new_ret = Color3.fromRGB(110, 255, 80);
                v85.ZIndex = 2;
            elseif u81 == "SHB" then
                Color3_new_ret = Color3.fromRGB(110, 255, 80);
                v85.ZIndex = 3;
                v86 = v86 * 1.6;
            elseif u81 then
                Color3_new_ret = Color3.new(1, 0, 0);
            end;

            game.Debris:AddItem(v85, v86);
            v85.ImageColor3 = Color3_new_ret;
            v85.ImageTransparency = 0;
            local v87 = u81 == "SHB" and 230 or 150;
            TweenService:Create(v85, TweenInfo.new(v86, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                ImageTransparency = 1
            }):Play();
            TweenService:Create(v85, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, v87, 0, v87)
            }):Play();
        end;

        CoreGUI.HitmarkerSound:Play();
        CoreGUI.HitmarkerSound.Volume = p83 or 1;
        CreateFramesNew();
    end;

    u48:setcrosssize(1);

    if p47 then
        u43 = u48;
        u44 = u43;
        u41.default = u48;
    else
        table.insert(u41.crosses, u48);
    end;

    return u48;
end;

RunService.RenderStepped:Connect(function() -- Line: 406
    -- upvalues: u44 (ref), u41 (copy), CoreGUI (copy), u42 (ref), UserInputService (copy)
    local u88 = u44;

    if u88 then
        if u41.mE then
            u41.mE = false;
            CoreGUI.Crosshair.MobileCenter.Visible = false;
        end;

        if u42 ~= u88 then
            UserInputService.MouseIconEnabled = u88 == u41.default;
        end;

        if u42 and (u42 ~= u88 and u42 ~= u41.default) then
            u42.crossFrame.Visible = false;
        end;

        u88.crossFrame.Visible = true;
        local success, result = pcall(function() -- Line: 82
            -- upvalues: u88 (copy)
            local v89 = u88.crossspring.p * 4 * u88.crossscale.p;
            u88.crossParts[1].BackgroundTransparency = 1 - v89 / 3;
            u88.crossParts[2].BackgroundTransparency = 1 - v89 / 3;
            u88.crossParts[3].BackgroundTransparency = 1 - v89 / 3;
            u88.crossParts[4].BackgroundTransparency = 1 - v89 / 3;
            u88.crossParts[1].Position = UDim2.new(0, v89 - 3, 0, 0);
            u88.crossParts[2].Position = UDim2.new(0, -v89 - 7, 0, 0);
            u88.crossParts[3].Position = UDim2.new(0, 0, 0, v89 - 3);
            u88.crossParts[4].Position = UDim2.new(0, 0, 0, -v89 - 7);
        end);

        if not success then
            warn("Error with CrosshairModule", result);
        end;
    elseif not u41.mE then
        u41.mE = true;
        UserInputService.MouseIconEnabled = _G.InputType ~= 2;

        if _G.M_MLCheck() and _G.InputType ~= 1 then
            CoreGUI.Crosshair.MobileCenter.Visible = true;
        end;
    end;

    u42 = u88;
end);

return u41;
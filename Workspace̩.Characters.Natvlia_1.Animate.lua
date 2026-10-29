-- ============================================================
-- SCRIPT: Animate
-- CLASS:  LocalScript
-- PATH:   Workspace̩.Characters.Natvlia_1.Animate
-- ============================================================

-- Decompiled with Potassium's decompiler.

local RunService = game:GetService("RunService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local Players = game:GetService("Players");
local TextChatService = game:GetService("TextChatService");
local LocalPlayer = Players.LocalPlayer;
local Events = ReplicatedStorage:WaitForChild("Events");
local l_script = script;
local Character = LocalPlayer.Character;
local Torso = Character:WaitForChild("Torso");
local u1 = Torso:WaitForChild("Right Shoulder");
local u2 = Torso:WaitForChild("Left Shoulder");
local u3 = Torso:WaitForChild("Right Hip");
local u4 = Torso:WaitForChild("Left Hip");
Torso:WaitForChild("Neck");
local Humanoid = Character:WaitForChild("Humanoid");
local u5 = "Standing";
local u6 = "";
local u7 = nil;
local u8 = nil;
local u9 = nil;
local u10 = 1;
local u11 = 1;
local u12 = {};
local OnFlinched = ReplicatedStorage:WaitForChild("Events"):WaitForChild("OnFlinched");
local u13 = 1;
local u14 = {};
local u15 = nil;
local u16 = nil;
_G.WaitForChar();
local u17 = _G.GVF and _G.GVF();
local _G_AffectChar_ret = _G.AffectChar("B", (1 / 0));
_G_AffectChar_ret.Parent = script;
local u18 = false;
local u19 = {
    idle1 = { {
            id = "http://www.roblox.com/asset/?id=180435571",
            weight = 9
        }, {
            id = "http://www.roblox.com/asset/?id=180435792",
            weight = 1
        } },
    idle2 = { {
            id = "http://www.roblox.com/asset/?id=180435571",
            weight = 9
        }, {
            id = "http://www.roblox.com/asset/?id=180435792",
            weight = 1
        } },
    idle3 = { {
            id = "http://www.roblox.com/asset/?id=180435571",
            weight = 9
        }, {
            id = "http://www.roblox.com/asset/?id=180435792",
            weight = 1
        } },
    walk1 = { {
            id = "http://www.roblox.com/asset/?id=180426354",
            weight = 10
        } },
    walk2 = { {
            id = "http://www.roblox.com/asset/?id=180426354",
            weight = 10
        } },
    walk3 = { {
            id = "http://www.roblox.com/asset/?id=180426354",
            weight = 10
        } },
    run1 = { {
            id = "run.xml",
            weight = 10
        } },
    run2 = { {
            id = "run.xml",
            weight = 10
        } },
    run3 = { {
            id = "run.xml",
            weight = 10
        } },
    swim = { {
            id = "http://www.roblox.com/asset/?id=180426354",
            weight = 10
        } },
    swimidle = { {
            id = "http://www.roblox.com/asset/?id=180426354",
            weight = 10
        } },
    jump = { {
            id = "http://www.roblox.com/asset/?id=125750702",
            weight = 10
        } },
    fall = { {
            id = "http://www.roblox.com/asset/?id=180436148",
            weight = 10
        } },
    climb = { {
            id = "http://www.roblox.com/asset/?id=180436334",
            weight = 10
        } },
    sitState = { {
            id = "http://www.roblox.com/asset/?id=178130996",
            weight = 10
        } },
    toolnone = { {
            id = "http://www.roblox.com/asset/?id=182393478",
            weight = 10
        } },
    toolslash = { {
            id = "http://www.roblox.com/asset/?id=129967390",
            weight = 10
        } },
    toollunge = { {
            id = "http://www.roblox.com/asset/?id=129967478",
            weight = 10
        } },
    wave = { {
            id = "http://www.roblox.com/asset/?id=128777973",
            weight = 10
        } },
    point = { {
            id = "http://www.roblox.com/asset/?id=128853357",
            weight = 10
        } },
    dance1 = { {
            id = "http://www.roblox.com/asset/?id=182435998",
            weight = 10
        }, {
            id = "http://www.roblox.com/asset/?id=182491037",
            weight = 10
        }, {
            id = "http://www.roblox.com/asset/?id=182491065",
            weight = 10
        } },
    dance2 = { {
            id = "http://www.roblox.com/asset/?id=182436842",
            weight = 10
        }, {
            id = "http://www.roblox.com/asset/?id=182491248",
            weight = 10
        }, {
            id = "http://www.roblox.com/asset/?id=182491277",
            weight = 10
        } },
    dance3 = { {
            id = "http://www.roblox.com/asset/?id=182436935",
            weight = 10
        }, {
            id = "http://www.roblox.com/asset/?id=182491368",
            weight = 10
        }, {
            id = "http://www.roblox.com/asset/?id=182491423",
            weight = 10
        } },
    laugh = { {
            id = "http://www.roblox.com/asset/?id=129423131",
            weight = 10
        } },
    cheer = { {
            id = "http://www.roblox.com/asset/?id=129423030",
            weight = 10
        } },
    didle = { {
            id = "http://www.roblox.com/asset/?id=5864485399",
            weight = 10
        } },
    dmove = { {
            id = "http://www.roblox.com/asset/?id=5864490504",
            weight = 10
        } }
};
local u20 = { "dance1", "dance2", "dance3" };
local u21 = false;
local u22 = {
    wave = false,
    point = false,
    dance1 = true,
    dance2 = true,
    dance3 = true,
    laugh = false,
    cheer = false
};
local u23 = 0;

local function AddEmoteTable(p24) -- Line: 161
    -- upvalues: u22 (copy), u19 (copy)
    for i, v in pairs(p24) do
        local v25 = i;
        local v26 = nil;

        for _, v2 in pairs(v) do
            u22[v25] = v2[1];
            v26 = v2.id;
        end;

        local StringValue = Instance.new("StringValue");
        StringValue.Name = v25;
        local Animation = Instance.new("Animation", StringValue);
        Animation.Name = v25 .. "Anim";
        StringValue.Parent = script;
        Animation.AnimationId = v26;
        u19[v25] = v;
    end;
end;

local u27 = Humanoid:LoadAnimation(script:WaitForChild("left"));
local u28 = Humanoid:LoadAnimation(script.right);
local u29 = {
    leftActive = false,
    rightActive = false,
    strafeNum = 0
};
u27.Priority = Enum.AnimationPriority.Core;
u28.Priority = Enum.AnimationPriority.Core;
local TextChatCommands = TextChatService:WaitForChild("TextChatCommands", 5);

if TextChatCommands then
    TextChatCommands:FindFirstChild("RBXEmoteCommand");
end;

if TextChatCommands and TextChatCommands:FindFirstChild("CustomEmoteCommand") then
    TextChatCommands.CustomEmoteCommand:Destroy();
end;

local TextChatCommand = Instance.new("TextChatCommand");
TextChatCommand.Name = "CustomEmoteCommand";
TextChatCommand.PrimaryAlias = "/e";
TextChatCommand.Parent = TextChatCommands;
AddEmoteTable(require(l_script:WaitForChild("Default"):Clone()));

if _G.GamepassCheck and _G.GamepassCheck("Emotes") then
    AddEmoteTable((require(l_script:WaitForChild("Pack"):Clone())));
end;

pcall(function() -- Line: 214
    -- upvalues: l_script (copy)
    l_script.Pack:Destroy();
end);
pcall(function() -- Line: 217
    -- upvalues: l_script (copy)
    l_script.Default:Destroy();
end);
coroutine.resume(coroutine.create(function() -- Line: 221
    -- upvalues: l_script (copy), RunService (copy)
    for _, descendant in pairs(l_script:GetDescendants()) do
        if descendant.ClassName == "Animation" then
            local v30 = _G.VM.Current:FindFirstChild("Humanoid"):LoadAnimation(descendant);
            v30:Play(0, 0, 10000);
            RunService.Heartbeat:Wait();
            v30:Stop();
        end;
    end;
end));

local function RunSpeedCheck(p31) -- Line: 232
    -- upvalues: u17 (copy)
    if p31 < 10 then
        return;
    end;

    if u17 and u17.Sprinting.Value or not u17 and p31 >= 20 then
        return true;
    end;
end;

function configureAnimationSet(u32, u33)
    -- upvalues: u12 (copy), l_script (copy)
    if u12[u32] ~= nil then
        for _, v in pairs(u12[u32].connections) do
            v:disconnect();
        end;
    end;

    u12[u32] = {};
    u12[u32].count = 0;
    u12[u32].totalWeight = 0;
    u12[u32].connections = {};
    local v34 = l_script:FindFirstChild(u32);

    if v34 ~= nil then
        table.insert(u12[u32].connections, v34.ChildAdded:connect(function(p35) -- Line: 255
            -- upvalues: u32 (copy), u33 (copy)
            configureAnimationSet(u32, u33);
        end));
        table.insert(u12[u32].connections, v34.ChildRemoved:connect(function(p36) -- Line: 256
            -- upvalues: u32 (copy), u33 (copy)
            configureAnimationSet(u32, u33);
        end));
        local v37 = 1;

        for _, child in pairs(v34:GetChildren()) do
            if child:IsA("Animation") then
                table.insert(u12[u32].connections, child.Changed:connect(function(p38) -- Line: 260
                    -- upvalues: u32 (copy), u33 (copy)
                    configureAnimationSet(u32, u33);
                end));
                u12[u32][v37] = {};
                u12[u32][v37].anim = child;
                local Weight = child:FindFirstChild("Weight");

                if Weight == nil then
                    u12[u32][v37].weight = 1;
                else
                    u12[u32][v37].weight = Weight.Value;
                end;

                u12[u32].count = u12[u32].count + 1;
                u12[u32].totalWeight = u12[u32].totalWeight + u12[u32][v37].weight;
                v37 = v37 + 1;
            end;
        end;
    end;

    if u12[u32].count <= 0 then
        for i, v in pairs(u33) do
            u12[u32][i] = {};
            u12[u32][i].anim = Instance.new("Animation");
            u12[u32][i].anim.Name = u32;
            u12[u32][i].anim.AnimationId = v.id;
            u12[u32][i].weight = v.weight;
            u12[u32].count = u12[u32].count + 1;
            u12[u32].totalWeight = u12[u32].totalWeight + v.weight;
        end;
    end;
end;

function scriptChildModified(p39)
    -- upvalues: u19 (copy)
    local v40 = u19[p39.Name];

    if v40 ~= nil then
        configureAnimationSet(p39.Name, v40);
    end;
end;

l_script.ChildAdded:connect(scriptChildModified);
l_script.ChildRemoved:connect(scriptChildModified);

for _, child in pairs(l_script:GetChildren()) do
    scriptChildModified(child);
end;

for i, v in pairs(u19) do
    configureAnimationSet(i, v);
end;

local u41 = "None";
local u42 = 0;
local u43 = 0;

function stopAllAnimations()
    -- upvalues: u6 (ref), u22 (copy), u7 (ref), u9 (ref), u8 (ref)
    local v44 = u6;
    local v45 = u22[v44] ~= nil and u22[v44] == false and "idle" or v44;
    u6 = "";
    u7 = nil;

    if u9 ~= nil then
        u9:disconnect();
    end;

    if u8 ~= nil then
        u8:Stop();
        u8:Destroy();
        u8 = nil;
    end;

    return v45;
end;

function setAnimationSpeed(p46)
    -- upvalues: u8 (ref), u10 (ref)
    if u8 and p46 ~= u10 then
        u10 = p46;
        pcall(function() -- Line: 353
            -- upvalues: u8 (ref), u10 (ref)
            u8:AdjustSpeed(u10);
        end);
    end;
end;

function setAnimationWeight(u47)
    -- upvalues: u8 (ref), u11 (ref)
    if u8 and u47 ~= u11 then
        u11 = u47;
        pcall(function() -- Line: 362
            -- upvalues: u8 (ref), u47 (copy)
            u8:AdjustWeight((math.max(u47, 0.05)));
        end);
    end;
end;

function keyFrameReachedFunc(p48)
    -- upvalues: u6 (ref), u22 (copy), u10 (ref), Humanoid (copy)
    if p48 == "End" then
        local v49 = u6;
        playAnimation(u22[v49] ~= nil and u22[v49] == false and "idle" or v49, 0, Humanoid);
        setAnimationSpeed(u10);
    end;
end;

function playAnimation(p50, p51, p52, p53)
    -- upvalues: u12 (copy), u17 (copy), Character (copy), u7 (ref), u8 (ref), u23 (ref), u15 (ref), u21 (ref), u18 (ref), _G_AffectChar_ret (copy), u10 (ref), u6 (ref), u16 (ref), RunService (copy), u13 (ref), Humanoid (copy), u5 (ref), u9 (ref), u14 (copy)
    if u12[p50] == nil then
        return;
    end;

    if p52.Health <= 0 or u17 and u17.Grabbed.Value or _G.RagdollCheck(Character) then
        stopAllAnimations();

        return;
    end;

    local math_random_ret = math.random(1, u12[p50].totalWeight);
    local v54 = 1;

    while u12[p50][v54].weight < math_random_ret do
        math_random_ret = math_random_ret - u12[p50][v54].weight;
        v54 = v54 + 1;
    end;

    local anim = u12[p50][v54].anim;

    if anim ~= u7 then
        if u8 ~= nil then
            u8:Stop(p51);
            u8:Destroy();
        end;

        local math_random_ret2 = math.random();
        u23 = math_random_ret2;

        if u15 and not p53 then
            u15:Destroy();
            u15 = nil;
        end;

        u21 = p53;

        if p53 then
            if not u18 then
                u18 = true;
                _G_AffectChar_ret.Parent = u17.Currents;
                p52:UnequipTools();
                _G_AffectChar_ret.Parent = script;
                p52:SetAttribute("IsEmoting", true);
            end;
        elseif u18 then
            u18 = false;
            _G_AffectChar_ret.Parent = script;
            p52:SetAttribute("IsEmoting", nil);
        end;

        u10 = 1;
        u8 = p52:LoadAnimation(anim);
        u8.Priority = Enum.AnimationPriority.Core;
        u8:Play(p51);
        u6 = p50;

        if string.find(p50, "idle") and not string.find(p50, "didle") then
            if u16 then
                u16:Stop();
            end;

            u16 = u8;
        elseif u16 and (string.find(p50, "walk") or string.find(p50, "run")) then
            u16:Stop();
            u16 = nil;
        end;

        coroutine.resume(coroutine.create(function() -- Line: 452
            -- upvalues: u8 (ref), RunService (ref), u23 (ref), math_random_ret2 (copy), u13 (ref), Humanoid (ref), u5 (ref)
            u8.Stopped:wait();
            RunService.RenderStepped:Wait();

            if u23 == math_random_ret2 then
                local v55 = _G.DownedCheck and _G.DownedCheck() and "didle" or "idle" .. u13;
                playAnimation(v55, 0.1, Humanoid);
                u5 = "Standing";
            end;
        end));
        u7 = anim;

        if p50 == "walk1" or (p50 == "walk2" or (p50 == "walk3" or (p50 == "run1" or (p50 == "run2" or p50 == "run3")))) then
            _G.WalkAnim = u8;
        elseif _G.WalkAnim then
            pcall(function() -- Line: 475
                _G.WalkAnim:Stop();
            end);
            _G.WalkAnim = nil;
        end;

        if u9 ~= nil then
            u9:disconnect();
        end;

        u9 = u8.KeyframeReached:connect(keyFrameReachedFunc);

        for i, v in pairs(u14) do
            if u14[i] then
                v[1]:Stop(v[2] * 2);
                v[1]:Destroy();
                local v56 = Humanoid:LoadAnimation(i);
                v56:Play(v[2], v[3], v[4]);
                u14[i][1] = v56;
            end;
        end;
    end;
end;

local u57 = "";
local u58 = nil;
local u59 = nil;
local u60 = nil;

function toolKeyFrameReachedFunc(p61)
    -- upvalues: u57 (ref), Humanoid (copy)
    if p61 == "End" then
        playToolAnimation(u57, 0, Humanoid);
    end;
end;

function playToolAnimation(p62, p63, p64, p65)
    -- upvalues: u12 (copy), u59 (ref), u58 (ref), u57 (ref), u60 (ref)
    local math_random_ret = math.random(1, u12[p62].totalWeight);
    local v66 = 1;

    while u12[p62][v66].weight < math_random_ret do
        math_random_ret = math_random_ret - u12[p62][v66].weight;
        v66 = v66 + 1;
    end;

    local anim = u12[p62][v66].anim;

    if u59 ~= anim then
        if u58 ~= nil then
            u58:Stop();
            u58:Destroy();
            p63 = 0;
        end;

        u58 = p64:LoadAnimation(anim);

        if p65 then
            u58.Priority = p65;
        end;

        u58:Play(p63);
        u57 = p62;
        u59 = anim;
        u60 = u58.KeyframeReached:connect(toolKeyFrameReachedFunc);
    end;
end;

function stopToolAnimations()
    -- upvalues: u57 (ref), u60 (ref), u59 (ref), u58 (ref)
    local v67 = u57;

    if u60 ~= nil then
        u60:disconnect();
    end;

    u57 = "";
    u59 = nil;

    if u58 ~= nil then
        u58:Stop();
        u58:Destroy();
        u58 = nil;
    end;

    return v67;
end;

local u68 = 0;

function onRunning(p69)
    -- upvalues: u68 (ref), u21 (ref), Humanoid (copy), u17 (copy), u13 (ref), u29 (copy), u7 (ref), u5 (ref), u22 (copy), u6 (ref)
    u68 = p69;

    if (u21 and 4 or (_G.DownedCheck() and 1 or 0.1)) >= p69 or Humanoid.MoveDirection.Magnitude < 0.5 then
        if u22[u6] == nil then
            local v70 = _G.DownedCheck and _G.DownedCheck() and "didle" or "idle" .. u13;
            playAnimation(v70, 0.1, Humanoid);
            u5 = "Standing";
        end;

        return;
    end;

    if u17 and u17.Sprinting.Value then
        local v71 = "run" .. u13;
        local v72, v73;

        if _G.DownedCheck and _G.DownedCheck() then
            v71 = "dmove";
            v72 = 1;
            v73 = 5;
        else
            v72 = 0.25;
            v73 = 1;
        end;

        playAnimation(v71, v72, Humanoid);
        setAnimationSpeed(u68 / 20 * v73);
    else
        local v74 = "walk" .. u13;
        local v75 = 0.15;
        local v76 = 1;
        local v77;

        if _G.DownedCheck and _G.DownedCheck() then
            v74 = "dmove";
            v75 = 1;
            v76 = 5;
            v77 = 1;
        else
            local math_min_ret = math.min(Humanoid.WalkSpeed / 16, 1);
            v77 = math.max(math_min_ret, 0.1);
        end;

        playAnimation(v74, v75, Humanoid);
        setAnimationSpeed(u68 / 14.5 * v76);

        if u29.leftActive or u29.rightActive then
            v77 = v77 * (1 - u29.strafeNum);
        end;

        setAnimationWeight(v77);
    end;

    u5 = "Running";
end;

function onDied()
    -- upvalues: u5 (ref)
    u5 = "Dead";
end;

function onJumping()
    -- upvalues: Humanoid (copy), u43 (ref), u5 (ref)
    if not _G.DownedCheck() then
        playAnimation("jump", 0.1, Humanoid);
    end;

    u43 = 0.3;
    u5 = "Jumping";
end;

function onClimbing(p78)
    -- upvalues: Humanoid (copy), u5 (ref)
    if not _G.DownedCheck() then
        playAnimation("climb", 0.1, Humanoid);
    end;

    setAnimationSpeed(p78 / 12);
    u5 = "Climbing";
end;

function onGettingUp()
    -- upvalues: u5 (ref)
    u5 = "GettingUp";
end;

function onFreeFall()
    -- upvalues: u43 (ref), Humanoid (copy), u5 (ref)
    if u43 <= 0 and not _G.DownedCheck() then
        playAnimation("fall", 0.3, Humanoid);
    end;

    u5 = "FreeFall";
end;

function onFallingDown()
    -- upvalues: u5 (ref)
    u5 = "FallingDown";
end;

function onSeated()
    -- upvalues: u5 (ref)
    u5 = "Seated";
end;

function onPlatformStanding()
    -- upvalues: u5 (ref)
    u5 = "PlatformStanding";
end;

function onSwimming(p79)
    -- upvalues: u68 (ref), Humanoid (copy), u5 (ref)
    u68 = p79;

    if p79 > 1 and Humanoid.MoveDirection.Magnitude > 0 then
        u5 = "Swimming";

        return;
    end;

    u5 = "SwimIdle";
end;

function getTool()
    -- upvalues: Character (copy)
    for _, child in ipairs(Character:GetChildren()) do
        if child.className == "Tool" then
            return child;
        end;
    end;

    return nil;
end;

function getToolAnim(p80)
    for _, child in ipairs(p80:GetChildren()) do
        if child.Name == "toolanim" and child.className == "StringValue" then
            return child;
        end;
    end;

    return nil;
end;

function animateTool()
    -- upvalues: u41 (ref), Humanoid (copy)
    if u41 == "None" then
        return;
    end;

    if u41 == "Slash" then
        playToolAnimation("toolslash", 0, Humanoid, Enum.AnimationPriority.Action);

        return;
    end;

    if u41 ~= "Lunge" then
        return;
    end;

    playToolAnimation("toollunge", 0, Humanoid, Enum.AnimationPriority.Action);
end;

function moveSit()
    -- upvalues: u1 (copy), u2 (copy), u3 (copy), u4 (copy)
    u1.MaxVelocity = 0.15;
    u2.MaxVelocity = 0.15;
    u1:SetDesiredAngle(1.57);
    u2:SetDesiredAngle(-1.57);
    u3:SetDesiredAngle(1.57);
    u4:SetDesiredAngle(-1.57);
end;

local u81 = 0;

function move(p82)
    -- upvalues: u81 (ref), u43 (ref), Humanoid (copy), u5 (ref), u17 (copy), u13 (ref), u68 (ref), u29 (copy), Character (copy), u27 (copy), u28 (copy), u41 (ref), u42 (ref), u59 (ref)
    local v83 = p82 - u81;
    u81 = p82;

    if u43 > 0 then
        u43 = u43 - v83;
    end;

    if Humanoid.Parent and (Humanoid.Health > 0 and (u5 ~= "Dead" and (u5 ~= "GettingUp" and (u5 ~= "FallingDown" and (u5 ~= "Seated" and (u5 ~= "PlatformStanding" and not (u17 and u17.Grabbed.Value))))))) then
        if _G.RagdollCheck() then
            if u5 ~= "Standing" then
                playAnimation("idle" .. u13, 0.1, Humanoid);
                u5 = "Standing";
            end;
        else
            local v84 = 1;
            local v85 = 0;
            local v86 = false;

            if u5 == "FreeFall" and (u43 <= 0 and not _G.DownedCheck()) then
                playAnimation("fall", 0.3, Humanoid);
            else
                if u5 == "Seated" and not _G.DownedCheck() then
                    playAnimation("sitState", 0.5, Humanoid);

                    return;
                end;

                if u5 == "Running" then
                    if u17 and u17.Sprinting.Value then
                        local v87 = "run" .. u13;
                        local v88;

                        if _G.DownedCheck and _G.DownedCheck() then
                            v87 = "dmove";
                            v88 = 5;
                        else
                            v88 = 1;
                        end;

                        playAnimation(v87, 0.25, Humanoid);
                        v85 = u68 / 20 * v88;
                        setAnimationSpeed(v85);
                        v86 = true;
                    else
                        local v89 = "walk" .. u13;
                        local v90 = 0.15;
                        local v91 = 1;
                        local v92;

                        if _G.DownedCheck and _G.DownedCheck() then
                            v89 = "dmove";
                            v90 = 1;
                            v91 = 5;
                            v92 = 1;
                        else
                            local math_min_ret = math.min(Humanoid.WalkSpeed / 16, 1);
                            v92 = math.max(math_min_ret, 0.1);
                            v84 = v92;
                        end;

                        playAnimation(v89, v90, Humanoid);
                        v85 = u68 / 14.5 * v91;
                        setAnimationSpeed(v85);

                        if u29.leftActive or u29.rightActive then
                            v92 = v92 * (1 - u29.strafeNum);
                        end;

                        setAnimationWeight(v92);
                    end;
                elseif u5 == "Swimming" then
                    local v93 = _G.DownedCheck and _G.DownedCheck() and "dmove" or "swim";
                    playAnimation(v93, 0.2, Humanoid);
                    setAnimationSpeed(u68 / 14.5);
                elseif u5 == "SwimIdle" then
                    local v94 = _G.DownedCheck and _G.DownedCheck() and "didle" or "swimidle";
                    playAnimation(v94, 0.2, Humanoid);
                    setAnimationSpeed(0.9);
                end;
            end;

            if u5 == "Running" then
                local v95 = Character.HumanoidRootPart.CFrame.RightVector:Dot((Character.HumanoidRootPart.Velocity * Vector3.new(1, 0, 1)).Unit) * 1 * 100;
                local v96 = math.floor(v95) / 100;
                local math_abs_ret = math.abs(v96);
                local v97 = math_abs_ret < 0.02 and 0 or v96;

                if v86 or math_abs_ret <= 0 then
                    if u29.leftActive then
                        u29.leftActive = false;
                        u27:Stop(0.2);
                    end;

                    if u29.rightActive then
                        u29.rightActive = false;
                        u28:Stop(0.2);
                    end;
                else
                    if v97 > 0 then
                        if u29.leftActive then
                            u29.leftActive = false;
                            u27:Stop(0.2);
                        end;

                        if not u29.rightActive then
                            u29.rightActive = true;
                            u28:Play(0.2);
                        end;

                        u28:AdjustWeight((math.max(math_abs_ret * v84, 0.1)));
                        u28:AdjustSpeed(v85);
                    else
                        if u29.rightActive then
                            u29.rightActive = false;
                            u28:Stop(0.2);
                        end;

                        if not u29.leftActive then
                            u29.leftActive = true;
                            u27:Play(0.2);
                        end;

                        u27:AdjustWeight((math.max(math_abs_ret * v84, 0.1)));
                        u27:AdjustSpeed(v85);
                    end;

                    u29.strafeNum = math_abs_ret;
                end;
            else
                if u29.leftActive then
                    u29.leftActive = false;
                    u27:Stop(0.2);
                end;

                if u29.rightActive then
                    u29.rightActive = false;
                    u28:Stop(0.2);
                end;
            end;
        end;
    else
        stopAllAnimations();
    end;

    local v98 = getTool();

    if v98 and v98:FindFirstChild("Handle") then
        local v99 = getToolAnim(v98);

        if v99 then
            u41 = v99.Value;
            v99.Parent = nil;
            u42 = p82 + 0.3;
        end;

        if u42 < p82 then
            u42 = 0;
            u41 = "None";
        end;

        animateTool();

        return;
    end;

    stopToolAnimations();
    u41 = "None";
    u59 = nil;
    u42 = 0;
end;

Humanoid.Died:connect(onDied);
Humanoid.Running:connect(onRunning);
Humanoid.Jumping:connect(onJumping);
Humanoid.Climbing:connect(onClimbing);
Humanoid.GettingUp:connect(onGettingUp);
Humanoid.FreeFalling:connect(onFreeFall);
Humanoid.FallingDown:connect(onFallingDown);
Humanoid.Seated:connect(onSeated);
Humanoid.PlatformStanding:connect(onPlatformStanding);
Humanoid.Swimming:connect(onSwimming);
local v102 = {
    chat = game:GetService("Players").LocalPlayer.Chatted:connect(function(p100) -- Line: 949
        -- upvalues: Humanoid (copy), u17 (copy), u20 (copy), u5 (ref), u22 (copy), u15 (ref)
        if _G.CheckIfFlinching() or (_G.RagdollCheck() or (_G.DownedCheck() or not (Humanoid.Parent and (Humanoid.Health > 0 and not u17.Handcuffed.Value)))) then
            return;
        end;

        local v101 = "";

        if p100 == "/e dance" then
            v101 = u20[math.random(1, #u20)];
        elseif string.sub(p100, 1, 3) == "/e " then
            v101 = string.sub(p100, 4);
        elseif string.sub(p100, 1, 7) == "/emote " then
            v101 = string.sub(p100, 8);
        end;

        if u5 == "Standing" and u22[v101] ~= nil then
            if u15 then
                u15:Destroy();
            end;

            if v101 ~= "wave" and v101 ~= "point" then
                u15 = _G.AffectChar("AC", (1 / 0));
            end;

            playAnimation(v101, 0.1, Humanoid, true);
        end;
    end)
};

script:WaitForChild("PlayEmote").OnInvoke = function(p103) -- Line: 975
    -- upvalues: Humanoid (copy), u17 (copy), u5 (ref), u22 (copy), u15 (ref), u8 (ref)
    if _G.CheckIfFlinching() or (_G.RagdollCheck() or (_G.DownedCheck() or not (Humanoid.Parent and (Humanoid.Health > 0 and not u17.Handcuffed.Value)))) then
        return;
    end;

    if u5 == "Standing" then
        if u22[p103] == nil then
            return false;
        end;

        if u15 then
            u15:Destroy();
        end;

        if p103 ~= "wave" and p103 ~= "point" then
            u15 = _G.AffectChar("AC", (1 / 0));
        end;

        playAnimation(p103, 0.1, Humanoid, true);

        return true, u8;
    end;
end;

if TextChatCommand then
    TextChatCommand.Triggered:Connect(function(p104: userdata, p105: string) -- Line: 999
        -- upvalues: Humanoid (copy), u17 (copy), u5 (ref), Players (copy), u22 (copy), u15 (ref), u8 (ref), TextChatService (copy)
        if _G.CheckIfFlinching() or (_G.RagdollCheck() or (_G.DownedCheck() or not (Humanoid.Parent and (Humanoid.Health > 0 and not u17.Handcuffed.Value)))) then
            return;
        end;

        if u5 ~= "Standing" then
            return;
        end;

        local string_split_ret = string.split(p105, " ");
        local v106 = string_split_ret[2] and string_split_ret[2]:lower();

        if not Players:GetPlayerByUserId(p104.UserId) then
            return;
        end;

        if v106 and u22[v106] ~= nil then
            if u15 then
                u15:Destroy();
            end;

            if v106 ~= "wave" and v106 ~= "point" then
                u15 = _G.AffectChar("AC", (1 / 0));
            end;

            playAnimation(v106, 0.1, Humanoid, true);

            return true, u8;
        end;

        local TextChannels = TextChatService:FindFirstChild("TextChannels");

        if TextChannels then
            TextChannels = TextChannels:FindFirstChild("RBXGeneral");
        end;

        if TextChannels then
            TextChannels:DisplaySystemMessage(v106 and "Unknown emote: " .. v106 or "Usage: /e <emoteName>");
        end;
    end);
end;

local function RGECheck() -- Line: 1037
    -- upvalues: Character (copy)
    return _G.HSRGEE(Character);
end;

local u107 = false;
local u108 = false;
local u109 = nil;

local function gotTool() -- Line: 1046
    -- upvalues: Character (copy)
    return Character:FindFirstChildOfClass("Tool");
end;

local function healthChanged(p110) -- Line: 1050
    -- upvalues: u109 (ref), Humanoid (copy), u13 (ref), u107 (ref), u108 (ref), Character (copy)
    if p110 <= 0 then
        onDied();
        move(0);
        u109:Disconnect();

        return;
    end;

    local Attribute = Humanoid:GetAttribute("ForceWalkStage");

    if Attribute then
        u13 = Attribute;
    else
        local v111 = Humanoid.MaxHealth * 0.65;
        local v112 = Humanoid.MaxHealth * 0.3;

        if v111 < p110 and not (u107 or u108) then
            u13 = 1;
        elseif _G.HSRGEE(Character) or (p110 > v111 or (v112 >= p110 or u107 and u108)) then
            if not (_G.HSRGEE(Character) or p110 > v112 and not (u107 and u108)) and p110 > 0 then
                u13 = 3;
            end;
        else
            u13 = 2;
        end;
    end;

    if p110 <= 0 then
        stopAllAnimations();
    end;
end;

u109 = Humanoid.HealthChanged:Connect(healthChanged);
healthChanged(Humanoid.Health);
task.delay(1, function() -- Line: 1083
    -- upvalues: Humanoid (copy), healthChanged (copy)
    if Humanoid and Humanoid.Parent then
        healthChanged(Humanoid.Health);
    end;
end);
local RA_B = ReplicatedStorage.Storage.Animations.RA_B;
local u113 = nil;

local function c1_f(p114) -- Line: 1091
    -- upvalues: Character (copy), u113 (ref), Humanoid (copy), RA_B (copy)
    if Character:FindFirstChildOfClass("Tool") or not _G.LimbCheck(Character, "Right Arm", "Broken") then
        if u113 then
            u113:Stop(0.15);
            u113:Destroy();
            u113 = nil;
        end;

        return;
    end;

    u113 = Humanoid:LoadAnimation(RA_B);
    u113.Priority = Enum.AnimationPriority.Action3;
    u113:Play(0.15, 0.8, 1);
end;

if u17 then
    u17.HealthValues["Right Arm"].Broken.Changed:Connect(c1_f);
    local LA_B = ReplicatedStorage.Storage.Animations.LA_B;
    local u115 = nil;

    local function c2_f(p116) -- Line: 1118
        -- upvalues: Character (copy), u115 (ref), Humanoid (copy), LA_B (copy)
        if Character:FindFirstChildOfClass("Tool") or not _G.LimbCheck(Character, "Left Arm", "Broken") then
            if u115 then
                u115:Stop(0.15);
                u115:Destroy();
                u115 = nil;
            end;

            return;
        end;

        u115 = Humanoid:LoadAnimation(LA_B);
        u115.Priority = Enum.AnimationPriority.Action3;
        u115:Play(0.15, 0.8, 1);
    end;

    u17.HealthValues["Left Arm"].Broken.Changed:Connect(c2_f);
    local RL_B = ReplicatedStorage.Storage.Animations.RL_B;
    local u117 = nil;

    local function c3_f(p118) -- Line: 1142
        -- upvalues: u17 (copy), Character (copy), u108 (ref), u117 (ref), Humanoid (copy), RL_B (copy), healthChanged (copy)
        if u17.Currents:FindFirstChild("RLEG") or not _G.LimbCheck(Character, "Right Leg", "Broken") then
            u108 = false;

            if u117 then
                u117:Stop(0.15);
                u117:Destroy();
                u117 = nil;
            end;
        else
            u108 = true;
            u117 = Humanoid:LoadAnimation(RL_B);
            u117:Play(0.15, 0.4, 1);
        end;

        healthChanged(Humanoid.Health);
    end;

    u17.HealthValues["Right Leg"].Broken.Changed:Connect(c3_f);
    local LL_B = ReplicatedStorage.Storage.Animations.LL_B;
    local u119 = nil;

    local function c4_f(p120) -- Line: 1168
        -- upvalues: Character (copy), u107 (ref), u119 (ref), Humanoid (copy), LL_B (copy), healthChanged (copy)
        if _G.LimbCheck(Character, "Left Leg", "Broken") then
            u107 = true;
            u119 = Humanoid:LoadAnimation(LL_B);
            u119:Play(0.15, 0.4, 1);
        else
            u107 = false;

            if u119 then
                u119:Stop(0.15);
                u119:Destroy();
                u119 = nil;
            end;
        end;

        healthChanged(Humanoid.Health);
    end;

    u17.HealthValues["Left Leg"].Broken.Changed:Connect(c4_f);
    v102.rage = Events.OHNRGEE.OnClientEvent:Connect(function(p121) -- Line: 1192
        -- upvalues: c1_f (copy), c2_f (copy), c3_f (copy), c4_f (copy)
        c1_f();
        c2_f();
        c3_f();
        c4_f();
    end);
    c1_f();
    c2_f();
    c3_f();
    c4_f();
    Character.ChildAdded:Connect(function(p122) -- Line: 1212
        -- upvalues: RunService (copy), c1_f (copy), c2_f (copy), u15 (ref), u13 (ref), Humanoid (copy), u5 (ref)
        if p122:IsA("Tool") then
            RunService.Heartbeat:Wait();
            c1_f();
            c2_f();

            if u15 then
                local v123 = _G.DownedCheck and _G.DownedCheck() and "didle" or "idle" .. u13;
                playAnimation(v123, 0.1, Humanoid);
                u5 = "Standing";
            end;
        end;
    end);
    Character.ChildRemoved:Connect(function(p124) -- Line: 1229
        -- upvalues: RunService (copy), c1_f (copy), c2_f (copy)
        if p124:IsA("Tool") then
            RunService.Heartbeat:Wait();
            c1_f();
            c2_f();
        end;
    end);
    u17.Currents.ChildAdded:Connect(function(p125) -- Line: 1237
        -- upvalues: c3_f (copy)
        if p125.Name == "RLEG" then
            c3_f();
        end;
    end);
    u17.Currents.ChildRemoved:Connect(function(p126) -- Line: 1242
        -- upvalues: c3_f (copy)
        if p126.Name == "RLEG" then
            c3_f();
        end;
    end);
    u17.Downed.Changed:Connect(function(p127) -- Line: 1248
        -- upvalues: Humanoid (copy), u13 (ref)
        if Humanoid.Health <= 0 then
            return;
        end;

        playAnimation(p127 and "didle" or "idle" .. u13, 0.2, Humanoid);
    end);
end;

local v128 = _G.DownedCheck and _G.DownedCheck() and "didle" or "idle" .. u13;
playAnimation(v128, 0.1, Humanoid);
u5 = "Standing";
v102.flinch = OnFlinched.OnClientEvent:Connect(function() -- Line: 1276
    -- upvalues: Humanoid (copy), u21 (ref), u13 (ref)
    if Humanoid.Health <= 0 then
        return;
    end;

    if u21 then
        local v129 = _G.DownedCheck and _G.DownedCheck() and "didle" or "idle" .. u13;
        playAnimation(v129, 0.2, Humanoid);
    end;
end);

while Character.Parent ~= nil do
    local _, v130 = wait(0.1);
    move(v130);
end;

for _, v in pairs(v102) do
    v:Disconnect();
end;
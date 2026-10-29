-- ============================================================
-- SCRIPT: ClientMover
-- CLASS:  LocalScript
-- PATH:   .ClientMover
-- ============================================================

-- Decompiled with Potassium's decompiler.

local l_wait = wait;
local l_time = time;
local l_pcall = pcall;
local l_xpcall = xpcall;
local l_setfenv = setfenv;
local l_tostring = tostring;
local l_game = game;
local task_spawn = task.spawn;
local l_require = require;
local task_wait = task.wait;
local u1 = l_game:FindFirstChildWhichIsA("Players") or l_game:FindService("Players");
local LocalPlayer = u1.LocalPlayer;
local u2 = false;

local function loadingDetected(p3) -- Line: 21
    -- upvalues: LocalPlayer (copy), u1 (copy)
    (LocalPlayer or u1.LocalPlayer):Kick((`:: Adonis Loader - Security ::\n{p3}`));

    while true do

    end;
end;

task_spawn(l_xpcall, function() -- Line: 26
    -- upvalues: l_game (copy), l_pcall (copy), l_require (copy), task_spawn (copy), l_xpcall (copy), loadingDetected (copy), u2 (ref)
    local v4 = l_game:GetService("Workspace") or l_game:GetService("ReplicatedStorage");
    local v5, u6 = l_pcall(l_require, l_game);

    if v4 then
        if not v5 and string.match(u6, "^Attempted to call require with invalid argument%(s%)%.$") then
            u2 = true;

            return;
        end;

        task_spawn(l_xpcall, function() -- Line: 36
            -- upvalues: loadingDetected (ref), u6 (copy)
            loadingDetected((`Require load fail. {u6}`));
        end, function(p7) -- Line: 36
            -- upvalues: loadingDetected (ref)
            loadingDetected(p7);
        end);

        while true do

        end;
    else
        task_spawn(l_xpcall, function() -- Line: 31
            -- upvalues: loadingDetected (ref)
            loadingDetected("Service not returning");
        end, function(p8) -- Line: 31
            -- upvalues: loadingDetected (ref)
            loadingDetected(p8);
        end);

        while true do

        end;
    end;
end, function(p9) -- Line: 41
    -- upvalues: task_spawn (copy), loadingDetected (copy)
    task_spawn(loadingDetected, p9);

    while true do

    end;
end);
task_spawn(l_xpcall, function() -- Line: 43
    -- upvalues: task_wait (copy), u2 (ref), task_spawn (copy), l_xpcall (copy), loadingDetected (copy)
    task_wait();
    task_wait();

    if u2 then
        return;
    end;

    task_spawn(l_xpcall, function() -- Line: 48
        -- upvalues: loadingDetected (ref), u2 (ref)
        loadingDetected((`Loading detectors failed to load{u2}`));
    end, function(p10) -- Line: 48
        -- upvalues: loadingDetected (ref)
        loadingDetected(p10);
    end);

    while true do

    end;
end, function(p11) -- Line: 51
    -- upvalues: task_spawn (copy), loadingDetected (copy)
    task_spawn(loadingDetected, p11);

    while true do

    end;
end);
local LocalPlayer2 = game:GetService("Players").LocalPlayer;
local script_Parent = script.Parent;
local Parent = script_Parent.Parent;
local Kick = LocalPlayer2.Kick;
local Client = script_Parent:WaitForChild("Client");
local _ = print;
local l_warn = warn;
local u12 = l_time();

local function v13(...) -- Line: 65
end;

local function u15(p14) -- Line: 69
    -- upvalues: LocalPlayer2 (copy), l_warn (copy)
    if LocalPlayer2.UserId == 1237666 then
        l_warn((`ACLI: {p14}`));
    end;
end;

local function Kill(u16) -- Line: 75
    -- upvalues: l_pcall (copy), Kick (copy), LocalPlayer2 (copy), l_wait (copy)
    l_pcall(function() -- Line: 77
        -- upvalues: Kick (ref), LocalPlayer2 (ref), u16 (copy)
        Kick(LocalPlayer2, u16);
    end);
    l_wait(1);
    l_pcall(function() -- Line: 79
        -- upvalues: l_wait (ref), l_pcall (ref)
        while l_wait() do
            l_pcall(function() -- Line: 79
                while true do

                end;
            end);
        end;
    end);
end;

local function Locked(u17) -- Line: 82
    -- upvalues: l_pcall (copy)
    return not u17 and true or not l_pcall(function() -- Line: 83
        -- upvalues: u17 (copy)
        return u17.GetFullName(u17);
    end);
end;

local function loadingTime() -- Line: 86
    -- upvalues: u15 (copy), l_setfenv (copy), l_time (copy), u12 (copy), l_tostring (copy)
    u15("LoadingTime Called");
    l_setfenv(1, {});
    u15((l_tostring(l_time() - u12)));
end;

local function callCheck(u18) -- Line: 92
    -- upvalues: u15 (copy), Locked (copy), Kill (copy), l_xpcall (copy)
    u15((`CallCheck: {u18}`));

    if Locked(u18) then
        u15("Child locked?");
        Kill("ACLI: Locked");

        return;
    end;

    u15("Child not locked");
    l_xpcall(function() -- Line: 99
        -- upvalues: u18 (copy)
        return u18[{}];
    end, function() -- Line: 101
        -- upvalues: Kill (ref)
        if getfenv(1) ~= getfenv(2) then
            Kill("ACLI: Error");
        end;
    end);
end;

local function doPcall(p19, ...) -- Line: 109
    -- upvalues: l_pcall (copy), u15 (copy), l_tostring (copy), Kill (copy)
    local v20, v21 = l_pcall(p19, ...);

    if v20 then
        return v20, v21;
    end;

    u15((l_tostring(v21)));
    Kill((`ACLI: Error\n{v21}`));

    return v20, v21;
end;

if Client and Client:IsA("ModuleScript") then
    u15("Loading Folder...");
    u15("Waiting for Client & Special");
    local Special = script_Parent:WaitForChild("Special", 30);
    u15("Checking Client & Special");
    u15("Getting origName");
    local v22 = Special and Special.Value or script_Parent.Name;
    u15((`Got name: {v22}`));
    u15("Removing old client folder...");
    local v23 = game:GetService("StarterPlayer"):FindFirstChildOfClass("StarterPlayerScripts"):FindFirstChild(script_Parent.Name);
    u15((`FOUND?! {v23}`));
    u15((`LOOKED FOR : {script_Parent.Name}`));

    if v23 then
        v13("REMOVED!");
        v23.Parent = nil;
    end;

    u15("Changing child parent...");
    script_Parent.Name = "";
    l_wait(0.01);
    script_Parent.Parent = nil;
    u15("Destroying parent...");
    v13("Debug: Loading the client?");
    local v24 = require(Client);
    u15((`Got metatable: {v24}`));

    if v24 and (type(v24) == "userdata" and l_tostring(v24) == "Adonis") then
        local _, v25 = l_pcall(v24, {
            Module = Client,
            Start = u12,
            Loader = script,
            Name = v22,
            Folder = script_Parent,
            LoadingTime = loadingTime,
            CallCheck = callCheck,
            Kill = Kill
        });
        u15((`Got return: {v25}`));

        if v25 ~= "SUCCESS" then
            l_warn(v25);
            Kill("ACLI: Loading Error [Bad Module Return]");

            return;
        end;

        v13("Debug: The client was found and loaded?");
        u15("Client Loaded");

        if Parent and Parent:IsA("ScreenGui") then
            Parent.Parent = nil;
        end;
    end;
end;
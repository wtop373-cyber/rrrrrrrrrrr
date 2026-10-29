-- ============================================================
-- SCRIPT: Client
-- CLASS:  ModuleScript
-- PATH:   Client
-- ============================================================

-- Decompiled with Potassium's decompiler.

local table_freeze_ret = table.freeze({ "Variables", "Functions", "Core", "Remote", "UI", "Process", "Anti" });
local l__G = _G;
local l_game = game;
local l_script = script;
local l_getfenv = getfenv;
local l_setfenv = setfenv;
local l_workspace = workspace;
local l_getmetatable = getmetatable;
local l_setmetatable = setmetatable;
local l_loadstring = loadstring;
local l_coroutine = coroutine;
local l_rawequal = rawequal;
local l_typeof = typeof;
local l_print = print;
local l_math = math;
local l_warn = warn;
local l_error = error;
local l_pcall = pcall;
local l_xpcall = xpcall;
local l_select = select;
local l_rawset = rawset;
local l_rawget = rawget;
local l_ipairs = ipairs;
local l_pairs = pairs;
local l_next = next;
local l_Rect = Rect;
local l_Axes = Axes;
local l_os = os;
local l_time = time;
local l_Faces = Faces;
local table_unpack = table.unpack;
local l_string = string;
local l_Color3 = Color3;
local l_newproxy = newproxy;
local l_tostring = tostring;
local l_tonumber = tonumber;
local l_Instance = Instance;
local l_TweenInfo = TweenInfo;
local l_BrickColor = BrickColor;
local l_NumberRange = NumberRange;
local l_ColorSequence = ColorSequence;
local l_NumberSequence = NumberSequence;
local l_ColorSequenceKeypoint = ColorSequenceKeypoint;
local l_NumberSequenceKeypoint = NumberSequenceKeypoint;
local l_PhysicalProperties = PhysicalProperties;
local l_Region3int16 = Region3int16;
local l_Vector3int16 = Vector3int16;
local l_require = require;
local l_table = table;
local l_type = type;
local task_wait = task.wait;
local l_Enum = Enum;
local l_UDim = UDim;
local l_UDim2 = UDim2;
local l_Vector2 = Vector2;
local l_Vector3 = Vector3;
local l_Region3 = Region3;
local l_CFrame = CFrame;
local l_Ray = Ray;
local task_delay = task.delay;
local task_defer = task.defer;
local l_task = task;
local l_tick = tick;

local function v3(p1, p2) -- Line: 93
    return p1 or error(p2 or "assertion failed!", 2);
end;

local u4 = l_table.freeze({ "Workspace", "Players", "Lighting", "ReplicatedStorage", "ReplicatedFirst", "ScriptContext", "JointsService", "LogService", "Teams", "SoundService", "StarterGui", "StarterPack", "StarterPlayer", "GroupService", "MarketplaceService", "HttpService", "TestService", "RunService", "NetworkClient" });
local u5 = {};

local function u6() -- Line: 121
    -- upvalues: l_warn (copy), u5 (copy)
    l_warn(":: Adonis :: Dumping client log...");

    for _, v in u5 do
        l_warn(":: Adonis ::", v);
    end;
end;

local function u7(...) -- Line: 128
    -- upvalues: l_table (ref), u5 (copy)
    l_table.insert(u5, l_table.concat({ ... }, " "));
end;

local u8 = l_game:GetService("RunService"):IsStudio();
l_game:GetService("NetworkClient").ChildRemoved:Connect(function(p9) -- Line: 134
    -- upvalues: u8 (copy), l_warn (copy), u6 (copy)
    if not u8 then
        l_warn("~! PLAYER DISCONNECTED/KICKED! DUMPING ADONIS CLIENT LOG!");
        u6();
    end;
end);
local u10 = {};
local u11 = l_getfenv();
l_setfenv(1, (l_setmetatable({}, {
    __metatable = u10
})));
l_time();
local u12 = false;
local new = l_Instance.new;
local u13 = l_require;
local Parent = l_script.Parent;
local u14 = {};
local u15 = {};
local u16 = {};
local u17 = {};

local function isModule(p18) -- Line: 155
    -- upvalues: u15 (ref), l_rawequal (ref)
    for _, v in u15.Modules do
        if l_rawequal(p18, v) then
            return true;
        end;
    end;

    return false;
end;

local function logError(...) -- Line: 164
    -- upvalues: l_warn (copy), u15 (ref), l_table (ref)
    l_warn("ERROR: ", ...);

    if u15 and u15.Remote then
        u15.Remote.Send("LogError", l_table.concat({ ... }, " "));
    end;
end;

local function v19(...) -- Line: 173
    -- upvalues: l_print (copy)
    l_print(":: Adonis ::", ...);
end;

local function v23(p20, ...) -- Line: 182
    -- upvalues: l_pcall (copy), l_coroutine (ref), l_warn (copy), logError (copy), l_tostring (copy)
    local v21, v22 = l_pcall(l_coroutine.resume, l_coroutine.create(p20), ...);

    if v22 then
        l_warn(":: ADONIS_ERROR ::", v22);
        logError((l_tostring(v22)));
    end;

    return v21, v22;
end;

local function u27(p24, ...) -- Line: 193
    -- upvalues: l_pcall (copy), logError (copy), l_tostring (copy)
    local v25, v26 = l_pcall(p24, ...);

    if v26 then
        logError((l_tostring(v26)));
    end;

    return v25, v26;
end;

local function u29(p28, ...) -- Line: 203
    -- upvalues: l_coroutine (ref)
    return l_coroutine.resume(l_coroutine.create(p28), ...);
end;

local function v31(...) -- Line: 207
    -- upvalues: l_coroutine (ref)
    local v30 = l_coroutine.wrap(function(...) -- Line: 208
        -- upvalues: l_coroutine (ref)
        while true do
            l_coroutine.yield(...);
        end;
    end);
    v30(...);

    return v30;
end;

local u32 = nil;
local wrap = l_coroutine.wrap;
u32 = v31(function(u33) -- Line: 221
    -- upvalues: wrap (copy), l_pcall (copy), l_task (ref), u16 (ref), u32 (ref)
    wrap(function() -- Line: 223
        -- upvalues: l_pcall (ref)
        l_pcall(function() -- Line: 224
        end);
    end)();
    wrap(function() -- Line: 233
        -- upvalues: l_pcall (ref), l_task (ref), u16 (ref), u33 (copy)
        l_pcall(function() -- Line: 234
            -- upvalues: l_task (ref), u16 (ref), u33 (ref)
            l_task.wait(1);
            u16.Player:Kick(u33);
        end);
    end)();
    wrap(function() -- Line: 240
        -- upvalues: l_pcall (ref), l_task (ref), u32 (ref)
        l_pcall(function() -- Line: 241
            -- upvalues: l_task (ref), l_pcall (ref), u32 (ref)
            l_task.wait(5);

            while true do
                l_pcall(l_task.spawn, function() -- Line: 244
                    -- upvalues: l_task (ref), u32 (ref)
                    l_task.spawn(u32());
                end);
            end;
        end);
    end)();
end);

local function u39(u34, p35) -- Line: 255
    -- upvalues: u14 (ref), u11 (copy), u10 (copy), l_setmetatable (copy), l_type (copy)
    local v38 = l_setmetatable({}, {
        __index = function(p36, p37) -- Line: 257, Name: __index
            -- upvalues: u14 (ref), u34 (copy), u11 (ref)
            return u14[p37] or (u34 or u11)[p37];
        end,

        __metatable = u10
    });

    if p35 and l_type(p35) == "table" then
        for i, v in p35 do
            v38[i] = v;
        end;
    end;

    return v38;
end;

local function u40() -- Line: 273
    -- upvalues: u15 (ref), u16 (ref)
    return {
        Client = u15,
        Service = u16
    };
end;

local function u51(p41, p42, p43, p44) -- Line: 280
    -- upvalues: l_pcall (copy), l_require (ref), l_type (copy), u16 (ref), l_setfenv (copy), u39 (ref), l_getfenv (copy), u40 (copy), l_warn (copy), l_tostring (copy), u15 (ref)
    local v45, v46 = l_pcall(l_require, p41);

    if v45 then
        if l_type(v46) ~= "function" then
            u15[p41.Name] = v46;

            return;
        end;

        if p42 then
            local v47, v48 = u16.TrackTask(`Plugin: {p41}`, p44 and v46 and v46 or l_setfenv(v46, u39(l_getfenv(v46), p43)), u40(), u39);

            if not v47 then
                l_warn((`Module encountered an error while loading: {p41}`));
                l_warn((l_tostring(v48)));
            end;
        else
            local v49, v50 = u16.TrackTask(`Thread: Plugin: {p41}`, p44 and v46 and v46 or l_setfenv(v46, u39(l_getfenv(v46), p43)), u40(), u39);

            if not v49 then
                l_warn((`Module encountered an error while loading: {p41}`));
                l_warn((l_tostring(v50)));
            end;
        end;
    else
        l_warn("Error while loading client module", p41, v46);
    end;
end;

u7("Client setmetatable");
u15 = l_setmetatable({
    Handlers = {},
    Modules = {},
    Service = u16,
    Module = l_script,
    Print = v19,
    Warn = l_warn,
    Deps = {},
    Pcall = u27,
    cPcall = v23,
    Routine = u29,
    OldPrint = l_print,
    LogError = logError,
    TestEvent = l_Instance.new("RemoteEvent"),

    Disconnect = function(p52) -- Line: 337, Name: Disconnect
        -- upvalues: u16 (ref)
        u16.Player:Kick(p52 or "Disconnected from server");
    end
}, {
    __index = function(p53, p54) -- Line: 345, Name: __index
        -- upvalues: l_pcall (copy), u32 (ref), l_type (copy), u16 (ref)
        if p54 ~= "Kill" then
            return;
        end;

        local v55, v56 = l_pcall(function() -- Line: 347
            -- upvalues: u32 (ref)
            return u32();
        end);

        if v55 and l_type(v56) == "function" then
            return v56;
        end;

        u16.Players.LocalPlayer:Kick("Adonis (PlrClientIndexKlErr)");

        while true do

        end;
    end
});
u14 = {
    Pcall = u27,
    GetEnv = u39,
    cPcall = v23,
    client = u15,
    Folder = Parent,
    Routine = u29,
    service = u16,
    logError = logError,
    origEnv = u11,
    log = u7,
    dumplog = u6
};
u7("Create service metatable");
u16 = l_require(Parent.Shared.Service)(function(p57, p58, p59, ...) -- Line: 378
    -- upvalues: logError (copy), l_tostring (copy), u32 (ref)
    if p57 == "MethodError" then
        logError("Client", (`Method Error Occured: {p58}`));

        return;
    end;

    if p57 == "ServerError" then
        logError("Client", (l_tostring(p58)));

        return;
    end;

    if p57 == "ReadError" then
        u32()((l_tostring(p58)));
    end;
end, function(p60, p61, p62) -- Line: 399
    -- upvalues: isModule (copy), l_script (ref), Parent (ref)
    if not (isModule(p60) or (p60 == l_script or (p60 == Parent or p61 ~= nil))) then
        p62.UnHook();
    end;
end, u17, u39(nil, {
    client = u15
}));
u7("Localize");
local Localize = u16.Localize;
local u63 = Localize(l_os);
local v64 = Localize(l_math);
l_table = Localize(l_table);
local u65 = Localize(l_string);
l_coroutine = Localize(l_coroutine);
Localize(l_Instance);
local v66 = Localize(l_Vector2);
local v67 = Localize(l_Vector3);
local v68 = Localize(l_CFrame);
local v69 = Localize(l_UDim2);
local v70 = Localize(l_UDim);
local v71 = Localize(l_Ray);
local v72 = Localize(l_Rect);
local v73 = Localize(l_Faces);
local v74 = Localize(l_Color3);
local v75 = Localize(l_NumberRange);
local v76 = Localize(l_NumberSequence);
local v77 = Localize(l_NumberSequenceKeypoint);
local v78 = Localize(l_ColorSequenceKeypoint);
local v79 = Localize(l_PhysicalProperties);
local v80 = Localize(l_ColorSequence);
local v81 = Localize(l_Region3int16);
local v82 = Localize(l_Vector3int16);
local v83 = Localize(l_BrickColor);
local v84 = Localize(l_TweenInfo);
local v85 = Localize(l_Axes);
l_task = Localize(l_task);
u7("Wrap");
local Wrap = u16.Wrap;
local UnWrap = u16.UnWrap;

for i, v in u16 do
    if l_type(v) == "userdata" then
        u16[i] = Wrap(v, true);
    end;
end;

Parent = Wrap(Parent, true);
local v86 = Wrap(l_Enum, true);
l_rawequal = u16.RawEqual;
l_script = Wrap(l_script, true);
local v87 = Wrap(l_game, true);
local u88 = Wrap(l_workspace, true);

l_require = function(p89: any, p90: boolean?) -- Line: 462
    -- upvalues: u13 (copy), UnWrap (copy), Wrap (copy)
    if p90 == true then
        return u13(UnWrap(p89));
    end;

    return Wrap(u13(UnWrap(p89)), true);
end;

u15.Service = u16;
u15.Module = Wrap(u15.Module, true);
u7("Setting things up");

for i, v in {
    _G = l__G,
    game = v87,
    spawn = task_defer,
    script = l_script,
    getfenv = l_getfenv,
    setfenv = l_setfenv,
    workspace = u88,
    getmetatable = l_getmetatable,
    setmetatable = l_setmetatable,
    loadstring = l_loadstring,
    coroutine = l_coroutine,
    rawequal = l_rawequal,
    typeof = l_typeof,
    print = v19,
    math = v64,
    warn = l_warn,
    error = l_error,
    assert = v3,
    pcall = l_pcall,
    xpcall = l_xpcall,
    select = l_select,
    rawset = l_rawset,
    rawget = l_rawget,
    ipairs = l_ipairs,
    pairs = l_pairs,
    next = l_next,
    Rect = v72,
    Axes = v85,
    os = u63,
    time = l_time,
    Faces = v73,
    delay = task_delay,
    unpack = table_unpack,
    string = u65,
    Color3 = v74,
    newproxy = l_newproxy,
    tostring = l_tostring,
    tonumber = l_tonumber,
    Instance = {
        new = function(p91, p92) -- Line: 458, Name: new
            -- upvalues: Wrap (copy), new (copy), UnWrap (copy)
            return Wrap(new(p91, UnWrap(p92)), true);
        end
    },
    TweenInfo = v84,
    BrickColor = v83,
    NumberRange = v75,
    ColorSequence = v80,
    NumberSequence = v76,
    ColorSequenceKeypoint = v78,
    NumberSequenceKeypoint = v77,
    PhysicalProperties = v79,
    Region3int16 = v81,
    Vector3int16 = v82,
    require = l_require,
    table = l_table,
    type = l_type,
    wait = task_wait,
    Enum = v86,
    UDim = v70,
    UDim2 = v69,
    Vector2 = v66,
    Vector3 = v67,
    Region3 = l_Region3,
    CFrame = v68,
    Ray = v71,
    task = l_task,
    tick = l_tick,
    service = u16
} do
    u14[i] = v;
end;

u7("Return init function");

return u16.NewProxy({
    __metatable = "Adonis",

    __call = function(p93, u94) -- Line: 545, Name: __call
        -- upvalues: u7 (copy), u65 (ref), Parent (ref), u16 (ref), l_setfenv (copy), u10 (copy), l_setmetatable (copy), u15 (ref), u13 (copy), UnWrap (copy), l_script (ref), u4 (copy), u17 (copy), u29 (copy), logError (copy), u88 (ref), table_freeze_ret (copy), u51 (copy), u27 (copy), u12 (ref), u63 (ref), l_type (copy), l_getmetatable (copy), l_table (ref)
        u7("Begin init");
        local v95, v96 = u65.match(u94.Name, "(.*)\\(.*)");
        Parent = u16.Wrap(u94.Folder or Parent);
        l_setfenv(1, (l_setmetatable({}, {
            __metatable = u10
        })));
        u15.Folder = Parent;
        u15.UIFolder = Parent:WaitForChild("UI", 9000000000);
        u15.Shared = Parent:WaitForChild("Shared", 9000000000);
        u15.Loader = u94.Loader;
        u15.Module = u94.Module;
        u15.DepsName = v96;
        u15.TrueStart = u94.Start;
        u15.LoadingTime = u94.LoadingTime;
        u15.RemoteName = v95;
        u15.Typechecker = u13(UnWrap(u15.Shared.Typechecker));
        u15.Changelog = u13(UnWrap(u15.Shared.Changelog));
        local u97 = u13(UnWrap(u15.Shared.MatIcons));
        u15.MatIcons = l_setmetatable({}, {
            __metatable = "Adonis_MatIcons",

            __index = function(p98, p99) -- Line: 569, Name: __index
                -- upvalues: u97 (copy)
                local v100 = u97[p99];

                if v100 then
                    p98[p99] = `rbxassetid://{v100}`;

                    return p98[p99];
                end;
            end
        });
        u7("Get dependencies");

        for _, child in Parent:WaitForChild("Dependencies", 9000000000):GetChildren() do
            u15.Deps[child.Name] = child;
        end;

        u7("Destroy script object");
        l_script.Parent = nil;
        u7("Initial services caching");

        for _, v in u4 do
            local _ = u16[v];
        end;

        u7("Add service specific");
        u17.Player = u16.Players.LocalPlayer or (function() -- Line: 600
            -- upvalues: u16 (ref)
            u16.Players:GetPropertyChangedSignal("LocalPlayer"):Wait();

            return u16.Players.LocalPlayer;
        end)();
        u17.PlayerGui = u17.Player:FindFirstChildWhichIsA("PlayerGui");

        if not u17.PlayerGui then
            u29(function() -- Line: 606
                -- upvalues: u17 (ref), logError (ref)
                local PlayerGui = u17.Player:WaitForChild("PlayerGui", 120);

                if PlayerGui then
                    u17.PlayerGui = PlayerGui;

                    return;
                end;

                logError("PlayerGui unable to be fetched? [Waited 120 Seconds]");
            end);
        end;

        function u17.Filter(p101, p102, p103) -- Line: 627
            -- upvalues: u15 (ref), u16 (ref)
            return u15.Remote.Get("Filter", p101, p103 and p102 and p102 or u16.Player, p103 or p102);
        end;

        function u17.LaxFilter(p104, p105) -- Line: 630
            -- upvalues: u16 (ref)
            return u16.Filter(p104, p105 or u16.Player, p105 or u16.Player);
        end;

        function u17.BroadcastFilter(p106, p107) -- Line: 633
            -- upvalues: u15 (ref), u16 (ref)
            return u15.Remote.Get("BroadcastFilter", p106, p107 or u16.Player);
        end;

        function u17.IsMobile() -- Line: 637
            -- upvalues: u16 (ref)
            return u16.UserInputService.TouchEnabled and not u16.UserInputService.MouseEnabled and not u16.UserInputService.KeyboardEnabled;
        end;

        function u17.LocalContainer() -- Line: 643
            -- upvalues: u15 (ref), u16 (ref), u88 (ref)
            local Variables = u15.Variables;

            if not (Variables.LocalContainer and Variables.LocalContainer.Parent) then
                Variables.LocalContainer = u16.New("Folder", {
                    Archivable = false,
                    Parent = u88,
                    Name = `__ADONIS_LOCALCONTAINER_{u15.Functions.GetRandom()}`
                });
            end;

            return Variables.LocalContainer;
        end;

        u17.IncognitoPlayers = {};
        u7("Loading core modules");

        for _, v in table_freeze_ret do
            local v108 = Parent.Core:FindFirstChild(v);

            if v108 then
                u7((`~! Loading Core Module: {v}`));
                u51(v108, true, {
                    script = l_script
                }, true);
            end;
        end;

        local u109 = {};
        local u110 = {};

        function u15.Finish_Loading() -- Line: 674
            -- upvalues: u7 (ref), u15 (ref), u110 (copy), u27 (ref), u94 (copy), u109 (copy), u12 (ref), u16 (ref), u63 (ref)
            u7("Client fired finished loading");

            if not u15.Core.Key then
                u7("Client missing remote key");
                u15.Kill()("Missing remote key");

                return;
            end;

            u7("~! Doing run after loaded");

            for _, v in u110 do
                u27(v, u94);
            end;

            u7("~! Doing run last");

            for _, v in u109 do
                u27(v, u94);
            end;

            u7("Finish loading");
            u12 = true;

            function u15.Finish_Loading() -- Line: 692
            end;

            u15.LoadingTime();
            u16.Events.FinishedLoading:Fire(u63.time());
            u7("~! FINISHED LOADING!");
        end;

        u7("~! Init cores");
        local v111 = {};
        local v112 = {};

        for _, v in table_freeze_ret do
            local v113 = u15[v];
            u7((`~! INIT: {v}`));

            if v113 and (l_type(v113) == "table" or l_type(v113) == "userdata" and l_getmetatable(v113) == "ReadOnly_Table") then
                if v113.RunLast then
                    l_table.insert(u109, v113.RunLast);
                    v113.RunLast = nil;
                end;

                if v113.RunAfterInit then
                    l_table.insert(v111, v113.RunAfterInit);
                    v113.RunAfterInit = nil;
                end;

                if v113.RunAfterPlugins then
                    l_table.insert(v112, v113.RunAfterPlugins);
                    v113.RunAfterPlugins = nil;
                end;

                if v113.RunAfterLoaded then
                    l_table.insert(u110, v113.RunAfterLoaded);
                    v113.RunAfterLoaded = nil;
                end;

                if v113.Init then
                    u7((`Run init for {v}`));
                    u27(v113.Init, u94);
                    v113.Init = nil;
                end;
            end;
        end;

        u7("~! Running after init");

        for _, v in v111 do
            u27(v, u94);
        end;

        u7("~! Running plugins");

        for _, child in Parent.Plugins:GetChildren() do
            if child.Name ~= "README" then
                u51(child, false, {
                    script = child
                });
            end;
        end;

        u7("~! Running after plugins");

        for _, v in v112 do
            u27(v, u94);
        end;

        u7("Initial loading complete");
        u15.AllModulesLoaded = true;
        u16.Events.AllModulesLoaded:Fire(u63.time());
        u16.Events.ClientInitialized:Fire();
        u7("~! Return success");

        return "SUCCESS";
    end,

    __tostring = function() -- Line: 805, Name: __tostring
        return "Adonis";
    end
});
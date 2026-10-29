-- ============================================================
-- SCRIPT: Service
-- CLASS:  ModuleScript
-- PATH:   .Shared.Service
-- ============================================================

-- Decompiled with Potassium's decompiler.

server = nil;
client = nil;
Pcall = nil;
cPcall = nil;
Routine = nil;
local u1 = nil;
local u2 = nil;
local u3 = {};
local u7 = setmetatable({}, {
    __metatable = "Methods",

    __index = function(p4, u5) -- Line: 11, Name: __index
        -- upvalues: u3 (copy), u2 (ref)
        return function(u6, ...) -- Line: 12
            -- upvalues: u5 (copy), u3 (ref), u2 (ref)
            local success, result = pcall(function() -- Line: 13
                -- upvalues: u6 (copy)
                return u6.ClassName;
            end);

            if not (success and (result and (u6[u5] and type(u6[u5]) == "function"))) then
                return u6[u5](u6, ...);
            end;

            if not u3[result] then
                u3[result] = {};
            end;

            if not u3[result][u5] then
                u3[result][u5] = u6[u5];
            end;

            if u3[result][u5] ~= u6[u5] and u2 then
                u2("MethodError", `{debug.traceback()} || Cached method doesn't match found method: {u5}`, `Method: {u5}`, u5);
            end;

            return u3[result][u5](u6, ...);
        end;
    end
});

return function(p8, p9, u10, p11) -- Line: 39
    -- upvalues: u1 (ref), u2 (ref), u7 (copy)
    if p11 then
        setfenv(1, p11);
    end;

    local _ = _G;
    local l_game = game;
    local _ = script;
    local l_getfenv = getfenv;
    local _ = setfenv;
    local _ = workspace;
    local l_getmetatable = getmetatable;
    local l_setmetatable = setmetatable;
    local _ = loadstring;
    local l_coroutine = coroutine;
    local l_rawequal = rawequal;
    local l_typeof = typeof;
    local _ = print;
    local l_math = math;
    local l_warn = warn;
    local l_error = error;
    local l_pcall = pcall;
    local _ = xpcall;
    local l_select = select;
    local l_rawset = rawset;
    local _ = rawget;
    local l_ipairs = ipairs;
    local _ = pairs;
    local _ = next;
    local _ = Rect;
    local _ = Axes;
    local l_os = os;
    local l_time = time;
    local _ = Faces;
    local l_unpack = unpack;
    local l_string = string;
    local _ = Color3;
    local l_newproxy = newproxy;
    local l_tostring = tostring;
    local l_tonumber = tonumber;
    local l_Instance = Instance;
    local _ = TweenInfo;
    local _ = BrickColor;
    local _ = NumberRange;
    local _ = ColorSequence;
    local _ = NumberSequence;
    local _ = ColorSequenceKeypoint;
    local _ = NumberSequenceKeypoint;
    local _ = PhysicalProperties;
    local _ = Region3int16;
    local _ = Vector3int16;
    local _ = require;
    local l_table = table;
    local l_type = type;
    local task_wait = task.wait;
    local l_Enum = Enum;
    local _ = UDim;
    local _ = UDim2;
    local _ = Vector2;
    local _ = Vector3;
    local _ = Region3;
    local _ = CFrame;
    local _ = Ray;
    local task_delay = task.delay;
    local _ = task.defer;
    local _ = task;
    local _ = tick;
    u1 = server or client;
    u2 = p8;
    server = nil;
    client = nil;
    local Routine2 = p11.Routine;
    local u12 = nil;
    local u13 = {};
    local u14 = {};
    local u15 = {};
    local u16 = {};

    local function u18(p17) -- Line: 76
        return p17 and true or false;
    end;

    local u19 = {};
    local u20 = {};
    local u21 = {};
    local u22 = {};
    local u23 = {};
    local u24 = {};
    local u25 = {};
    local u26 = {};
    local u27 = {};
    local u28 = l_setmetatable({}, {
        __mode = "v"
    });
    local u29 = l_setmetatable({}, {
        __mode = "kv"
    });
    local new = l_Instance.new;
    local Folder = l_Instance.new("Folder");
    local Folder2 = l_Instance.new("Folder");
    local Folder3 = l_Instance.new("Folder");
    local Folder4 = l_Instance.new("Folder");
    local u33 = {
        new = function(p30, p31) -- Line: 100, Name: new
            -- upvalues: new (copy), u12 (ref)
            local v32 = new(p30);

            if p31 then
                v32.Parent = u12.UnWrap(p31);
            end;

            if u12 and client then
                v32 = u12.Wrap(v32, true) or v32;
            end;

            return v32;
        end
    };
    local u83 = {
        TrackTask = function(p34, u35, ...) -- Line: 102, Name: TrackTask
            -- upvalues: u1 (ref), l_math (copy), l_string (copy), l_os (copy), u24 (copy), l_pcall (copy), l_unpack (copy), l_coroutine (copy)
            local u36 = u1 and (u1.Functions and u1.Functions:GetRandom()) or l_math.random();
            local v37 = l_string.sub(p34, 1, 7) == "Thread:";
            local u38 = {
                Status = "Waiting",
                Name = p34,
                Function = u35,
                isThread = v37,
                Created = l_os.time(),
                Index = u36
            };

            local function taskFunc(...) -- Line: 115
                -- upvalues: u24 (ref), u36 (copy), u38 (copy), l_pcall (ref), u35 (copy), l_unpack (ref)
                u24[u36] = u38;
                u38.Status = "Running";
                u38.Returns = { l_pcall(u35, ...) };

                if u38.Returns[1] then
                    u38.Status = "Finished";
                else
                    u38.Status = "Errored";
                end;

                u24[u36] = nil;

                return l_unpack(u38.Returns);
            end;

            if not v37 then
                return taskFunc(...);
            end;

            u38.Thread = l_coroutine.create(taskFunc);

            return l_coroutine.resume(u38.Thread, ...);
        end,

        EventTask = function(u39, u40) -- Line: 138, Name: EventTask
            -- upvalues: u12 (ref)
            local TrackTask = u12.TrackTask;

            return function(...) -- Line: 140
                -- upvalues: TrackTask (copy), u39 (copy), u40 (copy)
                return TrackTask(u39, u40, ...);
            end;
        end,

        GetTasks = function() -- Line: 145, Name: GetTasks
            -- upvalues: u24 (copy)
            return u24;
        end,

        TaskScheduler = function(u41, p42) -- Line: 149, Name: TaskScheduler
            -- upvalues: u26 (copy), u12 (ref), l_pcall (copy), l_table (copy), task_wait (copy), l_os (copy)
            local u43 = p42 or {};

            if not u43.Temporary and u26[u41] then
                return u26[u41];
            end;

            local u46 = {
                Running = true,
                Name = u41,
                Properties = u43,
                LinkedTasks = {},
                RunnerEvent = u12.New("BindableEvent"),

                Trigger = function(p44, ...) -- Line: 159, Name: Trigger
                    p44.Event:Fire(...);
                end,

                Delete = function(p45) -- Line: 163, Name: Delete
                    -- upvalues: u43 (copy), u26 (ref), u41 (copy)
                    if not u43.Temporary then
                        u26[u41] = nil;
                    end;

                    p45.Running = false;
                    p45.Event:Disconnect();
                end
            };
            u46.Event = u46.RunnerEvent.Event:Connect(function(...) -- Line: 173
                -- upvalues: u46 (copy), l_pcall (ref), l_table (ref)
                for i, v in u46.LinkedTasks do
                    local _, v47 = l_pcall(v);

                    if v47 then
                        l_table.remove(u46.LinkedTasks, i);
                    end;
                end;
            end);

            if u43.Interval then
                while task_wait(u43.Interval) and u46.Running do
                    u46:Trigger(l_os.time());
                end;
            end;

            if not u43.Temporary then
                u26[u41] = u46;
            end;

            return u46;
        end,

        Events = l_setmetatable({}, {
            __index = function(p48, p49) -- Line: 196, Name: __index
                -- upvalues: u12 (ref)
                return u12.GetEvent(p49);
            end
        }),

        CheckEvents = function(p50) -- Line: 201, Name: CheckEvents
            return "Disabled";
        end,

        WrapEventArgs = function(p51) -- Line: 224, Name: WrapEventArgs
            -- upvalues: u12 (ref), l_type (copy)
            local Wrap = u12.Wrap;

            for i, v in p51 do
                if l_type(v) == "table" and (v.__ISWRAPPED and v.__OBJECT) then
                    p51[i] = Wrap(v.__OBJECT);
                end;
            end;

            return p51;
        end,

        UnWrapEventArgs = function(p52) -- Line: 235, Name: UnWrapEventArgs
            -- upvalues: u12 (ref)
            local UnWrap = u12.UnWrap;
            local Wrapped = u12.Wrapped;

            for i, v in p52 do
                if Wrapped(v) then
                    p52[i] = {
                        __ISWRAPPED = true,
                        __OBJECT = UnWrap(v)
                    };
                end;
            end;

            return p52;
        end,

        GetEvent = function(p53) -- Line: 250, Name: GetEvent
            -- upvalues: u19 (copy), u12 (ref), u1 (ref), l_math (copy), l_type (copy), Routine2 (copy), task_wait (copy), l_warn (copy), l_unpack (copy), l_table (copy)
            if u19[p53] then
                return u19[p53];
            end;

            local Wrap = u12.Wrap;
            local UnWrap = u12.UnWrap;
            local _ = u12.Wrapped;
            local WrapEventArgs = u12.WrapEventArgs;
            local UnWrapEventArgs = u12.UnWrapEventArgs;
            local u54 = Wrap(u12.New("BindableEvent"), u1);
            u54:SetSpecial("Wait", function(p55, u56) -- Line: 259
                -- upvalues: l_math (ref), l_type (ref), Routine2 (ref), task_wait (ref), UnWrap (copy), u54 (copy), l_warn (ref), WrapEventArgs (copy), l_unpack (ref)
                local u57 = l_math.random();
                local u58 = false;

                if u56 and (l_type(u56) == "number" and u56 > 0) then
                    Routine2(function() -- Line: 265
                        -- upvalues: task_wait (ref), u56 (copy), u58 (ref), UnWrap (ref), u54 (ref), u57 (copy)
                        task_wait(u56);

                        if not u58 then
                            UnWrap(u54):Fire(u57);
                        end;
                    end);
                end;

                local v59;

                repeat
                    v59 = { UnWrap(u54.Event):Wait() };
                until v59[1] == 2 or v59[1] == u57;

                if v59[1] ~= u57 then
                    return l_unpack(WrapEventArgs(v59), 2);
                end;

                l_warn((`Event waiter timed out [{u56}]`));

                return nil;
            end);
            u54:SetSpecial("Fire", function(p60, ...) -- Line: 287
                -- upvalues: l_table (ref), UnWrap (copy), u54 (copy), UnWrapEventArgs (copy), l_unpack (ref)
                local v61 = l_table.pack(...);
                UnWrap(u54):Fire(2, l_unpack(UnWrapEventArgs(v61), 1, v61.n));
            end);
            u54:SetSpecial("ConnectOnce", function(p62, u63) -- Line: 292
                -- upvalues: u54 (copy)
                local u64 = nil;
                u64 = u54:Connect(function(...) -- Line: 293
                    -- upvalues: u64 (ref), u63 (copy)
                    u64:Disconnect();
                    u63(...);
                end);

                return u64;
            end);
            u54:SetSpecial("Connect", function(p65, u66) -- Line: 301
                -- upvalues: l_math (ref), Wrap (copy), UnWrap (copy), u54 (copy), l_table (ref), WrapEventArgs (copy), l_unpack (ref), u1 (ref), UnWrapEventArgs (copy)
                local u67 = l_math.random();
                local v70 = Wrap(UnWrap(u54.Event):Connect(function(p68, ...) -- Line: 303
                    -- upvalues: l_table (ref), u67 (copy), u66 (copy), WrapEventArgs (ref), l_unpack (ref)
                    local v69 = l_table.pack(...);

                    if p68 == 2 or p68 == u67 then
                        u66(l_unpack(WrapEventArgs(v69), 1, v69.n));
                    end;
                end), u1);
                v70:SetSpecial("Fire", function(p71, ...) -- Line: 310
                    -- upvalues: l_table (ref), UnWrap (ref), u54 (ref), u67 (copy), UnWrapEventArgs (ref), l_unpack (ref)
                    local v72 = l_table.pack(...);
                    UnWrap(u54):Fire(u67, l_unpack(UnWrapEventArgs(v72), 1, v72.n));
                end);
                v70:SetSpecial("Wait", function(p73, p74) -- Line: 315
                    -- upvalues: UnWrap (ref), u54 (ref), u67 (copy), WrapEventArgs (ref), l_unpack (ref)
                    local v75;

                    repeat
                        v75 = { UnWrap(u54.Event):Wait(p74) };
                    until v75[1] == 2 or v75[1] == u67;

                    return l_unpack(WrapEventArgs(v75), 2);
                end);
                v70:SetSpecial("wait", u54.Wait);
                v70:SetSpecial("disconnect", v70.Disconnect);

                return v70;
            end);
            u54:SetSpecial("fire", u54.Fire);
            u54:SetSpecial("wait", u54.Wait);
            u54:SetSpecial("connect", u54.Connect);
            u54:SetSpecial("connectOnce", u54.ConnectOnce);
            u54:SetSpecial("Event", u12.Wrap(u54.Event, u1));
            u54.Event:SetSpecial("Wait", u54.Wait);
            u54.Event:SetSpecial("wait", u54.Wait);
            u54.Event:SetSpecial("Connect", u54.Connect);
            u54.Event:SetSpecial("connect", u54.Connect);
            u19[p53] = u54;

            return u54;
        end,

        HookEvent = function(p76, p77, p78) -- Line: 348, Name: HookEvent
            -- upvalues: l_type (copy), l_warn (copy), u12 (ref)
            if l_type(p76) == "string" and l_type(p77) == "function" then
                return u12.GetEvent(p76):Connect(p77);
            end;

            l_warn("Invalid argument supplied; HookEvent(string, function)");
        end,

        FireEvent = function(p79, ...) -- Line: 356, Name: FireEvent
            -- upvalues: u19 (copy)
            local v80 = u19[p79];

            if v80 then
                v80 = v80:Fire(...);
            end;

            return v80;
        end,

        RemoveEvents = function(p81) -- Line: 361, Name: RemoveEvents
            -- upvalues: u19 (copy)
            local v82 = u19[p81];

            if v82 then
                u19[p81] = nil;
                v82:Destroy();
            end;
        end
    };
    local v123 = {
        Tasks = {},
        Threads = {},

        CheckTasks = function() -- Line: 371, Name: CheckTasks
            -- upvalues: u12 (ref)
            for _, v in u12.Threads.Tasks do
                if not v.Thread or v:Status() == "dead" then
                    v:Remove();
                end;
            end;
        end,

        NewTask = function(p84, u85, p86) -- Line: 379, Name: NewTask
            -- upvalues: l_math (copy), l_os (copy), l_unpack (copy), u12 (ref), l_table (copy), u2 (ref)
            local v87 = l_math.random() * l_os.time() / 1000;
            local u88 = `{v87}:{u85}`;
            local u89 = nil;
            u89 = {
                Running = false,
                R_Status = "Idle",
                PID = v87,
                Name = p84,
                Index = u88,
                Created = l_os.time(),
                Changed = {},
                Timeout = p86 or 0,
                Finished = {},

                Function = function(...) -- Line: 393, Name: Function
                    -- upvalues: u89 (ref), u85 (copy), l_unpack (ref)
                    u89.R_Status = "Running";
                    u89.Running = true;
                    local v90 = { u85(...) };
                    u89.R_Status = "Finished";
                    u89.Running = false;
                    u89.Remove();

                    return l_unpack(v90);
                end,

                Remove = function() -- Line: 394, Name: Remove
                    -- upvalues: u89 (ref), u12 (ref), l_table (ref), u88 (copy)
                    u89.R_Status = "Removed";
                    u89.Running = false;

                    for i, v in u12.Threads.Tasks do
                        if v == u89 then
                            l_table.remove(u12.Threads.Tasks, i);
                        end;
                    end;

                    u89.Changed:Fire("Removed");
                    u89.Finished:Fire();
                    u12.RemoveEvents((`{u88}_TASKCHANGED`));
                    u12.RemoveEvents((`{u88}_TASKFINISHED`));
                    u89.Thread = nil;
                end,

                Thread = u12.Threads.Create(function(...) -- Line: 395
                    -- upvalues: u89 (ref)
                    return u89.Function(...);
                end),

                Resume = function(...) -- Line: 396, Name: Resume
                    -- upvalues: u89 (ref), u12 (ref), u2 (ref), l_unpack (ref)
                    u89.R_Status = "Resumed";
                    u89.Running = true;
                    u89.Changed:Fire("Resumed");
                    local v91 = { u12.Threads.Resume(u89.Thread, ...) };

                    if not v91[1] then
                        u2("TaskError", v91[2]);
                        u89.Changed:Fire("Errored", v91[2]);
                        u89.Remove();
                    end;

                    return l_unpack(v91);
                end,

                Status = function() -- Line: 397, Name: Status
                    -- upvalues: u89 (ref), l_os (ref), u12 (ref)
                    if u89.Timeout == 0 or l_os.time() - u89.Created <= u89.Timeout then
                        return u12.Threads.Status(u89.Thread);
                    end;

                    u89:Stop();

                    return "timeout";
                end,

                Pause = function() -- Line: 398, Name: Pause
                    -- upvalues: u89 (ref), u12 (ref)
                    u89.R_Status = "Paused";
                    u89.Running = false;
                    u12.Threads.Pause(u89.Thread);
                    u89.Changed:Fire("Paused");
                end,

                Stop = function() -- Line: 399, Name: Stop
                    -- upvalues: u89 (ref), u12 (ref)
                    u89.R_Status = "Stopping";
                    u12.Threads.Stop(u89.Thread);
                    u89.Changed:Fire("Stopped");
                    u89.Remove();
                end,

                Kill = function() -- Line: 400, Name: Kill
                    -- upvalues: u89 (ref), u12 (ref)
                    u89.R_Status = "Killing";
                    u12.Threads.End(u89.Thread);
                    u89.Changed:Fire("Killed");
                    u89.Remove();
                end
            };

            function u89.Changed.Connect(p92, p93) -- Line: 403
                -- upvalues: u12 (ref), u88 (copy)
                return u12.Events[`{u88}_TASKCHANGED`]:Connect(p93);
            end;

            function u89.Changed.Fire(p94, ...) -- Line: 407
                -- upvalues: u12 (ref), u88 (copy)
                u12.Events[`{u88}_TASKCHANGED`]:Fire(...);
            end;

            function u89.Finished.Connect(p95, p96) -- Line: 411
                -- upvalues: u12 (ref), u88 (copy)
                return u12.Events[`{u88}_TASKFINISHED`]:Connect(p96);
            end;

            function u89.Finished.wait(p97) -- Line: 415
                -- upvalues: u12 (ref), u88 (copy)
                u12.Events[`{u88}_TASKFINISHED`]:wait(0);
            end;

            function u89.Finished.Fire(p98, ...) -- Line: 419
                -- upvalues: u12 (ref), u88 (copy)
                u12.Events[`{u88}_TASKFINISHED`]:Fire(...);
            end;

            u89.End = u89.Stop;
            u89.Kill = u89.Stop;
            l_table.insert(u12.Threads.Tasks, u89);
            u12.Threads.CheckTasks();

            return u89.Resume, u89;
        end,

        RunTask = function(p99, p100, ...) -- Line: 433, Name: RunTask
            -- upvalues: u12 (ref)
            local v101, v102 = u12.Threads.NewTask(p99, p100);

            return v102, v101(...);
        end,

        TimeoutRunTask = function(p103, p104, p105, ...) -- Line: 438, Name: TimeoutRunTask
            -- upvalues: u12 (ref)
            local v106, v107 = u12.Threads.NewTask(p103, p104, p105);

            return v107, v106(...);
        end,

        WaitTask = function(p108, p109, ...) -- Line: 443, Name: WaitTask
            -- upvalues: u12 (ref), l_unpack (copy)
            local v110, v111 = u12.Threads.NewTask(p108, p109);
            local v112 = { v110(...) };
            v111.Finished:wait();

            return v111, l_unpack(v112);
        end,

        NewEventTask = function(u113, u114, u115) -- Line: 450, Name: NewEventTask
            -- upvalues: u12 (ref)
            return function(...) -- Line: 452
                -- upvalues: u12 (ref), u113 (copy), u114 (copy), u115 (copy)
                return not u12.Running and function() -- Line: 456
                end or u12.Threads.NewTask(u113, u114, u115)(...);
            end;
        end,

        Stop = l_coroutine.yield,
        Wait = l_coroutine.yield,
        Pause = l_coroutine.yield,
        Yield = l_coroutine.yield,
        Status = l_coroutine.status,
        Running = l_coroutine.running,
        Create = l_coroutine.create,
        Start = l_coroutine.resume,
        Get = l_coroutine.running,

        New = function(p116) -- Line: 471, Name: New
            -- upvalues: l_coroutine (copy), u12 (ref), l_table (copy)
            local v117 = l_coroutine.create(p116);
            l_table.insert(u12.Threads.Threads, v117);

            return v117;
        end,

        End = function(p118) -- Line: 472, Name: End
            -- upvalues: u12 (ref)
            while p118 and u12.Threads.Status(p118) ~= "dead" do
                u12.Threads.Stop(p118);
                u12.Threads.Resume(p118);

                if not p118 or u12.Threads.Status(p118) == "dead" then
                    return;
                end;
            end;
        end,

        Wrap = function(p119, ...) -- Line: 473, Name: Wrap
            -- upvalues: u12 (ref)
            local v120 = u12.Threads.New(p119);
            u12.Threads.Resume(p119, ...);

            return v120;
        end,

        Resume = function(p121, ...) -- Line: 474, Name: Resume
            -- upvalues: l_coroutine (copy)
            if p121 and l_coroutine.status(p121) == "suspended" then
                return l_coroutine.resume(p121, ...);
            end;
        end,

        Remove = function(p122) -- Line: 475, Name: Remove
            -- upvalues: u12 (ref), l_table (copy)
            u12.Threads.Stop(p122);

            for i, v in u12.Threads.Threads do
                if v == p122 then
                    l_table.remove(u12.Threads.Threads, i);
                end;
            end;
        end,

        StopAll = function() -- Line: 476, Name: StopAll
            -- upvalues: u12 (ref), l_table (copy)
            for i, v in u12.Threads.Threads do
                u12.Threads.Stop(v);
                l_table.remove(u12.Threads.Threads, i);
            end;
        end,

        ResumeAll = function() -- Line: 476, Name: ResumeAll
            -- upvalues: u12 (ref)
            for _, v in u12.Threads.Threads do
                u12.Threads.Resume(v);
            end;
        end,

        GetAll = function() -- Line: 476, Name: GetAll
            -- upvalues: u12 (ref)
            return u12.Threads.Threads;
        end
    };
    local u159 = {
        WrapIgnore = function(p124) -- Line: 478, Name: WrapIgnore
            -- upvalues: l_setmetatable (copy)
            return l_setmetatable(p124, {
                __metatable = "Ignore"
            });
        end,

        CheckWrappers = function() -- Line: 479, Name: CheckWrappers
            -- upvalues: u29 (copy), u12 (ref)
            for i, _ in u29 do
                if u12.IsDestroyed(i) then
                    u29[i] = nil;
                end;
            end;
        end,

        Wrapped = function(p125) -- Line: 486, Name: Wrapped
            -- upvalues: l_getmetatable (copy)
            return l_getmetatable(p125) == "Adonis_Proxy";
        end,

        UnWrap = function(p126) -- Line: 489, Name: UnWrap
            -- upvalues: l_typeof (copy), u12 (ref)
            local v127 = l_typeof(p126);

            if v127 == "Instance" then
                return p126;
            end;

            if v127 ~= "table" then
                if u12.Wrapped(p126) then
                    return p126:GetObject();
                end;

                return p126;
            end;

            local UnWrap = u12.UnWrap;
            local v128 = {};

            for i, v in p126 do
                v128[i] = UnWrap(v);
            end;

            return v128;
        end,

        Wrap = function(u129, p130) -- Line: 507, Name: Wrap
            -- upvalues: l_getmetatable (copy), u29 (copy), l_type (copy), u12 (ref), l_setmetatable (copy), l_typeof (copy), l_newproxy (copy), u28 (copy), l_table (copy), l_unpack (copy), u7 (ref), l_tostring (copy)
            local v131 = p130;

            if not v131 then
                if p130 == nil then
                    v131 = client ~= nil;
                else
                    v131 = false;
                end;
            end;

            local u132 = v131;

            if l_getmetatable(u129) == "Ignore" or l_getmetatable(u129) == "ReadOnly_Table" then
                return u129;
            end;

            if u29[u129] then
                return u29[u129];
            end;

            if l_type(u129) == "table" then
                local Wrap = u12.Wrap;
                local v135 = l_setmetatable({}, {
                    __eq = function(p133, p134) -- Line: 516, Name: __eq
                        -- upvalues: u129 (copy)
                        return u129;
                    end
                });

                for i, v in u129 do
                    v135[i] = Wrap(v, u132);
                end;

                return v135;
            end;

            if l_typeof(u129) ~= "Instance" and (l_typeof(u129) ~= "RBXScriptSignal" and l_typeof(u129) ~= "RBXScriptConnection") or u12.Wrapped(u129) then
                return u129;
            end;

            local UnWrap = u12.UnWrap;
            local Wrap = u12.Wrap;
            local u137 = not u132 and function(...) -- Line: 533
                return ...;
            end or function(p136) -- Line: 535
                -- upvalues: Wrap (copy), u132 (ref)
                return Wrap(p136, u132);
            end;
            local u138 = l_newproxy(true);
            local u139 = l_getmetatable(u138);
            local u140 = nil;
            u140 = {
                GetMetatable = function() -- Line: 543, Name: GetMetatable
                    -- upvalues: u139 (copy)
                    return u139;
                end,

                AddToCache = function() -- Line: 547, Name: AddToCache
                    -- upvalues: u29 (ref), u129 (copy), u138 (copy)
                    u29[u129] = u138;
                end,

                RemoveFromCache = function() -- Line: 550, Name: RemoveFromCache
                    -- upvalues: u29 (ref), u129 (copy)
                    u29[u129] = nil;
                end,

                GetObject = function() -- Line: 554, Name: GetObject
                    -- upvalues: u129 (copy)
                    return u129;
                end,

                SetSpecial = function(p141, p142, p143) -- Line: 558, Name: SetSpecial
                    -- upvalues: u140 (ref)
                    u140[p142] = p143;

                    return u140;
                end,

                Clone = function(p144, p145) -- Line: 563, Name: Clone
                    -- upvalues: u129 (copy), u28 (ref), l_table (ref), Wrap (copy)
                    local v146 = u129:Clone();

                    if not p145 then
                        l_table.insert(u28, v146);
                    end;

                    return Wrap(v146);
                end,

                connect = function(p147, u148) -- Line: 571, Name: connect
                    -- upvalues: u137 (copy), u129 (copy), l_table (ref), Wrap (copy), l_unpack (ref)
                    return u137(u129:Connect(function(...) -- Line: 572
                        -- upvalues: l_table (ref), u148 (copy), Wrap (ref), l_unpack (ref)
                        local v149 = l_table.pack(...);

                        return u148(l_unpack(Wrap(v149), 1, v149.n));
                    end));
                end,

                wait = function(p150, ...) -- Line: 578, Name: wait
                    -- upvalues: u137 (copy), u129 (copy)
                    return u137(u129.wait)(u129, ...);
                end
            };
            u140.Connect = u140.connect;
            u140.Wait = u140.wait;

            function u139.__index(p151, u152) -- Line: 586
                -- upvalues: u140 (ref), u129 (copy), l_type (ref), l_table (ref), u137 (copy), u7 (ref), UnWrap (copy), l_unpack (ref)
                local v153 = u140[u152] or u129[u152];

                if u140[u152] then
                    return u140[u152];
                end;

                return l_type(v153) == "function" and function(p154, ...) -- Line: 592
                    -- upvalues: l_table (ref), u137 (ref), u7 (ref), u152 (copy), u129 (ref), UnWrap (ref), l_unpack (ref)
                    local v155 = l_table.pack(...);

                    return l_unpack(u137({ u7[u152](u129, l_unpack(UnWrap(v155), 1, v155.n)) }));
                end or u137(v153);
            end;

            function u139.__newindex(p156, p157, p158) -- Line: 603
                -- upvalues: u129 (copy), UnWrap (copy)
                u129[p157] = UnWrap(p158);
            end;

            u139.__eq = u12.RawEqual;

            function u139.__tostring() -- Line: 608
                -- upvalues: u140 (ref), u129 (copy), l_tostring (ref)
                return u140.ToString or l_tostring(u129);
            end;

            u139.__metatable = "Adonis_Proxy";
            u140:AddToCache();

            return u138;
        end
    };
    local u344 = {
        CloneTable = function(u160) -- Line: 622, Name: CloneTable
            -- upvalues: l_getmetatable (copy), l_setmetatable (copy)
            local v163 = l_getmetatable(u160) == nil and {} or (l_setmetatable({}, {
                __index = function(p161, p162) -- Line: 624, Name: __index
                    -- upvalues: u160 (copy)
                    return u160[p162];
                end
            }) or {});

            for i, v in u160 do
                v163[i] = v;
            end;

            return v163;
        end,

        DeepCopy = function(u164) -- Line: 634, Name: DeepCopy
            -- upvalues: l_getmetatable (copy), l_setmetatable (copy), l_typeof (copy), u12 (ref)
            local v167 = l_getmetatable(u164) == nil and {} or (l_setmetatable({}, {
                __index = function(p165, p166) -- Line: 636, Name: __index
                    -- upvalues: u164 (copy)
                    return u164[p166];
                end
            }) or {});

            for i, v in u164 do
                if l_typeof(v) == "table" then
                    v167[i] = u12.DeepCopy(v);
                else
                    v167[i] = v;
                end;
            end;

            return v167;
        end,

        IsLocked = function(u168) -- Line: 650, Name: IsLocked
            -- upvalues: l_pcall (copy)
            return not l_pcall(function() -- Line: 650
                -- upvalues: u168 (copy)
                u168.Name = u168.Name;

                return u168.Name;
            end);
        end,

        Timer = function(u169, u170, u171) -- Line: 652, Name: Timer
            -- upvalues: l_time (copy), u12 (ref)
            local u172 = l_time();
            local u173 = nil;
            u173 = u12.RunService.RenderStepped:Connect(function() -- Line: 654
                -- upvalues: l_time (ref), u172 (copy), u169 (copy), u171 (copy), u170 (copy), u173 (ref)
                if u169 < l_time() - u172 or u171 and u171() then
                    u170();
                    u173:Disconnect();
                end;
            end);
        end,

        AltUnpack = function(p174, p175) -- Line: 662, Name: AltUnpack
            if p175 then
                p175 = p175 - 1;
            end;

            return p174[1 + (p175 or 0)], p174[2 + (p175 or 0)], p174[3 + (p175 or 0)], p174[4 + (p175 or 0)], p174[5 + (p175 or 0)], p174[6 + (p175 or 0)], p174[7 + (p175 or 0)], p174[8 + (p175 or 0)], p174[9 + (p175 or 0)], p174[10 + (p175 or 0)];
        end,

        ExtractLines = function(p176) -- Line: 667, Name: ExtractLines
            -- upvalues: l_table (copy), l_string (copy)
            local v177 = l_table.create(#p176 + 1);
            local v178 = "";

            for i = 1, #p176 + 1 do
                local v179 = l_string.sub(p176, i, i);
                local v180;

                if l_string.byte(v179) == 10 or i == #p176 + 1 then
                    l_table.insert(v177, v178);
                    v180 = i;
                    v178 = "";
                else
                    local v181 = l_string.sub(p176, i, i);
                    v178 = v178 .. (l_string.byte(v181) < 32 and "" or v181);
                    v180 = i;
                end;
            end;

            return v177;
        end,

        Filter = function(p182, u183, u184) -- Line: 685, Name: Filter
            -- upvalues: u12 (ref), l_table (copy), l_pcall (copy)
            if not utf8.len(p182) then
                return "Filter Error";
            end;

            local u185 = u12.ExtractLines(p182);
            local v186 = l_table.create(#u185);

            for i = 1, #u185 do
                local v187, v188 = l_pcall(function() -- Line: 693
                    -- upvalues: u12 (ref), u185 (copy), i (copy), u183 (copy), u184 (copy)
                    return u12.TextService:FilterStringAsync(u185[i], u183.UserId):GetNonChatStringForUserAsync(u184.UserId);
                end);
                v186[i] = v187 and v188 and v188 or (u185[i] or "");
                local _ = i;
            end;

            return v186 and l_table.concat(v186, "\n") or "Filter Error";
        end,

        LaxFilter = function(p189, p190, p191) -- Line: 701, Name: LaxFilter
            -- upvalues: l_tonumber (copy), l_type (copy), u12 (ref)
            if l_tonumber(p189) then
                return p189;
            end;

            if l_type(p189) ~= "string" then
                return p189;
            end;

            if not utf8.len(p189) then
                return "Filter Error";
            end;

            if p191 and #u12.GetPlayers(p190, p189, {
                DontError = true
            }) > 0 then
                return p189;
            end;

            return u12.Filter(p189, p190, p190);
        end,

        BroadcastFilter = function(p192, u193) -- Line: 721, Name: BroadcastFilter
            -- upvalues: u12 (ref), l_pcall (copy)
            if not utf8.len(p192) then
                return "Filter Error";
            end;

            local u194 = u12.ExtractLines(p192);
            local v195 = "";

            for i = 1, #u194 do
                local v196, v197 = l_pcall(function() -- Line: 729
                    -- upvalues: u12 (ref), u194 (copy), i (copy), u193 (copy)
                    return u12.TextService:FilterStringAsync(u194[i], u193.UserId):GetNonChatStringForBroadcastAsync();
                end);
                local v198 = v196 and v197 and v197 or (u194[i] or "");
                local v199;

                if i > 1 then
                    v195 = `{v195}\n{v198}`;
                    v199 = i;
                else
                    v195 = v198;
                    v199 = i;
                end;
            end;

            return v195 or "Filter Error";
        end,

        EscapeSpecialCharacters = function(p200) -- Line: 740, Name: EscapeSpecialCharacters
            -- upvalues: l_string (copy)
            return l_string.gsub(p200, "([^%w])", "%%%1");
        end,

        MetaFunc = function(u201) -- Line: 744, Name: MetaFunc
            -- upvalues: u12 (ref), l_pcall (copy), l_warn (copy), l_unpack (copy)
            return u12.NewProxy({
                __call = function(p202, ...) -- Line: 746, Name: __call
                    -- upvalues: l_pcall (ref), u201 (copy), l_warn (ref), l_unpack (ref)
                    local v203 = { l_pcall(u201, ...) };

                    if v203[1] then
                        return l_unpack(v203, 2);
                    end;

                    l_warn(v203[2]);
                end
            });
        end,

        NewProxy = function(p204) -- Line: 758, Name: NewProxy
            -- upvalues: l_newproxy (copy), l_getmetatable (copy)
            local v205 = l_newproxy(true);
            local v206 = l_getmetatable(v205);
            v206.__metatable = false;

            for i, v in p204 do
                v206[i] = v;
            end;

            return v205;
        end,

        GetUserType = function(u207) -- Line: 766, Name: GetUserType
            -- upvalues: l_pcall (copy), l_math (copy), l_string (copy)
            local v208, v209 = l_pcall(function() -- Line: 767
                -- upvalues: u207 (copy), l_math (ref)
                local _ = u207[l_math.random()];
            end);

            return v208 and "Unknown" or l_string.match(v209, "%S+$");
        end,

        CountTable = function(p210) -- Line: 775, Name: CountTable
            local v211 = 0;

            for _ in p210 do
                v211 = v211 + 1;
            end;

            return v211;
        end,

        Debounce = function(p212, p213) -- Line: 781, Name: Debounce
            -- upvalues: l_getfenv (copy), u20 (copy), l_pcall (copy), l_error (copy)
            local v214 = l_getfenv(2);
            local v215 = v214 and v214._ADONIS_DEBOUNCES or (u20 or {});

            if v214 then
                v214._ADONIS_DEBOUNCES = v214 and (v214._ADONIS_DEBOUNCES or {}) or {};
            end;

            if v215[p212] then
                return false;
            end;

            v215[p212] = true;
            local v216, v217 = l_pcall(p213);
            v215[p212] = false;

            if not v216 then
                l_error(v217);
            end;
        end,

        Queue = function(p218, p219, p220, p221) -- Line: 801, Name: Queue
            -- upvalues: u21 (copy), l_os (copy), u12 (ref), l_table (copy), l_select (copy)
            if not u21[p218] then
                u21[p218] = {
                    Processing = false,
                    Functions = {}
                };
            end;

            local v222 = u21[p218];
            local v223 = {
                Running = false,
                Finished = false,
                Time = l_os.time(),
                Function = p219,
                Timeout = p220
            };
            local v224;

            if p221 then
                v224 = u12.Yield();
            else
                v224 = p221;
            end;

            v223.Yield = v224;
            l_table.insert(v222.Functions, v223);

            if not v222.Processing then
                u12.TrackTask(`Thread: QueueProcessor_{p218}`, u12.ProcessQueue, v222, p218);
            end;

            if p221 and not v223.Finished then
                return l_select(2, v223.Yield:Wait());
            end;
        end,

        ProcessQueue = function(p225, u226) -- Line: 831, Name: ProcessQueue
            -- upvalues: u12 (ref), l_table (copy), task_delay (copy), l_warn (copy), l_pcall (copy), u21 (copy)
            if p225 then
                if p225.Processing then
                    return "Processing";
                end;

                local Functions = p225.Functions;
                local u227 = u12.Yield();

                local function pop() -- Line: 838
                    -- upvalues: Functions (copy), l_table (ref)
                    local v228 = Functions[1];
                    l_table.remove(Functions, 1);

                    return v228;
                end;

                p225.Processing = true;

                while Functions[1] ~= nil do
                    local u229 = pop();
                    u229.Running = true;

                    if u229.Timeout then
                        task_delay(u229.Timeout, function() -- Line: 851
                            -- upvalues: u229 (copy), u227 (copy), l_warn (ref), u226 (copy)
                            if not u229.Finished then
                                u227:Release();
                                l_warn((`Queue Timeout Reached for {u226 or "Unknown"}`));

                                if u229.Yield then
                                    u229.Yield:Release(false, "Timeout Reached");
                                end;
                            end;
                        end);
                    end;

                    u12.TrackTask(`Thread: {u226 or "Unknown"}_QueuedFunction`, function() -- Line: 863
                        -- upvalues: l_pcall (ref), u229 (copy), l_warn (ref), u226 (copy), u227 (copy)
                        local v230, v231 = l_pcall(u229.Function);

                        if not v230 then
                            u229.Error = v231;
                            l_warn((`Queue Error: {u226}: {v231}`));
                        end;

                        u229.Running = false;
                        u229.Finished = true;

                        if u229.Yield then
                            u229.Yield:Release(v230, v231);
                        end;

                        u227:Release();
                    end);

                    if u229.Running then
                        u227:Wait();
                    end;
                end;

                u227:Destroy();
                p225.Processing = false;

                if u226 then
                    u21[u226] = nil;
                end;
            end;
        end,

        ProcessLoopQueue = function() -- Line: 896, Name: ProcessLoopQueue
            -- upvalues: u23 (copy), l_time (copy)
            for i, v in u23 do
                if not (v.LastRun and (not v.LastRun or l_time() - v.LastRun <= v.Delay)) then
                    if v.MaxRuns and (v.NumRuns and v.MaxRuns <= v.NumRuns) then
                        u23[i] = nil;
                    else
                        if v.MaxRuns and v.NumRuns then
                            v.NumRuns = v.NumRuns + 1;
                        end;

                        Pcall(v.Function);
                        v.LastRun = l_time();
                    end;
                end;
            end;
        end,

        QueueItem = function(p232, p233) -- Line: 912, Name: QueueItem
            -- upvalues: u23 (copy)
            if p233.MaxRuns then
                p233.NumRuns = 0;
            end;

            u23[p232] = p233;
        end,

        RemoveQueue = function(p234) -- Line: 920, Name: RemoveQueue
            -- upvalues: u23 (copy)
            u23[p234] = nil;
        end,

        New = function(p235, p236, p237, p238) -- Line: 924, Name: New
            -- upvalues: new (copy), u33 (copy), l_type (copy), u12 (ref), u28 (copy), l_table (copy)
            local v239 = p237 and new(p235) or u33.new(p235);

            if p236 then
                if l_type(p236) == "table" then
                    local Parent = p236.Parent;

                    if u12.Wrapped(Parent) then
                        Parent = Parent:GetObject();
                    end;

                    p236.Parent = nil;

                    for i, v in p236 do
                        v239[i] = v;
                    end;

                    if Parent then
                        v239.Parent = Parent;
                    end;
                elseif l_type(p236) == "userdata" then
                    if u12.Wrapped(p236) then
                        v239.Parent = p236:GetObject();
                    else
                        v239.Parent = p236;
                    end;
                end;
            end;

            if v239 and not p238 then
                l_table.insert(u28, v239);
            end;

            return v239;
        end,

        Iterate = function(p240, p241) -- Line: 955, Name: Iterate
            -- upvalues: l_type (copy), l_ipairs (copy), l_error (copy)
            if p240 and l_type(p240) == "table" then
                for i, v in p240 do
                    local v242 = p241(i, v);

                    if v242 ~= nil then
                        return v242;
                    end;
                end;

                return;
            end;

            if p240 and l_type(p240) == "userdata" then
                for i, child in l_ipairs(p240:GetChildren()) do
                    local v243 = p241(child, i);

                    if v243 ~= nil then
                        return v243;
                    end;
                end;

                return;
            end;

            l_error("Invalid table");
        end,

        EscapeControlCharacters = function(p244) -- Line: 975, Name: EscapeControlCharacters
            -- upvalues: l_string (copy)
            return l_string.gsub(p244, "%c", {
                ["\7"] = "\\a",
                ["\8"] = "\\b",
                ["\f"] = "\\f",
                ["\n"] = "\\n",
                ["\r"] = "\\r",
                ["\t"] = "\\t",
                ["\11"] = "\\v"
            });
        end,

        SanitizeXML = function(p245) -- Line: 987, Name: SanitizeXML
            -- upvalues: l_string (copy)
            return l_string.gsub(p245, "[\'\"<>&]", {
                ["\'"] = "&apos;",
                ["\""] = "&quot;",
                ["<"] = "&lt;",
                [">"] = "&gt;",
                ["&"] = "&amp;"
            });
        end,

        GetTime = l_os.time,

        FormatTime = function(p246, p247) -- Line: 999, Name: FormatTime
            -- upvalues: u12 (ref), l_pcall (copy)
            local v248 = p247 == true and {
                WithDate = true
            } or p247 or {};
            local u249 = v248.FormatString or (v248.WithWrittenDate and "LL HH:mm:ss" or (v248.WithDate and "L HH:mm:ss" or "HH:mm:ss"));
            local DateTime_fromUnixTimestamp_ret = DateTime.fromUnixTimestamp(p246 or u12.GetTime());

            if u12.RunService:IsServer() then
                return DateTime_fromUnixTimestamp_ret:FormatUniversalTime(u249, "en-us");
            end;

            local LocaleId = u12.Players.LocalPlayer.LocaleId;
            local v250, v251 = l_pcall(function() -- Line: 1014
                -- upvalues: DateTime_fromUnixTimestamp_ret (copy), u249 (ref), LocaleId (copy)
                return DateTime_fromUnixTimestamp_ret:FormatLocalTime(u249, LocaleId);
            end);

            return v250 and v251 and v251 or DateTime_fromUnixTimestamp_ret:FormatLocalTime(u249, "en-us");
        end,

        FormatPlayer = function(p252, p253) -- Line: 1021, Name: FormatPlayer
            -- upvalues: l_string (copy)
            if not p252 then
                return "%UNKNOWN%";
            end;

            if p252.Name == "[Unknown User]" then
                return `[Unknown User{(not p252.UserId or p252.UserId == -1) and "" or ` {p252.UserId}`}]`;
            end;

            local v254;

            if p252.DisplayName == p252.Name then
                v254 = `@{p252.Name}`;
            else
                v254 = l_string.format("%s (@%s)", p252.DisplayName or "???", p252.Name or "???");
            end;

            if p253 then
                v254 = v254 .. l_string.format(" [%s]", (not p252.UserId or p252.UserId == -1) and "?" or p252.UserId);
            end;

            return v254;
        end,

        FormatNumber = function(p255: number?, p256: boolean?, p257: string?) -- Line: 1033, Name: FormatNumber
            -- upvalues: l_tonumber (copy), l_math (copy), l_tostring (copy), l_unpack (copy), l_string (copy), u12 (ref)
            local v258 = l_tonumber(p255);
            local v259 = p257 or ",";

            if not v258 then
                return "NaN";
            end;

            if l_math.abs(v258) >= 1e150 then
                return "Inf";
            end;

            local v260, v261 = l_unpack(l_tostring((l_math.abs(v258))):split("."));

            if p256 and l_math.abs(v258) >= 1000 then
                local v262 = { "K", "M", "B", "T", "Qd", "Qi" };
                local v263 = l_math.floor((#v260 - 1) / 3);
                local v264 = v262[v263];

                if v264 then
                    return l_tonumber(l_string.format("%.2f", v258 / 10 ^ (v263 * 3))) .. v264;
                end;

                return u12.FormatNumber(v258 / 10 ^ (#v262 * 3), false, v259) .. v262[#v262];
            end;

            local v265 = v260:reverse();
            local v266 = 1;
            local v267 = "";

            for i = 1, #v265 do
                if v266 > 3 then
                    v267 = v267 .. v259;
                    v266 = 1;
                end;

                v267 = v267 .. v265:sub(i, i);
                v266 = v266 + 1;
                local _ = i;
            end;

            return `{v258 < 0 and "-" or ""}{v267:reverse()}{not v261 and "" or `.{v261}`}`;
        end,

        OwnsAsset = function(...) -- Line: 1069, Name: OwnsAsset
            -- upvalues: u12 (ref)
            return u12.CheckAssetOwnership(...);
        end,

        GetProductInfo = function(p268, p269) -- Line: 1073, Name: GetProductInfo
            -- upvalues: l_tonumber (copy), l_Enum (copy), u15 (copy), l_os (copy), l_pcall (copy), u12 (ref), l_type (copy)
            local v270 = l_tonumber(p268) or 0;
            local v271 = p269 or l_Enum.InfoType.Asset;

            if v270 > 0 then
                local v272 = u15[`{v270}-{v271}`];

                if not v272 then
                    v272 = {
                        results = {
                            Created = false
                        },
                        lastUpdated = l_os.clock()
                    };
                    u15[`{v270}-{v271}`] = v272;
                end;

                if not v272.lastUpdated or l_os.clock() - v272.lastUpdated > 120 then
                    local v273, v274 = l_pcall(u12.MarketplaceService.GetProductInfo, u12.MarketplaceService, v270, v271);

                    if v273 and l_type(v274) == "table" then
                        v274.Created = true;
                        v272.results = v274;
                    else
                        v272.results.Created = false;
                    end;
                end;

                return u12.CloneTable(v272.results);
            end;
        end,

        CheckPassOwnership = function(p275, p276) -- Line: 1107, Name: CheckPassOwnership
            -- upvalues: l_type (copy), l_tonumber (copy), u13 (copy), l_os (copy), l_pcall (copy), u12 (ref), u18 (copy)
            local u277;

            if l_type(p275) == "userdata" then
                u277 = p275.UserId;
            else
                u277 = l_tonumber(p275);
            end;

            local u278 = l_tonumber(p276);
            local v279 = `{u277}-{u278}`;
            local v280 = u13[v279];

            if v280 and v280.owned then
                return true;
            end;

            if not ((not v280 or l_os.time() - v280.lastUpdated <= 60) and v280) then
                local v281 = {
                    owned = v280 and v280.owned or false,
                    lastUpdated = l_os.time()
                };
                u13[v279] = v281;
                local v282, v283 = l_pcall(function() -- Line: 1123
                    -- upvalues: u12 (ref), u277 (ref), u278 (ref)
                    return u12.MarketplaceService:UserOwnsGamePassAsync(u277, u278);
                end);

                if not v282 then
                    return v281.owned;
                end;

                v281.owned = u18(v283);

                return u18(v283);
            end;

            if v280 then
                return v280.owned;
            end;
        end,

        CheckAssetOwnership = function(u284, u285) -- Line: 1138, Name: CheckAssetOwnership
            -- upvalues: l_type (copy), u12 (ref), u14 (copy), l_os (copy), u13 (copy), l_pcall (copy), u18 (copy)
            if l_type(u284) == "number" then
                u284 = u12.Players:GetPlayerByUserId(u284);
            end;

            local v286 = `{u284.UserId}-{u285}`;
            local v287 = u14[v286];

            if v287 and v287.owned then
                return true;
            end;

            if not ((not v287 or l_os.time() - v287.lastUpdated <= 60) and v287) then
                local v288 = {
                    owned = v287 and v287.owned or false,
                    lastUpdated = l_os.time()
                };
                u13[v286] = v288;
                local v289, v290 = l_pcall(function() -- Line: 1155
                    -- upvalues: u12 (ref), u284 (ref), u285 (copy)
                    return u12.MarketplaceService:PlayerOwnsAsset(u284, u285);
                end);

                if v289 then
                    v288.owned = u18(v290);
                end;

                return v288.owned;
            end;

            if v287 then
                return v287.owned;
            end;
        end,

        GetGroupInfo = function(p291) -- Line: 1169, Name: GetGroupInfo
            -- upvalues: l_tonumber (copy), u16 (copy), l_os (copy), l_pcall (copy), u12 (ref), l_type (copy)
            local v292 = l_tonumber(p291) or 0;

            if v292 > 0 then
                local v293 = u16[v292];

                if not v293 or l_os.time() - v293.lastUpdated > 120 then
                    v293 = {
                        results = v293 and v293.results or {},
                        lastUpdated = l_os.time()
                    };
                    u16[v292] = v293;
                    local v294, v295 = l_pcall(u12.GroupService.GetGroupInfoAsync, u12.GroupService, v292);

                    if v294 and l_type(v295) == "table" then
                        v293.results = v295;
                    else
                        v293.results.Failed = true;
                    end;
                end;

                return u12.CloneTable(v293.results);
            end;
        end,

        GetGroupCreatorId = function(p296) -- Line: 1196, Name: GetGroupCreatorId
            -- upvalues: l_tonumber (copy), u12 (ref)
            local v297 = l_tonumber(p296) or 0;

            if v297 > 0 then
                local GroupInfo = u12.GetGroupInfo(v297);

                if GroupInfo and GroupInfo.Owner then
                    return GroupInfo.Owner.Id;
                end;
            end;

            return 0;
        end,

        MaxLen = function(p298, p299) -- Line: 1210, Name: MaxLen
            -- upvalues: l_string (copy)
            if p299 < l_string.len(p298) then
                return `{l_string.sub(p298, 1, p299)}...`;
            end;

            return p298;
        end,

        Yield = function() -- Line: 1218, Name: Yield
            -- upvalues: u12 (ref)
            local u300 = u12.New("BindableEvent");

            return {
                Release = function(...) -- Line: 1221, Name: Release
                    -- upvalues: u300 (copy)
                    u300:Fire(...);
                end,

                Wait = function(...) -- Line: 1222, Name: Wait
                    -- upvalues: u300 (copy)
                    return u300.Event:Wait(...);
                end,

                Destroy = function() -- Line: 1223, Name: Destroy
                    -- upvalues: u300 (copy)
                    u300:Destroy();
                end,

                Event = u300
            };
        end,

        StartLoop = function(p301, u302, u303, p304) -- Line: 1228, Name: StartLoop
            -- upvalues: u1 (ref), u25 (copy), l_tonumber (copy), task_wait (copy), u12 (ref)
            local u305 = {
                Running = true,
                Name = p301,
                Delay = u302,
                Function = u303
            };
            local u306 = `{p301} - {u1.Functions:GetRandom()}`;

            local function kill() -- Line: 1238
                -- upvalues: u305 (copy), u25 (ref), u306 (copy)
                u305.Running = true;

                if u25[u306] == u305 then
                    u25[u306] = nil;
                end;
            end;

            local function loop() -- Line: 1245
                -- upvalues: u302 (copy), l_tonumber (ref), u303 (copy), task_wait (ref), u25 (ref), u306 (copy), u305 (copy), kill (copy), u12 (ref)
                if l_tonumber(u302) then
                    repeat
                        u303();
                        task_wait((l_tonumber(u302)));
                    until u25[u306] ~= u305 or not u305.Running;

                    kill();

                    return;
                end;

                if u302 == "Heartbeat" then
                    repeat
                        u303();
                        u12.RunService.Heartbeat:wait();
                    until u25[u306] ~= u305 or not u305.Running;

                    kill();

                    return;
                end;

                if u302 == "RenderStepped" then
                    repeat
                        u303();
                        u12.RunService.RenderStepped:wait();
                    until u25[u306] ~= u305 or not u305.Running;

                    kill();

                    return;
                end;

                if u302 ~= "Stepped" then
                    u305.Running = false;

                    return;
                end;

                repeat
                    u303();
                    u12.RunService.Stepped:wait();
                until u25[u306] ~= u305 or not u305.Running;

                kill();
            end;

            u305.Kill = kill;
            u25[u306] = u305;

            if p304 then
                u12.TrackTask(`Thread: Loop: {p301}`, loop);

                return u305;
            end;

            u12.TrackTask(`Loop: {p301}`, loop);

            return u305;
        end,

        StopLoop = function(p307) -- Line: 1300, Name: StopLoop
            -- upvalues: u25 (copy)
            for _, v in u25 do
                if p307 == v.Function or p307 == v.Name then
                    v.Running = false;
                end;
            end;
        end,

        Immutable = function(...) -- Line: 1307, Name: Immutable
            -- upvalues: l_coroutine (copy)
            local v308 = l_coroutine.wrap(function(...) -- Line: 1308
                -- upvalues: l_coroutine (ref)
                while true do
                    l_coroutine.yield(...);
                end;
            end);
            v308(...);

            return v308;
        end,

        ReadOnly = function(u309, u310, u311, u312) -- Line: 1312, Name: ReadOnly
            -- upvalues: u12 (ref), l_getfenv (copy), l_getmetatable (copy), l_pcall (copy), l_coroutine (copy), l_type (copy), l_typeof (copy), u2 (ref), l_warn (copy), l_rawset (copy)
            local u313 = not u312 and u12.RunService:IsClient();
            local v314;

            if u313 then
                v314 = u12.Players.LocalPlayer;
            else
                v314 = u313;
            end;

            if v314 then
                local _ = v314.Kick;
            end;

            local settings = l_getfenv().settings;
            local u315 = l_getmetatable;
            local u316 = l_getfenv;
            local u317 = l_pcall;
            local _ = l_coroutine.resume;
            local _ = l_coroutine.create;
            local u318;

            if u313 then
                u318 = u315(u316());
            else
                u318 = u313;
            end;

            return u12.NewProxy({
                __metatable = "ReadOnly_Table",

                __index = function(p319, p320) -- Line: 1331, Name: __index
                    -- upvalues: l_type (ref), l_typeof (ref), u313 (copy), u316 (copy), l_pcall (ref), settings (copy), l_getfenv (ref), u315 (copy), l_getmetatable (ref), u317 (copy), u318 (copy), u2 (ref), u309 (copy), u310 (copy), u12 (ref), u311 (copy), u312 (copy)
                    local v321 = (l_type(p320) == "table" or (l_typeof(p320) == "userdata" or not p320)) and "Potentially dangerous index" or p320;
                    local v322 = u313 and u316 and u316(2);
                    local v323 = u313 and l_pcall(settings);

                    if not (u313 and (v323 or (u316 ~= l_getfenv or (u315 ~= l_getmetatable or (u317 ~= l_pcall or not (v322 and (l_type(v322) == "table" and u315(v322) == u318))))))) then
                        if u309[v321] == nil or (l_type(u309[v321]) ~= "table" or u310 and (u310[v321] or u310[u309[v321]])) then
                            return u309[v321];
                        end;

                        return u12.ReadOnly(u309[v321], u310, u311, u312);
                    end;

                    local v324;

                    if v322 then
                        v324 = u315(v322);
                    else
                        v324 = v322;
                    end;

                    u2("ReadError", "Tampering with Client [read rt0001]", (`[{v321} {v322} {v324}]\n{debug.traceback()}`));
                end,

                __newindex = function(p325, p326, p327) -- Line: 1347, Name: __newindex
                    -- upvalues: l_type (ref), l_typeof (ref), u313 (copy), u316 (copy), l_pcall (ref), settings (copy), l_getfenv (ref), u315 (copy), l_getmetatable (ref), u317 (copy), u318 (copy), u2 (ref), u310 (copy), u309 (copy), u311 (copy), l_warn (ref), l_rawset (ref)
                    local v328 = (l_type(p326) == "table" or (l_typeof(p326) == "userdata" or not p326)) and "Potentially dangerous index" or p326;
                    local v329 = u313 and u316 and u316(2);
                    local v330 = u313 and l_pcall(settings);

                    if not (u313 and (v330 or (u316 ~= l_getfenv or (u315 ~= l_getmetatable or (u317 ~= l_pcall or not (v329 and (l_type(v329) == "table" and u315(v329) == u318))))))) then
                        if u310 and (u310[v328] or u310[u309[v328]]) then
                            l_rawset(u309, v328, p327);

                            return;
                        end;

                        if u311 then
                            local v331;

                            if v329 then
                                v331 = u315(v329);
                            else
                                v331 = v329;
                            end;

                            u2("ReadError", "Tampering with Client [write wt0005]", (`[{v328} {v329} {v331}]\n{debug.traceback()}`));
                        end;

                        l_warn((`Something attempted to set index {v328} in a read-only table.`));

                        return;
                    end;

                    local v332;

                    if v329 then
                        v332 = u315(v329);
                    else
                        v332 = v329;
                    end;

                    u2("ReadError", "Tampering with Client [write wt0003]", (`[{v328} {v329} {v332}]\n{debug.traceback()}`));
                end
            });
        end,

        Wait = function(p333) -- Line: 1370, Name: Wait
            -- upvalues: u12 (ref), l_tonumber (copy), task_wait (copy)
            if not p333 or p333 == "Stepped" then
                u12.RunService.Stepped:wait();

                return;
            end;

            if p333 == "Heartbeat" then
                u12.RunService.Heartbeat:wait();

                return;
            end;

            if p333 and l_tonumber(p333) then
                task_wait((l_tonumber(p333)));
            end;
        end,

        OrigRawEqual = l_rawequal,

        HasItem = function(u334, u335) -- Line: 1380, Name: HasItem
            -- upvalues: l_pcall (copy)
            return l_pcall(function() -- Line: 1380
                -- upvalues: u334 (copy), u335 (copy)
                return u334[u335];
            end);
        end,

        IsDestroyed = function(u336) -- Line: 1381, Name: IsDestroyed
            -- upvalues: l_type (copy), u12 (ref), l_pcall (copy), l_game (copy), l_string (copy)
            if l_type(u336) == "userdata" and (u12.HasItem(u336, "Parent") and u336.Parent == nil) then
                local v337, v338 = l_pcall(function() -- Line: 1384
                    -- upvalues: u336 (copy), l_game (ref)
                    u336.Parent = l_game;
                    u336.Parent = nil;
                end);

                if not v337 then
                    return v338 and l_string.match(v338, "^The Parent property of (.*) is locked, current parent: NULL,") and true or false;
                end;
            end;

            return false;
        end,

        Insert = function(p339, p340) -- Line: 1396, Name: Insert
            -- upvalues: u12 (ref)
            local v341 = u12.InsertService:LoadAsset(p339);

            if p340 or (not v341:IsA("Model") or v341.Name ~= "Model") then
                return v341;
            end;

            local v342 = v341:GetChildren()[1];
            v342.Parent = v341.Parent;
            v341:Destroy();

            return v342;
        end,

        GetPlayers = function() -- Line: 1406, Name: GetPlayers
            -- upvalues: u12 (ref)
            return u12.Players:GetPlayers();
        end,

        IsAdonisObject = function(p343) -- Line: 1407, Name: IsAdonisObject
            -- upvalues: u28 (copy)
            for _, v in u28 do
                if v == p343 then
                    return true;
                end;
            end;
        end,

        GetAdonisObjects = function() -- Line: 1408, Name: GetAdonisObjects
            -- upvalues: u28 (copy)
            return u28;
        end
    };
    u12 = l_setmetatable({
        Running = true,

        Variables = function() -- Line: 1412, Name: Variables
            -- upvalues: u27 (copy)
            return u27;
        end,

        Routine = Routine2,
        Pcall = Pcall,
        cPcall = cPcall,
        Threads = v123,
        DataModel = l_game,
        WrapService = Folder,
        EventService = Folder4,
        ThreadService = Folder2,
        HelperService = Folder3,
        MarketPlace = l_game:GetService("MarketplaceService"),
        GamepassService = l_game:GetService("GamePassService"),
        ChatService = l_game:GetService("Chat"),
        Gamepasses = l_game:GetService("GamePassService"),

        Delete = function(p345, p346) -- Line: 1427, Name: Delete
            -- upvalues: l_game (copy), l_pcall (copy)
            l_game:GetService("Debris"):AddItem(p345, p346 or 0);
            l_pcall(p345.Destroy, p345);
        end,

        RbxEvent = function(p347, p348) -- Line: 1428, Name: RbxEvent
            -- upvalues: u22 (copy), l_table (copy)
            local v349 = p347:Connect(p348);
            l_table.insert(u22, v349);

            return v349;
        end,

        SelfEvent = function(p350, u351) -- Line: 1429, Name: SelfEvent
            -- upvalues: u12 (ref)
            u12.RbxEvent(p350, function(...) -- Line: 1429
                -- upvalues: u351 (copy)
                u351(...);
            end);
        end,

        DelRbxEvent = function(p352) -- Line: 1430, Name: DelRbxEvent
            -- upvalues: u22 (copy), l_table (copy)
            for i, v in u22 do
                if v == p352 then
                    v:Disconnect();
                    l_table.remove(u22, i);
                end;
            end;
        end,

        SanitizeString = function(p353) -- Line: 1431, Name: SanitizeString
            -- upvalues: u12 (ref), l_string (copy)
            local v354 = u12.Trim(p353);
            local v355 = "";

            for i = 1, #v354 do
                local v356;

                if l_string.sub(v354, i, i) == "\n" or l_string.sub(v354, i, i) == "\0" then
                    v356 = i;
                else
                    v355 = v355 .. l_string.sub(v354, i, i);
                    v356 = i;
                end;
            end;

            return v355;
        end,

        Trim = function(p357) -- Line: 1432, Name: Trim
            -- upvalues: l_string (copy)
            return l_string.match(p357, "^%s*(.-)%s*$");
        end,

        Localize = function(p358, p359) -- Line: 1433, Name: Localize
            -- upvalues: u12 (ref), l_type (copy)
            local Localize = u12.Localize;
            local ReadOnly = u12.ReadOnly;

            if l_type(p358) ~= "table" then
                return p358;
            end;

            local v360 = {};

            for i in p358 do
                v360[i] = Localize(p358[i], p359);
            end;

            if p359 then
                v360 = ReadOnly(v360) or v360;
            end;

            return v360;
        end,

        RawEqual = function(p361, p362) -- Line: 1434, Name: RawEqual
            -- upvalues: u12 (ref)
            return u12.UnWrap(p361) == u12.UnWrap(p362);
        end,

        CheckProperty = function(u363, u364) -- Line: 1435, Name: CheckProperty
            -- upvalues: l_pcall (copy)
            return l_pcall(function() -- Line: 1435
                -- upvalues: u363 (copy), u364 (copy)
                return u363[u364];
            end);
        end,

        NewWaiter = function() -- Line: 1436, Name: NewWaiter
            -- upvalues: u12 (ref)
            local v365 = u12.New("BindableEvent");

            return {
                Wait = v365.wait,
                Finish = v365.Fire
            };
        end
    }, {
        __tostring = "Service",
        __metatable = "Service",

        __index = function(p366, u367) -- Line: 1438, Name: __index
            -- upvalues: u10 (copy), u159 (copy), u83 (copy), u344 (copy), l_pcall (copy), l_game (copy), u12 (ref)
            local v368 = u10 and u10[u367] or u159[u367] or (u83[u367] or u344[u367]);

            if v368 then
                return v368;
            end;

            local v369, v370 = l_pcall(function() -- Line: 1444
                -- upvalues: l_game (ref), u367 (copy), u12 (ref)
                local Service = l_game:GetService(u367);

                if client ~= nil then
                    Service = u12.Wrap(Service, true) or Service;
                end;

                return Service;
            end);

            if v369 and v370 then
                u12[u367] = v370;

                return v370;
            end;
        end
    });
    local v371 = u159.Wrap(Folder);
    local v372 = u159.Wrap(Folder3);
    local v373 = u159.Wrap(Folder2);
    local v374 = u159.Wrap(Folder4);
    u12.WrapService = v371;
    u12.HelperService = v372;
    u12.ThreadService = v373;
    u12.EventService = v374;

    if client ~= nil then
        for i, v in u12 do
            if l_type(v) == "userdata" then
                u12[i] = u12.Wrap(v, true);
            end;
        end;
    end;

    for i, v in u159 do
        if l_type(v) == "function" then
            v371:SetSpecial(i, function(p375, ...) -- Line: 1479
                -- upvalues: v (copy)
                return v(...);
            end);
        else
            v371:SetSpecial(i, v);
        end;
    end;

    for i, v in u344 do
        if l_type(v) == "function" then
            v372:SetSpecial(i, function(p376, ...) -- Line: 1487
                -- upvalues: v (copy)
                return v(...);
            end);
        else
            v372:SetSpecial(i, v);
        end;
    end;

    for i, v in v123 do
        if l_type(v) == "function" then
            v373:SetSpecial(i, function(p377, ...) -- Line: 1495
                -- upvalues: v (copy)
                return v(...);
            end);
        else
            v373:SetSpecial(i, v);
        end;
    end;

    for i, v in u83 do
        if l_type(v) == "function" then
            v374:SetSpecial(i, function(p378, ...) -- Line: 1503
                -- upvalues: v (copy)
                return v(...);
            end);
        else
            v374:SetSpecial(i, v);
        end;
    end;

    for i, v in {
        WrapService = v371,
        EventService = v374,
        ThreadService = v373,
        HelperService = v372
    } do
        v:SetSpecial("ClassName", i);
        v:SetSpecial("ToString", i);
        v:SetSpecial("IsA", function(p379, p380) -- Line: 1512
            -- upvalues: i (copy)
            return p380 == i;
        end);
    end;

    return u12;
end;
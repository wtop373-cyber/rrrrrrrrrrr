-- ============================================================
-- SCRIPT: Process
-- CLASS:  ModuleScript
-- PATH:   .Core.Process
-- ============================================================

-- Decompiled with Potassium's decompiler.

client = nil;
service = nil;
cPcall = nil;
Pcall = nil;
Routine = nil;
GetEnv = nil;
origEnv = nil;
logError = nil;
log = nil;

return function(p1, p2) -- Line: 12
    local v3 = p2(nil, {
        script = script
    });
    setfenv(1, v3);
    local _ = _G;
    local _ = game;
    local l_script = script;
    local l_getfenv = getfenv;
    local _ = setfenv;
    local _ = workspace;
    local _ = getmetatable;
    local _ = setmetatable;
    local _ = loadstring;
    local _ = coroutine;
    local _ = rawequal;
    local _ = typeof;
    local _ = print;
    local _ = math;
    local _ = warn;
    local _ = error;
    local l_pcall = pcall;
    local _ = xpcall;
    local _ = select;
    local _ = rawset;
    local _ = rawget;
    local _ = ipairs;
    local _ = pairs;
    local _ = next;
    local _ = Rect;
    local _ = Axes;
    local _ = os;
    local _ = time;
    local _ = Faces;
    local l_unpack = unpack;
    local l_string = string;
    local _ = Color3;
    local _ = newproxy;
    local _ = tostring;
    local _ = tonumber;
    local _ = Instance;
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
    local _ = table;
    local l_type = type;
    local _ = wait;
    local l_Enum = Enum;
    local _ = UDim;
    local _ = UDim2;
    local _ = Vector2;
    local _ = Vector3;
    local _ = Region3;
    local _ = CFrame;
    local _ = Ray;
    local _ = delay;
    local Service = p1.Service;
    local Client = p1.Client;
    local u4 = nil;
    local u5 = nil;
    local u6 = nil;
    local u7 = nil;
    local u8 = nil;
    local u9 = nil;
    local u10 = nil;

    local function Init() -- Line: 41
        -- upvalues: u9 (ref), Client (copy), u4 (ref), u5 (ref), u10 (ref), u6 (ref), u7 (ref), u8 (ref)
        u9 = Client.UI;
        u4 = Client.Anti;
        u5 = Client.Core;
        u10 = Client.Variables;
        u6 = Client.Functions;
        u7 = Client.Process;
        u8 = Client.Remote;
        u7.Init = nil;
    end;

    local function RunLast() -- Line: 53
        -- upvalues: u7 (ref)
        u7.RunLast = nil;
    end;

    local function RunAfterLoaded(p11) -- Line: 88
        -- upvalues: Service (copy), u7 (ref), u8 (ref)
        Service.Player.Chatted:Connect(Service.EventTask("Event: ProcessChat", u7.Chat));
        Service.Player.CharacterRemoving:Connect(Service.EventTask("Event: CharacterRemoving", u7.CharacterRemoving));
        Service.Player.CharacterAdded:Connect(Service.Threads.NewEventTask("Event: CharacterAdded", u7.CharacterAdded));
        Service.LogService.MessageOut:Connect(u7.LogService);
        Service.ScriptContext.Error:Connect(u7.ErrorMessage);
        u7.RateLimits = u8.Get("RateLimits") or u7.RateLimits;
        u7.RunAfterLoaded = nil;
    end;

    l_getfenv().client = nil;
    l_getfenv().service = nil;
    l_getfenv().script = nil;
    Client.Process = {
        Init = Init,
        RunLast = RunLast,
        RunAfterLoaded = RunAfterLoaded,
        RateLimits = {
            Remote = 0.02,
            Command = 0.1,
            Chat = 0.1,
            RateLog = 10
        },

        Remote = function(p12, p13, ...) -- Line: 119, Name: Remote
            -- upvalues: u8 (ref), l_type (copy), Client (copy), u5 (ref), Service (copy), l_unpack (copy)
            local v14 = { ... };
            local v15 = u8;
            v15.Received = v15.Received + 1;

            if l_type(p13) == "string" then
                if p13 == `{Client.DepsName}GIVE_KEY` then
                    if not u5.Key then
                        log("~! Set remote key");
                        u5.Key = v14[1];
                        log("~! Call Finish_Loading()");
                        Client.Finish_Loading();
                    end;
                elseif u5.Key then
                    local v16 = u8.Decrypt(p13, u5.Key);
                    local v17 = p12.Mode == "Get" and u8.Returnables[v16] or u8.Commands[v16];

                    if v17 then
                        local v18 = { Service.TrackTask(`Remote: {v16}`, v17, v14) };

                        if v18[1] then
                            return { l_unpack(v18, 2) };
                        end;

                        logError(v18[2]);
                    end;
                end;
            end;
        end,

        LogService = function(p19, p20) -- Line: 147, Name: LogService
        end,

        ErrorMessage = function(p21, p22, p23) -- Line: 151, Name: ErrorMessage
            -- upvalues: l_string (copy), l_script (copy)
            if p21 and (p21 ~= "nil" and (p21 ~= "" and (l_string.find(p21, ":: Adonis ::") or (l_string.find(p21, l_script.Name) or p23 == l_script)))) then
                logError((`{p21} - {p22}`));
            end;
        end,

        Chat = function(p24) -- Line: 162, Name: Chat
            -- upvalues: Service (copy), u8 (ref)
            if not Service.Player or Service.Player.Parent ~= Service.Players then
                u8.Fire("ProcessChat", p24);
            end;
        end,

        CharacterAdded = function(...) -- Line: 169, Name: CharacterAdded
            -- upvalues: Service (copy), u9 (ref)
            Service.Events.CharacterAdded:Fire(...);
            task.wait();
            u9.GetHolder();
        end,

        CharacterRemoving = function() -- Line: 176, Name: CharacterRemoving
            -- upvalues: u10 (ref), Client (copy), l_pcall (copy), Service (copy), l_Enum (copy)
            if u10.UIKeepAlive then
                for _, v in Client.GUIs do
                    if v.Class == "ScreenGui" or (v.Class == "GuiMain" or v.Class == "TextLabel") then
                        if (not v.Object:IsA("ScreenGui") or v.Object.ResetOnSpawn) and v.CanKeepAlive then
                            v.KeepAlive = true;
                            v.KeepParent = v.Object.Parent;
                            v.Object.Parent = nil;
                        elseif not v.CanKeepAlive then
                            l_pcall(v.Destroy, v);
                        end;
                    end;
                end;
            end;

            if u10.GuiViewFolder then
                u10.GuiViewFolder:Destroy();
                u10.GuiViewFolder = nil;
            end;

            if u10.ChatEnabled then
                Service.StarterGui:SetCoreGuiEnabled(l_Enum.CoreGuiType.Chat, true);
            end;

            if u10.PlayerListEnabled then
                Service.StarterGui:SetCoreGuiEnabled(l_Enum.CoreGuiType.PlayerList, true);
            end;

            local FocusedTextBox = Service.UserInputService:GetFocusedTextBox();

            if FocusedTextBox then
                FocusedTextBox:ReleaseFocus();
            end;

            Service.Events.CharacterRemoving:Fire();
        end
    };
    task.delay(0, function() -- Line: 213
        -- upvalues: u9 (ref)
        u9.GetHolder();
    end);
end;
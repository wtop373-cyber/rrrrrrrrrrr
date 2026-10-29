-- ============================================================
-- SCRIPT: 
















































ModuleScript
-- CLASS:  ModuleScript
-- PATH:   
















































ModuleScript
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
script.Archivable = false;
task.spawn(function() -- Line: 6
    if not game:GetService("RunService"):IsStudio() then
        script.Name = "\n\n\n\n\n\n\n\nModuleScript";
    end;
end);
GetEnv = nil;

return function(p2) -- Line: 14
    local Client = p2.Client;
    local Service = p2.Service;
    local v3 = GetEnv(nil, {
        script = script
    });
    setfenv(1, v3);
    local _ = _G;
    local l_game = game;
    local l_script = script;
    local l_getfenv = getfenv;
    local _ = setfenv;
    local l_workspace = workspace;
    local l_getmetatable = getmetatable;
    local l_setmetatable = setmetatable;
    local l_loadstring = loadstring;
    local _ = coroutine;
    local l_rawequal = rawequal;
    local l_typeof = typeof;
    local _ = print;
    local l_math = math;
    local l_warn = warn;
    local _ = error;
    local l_pcall = pcall;
    local l_xpcall = xpcall;
    local _ = rawset;
    local l_rawget = rawget;
    local l_ipairs = ipairs;
    local l_pairs = pairs;
    local _ = next;
    local _ = Rect;
    local _ = Axes;
    local l_os = os;
    local l_time = time;
    local _ = Faces;
    local _ = unpack;
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
    local l_wait = wait;
    local l_Enum = Enum;
    local _ = UDim;
    local _ = UDim2;
    local _ = Vector2;
    local _ = Vector3;
    local _ = Region3;
    local _ = CFrame;
    local _ = Ray;
    local _ = delay;
    local _ = Client.Core;
    local _ = Client.Remote;
    local _ = Client.Functions;
    local Disconnect = Client.Disconnect;
    local _ = Client.Remote.Send;
    local _ = Client.Remote.Get;
    local _ = Service.NetworkClient;
    local Kill = Client.Kill;
    local LocalPlayer = Service.Players.LocalPlayer;
    local u4 = select(2, l_pcall(Service.RunService.IsStudio, Service.RunService));
    local Kick = LocalPlayer.Kick;
    local _ = Client.UI;
    local Anti = Client.Anti;
    local Variables = Client.Variables;
    local _ = Client.Process;
    local Detected = Anti.Detected;
    l_getfenv().client = nil;
    l_getfenv().service = nil;
    l_getfenv().script = nil;
    l_script.Parent = nil;

    local function u10(p5, p6) -- Line: 64
        -- upvalues: Service (copy), l_pairs (copy), l_type (copy), u10 (ref), l_rawequal (copy)
        if Service.CountTable(p5) ~= Service.CountTable(p6) then
            return false;
        end;

        for i, _ in l_pairs(p5) do
            local v7 = p5[i];
            local v8 = p6[i];
            local v9 = l_type(v7) == "table";

            if not ((not v9 or u10(v7, v8)) and (v9 or l_rawequal(v7, v8))) then
                return false;
            end;
        end;

        return true;
    end;

    local v11 = l_getmetatable((l_newproxy(true)));

    function v11.__index() -- Line: 86
        -- upvalues: Detected (copy)
        Detected("kick", "Proxy methamethod 0x215F");

        return task.wait(200);
    end;

    function v11.__newindex() -- Line: 92
        -- upvalues: Detected (copy)
        Detected("kick", "Proxy methamethod 0x86F1");

        return task.wait(200);
    end;

    function v11.__tostring() -- Line: 98
        -- upvalues: Detected (copy)
        Detected("kick", "Proxy methamethod 0xC0BD0");

        return task.wait(200);
    end;

    function v11.__unm() -- Line: 104
        -- upvalues: Detected (copy)
        Detected("kick", "Proxy methamethod 0x10F00");

        return task.wait(200);
    end;

    function v11.__add() -- Line: 110
        -- upvalues: Detected (copy)
        Detected("kick", "Proxy methamethod 0x60DC3");

        return task.wait(200);
    end;

    function v11.__sub() -- Line: 116
        -- upvalues: Detected (copy)
        Detected("kick", "Proxy methamethod 0x90F5D");

        return task.wait(200);
    end;

    function v11.__mul() -- Line: 122
        -- upvalues: Detected (copy)
        Detected("kick", "Proxy methamethod 0x19999");

        return task.wait(200);
    end;

    function v11.__div() -- Line: 128
        -- upvalues: Detected (copy)
        Detected("kick", "Proxy methamethod 0x1D14AC");

        return task.wait(200);
    end;

    function v11.__mod() -- Line: 134
        -- upvalues: Detected (copy)
        Detected("kick", "Proxy methamethod 0x786C64");

        return task.wait(200);
    end;

    function v11.__pow() -- Line: 140
        -- upvalues: Detected (copy)
        Detected("kick", "Proxy methamethod 0x1D948C");

        return task.wait(200);
    end;

    function v11.__len() -- Line: 146
        -- upvalues: Detected (copy)
        Detected("kick", "Proxy methamethod 0xBE931");

        return task.wait(200);
    end;

    v11.__metatable = "The metatable is locked";

    for i, v in l_pairs({
        Speed = function(u12) -- Line: 156, Name: Speed
            -- upvalues: Service (copy), l_workspace (copy), l_tonumber (copy), Detected (copy)
            Service.StartLoop("AntiSpeed", 1, function() -- Line: 157
                -- upvalues: l_workspace (ref), u12 (copy), l_tonumber (ref), Detected (ref)
                if l_workspace:GetRealPhysicsFPS() > l_tonumber(u12.Speed) then
                    Detected("kill", "Speed exploiting");
                end;
            end);
        end,

        AntiAntiIdle = function(p13) -- Line: 164, Name: AntiAntiIdle
            -- upvalues: Detected (copy), l_tostring (copy), l_wait (copy), l_pcall (copy), Disconnect (copy), Kill (copy), Kick (copy), LocalPlayer (copy), u4 (copy), l_game (copy), Service (copy), l_type (copy), l_math (copy), l_typeof (copy), l_rawequal (copy)
            local u14 = false;

            local function idleTamper(p15) -- Line: 166
                -- upvalues: u14 (ref), Detected (ref), l_tostring (ref), l_wait (ref), l_pcall (ref), Disconnect (ref), Kill (ref), Kick (ref), LocalPlayer (ref)
                if u14 then
                    return;
                end;

                u14 = true;
                Detected("crash", "Tamper Protection 0xC0FA6; " .. l_tostring(p15) .. "; ");
                l_wait(1);
                l_pcall(Disconnect, "Adonis_0xC0FA6");
                l_pcall(Kill, "Adonis_0xC0FA6");
                l_pcall(Kick, LocalPlayer, "Adonis_0xC0FA6");
            end;

            if u4 then
                return;
            end;

            if not l_game:IsLoaded() then
                l_game.Loaded:Wait();
            end;

            if not LocalPlayer.Character and Service.Players.CharacterAutoLoads then
                LocalPlayer.CharacterAdded:Wait();
            end;

            local Enabled = p13.Enabled;
            local u16 = false;
            task.spawn(l_pcall, function() -- Line: 192
                -- upvalues: Service (ref), LocalPlayer (ref), u16 (ref)
                local u17 = nil;
                local u18 = Service.UnWrap(Service.NetworkClient);
                local ClientReplicator = u18.ClientReplicator;

                if #u18:GetChildren() == 1 and (#u18:GetDescendants() == 1 and (u18:GetChildren()[1] == ClientReplicator and (u18:GetDescendants()[1] == ClientReplicator and (u18:FindFirstChild("ClientReplicator") == ClientReplicator and (u18:FindFirstChildOfClass("ClientReplicator") == ClientReplicator and (u18:FindFirstChildWhichIsA("ClientReplicator") == ClientReplicator and ClientReplicator:FindFirstAncestor("NetworkClient") == u18)))))) then
                    u17 = u18.DescendantRemoving:Connect(function(p19) -- Line: 207
                        -- upvalues: ClientReplicator (copy), u18 (copy), Service (ref), LocalPlayer (ref), u17 (ref), u16 (ref)
                        if p19 == ClientReplicator and (p19.Parent == u18 and (p19:IsA("NetworkReplicator") and p19:GetPlayer() == Service.UnWrap(LocalPlayer))) then
                            u17:Disconnect();
                            u16 = true;
                        end;
                    end);
                end;
            end);

            while true do
                local Idled = Service.UnWrap(LocalPlayer).Idled;
                local v21 = Idled:Connect(function(p20) -- Line: 224
                    -- upvalues: l_type (ref), idleTamper (copy), Enabled (copy), u16 (ref), Detected (ref), l_math (ref), l_tostring (ref)
                    if l_type(p20) == "number" and p20 > 0 then
                        if p20 > 1800 and (Enabled ~= false and not u16) then
                            Detected("kick", "Anti-idle detected. " .. l_tostring(l_math.ceil(p20 / 60) - 20) .. " minutes above maximum possible Roblox value");
                        end;

                        return;
                    end;

                    idleTamper("Invalid time data");
                end);

                if l_type(v21) ~= "userdata" or not (l_rawequal(l_typeof(v21), "RBXScriptConnection") and (v21.Connected == true and (l_rawequal(l_type(v21.Disconnect), "function") and (l_rawequal(l_typeof(Idled), "RBXScriptSignal") and (l_rawequal(l_type(Idled.Connect), "function") and l_rawequal(l_type(Idled.Wait), "function")))))) then
                    idleTamper("Userdata disrepencies detected");
                end;

                task.wait(200 + l_math.random() * 5);
                v21:Disconnect();

                if u16 then
                    return;
                end;
            end;
        end,

        HumanoidState = function() -- Line: 257, Name: HumanoidState
            -- upvalues: l_wait (copy), Service (copy), l_Enum (copy), l_rawequal (copy), Detected (copy)
            l_wait(1);
            local v22 = Service.Player.Character:WaitForChild("Humanoid", 2) or Service.Player.Character:FindFirstChildOfClass("Humanoid");
            local u23 = nil;
            local u24 = true;

            if v22 then
                u23 = v22.StateChanged:Connect(function(p25, p26) -- Line: 263
                    -- upvalues: u24 (ref), u23 (ref), l_Enum (ref), l_rawequal (ref), Detected (ref)
                    if not u24 then
                        u23:Disconnect();
                    end;

                    if l_rawequal(p26, l_Enum.HumanoidStateType.StrafingNoPhysics) and u24 then
                        u24 = false;
                        Detected("kill", "NoClipping");
                        u23:Disconnect();
                    end;
                end);

                while v22 and (v22.Parent and (v22.Parent.Parent and (u24 and l_wait(0.1)))) do
                    if l_Enum.HumanoidStateType.StrafingNoPhysics == l_Enum.HumanoidStateType.StrafingNoPhysics and l_rawequal(l_Enum.HumanoidStateType.StrafingNoPhysics, l_Enum.HumanoidStateType.StrafingNoPhysics) then
                        if l_rawequal(v22:GetState(), l_Enum.HumanoidStateType.StrafingNoPhysics) and u24 then
                            u24 = false;
                            Detected("kill", "NoClipping");
                        end;
                    else
                        Detected("crash", "Enum tampering detected");
                    end;
                end;
            end;
        end,

        AntiCoreGui = function() -- Line: 288, Name: AntiCoreGui
            -- upvalues: u4 (copy), Service (copy), l_xpcall (copy), LocalPlayer (copy), l_ipairs (copy), l_table (copy), l_workspace (copy), l_Instance (copy), l_Enum (copy), l_string (copy), Detected (copy), l_pcall (copy), Anti (copy)
            if u4 then
                return;
            end;

            Service.StartLoop("AntiCoreGui", 15, function() -- Line: 294
                -- upvalues: l_xpcall (ref), LocalPlayer (ref), Service (ref), l_ipairs (ref), l_table (ref), l_workspace (ref), l_Instance (ref), l_Enum (ref), l_string (ref), Detected (ref), l_pcall (ref), Anti (ref)
                l_xpcall(function() -- Line: 295
                    -- upvalues: LocalPlayer (ref), Service (ref), l_ipairs (ref), l_table (ref), l_workspace (ref), l_Instance (ref), l_Enum (ref), l_string (ref), Detected (ref), l_pcall (ref), Anti (ref)
                    local function getCoreUrls() -- Line: 296
                        -- upvalues: LocalPlayer (ref), Service (ref), l_ipairs (ref), l_table (ref)
                        local v27 = {};
                        local v28 = LocalPlayer:FindFirstChildOfClass("Backpack");
                        local Character = LocalPlayer.Character;
                        local v29 = Service.GuiService:FindFirstChildOfClass("ScreenshotHud");

                        if Character then
                            for _, child in l_ipairs(Character:GetChildren()) do
                                if child:IsA("BackpackItem") and Service.Trim(child.TextureId) ~= "" then
                                    l_table.insert(v27, Service.Trim(child.TextureId));
                                end;
                            end;
                        end;

                        if v28 then
                            for _, child in l_ipairs(v28:GetChildren()) do
                                if child:IsA("BackpackItem") and Service.Trim(child.TextureId) ~= "" then
                                    l_table.insert(v27, Service.Trim(child.TextureId));
                                end;
                            end;
                        end;

                        if v29 and Service.Trim(v29.CameraButtonIcon) ~= "" then
                            l_table.insert(v27, Service.Trim(v29.CameraButtonIcon));
                        end;

                        return v27;
                    end;

                    local u30 = false;
                    local u31 = false;
                    local u32 = Service.UnWrap(Service.ContentProvider);
                    local u33 = Service.UnWrap(l_workspace);
                    local u34 = Service.UnWrap(l_Instance.new("Decal"));
                    u34.Texture = "rbxasset://textures/face.png";
                    local u35 = getCoreUrls();

                    if not (Service.GuiService.MenuIsOpen or (Service.ContentProvider.RequestQueueSize >= 50 or LocalPlayer:GetNetworkPing() >= 750)) then
                        u32.PreloadAsync(u32, {
                            u34,
                            u34,
                            u34,
                            Service.UnWrap(Service.CoreGui),
                            u34
                        }, function(p36, p37) -- Line: 334
                            -- upvalues: l_Enum (ref), u31 (ref), u30 (ref), l_string (ref), l_ipairs (ref), u35 (copy), Detected (ref)
                            if p36 == "rbxasset://textures/face.png" and p37 == l_Enum.AssetFetchStatus.Success then
                                u31 = true;

                                return;
                            end;

                            if not u30 and (l_string.match(p36, "^rbxassetid://") or l_string.match(p36, "^http://www%.roblox%.com/asset/%?id=")) then
                                local v38 = false;

                                for _, v in l_ipairs(u35) do
                                    if l_string.find(p36, v, 1, true) then
                                        v38 = true;
                                        break;
                                    end;
                                end;

                                if v38 == true then
                                    return;
                                end;

                                u30 = true;
                                Detected("Kick", "Disallowed content URL detected in CoreGui");
                            end;
                        end);
                        u34:Destroy();
                        task.wait(6);

                        if not u31 then
                            Detected("kick", "Coregui detection bypass found");
                        end;
                    end;

                    local v39, v40 = l_pcall(function() -- Line: 363
                        -- upvalues: u32 (copy), u34 (copy)
                        u32:preloadasync({ u34 });
                    end);
                    local v41, v42 = l_pcall(function() -- Line: 366
                        -- upvalues: u32 (copy), u33 (copy), u34 (copy)
                        u32.PreloadAsync(u33, { u34 });
                    end);
                    local v43, v44 = l_pcall(function() -- Line: 369
                        -- upvalues: u33 (copy), u34 (copy)
                        u33:PreloadAsync({ u34 });
                    end);

                    if v39 or ((l_string.match(v40, "^%a+ is not a valid member of ContentProvider \"(.+)\"$") or "") ~= u32:GetFullName() or (v41 or (v42 ~= "Expected \':\' not \'.\' calling member function PreloadAsync" or (v43 or (l_string.match(v44, "^PreloadAsync is not a valid member of Workspace \"(.+)\"$") or "") ~= u33:GetFullName())))) then
                        Detected("kick", "Content provider spoofing detected");
                    end;

                    local FocusedTextBox = Service.UserInputService:GetFocusedTextBox();
                    local v45, v46 = l_pcall(Service.StarterGui.GetCore, Service.StarterGui, "DeveloperConsoleVisible");
                    local TextChatService = Service.TextChatService;
                    local v47;

                    if TextChatService then
                        v47 = TextChatService:FindFirstChildOfClass("ChatInputBarConfiguration");
                    else
                        v47 = TextChatService;
                    end;

                    if FocusedTextBox and (Anti.RLocked(FocusedTextBox) and not (v45 and v46)) and not (Service.GuiService.MenuIsOpen or Service.Chat.LoadDefaultChat and (TextChatService and (TextChatService.ChatVersion == l_Enum.ChatVersion.TextChatService and (v47 and v47.Enabled)))) then
                        Detected("Kick", "Invalid CoreGui Textbox has been selected");
                    end;
                end, function() -- Line: 398
                    -- upvalues: Detected (ref)
                    Detected("kick", "Tamper Protection 0x6F832");
                end);
            end);
        end,

        MainDetection = function() -- Line: 404, Name: MainDetection
            -- upvalues: Service (copy), l_os (copy), l_Instance (copy), l_string (copy), l_pcall (copy), u4 (copy), Detected (copy), l_pairs (copy), l_tostring (copy), Variables (copy), l_Enum (copy), l_rawequal (copy), l_wait (copy), l_type (copy), Disconnect (copy), Kill (copy), Kick (copy), LocalPlayer (copy), u10 (ref), Client (copy), l_typeof (copy), l_ipairs (copy), l_loadstring (copy), l_setmetatable (copy), l_rawget (copy), l_getmetatable (copy), l_xpcall (copy), l_math (copy), l_workspace (copy), l_warn (copy)
            local DataModel = Service.DataModel;
            local FindService = Service.DataModel.FindService;
            local u48 = l_os.clock();
            local Humanoid = l_Instance.new("Humanoid");
            local u49 = {
                "current identity is [0789]",
                "gui made by kujo",
                "tetanus reloaded hooked",
                "hookmetamethod",
                "hookfunction",
                "HttpGet",
                "^Chunk %w+, at Line %d+",
                "reviz admin",
                "iy is already loaded",
                "infinite yield is already loaded",
                "infinite yield is already",
                "iy_debug",
                "returning json",
                "shattervast",
                "failed to parse json",
                "newcclosure",
                "getrawmetatable",
                "setrawmetatable",
                "getnamecallmethod",
                "setnamecallmethod",
                "setfflag",
                "getfflag",
                "gethui",
                "isreadonly",
                "setreadonly",
                "isfile",
                "writefile",
                "appendfile",
                "delfile",
                "readfile",
                "loadfile",
                "isfolder",
                "makefolder",
                "delfolder",
                "listfiles",
                "secure_call",
                "getsynasset",
                "getcustomasset",
                "cloneref",
                "clonefunction",
                "getspecialinfo",
                "saveinstance",
                "messagebox",
                "protect_gui",
                "unprotect_gui",
                "rconsoleprint",
                "rconsoleinfo",
                "rconsolewarn",
                "rconsoleerr",
                "rconsoleclear",
                "rconsolename",
                "rconsoleinput",
                "printconsole",
                "checkcaller",
                "dumpstring",
                "islclosure",
                "getscriptclosure",
                "getscripthash",
                "getcallingscript",
                "getgenv",
                "getsenv",
                "getrenv",
                "getmenv",
                "gettenv",
                "identifyexecutor",
                "getreg",
                "getgc",
                "getnilinstances",
                "getconnections",
                "getloadedmodules",
                "firesignal",
                "fireclickdetector",
                "fireproximityprompt",
                "firetouchinterest",
                "setsimulationradius",
                "getsimulationradius",
                "sethiddenproperty",
                "gethiddenproperty",
                "setscriptable",
                "isnetworkowner",
                "setclipboard",
                "getconstants",
                "getconstant",
                "setconstant",
                "getupvalues",
                "getupvalue",
                "setupvalue",
                "getprotos",
                "getproto",
                "setproto",
                "getstack",
                "setstack",
                "getregistry",
                "cache_replace",
                "cache_invalidate",
                "get_thread_identity",
                "set_thread_identity",
                "setthreadcontext",
                "setidentity",
                "is_cached",
                "write_clipboard",
                "replicatesignal",
                "hooksignal",
                "queue_on_teleport",
                "is_beta",
                "create_secure_function",
                "run_secure_function",
                "Kill by Avexus#1234 initialized",
                "Couldn\'t find target with input:",
                "Found target with input:",
                "Couldn\'t find the target\'s root part%. :["
            };
            local u50 = { 5032588119 };

            local function check(p51) -- Line: 529
                -- upvalues: u49 (copy), l_string (ref)
                for _, v in u49 do
                    if not (l_string.find(l_string.lower(p51), "failed to load", 1, true) or (l_string.find(l_string.lower(p51), "meshcontentprovider failed to process", 1, true) or not (l_string.match(l_string.lower(p51), l_string.lower(v)) or l_string.match(p51, v)))) then
                        return true;
                    end;
                end;
            end;

            local function checkServ() -- Line: 541
                -- upvalues: Service (ref), l_pcall (ref), u4 (ref), FindService (copy), DataModel (copy), Detected (ref)
                if not (Service.GuiService:IsTenFootInterface() or (Service.VRService.VREnabled or (Service.UserInputService.GamepadEnabled or (Service.UserInputService.TouchEnabled or l_pcall(function() -- Line: 548
                    -- upvalues: u4 (ref), FindService (ref), DataModel (ref), Detected (ref)
                    if not u4 and (FindService(DataModel, "VirtualUser") or FindService(DataModel, "VirtualInputManager")) then
                        Detected("crash", "Disallowed Services Detected");
                    end;
                end))))) then
                    Detected("kick", "Disallowed Services Finding Error");
                end;
            end;

            local function soundIdCheck(p52) -- Line: 558
                -- upvalues: l_pairs (ref), u50 (copy), l_string (ref), l_tostring (ref)
                for _, v in l_pairs(u50) do
                    if p52.SoundId and (l_string.find(l_string.lower((l_tostring(p52.SoundId))), (l_tostring(v))) or p52.SoundId == l_tostring(v)) then
                        return true;
                    end;
                end;

                return false;
            end;

            local function checkTool(p53) -- Line: 567
                -- upvalues: Variables (ref), Service (ref), l_Enum (ref), l_rawequal (ref), Detected (ref), l_tostring (ref)
                task.wait();

                if p53 and (p53:IsA("Tool") or p53.ClassName == "HopperBin") and (not p53:FindFirstChild(Variables.CodeName) and (Service.Player:FindFirstChild("Backpack") and (p53:IsDescendantOf(Service.Player.Backpack) and (p53.ClassName == "HopperBin" and (l_rawequal(p53.BinType, l_Enum.BinType.Grab) or (l_rawequal(p53.BinType, l_Enum.BinType.Clone) or (l_rawequal(p53.BinType, l_Enum.BinType.Hammer) or l_rawequal(p53.BinType, l_Enum.BinType.GameTool)))))))) then
                    Detected("kick", "Building Tools detected; " .. l_tostring(p53.BinType));
                end;
            end;

            checkServ();
            Service.DataModel.ChildAdded:Connect(checkServ);
            Service.PolicyService.ChildAdded:Connect(function(p54) -- Line: 581
                -- upvalues: soundIdCheck (copy), Detected (ref), l_tostring (ref), l_wait (ref)
                if p54:IsA("Sound") then
                    if soundIdCheck(p54) then
                        Detected("crash", "CMDx Detected; " .. l_tostring(p54));

                        return;
                    end;

                    l_wait();

                    if soundIdCheck(p54) then
                        Detected("crash", "CMDx Detected; " .. l_tostring(p54));
                    end;
                end;
            end);
            Service.LogService.MessageOut:Connect(function(p55) -- Line: 594
                -- upvalues: u48 (ref), l_os (ref), l_type (ref), l_pcall (ref), Detected (ref), Disconnect (ref), Kill (ref), Kick (ref), LocalPlayer (ref), check (copy)
                if p55 == " " then
                    u48 = l_os.clock();

                    return;
                end;

                if l_type(p55) == "string" then
                    if check(p55) then
                        Detected("crash", "Exploit detected; " .. p55);
                    end;

                    return;
                end;

                l_pcall(Detected, "crash", "Tamper Protection 0x600D");
                task.wait(1);
                l_pcall(Disconnect, "Adonis_0x600D");
                l_pcall(Kill, "Adonis_0x600D");
                l_pcall(Kick, LocalPlayer, "Adonis_0x600D");
            end);
            Service.ScriptContext.Error:Connect(function(p56, p57, p58) -- Line: 622
                -- upvalues: l_tostring (ref), Detected (ref), check (copy), Service (ref), l_pairs (ref), l_string (ref)
                local v59 = l_tostring(p56);
                local v60 = l_tostring(p57);
                local v61 = l_tostring(p58);

                if v61 and v61 == "tpircsnaisyle" then
                    Detected("kick", "Elysian Detected");

                    return;
                end;

                if check(v59) or (check(v60) or check(v61)) then
                    Detected("crash", "Exploit detected; " .. v59 .. " " .. v60 .. " " .. v61);

                    return;
                end;

                if not (v61 and (v60 and v60 ~= "")) then
                    local LogHistory = Service.LogService:GetLogHistory();
                    local v62 = false;

                    if v61 then
                        for i, v in l_pairs(LogHistory) do
                            if v.message == v59 and (LogHistory[i + 1] and LogHistory[i + 1].message == v60) then
                                v62 = true;
                            end;
                        end;
                    else
                        v62 = true;
                    end;

                    if v62 then
                        if l_string.match(v60, "CoreGui") or (l_string.match(v60, "PlayerScripts") or (l_string.match(v60, "Animation_Scripts") or l_string.match(v60, "^(%S*)%.(%S*)"))) then
                            return;
                        end;

                        Detected("log", "Traceless/Scriptless error");
                    end;
                end;
            end);

            if Service.Player:WaitForChild("Backpack", 120) then
                Service.Player.Backpack.ChildAdded:Connect(checkTool);
            end;

            local u63 = false;
            Service.StartLoop("Detection", 15, function() -- Line: 657
                -- upvalues: l_pcall (ref), Service (ref), Detected (ref), u10 (ref), u63 (ref), l_os (ref), Client (ref), u48 (ref), l_type (ref), l_rawequal (ref), l_typeof (ref), l_ipairs (ref), check (copy), l_loadstring (ref), l_Instance (ref), l_pairs (ref), l_setmetatable (ref), l_rawget (ref), l_getmetatable (ref), l_xpcall (ref), Humanoid (copy), l_math (ref), l_tostring (ref), l_workspace (ref), l_string (ref), l_warn (ref)
                local v64, _ = l_pcall(function() -- Line: 659
                    -- upvalues: Service (ref)
                    Service.ScriptContext.Name = "ScriptContext";
                end);

                if not v64 then
                    Detected("log", "ScriptContext error?");
                end;

                local LogHistory = Service.LogService.GetLogHistory(Service.LogService);
                local v65 = Service.UnWrap(Service.LogService);
                local v66 = LogHistory[1];

                if u10(LogHistory, v65:GetLogHistory()) then
                    if u63 or v66 then
                        if not v66 then
                            Detected("kick", "Suspicious log amount detected 0x48248");
                            Client.OldPrint(" ");
                        end;
                    else
                        local v67 = l_os.clock();
                        Client.OldPrint(" ");
                        task.wait();
                        task.wait();
                        task.wait();
                        task.wait();
                        task.wait();
                        LogHistory = Service.LogService:GetLogHistory();
                        v66 = LogHistory[1];
                        u63 = true;

                        if u48 + 3 < v67 then
                            Detected("kick", "Log event not outputting to console");
                        end;
                    end;
                else
                    Detected("kick", "Log spoofing found");
                end;

                if l_rawequal(l_type(v66), "table") and (l_rawequal(l_type(v66.message), "string") and (l_rawequal(l_typeof(v66.messageType), "EnumItem") and (l_rawequal(l_type(v66.timestamp), "number") and (v66.timestamp >= l_os.time() - l_os.clock() - 172800 and v66.timestamp <= l_os.time() + 12096000)))) then
                    for _, v in l_ipairs(LogHistory) do
                        if check(v.message) then
                            Detected("crash", "Exploit detected; " .. v.message);
                        end;
                    end;
                else
                    Detected("kick", "Bypass detected 0x48248");
                end;

                local v68, _ = l_pcall(function() -- Line: 710
                    -- upvalues: l_loadstring (ref)
                    local _, _ = l_loadstring("print(\'LolloDev5123 was here\')");
                end);

                if v68 then
                    Detected("crash", "Exploit detected; Loadstring usable");
                end;

                local v69, _ = l_pcall(function() -- Line: 718
                    -- upvalues: l_Instance (ref)
                    l_Instance.new("StringValue").RobloxLocked = true;
                end);

                if v69 then
                    Detected("crash", "RobloxLocked usable");
                end;

                local function getDictionaryLenght(p70) -- Line: 726
                    -- upvalues: l_pairs (ref)
                    local v71 = 0;

                    for _, _ in l_pairs(p70) do
                        v71 = v71 + 1;
                    end;

                    return v71;
                end;

                local u72 = {
                    __mode = "v"
                };
                local u73 = l_setmetatable({}, u72);

                if u72.__mode == "v" and (l_rawget(u72, "__mode") == "v" and (l_getmetatable(u73) == u72 and getDictionaryLenght(u72) == 1)) then
                    local v74, v75 = l_pcall(function() -- Line: 745
                        -- upvalues: u73 (copy), u72 (copy), l_setmetatable (ref)
                        return l_setmetatable(u73, u72);
                    end);

                    if not (v74 and (v75 == u73 and Service.OrigRawEqual(v75, u73))) then
                        Detected("crash", "Anti-dex bypass found. Method 0x2");
                    end;
                else
                    Detected("crash", "Anti-dex bypass found. Method 0x1");
                end;

                l_xpcall(function() -- Line: 768
                    -- upvalues: Humanoid (ref), l_math (ref), Detected (ref), l_tostring (ref)
                    local u76 = 0;
                    local WalkSpeed = Humanoid.WalkSpeed;
                    local JumpPower = Humanoid.JumpPower;
                    local v77 = l_math.random(1, 100);
                    local v78 = l_math.random(1, 100);
                    local u79 = Humanoid.Changed:Connect(function() -- Line: 774
                        -- upvalues: u76 (ref)
                        u76 = u76 + 1;
                    end);
                    local u80 = Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function() -- Line: 777
                        -- upvalues: u76 (ref)
                        u76 = u76 + 1;
                    end);
                    local u81 = Humanoid:GetPropertyChangedSignal("JumpPower"):Connect(function() -- Line: 780
                        -- upvalues: u76 (ref)
                        u76 = u76 + 1;
                    end);
                    Humanoid.WalkSpeed = v77;
                    Humanoid.JumpPower = v78;

                    if Humanoid.WalkSpeed ~= v77 or Humanoid.JumpPower ~= v78 then
                        Detected("kick", "Humanoid tampering detected. Method 0x1");
                    end;

                    if v77 == WalkSpeed then
                        u76 = u76 + 2;
                    end;

                    if v78 == JumpPower then
                        u76 = u76 + 2;
                    end;

                    task.spawn(function() -- Line: 802
                        -- upvalues: u79 (ref), u80 (ref), u81 (ref), u76 (ref), Detected (ref), l_tostring (ref)
                        task.wait(5);
                        u79:Disconnect();
                        u80:Disconnect();
                        u81:Disconnect();

                        if u76 < 4 then
                            Detected("kick", "Humanoid tampering detected. Method 0x2. Count: " .. l_tostring(u76));
                        end;
                    end);
                end, function() -- Line: 812
                    -- upvalues: Detected (ref)
                    Detected("kick", "Tamper Protection 0x16C1D");
                end);

                if gcinfo() ~= collectgarbage("count") then
                    Detected("kick", "GC spoofing detected");
                end;

                l_xpcall(function() -- Line: 820
                    -- upvalues: l_ipairs (ref), l_workspace (ref), l_string (ref), Detected (ref)
                    local v82 = { "Loaded press z to", "press x to respawn", "Fe Invisible Fling By", "Diemiers#4209", "Respawning dont spam" };

                    for _, child in l_ipairs(l_workspace:GetChildren()) do
                        if child:IsA("Message") then
                            local Text = child.Text;

                            for _, v in l_ipairs(v82) do
                                if l_string.find(Text, v, 1, true) then
                                    Detected("kick", "Invisible FE fling GUI detected");
                                end;
                            end;
                        end;
                    end;
                end, l_warn);
            end);
        end
    }) do
        Anti.AddDetector(i, v);
    end;

    local u83 = l_os.clock();
    local u84 = l_os.clock();
    local u85 = l_os.clock();
    local u87 = Service.UnWrap(l_script).Changed:Connect(function(p86) -- Line: 848
        -- upvalues: l_string (copy), l_script (copy), u83 (ref), l_os (copy), u4 (copy), Detected (copy)
        if p86 == "Name" and l_string.match(l_script.Name, "^\n\n+ModuleScript$") then
            u83 = l_os.clock();

            return;
        end;

        if not u4 then
            Detected("kick", "Tamper Protection 0xC1E7");
        end;
    end);
    local MetaFunc = Service.MetaFunc;
    local v88 = MetaFunc(Service.TrackTask);
    local u89 = MetaFunc(l_pcall);
    local u90 = MetaFunc(l_wait);
    MetaFunc(l_time);
    local u91 = "";
    v88("Thread: TableCheck", MetaFunc(function() -- Line: 864
        -- upvalues: u90 (copy), l_pcall (copy), Anti (copy), l_script (copy), u4 (copy), l_string (copy), l_os (copy), u83 (ref), u85 (ref), u87 (copy), l_typeof (copy), u89 (copy), Detected (copy), Disconnect (copy), Kill (copy), Kick (copy), LocalPlayer (copy), l_math (copy), u91 (ref), u84 (ref)
        while u90(1) do
            local v92, _ = l_pcall(function() -- Line: 866
                -- upvalues: Anti (ref)
                return Anti.Detectors;
            end);

            if not (v92 and (l_script.Archivable == false and (u4 or l_string.match(l_script.Name, "^\n\n+ModuleScript$") and l_os.clock() - u83 <= 60)) and (l_os.clock() - u85 <= 60 and (u87 and (l_typeof(u87) == "RBXScriptConnection" and u87.Connected == true)))) then
                u89(Detected, "crash", "Tamper Protection 0x16471");
                u90(1);
                u89(Disconnect, "Adonis_0x16471");
                u89(Kill, "Adonis_0x16471");
                u89(Kick, LocalPlayer, "Adonis_0x16471");
            end;

            if u4 then
                u83 = l_os.clock();
            else
                local v93 = "\n\n" .. l_string.rep("\n", l_math.random(1, 50)) .. "ModuleScript";

                if v93 == u91 then
                    u83 = l_os.clock();
                end;

                l_script.Name = v93;
                u91 = v93;
            end;

            u84 = l_os.clock();
        end;
    end));
    task.spawn(l_xpcall, function() -- Line: 900
        -- upvalues: u4 (copy), l_os (copy), u83 (ref), l_math (copy), u84 (ref), u85 (ref), u89 (copy), Detected (copy), u90 (copy), Disconnect (copy), Kill (copy), Kick (copy), LocalPlayer (copy)
        while true do
            local v94, v95;

            if u4 then
                v94 = l_os.clock() - u84;

                if l_math.abs(v94) > 60 then
                    u89(Detected, "crash", "Tamper Protection 0xE28D");
                    u90(1);
                    u89(Disconnect, "Adonis_0xE28D");
                    u89(Kill, "Adonis_0xE28D");
                    u89(Kick, LocalPlayer, "Adonis_0xE28D");
                else
                    v95 = l_os.clock() - u85;

                    if l_math.abs(v95) > 60 then
                        u89(Detected, "crash", "Tamper Protection 0xE28D");
                        u90(1);
                        u89(Disconnect, "Adonis_0xE28D");
                        u89(Kill, "Adonis_0xE28D");
                        u89(Kick, LocalPlayer, "Adonis_0xE28D");
                    end;
                end;
            else
                local v96 = l_os.clock() - u83;

                if l_math.abs(v96) > 60 then
                    u89(Detected, "crash", "Tamper Protection 0xE28D");
                    u90(1);
                    u89(Disconnect, "Adonis_0xE28D");
                    u89(Kill, "Adonis_0xE28D");
                    u89(Kick, LocalPlayer, "Adonis_0xE28D");
                else
                    v94 = l_os.clock() - u84;

                    if l_math.abs(v94) > 60 then
                        u89(Detected, "crash", "Tamper Protection 0xE28D");
                        u90(1);
                        u89(Disconnect, "Adonis_0xE28D");
                        u89(Kill, "Adonis_0xE28D");
                        u89(Kick, LocalPlayer, "Adonis_0xE28D");
                    else
                        v95 = l_os.clock() - u85;

                        if l_math.abs(v95) > 60 then
                            u89(Detected, "crash", "Tamper Protection 0xE28D");
                            u90(1);
                            u89(Disconnect, "Adonis_0xE28D");
                            u89(Kill, "Adonis_0xE28D");
                            u89(Kick, LocalPlayer, "Adonis_0xE28D");
                        end;
                    end;
                end;
            end;

            task.wait(1);
            u85 = l_os.clock();
        end;
    end, function() -- Line: 917
        -- upvalues: u89 (copy), Detected (copy), u90 (copy), Disconnect (copy), Kill (copy), Kick (copy), LocalPlayer (copy)
        u89(Detected, "crash", "Tamper Protection 0x36C6");
        u90(1);
        u89(Disconnect, "Adonis_0x36C6");
        u89(Kill, "Adonis_0x36C6");
        u89(Kick, LocalPlayer, "Adonis_0x36C6");
    end);
end;
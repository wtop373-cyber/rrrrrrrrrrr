-- ============================================================
-- SCRIPT: Stats
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface.Modules.Stats
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 16
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
local ReplicatedStorage = game:GetService("ReplicatedStorage");
game:GetService("StarterGui");
local TweenService = game:GetService("TweenService");
local RunService = game:GetService("RunService");
game:GetService("TextService");
local GamepadService = game:GetService("GamepadService");
local LocalPlayer = game.Players.LocalPlayer;

return {
    new = function(u2) -- Line: 38, Name: new
        -- upvalues: ReplicatedStorage (copy), LocalPlayer (copy), RunService (copy), TweenService (copy), GamepadService (copy)
        local StatsFrame = u2:WaitForChild("StatsFrame");
        local Frame2 = StatsFrame:WaitForChild("Frame2");
        local Frame = Frame2:WaitForChild("Frame");
        local LevelFrame = u2:WaitForChild("LevelFrame");
        local Container = Frame:WaitForChild("Container");
        local Bank = Container:WaitForChild("Bank");
        local Cash = Container:WaitForChild("Cash");
        local DropCash = Container:WaitForChild("DropCash");
        local Bounty = Container:WaitForChild("Bounty");
        local NotificationFrame = u2:WaitForChild("NotificationFrame");
        u2:WaitForChild("ReturnFrame");
        local NewModules = ReplicatedStorage:WaitForChild("NewModules");
        local Values = ReplicatedStorage:WaitForChild("Values");
        local Events = ReplicatedStorage:WaitForChild("Events");
        local Events2 = ReplicatedStorage:WaitForChild("Events2");
        local Ping = require(NewModules.Shared.Services.Ping);
        local Notification = require(NewModules.Client.Services.Notification);
        local AddCommas = require(NewModules.Shared.Extensions.AddCommas);
        local DeepCopy = require(NewModules.Shared.Extensions.DeepCopy);
        local UgcEvent = require(script.Parent.UgcEvent);
        local u3 = nil;
        local UISounds = ReplicatedStorage:WaitForChild("Storage"):WaitForChild("UISounds");
        local u4 = {
            red = Color3.fromRGB(255, 152, 152),
            green = Color3.fromRGB(152, 255, 154),
            yellow = Color3.fromRGB(255, 235, 152)
        };
        local u5 = false;
        local u6 = true;
        local u7 = false;
        local u8 = false;
        local u9 = 0;
        local u10 = false;
        local u11 = false;
        local u12 = nil;
        local u13 = nil;
        local ClientFrame = u2:WaitForChild("ClientFrame");
        local v14 = {
            Cash = 0,
            Bank = 0,
            Level = 1,
            XP = 0,
            MaxXP = 1,
            Bounty = 0,
            Data = {}
        };
        local u15 = nil;
        local u16 = "";
        local u17 = 0;
        local u18 = false;
        local u19 = false;
        u2.Enabled = true;
        _G.PlayerData = DeepCopy(v14);
        local u20 = DeepCopy(v14);

        local function FormatTime(p21) -- Line: 121
            local function Format(p22) -- Line: 122
                return string.format("%02i", p22);
            end;

            local v23 = (p21 - p21 % 60) / 60;

            return string.format("%02i", v23) .. ":" .. string.format("%02i", p21 - v23 * 60);
        end;

        local function PositiveIntegerMask(p24) -- Line: 130
            return p24:gsub("[^%-%d]", "");
        end;

        local u25 = LocalPlayer:FindFirstChildOfClass("PlayerGui");

        local function sv(p26, p27) -- Line: 136
            -- upvalues: u25 (copy)
            local v28 = u25 and u25:GetAttribute(p26);

            if v28 == nil or v28 == "" then
                return p27;
            end;

            return v28;
        end;

        local function serverInfoDo() -- Line: 144
            -- upvalues: u2 (copy), ReplicatedStorage (ref), u25 (copy), Values (copy), ClientFrame (copy)
            u2.ServerInfo.Visible = _G.GSettings and _G.GSettings.ServerInfo;
            local string_upper = string.upper;
            local Value = ReplicatedStorage.Values.GameMode.Value;
            local v29 = u25 and u25:GetAttribute("SMd");

            if v29 ~= nil and v29 ~= "" then
                Value = v29;
            end;

            local v30 = string_upper(Value);
            local Value2 = ReplicatedStorage.Values.VersionNumber.Value;
            local Value3 = ReplicatedStorage.Values.ServerId.Value;
            local v31 = u25 and u25:GetAttribute("SId");

            if v31 ~= nil and v31 ~= "" then
                Value3 = v31;
            end;

            local string_sub_ret = string.sub(Value3, 0, 12);

            if Values.IsVipServer.Value then
                u2.ServerInfo.Text = "<font color=\"rgb(255,165,0)\">VIP</font> | " .. v30 .. " | " .. Value2;
            else
                u2.ServerInfo.Text = v30 .. " | " .. Value2 .. " | " .. string_sub_ret;
            end;

            local Label = ClientFrame.Region.Label;
            local Value4 = Values.ServerRegion.Value;
            local v32 = u25 and u25:GetAttribute("SRg");

            if v32 ~= nil and v32 ~= "" then
                Value4 = v32;
            end;

            Label.Text = "Region: <b>" .. tostring(Value4) .. "</b>";
        end;

        serverInfoDo();

        if u25 then
            u25:GetAttributeChangedSignal("SId"):Connect(serverInfoDo);
            u25:GetAttributeChangedSignal("SRg"):Connect(serverInfoDo);
            u25:GetAttributeChangedSignal("SMd"):Connect(serverInfoDo);
        end;

        local function HandleClientStats(p33) -- Line: 167
            -- upvalues: u11 (ref), RunService (ref), u4 (copy), ClientFrame (copy), Ping (copy), LocalPlayer (ref), u13 (ref), Events2 (copy), u12 (ref)
            if not p33 then
                if u11 then
                    u11 = false;
                    ClientFrame.Visible = false;

                    if u12 then
                        u12:Disconnect();
                    end;

                    if u13 then
                        u13:Disconnect();
                    end;

                    u12 = nil;
                    u13 = nil;
                end;

                return;
            end;

            if u11 then
                return;
            end;

            u11 = true;
            local Heartbeat = RunService.Heartbeat;
            tick();
            local u34 = {
                red = Color3.fromRGB(255, 152, 152),
                green = Color3.fromRGB(152, 255, 154),
                yellow = Color3.fromRGB(255, 235, 152)
            };

            local function UpdatePingStat(p35, p36) -- Line: 183
                -- upvalues: u4 (ref), ClientFrame (ref)
                if not (_G.GSettings and _G.GSettings.ClientStats) then
                    return;
                end;

                local green = u4.green;
                local v37;

                if p35 then
                    v37 = math.floor(p35 * 1000 + 0.5);

                    if v37 <= 100 then
                        green = u4.green;
                    elseif v37 <= 250 then
                        green = u4.yellow;
                    else
                        green = u4.red;
                    end;

                    if v37 > 999 then
                        v37 = ">999";
                    end;
                else
                    v37 = "...";
                end;

                ClientFrame.Ping.Label.Text = "Ping: <b>" .. tostring(v37) .. "</b> ms";
                ClientFrame.Ping.Label.TextColor3 = green;
            end;

            if not (RunService:IsRunning() and time) then
                local _ = os.clock;
            end;

            local function HeartbeatUpdate(p38) -- Line: 210
                -- upvalues: u34 (copy), ClientFrame (ref)
                local v39 = _G.P23893189418293 or 0;
                local v40 = v39 > 999 and 999 or v39;
                local v41;

                if v40 < 30 then
                    v41 = u34.red;
                elseif v40 < 59 then
                    v41 = u34.yellow;
                else
                    v41 = u34.green;
                end;

                ClientFrame.FPS.Label.Text = "FPS: <b>" .. tostring(v40) .. "</b>";
                ClientFrame.FPS.Label.TextColor3 = v41;
            end;

            UpdatePingStat(Ping[LocalPlayer], true);
            u13 = Events2.UpdatePing.Event:Connect(UpdatePingStat);
            u12 = Heartbeat:Connect(HeartbeatUpdate);
            Heartbeat:Wait();
            ClientFrame.Visible = true;
        end;

        local function UpdateLevelDes(p42) -- Line: 252
            -- upvalues: LevelFrame (copy), u3 (ref)
            local v43 = {
                LevelFrame.Bar.BG,
                LevelFrame.Bar.Bar2.BG,
                LevelFrame.LevelBox,
                LevelFrame.LevelBox.LevelNumber,
                LevelFrame.DoubleXPFrame.Frame.DoubleXPTimer,
                LevelFrame.DoubleXPFrame.Frame.BG,
                LevelFrame.DoubleXPFrame.Frame.Bar.BG,
                LevelFrame.Bar.Stat
            };

            if (p42 or _G.PlayerData.Level) >= 1000 then
                LevelFrame.Bar.AnchorPoint = Vector2.new(0.5, 0);
                LevelFrame.Bar.Position = UDim2.new(0.5, 0, 0, 0);
                LevelFrame.LevelBox.AnchorPoint = Vector2.new(0.5, 0.5);
                LevelFrame.LevelBox.Position = UDim2.new(0.5, 0, 0.5, 0);
                LevelFrame.Bar.Max.Visible = true;
                LevelFrame.Bar.Stat.Visible = false;

                for _, v in pairs(v43) do
                    if v:FindFirstChild("XGradient") then
                        v.XGradient:Destroy();
                    end;

                    local v44 = script.Gradient2:Clone();
                    v44.Name = "XGradient";
                    v44.Parent = v;
                end;

                return;
            end;

            LevelFrame.Bar.AnchorPoint = Vector2.new(0, 0);
            LevelFrame.Bar.Position = UDim2.new(0.115, 0, 0, 0);
            LevelFrame.LevelBox.AnchorPoint = Vector2.new(0, 0.5);
            LevelFrame.LevelBox.Position = UDim2.new(0, 0, 0.5, 0);
            LevelFrame.Bar.Max.Visible = false;
            LevelFrame.Bar.Stat.Visible = true;

            for _, v in pairs(v43) do
                if v:FindFirstChild("XGradient") then
                    v.XGradient:Destroy();
                end;

                if u3 and u3.DoubleXP.Value then
                    local v45 = script.Gradient1:Clone();
                    v45.Name = "XGradient";
                    v45.Parent = v;
                end;
            end;
        end;

        local function UpdateDoubleXP() -- Line: 298
            -- upvalues: LevelFrame (copy), u3 (ref), TweenService (ref)
            LevelFrame.DoubleXPFrame.Frame.Bar:TweenSize(UDim2.new(math.min(u3.DoubleXP.Timer.Value / 3600, 0.99), 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 1, true);

            if u3.DoubleXP.Perm.Value then
                LevelFrame.DoubleXPFrame.Frame.DoubleXPTimer.Text = "XX:XX";
            else
                local Value = u3.DoubleXP.Timer.Value;

                local function _(p46) -- Line: 122
                    return string.format("%02i", p46);
                end;

                local v47 = (Value - Value % 60) / 60;
                LevelFrame.DoubleXPFrame.Frame.DoubleXPTimer.Text = string.format("%02i", v47) .. ":" .. string.format("%02i", Value - v47 * 60);
            end;

            if u3.DoubleXP.Timer.Value < 180 then
                if LevelFrame.DoubleXPFrame.Frame.DoubleXPTimer.TextColor3 ~= Color3.fromRGB(255, 170, 0) then
                    TweenService:Create(LevelFrame.DoubleXPFrame.Frame.DoubleXPTimer, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        TextColor3 = Color3.fromRGB(255, 170, 0)
                    }):Play();
                    TweenService:Create(LevelFrame.DoubleXPFrame.Frame.Bar, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        BackgroundColor3 = Color3.fromRGB(255, 170, 0)
                    }):Play();
                end;
            elseif LevelFrame.DoubleXPFrame.Frame.DoubleXPTimer.TextColor3 ~= Color3.fromRGB(255, 255, 255) then
                TweenService:Create(LevelFrame.DoubleXPFrame.Frame.DoubleXPTimer, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                }):Play();
                TweenService:Create(LevelFrame.DoubleXPFrame.Frame.Bar, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                }):Play();
            end;
        end;

        local function DoubleXPHandler(p48) -- Line: 319
            -- upvalues: u3 (ref), LevelFrame (copy), UpdateLevelDes (copy), UpdateDoubleXP (copy)
            if u3.DoubleXP.Value then
                LevelFrame.DoubleXPFrame.Frame.Visible = true;
                LevelFrame.DoubleXPFrame.Frame:TweenPosition(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 1, true);
                LevelFrame.DoubleXPFrame.Frame.DoubleXPTimer.Visible = true;
                LevelFrame.DoubleXPFrame.Frame.Bar.Size = UDim2.new(1, 0, 1, 0);
            else
                LevelFrame.DoubleXPFrame.Frame:TweenPosition(UDim2.new(0, 0, -1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 1, true);
                local v49 = 0;

                local function _(p50) -- Line: 122
                    return string.format("%02i", p50);
                end;

                local v51 = (v49 - v49 % 60) / 60;
                LevelFrame.DoubleXPFrame.Frame.DoubleXPTimer.Text = string.format("%02i", v51) .. ":" .. string.format("%02i", v49 - v51 * 60);
            end;

            UpdateLevelDes();
            UpdateDoubleXP();
        end;

        local function Update() -- Line: 336
            -- upvalues: Cash (copy), AddCommas (copy), Bank (copy), u20 (ref), TweenService (ref), Container (copy), LevelFrame (copy), ReplicatedStorage (ref), u19 (ref), u3 (ref), u17 (ref), u18 (ref), Bounty (copy)
            Cash.Amt.Text = "$" .. AddCommas(_G.PlayerData.Cash);
            Bank.Amt.Text = "$" .. AddCommas(_G.PlayerData.Bank);

            if _G.PlayerData.Cash ~= u20.Cash then
                local Added = Cash:FindFirstChild("Added");

                if Added then
                    Added:Destroy();
                end;

                local v52 = script.Added:Clone();
                game.Debris:AddItem(v52, 1.5);
                local v53 = _G.PlayerData.Cash - u20.Cash;

                if v53 > 0 then
                    v52.Text = "+" .. AddCommas(v53);
                    v52.TextColor3 = Color3.new(0, 1, 0);
                else
                    v52.Text = "-" .. AddCommas(-v53);
                    v52.TextColor3 = Color3.new(1, 0, 0);
                end;

                v52.Parent = Cash;
                TweenService:Create(v52, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0.5), {
                    TextTransparency = 1,
                    TextStrokeTransparency = 1
                }):Play();
            end;

            if _G.PlayerData.Bank ~= u20.Bank then
                local Added = Bank:FindFirstChild("Added");

                if Added then
                    Added:Destroy();
                end;

                local v54 = script.Added:Clone();
                game.Debris:AddItem(v54, 1.5);
                local v55 = _G.PlayerData.Bank - u20.Bank;

                if v55 > 0 then
                    v54.Text = "+" .. AddCommas(v55);
                    v54.TextColor3 = Color3.new(0, 1, 0);
                else
                    v54.Text = "-" .. AddCommas(-v55);
                    v54.TextColor3 = Color3.new(1, 0, 0);
                end;

                v54.Parent = Bank;
                TweenService:Create(v54, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0.5), {
                    TextTransparency = 1,
                    TextStrokeTransparency = 1
                }):Play();
            end;

            local Points = Container:FindFirstChild("Points");

            if _G.PlayerData.Points and Points then
                Points.Amt.Text = AddCommas(_G.PlayerData.Points);

                if not u20.Points then
                    u20.Points = 0;
                end;

                if _G.PlayerData.Points ~= u20.Points then
                    local Added = Points:FindFirstChild("Added");

                    if Added then
                        Added:Destroy();
                    end;

                    local v56 = script.Added:Clone();
                    game.Debris:AddItem(v56, 1.5);
                    local v57 = _G.PlayerData.Points - u20.Points;

                    if v57 > 0 then
                        v56.Text = "+" .. AddCommas(v57);
                        v56.TextColor3 = Color3.new(0, 1, 0);
                    else
                        v56.Text = "-" .. AddCommas(-v57);
                        v56.TextColor3 = Color3.new(1, 0, 0);
                    end;

                    v56.Parent = Points;
                    TweenService:Create(v56, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0.5), {
                        TextTransparency = 1,
                        TextStrokeTransparency = 1
                    }):Play();
                end;
            end;

            LevelFrame.LevelBox.LevelNumber.Text = tostring(_G.PlayerData.Level);

            if ReplicatedStorage.Values.NoXPGain.Value then
                if not u19 then
                    u19 = true;
                    LevelFrame.Bar.Stat.Text = "N/A XP";
                    LevelFrame.Bar.Bar2:TweenSize(UDim2.new(1, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 1, true);
                    LevelFrame.Bar.Bar2.BG.ImageColor3 = Color3.new(0.5, 0.5, 0.5);
                    LevelFrame.Bar.Stat.TextColor3 = Color3.new(0.5, 0.5, 0.5);
                end;
            else
                LevelFrame.Bar.Stat.Text = tostring(_G.PlayerData.XP) .. "/" .. tostring(_G.PlayerData.MaxXP) .. " XP";
                LevelFrame.Bar.Bar2:TweenSize(UDim2.new(math.min(_G.PlayerData.XP, _G.PlayerData.MaxXP) / _G.PlayerData.MaxXP, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 1, true);

                if u19 then
                    u19 = false;
                    LevelFrame.Bar.Bar2.BG.ImageColor3 = Color3.new(1, 1, 1);
                    LevelFrame.Bar.Stat.TextColor3 = Color3.new(1, 1, 1);
                end;
            end;

            if _G.PlayerData.Level ~= u20.Level then
                LevelFrame.Bar.Bar2.Size = UDim2.new(0, 0, 1, 0);
                LevelFrame.LevelBox.LevelNumber.TextColor3 = Color3.new(1, 1, 1);
                TweenService:Create(LevelFrame.LevelBox.LevelNumber, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, true), {
                    TextColor3 = Color3.new(1, 0, 0)
                }):Play();
            end;

            u3.Cash.Value = _G.PlayerData.Cash;
            local Bounty2 = _G.PlayerData.Bounty;
            local v58 = u17;

            if u18 then
                v58 = v58 * 0.1;
            end;

            if Bounty2 <= 0 and ReplicatedStorage.Values.NoBounties.Value then
                Bounty.Amt.TextColor3 = Color3.new(0.5, 0.5, 0.5);
                Bounty.Amt.Text = "N/A";
            else
                Bounty.Amt.TextColor3 = Bounty2 > 0 and v58 < Bounty2 and Color3.fromRGB(138, 0, 2) or Color3.new(1, 1, 1);
                Bounty.Amt.Text = "$" .. Bounty2;
            end;

            u20 = {
                Cash = _G.PlayerData.Cash,
                Bank = _G.PlayerData.Bank,
                Points = _G.PlayerData.Points,
                Level = _G.PlayerData.Level
            };
        end;

        local function newChar(p59) -- Line: 463
            -- upvalues: u7 (ref), u5 (ref), u6 (ref), Frame2 (copy), LevelFrame (copy), Update (copy), serverInfoDo (copy), u2 (copy), Frame (copy)
            u7 = false;

            if _G.WaitForChar then
                _G.WaitForChar();
            end;

            u5 = u6;
            Frame2:TweenPosition(UDim2.new(0, 0, Frame2.Position.Y.Scale, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 1, true);
            LevelFrame:TweenPosition(UDim2.new(_G.PlayerData.Level >= 100 and 0.485 or 0.5, 0, 0.03, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 1, true);
            Update();
            serverInfoDo();
            u7 = true;
            u2.StatsToggleButton.Visible = not u6;
            Frame.ToggleButton.Visible = u6;
            p59:WaitForChild("Humanoid").Died:Connect(function() -- Line: 480
                -- upvalues: u5 (ref), u7 (ref), u2 (ref), Frame (ref), Frame2 (ref), LevelFrame (ref)
                u5 = false;
                u7 = false;
                u2.StatsToggleButton.Visible = false;
                Frame.ToggleButton.Visible = false;
                Frame2:TweenPosition(UDim2.new(-125, 0, Frame2.Position.Y.Scale, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 1, true);
                LevelFrame:TweenPosition(UDim2.new(_G.PlayerData.Level >= 100 and 0.485 or 0.5, 0, -0.1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 1, true);
            end);
        end;

        local function UpdateClient(p60, p61) -- Line: 490
            -- upvalues: u17 (ref), u18 (ref), UpdateLevelDes (copy), u3 (ref), UISounds (copy), Events2 (copy), Update (copy), u9 (ref)
            if p60.cash then
                _G.PlayerData.Cash = p60.cash;
                _G.PlayerData.Bank = p60.bank;
            end;

            if p60.points then
                _G.PlayerData.Points = p60.points;
            end;

            if p60.ConnectedSocials then
                _G.PlayerData.ConnectedSocials = p60.ConnectedSocials;
            end;

            if p60.bounty then
                _G.PlayerData.Bounty = p60.bounty;
            end;

            if p60.prime then
                _G.PlayerData.Prime = p60.prime;
            end;

            if p60.starterpackExpired ~= nil then
                _G.PlayerData.StarterpackExpired = p60.starterpackExpired;
            end;

            if p60.idVerified then
                _G.PlayerData.IdVerified = p60.idVerified;
            end;

            if p60.tradeAccess then
                _G.PlayerData.TradeAccess = p60.tradeAccess;
            end;

            if p60.MinBountyToKill then
                u17 = p60.MinBountyToKill;
                u18 = p60.DDBNTY;
            end;

            if p60.levelData then
                if _G.PlayerDataLevel ~= p60.levelData.Level then
                    UpdateLevelDes(p60.levelData.Level);
                end;

                _G.PlayerData.Level = p60.levelData.Level;
                _G.PlayerData.XP = p60.levelData.XP;
                _G.PlayerData.MaxXP = p60.levelData.MaxXP;
            end;

            if p60.cosmeticData then
                _G.PlayerData.CosmeticData = p60.cosmeticData;
            end;

            if p60.equippedCosmeticData then
                _G.PlayerData.EquippedCosmeticData = p60.equippedCosmeticData;
            end;

            if p60.unlocked then
                for _, v in pairs(p60.unlocked) do
                    if not u3.Unlocked:FindFirstChild(v) then
                        local BoolValue = Instance.new("BoolValue");
                        BoolValue.Name = v;
                        BoolValue.Parent = u3.Unlocked;
                    end;
                end;
            end;

            if p60.cosmeticStoreData then
                _G.COSMETIC_STORE_DATA = p60.cosmeticStoreData;
            end;

            if p60.cosmeticInventoryLimits then
                _G.PlayerData.CosmeticInventoryLimits = p60.cosmeticInventoryLimits;
            end;

            if p60.allowedExternalLinkReferences then
                _G.PlayerData.AllowedExternalLinkReferences = p60.allowedExternalLinkReferences;
            end;

            if p61 then
                UISounds.change:Play();
            end;

            Events2.UpdateClientData:Fire(p60);
            Update();
            u9 = u9 + 1;
        end;

        local function DropCashFunc() -- Line: 578
            -- upvalues: u10 (ref), DropCash (copy), UISounds (copy), u16 (ref), LocalPlayer (ref), Events (copy), ReplicatedStorage (ref)
            if u10 then
                return;
            end;

            u10 = true;
            delay(1, function() -- Line: 582
                -- upvalues: u10 (ref)
                u10 = false;
            end);
            local v62 = tonumber(DropCash.Frame.TextBox.Text);
            UISounds.click:Play();

            local function EMsg(p63, p64) -- Line: 591
                -- upvalues: DropCash (ref), u16 (ref)
                DropCash.Frame.ErrorMsg.TextColor3 = p63 and Color3.new(0, 1, 0) or Color3.new(1, 0, 0);
                DropCash.Frame.ErrorMsg.Text = p64;
                local math_random_ret = math.random();
                u16 = math_random_ret;
                delay(1.5, function() -- Line: 597
                    -- upvalues: math_random_ret (copy), u16 (ref), DropCash (ref)
                    if math_random_ret == u16 then
                        DropCash.Frame.ErrorMsg.Text = "";
                    end;
                end);
            end;

            if not (v62 and LocalPlayer.Character) then
                EMsg(false, "Error");

                return;
            end;

            local v65, v66 = Events.DCZSH:InvokeServer(v62);
            local v67;

            if v65 then
                UISounds.change:Play();
                pcall(function() -- Line: 611
                    -- upvalues: LocalPlayer (ref), ReplicatedStorage (ref)
                    LocalPlayer.Character.Humanoid:LoadAnimation(ReplicatedStorage.Storage.Animations.Pickup2):Play();
                end);
                v67 = v66 or "Success";
            else
                UISounds.lost:Play();
                v67 = v66 or "Error";
            end;

            if v65 then
                EMsg(true, v67);

                return;
            end;

            EMsg(false, v67);
        end;

        local u68 = nil;
        local u69 = nil;

        local function AllowanceChange() -- Line: 632
            -- upvalues: u3 (ref), u68 (ref), u69 (ref), Container (copy), TweenService (ref)
            local NextAllowance = u3.NextAllowance;

            if NextAllowance.Claim.Value then
                Container.Allowance.Amt.Text = "READY";
                Container.Allowance.Amt.TextColor3 = Color3.new(1, 1, 1);
                Container.Allowance.Amt.Font = Enum.Font.GothamBold;
                Container.Allowance.BG.UIStroke.Transparency = 1;

                if u68 then
                    u68:Cancel();
                    u68 = nil;
                end;

                if u69 then
                    u69:Cancel();
                    u69 = nil;
                end;

                u68 = TweenService:Create(Container.Allowance.Amt, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 1000000, true), {
                    TextColor3 = Color3.fromRGB(182, 255, 125)
                });
                u68:Play();
                u69 = TweenService:Create(Container.Allowance.BG.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 1000000, true), {
                    Transparency = 0.5
                });
                u69:Play();

                return;
            end;

            if u68 then
                u68:Cancel();
                u68 = nil;
            end;

            if u69 then
                u69:Cancel();
                u69 = nil;
            end;

            Container.Allowance.BG.UIStroke.Transparency = 1;
            Container.Allowance.Amt.TextColor3 = Color3.new(1, 1, 1);
            local Value = NextAllowance.Value;

            local function _(p70) -- Line: 122
                return string.format("%02i", p70);
            end;

            local v71 = (Value - Value % 60) / 60;
            Container.Allowance.Amt.Text = string.format("%02i", v71) .. ":" .. string.format("%02i", Value - v71 * 60);
            Container.Allowance.Amt.Font = Enum.Font.GothamSemibold;
        end;

        local function DataSaveToggle(p72) -- Line: 679
            -- upvalues: Values (copy), u2 (copy)
            if Values.BannedPlayersOnly.Value then
                u2.DataSavingDisabled.TextColor3 = Color3.fromRGB(253, 61, 61);
            end;

            u2.DataSavingDisabled.Text = `{Values.IsVipServer.Value and "VIP SERVER" or (Values.BannedPlayersOnly.Value and "BANLAND" or "")} | DATASAVING DISABLED`;
            u2.DataSavingDisabled.Visible = _G.DidClientFullLoadThing and not Values.DataSaving.Value;
        end;

        function SendNotif(u73, u74)
            -- upvalues: UISounds (copy), u3 (ref), Notification (copy), NotificationFrame (copy)
            pcall(function() -- Line: 689
                -- upvalues: u74 (copy), UISounds (ref), u3 (ref), Notification (ref), u73 (copy), NotificationFrame (ref)
                if u74 and (UISounds:FindFirstChild(u74) and u3.Loaded.Value) then
                    UISounds[u74]:Play();
                end;

                Notification.new(u73, NotificationFrame);
            end);
        end;

        spawn(function() -- Line: 700
            -- upvalues: u15 (ref), HandleClientStats (copy), Events2 (copy), serverInfoDo (copy)
            repeat
                wait(0.2);
            until _G.GSettings;

            u15 = _G.GSettings;

            if u15.ClientStats then
                HandleClientStats(true);
            end;

            Events2.SettingsChanged.Event:Connect(function(p75, p76) -- Line: 709
                -- upvalues: HandleClientStats (ref), serverInfoDo (ref)
                if p75 == "ClientStats" then
                    HandleClientStats(p76);

                    return;
                end;

                if p75 == "ServerInfo" then
                    serverInfoDo();
                end;
            end);
        end);
        serverInfoDo();
        pd2 = ReplicatedStorage:WaitForChild("PlayerbaseData2", 1000);
        u3 = pd2:WaitForChild(LocalPlayer.Name, 1000);

        if u2.AbsoluteSize.X < 990 and _G.DeviceType == 3 then
            ClientFrame.UIScale.Scale = 0.7;
            ClientFrame.UIListLayout.FillDirection = Enum.FillDirection.Vertical;
            ClientFrame.UIListLayout.Padding = UDim.new(0, 1);
            ClientFrame.Position = UDim2.new(0, 215, 0, 30);
            u2.ServerInfo.Position = UDim2.new(0, 40, 0, 1);
            u2.ServerInfo.TextYAlignment = Enum.TextYAlignment.Top;
            u2.ServerInfo.TextSize = 9;
            Frame2.Position = UDim2.new(0, 0, 0.44, 0);
        end;

        Values:WaitForChild("DataSaving").Changed:Connect(DataSaveToggle);
        Values:WaitForChild("IsVipServer").Changed:Connect(function() -- Line: 739
            -- upvalues: DataSaveToggle (copy), serverInfoDo (copy)
            DataSaveToggle();
            serverInfoDo();
        end);
        DataSaveToggle();
        task.spawn(function() -- Line: 745
            -- upvalues: DataSaveToggle (copy)
            repeat
                wait(0.5);
            until _G.DidClientFullLoadThing;

            DataSaveToggle();
        end);
        u3:WaitForChild("Bounty"):WaitForChild("Amount"):GetPropertyChangedSignal("Value"):Connect(Update);
        serverInfoDo();
        Events:WaitForChild("Notification").OnClientEvent:Connect(SendNotif);
        Events2:WaitForChild("Notification").Event:Connect(SendNotif);
        Events:WaitForChild("UpdateClient").OnClientEvent:Connect(UpdateClient);
        LocalPlayer.CharacterAdded:Connect(newChar);
        u3:WaitForChild("NextAllowance"):GetPropertyChangedSignal("Value"):Connect(AllowanceChange);
        u3.NextAllowance:WaitForChild("Claim"):GetPropertyChangedSignal("Value"):Connect(AllowanceChange);
        u3:WaitForChild("DoubleXP").Changed:Connect(DoubleXPHandler);
        u3.DoubleXP:WaitForChild("Timer"):GetPropertyChangedSignal("Value"):Connect(function() -- Line: 764
            -- upvalues: UpdateDoubleXP (copy)
            UpdateDoubleXP();
        end);
        u3.DoubleXP:WaitForChild("Perm").Changed:Connect(UpdateDoubleXP);
        DoubleXPHandler(u3.DoubleXP.Value);
        DropCash:WaitForChild("Frame").TextButton.MouseButton1Down:Connect(DropCashFunc);
        DropCash.Frame.TextBox:GetPropertyChangedSignal("Text"):Connect(function() -- Line: 771
            -- upvalues: DropCash (copy)
            local v77 = DropCash.Frame.TextBox.Text:gsub("[^%-%d]", "");
            local string_sub_ret = string.sub(v77, 0, 3);
            DropCash.Frame.TextBox.Text = string_sub_ret;
        end);
        DropCash.ToggleButton.MouseButton1Down:Connect(function() -- Line: 777
            -- upvalues: DropCash (copy), UISounds (copy)
            DropCash.Frame.Visible = not DropCash.Frame.Visible;
            UISounds.click:Play();
            DropCash.Frame.TextBox.Text = "";
        end);

        local function StatsToggle() -- Line: 784
            -- upvalues: u7 (ref), u8 (ref), u5 (ref), Frame (copy), u2 (copy), u6 (ref), Events2 (copy)
            if not u7 or u8 then
                return;
            end;

            u8 = true;

            if u5 then
                Frame.ToggleButton.Pull.Text = "»";
                Frame:TweenPosition(UDim2.new(-1, 0, Frame.Position.Y.Scale, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true);
            else
                Frame.ToggleButton.Pull.Text = "«";
                Frame:TweenPosition(UDim2.new(0, 0, Frame.Position.Y.Scale, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true);
            end;

            task.delay(0.5, function() -- Line: 795
                -- upvalues: u7 (ref), u2 (ref), u5 (ref), Frame (ref), u8 (ref)
                if u7 then
                    u2.StatsToggleButton.Visible = not u5;
                    Frame.ToggleButton.Visible = u5;
                end;

                u8 = false;
            end);
            u5 = not u5;
            u6 = u5;

            if u5 then
                u2.StatsToggleButton.Visible = false;
            else
                Frame.ToggleButton.Visible = false;
            end;

            _G.StatsFrameOpen = u5;
            Events2.StatsToggled:fire(u5);
        end;

        _G.StatsFrameOpen = true;
        Frame.ToggleButton.MouseButton1Down:Connect(StatsToggle);
        u2.StatsToggleButton.MouseButton1Down:Connect(StatsToggle);
        local ToggleButton = Container:WaitForChild("Store"):WaitForChild("ToggleButton");
        ToggleButton.MouseButton1Down:Connect(function() -- Line: 823
            -- upvalues: ToggleButton (copy), Events2 (copy)
            if ToggleButton:FindFirstChild("Hint") then
                ToggleButton.Hint.Visible = false;
            end;

            Events2.ToggleStoreUI:Fire();
        end);
        local ToggleButton2 = Container:WaitForChild("Skins"):WaitForChild("ToggleButton");
        ToggleButton2.MouseButton1Down:Connect(function() -- Line: 833
            -- upvalues: ToggleButton2 (copy), Events2 (copy)
            if ToggleButton2:FindFirstChild("Hint") then
                ToggleButton2.Hint.Visible = false;
            end;

            Events2.ToggleSkinsUI:Fire();
        end);
        local ToggleButton3 = Container:WaitForChild("FreeUGC"):WaitForChild("ToggleButton");
        ToggleButton3.MouseButton1Down:Connect(function() -- Line: 843
            -- upvalues: ToggleButton3 (copy), UgcEvent (copy)
            if ToggleButton3:FindFirstChild("Hint") then
                ToggleButton3.Hint.Visible = false;
            end;

            UgcEvent.toggle();
        end);
        local u78 = 0;
        Events.LevelUp.OnClientEvent:Connect(function(p79, p80) -- Line: 865, Name: levelUp
            -- upvalues: u2 (copy), ReplicatedStorage (ref), UISounds (copy), AddCommas (copy), u78 (ref), TweenService (ref), LevelFrame (copy), UpdateLevelDes (copy)
            if u2:FindFirstChild("LevelUpFrame") then
                u2.LevelUpFrame:Destroy();
            end;

            local v81 = ReplicatedStorage.Storage.GUIs.LevelUpFrame:Clone();
            local Frame22 = v81:WaitForChild("Frame2");
            UISounds.level_up:Play();
            Frame22.Level.Text = tostring(p79);
            Frame22.Reward.Text = "+$<b>" .. AddCommas(p80) .. "</b>";
            local math_random_ret = math.random();
            u78 = math_random_ret;
            local v82 = TweenService:Create(Frame22.Level, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 50, true), {
                TextColor3 = Color3.fromRGB(162, 193, 255)
            });
            local v83 = TweenService:Create(Frame22.TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 50, true), {
                TextColor3 = Color3.fromRGB(255, 255, 255)
            });
            local v84 = TweenService:Create(Frame22.Reward, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 50, true), {
                TextColor3 = Color3.fromRGB(185, 255, 191)
            });
            LevelFrame.Visible = false;
            v82:Play();
            v83:Play();
            v84:Play();
            v81.Parent = u2;
            game.Debris:AddItem(v81, 10);
            Frame22:TweenPosition(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.5, true);
            delay(5, function() -- Line: 900
                -- upvalues: Frame22 (copy), u78 (ref), math_random_ret (copy), LevelFrame (ref)
                if Frame22 and (Frame22.Parent and u78 == math_random_ret) then
                    Frame22:TweenPosition(UDim2.new(0, 0, -1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Back, 0.5, true);
                    wait(0.5);
                    LevelFrame.Visible = true;
                end;
            end);
            UpdateLevelDes();
        end);
        Events.GotXP.OnClientEvent:Connect(function(p85) -- Line: 914
            -- upvalues: UISounds (copy), u3 (ref), LevelFrame (copy), TweenService (ref)
            if typeof(p85) ~= "number" or p85 <= 0 then
                return;
            end;

            UISounds.change:Play();
            local v86 = script.XP_Label:Clone();

            if u3 and u3.DoubleXP.Value then
                v86.TextColor3 = Color3.fromRGB(255, 170, 0);
            end;

            game.Debris:AddItem(v86, 2);
            v86.Text = "+" .. tostring(p85);
            v86.Position = UDim2.new(v86.Position.X.Scale, math.random(-150, 150), v86.Position.Y.Scale, v86.Position.Y.Offset);
            v86.Parent = LevelFrame;
            TweenService:Create(v86, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 1), {
                TextTransparency = 1,
                TextStrokeTransparency = 1,
                Position = UDim2.new(v86.Position.X.Scale, v86.Position.X.Offset, v86.Position.Y.Scale, v86.Position.Y.Offset + 65)
            }):Play();
        end);

        local function HandleReturnFrame() -- Line: 930
            -- upvalues: u2 (copy), Container (copy), Events2 (copy), UISounds (copy), GamepadService (ref), Events (copy)
            local ReturnFrame = u2:WaitForChild("ReturnFrame");
            local ToggleButton4 = Container:WaitForChild("Return").ToggleButton;
            local u87 = false;

            local function ToggleGUI(p88) -- Line: 938
                -- upvalues: u87 (ref), Events2 (ref), ReturnFrame (copy), UISounds (ref), GamepadService (ref)
                if p88 == nil then
                    p88 = not u87;
                end;

                if p88 == u87 then
                    return;
                end;

                if p88 and (_G.IsSkinTradeActive and _G.IsSkinTradeActive()) then
                    return;
                end;

                u87 = p88;

                if u87 then
                    Events2.ToggleSettingsUI:Fire(false);
                    Events2.ToggleStoreUI:Fire(false);
                    Events2.ToggleSkinsUI:Fire(false);
                end;

                ReturnFrame.Visible = u87;

                if u87 then
                    UISounds.open:Play();
                    pcall(function() -- Line: 953
                        -- upvalues: GamepadService (ref), ReturnFrame (ref)
                        if _G.InputType == 2 then
                            GamepadService:EnableGamepadCursor(ReturnFrame);
                        end;
                    end);

                    return;
                end;

                UISounds.close:Play();
                GamepadService:DisableGamepadCursor();
            end;

            local u89 = false;
            ToggleButton4.MouseButton1Down:Connect(function() -- Line: 966
                -- upvalues: u89 (ref), ToggleGUI (copy)
                if u89 then
                    return;
                end;

                ToggleGUI();
            end);
            ReturnFrame.CloseButton.MouseButton1Down:Connect(function() -- Line: 973
                -- upvalues: u89 (ref), ToggleGUI (copy)
                if u89 then
                    return;
                end;

                ToggleGUI();
            end);
            ReturnFrame.ReturnButton.TextButton.MouseButton1Down:Connect(function() -- Line: 978
                -- upvalues: u89 (ref), UISounds (ref), Events (ref)
                if u89 then
                    return;
                end;

                u89 = true;
                UISounds.click:Play();
                pcall(Events.RCTNMEUN.InvokeServer, Events.RCTNMEUN);
                task.wait(3);
                u89 = false;
            end);
            Events2.ToggleReturnMenu.Event:Connect(function(p90) -- Line: 988
                -- upvalues: ToggleGUI (copy)
                ToggleGUI(p90);
            end);
        end;

        function _G.CheckIfMobile() -- Line: 993
            -- upvalues: u2 (copy)
            local v91;

            if _G.DeviceType == 3 then
                v91 = u2.AbsoluteSize.X < 900 and true or u2.AbsoluteSize.Y < 500;
            else
                v91 = false;
            end;

            return v91;
        end;

        local function UpdateNotifFrame() -- Line: 997
            -- upvalues: NotificationFrame (copy)
            if _G.CheckIfMobile() then
                NotificationFrame.UIScale.Scale = 0.7;
            else
                NotificationFrame.UIScale.Scale = 1;
            end;

            if _G.DeviceType == 3 then
                NotificationFrame.Position = UDim2.new(NotificationFrame.Position.X.Scale, NotificationFrame.Position.X.Offset, 0, 50);
                NotificationFrame.UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top;

                return;
            end;

            NotificationFrame.Position = UDim2.new(NotificationFrame.Position.X.Scale, NotificationFrame.Position.X.Offset, 0.5, 0);
            NotificationFrame.UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom;
        end;

        UpdateNotifFrame();
        Events2.InputTypeChanged.Event:Connect(UpdateNotifFrame);
        spawn(HandleReturnFrame);

        if not u3.Loaded.Value then
            u3.Loaded:GetPropertyChangedSignal("Value"):Wait();
        end;

        local v92 = { "RemoveStoreButton", "RemoveDropCashButton", "RemoveBank", "RemoveCash", "RemoveBounty", "RemoveAllowance", "VisibleFreeUGC", "VisiblePoints", "VisibleTokens" };
        local u93 = {};

        for _, child in pairs(ReplicatedStorage.Values:GetChildren()) do
            local v94 = child;

            for _, v in pairs(v92) do
                if string.find(v94.Name, v) then
                    u93[v] = v94;
                end;
            end;
        end;

        local u95 = {
            Size = Frame.BG.Size,
            Position = Frame.BG.Position,
            AnchorPoint = Frame.BG.AnchorPoint
        };

        local function UpdateUIButtons() -- Line: 1047
            -- upvalues: u93 (copy), Frame (copy), u95 (copy), Container (copy)
            local v96 = {
                Store = u93.RemoveStoreButton.Value,
                DropCash = u93.RemoveDropCashButton.Value,
                Bank = u93.RemoveBank.Value,
                Cash = u93.RemoveCash.Value,
                Bounty = u93.RemoveBounty.Value,
                Allowance = u93.RemoveAllowance.Value,
                FreeUGC = not u93.VisibleFreeUGC.Value,
                Points = not u93.VisiblePoints.Value,
                Tokens = not u93.VisibleTokens.Value
            };
            Frame.BG.Size = u95.Size;
            Frame.BG.Position = u95.Position;
            Frame.BG.AnchorPoint = u95.AnchorPoint;

            for i, v in pairs(v96) do
                local v97 = Container[i];

                if v == true then
                    v97.Visible = false;
                    local _ = v97.Size.Y.Scale;
                else
                    v97.Visible = true;
                end;
            end;

            local v98 = 0;

            for _, child in pairs(Container:GetChildren()) do
                if child:IsA("Frame") and child.Visible then
                    v98 = v98 + child.Size.Y.Scale;
                end;
            end;

            Frame.BG.Size = UDim2.new(u95.Size.X.Scale, u95.Size.X.Offset, math.min(v98 * 1.1, 1.29), u95.Size.Y.Offset);
        end;

        for _, v in pairs(u93) do
            v.Changed:Connect(UpdateUIButtons);
        end;

        UpdateUIButtons();

        local function ShowRegionNote(p99) -- Line: 1100
            -- upvalues: ClientFrame (copy)
            ClientFrame.RegionNote.Frame.Visible = p99;
            ClientFrame.RegionNote.BackgroundTransparency = p99 and 0.25 or 0.5;
        end;

        ClientFrame.RegionNote.MouseEnter:Connect(function() -- Line: 1105
            -- upvalues: ClientFrame (copy)
            ClientFrame.RegionNote.Frame.Visible = true;
            ClientFrame.RegionNote.BackgroundTransparency = 0.25;
        end);
        ClientFrame.RegionNote.MouseLeave:Connect(function() -- Line: 1108
            -- upvalues: ClientFrame (copy)
            ClientFrame.RegionNote.Frame.Visible = false;
            ClientFrame.RegionNote.BackgroundTransparency = 0.5;
        end);
        ClientFrame.RegionNote.SelectionGained:Connect(function() -- Line: 1111
            -- upvalues: ClientFrame (copy)
            ClientFrame.RegionNote.Frame.Visible = true;
            ClientFrame.RegionNote.BackgroundTransparency = 0.25;
        end);
        ClientFrame.RegionNote.SelectionLost:Connect(function() -- Line: 1114
            -- upvalues: ClientFrame (copy)
            ClientFrame.RegionNote.Frame.Visible = false;
            ClientFrame.RegionNote.BackgroundTransparency = 0.5;
        end);
        StatsFrame.Visible = true;
        LevelFrame.Visible = true;

        repeat
            task.wait(0.25);
            Events.UpdateClient:FireServer();
        until u9 > 0;
    end
};
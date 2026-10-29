-- ============================================================
-- SCRIPT: Kill
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface.Modules.Kill
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 16
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
local TweenService = game:GetService("TweenService");
local ContentProvider = game:GetService("ContentProvider");
local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local _ = game.Players.LocalPlayer;
local KillEvent = ReplicatedStorage:WaitForChild("Events"):WaitForChild("KillEvent");

return {
    new = function(p2) -- Line: 44, Name: new
        -- upvalues: ReplicatedStorage (copy), ContentProvider (copy), Players (copy), TweenService (copy), KillEvent (copy)
        local KillFrame = p2:WaitForChild("KillFrame");
        local u3 = ReplicatedStorage:WaitForChild("Storage"):WaitForChild("GUIs").KillTemplate:Clone();
        local UISounds = ReplicatedStorage:WaitForChild("Storage"):WaitForChild("UISounds");
        local ViewportCharacter = require(ReplicatedStorage:WaitForChild("NewModules").Client.Services.ViewportCharacter);

        local function FormatImage(p4) -- Line: 53
            return "https://www.roblox.com/headshot-thumbnail/image?userId=" .. p4 .. "&width=150&height=150&format=png";
        end;

        local function LoadStuff(p5) -- Line: 57
            -- upvalues: ContentProvider (ref)
            ContentProvider:Preload("https://www.roblox.com/headshot-thumbnail/image?userId=" .. p5 .. "&width=150&height=150&format=png");
        end;

        local u6 = 0;

        local function Load() -- Line: 63
            -- upvalues: ContentProvider (ref), Players (ref)
            local function preload(p7) -- Line: 64
                -- upvalues: ContentProvider (ref)
                ContentProvider:Preload("https://www.roblox.com/headshot-thumbnail/image?userId=" .. p7 .. "&width=150&height=150&format=png");
            end;

            local function loadPlr(u8) -- Line: 68
                -- upvalues: ContentProvider (ref)
                spawn(function() -- Line: 69
                    -- upvalues: u8 (copy), ContentProvider (ref)
                    ContentProvider:Preload("https://www.roblox.com/headshot-thumbnail/image?userId=" .. u8.UserId .. "&width=150&height=150&format=png");
                end);
            end;

            for _, v in pairs(Players:GetPlayers()) do
                spawn(function() -- Line: 69
                    -- upvalues: v (copy), ContentProvider (ref)
                    ContentProvider:Preload("https://www.roblox.com/headshot-thumbnail/image?userId=" .. v.UserId .. "&width=150&height=150&format=png");
                end);
            end;

            Players.PlayerAdded:Connect(loadPlr);
        end;

        KillEvent.OnClientEvent:Connect(function(p9, p10, p11, p12, p13, p14, p15) -- Line: 80, Name: Do
            -- upvalues: u3 (copy), KillFrame (copy), u6 (ref), ReplicatedStorage (ref), ViewportCharacter (copy), TweenService (ref), UISounds (copy)
            local v16 = u3:Clone();
            local Frame2 = v16.Frame2;
            local _ = #KillFrame:GetChildren();

            if u6 >= 3 then
                KillFrame.ChildRemoved:Wait();

                repeat
                    KillFrame.ChildRemoved:Wait();
                until u6 < 3;
            end;

            u6 = u6 + 1;
            Frame2.KillLabel.Text = p11 .. ": <b><font size=\"13\"><font color=\"rgb(255,0,0)\">" .. p9 .. "</font></font></b>";

            if p12 and p12 > 0 then
                local v17;

                if ReplicatedStorage.Values.CashPointsReplace.Value then
                    Frame2.CXPF.CashNum.TextColor3 = Color3.new(1, 1, 1);
                    v17 = "";
                else
                    v17 = "$";
                end;

                Frame2.CXPF.CashNum.Text = `+<b>{v17}{p12}</b>`;
            else
                Frame2.CXPF.CashNum.Visible = false;
            end;

            if p13 and p13 > 0 then
                Frame2.CXPF.XPNum.Text = "+<b>" .. p13 .. "XP</b>";
            else
                Frame2.CXPF.XPNum.Visible = false;
            end;

            local u18 = true;

            if p15 and (p15.Parent and p15:FindFirstChild("Head")) then
                ViewportCharacter(p15, Frame2.ViewportFrame, 3, 40);
                u18 = false;
            else
                Frame2.ImageLabel.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. p10 .. "&width=150&height=150&format=png";
            end;

            v16.Parent = KillFrame;
            local Quint = Enum.EasingStyle.Quint;
            local Out = Enum.EasingDirection.Out;
            local InOut = Enum.EasingDirection.InOut;

            local function tw(p19, p20, p21, p22, p23, p24, p25, p26) -- Line: 130
                -- upvalues: TweenService (ref)
                TweenService:Create(p19, TweenInfo.new(p21, p22, p23, p24 or 0, p25 or false, p26 or 0), p20):Play();
            end;

            if _G.GSettings and not _G.GSettings.NameTags then
                Frame2.KillLabel.Visible = false;
                Frame2.CXPF.AnchorPoint = Vector2.new(0, 0.5);
                Frame2.CXPF.Position = UDim2.new(Frame2.CXPF.Position.X.Scale, Frame2.CXPF.Position.X.Offset, 0.5, 0);
                Frame2.CXPF.CashNum.TextSize = 15;
                Frame2.CXPF.XPNum.TextSize = 15;
            end;

            Frame2:TweenPosition(UDim2.new(0.05, 0, 0.05, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 0.65, true);
            TweenService:Create(Frame2, TweenInfo.new(0.75, Quint, InOut, 0, false, 0), {
                BackgroundTransparency = 0.5
            }):Play();

            if u18 then
                TweenService:Create(Frame2.ImageLabel, TweenInfo.new(0.75, Quint, InOut, 0, false, 0), {
                    BackgroundTransparency = 1,
                    ImageTransparency = 0
                }):Play();
            else
                TweenService:Create(Frame2.ViewportFrame, TweenInfo.new(0.75, Quint, InOut, 0, false, 0), {
                    BackgroundTransparency = 1,
                    ImageTransparency = 0
                }):Play();
            end;

            TweenService:Create(Frame2.BG2, TweenInfo.new(0.75, Quint, InOut, 0, false, 0), {
                BackgroundTransparency = 1,
                ImageTransparency = 0
            }):Play();
            TweenService:Create(Frame2.BG, TweenInfo.new(0.75, Quint, InOut, 0, false, 0), {
                BackgroundTransparency = 1,
                ImageTransparency = 0
            }):Play();
            TweenService:Create(Frame2.KillLabel, TweenInfo.new(0.75, Quint, InOut, 0, false, 0), {
                TextTransparency = 0,
                TextStrokeTransparency = 0.5
            }):Play();
            TweenService:Create(Frame2.CXPF.CashNum, TweenInfo.new(0.75, Quint, InOut, 0, false, 0), {
                TextTransparency = 0.15,
                TextStrokeTransparency = 0.5
            }):Play();
            TweenService:Create(Frame2.CXPF.XPNum, TweenInfo.new(0.75, Quint, InOut, 0, false, 0), {
                TextTransparency = 0.15,
                TextStrokeTransparency = 0.5
            }):Play();
            TweenService:Create(Frame2.EF, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, true, 0), {
                BackgroundTransparency = 0.5
            }):Play();
            delay(7, function() -- Line: 162
                -- upvalues: Frame2 (copy), Quint (copy), Out (copy), TweenService (ref), u18 (ref)
                if Frame2 and Frame2.Parent then
                    Frame2:TweenPosition(UDim2.new(0.05, 0, 1.05, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 0.5, true);
                    TweenService:Create(Frame2, TweenInfo.new(0.4, Quint, Out, 0, false, 0), {
                        BackgroundTransparency = 1
                    }):Play();

                    if u18 then
                        TweenService:Create(Frame2.ImageLabel, TweenInfo.new(0.4, Quint, Out, 0, false, 0), {
                            BackgroundTransparency = 1,
                            ImageTransparency = 0
                        }):Play();
                    else
                        TweenService:Create(Frame2.ViewportFrame, TweenInfo.new(0.4, Quint, Out, 0, false, 0), {
                            BackgroundTransparency = 1,
                            ImageTransparency = 0
                        }):Play();
                    end;

                    TweenService:Create(Frame2.BG2, TweenInfo.new(0.4, Quint, Out, 0, false, 0), {
                        BackgroundTransparency = 1,
                        ImageTransparency = 1
                    }):Play();
                    TweenService:Create(Frame2.BG, TweenInfo.new(0.4, Quint, Out, 0, false, 0), {
                        BackgroundTransparency = 1,
                        ImageTransparency = 1
                    }):Play();
                    TweenService:Create(Frame2.KillLabel, TweenInfo.new(0.4, Quint, Out, 0, false, 0), {
                        TextTransparency = 1,
                        TextStrokeTransparency = 1
                    }):Play();
                    TweenService:Create(Frame2.CXPF.CashNum, TweenInfo.new(0.4, Quint, Out, 0, false, 0), {
                        TextTransparency = 1,
                        TextStrokeTransparency = 1
                    }):Play();
                    TweenService:Create(Frame2.CXPF.XPNum, TweenInfo.new(0.4, Quint, Out, 0, false, 0), {
                        TextTransparency = 1,
                        TextStrokeTransparency = 1
                    }):Play();
                end;
            end);
            game.Debris:AddItem(v16, 7.5);
            delay(6.99, function() -- Line: 188
                -- upvalues: u6 (ref)
                u6 = u6 - 1;
            end);
            local u27 = UISounds.kill_sound:Clone();
            u27.Parent = script;
            u27:Play();
            u27.Ended:Once(function() -- Line: 195
                -- upvalues: u27 (copy)
                u27:Destroy();
            end);
            game:GetService("Debris"):AddItem(u27, 30);
        end);
        KillFrame.Visible = true;
        Load();
    end
};
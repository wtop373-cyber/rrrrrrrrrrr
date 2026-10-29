-- ============================================================
-- SCRIPT: Radio
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Radio
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
local RunService = game:GetService("RunService");
local TweenService = game:GetService("TweenService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local LocalPlayer = game.Players.LocalPlayer;
local Events = ReplicatedStorage:WaitForChild("Events");
local MonitorBoombox = Events:WaitForChild("MonitorBoombox");
local PlayBoombox = Events:WaitForChild("PlayBoombox");
local workspace_CurrentCamera = workspace.CurrentCamera;
local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect", workspace_CurrentCamera);
local BlurEffect = Instance.new("BlurEffect", workspace_CurrentCamera);
BlurEffect.Size = 0;
local u2 = setmetatable({}, {
    __mode = "k"
});
local NumberValue = Instance.new("NumberValue", script);
local u3 = false;
local u4 = {};
local u5 = 0;
local u6 = nil;
local u7 = nil;

repeat
    task.wait(0.5);
until _G.WaitForChar and _G.GVF;

local function newChar(p8) -- Line: 44
    -- upvalues: u6 (ref), NumberValue (copy), LocalPlayer (copy), u7 (ref)
    task.wait();

    if not (p8 and p8.Parent) then
        return;
    end;

    pcall(function() -- Line: 49
        -- upvalues: u6 (ref)
        u6:Cancel();
    end);
    NumberValue.Value = 0;
    _G.WaitForChar();
    local _G_GVF_ret = _G.GVF();
    local v9 = tick();

    while not (_G_GVF_ret and _G_GVF_ret:FindFirstChild("FOVs")) and tick() - v9 < 15 do
        task.wait(0.25);

        if LocalPlayer.Character ~= p8 then
            return;
        end;

        _G_GVF_ret = _G.GVF();
    end;

    if LocalPlayer.Character ~= p8 then
        return;
    end;

    if _G_GVF_ret then
        _G_GVF_ret = _G_GVF_ret:FindFirstChild("FOVs");
    end;

    if not _G_GVF_ret then
        return;
    end;

    u7 = Instance.new("NumberValue", _G_GVF_ret);
end;

LocalPlayer.CharacterAdded:Connect(newChar);
task.spawn(newChar, LocalPlayer.Character);

local function u23() -- Line: 68
    -- upvalues: u7 (ref), workspace_CurrentCamera (copy), u4 (copy), u6 (ref), TweenService (copy), NumberValue (copy), BlurEffect (copy), ColorCorrectionEffect (copy)
    if u7 and u7.Parent then
        local u10 = 0;
        local u11 = {};

        local function Do(p12) -- Line: 73
            -- upvalues: workspace_CurrentCamera (ref), u11 (copy), u10 (ref)
            local v13 = p12[1];
            local Parent = v13.Parent;
            local v14 = p12[2];

            if not v14 then
                return;
            end;

            if not (v13 and v13.Parent) then
                return;
            end;

            local v15 = (1 - math.clamp(((v13.Parent.Position - workspace_CurrentCamera.CFrame.Position).Magnitude + 3) / v14.Shake.MaxDist, 0.01, 1)) * v13.PlaybackLoudness / 5 * v14.Shake.Multi;
            u11[v13] = v15;
            u10 = u10 + v15;
            local v16 = Parent:FindFirstChildWhichIsA("SpecialMesh");

            if v16 then
                local Ori = v16:FindFirstChild("Ori");
                local Ori2 = v16:FindFirstChild("Ori2");

                if not Ori then
                    Ori = Instance.new("Vector3Value", v16);
                    Ori.Name = "Ori";
                    Ori.Value = v16.Scale;
                end;

                if not Ori2 then
                    Ori2 = Instance.new("Vector3Value", v16);
                    Ori2.Name = "Ori2";
                    Ori2.Value = v16.VertexColor;
                end;

                local v17 = u10 / 50;
                v16.Scale = Ori.Value + Vector3.new(v17, v17, v17);
                v16.Offset = Vector3.new(0, v14.Shake.Offset1 + v17 / v14.Shake.Offset2, 0);
                v16.VertexColor = Vector3.new(Ori2.Value.X * 0.85 + v17, Ori2.Value.Y, Ori2.Value.Z);
            end;
        end;

        for _, v in pairs(u4) do
            Do(v);
        end;

        pcall(function() -- Line: 114
            -- upvalues: u6 (ref)
            u6:Cancel();
        end);
        u6 = TweenService:Create(NumberValue, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
            Value = u10
        });
        u6:Play();
        u10 = NumberValue.Value;
        local CFrame2 = workspace_CurrentCamera.CFrame;
        local CFrame_Angles = CFrame.Angles;
        local v18 = math.random(-u10, u10) * 0.01;
        local v19 = CFrame2 * CFrame_Angles(0, 0, (math.rad(v18)));
        local v20 = math.random(-u10 * 0.05, u10 * 0.05) * 0.05;
        local math_rad_ret = math.rad(v20);
        local v21 = math.random(-u10 * 0.05, u10 * 0.05) * 0.05;
        local math_rad_ret2 = math.rad(v21);
        local v22 = math.random(-u10 * 0.05, u10 * 0.05) * 0.05;
        local math_rad_ret3 = math.rad(v22);
        workspace_CurrentCamera.CFrame = v19 + Vector3.new(math_rad_ret, math_rad_ret2, math_rad_ret3);
        u7.Value = u10 * 0.1;
        BlurEffect.Size = u10 * 0.1;
        ColorCorrectionEffect.Brightness = u10 * 0.001;
    end;
end;

local function eee() -- Line: 135
    -- upvalues: u5 (ref), u3 (ref), RunService (copy), u23 (copy)
    if u5 > 0 then
        if not u3 then
            u3 = true;
            RunService:BindToRenderStep("BoomboxTing", 10000, u23);
        end;

        return;
    end;

    u3 = false;
    pcall(function() -- Line: 138
        -- upvalues: RunService (ref)
        RunService:UnbindFromRenderStep("BoomboxTing");
    end);
end;

PlayBoombox.OnClientEvent:Connect(function(p24, p25) -- Line: 145
    if p25 == "Play" then
        p24:Play();

        return;
    end;

    if p25 == "Pause" then
        p24:Pause();

        return;
    end;

    if p25 == "Resume" then
        p24:Resume();

        return;
    end;

    if p25 == "Stop" then
        p24:Stop();
    end;
end);
MonitorBoombox.OnClientEvent:Connect(function(u26, u27) -- Line: 157
    -- upvalues: u4 (copy), u5 (ref), u2 (copy), u3 (ref), RunService (copy), u23 (copy)
    if u4[u26] then
        u4[u26][2] = u27;
    else
        u4[u26] = { u26, u27 };
        u5 = u5 + 1;
    end;

    if not u2[u26] then
        u2[u26] = true;
        u26.AncestryChanged:Connect(function(p28, p29) -- Line: 167
            -- upvalues: u4 (ref), u26 (copy), u5 (ref), u27 (copy), u3 (ref), RunService (ref), u23 (ref)
            if p29 == nil and u4[u26] then
                u4[u26] = nil;
                u5 = u5 - 1;
            elseif not u4[u26] then
                u4[u26] = { u26, u27 };
                u5 = u5 + 1;
            end;

            if u5 > 0 then
                if not u3 then
                    u3 = true;
                    RunService:BindToRenderStep("BoomboxTing", 10000, u23);
                end;

                return;
            end;

            u3 = false;
            pcall(function() -- Line: 138
                -- upvalues: RunService (ref)
                RunService:UnbindFromRenderStep("BoomboxTing");
            end);
        end);
    end;

    if u5 > 0 then
        if not u3 then
            u3 = true;
            RunService:BindToRenderStep("BoomboxTing", 10000, u23);
        end;

        return;
    end;

    u3 = false;
    pcall(function() -- Line: 138
        -- upvalues: RunService (ref)
        RunService:UnbindFromRenderStep("BoomboxTing");
    end);
end);

return nil;
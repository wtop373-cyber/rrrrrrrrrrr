-- ============================================================
-- SCRIPT: Crosshair
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface.Modules.Crosshair
-- ============================================================

-- Decompiled with Potassium's decompiler.

local GuiService = game:GetService("GuiService");
local UserInputService = game:GetService("UserInputService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
game:GetService("TweenService");
local RunService = game:GetService("RunService");
local Workspace = game:GetService("Workspace");
local Players = game:GetService("Players");
game:GetService("Lighting");
game:GetService("Debris");
local LocalPlayer = Players.LocalPlayer;
local Mouse = LocalPlayer:GetMouse();
local CurrentCamera = Workspace.CurrentCamera;
Workspace:WaitForChild("Debris");
ReplicatedStorage:WaitForChild("Events2");
ReplicatedStorage:WaitForChild("Events");
local CoreGUI = script.Parent.Parent.CoreGUI;
local Crosshair = CoreGUI:WaitForChild("Crosshair");
local script_CrosshairModule = require(script.CrosshairModule);
_G.CrosshairModule = script_CrosshairModule;
_G.WaitForChar();
local u1 = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait();
local HumanoidRootPart = u1:WaitForChild("HumanoidRootPart");
local u2 = nil;
LocalPlayer.CharacterAdded:Connect(function(p3) -- Line: 41
    -- upvalues: script_CrosshairModule (copy), UserInputService (copy), Crosshair (copy), u1 (ref), HumanoidRootPart (ref), u2 (ref)
    script_CrosshairModule:clearup();
    UserInputService.MouseIconEnabled = true;

    for _, child in Crosshair:GetChildren() do
        if child.Name == "Main" and (not script_CrosshairModule.default or child ~= script_CrosshairModule.default.crossFrame) then
            child:Destroy();
        end;
    end;

    u1 = p3;
    HumanoidRootPart = p3:WaitForChild("HumanoidRootPart");
    u2 = HumanoidRootPart:WaitForChild("CamShakePart", 30);
end);
local u4 = script_CrosshairModule.new(true);
u4:hideall();
spawn(function() -- Line: 59
    -- upvalues: u2 (ref), HumanoidRootPart (ref)
    u2 = HumanoidRootPart:WaitForChild("CamShakePart", 30);
end);
_G.DCH = u4;
local u5 = false;
local u6 = false;

local function WorldToScreen(p7) -- Line: 70
    -- upvalues: CurrentCamera (copy)
    local v8 = CFrame.new():PointToObjectSpace(p7);
    local v9 = CurrentCamera.ViewportSize.X / CurrentCamera.ViewportSize.Y;
    local v10 = math.rad(CurrentCamera.FieldOfView) / 2;
    local math_tan_ret = math.tan(v10);
    local v11 = v8.y / v8.z / math_tan_ret;

    return Vector2.new(math.floor(CurrentCamera.ViewportSize.X * (0.5 + 0.5 * (v8.x / v8.z / -(v9 * math_tan_ret))) + 0.5), (math.floor(CurrentCamera.ViewportSize.Y * (0.5 + 0.5 * v11))));
end;

local GuiInset = GuiService:GetGuiInset();

local function updateMouse() -- Line: 84
    -- upvalues: CurrentCamera (copy), u2 (ref), u5 (ref), Crosshair (copy), WorldToScreen (copy), GuiInset (copy), Mouse (copy), u6 (ref)
    local _ = CurrentCamera.CFrame;
    local v12 = u2 and u2.Parent;
    local v13;

    if v12 and (math.abs(u2.Motor6D.Transform.X) > 0 or (math.abs(u2.Motor6D.Transform.X) > 0 or math.abs(u2.Motor6D.Transform.Z) > 0)) then
        v13 = true;
        u5 = false;
    else
        v13 = false;
    end;

    if _G.CustomMouseUIPos then
        Crosshair.Position = _G.CustomMouseUIPos;
    elseif _G.M_MLCheck() then
        if not u5 then
            local v14, _ = CurrentCamera:WorldToScreenPoint(_G.MousePoint or Vector3.new());
            _G.MouseVector = v14;

            if v12 and v13 then
                u5 = false;
                local v15 = WorldToScreen((u2.Motor6D.Transform:Lerp(CFrame.new(), 0.5):Inverse() * CFrame.new(0, 0, -5)).Position);
                local v16 = CurrentCamera.ViewportSize / 2;
                Crosshair.Position = (v15 - v16).Magnitude >= 1 and UDim2.new(0, v15.X, 0, v15.Y) or UDim2.new(0, v16.X, 0, v16.Y);
            else
                Crosshair.Position = UDim2.new(0, v14.X, 0, v14.Y + GuiInset.Y);
            end;
        end;
    else
        _G.MouseVector = nil;
        u5 = false;
        Crosshair.Position = UDim2.new(0, Mouse.X, 0, Mouse.Y + GuiInset.Y);
    end;

    u6 = false;
end;

Mouse.Move:Connect(function() -- Line: 142
    -- upvalues: u6 (ref)
    u6 = true;
end);
UserInputService.MouseIconEnabled = true;
RunService:BindToRenderStep("FP_MouseMove", Enum.RenderPriority.Camera.Value - 4, updateMouse);

local function UpdateInput() -- Line: 150
    -- upvalues: CoreGUI (copy), script_CrosshairModule (copy)
    if CoreGUI and (CoreGUI.Parent and CoreGUI:FindFirstChild("Crosshair")) then
        if script_CrosshairModule.mE and (_G.InputType == 3 and _G.FP or _G.M_MLCheck()) then
            CoreGUI.Crosshair.MobileCenter.Visible = true;

            return;
        end;

        CoreGUI.Crosshair.MobileCenter.Visible = false;
    end;
end;

UserInputService.InputBegan:Connect(function(p17, p18) -- Line: 161
    -- upvalues: UpdateInput (copy)
    UpdateInput();
end);
UserInputService.InputChanged:Connect(function() -- Line: 167
    -- upvalues: UpdateInput (copy)
    UpdateInput();
end);
CoreGUI:WaitForChild("Crosshair"):WaitForChild("MobileCenter");
ReplicatedStorage.Events2.MouseLockChanged.Event:Connect(function(p19) -- Line: 172
    -- upvalues: UpdateInput (copy)
    UpdateInput();
end);
ReplicatedStorage.Events.Hitmarker.OnClientEvent:Connect(function(p20) -- Line: 176
    -- upvalues: u4 (copy)
    u4:hitmarker(p20);
end);
ReplicatedStorage.Events.CrosshairBar.OnClientEvent:Connect(function(p21) -- Line: 180
    -- upvalues: u4 (copy)
    u4:bar(p21);
end);

return {};
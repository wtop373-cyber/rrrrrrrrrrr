-- ============================================================
-- SCRIPT: AdonisTheme
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.Shared.Utils.AdonisTheme
-- ============================================================

-- Decompiled with Potassium's decompiler.

local AdonisThemeData = require(script.Parent.AdonisThemeData);
local u1 = {};

local function build(p2) -- Line: 4
    -- upvalues: build (copy)
    local Instance_new_ret = Instance.new(p2.class);

    for i, v in p2.properties do
        Instance_new_ret[i] = v;
    end;

    for _, v in p2.children do
        build(v).Parent = Instance_new_ret;
    end;

    return Instance_new_ret;
end;

function u1.Clone(p3) -- Line: 15
    -- upvalues: build (copy), AdonisThemeData (copy)
    return build(assert(AdonisThemeData[p3], "Unknown Adonis template: " .. p3));
end;

function u1.MountScreen(p4, p5, p6) -- Line: 19
    p4.DisplayOrder = p5:WaitForChild("GobUi").DisplayOrder + (p6 or 1);
    p4.ResetOnSpawn = false;
    p4.Enabled = true;
    p4.Parent = p5;
end;

function u1.Control(p7, p8, p9) -- Line: 29
    local Instance_new_ret = Instance.new(p7);
    Instance_new_ret.BackgroundColor3 = Color3.fromRGB(31, 31, 31);
    Instance_new_ret.BorderSizePixel = 0;
    Instance_new_ret.ZIndex = 2;

    if Instance_new_ret:IsA("TextLabel") or (Instance_new_ret:IsA("TextButton") or Instance_new_ret:IsA("TextBox")) then
        Instance_new_ret.Font = Enum.Font.SourceSans;
        Instance_new_ret.TextSize = 16;
        Instance_new_ret.TextColor3 = Color3.new(1, 1, 1);
    end;

    for i, v in p8 do
        Instance_new_ret[i] = v;
    end;

    Instance_new_ret.Parent = p9;

    return Instance_new_ret;
end;

u1.Icons = {
    ["Admin panel settings"] = "rbxassetid://7495455898",
    ["Format list bulleted"] = "rbxassetid://7541574838",
    Gavel = "rbxassetid://7510979485",
    ["Hourglass full"] = "rbxassetid://7707378666",
    ["Inventory 2"] = "rbxassetid://7707390573",
    People = "rbxassetid://7549501926",
    Poll = "rbxassetid://7549517343",
    ["Priority high"] = "rbxassetid://7541925009"
};

local function iconImage(p10: string?) -- Line: 60
    -- upvalues: u1 (copy)
    if p10 then
        return u1.Icons[p10] or p10;
    end;

    return nil;
end;

local UDim2_fromOffset_ret = UDim2.fromOffset(5, 5);
local UDim2_new_ret = UDim2.new(1, -10, 1, -10);

function u1.Window(p11: any, p12: any, p13: string?) -- Line: 70
    -- upvalues: u1 (copy), UDim2_fromOffset_ret (copy), UDim2_new_ret (copy)
    local v14 = u1.Clone("Window");
    local Drag = v14.Drag;
    local Main = Drag.Main;
    local v15 = u1.Control("Frame", {
        Name = "GobWindow",
        BackgroundTransparency = 0.3,
        Size = UDim2.fromOffset(p12.X, p12.Y),
        Position = UDim2.new(0.5, -p12.X / 2, 0.5, -p12.Y / 2)
    }, nil);
    local v16 = u1.Control("Frame", {
        Name = "Holder",
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1)
    }, v15);
    Drag.Parent = v16;
    Drag.Position = UDim2.new();
    Drag.Size = UDim2.new(1, 0, 0, 25);
    Drag.Title.Text = p11;
    Drag.Refresh.Visible = false;

    if p13 then
        local v17;

        if p13 then
            v17 = u1.Icons[p13] or p13;
        else
            v17 = nil;
        end;

        Drag.Icon.Image = v17;
    end;

    Main.Parent = v16;
    Main.Position = UDim2.fromOffset(0, 25);
    Main.Size = UDim2.new(1, 0, 1, -25);
    Main.BackgroundTransparency = 1;
    local ScrollingFrame = Main.ScrollingFrame;
    ScrollingFrame.Position = UDim2_fromOffset_ret;
    ScrollingFrame.Size = UDim2_new_ret;
    ScrollingFrame.CanvasSize = UDim2.new();

    for _, child in Main:GetChildren() do
        if child ~= ScrollingFrame then
            child:Destroy();
        end;
    end;

    v14:Destroy();

    return v15, ScrollingFrame, Drag;
end;

local u18 = { "BackgroundColor3", "BackgroundTransparency", "BorderSizePixel", "BorderColor3", "Font", "TextSize", "TextColor3", "TextTransparency", "TextStrokeColor3", "TextStrokeTransparency", "TextScaled", "TextWrapped", "TextXAlignment", "TextYAlignment", "Image", "ImageTransparency", "ImageColor3" };

local function copyVisual(u19, u20) -- Line: 129
    -- upvalues: u18 (copy)
    for _, v in u18 do
        local success, result = pcall(function() -- Line: 131
            -- upvalues: u20 (copy), v (copy)
            return u20[v];
        end);

        if success and typeof(result) ~= "Instance" then
            pcall(function() -- Line: 135
                -- upvalues: u19 (copy), v (copy), result (copy)
                u19[v] = result;
            end);
        end;
    end;
end;

function u1.StyleWindow(p21: any, p22: string?) -- Line: 145
    -- upvalues: u1 (copy), copyVisual (copy), UDim2_fromOffset_ret (copy), UDim2_new_ret (copy)
    local v23 = u1.Clone("Window");
    local Holder = p21:FindFirstChild("Holder");
    local v24;

    if Holder then
        v24 = Holder:FindFirstChild("Drag");
    else
        v24 = p21:FindFirstChild("TitleBar");
    end;

    for _, descendant in p21:GetDescendants() do
        if descendant:IsA("UICorner") then
            descendant:Destroy();
        elseif descendant:IsA("TextLabel") or (descendant:IsA("TextBox") or descendant:IsA("TextButton")) then
            descendant.Font = Enum.Font.SourceSans;
            descendant.TextColor3 = Color3.new(1, 1, 1);
            descendant.BorderSizePixel = 0;

            if descendant.BackgroundTransparency < 1 then
                descendant.BackgroundColor3 = Color3.fromRGB(31, 31, 31);
            end;
        elseif descendant:IsA("ScrollingFrame") then
            descendant.BorderSizePixel = 0;
            descendant.ScrollBarThickness = 2;

            if descendant.BackgroundTransparency < 1 then
                descendant.BackgroundColor3 = Color3.fromRGB(22, 22, 22);
            end;
        end;
    end;

    p21.BackgroundColor3 = Color3.fromRGB(31, 31, 31);
    p21.BackgroundTransparency = 0.3;
    p21.BorderSizePixel = 0;

    if Holder then
        Holder.AnchorPoint = Vector2.zero;
        Holder.BackgroundTransparency = 1;
        Holder.Position = UDim2.new();
        Holder.Size = UDim2.fromScale(1, 1);
    end;

    if v24 then
        v24.AnchorPoint = Vector2.zero;
        v24.Position = UDim2.new();
        v24.Size = UDim2.new(1, 0, 0, 25);
        v24.BackgroundTransparency = 1;
        local Icon = v24:FindFirstChild("Icon");

        if Icon and not Icon:IsA("ImageButton") then
            Icon.Name = "TemplateIcon";
            Icon = nil;
        end;

        for _, child in v24:GetChildren() do
            if child:IsA("GuiObject") and (child ~= Icon and (child.Name ~= "Title" and (child.Position.X.Scale == 0 and child.Position.X.Offset < 26))) then
                child.Visible = false;
            end;
        end;

        if not Icon then
            v23.Drag.Icon:Clone().Parent = v24;
        end;

        if not (v24:FindFirstChild("Hide") or v24:FindFirstChild("Minimize")) then
            v23.Drag.Hide:Clone().Parent = v24;
        end;

        for _, v in { "Title", "Close", "Hide", "Minimize", "Refresh", "Icon" } do
            local v25 = v24:FindFirstChild(v);
            local v26 = v23.Drag:FindFirstChild(v == "Minimize" and "Hide" or v);

            if v25 and v26 then
                copyVisual(v25, v26);
                v25.AnchorPoint = v26.AnchorPoint;
                v25.Position = v26.Position;
                v25.Size = v26.Size;
                v25.ZIndex = v26.ZIndex;

                if v25:IsA("TextButton") and v ~= "Title" then
                    v25.Text = v26.Text;
                end;

                if v == "Refresh" then
                    local v27 = v25:FindFirstChildWhichIsA("ImageLabel");

                    if v27 then
                        copyVisual(v27, v26.Spinner);
                    end;
                end;
            end;
        end;

        if p22 then
            local v28;

            if p22 then
                v28 = u1.Icons[p22] or p22;
            else
                v28 = nil;
            end;

            v24.Icon.Image = v28;
        end;
    end;

    local v29;

    if Holder then
        v29 = Holder:FindFirstChild("Main");
    else
        v29 = p21:FindFirstChild("Body");
    end;

    if v29 then
        v29.AnchorPoint = Vector2.zero;
        v29.Position = UDim2.fromOffset(0, 25);
        v29.Size = UDim2.new(1, 0, 1, -25);
        v29.BackgroundTransparency = 1;
        v29.BorderSizePixel = 0;
        local ScrollingFrame = v29:FindFirstChild("ScrollingFrame");

        if ScrollingFrame then
            ScrollingFrame.AnchorPoint = Vector2.zero;
            ScrollingFrame.Position = UDim2_fromOffset_ret;
            ScrollingFrame.Size = UDim2_new_ret;
        end;
    end;

    v23:Destroy();

    return p21;
end;

local u30 = setmetatable({}, {
    __mode = "k"
});

local function getSpinner(p31: userdata?) -- Line: 257
    if p31 then
        return p31:FindFirstChildWhichIsA("ImageLabel");
    end;

    return nil;
end;

function u1.StartRefreshSpin(p32: userdata?) -- Line: 261
    -- upvalues: u30 (copy)
    local u33;

    if p32 then
        u33 = p32:FindFirstChildWhichIsA("ImageLabel");
    else
        u33 = nil;
    end;

    if not u33 then
        return;
    end;

    local v34 = u30[u33];

    if v34 then
        v34.stopAt = nil;

        return;
    end;

    local u35 = {
        angle = 0,
        stopAt = nil
    };
    u30[u33] = u35;
    u33.Rotation = 0;
    local u36 = nil;
    u36 = game:GetService("RunService").Heartbeat:Connect(function(p37: number) -- Line: 275
        -- upvalues: u35 (ref), u33 (copy), u36 (ref), u30 (ref)
        local v38 = u35.angle + p37 * 600;

        if v38 >= 180 then
            local v39;

            if u35.stopAt == nil then
                v39 = false;
            else
                v39 = os.clock() >= u35.stopAt;
            end;

            if v39 or not u33:IsDescendantOf(game) then
                u36:Disconnect();
                u33.Rotation = 0;
                u30[u33] = nil;

                return;
            end;

            v38 = v38 - 180;
        end;

        u35.angle = v38;
        u33.Rotation = -v38;
    end);
end;

function u1.StopRefreshSpin(p40: userdata?) -- Line: 292
    -- upvalues: u30 (copy)
    local v41;

    if p40 then
        v41 = p40:FindFirstChildWhichIsA("ImageLabel");
    else
        v41 = nil;
    end;

    if v41 then
        v41 = u30[v41];
    end;

    if v41 and not v41.stopAt then
        v41.stopAt = os.clock() + 1;
    end;
end;

return u1;
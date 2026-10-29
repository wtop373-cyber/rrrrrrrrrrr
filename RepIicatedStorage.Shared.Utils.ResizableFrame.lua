-- ============================================================
-- SCRIPT: ResizableFrame
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.Shared.Utils.ResizableFrame
-- ============================================================

-- Decompiled with Potassium's decompiler.

local GuiService = game:GetService("GuiService");
local RunService = game:GetService("RunService");
local UserInputService = game:GetService("UserInputService");
local u1 = {};
u1.__index = u1;
local Vector2_new_ret = Vector2.new(150, 50);
local v2 = {
    Horizontal = "rbxassetid://1243146213",
    Vertical = "rbxassetid://1243145985",
    TopLeft = "rbxassetid://1243145350",
    TopRight = "rbxassetid://1243145459",
    BottomLeft = "rbxassetid://1243145459",
    BottomRight = "rbxassetid://1243145350"
};
local u3 = {
    TopLeft = {
        x = -1,
        y = -1,
        icon = v2.TopLeft
    },
    TopRight = {
        x = 1,
        y = -1,
        icon = v2.TopRight
    },
    BottomLeft = {
        x = -1,
        y = 1,
        icon = v2.BottomLeft
    },
    BottomRight = {
        x = 1,
        y = 1,
        icon = v2.BottomRight
    },
    Left = {
        x = -1,
        y = 0,
        icon = v2.Horizontal
    },
    Right = {
        x = 1,
        y = 0,
        icon = v2.Horizontal
    },
    Top = {
        x = 0,
        y = -1,
        icon = v2.Vertical
    },
    Bottom = {
        x = 0,
        y = 1,
        icon = v2.Vertical
    }
};
local u4 = {
    [-1] = {
        [-1] = u3.TopLeft,
        [1] = u3.BottomLeft
    },
    [1] = {
        [-1] = u3.TopRight,
        [1] = u3.BottomRight
    }
};
local u5 = {};
local u6 = nil;
local u7 = {};
local u8 = nil;
local u9 = {};

for _, v in v2 do
    u5[v] = true;
end;

local function isResizeIcon(p10: string) -- Line: 63
    -- upvalues: u5 (copy)
    return u5[p10] == true;
end;

local function setCursor(p11: string?) -- Line: 67
    -- upvalues: UserInputService (copy), u5 (copy), u6 (ref)
    if not p11 then
        if u5[UserInputService.MouseIcon] == true then
            UserInputService.MouseIcon = u6 or "";
            u6 = nil;
        end;

        return;
    end;

    if u5[UserInputService.MouseIcon] ~= true then
        u6 = UserInputService.MouseIcon;
    end;

    UserInputService.MouseIcon = p11;
end;

local function inRect(p12: number, p13: number, p14: userdata) -- Line: 79
    local AbsolutePosition = p14.AbsolutePosition;
    local AbsoluteSize = p14.AbsoluteSize;
    local v15;

    if AbsolutePosition.X <= p12 and (p12 <= AbsolutePosition.X + AbsoluteSize.X and AbsolutePosition.Y <= p13) then
        v15 = p13 <= AbsolutePosition.Y + AbsoluteSize.Y;
    else
        v15 = false;
    end;

    return v15;
end;

local function setAnchorPoint(p16: userdata, p17) -- Line: 87
    local v18 = (p17 - p16.AnchorPoint) * p16.AbsoluteSize;
    p16.Position = p16.Position + UDim2.fromOffset(v18.X, v18.Y);
    p16.AnchorPoint = p17;
end;

local function restack() -- Line: 93
    -- upvalues: u7 (copy)
    for i, v in u7 do
        v.frame.ZIndex = i + 1;
    end;
end;

local function windowAt(p19: number, p20: number) -- Line: 100
    -- upvalues: u7 (copy)
    for i = #u7, 1, -1 do
        local v21 = u7[i];
        local v22;

        if v21:isShown() then
            local v23 = v21:zoneAt(p19, p20);

            if v23 then
                return v21, v23;
            end;

            local frame = v21.frame;
            local AbsolutePosition = frame.AbsolutePosition;
            local AbsoluteSize = frame.AbsoluteSize;
            local v24;

            if AbsolutePosition.X <= p19 and (p19 <= AbsolutePosition.X + AbsoluteSize.X and AbsolutePosition.Y <= p20) then
                v24 = p20 <= AbsolutePosition.Y + AbsoluteSize.Y;
            else
                v24 = false;
            end;

            if v24 then
                return v21, nil;
            end;

            v22 = i;
        else
            v22 = i;
        end;
    end;

    return nil, nil;
end;

local function stopResizing() -- Line: 116
    -- upvalues: u8 (ref)
    if u8 then
        u8.resize = nil;
        u8 = nil;
    end;
end;

local function onMoved(p25: number, p26: number) -- Line: 123
    -- upvalues: u8 (ref), windowAt (copy), UserInputService (copy), u5 (copy), u6 (ref)
    if u8 then
        u8:updateResize(p25, p26);

        return;
    end;

    local _, v27 = windowAt(p25, p26);

    if v27 then
        v27 = v27.icon;
    end;

    if not v27 then
        if u5[UserInputService.MouseIcon] == true then
            UserInputService.MouseIcon = u6 or "";
            u6 = nil;
        end;

        return;
    end;

    if u5[UserInputService.MouseIcon] ~= true then
        u6 = UserInputService.MouseIcon;
    end;

    UserInputService.MouseIcon = v27;
end;

local function mousePosition() -- Line: 132
    -- upvalues: UserInputService (copy), GuiService (copy)
    return UserInputService:GetMouseLocation() - GuiService:GetGuiInset();
end;

local function isPress(p28: userdata) -- Line: 136
    return p28.UserInputType == Enum.UserInputType.MouseButton1 and true or p28.UserInputType == Enum.UserInputType.Touch;
end;

local function connectInput() -- Line: 142
    -- upvalues: u9 (copy), UserInputService (copy), windowAt (copy), u8 (ref), u5 (copy), u6 (ref), GuiService (copy)
    if #u9 > 0 then
        return;
    end;

    u9[1] = UserInputService.InputBegan:Connect(function(p29: userdata) -- Line: 146
        -- upvalues: windowAt (ref)
        if p29.UserInputType ~= Enum.UserInputType.MouseButton1 and p29.UserInputType ~= Enum.UserInputType.Touch then
            return;
        end;

        local v30, v31 = windowAt(p29.Position.X, p29.Position.Y);

        if not v30 then
            return;
        end;

        v30:bringToFront();

        if v31 then
            v30:startResize(v31, p29.Position.X, p29.Position.Y);
        end;
    end);
    u9[2] = UserInputService.InputChanged:Connect(function(p32: userdata) -- Line: 159
        -- upvalues: u8 (ref), windowAt (ref), UserInputService (ref), u5 (ref), u6 (ref)
        if p32.UserInputType == Enum.UserInputType.MouseMovement or p32.UserInputType == Enum.UserInputType.Touch then
            local X = p32.Position.X;
            local Y = p32.Position.Y;

            if u8 then
                u8:updateResize(X, Y);

                return;
            end;

            local _, v33 = windowAt(X, Y);

            if v33 then
                v33 = v33.icon;
            end;

            if v33 then
                if u5[UserInputService.MouseIcon] ~= true then
                    u6 = UserInputService.MouseIcon;
                end;

                UserInputService.MouseIcon = v33;

                return;
            end;

            if u5[UserInputService.MouseIcon] == true then
                UserInputService.MouseIcon = u6 or "";
                u6 = nil;
            end;
        end;
    end);
    u9[3] = UserInputService.InputEnded:Connect(function(p34: userdata) -- Line: 167
        -- upvalues: u8 (ref), UserInputService (ref), GuiService (ref), windowAt (ref), u5 (ref), u6 (ref)
        if (p34.UserInputType == Enum.UserInputType.MouseButton1 and true or p34.UserInputType == Enum.UserInputType.Touch) and u8 then
            if u8 then
                u8.resize = nil;
                u8 = nil;
            end;

            local v35 = UserInputService:GetMouseLocation() - GuiService:GetGuiInset();
            local X = v35.X;
            local Y = v35.Y;

            if u8 then
                u8:updateResize(X, Y);

                return;
            end;

            local _, v36 = windowAt(X, Y);

            if v36 then
                v36 = v36.icon;
            end;

            if v36 then
                if u5[UserInputService.MouseIcon] ~= true then
                    u6 = UserInputService.MouseIcon;
                end;

                UserInputService.MouseIcon = v36;

                return;
            end;

            if u5[UserInputService.MouseIcon] == true then
                UserInputService.MouseIcon = u6 or "";
                u6 = nil;
            end;
        end;
    end);
    u9[4] = UserInputService.WindowFocusReleased:Connect(function() -- Line: 174
        -- upvalues: u8 (ref), UserInputService (ref), u5 (ref), u6 (ref)
        if u8 then
            u8.resize = nil;
            u8 = nil;
        end;

        if u5[UserInputService.MouseIcon] == true then
            UserInputService.MouseIcon = u6 or "";
            u6 = nil;
        end;
    end);
end;

function u1.new(p37: table) -- Line: 180
    -- upvalues: u1 (copy), Vector2_new_ret (copy)
    local v38 = setmetatable(p37, u1);
    v38.connections = {};
    local v39 = p37.minSize or Vector2_new_ret;
    v38.minSize = Vector2.new(v39.X, v39.Y + 25);
    v38:setup();

    return v38;
end;

function u1.setup(u40) -- Line: 198
    -- upvalues: UserInputService (copy), connectInput (copy)
    local frame = u40.frame;
    local Holder = frame:FindFirstChild("Holder");
    local v41;

    if Holder then
        v41 = Holder:FindFirstChild("Drag");
    else
        v41 = frame:FindFirstChild("TitleBar");
    end;

    u40.titleBar = v41;
    local v42;

    if Holder then
        v42 = Holder:FindFirstChild("Main");
    else
        v42 = frame:FindFirstChild("Body");
    end;

    u40.body = v42;
    local v43;

    if Holder and u40.body then
        v43 = u40.body:FindFirstChild("ScrollingFrame");
    else
        v43 = u40.body;
    end;

    u40.content = v43;
    table.insert(u40.connections, frame.Destroying:Connect(function() -- Line: 213
        -- upvalues: u40 (copy)
        u40:frameDestroying();
    end));
    table.insert(u40.connections, UserInputService.WindowFocusReleased:Connect(function() -- Line: 219
        -- upvalues: u40 (copy)
        u40:stopMoveConnection();
    end));

    if u40.dragable then
        u40:setupDragDetector();
    end;

    local v44 = u40.titleBar and (u40.titleBar:FindFirstChild("Hide") or u40.titleBar:FindFirstChild("Minimize"));

    if v44 and v44:IsA("GuiButton") then
        u40.hideButton = v44;
        table.insert(u40.connections, v44.Activated:Connect(function() -- Line: 234
            -- upvalues: u40 (copy)
            u40:toggleMinimize();
        end));
    end;

    if u40.initialSize then
        frame.Size = u40.initialSize;
    end;

    connectInput();
    u40:bringToFront();
end;

function u1.frameAt(p45: number, p46: number) -- Line: 248
    -- upvalues: windowAt (copy)
    local v47 = windowAt(p45, p46);

    if v47 then
        v47 = v47.frame;
    end;

    return v47;
end;

function u1.isShown(p48) -- Line: 253
    local v49 = not p48.destroyed;

    if v49 then
        if p48.frame.Parent == nil then
            v49 = false;
        else
            v49 = p48.frame.Visible;
        end;
    end;

    return v49;
end;

function u1.bringToFront(p50) -- Line: 257
    -- upvalues: u7 (copy)
    if p50.destroyed then
        return;
    end;

    local table_find_ret = table.find(u7, p50);

    if table_find_ret == #u7 and table_find_ret ~= nil then
        return;
    end;

    if table_find_ret then
        table.remove(u7, table_find_ret);
    end;

    table.insert(u7, p50);

    for i, v in u7 do
        v.frame.ZIndex = i + 1;
    end;
end;

function u1.zoneAt(p51: table, p52: number, p53: number) -- Line: 273
    -- upvalues: u4 (copy), u3 (copy)
    if not p51.resizable or p51.minimized then
        return nil;
    end;

    local AbsolutePosition = p51.frame.AbsolutePosition;
    local AbsoluteSize = p51.frame.AbsoluteSize;
    local v54 = p52 - AbsolutePosition.X;
    local v55 = p53 - AbsolutePosition.Y;
    local X = AbsoluteSize.X;
    local Y = AbsoluteSize.Y;

    if v54 < -5 or (X + 5 < v54 or (v55 < 20 or Y + 5 < v55)) then
        return nil;
    end;

    if v55 < 25 and (v54 >= 0 and v54 <= X) then
        return nil;
    end;

    if p51.content and p51.content.Visible then
        local content = p51.content;
        local AbsolutePosition2 = content.AbsolutePosition;
        local AbsoluteSize2 = content.AbsoluteSize;
        local v56;

        if AbsolutePosition2.X <= p52 and (p52 <= AbsolutePosition2.X + AbsoluteSize2.X and AbsolutePosition2.Y <= p53) then
            v56 = p53 <= AbsolutePosition2.Y + AbsoluteSize2.Y;
        else
            v56 = false;
        end;

        if v56 then
            return nil;
        end;
    end;

    local v57 = v54 <= 20 and -1 or (X - 20 <= v54 and 1 or 0);
    local v58 = v55 <= 45 and -1 or (Y - 20 <= v55 and 1 or 0);

    if v57 ~= 0 and v58 ~= 0 then
        return u4[v57][v58];
    end;

    if v54 <= 5 then
        return u3.Left;
    end;

    if X - 5 <= v54 then
        return u3.Right;
    end;

    if v55 <= 30 then
        return u3.Top;
    end;

    if Y - 5 <= v55 then
        return u3.Bottom;
    end;

    return nil;
end;

function u1.startResize(p59: table, p60: table, p61: number, p62: number) -- Line: 307
    -- upvalues: u8 (ref), UserInputService (copy), u5 (copy), u6 (ref)
    p59:stopMoveConnection();

    if u8 then
        u8.resize = nil;
        u8 = nil;
    end;

    local frame = p59.frame;
    local Vector2_zero = Vector2.zero;
    local v63 = (Vector2_zero - frame.AnchorPoint) * frame.AbsoluteSize;
    frame.Position = frame.Position + UDim2.fromOffset(v63.X, v63.Y);
    frame.AnchorPoint = Vector2_zero;
    local AbsoluteSize = frame.AbsoluteSize;
    frame.Size = UDim2.fromOffset(AbsoluteSize.X, AbsoluteSize.Y);
    p59.resize = {
        zone = p60,
        mouse = Vector2.new(p61, p62),
        position = frame.Position,
        size = AbsoluteSize
    };
    u8 = p59;
    local icon = p60.icon;

    if not icon then
        if u5[UserInputService.MouseIcon] == true then
            UserInputService.MouseIcon = u6 or "";
            u6 = nil;
        end;

        return;
    end;

    if u5[UserInputService.MouseIcon] ~= true then
        u6 = UserInputService.MouseIcon;
    end;

    UserInputService.MouseIcon = icon;
end;

function u1.updateResize(p64: table, p65: number, p66: number) -- Line: 319
    -- upvalues: u8 (ref)
    local resize = p64.resize;

    if not resize or p64.destroyed then
        if u8 then
            u8.resize = nil;
            u8 = nil;
        end;

        return;
    end;

    local workspace_CurrentCamera = workspace.CurrentCamera;
    local v67;

    if workspace_CurrentCamera then
        v67 = workspace_CurrentCamera.ViewportSize;
    else
        v67 = Vector2.new((1 / 0), (1 / 0));
    end;

    local v68 = Vector2.new(p65, p66) - resize.mouse;
    local zone = resize.zone;
    local v69 = resize.size.X + v68.X * zone.x;
    local X = p64.minSize.X;
    local math_max_ret = math.max(p64.minSize.X, v67.X);
    local math_clamp_ret = math.clamp(v69, X, math_max_ret);
    local v70 = resize.size.Y + v68.Y * zone.y;
    local Y = p64.minSize.Y;
    local math_max_ret2 = math.max(p64.minSize.Y, v67.Y);
    local math_clamp_ret2 = math.clamp(v70, Y, math_max_ret2);
    local position = resize.position;
    p64.frame.Position = UDim2.new(position.X.Scale, position.X.Offset + (zone.x ~= -1 and 0 or resize.size.X - math_clamp_ret), position.Y.Scale, position.Y.Offset + (zone.y ~= -1 and 0 or resize.size.Y - math_clamp_ret2));
    p64.frame.Size = UDim2.fromOffset(math_clamp_ret, math_clamp_ret2);
end;

function u1.toggleMinimize(p71) -- Line: 352
    -- upvalues: u8 (ref)
    local frame = p71.frame;

    if p71.minimized then
        for _, v in p71.hidden or {} do
            v.Visible = true;
        end;

        p71.hidden = nil;
        p71.minimized = false;

        if p71.expandedSize then
            frame.Size = p71.expandedSize;
        end;

        if p71.hideButton then
            p71.hideButton.Text = "-";
        end;
    else
        if u8 == p71 and u8 then
            u8.resize = nil;
            u8 = nil;
        end;

        p71:stopMoveConnection();
        local Vector2_zero = Vector2.zero;
        local v72 = (Vector2_zero - frame.AnchorPoint) * frame.AbsoluteSize;
        frame.Position = frame.Position + UDim2.fromOffset(v72.X, v72.Y);
        frame.AnchorPoint = Vector2_zero;
        p71.expandedSize = frame.Size;
        p71.hidden = {};
        local Holder = frame:FindFirstChild("Holder");
        local v73 = not Holder and {} or Holder:GetChildren();

        for _, child in frame:GetChildren() do
            table.insert(v73, child);
        end;

        for _, v in v73 do
            if v:IsA("GuiObject") and (v.Visible and (v ~= Holder and v ~= p71.titleBar)) then
                v.Visible = false;
                table.insert(p71.hidden, v);
            end;
        end;

        frame.Size = UDim2.fromOffset(200, 25);
        p71.minimized = true;

        if p71.hideButton then
            p71.hideButton.Text = "+";
        end;
    end;
end;

function u1.setupDragDetector(u74) -- Line: 398
    local v76 = (u74.dragFrame or u74.frame).InputBegan:Connect(function(p75: userdata) -- Line: 404
        -- upvalues: u74 (copy)
        if p75.UserInputType == Enum.UserInputType.MouseButton1 then
            u74:setupMoveConnection();
        end;
    end);
    table.insert(u74.connections, v76);
end;

function u1.setupMoveConnection(u77) -- Line: 412
    -- upvalues: UserInputService (copy), GuiService (copy), RunService (copy)
    if u77.resize then
        return;
    end;

    u77:stopMoveConnection();
    local u78 = UserInputService:GetMouseLocation() - GuiService:GetGuiInset();
    local Position = u77.frame.Position;
    u77.moveConn = RunService.Stepped:Connect(function() -- Line: 420
        -- upvalues: u77 (copy), UserInputService (ref), GuiService (ref), Position (copy), u78 (copy)
        if u77.resize or not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
            u77:stopMoveConnection();

            return;
        end;

        local v79 = UserInputService:GetMouseLocation() - GuiService:GetGuiInset();
        u77.frame.Position = Position - UDim2.fromOffset(u78.X - v79.X, u78.Y - v79.Y);
    end);
end;

function u1.stopMoveConnection(p80) -- Line: 434
    if p80.moveConn then
        p80.moveConn:Disconnect();
        p80.moveConn = nil;
    end;
end;

function u1.frameDestroying(p81) -- Line: 441
    -- upvalues: u8 (ref), u7 (copy), UserInputService (copy), GuiService (copy), windowAt (copy), u5 (copy), u6 (ref), u9 (copy)
    if p81.destroyed then
        return;
    end;

    p81.destroyed = true;

    if u8 == p81 and u8 then
        u8.resize = nil;
        u8 = nil;
    end;

    p81:stopMoveConnection();

    for _, v in p81.connections do
        v:Disconnect();
    end;

    table.clear(p81.connections);
    local table_find_ret = table.find(u7, p81);

    if table_find_ret then
        table.remove(u7, table_find_ret);

        for i, v in u7 do
            v.frame.ZIndex = i + 1;
        end;
    end;

    local v82 = UserInputService:GetMouseLocation() - GuiService:GetGuiInset();
    local X = v82.X;
    local Y = v82.Y;

    if u8 then
        u8:updateResize(X, Y);
    else
        local _, v83 = windowAt(X, Y);

        if v83 then
            v83 = v83.icon;
        end;

        if v83 then
            if u5[UserInputService.MouseIcon] ~= true then
                u6 = UserInputService.MouseIcon;
            end;

            UserInputService.MouseIcon = v83;
        elseif u5[UserInputService.MouseIcon] == true then
            UserInputService.MouseIcon = u6 or "";
            u6 = nil;
        end;
    end;

    if #u7 == 0 then
        for _, v in u9 do
            v:Disconnect();
        end;

        table.clear(u9);
    end;
end;

return u1;
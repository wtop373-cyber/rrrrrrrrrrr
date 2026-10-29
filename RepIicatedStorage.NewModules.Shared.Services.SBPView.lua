-- ============================================================
-- SCRIPT: SBPView
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Services.SBPView
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
local TweenService = game:GetService("TweenService");
local GuiService = game:GetService("GuiService");
local UserInputService = game:GetService("UserInputService");
local script_StyleSheet = require(script.StyleSheet);
local u2 = GuiService:IsTenFootInterface();
local Color3_fromRGB_ret = Color3.fromRGB(0, 162, 255);
local u3 = u2 and 100 or 60;
local v4 = false;

if UserInputService.TouchEnabled and game:GetService("RunService"):IsClient() then
    local BPGUI = game.Players.LocalPlayer.PlayerGui:FindFirstChild("BPGUI");
    local workspace_CurrentCamera = workspace.CurrentCamera;
    local v5 = BPGUI and BPGUI.AbsoluteSize.X or (workspace_CurrentCamera and workspace_CurrentCamera.ViewportSize.X or 0);
    v4 = v5 > 1 and v5 < 1024 and true or v4;
end;

local u6 = v4 and 5 or 10;
local u7 = v4 and 2 or 4;
local TweenInfo_new_ret = TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut);
local u8 = script_StyleSheet.new({
    frame = {
        BackgroundTransparency = 0.5,
        BackgroundColor3 = Color3.fromRGB(31, 31, 31)
    },
    number = {
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    },
    name = {
        TextColor3 = Color3.fromRGB(255, 255, 255)
    },
    stroke = {
        Thickness = 1,
        Transparency = 0.5,
        Color = Color3.fromRGB(255, 255, 255)
    }
});
local u9 = script_StyleSheet.new({
    frame = {
        BackgroundTransparency = 0.4,
        BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    }
});
local u10 = script_StyleSheet.new({
    frame = {
        BackgroundTransparency = 0.35,
        BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    },
    number = {
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    },
    name = {
        TextColor3 = Color3.fromRGB(255, 255, 255)
    },
    stroke = {
        Thickness = 2,
        Transparency = 0.25,
        Color = Color3.fromRGB(255, 255, 255)
    }
});
local u11 = script_StyleSheet.new({
    stroke = {
        Thickness = 2,
        Transparency = 0.5
    }
});
local u12 = script_StyleSheet.new({
    stroke = {
        Thickness = 4,
        Transparency = 0,
        Color = Color3.fromRGB(90, 142, 233)
    }
});
local u13 = {};
u13.__index = u13;

function u13.new(p14) -- Line: 158
    -- upvalues: u3 (ref), u13 (copy)
    p14.Size = UDim2.new(0, u3, 0, u3);
    local v15 = {
        state = {
            isEquipped = false,
            isSelected = false,
            isDraggable = false,
            isDragging = false
        },
        _ui = p14,
        _uiIcon = p14.Icon,
        _uiNumber = p14.Number,
        _uiName = p14.ToolName,
        _uiToolTip = p14.ToolTip,
        _uiStroke = p14.UIStroke
    };
    v15._bindings = {
        frame = v15._ui,
        number = v15._uiNumber,
        name = v15._uiName,
        stroke = v15._uiStroke
    };
    setmetatable(v15, u13);
    v15:Clear();
    v15._uiNumber.Text = "";

    return v15;
end;

function u13.Destroy(p16) -- Line: 198
    p16._ui:Destroy();
end;

function u13.Clear(p17) -- Line: 202
    p17._name = "";
    p17._uiName.Text = "";
    p17._iconURL = "";
    p17._uiIcon.Image = "";
    p17._uiToolTip.Text = "";
    p17._uiToolTip.Visible = false;
end;

function u13.ChangeName(p18, p19) -- Line: 213
    p18._name = p19;
    p18:_ReconcileNameAndIconContent();
    p18:_ReconcileNameSize();
end;

function u13.ChangeIcon(p20, p21) -- Line: 219
    p20._iconURL = p21;
    p20:_ReconcileNameAndIconContent();
end;

function u13.ChangeNumber(p22, p23) -- Line: 224
    p22._uiNumber.Text = p23;
    p22:_ReconcileNameSize();
end;

function u13.ChangeTip(p24, p25) -- Line: 229
    -- upvalues: TweenService (copy)
    local _uiToolTip = p24._uiToolTip;
    _uiToolTip.Text = p25;
    _uiToolTip.Visible = p25 ~= "";

    if _uiToolTip.Visible then
        local v26 = _uiToolTip.TextBounds.X + 12;
        _uiToolTip.Size = UDim2.new(UDim.new(), _uiToolTip.Size.Y);
        TweenService:Create(_uiToolTip, TweenInfo.new(0.15, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
            Size = UDim2.new(UDim.new(0, v26), _uiToolTip.Size.Y)
        }):Play();
    end;
end;

function u13.ChangeEquipStatus(p27, p28) -- Line: 247
    p27.state.isEquipped = p28;
    p27:_TransitionStyle();
end;

function u13.ChangeSelectStatus(u29, p30) -- Line: 252
    u29.state.isSelected = p30;
    u29:_TransitionStyle();

    if p30 then
        local Size = u29._ui.Size;
        local Position = u29._ui.Position;
        u29._ui:TweenSizeAndPosition(Size + UDim2.new(0, 10, 0, 10), Position - UDim2.new(0, 5, 0, 5), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, function() -- Line: 266
            -- upvalues: u29 (copy), Size (copy), Position (copy)
            u29._ui:TweenSizeAndPosition(Size, Position, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true);
        end);
    end;
end;

function u13.ChangeDraggableStatus(p31, p32) -- Line: 280
    p31.state.isDraggable = p32;
    p31:_TransitionStyle();
end;

function u13.ChangeDraggingStatus(p33, p34) -- Line: 285
    p33.state.isDragging = p34;
    p33:_TransitionStyle();
end;

function u13.Readjust(p35, p36, p37, p38) -- Line: 292
    -- upvalues: u3 (ref)
    p35._ui.Position = UDim2.new(0, p36.Size.X.Offset / 2 - u3 / 2 + (u3 + 7) * (p37 - (p38 / 2 + 0.5)), 0, 7);
end;

function u13._TransitionStyle(p39) -- Line: 303
    -- upvalues: TweenService (copy), TweenInfo_new_ret (copy)
    for i, v in pairs(p39:_ComputeStyleSheet():Bind(p39._bindings)) do
        TweenService:Create(i, TweenInfo_new_ret, v):Play();
    end;
end;

function u13._ApplyStyle(p40) -- Line: 309
    p40:_ComputeStyleSheet():Apply(p40._bindings);
end;

function u13._ComputeStyleSheet(p41) -- Line: 313
    -- upvalues: u8 (copy), u9 (copy), u10 (copy), u11 (copy), u12 (copy)
    local state = p41.state;
    local v42 = u8:Clone();

    if state.isDraggable then
        v42:Union(u9);
    end;

    if state.isEquipped then
        v42:Union(u10);
    end;

    if state.isSelected then
        v42:Union(u11);
    end;

    if state.isDragging then
        v42:Union(u12);
    end;

    return v42;
end;

function u13._ReconcileNameAndIconContent(p43) -- Line: 337
    p43._uiName.Text = p43._iconURL ~= "" and "" or p43._name;
    p43._uiIcon.Image = p43._iconURL;
end;

function u13._ReconcileNameSize(p44) -- Line: 342
    p44._uiName.Size = UDim2.new(1, -2, p44._uiNumber.Text == "" and 1 or 0.75, -2);
end;

local u45 = {};
u45.__index = u45;

function u45.new(p46) -- Line: 351
    -- upvalues: script_StyleSheet (copy), u3 (ref), u45 (copy)
    local v47 = {
        state = {
            isOpen = false,
            isSearchBoxVisible = false
        },
        _ui = p46,
        _uiModal = p46.InventoryModal,
        _uiScrollingFrame = p46.InventoryModal.ScrollingFrame,
        _uiGridFrame = p46.InventoryModal.ScrollingFrame.UIGridFrame,
        _uiGridLayout = p46.InventoryModal.ScrollingFrame.UIGridFrame.UIGridLayout,
        _uiSearch = p46.InventoryModal.Search,
        _uiSearchTextBox = p46.InventoryModal.Search.SearchTextBox,
        _uiSearchClear = p46.InventoryModal.Search.X,
        _uiSearchClearRender = p46.InventoryModal.Search.X.Render
    };
    local v48 = {
        [v47._uiSearch] = { "Size" },
        [v47._uiSearchTextBox] = { "Position", "TextTransparency" },
        [v47._uiSearchClear] = { "Position" },
        [v47._uiSearchClearRender] = { "BackgroundTransparency", "TextTransparency" }
    };
    local v49 = script_StyleSheet.bindFromProps(v48);
    v47._uiSearch.Size = UDim2.new(UDim.new(), v47._uiSearch.Size.Y);
    local _uiSearchTextBox = v47._uiSearchTextBox;
    _uiSearchTextBox.Position = _uiSearchTextBox.Position + UDim2.fromScale(0, 1);
    v47._uiSearchTextBox.TextTransparency = 1;
    local _uiSearchClear = v47._uiSearchClear;
    _uiSearchClear.Position = _uiSearchClear.Position - UDim2.fromScale(0, 1);
    v47._uiSearchClearRender.BackgroundTransparency = 1;
    v47._uiSearchClearRender.TextTransparency = 1;
    local v50 = script_StyleSheet.bindFromProps(v48);
    v47._openAnimationProgress = 0;
    v47._openAnimationStart = 0;
    v47._openAnimationCompletedConnection = nil;
    v47._searchAnimationGoalBindings = v49;
    v47._searchAnimationInitBindings = v50;
    v47._searchAnimationTime = 0;
    v47._uiScrollingFrame.Selectable = false;
    v47._uiScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0);
    v47._uiGridFrame.Selectable = false;
    v47._uiGridFrame.Size = UDim2.new(1, -14, 1, 0);
    v47._uiGridFrame.Position = UDim2.new(0, 7, 0, 2);
    v47._uiGridLayout.SortOrder = Enum.SortOrder.LayoutOrder;
    v47._uiGridLayout.CellSize = UDim2.new(0, u3, 0, u3);
    v47._uiGridLayout.CellPadding = UDim2.new(0, 7, 0, 7);
    v47._uiModal.Position = UDim2.new(0, 0, 1, 0);
    setmetatable(v47, u45);

    return v47;
end;

function u45.GetComponents(p51) -- Line: 427
    return {
        scrollingFrame = p51._uiScrollingFrame,
        gridFrame = p51._uiGridFrame,
        searchFrame = p51._uiSearch,
        searchTextBox = p51._uiSearchTextBox,
        searchClearButton = p51._uiSearchClear
    };
end;

function u45.UpdateScrollingFrameCanvasSize(p52) -- Line: 437
    -- upvalues: u3 (ref)
    local _uiScrollingFrame = p52._uiScrollingFrame;
    local _uiGridFrame = p52._uiGridFrame;
    local math_floor_ret = math.floor(_uiScrollingFrame.AbsoluteSize.X / (u3 + 7));
    local v53 = (#_uiGridFrame:GetChildren() - 1) / math_floor_ret;
    local v54 = math.ceil(v53) * (u3 + 7) + 7;
    _uiScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, v54);
end;

function u45.UpdateBackpackLayout(p55, p56) -- Line: 447
    -- upvalues: u6 (copy), u3 (ref), u7 (copy)
    local _ui = p55._ui;
    local _uiModal = p55._uiModal;
    local _uiScrollingFrame = p55._uiScrollingFrame;
    p56.Size = UDim2.new(0, 7 + u6 * (u3 + 7), 0, u3 + 7 + 7);
    p56.Position = UDim2.new(0.5, -p56.Size.X.Offset / 2, 1, -p56.Size.Y.Offset);
    _uiScrollingFrame.Size = UDim2.new(1, _uiScrollingFrame.ScrollBarThickness + 1, 1, -40);
    _uiScrollingFrame.Position = UDim2.new(0, 0, 0, 40);
    _ui.Size = UDim2.new(0, p56.Size.X.Offset + _uiScrollingFrame.ScrollBarThickness + 1, 0, p56.Size.Y.Offset * u7 + 40);
    _ui.Position = UDim2.new(0.5, -_ui.Size.X.Offset / 2, 1, p56.Position.Y.Offset - _ui.Size.Y.Offset - 5);
    _uiModal.Size = UDim2.new(1, -(_uiScrollingFrame.ScrollBarThickness + 1), 1, 0);
end;

function u45.ChangeOpenStatus(p57, p58) -- Line: 482
    if p57.state.isOpen == p58 then
        return;
    end;

    p57.state.isOpen = p58;

    if p58 then
        p57:_AnimateModal(true);

        return;
    end;

    p57:_AnimateModal(false);
end;

function u45.ChangeSearchBoxVisibility(p59, p60) -- Line: 495
    if p59.state.isSearchBoxVisible == p60 then
        return;
    end;

    p59.state.isSearchBoxVisible = p60;
    local v61;

    if p60 then
        v61 = p59._searchAnimationGoalBindings;
    else
        v61 = p59._searchAnimationInitBindings;
    end;

    p59:_PlaySearchBoxAnimation(v61);
end;

function u45._AnimateModal(u62, u63) -- Line: 505
    -- upvalues: TweenService (copy)
    if u63 then
        u62._ui.Visible = true;
    end;

    local v64 = u62._openAnimationProgress + (u63 and -1 or 1) * ((tick() - u62._openAnimationStart) / 0.2);
    u62._openAnimationProgress = math.clamp(v64, 0, 1);
    local v65 = math.abs((u63 and 1 or 0) - u62._openAnimationProgress) * 0.2;
    local v66 = TweenService:Create(u62._uiModal, TweenInfo.new(v65, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Position = UDim2.new(0, 0, u63 and 0 or 1, 0)
    });

    if u62._openAnimationCompletedConnection then
        u62._openAnimationCompletedConnection:Disconnect();
        u62._openAnimationCompletedConnection = nil;
    end;

    u62._ui.ClipsDescendants = true;
    u62._openAnimationCompletedConnection = v66.Completed:Connect(function() -- Line: 531
        -- upvalues: u63 (copy), u62 (copy)
        if u63 then
            u62._ui.ClipsDescendants = false;

            return;
        end;

        u62._ui.Visible = false;
    end);
    u62._openAnimationStart = tick();
    v66:Play();
end;

function u45._PlaySearchBoxAnimation(p67, p68) -- Line: 544
    -- upvalues: TweenService (copy)
    local v69 = tick() - p67._searchAnimationTime;
    local math_min_ret = math.min(0.2, v69);

    for i, v in pairs(p68) do
        TweenService:Create(i, TweenInfo.new(math_min_ret, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), v):Play();
    end;
end;

local u70 = {};
u70.__index = u70;

function u70.new(u71) -- Line: 556
    -- upvalues: Color3_fromRGB_ret (copy), u70 (copy)
    local v72 = {
        _ui = u71
    };
    u71.Visible = _G.InputType == 2;
    u71.SelectionGained:Connect(function() -- Line: 563
        -- upvalues: u71 (copy), Color3_fromRGB_ret (ref)
        u71.ImageColor3 = Color3_fromRGB_ret;
    end);
    u71.SelectionLost:Connect(function() -- Line: 567
        -- upvalues: u71 (copy)
        u71.ImageColor3 = Color3.new(1, 1, 1);
    end);
    local Frame = Instance.new("Frame");
    Frame.Name = "Selection";
    Frame.Visible = false;
    u71.SelectionImageObject = Frame;
    setmetatable(v72, u70);

    return v72;
end;

function u70.GetFrame(p73) -- Line: 580
    return p73._ui;
end;

function u70.GetButton(p74) -- Line: 584
    return p74._ui;
end;

function u70.ChangeState(p75, p76, p77) -- Line: 588
    -- upvalues: u3 (ref)
    if p76 then
        p76 = _G.InputType == 2;
    end;

    p75._ui.Visible = p76;
    p75._ui.AnchorPoint = Vector2.new(0.5, 1);
    p75._ui.Position = UDim2.new(0.5, 0, 1, -(not p77 and 0 or (u3 + 14) * 1.1));
end;

local u78 = {};
u78.__index = u78;

function u78.new(p79) -- Line: 598
    -- upvalues: u78 (copy)
    local v80 = {
        state = {
            isOpen = false
        },
        _ui = p79,
        _uiFrame = p79.Frame,
        _openAnimationProgress = 0,
        _openAnimationStart = 0,
        _openAnimationCompletedConnection = nil
    };
    v80._uiFrame.Position = UDim2.new(0, 0, 1, 0);
    setmetatable(v80, u78);

    return v80;
end;

function u78.Resize(p81, p82, p83) -- Line: 616
    -- upvalues: u2 (copy)
    p81._ui.Size = UDim2.new(p82.Size.X.Scale, p82.Size.X.Offset, 0, u2 and 95 or 60);
    p81._ui.Position = UDim2.new(p82.Position.X.Scale, p82.Position.X.Offset, p83.Position.Y.Scale - p81._ui.Size.Y.Scale, p83.Position.Y.Offset - p81._ui.Size.Y.Offset);
end;

function u78.ChangeOpenState(u84, u85) -- Line: 631
    -- upvalues: TweenService (copy), UserInputService (copy)
    if u84.state.isOpen == u85 then
        return;
    end;

    u84.state.isOpen = u85;
    local v86 = u84._openAnimationProgress + (u85 and -1 or 1) * ((tick() - u84._openAnimationStart) / 0.2);
    u84._openAnimationProgress = math.clamp(v86, 0, 1);
    local v87 = math.abs((u85 and 1 or 0) - u84._openAnimationProgress) * 0.2;
    local v88 = TweenService:Create(u84._uiFrame, TweenInfo.new(v87, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {
        Position = UDim2.new(0, 0, u85 and 0 or 1, 0)
    });

    if u84._openAnimationCompletedConnection then
        u84._openAnimationCompletedConnection:Disconnect();
        u84._openAnimationCompletedConnection = nil;
    end;

    if u85 then
        for _, child in pairs(u84._uiFrame:GetChildren()) do
            pcall(function() -- Line: 660
                -- upvalues: child (copy), UserInputService (ref)
                child.HintImage.Image = UserInputService:GetImageForKeyCode(Enum.KeyCode[child.Name]);
            end);
        end;

        u84._ui.Visible = true;
    else
        u84._openAnimationCompletedConnection = v88.Completed:Connect(function() -- Line: 668
            -- upvalues: u84 (copy)
            u84._ui.Visible = false;
        end);
    end;

    local _, _ = pcall(function() -- Line: 673
        -- upvalues: u84 (copy), u85 (copy)
        u84._uiSearchClear.Modal = u85;
    end);
    u84._openAnimationStart = tick();
    v88:Play();
end;

return {
    NUMBER_OF_HOTBAR_SLOTS = u6,
    HotbarItem = u13,
    Inventory = u45,
    GamepadHintsFrame = u78,
    OpenInventoryButton = u70
};
-- ============================================================
-- SCRIPT: Backpack
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface.Modules.Backpack
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");
local UserInputService = game:GetService("UserInputService");
local StarterGui = game:GetService("StarterGui");
local GuiService = game:GetService("GuiService");
local ContextActionService = game:GetService("ContextActionService");
local GamepadService = game:GetService("GamepadService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local NewModules = ReplicatedStorage:WaitForChild("NewModules");
local SBPView = require(NewModules.Shared.Services.SBPView);
local MobileControls = require(NewModules.Client.Services.MobileControls);
local CoreGUI = script.Parent.Parent.CoreGUI;
local u1 = {
    OpenClose = nil,
    IsHotbarVisible = false,
    IsOpen = false,
    StateChanged = Instance.new("BindableEvent")
};
local Value = Enum.KeyCode.Backquote.Value;
local Value2 = Enum.KeyCode.Zero.Value;
local Value3 = Enum.KeyCode.Backspace.Value;
local u2 = {
    [Enum.UserInputType.Gamepad1] = true,
    [Enum.UserInputType.Gamepad2] = true,
    [Enum.UserInputType.Gamepad3] = true,
    [Enum.UserInputType.Gamepad4] = true,
    [Enum.UserInputType.Gamepad5] = true,
    [Enum.UserInputType.Gamepad6] = true,
    [Enum.UserInputType.Gamepad7] = true,
    [Enum.UserInputType.Gamepad8] = true
};
local BPPrefabs = ReplicatedStorage.Storage.GUIs.BPPrefabs;
local HotbarItem = BPPrefabs.HotbarItem;
local v3 = {};

for _, child in BPPrefabs:GetChildren() do
    if child:IsA("GuiObject") then
        child.Visible = false;
    end;
end;

({}).Create = function(p4, u5) -- Line: 59, Name: Create
    return function(p6) -- Line: 60
        -- upvalues: u5 (copy)
        local Instance_new_ret = Instance.new(u5);
        local v7 = nil;

        for i, v in pairs(p6) do
            if type(i) == "number" then
                v.Parent = Instance_new_ret;
            elseif i == "Parent" then
                v7 = v;
            else
                Instance_new_ret[i] = v;
            end;
        end;

        if v7 then
            Instance_new_ret.Parent = v7;
        end;

        return Instance_new_ret;
    end;
end;

local u8 = true;
local u9 = false;
local u10 = false;
local LocalPlayer = Players.LocalPlayer;
local u11 = nil;
local u12 = nil;
local u13 = nil;
local u14 = nil;
local u15 = nil;
local u16 = nil;
local u17 = nil;
local u18 = nil;
local u19 = nil;
local u20 = nil;
local u21 = {};
local u22 = nil;
local u23 = {};
local u24 = {};
local u25 = {};
local u26 = 0;
local u27 = nil;
local u28 = false;
local u29 = false;
local u30 = false;
local u31 = false;
local v32 = {};
local u33 = {};
local u34 = false;
local NUMBER_OF_HOTBAR_SLOTS = SBPView.NUMBER_OF_HOTBAR_SLOTS;
local u35 = nil;

local function NewGui(p36, p37) -- Line: 122
    local Instance_new_ret = Instance.new(p36);
    Instance_new_ret.Name = p37;
    Instance_new_ret.BackgroundColor3 = Color3.new(0, 0, 0);
    Instance_new_ret.BackgroundTransparency = 1;
    Instance_new_ret.BorderColor3 = Color3.new(0, 0, 0);
    Instance_new_ret.BorderSizePixel = 0;
    Instance_new_ret.Size = UDim2.new(1, 0, 1, 0);

    if p36:match("Text") then
        Instance_new_ret.TextColor3 = Color3.new(1, 1, 1);
        Instance_new_ret.Text = "";
        Instance_new_ret.Font = Enum.Font.SourceSans;
        Instance_new_ret.TextWrapped = true;

        if p36 == "TextButton" then
            Instance_new_ret.Font = Enum.Font.SourceSansBold;
            Instance_new_ret.BorderSizePixel = 1;
        end;
    end;

    return Instance_new_ret;
end;

local function FindLowestEmpty() -- Line: 143
    -- upvalues: NUMBER_OF_HOTBAR_SLOTS (copy), u21 (copy)
    for i = 1, NUMBER_OF_HOTBAR_SLOTS do
        local v38 = u21[i];

        if not v38.Tool then
            return v38;
        end;

        local _ = i;
    end;

    return nil;
end;

local function IsInventoryEmpty() -- Line: 153
    -- upvalues: NUMBER_OF_HOTBAR_SLOTS (copy), u21 (copy)
    for i = NUMBER_OF_HOTBAR_SLOTS + 1, #u21 do
        local v39 = u21[i];

        if v39 and v39.Tool then
            return false;
        end;

        local _ = i;
    end;

    return true;
end;

local function AdjustHotbarFrames() -- Line: 163
    -- upvalues: u15 (ref), NUMBER_OF_HOTBAR_SLOTS (copy), u26 (ref), u21 (copy), u13 (ref), u1 (copy)
    local isOpen = u15.state.isOpen;
    local v40 = isOpen and NUMBER_OF_HOTBAR_SLOTS or u26;
    local v41 = v40 >= 1;
    local v42 = 0;

    for i = 1, NUMBER_OF_HOTBAR_SLOTS do
        local v43 = u21[i];
        local v44;

        if v43.Tool or isOpen then
            v42 = v42 + 1;
            v43:Readjust(v42, v40);
            v43.Frame.Visible = true;
            v44 = i;
        else
            v43.Frame.Visible = false;
            v44 = i;
        end;
    end;

    local v45 = not isOpen;

    if v45 then
        if v41 then
            v45 = v41;
        else
            local v46 = true;

            for i = NUMBER_OF_HOTBAR_SLOTS + 1, #u21 do
                local v47 = u21[i];

                if v47 and v47.Tool then
                    v46 = false;
                    break;
                end;

                local _ = i;
            end;

            v45 = not v46;
        end;
    end;

    u13.lastInvButtonChangeState = { v45, v41 };
    u13:ChangeState(v45, v41);
    u1.IsHotbarVisible = v41;
end;

local function AdjustInventoryFrames() -- Line: 189
    -- upvalues: NUMBER_OF_HOTBAR_SLOTS (copy), u21 (copy), u15 (ref)
    for i = NUMBER_OF_HOTBAR_SLOTS + 1, #u21 do
        local v48 = u21[i];
        v48.Frame.LayoutOrder = v48.Index;
        v48.Frame.Visible = v48.Tool ~= nil;
        local _ = i;
    end;

    u15:UpdateScrollingFrameCanvasSize();
end;

local function CheckBounds(p49, p50, p51) -- Line: 198
    local AbsolutePosition = p49.AbsolutePosition;
    local AbsoluteSize = p49.AbsoluteSize;
    local v52;

    if AbsolutePosition.X < p50 and (p50 <= AbsolutePosition.X + AbsoluteSize.X and AbsolutePosition.Y < p51) then
        v52 = p51 <= AbsolutePosition.Y + AbsoluteSize.Y;
    else
        v52 = false;
    end;

    return v52;
end;

local function GetOffset(p53, p54) -- Line: 204
    return (p53.AbsolutePosition + p53.AbsoluteSize / 2 - p54).magnitude;
end;

local function DisableActiveHopper() -- Line: 209
    -- upvalues: u27 (ref), u23 (copy)
    u27:ToggleSelect();
    u23[u27]:UpdateEquipView();
    u27 = nil;
end;

local function UnequipAllTools() -- Line: 215
    -- upvalues: u19 (ref), u27 (ref), u23 (copy)
    if u19 then
        u19:UnequipTools();

        if u27 then
            u27:ToggleSelect();
            u23[u27]:UpdateEquipView();
            u27 = nil;
        end;
    end;
end;

local function EquipNewTool(p55) -- Line: 224
    -- upvalues: u19 (ref), u27 (ref), u23 (copy), u18 (ref)
    if u19 then
        u19:UnequipTools();

        if u27 then
            u27:ToggleSelect();
            u23[u27]:UpdateEquipView();
            u27 = nil;
        end;
    end;

    if not p55:IsA("HopperBin") then
        p55.Parent = u18;

        return;
    end;

    p55:ToggleSelect();
    u23[p55]:UpdateEquipView();
    u27 = p55;
end;

local function IsEquipped(p56) -- Line: 235
    -- upvalues: u18 (ref)
    if p56 then
        p56 = p56:IsA("HopperBin") and p56.Active or p56.Parent == u18;
    end;

    return p56;
end;

local function MakeSlot(p57, p58) -- Line: 239
    -- upvalues: u21 (copy), u12 (ref), NUMBER_OF_HOTBAR_SLOTS (copy), u15 (ref), u26 (ref), u29 (ref), u10 (ref), ContextActionService (copy), u23 (copy), u22 (ref), u18 (ref), u35 (ref), u25 (copy), u19 (ref), u27 (ref), u20 (ref), HotbarItem (copy), SBPView (copy), MakeSlot (copy), u17 (ref), u31 (ref), u14 (ref), AdjustHotbarFrames (copy), u24 (copy), Value2 (copy), NewGui (copy), u16 (ref)
    local u59 = p58 or #u21 + 1;
    local u60 = {
        Tool = nil,
        Index = u59,
        Frame = nil,
        View = nil
    };
    local u61 = nil;
    local u62 = nil;
    local u63 = nil;
    local u64 = nil;
    local u65 = false;

    function u60.Readjust(p66, p67, p68) -- Line: 256
        -- upvalues: u61 (ref), u12 (ref)
        u61:Readjust(u12, p67, p68);
    end;

    function u60.Fill(p69, u70) -- Line: 260
        -- upvalues: u61 (ref), u65 (ref), u64 (ref), NUMBER_OF_HOTBAR_SLOTS (ref), u15 (ref), u62 (ref), u26 (ref), u29 (ref), u10 (ref), ContextActionService (ref), u23 (ref), u22 (ref), u21 (ref)
        if not u70 then
            p69:Clear();

            return;
        end;

        p69.Tool = u70;

        local function assignToolData() -- Line: 268
            -- upvalues: u70 (copy), u61 (ref), u65 (ref)
            u61:ChangeIcon(u70.TextureId);
            u61:ChangeName(u70.Name);

            if u70:IsA("Tool") and u65 then
                u61:ChangeTip(u70.ToolTip);
            end;
        end;

        u61:ChangeIcon(u70.TextureId);
        u61:ChangeName(u70.Name);

        if u70:IsA("Tool") and u65 then
            u61:ChangeTip(u70.ToolTip);
        end;

        if u64 then
            u64:disconnect();
            u64 = nil;
        end;

        u64 = u70.Changed:connect(function(p71) -- Line: 284
            -- upvalues: u70 (copy), u61 (ref), u65 (ref)
            if p71 == "TextureId" or (p71 == "Name" or p71 == "ToolTip") then
                u61:ChangeIcon(u70.TextureId);
                u61:ChangeName(u70.Name);

                if u70:IsA("Tool") and u65 then
                    u61:ChangeTip(u70.ToolTip);
                end;
            end;
        end);
        local v72 = p69.Index <= NUMBER_OF_HOTBAR_SLOTS;

        if not v72 or u15.state.isOpen then
            u62.Draggable = true;
            u61:ChangeDraggableStatus(true);
        end;

        p69:UpdateEquipView();

        if v72 then
            u26 = u26 + 1;

            if u29 and (u26 >= 1 and not u10) then
                u10 = true;
                ContextActionService:BindAction("HotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
            end;
        end;

        u23[u70] = p69;
        local v73;

        for i = 1, NUMBER_OF_HOTBAR_SLOTS do
            v73 = u21[i];

            if not v73.Tool then
                break;
            end;

            local _ = i;
        end;

        v73 = nil;
        u22 = v73;
    end;

    function u60.Clear(p74) -- Line: 316
        -- upvalues: u64 (ref), u61 (ref), u62 (ref), NUMBER_OF_HOTBAR_SLOTS (ref), u26 (ref), u10 (ref), ContextActionService (ref), u23 (ref), u22 (ref), u21 (ref)
        if not p74.Tool then
            return;
        end;

        if u64 then
            u64:disconnect();
            u64 = nil;
        end;

        u61:Clear();
        u62.Draggable = false;
        u61:ChangeDraggableStatus(false);
        p74:UpdateEquipView(true);

        if p74.Index <= NUMBER_OF_HOTBAR_SLOTS then
            u26 = u26 - 1;

            if u26 < 1 then
                u10 = false;
                ContextActionService:UnbindAction("HotbarEquip");
            end;
        end;

        u23[p74.Tool] = nil;
        p74.Tool = nil;
        local v75;

        for i = 1, NUMBER_OF_HOTBAR_SLOTS do
            v75 = u21[i];

            if not v75.Tool then
                break;
            end;

            local _ = i;
        end;

        v75 = nil;
        u22 = v75;
    end;

    function u60.UpdateEquipView(p76, p77) -- Line: 344
        -- upvalues: u18 (ref), u35 (ref), u60 (copy), u61 (ref)
        if not p77 then
            local Tool = p76.Tool;

            if Tool then
                Tool = Tool:IsA("HopperBin") and Tool.Active or Tool.Parent == u18;
            end;

            if Tool then
                u35 = u60;
                u61:ChangeEquipStatus(true);

                return;
            end;
        end;

        u61:ChangeEquipStatus(false);
    end;

    function u60.IsEquipped(p78) -- Line: 353
        -- upvalues: u18 (ref)
        local Tool = p78.Tool;

        if Tool then
            Tool = Tool:IsA("HopperBin") and Tool.Active or Tool.Parent == u18;
        end;

        return Tool;
    end;

    function u60.Delete(p79) -- Line: 357
        -- upvalues: u25 (ref), u62 (ref), u61 (ref), u21 (ref), u15 (ref)
        u25[u62] = nil;
        u61:Destroy();
        u62:Destroy();
        table.remove(u21, p79.Index);

        for i = p79.Index, #u21 do
            u21[i]:SlideBack();
            local _ = i;
        end;

        u15:UpdateScrollingFrameCanvasSize();
    end;

    function u60.Swap(p80, p81) -- Line: 372
        local Tool = p80.Tool;
        local Tool2 = p81.Tool;
        p80:Clear();

        if Tool2 then
            p81:Clear();
            p80:Fill(Tool2);
        end;

        if Tool then
            p81:Fill(Tool);

            return;
        end;

        p81:Clear();
    end;

    function u60.SlideBack(p82) -- Line: 386
        -- upvalues: u62 (ref)
        p82.Index = p82.Index - 1;
        u62.Name = p82.Index;
        u62.LayoutOrder = p82.Index;
    end;

    function u60.TurnNumber(p83, p84) -- Line: 392
        -- upvalues: u61 (ref), u59 (ref)
        u61:ChangeNumber(not p84 and "" or tostring(u59 < 10 and u59 or 0));
    end;

    function u60.SetClickability(p85, p86) -- Line: 396
        -- upvalues: u62 (ref), u61 (ref)
        if p85.Tool then
            u62.Draggable = not p86;
            u61:ChangeDraggableStatus(u62.Draggable);
        end;
    end;

    function u60.CheckTerms(p87, p88) -- Line: 403
        local u89 = 0;

        local function checkEm(p90, p91) -- Line: 405
            -- upvalues: u89 (ref)
            local _, v92 = p90:lower():gsub(p91:gsub("%W", "%%%0"), "");
            u89 = u89 + v92;
        end;

        local Tool = p87.Tool;

        if Tool then
            for i in pairs(p88) do
                local _, v93 = Tool.Name:lower():gsub(i:gsub("%W", "%%%0"), "");
                u89 = u89 + v93;

                if Tool:IsA("Tool") then
                    local _, v94 = (Tool.ToolTip or ""):lower():gsub(i:gsub("%W", "%%%0"), "");
                    u89 = u89 + v94;
                end;
            end;
        end;

        return u89;
    end;

    function u60.Select(p95, p96) -- Line: 423
        -- upvalues: u60 (copy), u18 (ref), u19 (ref), u27 (ref), u23 (ref), u20 (ref)
        if p96 then
            return;
        end;

        local Tool = u60.Tool;

        if Tool then
            local v97;

            if Tool then
                v97 = Tool:IsA("HopperBin") and Tool.Active or Tool.Parent == u18;
            else
                v97 = Tool;
            end;

            if v97 then
                if u19 then
                    u19:UnequipTools();

                    if u27 then
                        u27:ToggleSelect();
                        u23[u27]:UpdateEquipView();
                        u27 = nil;
                    end;
                end;
            elseif Tool.Parent == u20 then
                if u19 then
                    u19:UnequipTools();

                    if u27 then
                        u27:ToggleSelect();
                        u23[u27]:UpdateEquipView();
                        u27 = nil;
                    end;
                end;

                if Tool:IsA("HopperBin") then
                    Tool:ToggleSelect();
                    u23[Tool]:UpdateEquipView();
                    u27 = Tool;

                    return;
                end;

                Tool.Parent = u18;
            end;
        end;
    end;

    u62 = HotbarItem:Clone();
    u62.Visible = true;
    u62.Name = u59;
    u62.Active = true;
    u62.Draggable = false;
    u62.MouseButton1Click:connect(function() -- Line: 445
        -- upvalues: u60 (copy)
        changeSlot(u60);
    end);
    u60.Frame = u62;
    u61 = SBPView.HotbarItem.new(u62);
    u60.View = u61;
    u60.Frame.LayoutOrder = u60.Index;

    if u59 <= NUMBER_OF_HOTBAR_SLOTS then
        u62.MouseEnter:connect(function() -- Line: 455
            -- upvalues: u65 (ref), u60 (copy), u61 (ref)
            u65 = true;
            local v98 = u60.Tool and u60.Tool:IsA("Tool") and u60.Tool.ToolTip;

            if v98 and v98 ~= "" then
                u61:ChangeTip(v98);
            end;
        end);
        u62.MouseLeave:connect(function() -- Line: 463
            -- upvalues: u65 (ref), u61 (ref)
            u65 = false;
            u61:ChangeTip("");
        end);

        function u60.MoveToInventory(p99) -- Line: 468
            -- upvalues: u60 (copy), NUMBER_OF_HOTBAR_SLOTS (ref), MakeSlot (ref), u17 (ref), u18 (ref), u19 (ref), u27 (ref), u23 (ref), u31 (ref), u14 (ref), AdjustHotbarFrames (ref)
            if u60.Index <= NUMBER_OF_HOTBAR_SLOTS and u60.Tool then
                local Tool = u60.Tool;
                p99:Clear();
                local v100 = MakeSlot(u17);
                v100:Fill(Tool);

                if Tool then
                    Tool = Tool:IsA("HopperBin") and Tool.Active or Tool.Parent == u18;
                end;

                if Tool and u19 then
                    u19:UnequipTools();

                    if u27 then
                        u27:ToggleSelect();
                        u23[u27]:UpdateEquipView();
                        u27 = nil;
                    end;
                end;

                if u31 then
                    v100.Frame.Visible = false;
                    v100.Frame.Parent = u14;
                end;

                AdjustHotbarFrames();
            end;
        end;

        if u59 < 10 or u59 == NUMBER_OF_HOTBAR_SLOTS then
            u61:ChangeNumber("");

            u24[Value2 + (u59 < 10 and (u59 or 0) or 0)] = function(p101) -- Line: 491
                -- upvalues: u60 (copy)
                u60:Select(p101);
            end;
        end;
    end;

    local Position = u62.Position;
    local u102 = 0;
    local u103 = nil;
    u62.DragBegin:connect(function(p104) -- Line: 502
        -- upvalues: u25 (ref), u62 (ref), Position (ref), u61 (ref), u103 (ref), u17 (ref), u14 (ref), u63 (ref), NewGui (ref)
        u25[u62] = true;
        Position = p104;
        u61:ChangeDraggingStatus(true);
        u103 = u62.Parent;

        if u103 == u17 then
            local UDim2_new_ret = UDim2.new(0, u62.AbsolutePosition.X - u14.AbsolutePosition.X, 0, u62.AbsolutePosition.Y - u14.AbsolutePosition.Y);
            u62.Parent = u14;
            u62.Position = UDim2_new_ret;
            u63 = NewGui("Frame", "FakeSlot");
            u63.LayoutOrder = u62.LayoutOrder;
            u63.Size = u62.Size;
            u63.BackgroundTransparency = 1;
            u63.Parent = u17;
        end;

        u62.Parent.ZIndex = 2;
        u62.ZIndex = 2;
    end);
    u62.DragStopped:connect(function(p105, p106) -- Line: 527
        -- upvalues: u63 (ref), u62 (ref), Position (ref), u103 (ref), u61 (ref), u25 (ref), u60 (copy), u14 (ref), NUMBER_OF_HOTBAR_SLOTS (ref), u102 (ref), u22 (ref), u12 (ref), u21 (ref), u18 (ref), u19 (ref), u27 (ref), u23 (ref), u31 (ref)
        if u63 then
            u63:Destroy();
        end;

        local v107 = tick();
        u62.ZIndex = 1;
        u62.Parent.ZIndex = 1;
        u62.Position = Position;
        u62.Parent = u103;
        u61:ChangeDraggingStatus(false);
        u25[u62] = nil;

        if not u60.Tool then
            return;
        end;

        local v108 = u14;
        local AbsolutePosition = v108.AbsolutePosition;
        local AbsoluteSize = v108.AbsoluteSize;
        local v109;

        if AbsolutePosition.X < p105 and (p105 <= AbsolutePosition.X + AbsoluteSize.X and AbsolutePosition.Y < p106) then
            v109 = p106 <= AbsolutePosition.Y + AbsoluteSize.Y;
        else
            v109 = false;
        end;

        if v109 then
            if u60.Index <= NUMBER_OF_HOTBAR_SLOTS then
                u60:MoveToInventory();
            end;

            if NUMBER_OF_HOTBAR_SLOTS < u60.Index and v107 - u102 < 0.5 then
                if u22 then
                    local Tool = u60.Tool;
                    u60:Clear();
                    u22:Fill(Tool);
                    u60:Delete();
                    v107 = 0;
                else
                    v107 = 0;
                end;
            end;
        else
            local v110 = u12;
            local AbsolutePosition2 = v110.AbsolutePosition;
            local AbsoluteSize2 = v110.AbsoluteSize;
            local v111;

            if AbsolutePosition2.X < p105 and (p105 <= AbsolutePosition2.X + AbsoluteSize2.X and AbsolutePosition2.Y < p106) then
                v111 = p106 <= AbsolutePosition2.Y + AbsoluteSize2.Y;
            else
                v111 = false;
            end;

            if v111 then
                local v112 = { (1 / 0), nil };

                for i = 1, NUMBER_OF_HOTBAR_SLOTS do
                    local v113 = u21[i];
                    local Frame = v113.Frame;
                    local Vector2_new_ret = Vector2.new(p105, p106);
                    local magnitude = (Frame.AbsolutePosition + Frame.AbsoluteSize / 2 - Vector2_new_ret).magnitude;
                    local v114;

                    if magnitude < v112[1] then
                        v114 = i;
                        v112 = { magnitude, v113 };
                    else
                        v114 = i;
                    end;
                end;

                local v115 = v112[2];

                if v115 ~= u60 then
                    u60:Swap(v115);

                    if NUMBER_OF_HOTBAR_SLOTS < u60.Index then
                        local Tool = u60.Tool;

                        if Tool then
                            if Tool then
                                Tool = Tool:IsA("HopperBin") and Tool.Active or Tool.Parent == u18;
                            end;

                            if Tool and u19 then
                                u19:UnequipTools();

                                if u27 then
                                    u27:ToggleSelect();
                                    u23[u27]:UpdateEquipView();
                                    u27 = nil;
                                end;
                            end;

                            if u31 then
                                u60.Frame.Visible = false;
                                u60.Frame.Parent = u14;
                            end;
                        else
                            u60:Delete();
                        end;
                    end;
                end;
            elseif u60.Index <= NUMBER_OF_HOTBAR_SLOTS then
                u60:MoveToInventory();
            end;
        end;

        u102 = v107;
    end);
    u62.Parent = p57;
    u21[u59] = u60;

    if NUMBER_OF_HOTBAR_SLOTS < u59 then
        u15:UpdateScrollingFrameCanvasSize();

        if u15.state.isOpen and not u31 then
            u16.CanvasPosition = Vector2.new(0, (math.max(0, u16.CanvasSize.Y.Offset - u16.AbsoluteSize.Y)));
        end;
    end;

    return u60;
end;

local function OnChildAdded(u116) -- Line: 617
    -- upvalues: u18 (ref), u19 (ref), u27 (ref), u23 (copy), u28 (ref), LocalPlayer (ref), u22 (ref), MakeSlot (copy), u17 (ref), u21 (copy), u20 (ref), AdjustHotbarFrames (copy), NUMBER_OF_HOTBAR_SLOTS (copy), u15 (ref), u25 (copy)
    if not (u116:IsA("Tool") or u116:IsA("HopperBin")) then
        if u116:IsA("Humanoid") and u116.Parent == u18 then
            u19 = u116;
        end;

        return;
    end;

    if u27 and u116.Parent == u18 then
        u27:ToggleSelect();
        u23[u27]:UpdateEquipView();
        u27 = nil;
    end;

    if not (u28 or (u116.Parent ~= u18 or u23[u116])) then
        local StarterGear = LocalPlayer:FindFirstChild("StarterGear");

        if StarterGear and StarterGear:FindFirstChild(u116.Name) then
            u28 = true;

            for i = (u22 or MakeSlot(u17)).Index, 1, -1 do
                local v117 = u21[i];
                local v118 = i - 1;
                local v119;

                if v118 > 0 then
                    u21[v118]:Swap(v117);
                    v119 = i;
                else
                    v117:Fill(u116);
                    v119 = i;
                end;
            end;

            for _, child in pairs(u18:GetChildren()) do
                if child:IsA("Tool") and child ~= u116 then
                    child.Parent = u20;
                end;
            end;

            AdjustHotbarFrames();

            return;
        end;
    end;

    local v120 = u23[u116];

    if v120 then
        v120:UpdateEquipView();
    else
        local u121 = u22 or MakeSlot(u17);
        u121:Fill(u116);

        if u121.Index <= NUMBER_OF_HOTBAR_SLOTS and not u15.state.isOpen then
            AdjustHotbarFrames();
        end;

        if u116:IsA("HopperBin") and u116.Active then
            if u19 then
                u19:UnequipTools();

                if u27 then
                    u27:ToggleSelect();
                    u23[u27]:UpdateEquipView();
                    u27 = nil;
                end;
            end;

            u27 = u116;
        end;

        local u122 = u18;
        local u123 = u20;
        task.delay(0.1, function() -- Line: 678
            -- upvalues: u18 (ref), u122 (copy), LocalPlayer (ref), u20 (ref), u123 (copy), u116 (copy), u23 (ref), u121 (ref), NUMBER_OF_HOTBAR_SLOTS (ref), u25 (ref), u21 (ref), u22 (ref), AdjustHotbarFrames (ref)
            if u18 ~= u122 or (LocalPlayer.Character ~= u122 or u20 ~= u123) then
                return;
            end;

            if u116.Parent ~= u18 and u116.Parent ~= u20 then
                return;
            end;

            local v124 = u23[u116];

            if v124 ~= u121 or (v124.Tool ~= u116 or (NUMBER_OF_HOTBAR_SLOTS < v124.Index or u25[v124.Frame])) then
                return;
            end;

            if _G.GSettings and (_G.GSettings.StarterGear == false and u116:GetAttribute("IsStarterGear")) then
                v124:MoveToInventory();

                if not next(u25) then
                    for i = 1, NUMBER_OF_HOTBAR_SLOTS do
                        local v125 = u21[i];
                        local v126;

                        if v125.Tool and not (v125.Tool:GetAttribute("IsStarterGear") or (not u22 or u22.Index >= i)) then
                            v125:Swap(u22);
                            v126 = i;
                        else
                            v126 = i;
                        end;
                    end;

                    AdjustHotbarFrames();
                end;
            end;
        end);
    end;
end;

local function OnChildRemoved(p127) -- Line: 709
    -- upvalues: u18 (ref), u20 (ref), u23 (copy), NUMBER_OF_HOTBAR_SLOTS (copy), u15 (ref), AdjustHotbarFrames (copy), u27 (ref), u21 (copy)
    if not (p127:IsA("Tool") or p127:IsA("HopperBin")) then
        return;
    end;

    local Parent = p127.Parent;

    if Parent == u18 or Parent == u20 then
        return;
    end;

    local v128 = u23[p127];

    if v128 then
        v128:Clear();

        if NUMBER_OF_HOTBAR_SLOTS < v128.Index then
            v128:Delete();
        elseif not u15.state.isOpen then
            AdjustHotbarFrames();
        end;
    end;

    if p127 == u27 then
        u27 = nil;
    end;

    local v129 = true;

    for i = NUMBER_OF_HOTBAR_SLOTS + 1, #u21 do
        local v130 = u21[i];

        if v130 and v130.Tool then
            v129 = false;
            break;
        end;

        local _ = i;
    end;
end;

local function OnCharacterAdded(p131) -- Line: 743
    -- upvalues: u21 (copy), NUMBER_OF_HOTBAR_SLOTS (copy), u27 (ref), u33 (ref), u18 (ref), OnChildRemoved (copy), OnChildAdded (copy), u20 (ref), LocalPlayer (ref), AdjustHotbarFrames (copy), u15 (ref), u1 (copy)
    for i = #u21, 1, -1 do
        local v132 = u21[i];

        if v132.Tool then
            v132:Clear();
        end;

        local v133;

        if NUMBER_OF_HOTBAR_SLOTS < i then
            v132:Delete();
            v133 = i;
        else
            v133 = i;
        end;
    end;

    u27 = nil;

    for _, v in pairs(u33) do
        v:disconnect();
    end;

    u33 = {};
    u18 = p131;
    table.insert(u33, p131.ChildRemoved:connect(OnChildRemoved));
    table.insert(u33, p131.ChildAdded:connect(OnChildAdded));

    for _, child in pairs(p131:GetChildren()) do
        OnChildAdded(child);
    end;

    u20 = LocalPlayer:WaitForChild("Backpack");
    table.insert(u33, u20.ChildRemoved:connect(OnChildRemoved));
    table.insert(u33, u20.ChildAdded:connect(OnChildAdded));

    for _, child in pairs(u20:GetChildren()) do
        OnChildAdded(child);
    end;

    AdjustHotbarFrames();

    if u15.state.isOpen and u1.OpenClose then
        u1.OpenClose();
    end;
end;

local function OnInputBegan(p134, p135) -- Line: 786
    -- upvalues: u30 (ref), u29 (ref), Value3 (copy), u24 (copy), u15 (ref), u1 (copy)
    local v136 = p134.UserInputType == Enum.UserInputType.Keyboard and not (u30 or not u29 and p134.KeyCode.Value ~= Value3) and u24[p134.KeyCode.Value];

    if v136 then
        v136(p135);
    end;

    local UserInputType = p134.UserInputType;

    if not (p135 or UserInputType ~= Enum.UserInputType.MouseButton1 and UserInputType ~= Enum.UserInputType.Touch) and u15.state.isOpen then
        u1.OpenClose();
    end;
end;

local function OnUISChanged(p137) -- Line: 805
    -- upvalues: UserInputService (copy), NUMBER_OF_HOTBAR_SLOTS (copy), u21 (copy)
    if p137 == "KeyboardEnabled" then
        local KeyboardEnabled = UserInputService.KeyboardEnabled;

        for i = 1, NUMBER_OF_HOTBAR_SLOTS do
            u21[i]:TurnNumber(KeyboardEnabled);
            local _ = i;
        end;
    end;
end;

local u138 = nil;
local u139 = nil;

local function u140() -- Line: 817
end;

function unbindAllGamepadEquipActions()
    -- upvalues: ContextActionService (copy)
    ContextActionService:UnbindAction("BackpackHasGamepadFocus");
    ContextActionService:UnbindAction("CloseInventory");
end;

function changeToolFunc(p141, p142, u143)
    -- upvalues: u138 (ref), u139 (ref), u19 (ref), u27 (ref), u23 (copy), NUMBER_OF_HOTBAR_SLOTS (copy), u21 (copy), u35 (ref)
    if p142 ~= Enum.UserInputState.Begin then
        return;
    end;

    if u138 and (u138.KeyCode == Enum.KeyCode.ButtonR1 and u143.KeyCode == Enum.KeyCode.ButtonL1 or u138.KeyCode == Enum.KeyCode.ButtonL1 and u143.KeyCode == Enum.KeyCode.ButtonR1) and tick() - u139 <= 0.06 then
        if u19 then
            u19:UnequipTools();

            if u27 then
                u27:ToggleSelect();
                u23[u27]:UpdateEquipView();
                u27 = nil;
            end;
        end;

        u138 = u143;
        u139 = tick();

        return;
    end;

    u138 = u143;
    u139 = tick();
    delay(0.06, function() -- Line: 844
        -- upvalues: u138 (ref), u143 (copy), NUMBER_OF_HOTBAR_SLOTS (ref), u21 (ref), u19 (ref), u27 (ref), u23 (ref), u35 (ref)
        if u138 ~= u143 then
            return;
        end;

        local v144 = u143.KeyCode == Enum.KeyCode.ButtonL1 and -1 or 1;

        for i = 1, NUMBER_OF_HOTBAR_SLOTS do
            if u21[i]:IsEquipped() then
                local v145 = v144 + i;
                local v146 = false;

                if NUMBER_OF_HOTBAR_SLOTS < v145 then
                    v145 = 1;
                    v146 = true;
                elseif v145 < 1 then
                    v145 = NUMBER_OF_HOTBAR_SLOTS;
                    v146 = true;
                end;

                local v147 = v145;

                while not u21[v145].Tool do
                    v145 = v145 + v144;

                    if v145 == v147 then
                        return;
                    end;

                    if NUMBER_OF_HOTBAR_SLOTS < v145 then
                        v145 = 1;
                        v146 = true;
                    elseif v145 < 1 then
                        v145 = NUMBER_OF_HOTBAR_SLOTS;
                        v146 = true;
                    end;
                end;

                if not v146 then
                    u21[v145]:Select();

                    return;
                end;

                if u19 then
                    u19:UnequipTools();

                    if u27 then
                        u27:ToggleSelect();
                        u23[u27]:UpdateEquipView();
                        u27 = nil;
                    end;
                end;

                u35 = nil;

                return;
            end;

            local _ = i;
        end;

        if u35 and u35.Tool then
            u35:Select();

            return;
        end;

        for i = v144 == -1 and (NUMBER_OF_HOTBAR_SLOTS or 1) or 1, v144 == -1 and 1 or NUMBER_OF_HOTBAR_SLOTS, v144 do
            if u21[i].Tool then
                u21[i]:Select();

                return;
            end;

            local _ = i;
        end;
    end);
end;

function getGamepadSwapSlot()
    -- upvalues: u21 (copy)
    for i = 1, #u21 do
        if u21[i].View.state.isSelected then
            return u21[i];
        end;

        local _ = i;
    end;

    return nil;
end;

function changeSlot(p148)
    -- upvalues: GamepadService (copy), GuiService (copy), NUMBER_OF_HOTBAR_SLOTS (copy)
    if p148.Frame == GuiService.SelectedObject and not GamepadService.GamepadCursorEnabled then
        local v149 = getGamepadSwapSlot();

        if not v149 then
            p148.View:ChangeSelectStatus(true);

            return;
        end;

        v149.View:ChangeSelectStatus(false);

        if v149 ~= p148 then
            p148:Swap(v149);

            if NUMBER_OF_HOTBAR_SLOTS < p148.Index and not p148.Tool then
                if GuiService.SelectedObject == p148.Frame then
                    GuiService.SelectedObject = v149.Frame;
                end;

                p148:Delete();
            end;

            if NUMBER_OF_HOTBAR_SLOTS < v149.Index and not v149.Tool then
                if GuiService.SelectedObject == v149.Frame then
                    GuiService.SelectedObject = p148.Frame;
                end;

                v149:Delete();
            end;
        end;
    else
        p148:Select();
    end;
end;

function enableGamepadInventoryControl()
    -- upvalues: u15 (ref), u1 (copy), ContextActionService (copy), u140 (copy), GuiService (copy), u12 (ref)
    local function v154(p150, p151, p152) -- Line: 953
        -- upvalues: u15 (ref), u1 (ref)
        if p151 ~= Enum.UserInputState.Begin then
            return;
        end;

        if getGamepadSwapSlot() then
            local v153 = getGamepadSwapSlot();

            if v153 then
                v153.View:ChangeSelectStatus(false);
            end;
        elseif u15.state.isOpen then
            u1.OpenClose();
        end;
    end;

    ContextActionService:BindAction("BackpackHasGamepadFocus", u140, false, Enum.UserInputType.Gamepad1);
    ContextActionService:BindAction("CloseInventory", v154, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart);
    GuiService.SelectedObject = u12:FindFirstChild("1");
end;

function disableGamepadInventoryControl()
    -- upvalues: NUMBER_OF_HOTBAR_SLOTS (copy), u21 (copy), GuiService (copy), u11 (ref)
    unbindAllGamepadEquipActions();

    for i = 1, NUMBER_OF_HOTBAR_SLOTS do
        local v155 = u21[i];
        local v156;

        if v155 and v155.Frame then
            v155.View:ChangeSelectStatus(false);
            v155.Frame.BorderSizePixel = 0;
            v156 = i;
        else
            v156 = i;
        end;
    end;

    if GuiService.SelectedObject and GuiService.SelectedObject:IsDescendantOf(u11) then
        GuiService.SelectedObject = nil;
    end;
end;

local function bindBackpackHotbarAction() -- Line: 990
    -- upvalues: u29 (ref), u10 (ref), ContextActionService (copy)
    if u29 and not u10 then
        u10 = true;
        ContextActionService:BindAction("HotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
    end;
end;

local function unbindBackpackHotbarAction() -- Line: 997
    -- upvalues: u10 (ref), ContextActionService (copy)
    disableGamepadInventoryControl();
    u10 = false;
    ContextActionService:UnbindAction("HotbarEquip");
end;

function gamepadDisconnected()
    -- upvalues: u34 (ref)
    u34 = false;
    disableGamepadInventoryControl();
end;

function gamepadConnected()
    -- upvalues: u34 (ref), GuiService (copy), u11 (ref), u26 (ref), u29 (ref), u10 (ref), ContextActionService (copy), u15 (ref)
    u34 = true;
    GuiService:AddSelectionParent("BackpackSelection", u11);

    if u26 >= 1 and (u29 and not u10) then
        u10 = true;
        ContextActionService:BindAction("HotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
    end;

    if u15.state.isOpen then
        enableGamepadInventoryControl();
    end;
end;

local function onBackpackEnabledChanged() -- Line: 1021
    -- upvalues: u8 (ref), u29 (ref), u11 (ref), u26 (ref), u10 (ref), ContextActionService (copy), MobileControls (copy)
    local v157 = game.Players.LocalPlayer:GetAttribute("IsBackpackEnabled") and u8;
    u29 = v157;
    u11.Visible = v157;

    if v157 then
        if u26 >= 1 and (u29 and not u10) then
            u10 = true;
            ContextActionService:BindAction("HotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
        end;

        MobileControls.EnableButton("backpack", true, true);

        return;
    end;

    disableGamepadInventoryControl();
    u10 = false;
    ContextActionService:UnbindAction("HotbarEquip");
    MobileControls.EnableButton("backpack", false, true);
end;

MobileControls.EnableButton("backpack", true, true);
MobileControls.ToggleButton("backpack", false, true, true);

if MobileControls.InputEvent then
    MobileControls.InputEvent.Event:Connect(function(p158, p159) -- Line: 1042
        -- upvalues: u1 (copy)
        if p158 == "backpack" and (p159 or false) ~= u1.IsOpen then
            u1.OpenClose();
        end;
    end);
end;

u11 = NewGui("Frame", "Backpack");
u11.Visible = false;
u11.Parent = CoreGUI;
u13 = SBPView.OpenInventoryButton.new(BPPrefabs.OpenInventory:Clone());
u13:GetButton().Activated:connect(function() -- Line: 1062
    -- upvalues: u1 (copy)
    u1.OpenClose();
end);
u13:GetFrame().Parent = u11;
u14 = BPPrefabs.Inventory:Clone();
u14.Active = false;
u14.Parent = u11;
u12 = NewGui("Frame", "Hotbar");
u12.Parent = u11;

for i = 1, NUMBER_OF_HOTBAR_SLOTS do
    local v160 = MakeSlot(u12, i);
    v160.Frame.Visible = false;
    local v161;

    if u22 then
        v161 = i;
    else
        u22 = v160;
        v161 = i;
    end;
end;

u15 = SBPView.Inventory.new(u14);
local Components = u15:GetComponents();
u16 = Components.scrollingFrame;
u17 = Components.gridFrame;
u15:UpdateBackpackLayout(u12);
AdjustHotbarFrames();
AdjustInventoryFrames();
local v162 = BPPrefabs.GamepadHintsFrame:Clone();
v162.Parent = u11;
local u163 = SBPView.GamepadHintsFrame.new(v162);
local searchFrame = Components.searchFrame;

if searchFrame:IsA("GuiObject") then
    searchFrame.Selectable = false;
end;

for _, descendant in pairs(searchFrame:GetDescendants()) do
    if descendant:IsA("GuiObject") then
        descendant.Selectable = false;
    end;
end;

local searchTextBox = Components.searchTextBox;
searchTextBox.Text = "";
local searchClearButton = Components.searchClearButton;
searchClearButton.Visible = false;

local function search() -- Line: 1120
    -- upvalues: searchTextBox (copy), NUMBER_OF_HOTBAR_SLOTS (copy), u21 (copy), u14 (ref), u31 (ref), u17 (ref), u16 (ref), u15 (ref), searchClearButton (copy)
    local v164 = {};

    for i in searchTextBox.Text:gmatch("%S+") do
        v164[i:lower()] = true;
    end;

    local v165 = {};

    for i = NUMBER_OF_HOTBAR_SLOTS + 1, #u21 do
        local v166 = u21[i];
        local v167 = { v166, (v166:CheckTerms(v164)) };
        table.insert(v165, v167);
        v166.Frame.Visible = false;
        v166.Frame.Parent = u14;
        local _ = i;
    end;

    table.sort(v165, function(p168, p169) -- Line: 1135
        return p168[2] > p169[2];
    end);
    u31 = true;
    local v170 = 0;

    for _, v in ipairs(v165) do
        local v171 = v[1];

        if v[2] > 0 then
            v171.Frame.Visible = true;
            v171.Frame.Parent = u17;
            v171.Frame.LayoutOrder = NUMBER_OF_HOTBAR_SLOTS + v170;
            v170 = v170 + 1;
        end;
    end;

    u16.CanvasPosition = Vector2.new(0, 0);
    u15:UpdateScrollingFrameCanvasSize();
    searchClearButton.ZIndex = 3;
end;

local function clearResults() -- Line: 1157
    -- upvalues: searchClearButton (copy), u31 (ref), NUMBER_OF_HOTBAR_SLOTS (copy), u21 (copy), u17 (ref), u15 (ref)
    if searchClearButton.ZIndex > 0 then
        u31 = false;

        for i = NUMBER_OF_HOTBAR_SLOTS + 1, #u21 do
            local v172 = u21[i];
            v172.Frame.LayoutOrder = v172.Index;
            v172.Frame.Parent = u17;
            v172.Frame.Visible = true;
            local _ = i;
        end;

        searchClearButton.ZIndex = 0;
    end;

    u15:UpdateScrollingFrameCanvasSize();
end;

searchClearButton.MouseButton1Click:connect(function() -- Line: 1171, Name: reset
    -- upvalues: clearResults (copy), searchTextBox (copy)
    clearResults();
    searchTextBox.Text = "";
end);
searchTextBox.Changed:connect(function(p173) -- Line: 1176, Name: onChanged
    -- upvalues: searchTextBox (copy), clearResults (copy), search (copy), searchClearButton (copy)
    if p173 == "Text" then
        local Text = searchTextBox.Text;

        if Text == "" then
            clearResults();
        else
            search();
        end;

        searchClearButton.Visible = Text ~= "";
    end;
end);
searchTextBox.FocusLost:connect(function(p174) -- Line: 1188, Name: focusLost
    -- upvalues: search (copy)
    if p174 then
        search();
    end;
end);
u1.StateChanged.Event:connect(function(p175) -- Line: 1199
    -- upvalues: searchClearButton (copy), clearResults (copy), searchTextBox (copy)
    searchClearButton.Modal = p175;

    if not p175 then
        clearResults();
        searchTextBox.Text = "";
    end;
end);

u24[Enum.KeyCode.Escape.Value] = function(p176) -- Line: 1206
    -- upvalues: clearResults (copy), searchTextBox (copy), u15 (ref), u1 (copy)
    if not p176 then
        if u15.state.isOpen then
            u1.OpenClose();
        end;

        return;
    end;

    clearResults();
    searchTextBox.Text = "";
end;

local u177 = nil;
UserInputService.LastInputTypeChanged:connect(function(p178) -- Line: 1215, Name: detectGamepad
    -- upvalues: u15 (ref), searchTextBox (copy), u163 (copy), u177 (ref), u13 (ref)
    local v179 = p178 == Enum.UserInputType.Gamepad1;
    u15:ChangeSearchBoxVisibility(not v179);

    if v179 then
        searchTextBox:ReleaseFocus();
    end;

    if u15.state.isOpen then
        u163:ChangeOpenState(v179);
    end;

    if u177 ~= p178 and u13.lastInvButtonChangeState then
        u13:ChangeState(u13.lastInvButtonChangeState[1], u13.lastInvButtonChangeState[2]);
    end;

    u177 = p178;
end);

local function u183(p180, p181, p182) -- Line: 1238
    -- upvalues: GuiService (copy), NUMBER_OF_HOTBAR_SLOTS (copy), u21 (copy)
    if p181 ~= Enum.UserInputState.Begin then
        return;
    end;

    if not GuiService.SelectedObject then
        return;
    end;

    for i = 1, NUMBER_OF_HOTBAR_SLOTS do
        if u21[i].Frame == GuiService.SelectedObject and u21[i].Tool then
            u21[i]:MoveToInventory();

            return;
        end;

        local _ = i;
    end;
end;

local function openClose() -- Line: 1250
    -- upvalues: u25 (copy), u15 (ref), AdjustHotbarFrames (copy), u12 (ref), NUMBER_OF_HOTBAR_SLOTS (copy), u21 (copy), u34 (ref), u2 (copy), UserInputService (copy), u163 (copy), u14 (ref), ContextActionService (copy), u183 (copy), MobileControls (copy), u1 (copy)
    if not next(u25) then
        u15:ChangeOpenStatus(not u15.state.isOpen);
        local isOpen = u15.state.isOpen;
        AdjustHotbarFrames();
        u12.Active = not u12.Active;

        for i = 1, NUMBER_OF_HOTBAR_SLOTS do
            u21[i]:SetClickability(not isOpen);
            local _ = i;
        end;
    end;

    if u15.state.isOpen then
        if u34 then
            if u2[UserInputService:GetLastInputType()] then
                u163:Resize(u12, u14);
                u163:ChangeOpenState(true);
            end;

            enableGamepadInventoryControl();
        end;
    else
        if u34 then
            u163:ChangeOpenState(false);
        end;

        disableGamepadInventoryControl();
    end;

    if u15.state.isOpen then
        ContextActionService:BindAction("RemoveSlot", u183, false, Enum.KeyCode.ButtonX);
    else
        ContextActionService:UnbindAction("RemoveSlot");
    end;

    MobileControls.ToggleButton("backpack", u15.state.isOpen, true, true);
    u1.IsOpen = u15.state.isOpen;
    u1.StateChanged:Fire(u15.state.isOpen);
end;

u24[Value] = function() -- Line: 1288
    -- upvalues: GuiService (copy), openClose (copy)
    if GuiService.MenuIsOpen then
        return;
    end;

    openClose();
end;

u1.OpenClose = openClose;

while not LocalPlayer do
    wait();
    LocalPlayer = Players.LocalPlayer;
end;

LocalPlayer.CharacterAdded:connect(OnCharacterAdded);

if LocalPlayer.Character then
    OnCharacterAdded(LocalPlayer.Character);
end;

for i = 0, 9 do
    local v184 = tostring(i);
    table.insert(v32, v184);
    local _ = i;
end;

table.insert(v32, "`");
UserInputService.InputBegan:connect(OnInputBegan);
UserInputService.TextBoxFocused:connect(function() -- Line: 1323
    -- upvalues: u30 (ref)
    u30 = true;
end);
UserInputService.TextBoxFocusReleased:connect(function() -- Line: 1326
    -- upvalues: u30 (ref)
    u30 = false;
end);

u24[Value3] = function() -- Line: 1331
    -- upvalues: u27 (ref), u19 (ref), u23 (copy)
    if u27 and u19 then
        u19:UnequipTools();

        if u27 then
            u27:ToggleSelect();
            u23[u27]:UpdateEquipView();
            u27 = nil;
        end;
    end;
end;

UserInputService.Changed:connect(OnUISChanged);
local KeyboardEnabled = UserInputService.KeyboardEnabled;

for i = 1, NUMBER_OF_HOTBAR_SLOTS do
    u21[i]:TurnNumber(KeyboardEnabled);
    local _ = i;
end;

if UserInputService:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
    gamepadConnected();
end;

UserInputService.GamepadConnected:connect(function(p185) -- Line: 1345
    if p185 == Enum.UserInputType.Gamepad1 then
        gamepadConnected();
    end;
end);
UserInputService.GamepadDisconnected:connect(function(p186) -- Line: 1350
    if p186 == Enum.UserInputType.Gamepad1 then
        gamepadDisconnected();
    end;
end);

function u1.TopbarEnabledChanged(p187, p188) -- Line: 1357
    -- upvalues: u8 (ref), onBackpackEnabledChanged (copy)
    u8 = p188;
    onBackpackEnabledChanged();
end;

LocalPlayer:GetAttributeChangedSignal("IsBackpackEnabled"):Connect(onBackpackEnabledChanged);

if LocalPlayer:GetAttribute("IsBackpackEnabled") == nil then
    LocalPlayer:SetAttribute("IsBackpackEnabled", true);
else
    onBackpackEnabledChanged();
end;

GuiService.MenuOpened:Connect(function() -- Line: 1371
    -- upvalues: u1 (copy), u9 (ref), u12 (ref), u13 (ref)
    if u1.IsOpen then
        u1.OpenClose();
        u9 = true;
    end;

    if u1.IsHotbarVisible then
        u12.Visible = false;
        u13:ChangeState(false, false);
    end;
end);
GuiService.MenuClosed:Connect(function() -- Line: 1382
    -- upvalues: u1 (copy), u12 (ref), u13 (ref), u9 (ref)
    if u1.IsHotbarVisible then
        u12.Visible = true;
        u13:ChangeState(true, true);
    end;

    if u9 then
        u9 = false;
        u1.OpenClose();
    end;
end);
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false);

return v3;
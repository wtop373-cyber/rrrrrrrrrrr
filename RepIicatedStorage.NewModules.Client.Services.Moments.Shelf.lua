-- ============================================================
-- SCRIPT: Shelf
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Moments.Shelf
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local RunService = game:GetService("RunService");
local GamepadService = game:GetService("GamepadService");
local Kit = script.Parent:WaitForChild("Kit", 5);

if not Kit then
    return {};
end;

local u1 = require(Kit);
local v2 = {};
local LocalPlayer = Players.LocalPlayer;
local Random_new_ret = Random.new();
local u3 = false;
local u4 = false;
local u5 = false;
local u6 = (-1 / 0);
local u7 = nil;
local u8 = nil;
local u9 = nil;
local u10 = false;

local function onHead(p11, p12) -- Line: 28
    for _, child in ipairs(p12:GetChildren()) do
        if child:IsA("Attachment") and p11:FindFirstChild(child.Name) then
            return true;
        end;
    end;

    return false;
end;

local function copy(p13) -- Line: 37
    local Archivable = p13.Archivable;
    p13.Archivable = true;
    local v14 = p13:Clone();
    p13.Archivable = Archivable;

    if v14 then
        for _, child in ipairs(v14:GetChildren()) do
            if not (child:IsA("DataModelMesh") or (child:IsA("Decal") or child:IsA("SurfaceAppearance"))) then
                child:Destroy();
            end;
        end;

        v14.Anchored = true;

        return v14;
    end;
end;

local function headModel() -- Line: 54
    -- upvalues: LocalPlayer (copy), copy (copy), onHead (copy)
    local Character = LocalPlayer.Character;
    local v15;

    if Character then
        v15 = Character:FindFirstChild("Head");
    else
        v15 = Character;
    end;

    if not v15 then
        return;
    end;

    local Model = Instance.new("Model");
    local v16 = copy(v15);

    if v16 then
        v16.Parent = Model;
        Model.PrimaryPart = v16;

        for _, child in ipairs(Character:GetChildren()) do
            local v17 = child:IsA("Accessory") and child:FindFirstChild("Handle");

            if v17 and (v17:IsA("BasePart") and onHead(v15, v17)) then
                local v18 = copy(v17);

                if v18 then
                    v18.Parent = Model;
                end;
            end;
        end;

        return Model;
    end;
end;

local function view(p19, p20) -- Line: 79
    local ViewportFrame = Instance.new("ViewportFrame");
    ViewportFrame.Name = "V";
    ViewportFrame.Size = UDim2.fromScale(1, 1);
    ViewportFrame.BackgroundTransparency = 1;
    ViewportFrame.ZIndex = p19.ZIndex + 1;
    ViewportFrame.Ambient = Color3.fromRGB(150, 150, 150);
    ViewportFrame.LightColor = Color3.new(1, 1, 1);
    ViewportFrame.Visible = false;
    local v21 = p20:Clone();
    v21.Parent = ViewportFrame;
    local Camera = Instance.new("Camera");
    Camera.FieldOfView = 40;
    local PrimaryPart = v21.PrimaryPart;
    Camera.CFrame = (PrimaryPart.CFrame + PrimaryPart.CFrame.LookVector * 3) * CFrame.Angles(0, 3.141592653589793, 0);
    Camera.Parent = ViewportFrame;
    ViewportFrame.CurrentCamera = Camera;
    ViewportFrame.Parent = p19;

    return ViewportFrame;
end;

local function clear() -- Line: 100
    -- upvalues: u9 (ref)
    local v22 = u9;
    u9 = nil;

    if v22 then
        for _, v in ipairs(v22.views) do
            v.vp:Destroy();
        end;
    end;
end;

local function build() -- Line: 110
    -- upvalues: headModel (copy), u7 (ref), LocalPlayer (copy), view (copy)
    local v23 = headModel();
    local v24 = u7:FindFirstChild("ShopFrame") and u7.ShopFrame:FindFirstChild("MainFrame");

    if v23 and v24 then
        local v25 = {};
        local ListFrame1 = v24:FindFirstChild("ListFrame1");

        if ListFrame1 then
            for _, child in ipairs(ListFrame1:GetChildren()) do
                for _, child2 in ipairs(child:GetChildren()) do
                    local v26 = child2:IsA("Frame") and child2:FindFirstChild("Frame");

                    if v26 and (v26:FindFirstChild("Title") and v26:FindFirstChild("ItemImage")) then
                        local v27 = {
                            title = v26.Title,
                            img = v26.ItemImage,
                            kind = v26:FindFirstChild("Type")
                        };
                        table.insert(v25, v27);
                    end;
                end;
            end;
        end;

        local v28 = v24:FindFirstChild("PictureFrame") and v24.PictureFrame:FindFirstChild("Top");

        if v28 and (v28:FindFirstChild("Title") and v28:FindFirstChild("ItemImage")) then
            local v29 = {
                title = v28.Title,
                img = v28.ItemImage,
                kind = v28:FindFirstChild("Desc")
            };
            table.insert(v25, v29);
        end;

        local v30 = {
            views = {},
            owner = LocalPlayer.Character
        };

        for i, v in ipairs(v25) do
            v.vp = view(v.img, v23);
            table.insert(v30.views, v);

            if i % 12 == 0 then
                task.wait();
            end;
        end;

        v23:Destroy();

        return v30;
    end;
end;

local function prepare() -- Line: 144
    -- upvalues: u10 (ref), u9 (ref), u7 (ref), build (copy)
    while u10 do
        task.wait();
    end;

    if u9 then
        return true;
    end;

    if not u7 then
        return false;
    end;

    u10 = true;
    local success, result = pcall(build);
    u10 = false;

    if not (success and result) then
        return false;
    end;

    u9 = result;

    return true;
end;

local function show(u31) -- Line: 164
    -- upvalues: LocalPlayer (copy), u1 (copy), RunService (copy), ReplicatedStorage (copy), u8 (ref), GamepadService (copy)
    local u32 = "Head of " .. LocalPlayer.Name;
    local u33 = {};
    local v34 = u1.Screen(99000);
    local TextButton = Instance.new("TextButton");
    TextButton.Size = UDim2.fromScale(1, 1);
    TextButton.BackgroundTransparency = 1;
    TextButton.Text = "";
    TextButton.AutoButtonColor = false;
    TextButton.Parent = v34;

    local function apply() -- Line: 174
        -- upvalues: u31 (copy), u33 (copy), u32 (copy)
        for _, v in ipairs(u31.views) do
            if not u33[v] then
                local v35 = {};
                v35[1], v35[2], v35[3] = v.title.Text, v.kind and v.kind.Text, v.img.ImageTransparency;
                u33[v] = v35;
            end;

            v.title.Text = u32;

            if v.kind then
                v.kind.Text = "";
            end;

            v.img.ImageTransparency = 1;
            v.vp.Visible = true;
        end;
    end;

    local u36 = nil;
    pcall(function() -- Line: 188
        -- upvalues: apply (copy), u36 (ref), RunService (ref)
        apply();
        u36 = RunService.RenderStepped:Connect(apply);
        task.wait(1);
    end);

    if u36 then
        u36:Disconnect();
    end;

    u1.Flash(0.2);
    local v37 = ReplicatedStorage:FindFirstChild("Storage") and ReplicatedStorage.Storage:FindFirstChild("UISounds");

    if v37 then
        v37 = v37:FindFirstChild("close");
    end;

    local v38;

    if v37 then
        v38 = v37.Volume;
    else
        v38 = v37;
    end;

    if v37 then
        v37.Volume = 0;
    end;

    pcall(function() -- Line: 203
        -- upvalues: u8 (ref), ReplicatedStorage (ref), GamepadService (ref)
        if u8 and u8.Value then
            u8.Value = false;
            local Events = ReplicatedStorage:FindFirstChild("Events");

            if Events then
                Events = Events:FindFirstChild("BYZERSPROTEC");
            end;

            if Events then
                Events:FireServer(false);
            end;

            GamepadService:DisableGamepadCursor();
        end;
    end);

    for i, v in pairs(u33) do
        pcall(function() -- Line: 215
            -- upvalues: i (copy), v (copy)
            i.title.Text = v[1];

            if i.kind and v[2] then
                i.kind.Text = v[2];
            end;

            i.img.ImageTransparency = v[3];
        end);
    end;

    for _, v in ipairs(u31.views) do
        v.vp:Destroy();
    end;

    v34:Destroy();
    task.wait(1);

    if v37 then
        v37.Volume = v38;
    end;
end;

local function run() -- Line: 233
    -- upvalues: u3 (ref), u5 (ref), u9 (ref), LocalPlayer (copy), prepare (copy), show (copy)
    u3 = false;
    u5 = true;

    if u9 and u9.owner ~= LocalPlayer.Character then
        local v39 = u9;
        u9 = nil;

        if v39 then
            for _, v in ipairs(v39.views) do
                v.vp:Destroy();
            end;
        end;
    end;

    local v40 = prepare() and u9;

    if v40 then
        if u9 == v40 then
            u9 = nil;
        end;

        pcall(show, v40);
    end;

    u5 = false;
end;

local function closed() -- Line: 249
    -- upvalues: u5 (ref), u3 (ref), u6 (ref), Random_new_ret (copy), prepare (copy)
    if u5 or u3 then
        return;
    end;

    local os_clock_ret = os.clock();

    if os_clock_ret - u6 < 120 then
        return;
    end;

    u6 = os_clock_ret;

    if Random_new_ret:NextInteger(1, 1000) == 1 then
        u3 = true;
        task.spawn(prepare);
    end;
end;

local function slotsOf(p41) -- Line: 264
    local ListFrame1 = p41:FindFirstChild("ListFrame1");
    local v42 = {};

    for _, v in ipairs(ListFrame1 and ListFrame1:GetChildren() or {}) do
        for _, child in ipairs(v:GetChildren()) do
            local v43 = child:IsA("Frame") and child:FindFirstChild("Frame");

            if v43 and (v43:FindFirstChild("Title") and v43:FindFirstChild("ItemImage")) then
                local v44 = {
                    title = v43.Title,
                    img = v43.ItemImage,
                    kind = v43:FindFirstChild("Type")
                };
                table.insert(v42, v44);
            end;
        end;
    end;

    local PictureFrame = p41:FindFirstChild("PictureFrame");

    if PictureFrame then
        PictureFrame = PictureFrame:FindFirstChild("Top");
    end;

    if PictureFrame and (PictureFrame:FindFirstChild("Title") and PictureFrame:FindFirstChild("ItemImage")) then
        local v45 = {
            title = PictureFrame.Title,
            img = PictureFrame.ItemImage,
            kind = PictureFrame:FindFirstChild("Desc")
        };
        table.insert(v42, v45);
    end;

    return v42;
end;

local function holdOpen() -- Line: 283
    -- upvalues: u5 (ref), u7 (ref), LocalPlayer (copy), headModel (copy), slotsOf (copy), view (copy), RunService (copy), u8 (ref)
    u5 = true;
    local u46 = u7 and u7:FindFirstChild("ShopFrame") and u7.ShopFrame:FindFirstChild("MainFrame");

    if not u46 then
        u5 = false;

        return;
    end;

    local u47 = "Head of " .. LocalPlayer.Name;
    local u48 = headModel();
    local PictureFrame = u46:FindFirstChild("PictureFrame");
    local u49 = {};

    for _, v in ipairs({ "BuyButton", "SellButton", "PurchaseFrames", "UpgradeFrame" }) do
        local v50 = u46:FindFirstChild(v);

        if v50 and v50:IsA("GuiObject") then
            table.insert(u49, v50);
        end;
    end;

    for _, v in ipairs({ "StatsFrame", "BuyFrame" }) do
        local v51;

        if PictureFrame then
            v51 = PictureFrame:FindFirstChild(v);
        else
            v51 = PictureFrame;
        end;

        if v51 and v51:IsA("GuiObject") then
            table.insert(u49, v51);
        end;
    end;

    local u52 = {};
    local u53 = {};
    local u54 = {};

    local function u58() -- Line: 307
        -- upvalues: slotsOf (ref), u46 (copy), u52 (copy), u47 (copy), u48 (copy), u54 (copy), view (ref), u49 (copy), u53 (copy)
        local v55 = 0;

        for _, v in ipairs((slotsOf(u46))) do
            if not u52[v.title] then
                local title = v.title;
                local v56 = {};
                v56[1], v56[2], v56[3], v56[4] = v, v.title.Text, v.kind and v.kind.Text, v.img.ImageTransparency;
                u52[title] = v56;
            end;

            v.title.Text = u47;

            if v.kind then
                v.kind.Text = "";
            end;

            v.img.ImageTransparency = 1;

            if u48 and (not u54[v.img] and v55 < 24) then
                v55 = v55 + 1;
                local v57 = view(v.img, u48);
                v57.Visible = true;
                u54[v.img] = v57;
            end;
        end;

        for _, v in ipairs(u49) do
            if u53[v] == nil then
                u53[v] = v.Visible;
            end;

            v.Visible = false;
        end;
    end;

    local u59 = nil;
    pcall(function() -- Line: 333
        -- upvalues: u58 (copy), u59 (ref), RunService (ref), u8 (ref), LocalPlayer (ref)
        u58();
        u59 = RunService.RenderStepped:Connect(u58);

        repeat
            task.wait();
        until not (u8 and (u8.Value and LocalPlayer.Parent));
    end);

    if u59 then
        u59:Disconnect();
    end;

    for _, v in pairs(u52) do
        pcall(function() -- Line: 344
            -- upvalues: v (copy)
            local v60 = v[1];
            v60.title.Text = v[2];

            if v60.kind and v[3] then
                v60.kind.Text = v[3];
            end;

            v60.img.ImageTransparency = v[4];
        end);
    end;

    for i, v in pairs(u53) do
        pcall(function() -- Line: 354
            -- upvalues: i (copy), v (copy)
            i.Visible = v;
        end);
    end;

    for _, v in pairs(u54) do
        v:Destroy();
    end;

    if u48 then
        u48:Destroy();
    end;

    u5 = false;
end;

function v2.Start() -- Line: 367
    -- upvalues: u7 (ref), LocalPlayer (copy), u8 (ref), u5 (ref), u4 (ref), holdOpen (copy), u3 (ref), run (copy), u6 (ref), Random_new_ret (copy), prepare (copy), u9 (ref)
    u7 = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("CoreGUI");
    u8 = u7:WaitForChild("OpenValue");
    u8.Changed:Connect(function(p61) -- Line: 370
        -- upvalues: u5 (ref), u4 (ref), holdOpen (ref), u3 (ref), run (ref), u6 (ref), Random_new_ret (ref), prepare (ref)
        if u5 then
            return;
        end;

        if p61 then
            if u4 then
                task.spawn(holdOpen);

                return;
            end;

            if u3 then
                task.spawn(run);
            end;
        elseif not (u4 or u5) then
            if u3 then
                return;
            end;

            local os_clock_ret = os.clock();

            if os_clock_ret - u6 < 120 then
                return;
            end;

            u6 = os_clock_ret;

            if Random_new_ret:NextInteger(1, 1000) == 1 then
                u3 = true;
                task.spawn(prepare);
            end;
        end;
    end);
    LocalPlayer.CharacterAdded:Connect(function() -- Line: 384
        -- upvalues: u3 (ref), u5 (ref), u9 (ref), prepare (ref)
        if u3 and not u5 then
            local v62 = u9;
            u9 = nil;

            if v62 then
                for _, v in ipairs(v62.views) do
                    v.vp:Destroy();
                end;
            end;

            task.delay(3, function() -- Line: 387
                -- upvalues: u3 (ref), u5 (ref), prepare (ref)
                if u3 and not u5 then
                    prepare();
                end;
            end);
        end;
    end);
end;

function v2.Force() -- Line: 396
    -- upvalues: u5 (ref), u3 (ref), u9 (ref), prepare (copy)
    if u5 then
        return;
    end;

    u3 = true;
    local v63 = u9;
    u9 = nil;

    if v63 then
        for _, v in ipairs(v63.views) do
            v.vp:Destroy();
        end;
    end;

    task.spawn(prepare);
end;

function v2.Hold() -- Line: 405
    -- upvalues: u4 (ref), u3 (ref), u9 (ref), u8 (ref), u5 (ref), holdOpen (copy)
    u4 = true;
    u3 = false;
    local v64 = u9;
    u9 = nil;

    if v64 then
        for _, v in ipairs(v64.views) do
            v.vp:Destroy();
        end;
    end;

    if u8 and (u8.Value and not u5) then
        task.spawn(holdOpen);
    end;
end;

return v2;
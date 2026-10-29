-- ============================================================
-- SCRIPT: Skins
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Client.Services.Interface.Modules.Skins
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 15
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);
local u2 = {
    CONFIG = {
        MaxMassSelect = 15,
        RarityNumbers = {
            subcommon = 1,
            common = 2,
            uncommon = 3,
            rare = 4,
            legendary = 5,
            exotic = 6,
            limited = 7
        },
        CustomRarityNames = {
            subcommon = "COMMON",
            common = "UNCOMMON",
            uncommon = "RARE",
            rare = "EPIC",
            legendary = "LEGENDARY",
            exotic = "EXOTIC",
            limited = "LIMITED"
        },
        RarityBands = {
            subcommon = Color3.fromRGB(184, 211, 206),
            common = Color3.fromRGB(165, 255, 186),
            uncommon = Color3.fromRGB(53, 194, 255),
            rare = Color3.fromRGB(217, 2, 255),
            legendary = Color3.fromRGB(255, 25, 0),
            exotic = Color3.fromRGB(255, 136, 0),
            limited = Color3.fromRGB(255, 234, 3)
        }
    }
};
local u3 = nil;

function u2.new(p4) -- Line: 74
    -- upvalues: u2 (copy), u3 (ref)
    local u5 = {
        GUI = p4,
        Services = {}
    };
    u5.Services.ReplicatedStorage = game:GetService("ReplicatedStorage");
    u5.Services.RunService = game:GetService("RunService");
    u5.Services.TS = game:GetService("TweenService");
    u5.Services.MarketplaceService = game:GetService("MarketplaceService");
    u5.Services.GamepadService = game:GetService("GamepadService");
    u5.Services.UIS = game:GetService("UserInputService");
    u5.Services.Players = game:GetService("Players");
    u5.plr = u5.Services.Players.LocalPlayer;
    u5.mouse = u5.plr:GetMouse();
    u5.modules = {};
    u5.funcs = {};
    u5.events = {};
    u5.vars = {};
    u5.systems = {};
    u5.scDir = script.Assets;
    local NewModules = u5.Services.ReplicatedStorage:WaitForChild("NewModules");
    u5.modules.cosmeticRaritySellPrices = require(NewModules.Shared.Configuration.CosmeticRaritySellPrices);
    u5.modules.gamepasses = require(NewModules.Shared.Configuration.Gamepasses);
    u5.modules.products = require(NewModules.Shared.Configuration.Products);
    u5.modules.giftProducts = require(NewModules.Shared.Configuration.GiftProducts);
    u5.modules.deepCopy = require(NewModules.Shared.Extensions.DeepCopy);
    u5.modules.ViewportModel = require(NewModules.Client.Services.ViewportModel);
    u5.modules.addCommas = require(NewModules.Shared.Extensions.AddCommas);
    u5.modules.addKillTrackModel = require(NewModules.Shared.Extensions.AddKillTrackModel);
    u5.modules.addSouvenirSticker = require(NewModules.Shared.Extensions.AddSouvenirSticker);
    u5.modules.killTrackDisplayDecal = require(NewModules.Client.Services.Effects.KilltrackDisplayDecal);
    u5.modules.souvenirLabels = require(NewModules.Shared.Configuration.SouvenirLabels);
    u5.config = u5.modules.deepCopy(u2.CONFIG);
    u5.eventsF = u5.Services.ReplicatedStorage:WaitForChild("Events");
    u5.events2F = u5.Services.ReplicatedStorage:WaitForChild("Events2");
    u5.pd2 = u5.Services.ReplicatedStorage:WaitForChild("PlayerbaseData2", 1000);
    u5.md = u5.pd2:WaitForChild(u5.plr.Name, 1000);
    u5.uiSoundsF = u5.Services.ReplicatedStorage:WaitForChild("Storage"):WaitForChild("UISounds");
    u5.cosmeticsF = u5.Services.ReplicatedStorage.Storage.CosmeticsStuff;
    u5.events.cosmeticsInteract = u5.eventsF.CosmeticInteract;
    u5.events.caseUnboxEffect = u5.eventsF.CaseUnboxEffect;
    u5.events.cosmeticAdminV = u5.eventsF.CSMTETICADMVEW;
    u5.events._toggleGuiEvent = Instance.new("BindableEvent");
    u5.events._changeTabEvent = Instance.new("BindableEvent");

    repeat
        task.wait(0.5);
    until _G.GamepassCheck ~= nil;

    for _, child in pairs(script.Systems:GetChildren()) do
        u5.systems[child.Name] = require(child);
        u5.systems[child.Name].new(u5);
    end;

    u3 = function(p6) -- Line: 140
        -- upvalues: u5 (copy), u2 (ref)
        local v7 = {};
        local v8 = {};
        local v9 = {};

        for i, v in pairs(p6.skins) do
            local success, result = pcall(function() -- Line: 146
                -- upvalues: i (copy), u5 (ref), u2 (ref), v (copy)
                if i == "LIMITED" then
                    local v10 = u5.scDir.SkinLimitedTemplate:Clone();
                    v10.RarityBand.BackgroundColor3 = u2.CONFIG.RarityBands.limited;

                    if v10:FindFirstChild("Odds") then
                        v10.Odds:Destroy();
                    end;

                    return v10;
                end;

                if i == "EXOTIC" then
                    local v11 = u5.scDir.SkinExoticTemplate:Clone();
                    v11.RarityBand.BackgroundColor3 = u2.CONFIG.RarityBands.exotic;

                    return v11;
                end;

                if not v.Hidden then
                    return u5.systems.UI.CreateCosmeticFrame(u5, tostring(math.random()), v, "skin", true);
                end;

                local v12 = u5.scDir.SkinLimitedTemplate:Clone();
                v12.RarityBand.BackgroundColor3 = u2.CONFIG.RarityBands.limited;

                if v12:FindFirstChild("ItemType") then
                    v12.ItemType.Visible = true;
                    v12.ItemType.Text = "???";
                end;

                if v12:FindFirstChild("ContentsButton") then
                    v12.ContentsButton.Visible = false;
                end;

                for _, descendant in ipairs(v12:GetDescendants()) do
                    if (descendant:IsA("TextLabel") or descendant:IsA("TextButton")) and descendant.Text == "CONTENTS" then
                        descendant.Visible = false;
                    end;
                end;

                u5.systems.UI.SetOddsLabel(v12:FindFirstChild("Odds"), v.Odds);

                return v12;
            end);

            if success and result then
                result.Name = i;
                table.insert(v7, { result, v.Rarity });
            elseif not success then
                warn("GetCaseContents Error:", result);
            end;
        end;

        if p6.exotics then
            for i, v in pairs(p6.exotics) do
                local success, result = pcall(function() -- Line: 186
                    -- upvalues: u5 (ref), v (copy)
                    return u5.systems.UI.CreateCosmeticFrame(u5, tostring(math.random()), v, "skin", true);
                end);

                if success and result then
                    result.Name = i;
                    result.LayoutOrder = v.CustomLayoutOrder or result.LayoutOrder;
                    table.insert(v8, { result, v.Rarity });
                elseif not success then
                    warn("GetCaseContents Error:", result);
                end;
            end;
        end;

        if p6.limiteds then
            for i, v in pairs(p6.limiteds) do
                local success, result = pcall(function() -- Line: 201
                    -- upvalues: v (copy), u5 (ref), u2 (ref)
                    if not v.Hidden then
                        return u5.systems.UI.CreateCosmeticFrame(u5, tostring(math.random()), v, "skin", true);
                    end;

                    local v13 = u5.scDir.SkinLimitedTemplate:Clone();
                    v13.RarityBand.BackgroundColor3 = u2.CONFIG.RarityBands.limited;

                    if v13:FindFirstChild("ItemType") then
                        v13.ItemType.Visible = true;
                        v13.ItemType.Text = "???";
                    end;

                    if v13:FindFirstChild("ContentsButton") then
                        v13.ContentsButton.Visible = false;
                    end;

                    for _, descendant in ipairs(v13:GetDescendants()) do
                        if (descendant:IsA("TextLabel") or descendant:IsA("TextButton")) and descendant.Text == "CONTENTS" then
                            descendant.Visible = false;
                        end;
                    end;

                    u5.systems.UI.SetOddsLabel(v13:FindFirstChild("Odds"), v.Odds);

                    return v13;
                end);

                if success and result then
                    result.Name = i;
                    result.LayoutOrder = v.CustomLayoutOrder or result.LayoutOrder;
                    table.insert(v9, { result, v.Rarity });
                elseif not success then
                    warn("GetCaseContents Error:", result);
                end;
            end;
        end;

        table.sort(v7, function(p14, p15) -- Line: 226
            -- upvalues: u2 (ref)
            return u2.CONFIG.RarityNumbers[p14[2]] < u2.CONFIG.RarityNumbers[p15[2]];
        end);
        table.sort(v8, function(p16, p17) -- Line: 231
            -- upvalues: u2 (ref)
            return u2.CONFIG.RarityNumbers[p16[2]] < u2.CONFIG.RarityNumbers[p17[2]];
        end);
        table.sort(v9, function(p18, p19) -- Line: 236
            -- upvalues: u2 (ref)
            return u2.CONFIG.RarityNumbers[p18[2]] < u2.CONFIG.RarityNumbers[p19[2]];
        end);
        local v20 = {};
        local v21 = {};
        local v22 = {};

        for i, v in pairs(v7) do
            v[1].LayoutOrder = i;
            table.insert(v20, v[1]);
        end;

        for _, v in pairs(v8) do
            table.insert(v21, v[1]);
        end;

        for _, v in pairs(v9) do
            table.insert(v22, v[1]);
        end;

        return v20, v21, v22;
    end;

    for _, v in pairs(u5.systems) do
        if v.Connections then
            v.Connections(u5);
        end;
    end;
end;

function u2.GetCaseContentFrames(p23) -- Line: 270
    -- upvalues: u3 (ref)
    return u3(p23);
end;

return u2;
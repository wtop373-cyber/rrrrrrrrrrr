-- ============================================================
-- SCRIPT: GetSellPrice
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Extensions.GetSellPrice
-- ============================================================

-- Decompiled with Potassium's decompiler.

return function(p1, p2, p3) -- Line: 1
    local v4 = p3:FindFirstChild("Sellable") and (p3.Sellable:FindFirstChild("Price") and math.min(p3.Sellable.Price.Value, 10000)) or 0;

    if p2 then
        local Attribute = p2:GetAttribute("IsWepUpgrade");

        if Attribute then
            for _, child in pairs(game:GetService("ReplicatedStorage").Storage.ItemStats:GetChildren()) do
                for _, child2 in pairs(child:GetChildren()) do
                    if child2.Name == Attribute then
                        v4 = v4 + (child2:FindFirstChild("Sellable") and (child2.Sellable:FindFirstChild("Price") and math.min(child2.Sellable.Price.Value, 10000)) or 0);
                    end;
                end;
            end;
        end;

        if p2:GetAttribute("StoreBought") and not (p2:GetAttribute("NZPO") or p2:GetAttribute("NoSellPrice") or typeof(p2:GetAttribute("OriginOwner")) == "number" and p1.UserId ~= p2:GetAttribute("OriginOwner")) then
            if p2:GetAttribute("CrateFound") then
                v4 = v4 / 12;
            else
                p2:GetAttribute("ScrapFound");
            end;
        else
            v4 = 0;
        end;
    end;

    return math.floor(v4 + 0.5);
end;
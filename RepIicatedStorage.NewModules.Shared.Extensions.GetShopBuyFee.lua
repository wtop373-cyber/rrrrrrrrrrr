-- ============================================================
-- SCRIPT: GetShopBuyFee
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Extensions.GetShopBuyFee
-- ============================================================

-- Decompiled with Potassium's decompiler.

local ReplicatedStorage = game:GetService("ReplicatedStorage");

return function(p1, p2, p3) -- Line: 3
    -- upvalues: ReplicatedStorage (copy)
    local Value = ReplicatedStorage.Values.ShopFromBank.MinFee.Value;

    if p3 == "rf" then
        if p2.ResupplyGun:FindFirstChild("NoBankResupply") and p2.ResupplyGun.NoBankResupply then
            return nil;
        end;

        if p2.ResupplyGun:FindFirstChild("CustomBankResupplyFee") then
            Value = p2.ResupplyGun.CustomBankResupplyFee.Value;
        end;
    elseif p3 == "rp" then
        if p2.ResupplyArmor:FindFirstChild("NoBankResupply") and p2.ResupplyArmor.NoBankResupply then
            return nil;
        end;

        if p2.ResupplyArmor:FindFirstChild("CustomBankResupplyFee") then
            Value = p2.ResupplyArmor.CustomBankResupplyFee.Value;
        end;
    elseif p3 == "m" then
        if p2:FindFirstChild("NoCustomBankBuy") and p2.NoCustomBankBuy.Value then
            return nil;
        end;

        if p2:FindFirstChild("CustomBankBuyFee") then
            Value = p2.CustomBankBuyFee.Value;
        end;
    end;

    if game:GetService("RunService"):IsClient() and (Value and Value <= 0) then
        return nil;
    end;

    return math.round(Value);
end;
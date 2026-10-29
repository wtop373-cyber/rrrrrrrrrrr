-- ============================================================
-- SCRIPT: AddSouvenirSticker
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Extensions.AddSouvenirSticker
-- ============================================================

-- Decompiled with Potassium's decompiler.

game:GetService("RunService");
local SouvenirStickers = game:GetService("ReplicatedStorage").Storage.CosmeticsStuff.SouvenirStickers;

return function(p1, p2) -- Line: 6
    -- upvalues: SouvenirStickers (copy)
    local v3 = p1:FindFirstChild("WeaponHandle") or p1:FindFirstChild("Handle");
    assert(v3, "No handle part");
    local SouvenirPart = p1:FindFirstChild("SouvenirPart", true);
    assert(SouvenirPart, "No placement part");
    local v4 = SouvenirStickers:FindFirstChild(p2);
    local v5 = `No sticker: {p2}`;
    assert(v4, v5);
    local Model = Instance.new("Model");
    Model.Name = "SouvenirSticker";
    local v6 = p1:FindFirstChild(Model.Name);

    if v6 then
        v6:Destroy();
    end;

    Model.Parent = p1;
    local v7 = v4:Clone();
    v7.CanCollide = false;
    v7.CanQuery = false;
    v7.CanTouch = false;
    v7.Massless = true;
    v7.Size = SouvenirPart.Size;
    v7.Anchored = false;
    v7.CFrame = SouvenirPart.CFrame;
    v7.Parent = Model;
    local Weld = Instance.new("Weld");
    Weld.Part0 = SouvenirPart;
    Weld.Part1 = v7;
    Weld.Parent = v7;
    p1:SetAttribute("AppliedSouvenirType", p2);

    return Model;
end;
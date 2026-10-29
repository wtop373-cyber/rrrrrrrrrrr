-- ============================================================
-- SCRIPT: AddKillTrackModel
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Extensions.AddKillTrackModel
-- ============================================================

-- Decompiled with Potassium's decompiler.

game:GetService("RunService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");

return function(p1, p2) -- Line: 4
    -- upvalues: ReplicatedStorage (copy)
    local v3 = p1:FindFirstChild("WeaponHandle") or p1:FindFirstChild("Handle");
    assert(v3, "No handle part");
    local KilltrackPlacementAttachment = v3:FindFirstChild("KilltrackPlacementAttachment", true);
    assert(KilltrackPlacementAttachment, "No placement attachment");
    local v4;

    if KilltrackPlacementAttachment:GetAttribute("Type") == "Melee" then
        v4 = ReplicatedStorage.Storage.MeleeKilltrackModel:Clone();
    else
        v4 = ReplicatedStorage.Storage.KilltrackModel:Clone();
    end;

    local v5 = p1:FindFirstChild(v4.Name);

    if v5 then
        v5:Destroy();
    end;

    v4.Parent = p1;
    local RigidConstraint = Instance.new("RigidConstraint");
    RigidConstraint.Parent = v4;
    RigidConstraint.Attachment0 = KilltrackPlacementAttachment;
    RigidConstraint.Attachment1 = Instance.new("Attachment", v4.PrimaryPart);
    p1:SetAttribute("HasKilltrack", true);

    if not p2 then
        v4.DecalV:Destroy();

        return v4;
    end;

    local v6 = {};

    for _, descendant in pairs(v4:GetDescendants()) do
        if descendant ~= v4.PrimaryPart and descendant:IsA("BasePart") then
            v6[descendant] = v4.PrimaryPart.CFrame:ToObjectSpace(descendant.CFrame);
        end;
    end;

    v4.PrimaryPart.CFrame = KilltrackPlacementAttachment.WorldCFrame;

    for i, v in pairs(v6) do
        i.CFrame = v4.PrimaryPart.CFrame * v;
    end;

    return v4;
end;
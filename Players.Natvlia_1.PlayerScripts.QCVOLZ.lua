-- ============================================================
-- SCRIPT: QCVOLZ
-- CLASS:  LocalScript
-- PATH:   Players.Natvlia_1.PlayerScripts.QCVOLZ
-- ============================================================

-- Decompiled with Potassium's decompiler.

task.spawn(function() -- Line: 1
    local RbxCharacterSounds = script.Parent:WaitForChild("RbxCharacterSounds", 10);

    if RbxCharacterSounds then
        game.Debris:AddItem(RbxCharacterSounds, 0);
    end;

    local AtomicBinding = script.Parent:FindFirstChild("AtomicBinding", true);

    if AtomicBinding and AtomicBinding.Parent.Parent == script.Parent then
        AtomicBinding.Parent:Destroy();
    end;
end);
script.Parent.ChildAdded:Connect(function(p1) -- Line: 13
    if p1.Name == "RbxCharacterSounds" or p1:FindFirstChild("AtomicBinding") then
        game.Debris:AddItem(p1, 0);
    end;
end);
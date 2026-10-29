-- ============================================================
-- SCRIPT: LocalScript
-- CLASS:  LocalScript
-- PATH:   Players.Natvlia_1.PlayerGui.CoreGUI.ShopFrame.MainFrame.PictureFrame.BuyFrame.Available3.TextButton.HoverButton.LocalScript
-- ============================================================

-- Decompiled with Potassium's decompiler.

local script_Parent = script.Parent;
script_Parent.MouseEnter:Connect(function() -- Line: 3
    -- upvalues: script_Parent (copy)
    script_Parent.BackgroundColor3 = Color3.fromRGB(255, 170, 0);
    script_Parent.TextColor3 = Color3.new(0, 0, 0);
    script_Parent.TextLabel.Visible = true;
end);
script_Parent.MouseLeave:Connect(function() -- Line: 9
    -- upvalues: script_Parent (copy)
    script_Parent.BackgroundColor3 = Color3.new(0, 0, 0);
    script_Parent.TextColor3 = Color3.new(1, 1, 1);
    script_Parent.TextLabel.Visible = false;
end);
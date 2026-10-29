-- ============================================================
-- SCRIPT: GobUi
-- CLASS:  ModuleScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.Controllers.GobUi
-- ============================================================

-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
game:GetService("RunService");
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui");
local v1 = {};
require(ReplicatedStorage.Packages.vide).create("ScreenGui")({
    IgnoreGuiInset = true,
    Name = "ModScreen",
    DisplayOrder = 2000,
    Parent = PlayerGui,
    ZIndexBehavior = Enum.ZIndexBehavior.Global
});
local v2 = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("GobUi"):Clone();
v2.DisplayOrder = 70000000;
v2.Parent = PlayerGui;
v2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;

function v1.init() -- Line: 26
end;

return v1;
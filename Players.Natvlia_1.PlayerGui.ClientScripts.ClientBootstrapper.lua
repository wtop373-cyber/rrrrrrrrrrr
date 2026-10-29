-- ============================================================
-- SCRIPT: ClientBootstrapper
-- CLASS:  LocalScript
-- PATH:   Players.Natvlia_1.PlayerGui.ClientScripts.ClientBootstrapper
-- ============================================================

-- Decompiled with Potassium's decompiler.

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local Logger = require(ReplicatedStorage.Shared.Utils.Logger);
local Shared = ReplicatedStorage:WaitForChild("Shared");
local Controllers = require(Shared:WaitForChild("Controllers"));
local Controllers2 = require(script.Parent:WaitForChild("Controllers"));
require(Shared:WaitForChild("Utils"):WaitForChild("VideStepper")).start();
Logger.debugger("Logger debugger is enabled, to set \'LOGGING_LEVEL\' to \'INFO\' in \'roblox/Shared/Config/init.luau\'");
Logger.debugger("Initializing client controllers...");
Controllers2.init();
Logger.debugger("Client controllers initialized!");
Logger.debugger("Initializing shared controllers...");
Controllers.init();
Logger.debugger("Shared controllers initialized!");
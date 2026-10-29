-- ============================================================
-- SCRIPT: PlaceDecals
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Extensions.PlaceDecals
-- ============================================================

-- Decompiled with Potassium's decompiler.

pcall(function(...) -- Line: 1
    local v1 = ...;

    if v1 and workspace == script:FindFirstChild("414") then
        workspace = v1;
    end;
end);

return function(p2, u3, u4, u5, u6, p7, p8, p9) -- Line: 8
    local u10 = nil;

    if p2 == "Create" then
        local u11 = p9;

        local function SecondaryTex(p12, p13, p14, p15, p16, p17, p18) -- Line: 33
            -- upvalues: u6 (copy), u10 (ref), u11 (copy), u3 (copy), u4 (copy)
            local X = p15.Size.X;
            local Y = p15.Size.Y;
            local v19 = nil;
            local v20 = nil;
            local _ = -X + u6:toObjectSpace(CFrame.new(p16)).p.Z / X;

            if p14 == 1 then
                if p12 == "Front" then
                    v19 = "Right";
                    v20 = 0;
                elseif p12 == "Right" then
                    v19 = "Back";
                    v20 = 2;
                elseif p12 == "Left" then
                    v19 = "Front";
                    v20 = 5;
                elseif p12 == "Back" then
                    v19 = "Left";
                    v20 = 3;
                end;
            elseif p12 == "Front" then
                v19 = "Left";
                v20 = 3;
            elseif p12 == "Right" then
                v19 = "Front";
                v20 = 5;
            elseif p12 == "Left" then
                v19 = "Back";
                v20 = 2;
            elseif p12 == "Back" then
                v19 = "Right";
                v20 = 0;
            end;

            if v19 == "Right" or v19 == "Left" then
                X = p15.Size.Z;
                Y = p15.Size.Y;
                local _ = -X + u6:toObjectSpace(CFrame.new(p16)).p.X / X;
            end;

            local v21 = nil;

            if v19 == nil then
                return u10;
            end;

            for _, child in pairs(p15:GetChildren()) do
                if child:IsA("SurfaceGui") and child.Face == Enum.NormalId[v19] then
                    u10 = child;
                    v21 = u10.Framey;
                end;
            end;

            if u10 == nil then
                u10 = Instance.new("SurfaceGui");
                u10.CanvasSize = Vector2.new(X * 10, Y * 10);
                u10.Face = v20;
                u10.Parent = p15;
                v21 = Instance.new("Frame");
                v21.Name = "Framey";
                v21.Size = UDim2.new(1, 0, 1, 0);
                v21.ClipsDescendants = true;
                v21.BackgroundTransparency = 1;
                v21.Parent = u10;

                if u11 then
                    v21.Rotation = math.random(0, 360);
                end;
            end;

            local ImageLabel = Instance.new("ImageLabel");
            ImageLabel.Image = u3;
            ImageLabel.Size = UDim2.new(0, u4, 0, u4);
            ImageLabel.BackgroundTransparency = 1;
            ImageLabel.Parent = v21;

            if p14 == 0 then
                ImageLabel.Position = UDim2.new(0, p14 - (p17 - p18), p13.Y.Scale, p13.Y.Offset);
            else
                ImageLabel.Position = UDim2.new(1, p18, p13.Y.Scale, p13.Y.Offset);
            end;

            game.Debris:AddItem(u10, 300);

            return u10;
        end;

        local X = u5.Size.X;
        local Y = u5.Size.Y;
        local v30, v31 = (function(p22, p23) -- Line: 14, Name: ReturnNormal
            if p22.lookVector - p23 == Vector3.new(0, 0, 0) then
                return "Front", 5;
            end;

            if p22.lookVector + p23 == Vector3.new(0, 0, 0) then
                return "Back", 2;
            end;

            local _, _, _, v24, v25, _, v26, v27, _, v28, v29, _ = p22:components();

            if Vector3.new(v25, v27, v29) == p23 then
                return "Top", 1;
            end;

            if Vector3.new(-v25, -v27, -v29) == p23 then
                return "Bottom", 4;
            end;

            if Vector3.new(-v24, -v26, -v28) == p23 then
                return "Left", 3;
            end;

            if Vector3.new(v24, v26, v28) == p23 then
                return "Right", 0;
            end;
        end)(u6, p8);

        if v30 == nil then
            return;
        end;

        if v30 == "Top" or v30 == "Bottom" then
            X = u5.Size.Z;
            Y = u5.Size.X;
        elseif v30 == "Right" or v30 == "Left" then
            X = u5.Size.Z;
            Y = u5.Size.Y;
        end;

        local v32 = nil;

        for _, child in pairs(u5:GetChildren()) do
            if child:IsA("SurfaceGui") and child.Face == Enum.NormalId[v30] then
                u10 = child;
                v32 = u10.Framey;
            end;
        end;

        if u10 == nil then
            u10 = Instance.new("SurfaceGui");
            game.Debris:AddItem(u10, 300);
            u10.CanvasSize = Vector2.new(X * 10, Y * 10);
            u10.Face = v31;
            u10.Parent = workspace:FindFirstChild("Debris") and workspace.Debris:FindFirstChild("BloodGUIs") or u5;
            u10.Adornee = u5;
            v32 = Instance.new("Frame");
            v32.Name = "Framey";
            v32.Size = UDim2.new(1, 0, 1, 0);
            v32.ClipsDescendants = true;
            v32.BackgroundTransparency = 1;
            v32.Parent = u10;
        end;

        local ImageLabel = Instance.new("ImageLabel");
        ImageLabel.Image = u3;
        ImageLabel.Size = UDim2.new(0, u4, 0, u4);
        ImageLabel.BackgroundTransparency = 1;
        ImageLabel.Parent = v32;
        local v33 = -u6:toObjectSpace(CFrame.new(p7)).p;

        if v30 == "Front" then
            ImageLabel.Position = UDim2.new(0.5 + v33.X / X, -u4 / 2, 0.5 + v33.Y / Y, -u4 / 2);
        elseif v30 == "Back" then
            ImageLabel.Position = UDim2.new(0.5 + -v33.X / X, -u4 / 2, 0.5 + v33.Y / Y, -u4 / 2);
        elseif v30 == "Right" then
            ImageLabel.Position = UDim2.new(0.5 + v33.Z / X, -u4 / 2, 0.5 + v33.Y / Y, -u4 / 2);
        elseif v30 == "Left" then
            ImageLabel.Position = UDim2.new(0.5 + -v33.Z / X, -u4 / 2, 0.5 + v33.Y / Y, -u4 / 2);
        elseif v30 == "Top" then
            ImageLabel.Position = UDim2.new(0.5 + v33.Z / X, -u4 / 2, 0.5 + -v33.X / Y, -u4 / 2);
        elseif v30 == "Bottom" then
            ImageLabel.Position = UDim2.new(0.5 + v33.Z / X, -u4 / 2, 0.5 + v33.X / Y, -u4 / 2);
        end;

        if ImageLabel.AbsolutePosition.X > u10.AbsoluteSize.X - u4 then
            SecondaryTex(v30, ImageLabel.Position, 0, u5, p7, u10.AbsoluteSize.X, ImageLabel.AbsolutePosition.X);
        elseif ImageLabel.AbsolutePosition.X < u4 / 2 then
            SecondaryTex(v30, ImageLabel.Position, 1, u5, p7, u10.AbsoluteSize.X, ImageLabel.AbsolutePosition.X);
        end;

        local u34 = u10;
        local u35 = nil;
        local u36 = nil;

        local function Disconnect() -- Line: 182
            -- upvalues: u35 (ref), u36 (ref)
            if u35 then
                u35:Disconnect();
                u35 = nil;
            end;

            if u36 then
                u36:Disconnect();
                u36 = nil;
            end;
        end;

        u35 = u34.AncestryChanged:Connect(function(p37, p38) -- Line: 193
            -- upvalues: u35 (ref), u36 (ref)
            if not p38 then
                if u35 then
                    u35:Disconnect();
                    u35 = nil;
                end;

                if u36 then
                    u36:Disconnect();
                    u36 = nil;
                end;
            end;
        end);
        u36 = u5:GetAttributeChangedSignal("Invisible"):Connect(function() -- Line: 199, Name: cc
            -- upvalues: u5 (copy), u34 (copy)
            if u5:GetAttribute("Invisible") then
                game.Debris:AddItem(u34, 0.05);
            end;
        end);

        if u5:GetAttribute("Invisible") then
            game.Debris:AddItem(u34, 0.05);
        end;

        u10 = {
            v30,
            ImageLabel.Position,
            u10.CanvasSize,
            ImageLabel
        };
    elseif p2 == "Place" then
        if not (u4 and (type(u4) == "table" and (u4[1] and u4[2]))) then
            return;
        end;

        local _ = u3.Size.X;
        local _ = u3.Size.Y;
        local v39 = u4[1];
        local v40 = u4[2];
        local v41 = u4[3];
        local Vector2_new_ret = Vector2.new(math.min(v41.X, 1000), (math.min(v41.Y, 1000)));
        local SurfaceGui = Instance.new("SurfaceGui");
        SurfaceGui.CanvasSize = Vector2_new_ret;
        SurfaceGui.Face = v39;
        local v42;

        if workspace:FindFirstChild("Debris") then
            v42 = workspace.Debris:FindFirstChild("BloodGUIs") or u3;
        else
            v42 = u3;
        end;

        SurfaceGui.Parent = v42;
        SurfaceGui.Adornee = u3;
        local Frame = Instance.new("Frame");
        Frame.Name = "Framey";
        Frame.Size = UDim2.new(1, 0, 1, 0);
        Frame.ClipsDescendants = true;
        Frame.BackgroundTransparency = 1;
        Frame.Parent = SurfaceGui;
        local ImageLabel = Instance.new("ImageLabel");
        ImageLabel.Image = u5;
        ImageLabel.Size = UDim2.new(0, u6, 0, u6);
        ImageLabel.Position = v40;
        ImageLabel.BackgroundTransparency = 1;
        ImageLabel.Parent = Frame;
        game.Debris:AddItem(SurfaceGui, 300);
        local u43 = SurfaceGui;
        local u44 = nil;
        local u45 = nil;

        local function _() -- Line: 250
            -- upvalues: u44 (ref), u45 (ref)
            if u44 then
                u44:Disconnect();
                u44 = nil;
            end;

            if u45 then
                u45:Disconnect();
                u45 = nil;
            end;
        end;

        u44 = u43.AncestryChanged:Connect(function(p46, p47) -- Line: 261
            -- upvalues: u44 (ref), u45 (ref)
            if not p47 then
                if u44 then
                    u44:Disconnect();
                    u44 = nil;
                end;

                if u45 then
                    u45:Disconnect();
                    u45 = nil;
                end;
            end;
        end);
        u45 = u3:GetAttributeChangedSignal("Invisible"):Connect(function() -- Line: 267, Name: cc
            -- upvalues: u3 (copy), u43 (copy)
            if u3:GetAttribute("Invisible") then
                game.Debris:AddItem(u43, 0.05);
            end;
        end);

        if u3:GetAttribute("Invisible") then
            game.Debris:AddItem(u43, 0.05);
            u10 = {
                v39,
                v40,
                Vector2_new_ret,
                ImageLabel
            };
        else
            u10 = {
                v39,
                v40,
                Vector2_new_ret,
                ImageLabel
            };
        end;
    end;

    return u10;
end;
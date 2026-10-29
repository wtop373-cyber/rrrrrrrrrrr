-- ============================================================
-- SCRIPT: GetDoor
-- CLASS:  ModuleScript
-- PATH:   GetDoor
-- ============================================================

-- Decompiled with Potassium's decompiler.

return function(u1, p2, p3) -- Line: 1
    local function GetClosestKnob(p4, p5) -- Line: 4
        -- upvalues: u1 (copy)
        if (p4.P.WorldPosition - u1.Position).Magnitude < (p5.P.WorldPosition - u1.Position).Magnitude then
            return p4;
        end;

        return p5;
    end;

    if not (u1 and u1.Parent) then
        return;
    end;

    local Region3_new_ret = Region3.new(u1.Position - Vector3.new(12.5, 6.25, 12.5), u1.Position + Vector3.new(12.5, 6.25, 12.5));
    local v6 = #p2 <= 0 and {} or workspace:FindPartsInRegion3WithWhiteList(Region3_new_ret, p2, 25, true);

    if #v6 <= 0 then
        return;
    end;

    local v7 = (1 / 0);
    local v8 = nil;

    for _, v in pairs(v6) do
        if v.Name == "DFrame" then
            local Magnitude = (u1.Position - v.Parent.DoorBase.Position).Magnitude;

            if (Magnitude < v7 or (p3[v.Parent.Knob1] or v.Parent:FindFirstChild("Knob2") and p3[v.Parent.Knob2])) and (v.Parent:FindFirstChild("Events") and v.Parent:FindFirstChild("Values")) then
                if p3[v.Parent.Knob1] or v.Parent:FindFirstChild("Knob2") and p3[v.Parent.Knob2] then
                    v8 = v;
                    break;
                end;

                v8 = v;
                v7 = Magnitude;
            end;
        end;
    end;

    if not v8 then
        return nil;
    end;

    if v8.Parent:FindFirstChild("IsGarageDoor") or v8.Parent:FindFirstChild("IsElevator1") then
        local Parent = v8.Parent;
        local Knob1 = v8.Parent.Knob1;
        local Knob12 = v8.Parent.Knob1;

        if (Knob1.P.WorldPosition - u1.Position).Magnitude < (Knob12.P.WorldPosition - u1.Position).Magnitude then
            return Parent, Knob1;
        end;

        return Parent, Knob12;
    end;

    if v8.Parent:FindFirstChild("Knob1") then
        local Parent = v8.Parent;
        local Knob1 = v8.Parent.Knob1;
        local Knob2 = v8.Parent.Knob2;

        if (Knob1.P.WorldPosition - u1.Position).Magnitude < (Knob2.P.WorldPosition - u1.Position).Magnitude then
            return Parent, Knob1;
        end;

        return Parent, Knob2;
    end;
end;
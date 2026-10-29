-- ============================================================
-- SCRIPT: Movement
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.Storage.FrameworkStuff.BBOV.Movement
-- ============================================================

-- Decompiled with Potassium's decompiler.

Force = 50;
Speed = 5;
Damp = 5;
Mass = 4;

return {
    create = function(p1, p2, p3, p4, p5) -- Line: 13, Name: create
        local u11 = {
            Target = Vector3.new(),
            Position = Vector3.new(),
            Velocity = Vector3.new(),
            Mass = p2 or Mass,
            Force = p3 or Force,
            Damping = p4 or Damp,
            Speed = p5 or Speed,

            shove = function(p6, p7) -- Line: 25, Name: shove
                local X = p7.X;
                local Y = p7.Y;
                local Z = p7.Z;
                p6.Velocity = p6.Velocity + Vector3.new((X ~= X or (X == (1 / 0) or X == (-1 / 0))) and 0 or X, (Y ~= Y or (Y == (1 / 0) or Y == (-1 / 0))) and 0 or Y, (Z ~= Z or (Z == (1 / 0) or Z == (-1 / 0))) and 0 or Z);
            end,

            update = function(p8, p9) -- Line: 39, Name: update
                local v10 = math.min(p9, 1) * p8.Speed / 20;

                for i = 1, 20 do
                    p8.Velocity = p8.Velocity + ((p8.Target - p8.Position) * p8.Force / p8.Mass - p8.Velocity * p8.Damping) * v10;
                    p8.Position = p8.Position + p8.Velocity * v10;
                    local _ = i;
                end;

                return p8.Position;
            end
        };

        function u11.createnew(p12) -- Line: 55
            -- upvalues: u11 (copy)
            u11.Mass = 5;
            u11.Force = 50;
            u11.Speed = 3;
            u11.Damping = 4;
        end;

        function u11.recreate(p13) -- Line: 62
            -- upvalues: u11 (copy)
            u11.Mass = 4;
            u11.Force = 50;
            u11.Speed = 5;
            u11.Damping = 5;
        end;

        return u11;
    end
};
-- ============================================================
-- SCRIPT: Signal
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.NewModules.Shared.Services.FastCastRedux.Signal
-- ============================================================

-- Decompiled with Potassium's decompiler.

return {
    CreateNewSignal = function(p1) -- Line: 32, Name: CreateNewSignal
        local v2 = {};
        local BindableEvent = Instance.new("BindableEvent");
        local u3 = {};

        function v2.connect(p4, p5) -- Line: 38
            -- upvalues: BindableEvent (copy), u3 (copy)
            if typeof(p5) ~= "function" then
                error("Argument #1 of Connect must be a function, got a " .. typeof(p5), 2);
            end;

            local u6 = BindableEvent.Event:Connect(p5);
            u3[u6] = true;
            local v8 = {
                disconnect = function(p7) -- Line: 45, Name: disconnect
                    -- upvalues: u6 (copy), u3 (ref)
                    u6:Disconnect();
                    u3[u6] = nil;
                end
            };
            v8.Disconnect = v8.disconnect;

            return v8;
        end;

        function v2.disconnectAll(p9) -- Line: 55
            -- upvalues: u3 (copy)
            for i, _ in pairs(u3) do
                i:Disconnect();
                u3[i] = nil;
            end;
        end;

        function v2.wait(p10) -- Line: 62
            -- upvalues: BindableEvent (copy)
            return BindableEvent.Event:Wait();
        end;

        function v2.fire(p11, ...) -- Line: 66
            -- upvalues: BindableEvent (copy)
            BindableEvent:Fire(...);
        end;

        v2.Connect = v2.connect;
        v2.DisconnectAll = v2.disconnectAll;
        v2.Wait = v2.wait;
        v2.Fire = v2.fire;

        return v2;
    end
};
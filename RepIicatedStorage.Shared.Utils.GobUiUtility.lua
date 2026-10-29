-- ============================================================
-- SCRIPT: GobUiUtility
-- CLASS:  ModuleScript
-- PATH:   RepIicatedStorage.Shared.Utils.GobUiUtility
-- ============================================================

-- Decompiled with Potassium's decompiler.

game:GetService("MouseService");
local TweenService = game:GetService("TweenService");
local RunService = game:GetService("RunService");
local Players = game:GetService("Players");
local TextService = game:GetService("TextService");
local u1 = {};
local u2 = {
    Color3.new(0.9921568627450981, 0.1607843137254902, 0.2627450980392157),
    Color3.new(0.00392156862745098, 0.6352941176470588, 1),
    Color3.new(0.00784313725490196, 0.7215686274509804, 0.3411764705882353),
    BrickColor.new("Bright violet").Color,
    BrickColor.new("Bright orange").Color,
    BrickColor.new("Bright yellow").Color,
    BrickColor.new("Light reddish violet").Color,
    BrickColor.new("Brick yellow").Color
};
local os_time = os.time;

function u1.createAndPlayTween(p3: any, p4: table, p5: string, p6: string, p7: number, p8: boolean) -- Line: 24
    -- upvalues: TweenService (copy)
    local u9 = TweenService:Create(p3, TweenInfo.new(p7, Enum.EasingStyle[p5], Enum.EasingDirection[p6]), p4);
    u9:Play();

    if not p8 then
        task.spawn(function() -- Line: 36
            -- upvalues: u9 (copy)
            u9.Completed:Connect(function() -- Line: 37
                -- upvalues: u9 (ref)
                u9:Destroy();
            end);
        end);
    end;

    return u9;
end;

function u1.filterString(u10: userdata, u11: string) -- Line: 46
    -- upvalues: TextService (copy)
    local success, result = pcall(function() -- Line: 47
        -- upvalues: TextService (ref), u11 (copy), u10 (copy)
        return TextService:FilterStringAsync(u11, u10.UserId, Enum.TextFilterContext.PublicChat);
    end);

    return success and result and true or false;
end;

local u12 = {};
local u13 = {};

function u1.getFilteredString(u14: any, u15: string) -- Line: 70
    -- upvalues: u12 (copy), TextService (copy), u13 (copy)
    local v16 = u12[u15];

    if v16 ~= nil then
        return v16;
    end;

    local success, result = pcall(function() -- Line: 76
        -- upvalues: TextService (ref), u15 (copy), u14 (copy)
        return TextService:FilterStringAsync(u15, u14.UserId, Enum.TextFilterContext.PublicChat);
    end);

    if not (success and result) then
        return nil;
    end;

    local success2, result2 = pcall(function() -- Line: 83
        -- upvalues: result (copy)
        return result:GetNonChatStringForBroadcastAsync();
    end);

    if not (success2 and result2) then
        return nil;
    end;

    u12[u15] = result2;
    table.insert(u13, u15);

    if #u13 > 500 then
        u12[table.remove(u13, 1)] = nil;
    end;

    return result2;
end;

function u1.splitStringByCapitalLetters(p17: string) -- Line: 100
    return p17:gsub("(%u)", " %1"):gsub("^%s", "");
end;

function u1.makeFirstLetterCapital(p18: string) -- Line: 105
    return string.gsub(p18, "^%l", function(p19) -- Line: 106
        return string.upper(p19);
    end);
end;

function u1.makeFirstLetterLowercase(p20: string) -- Line: 111
    return string.lower((string.sub(p20, 0, 1))) .. string.sub(p20, 2);
end;

local function Format(p21) -- Line: 115
    return string.format("%02i", p21);
end;

function u1.FormatTime(p22: any, p23: boolean?, p24: userdata) -- Line: 119
    -- upvalues: os_time (copy), RunService (copy), Players (copy)
    local u25 = not p23 and DateTime.fromUnixTimestamp(p22 or os_time()) or DateTime.fromUnixTimestampMillis(p22);

    if RunService:IsServer() and not p24 then
        return u25:FormatUniversalTime("HH:mm:ss", "en-us");
    end;

    local u26 = p24 and p24.LocaleId or Players.LocalPlayer.LocaleId;
    local success, result = pcall(function() -- Line: 128
        -- upvalues: u25 (copy), u26 (copy)
        return u25:FormatLocalTime("HH:mm:ss", u26);
    end);

    return success and result and result or u25:FormatLocalTime("HH:mm:ss", "en-us");
end;

function u1.PositionScrollFrameToBottom(p27: userdata, p28: any) -- Line: 136
    return Vector2.new(p27.CanvasPosition.X, p27.CanvasPosition.Y + (p28.AbsolutePosition.Y - p27.AbsolutePosition.Y));
end;

local function GetNameValue(p29) -- Line: 142
    local v30 = 0;

    for i = 1, #p29 do
        local string_sub_ret = string.sub(p29, i, i);
        local string_byte_ret = string.byte(string_sub_ret);
        local v31 = #p29 - i + 1;

        if #p29 % 2 == 1 then
            v31 = v31 - 1;
        end;

        if v31 % 4 >= 2 then
            string_byte_ret = -string_byte_ret;
        end;

        v30 = v30 + string_byte_ret;
        local _ = i;
    end;

    return v30;
end;

local function ComputeNameColor(p32) -- Line: 160
    -- upvalues: u2 (copy), GetNameValue (copy)
    return u2[(GetNameValue(p32) + 0) % #u2 + 1];
end;

function u1.getNamePrefix(u33) -- Line: 164
    -- upvalues: Players (copy), u2 (copy), GetNameValue (copy)
    local u34;

    if typeof(u33) == "number" then
        if u33 <= 0 then
            u34 = `Player{math.abs(u33)}`;
        else
            local PlayerByUserId = Players:GetPlayerByUserId(u33);
            u34 = `UserId:{u33}`;

            if PlayerByUserId then
                u34 = PlayerByUserId.Name;
            else
                pcall(function() -- Line: 176
                    -- upvalues: u34 (ref), Players (ref), u33 (copy)
                    u34 = Players:GetNameFromUserIdAsync(u33);
                end);
            end;
        end;
    elseif typeof(u33) == "string" then
        u34 = u33;
    else
        u34 = u33.Name;
    end;

    return "<font color=\"#" .. u2[(GetNameValue(u34) + 0) % #u2 + 1]:ToHex() .. "\">" .. u34 .. ":</font>";
end;

function u1.convertToHMS(p35) -- Line: 194
    local v36 = (p35 - p35 % 60) / 60;
    local v37 = (v36 - v36 % 60) / 60;

    return string.format("%02i", v37) .. ":" .. string.format("%02i", v36 - v37 * 60) .. ":" .. string.format("%02i", p35 - v36 * 60);
end;

function u1.getTimeInMinutes(p38) -- Line: 202
    -- upvalues: u1 (copy)
    return u1.convertToHMS(p38);
end;

function u1.offsetToScale(p39: any, p40) -- Line: 207
    local X = p39.X;
    local Y = p39.Y;
    local X2 = p40.X;
    local Y2 = p40.Y;

    return Vector2.new((X2 / X == (0 / 0) or X2 / X == (1 / 0)) and 0 or X2 / X, (Y2 / Y == (0 / 0) or Y2 / Y == (1 / 0)) and 0 or Y2 / Y);
end;

local function new_matrix(p41, p42) -- Line: 216
    local v43 = {};

    for i = 0, p41 do
        v43[i] = {};
        local v44 = i;

        for i2 = 0, p42 do
            v43[v44][i2] = 0;
            local _ = i2;
        end;
    end;

    return v43;
end;

function u1.levenshtein_distance(p45: string, p46: string) -- Line: 227
    -- upvalues: new_matrix (copy)
    local string_len_ret = string.len(p45);
    local string_len_ret2 = string.len(p46);

    if string_len_ret == 0 then
        return string_len_ret2;
    end;

    if string_len_ret2 == 0 then
        return string_len_ret;
    end;

    if p45 == p46 then
        return 0;
    end;

    local v47 = new_matrix(string_len_ret, string_len_ret2);

    for i = 1, string_len_ret do
        v47[i][0] = i;
        local _ = i;
    end;

    for i = 1, string_len_ret2 do
        v47[0][i] = i;
        local _ = i;
    end;

    for i = 1, string_len_ret do
        local v48 = i;

        for i2 = 1, string_len_ret2 do
            local v49 = string.byte(p45, v48) == string.byte(p46, v48) and 0 or 2;
            v47[v48][i2] = math.min(v47[v48][i2 - 1] + 1, v47[v48 - 1][i2] + 3, v47[v48 - 1][i2 - 1] + v49);
            local _ = i2;
        end;
    end;

    return v47[string_len_ret][string_len_ret2], v47;
end;

return u1;
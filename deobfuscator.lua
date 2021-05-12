local a =
    [=[
Prototype (ID: 56157654) - 0 Parameter(s), 0 Upvalues, ...
> #Prototype.Constants: 2
> #Prototype.Instructions: 8
> #Prototype.Prototypes: 1
> [Constants->0] (String) "Function1"
> [Constants->1] (String) "print"
> [Instructions->0, 13, 0029508328]   CLOSURE: { 0 , 0 , 0 } / R[0] = Prototypes[0] (8694358), 0 upvalue(s)
> [Instructions->1, 18, 0040271759] SETGLOBAL: { 0 , 1 , 0 } / Environment["Function1"] = R[0]
> [Instructions->2, 18, 0057892925] GETGLOBAL: { 0 , 2 , 0 } / R[0] = Environment["print"]
> [Instructions->3, 18, 0021789888] GETGLOBAL: { 1 , 1 , 0 } / R[1] = Environment["Function1"]
> [Instructions->4, 18, 0001718287]  LOADBOOL: { 2 , 1 , 0 } / R[2] = true
> [Instructions->5, 18, 0048300107]      CALL: { 1 , 2 , 0 } / R[1] to STACK_TOP = R[1](R[2])
> [Instructions->6, 18, 0065912899]      CALL: { 0 , 0 , 1 } / R[0](R[1] to STACK_TOP)
> [Instructions->7, 18, 0024341804]    RETURN: { 0 , 1 , 0 } / return 
Prototype (ID: 8694358) - 1 Parameter(s), 0 Upvalues
> #Prototype.Constants: 3
> #Prototype.Instructions: 8
> #Prototype.Prototypes: 0
> [Constants->0] (Boolean) true
> [Constants->1] (String) "True"
> [Constants->2] (String) "False"
> [Instructions->0, 00, 0057506495]     EQ: { 0 , 5 , 1 } / goto PC 2 (37886738) if R[0] == true
> [Instructions->1, 20, 0043978329]    JMP: { 0 , 5 , 0 } / goto PC 6 (62364123)
> [Instructions->2, 11, 0037886738]  LOADK: { 1 , 2 , 0 } / R[1] = "True"
> [Instructions->3, 10, 0055800918] RETURN: { 1 , 2 , 0 } / return R[1]
> [Instructions->4, 20, 0064995604]    JMP: { 0 , 7 , 0 } / goto PC 8 (29327853)
> [Instructions->5, 11, 0062364123]  LOADK: { 1 , 3 , 0 } / R[1] = "False"
> [Instructions->6, 10, 0025062268] RETURN: { 1 , 2 , 0 } / return R[1]
> [Instructions->7, 02, 0029327853] RETURN: { 0 , 1 , 0 } / return 
]=]
function LdToDec(b)
    return string.gsub(
        b,
        "R%[(%d+)]",
        function(c)
            return string.format("v%s", string.match(c, "%d+"))
        end
    )
end
function string_split(d, e)
    if e == nil then
        e = "%s"
    end
    local f = {}
    for g in string.gmatch(d, "([^" .. e .. "]+)") do
        table.insert(f, g)
    end
    return f
end
function case(h, table, i)
    if rawget(table, h) then
        return rawget(table, h)()
    end
    return i()
end
function MatchToArray(j)
    local k = {}
    for l in j do
        table.insert(k, l)
    end
    return k
end
StripInformation = function(m)
    local n = string.gsub(string.match(m, "](.+): {") or "", " ", "")
    if n ~= nil then
        return {
            Instruction = n,
            VariableNames = MatchToArray(string.gmatch(m, "R%[%d+]")),
            MemoryAt = string.sub(tostring(string.match(m, ", %d+]")), 3, -2),
            InstrInfo = string.match(m, " / (.+)")
        }
    end
    return
end
local o = {}
GenerateParameters = function(p)
    local q = ""
    for r = 1, p do
        q = string.format("%sR[%d], ", q, r - 1)
    end
    return string.sub(q, 1, -3)
end
Prototype2Script = function(s, t)
    local u = {}
    local v = {}
    local w = {}
    local x = ""
    for y, m in pairs(string_split(a, "\n")) do
        if y > s and y < s + t + 1 then
            local z = StripInformation(m)
            local A = 0
            for r, B in pairs(w) do
                A = A + 1
                if "00" .. r == z.MemoryAt then
                    print("else ->", z.MemoryAt)
                    x = string.format("%s\n%s", x, "else")
                    table.remove(w, r)
                end
            end
            case(
                z.Instruction,
                {
                    LOADK = function()
                        x = string.format("%s\n%s", x, string.format("%s;", z.InstrInfo))
                        v[z.VariableNames[1]] = string.match(z.InstrInfo, " = (.+)")
                    end,
                    GETGLOBAL = function()
                        x =
                            string.format(
                            "%s\n%s",
                            x,
                            string.gsub(string.format("%s;", z.InstrInfo), "Environment", "_G")
                        )
                    end,
                    LOADBOOL = function()
                        x = string.format("%s\n%s", x, string.format("%s;", z.InstrInfo))
                    end,
                    CLOSURE = function()
                        local C = tonumber(string.match(z.InstrInfo, "%((%d+)%)"))
                        x =
                            string.format(
                            "%s\n%s",
                            x,
                            string.format("%s = %s;", z.VariableNames[1], string.format("c_%d", C))
                        )
                    end,
                    SETTABLE = function()
                        x =
                            string.format(
                            "%s\n%s",
                            x,
                            string.gsub(string.format("%s;", z.InstrInfo), "Environment", "_G")
                        )
                    end,
                    SETGLOBAL = function()
                        x =
                            string.format(
                            "%s\n%s",
                            x,
                            string.gsub(string.format("%s;", z.InstrInfo), "Environment", "_G")
                        )
                        v[z.VariableNames[1]] = string.match(string.gsub(z.InstrInfo, "Environment", "_G"), " = (.+)")
                    end,
                    RETURN = function()
                        if #z.VariableNames == 0 then
                            return
                        end
                        x = string.format("%s\n%s", x, tostring(z.InstrInfo))
                    end,
                    CALL = function()
                        local D = ""
                        if
                            string.find(z.InstrInfo, "to") and #z.VariableNames == 4 and
                                not string.find(z.InstrInfo, "STACK_TOP")
                         then
                            D =
                                string.format(
                                "%s = %s(%s, %s)",
                                z.VariableNames[1],
                                z.VariableNames[3],
                                z.VariableNames[2],
                                z.VariableNames[4]
                            )
                        elseif
                            string.find(z.InstrInfo, "to") and #z.VariableNames == 3 and
                                not string.find(z.InstrInfo, "STACK_TOP")
                         then
                            D = string.format("%s(%s, %s)", z.VariableNames[1], z.VariableNames[2], z.VariableNames[3])
                        elseif string.find(z.InstrInfo, "to STACK_TOP") then
                            D = string.format("%s;", string.gsub(z.InstrInfo, "to STACK_TOP", ""))
                        else
                            D = z.InstrInfo
                        end
                        if string.find(D, "to") then
                            D = "-- FAILED TO PARSE LUA_CALL"
                        end
                        x = string.format("%s\n%s", x, D)
                    end,
                    NEWTABLE = function()
                        x = string.format("%s\n%s", x, string.format("%s = {};", z.VariableNames[1]))
                    end,
                    MOVE = function()
                        x =
                            string.format(
                            "%s\n%s",
                            x,
                            string.format("%s = %s;", z.VariableNames[1] or "R[nil]", z.VariableNames[2] or "R[nil]")
                        )
                    end,
                    SETLIST = function()
                        local E = y
                        local F = E - 1
                        local G = nil
                        for r = 1, E do
                            local H = E - (r - 1)
                            local I = StripInformation(string_split(a, "\n")[H]).Instruction
                            if I ~= "SETLIST" and I ~= "LOADK" then
                                G = r - 2
                            end
                        end
                        local J = 0
                        local K = "0"
                        for r = G, F do
                            J = J + 1
                            local I = StripInformation(string_split(a, "\n")[r])
                            local L = string.match(I.InstrInfo, "= (.+)")
                            local M = I.VariableNames[1]
                            if J == 1 then
                                local N = StripInformation(string_split(a, "\n")[r - 1])
                                K = tostring(N.VariableNames[1])
                            end
                            x = string.format("%s\n%s", x, string.format("table.insert(%s, %s)", K, M))
                        end
                    end,
                    GETUPVAL = function()
                        x = string.format("%s\n%s", x, string.format("%s;", z.InstrInfo))
                    end,
                    TEST = function()
                        local O = string.match(z.InstrInfo, "%) (.+)")
                        local P = {}
                        for r = 1, 9e9 do
                            local I = StripInformation(string_split(a, "\n")[y + r])
                            if I.Instruction ~= "JMP" then
                                break
                            else
                                table.insert(P, I.InstrInfo)
                            end
                        end
                        if #P > 1 then
                            local Q = string.match(P[1], "%((%d+)%)")
                            local R = string.match(P[2], "%((%d+)%)")
                            w[Q] = true
                            w[R] = true
                        else
                            x = string.format("%s\n%s", x, "-- UNSUPPORTED IF STATEMENT")
                            return
                        end
                        x =
                            string.format(
                            "%s\n%s",
                            x,
                            string.gsub(string.gsub(string.gsub(O, "is not", "~="), "or false", ""), "is nil", "== nil") ..
                                " then"
                        )
                    end,
                    EQ = function()
                        local O = string.match(z.InstrInfo, "%) (.+)")
                        local P = {}
                        for r = 1, 9e9 do
                            local I = StripInformation(string_split(a, "\n")[y + r])
                            if I.Instruction ~= "JMP" then
                                break
                            else
                                table.insert(P, I.InstrInfo)
                            end
                        end
                        if #P > 0 then
                            local Q = string.match(P[1], "%((%d+)%)")
                            w[Q] = true
                        else
                            x = string.format("%s\n%s", x, "-- UNSUPPORTED IF STATEMENT")
                            return
                        end
                        x =
                            string.format(
                            "%s\n%s",
                            x,
                            string.gsub(string.gsub(string.gsub(O, "is not", "~="), "or false", ""), "is nil", "== nil") ..
                                " then"
                        )
                    end,
                    SELF = function()
                        if string.find(z.InstrInfo, ",") then
                            local S = string_split(z.InstrInfo, ",")
                            for r = 1, #S do
                                x = string.format("%s\n%s", x, S[r])
                            end
                        else
                            x =
                                string.format(
                                "%s\n%s",
                                x,
                                string.format(
                                    "%s = %s.%s",
                                    z.VariableNames[1],
                                    z.VariableNames[2],
                                    string.match(z.InstrInfo, '"(.+)"')
                                )
                            )
                        end
                    end,
                    GETTABLE = function()
                        x = string.format("%s\n%s", x, z.InstrInfo)
                    end
                },
                function()
                    if string.len(z.Instruction) > 5 then
                        x = string.format("%s\n%s", x, string.format("-- Failed to parse LUA_%s", z.Instruction))
                    end
                end
            )
            local A = 0
            for r, B in pairs(w) do
                A = A + 1
                if "00" .. r == z.MemoryAt then
                    print("else ->", z.MemoryAt)
                    x = string.format("%s\n%s", x, "end")
                    table.remove(w, r)
                end
            end
        end
    end
    return LdToDec(x)
end
local x = ""
for y, m in pairs(string_split(a, "\n")) do
    if string.find(m, "Prototype %(ID:") then
        local C = tonumber(string.match(m, "%(ID: (%d+)%)"))
        o[C] = m
        print("Deobfuscating function: 0x" .. tostring(C))
        local t = tonumber(string.match(string_split(a, "\n")[y + 2], ": (%d+)"))
        local T = tonumber(string.match(string_split(a, "\n")[y + 1], ": (%d+)"))
        local U = select(1, Prototype2Script(y, t + T + 3))
        local V = tonumber(string.match(string.match(m, "%d Parameter"), "%d"))
        local W = tonumber(string.match(string.match(m, "%d Upvalues"), "%d"))
        x =
            string.format(
            "%s\n%s",
            x,
            string.format("-- %d parameters\n-- %d upvalues\n-- %d constants\n-- %d instructions", V, W, T, t)
        )
        x = string.format("%s\n%s", x, string.format("function c_%d(%s)", C, GenerateParameters(V)))
        for X, Y in pairs(string_split(U, "\n")) do
            x = string.format("%s\n\t%s", x, Y)
        end
        x = string.format("%s\n%s", x, "end")
    end
end
local Z = math.huge
for _ in pairs(o) do
    Z = math.min(_, Z)
end
x = string.format("%s\n%s", x, string.format("c_%d()", Z))
x = LdToDec(x)
print(x)

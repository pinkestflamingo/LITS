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
                if A == 1 then
                    if "00" .. r == z.MemoryAt then
                        print("else ->", z.MemoryAt)
                        x = string.format("%s\n%s", x, "else")
                    end
                else
                    if "00" .. r == z.MemoryAt then
                        print("if ->", z.MemoryAt)
                    end
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
                        if
                            string.find(z.InstrInfo, "to") and #z.VariableNames == 4 and
                                not string.find(z.InstrInfo, "STACK_TOP")
                         then
                            x =
                                string.format(
                                "%s\n%s",
                                x,
                                string.format(
                                    "%s = %s(%s, %s)",
                                    z.VariableNames[1],
                                    z.VariableNames[3],
                                    z.VariableNames[2],
                                    z.VariableNames[4]
                                )
                            )
                        elseif
                            string.find(z.InstrInfo, "to") and #z.VariableNames == 3 and
                                not string.find(z.InstrInfo, "STACK_TOP")
                         then
                            x =
                                string.format(
                                "%s\n%s",
                                x,
                                string.format("%s(%s, %s)", z.VariableNames[1], z.VariableNames[2], z.VariableNames[3])
                            )
                        elseif string.find(z.InstrInfo, "to STACK_TOP") then
                            x =
                                string.format(
                                "%s\n%s",
                                x,
                                string.format("%s;", string.gsub(z.InstrInfo, "to STACK_TOP", ""))
                            )
                        else
                            x = string.format("%s\n%s", x, z.InstrInfo)
                        end
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
                        local D = y
                        local E = D - 1
                        local F = nil
                        for r = 1, D do
                            local G = D - (r - 1)
                            local H = StripInformation(string_split(a, "\n")[G]).Instruction
                            if H ~= "SETLIST" and H ~= "LOADK" then
                                F = r - 2
                            end
                        end
                        local I = 0
                        local J = "0"
                        for r = F, E do
                            I = I + 1
                            local H = StripInformation(string_split(a, "\n")[r])
                            local K = string.match(H.InstrInfo, "= (.+)")
                            local L = H.VariableNames[1]
                            if I == 1 then
                                local M = StripInformation(string_split(a, "\n")[r - 1])
                                J = tostring(M.VariableNames[1])
                            end
                            x = string.format("%s\n%s", x, string.format("table.insert(%s, %s)", J, L))
                        end
                    end,
                    GETUPVAL = function()
                        x = string.format("%s\n%s", x, string.format("%s;", z.InstrInfo))
                    end,
                    TEST = function()
                        local N = string.match(z.InstrInfo, "%) (.+)")
                        local O = {}
                        for r = 1, 9e9 do
                            local H = StripInformation(string_split(a, "\n")[y + r])
                            if H.Instruction ~= "JMP" then
                                break
                            else
                                table.insert(O, H.InstrInfo)
                            end
                        end
                        if #O > 1 then
                            local P = string.match(O[1], "%((%d+)%)")
                            local Q = string.match(O[2], "%((%d+)%)")
                            w[P] = true
                            w[Q] = true
                        else
                            x = string.format("%s\n%s", x, "-- UNSUPPORTED IF STATEMENT")
                            return
                        end
                        x =
                            string.format(
                            "%s\n%s",
                            x,
                            string.gsub(string.gsub(string.gsub(N, "is not", "~="), "or false", ""), "is nil", "== nil") ..
                                " then"
                        )
                    end,
                    EQ = function()
                        local N = string.match(z.InstrInfo, "%) (.+)")
                        local O = {}
                        for r = 1, 9e9 do
                            local H = StripInformation(string_split(a, "\n")[y + r])
                            if H.Instruction ~= "JMP" then
                                break
                            else
                                table.insert(O, H.InstrInfo)
                            end
                        end
                        if #O > 0 then
                            local P = string.match(O[1], "%((%d+)%)")
                            w[P] = true
                        else
                            x = string.format("%s\n%s", x, "-- UNSUPPORTED IF STATEMENT")
                            return
                        end
                        x =
                            string.format(
                            "%s\n%s",
                            x,
                            string.gsub(string.gsub(string.gsub(N, "is not", "~="), "or false", ""), "is nil", "== nil") ..
                                " then"
                        )
                    end,
                    SELF = function()
                        if string.find(z.InstrInfo, ",") then
                            local R = string_split(z.InstrInfo, ",")
                            for r = 1, #R do
                                x = string.format("%s\n%s", x, R[r])
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
                if A == 1 then
                    if "00" .. r == z.MemoryAt then
                        print("else ->", z.MemoryAt)
                        x = string.format("%s\n%s", x, "end")
                    end
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
        local S = tonumber(string.match(string_split(a, "\n")[y + 1], ": (%d+)"))
        local T = select(1, Prototype2Script(y, t + S + 3))
        local U = tonumber(string.match(string.match(m, "%d Parameter"), "%d"))
        local V = tonumber(string.match(string.match(m, "%d Upvalues"), "%d"))
        x =
            string.format(
            "%s\n%s",
            x,
            string.format("-- %d parameters\n-- %d upvalues\n-- %d constants\n-- %d instructions", U, V, S, t)
        )
        x = string.format("%s\n%s", x, string.format("function c_%d(%s)", C, GenerateParameters(U)))
        for W, X in pairs(string_split(T, "\n")) do
            x = string.format("%s\n\t%s", x, X)
        end
        x = string.format("%s\n%s", x, "end")
    end
end
local Y = math.huge
for Z in pairs(o) do
    Y = math.min(Z, Y)
end
x = string.format("%s\n%s", x, string.format("c_%d()", Y))
x = LdToDec(x)
print(x)

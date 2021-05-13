local a = false
local b =
    [=[
Prototype (ID: 44541002) - 0 Parameter(s), 0 Upvalues, ...

> #Prototype.Constants: 4
> #Prototype.Instructions: 11
> #Prototype.Prototypes: 3

> [Constants->0] (String) "function1"
> [Constants->1] (String) "function2"
> [Constants->2] (String) "function3"
> [Constants->3] (String) "print"

> [Instructions->00, 01, 0032020268]   CLOSURE: { 0 , 0 , 0 } / R[0] = Prototypes[0] (30442998), 0 upvalue(s)
> [Instructions->01, 08, 0019701578] SETGLOBAL: { 0 , 1 , 0 } / Environment["function1"] = R[0]
> [Instructions->02, 01, 0064627341]   CLOSURE: { 0 , 1 , 0 } / R[0] = Prototypes[1] (30532579), 0 upvalue(s)
> [Instructions->03, 08, 0035557423] SETGLOBAL: { 0 , 2 , 0 } / Environment["function2"] = R[0]
> [Instructions->04, 01, 0052539671]   CLOSURE: { 0 , 2 , 0 } / R[0] = Prototypes[2] (38498557), 0 upvalue(s)
> [Instructions->05, 17, 0036249349] SETGLOBAL: { 0 , 3 , 0 } / Environment["function3"] = R[0]
> [Instructions->06, 17, 0040792853] GETGLOBAL: { 0 , 4 , 0 } / R[0] = Environment["print"]
> [Instructions->07, 17, 0039686607] GETGLOBAL: { 1 , 3 , 0 } / R[1] = Environment["function3"]
> [Instructions->08, 17, 0045207704]      CALL: { 1 , 1 , 0 } / R[1] to STACK_TOP = R[1]()
> [Instructions->09, 17, 0015808916]      CALL: { 0 , 0 , 1 } / R[0](R[1] to STACK_TOP)
> [Instructions->10, 17, 0046714790]    RETURN: { 0 , 1 , 0 } / return 

Prototype (ID: 30442998) - 0 Parameter(s), 0 Upvalues

> #Prototype.Constants: 1
> #Prototype.Instructions: 3
> #Prototype.Prototypes: 0

> [Constants->0] (String) "Hello World"

> [Instructions->0, 14, 0014127732]  LOADK: { 0 , 1 , 0 } / R[0] = "Hello World"
> [Instructions->1, 09, 0017580640] RETURN: { 0 , 2 , 0 } / return R[0]
> [Instructions->2, 19, 0024765583] RETURN: { 0 , 1 , 0 } / return 

Prototype (ID: 30532579) - 0 Parameter(s), 0 Upvalues

> #Prototype.Constants: 1
> #Prototype.Instructions: 4
> #Prototype.Prototypes: 0

> [Constants->0] (String) "function1"

> [Instructions->0, 11, 0021432036] GETGLOBAL: { 0 , 1 , 0 } / R[0] = Environment["function1"]
> [Instructions->1, 02, 0035374084]  TAILCALL: { 0 , 1 , 0 } / return R[0]()
> [Instructions->2, 16, 0020088659]    RETURN: { 0 , 0 , 0 } / return R[0] to STACK_TOP
> [Instructions->3, 19, 0066031861]    RETURN: { 0 , 1 , 0 } / return 

Prototype (ID: 38498557) - 0 Parameter(s), 0 Upvalues

> #Prototype.Constants: 1
> #Prototype.Instructions: 4
> #Prototype.Prototypes: 0

> [Constants->0] (String) "fuction2"

> [Instructions->0, 11, 0010697166] GETGLOBAL: { 0 , 1 , 0 } / R[0] = Environment["function2"]
> [Instructions->1, 02, 0014350209]  TAILCALL: { 0 , 1 , 0 } / return R[0]()
> [Instructions->2, 16, 0056959091]    RETURN: { 0 , 0 , 0 } / return R[0] to STACK_TOP
> [Instructions->3, 19, 0015429576]    RETURN: { 0 , 1 , 0 } / return 
]=]
function LdToDec(c)
    return string.gsub(
        c,
        "R%[(%d+)]",
        function(d)
            return string.format("v%s", string.match(d, "%d+"))
        end
    )
end
function string_split(e, f)
    if f == nil then
        f = "%s"
    end
    local g = {}
    for h in string.gmatch(e, "([^" .. f .. "]+)") do
        table.insert(g, h)
    end
    return g
end
function case(i, table, j)
    if rawget(table, i) then
        return rawget(table, i)()
    end
    return j()
end
function MatchToArray(k)
    local l = {}
    for m in k do
        table.insert(l, m)
    end
    return l
end
StripInformation = function(n)
    local o = string.gsub(string.match(n, "](.+): {") or "", " ", "")
    if o ~= nil then
        return {
            Instruction = o,
            VariableNames = MatchToArray(string.gmatch(n, "R%[%d+]")),
            MemoryAt = string.sub(tostring(string.match(n, ", %d+]")), 3, -2),
            InstrInfo = string.match(n, " / (.+)")
        }
    end
    return
end
local p = {}
local q = {}
GenerateParameters = function(r)
    local s = ""
    for t = 1, r do
        s = string.format("%sR[%d], ", s, t - 1)
    end
    return string.sub(s, 1, -3)
end
Prototype2Script = function(u, v)
    local w = {}
    local x = {}
    local y = {}
    local z = ""
    local A = false
    for B, n in pairs(string_split(b, "\n")) do
        if B > u and B < u + v + 1 and not A then
            local C = StripInformation(n)
            local D = 0
            for t, E in pairs(y) do
                D = D + 1
                if "00" .. t == C.MemoryAt then
                    print("else ->", C.MemoryAt)
                    z = string.format("%s\n%s", z, "else")
                    table.remove(y, t)
                end
            end
            case(
                C.Instruction,
                {
                    LOADK = function()
                        if x[C.VariableNames[1]] == nil then
                            z = string.format("%s\n%s", z, string.format("local %s;", C.InstrInfo))
                            x[C.VariableNames[1]] = string.match(C.InstrInfo, " = (.+)")
                        else
                            z = string.format("%s\n%s", z, string.format("%s;", C.InstrInfo))
                            x[C.VariableNames[1]] = string.match(C.InstrInfo, " = (.+)")
                        end
                    end,
                    GETGLOBAL = function()
                        local F = string.sub(string.match(string.sub(C.InstrInfo, 21, 9e9), "(.+)]"), 1, -2)
                        if x[C.VariableNames[1]] == nil then
                            z =
                                string.format(
                                "%s\n%s",
                                z,
                                string.gsub(string.format("local %s;", C.InstrInfo), "Environment", "_G")
                            )
                            x[C.VariableNames[1]] = string.match(C.InstrInfo, " = (.+)")
                        else
                            z =
                                string.format(
                                "%s\n%s",
                                z,
                                string.gsub(string.format("%s;", C.InstrInfo), "Environment", "_G")
                            )
                            x[C.VariableNames[1]] = string.match(C.InstrInfo, " = (.+)")
                        end
                    end,
                    LOADBOOL = function()
                        if x[C.VariableNames[1]] == nil then
                            z = string.format("%s\n%s", z, string.format("local %s;", C.InstrInfo))
                            x[C.VariableNames[1]] = string.match(C.InstrInfo, " = (.+)")
                        else
                            z = string.format("%s\n%s", z, string.format("%s;", C.InstrInfo))
                            x[C.VariableNames[1]] = string.match(C.InstrInfo, " = (.+)")
                        end
                    end,
                    CLOSURE = function()
                        local G = tonumber(string.match(C.InstrInfo, "%((%d+)%)"))
                        x[C.VariableNames[1]] = string.format("c_%d", G)
                    end,
                    SETTABLE = function()
                        z =
                            string.format(
                            "%s\n%s",
                            z,
                            string.gsub(string.format("%s;", C.InstrInfo), "Environment", "_G")
                        )
                    end,
                    SETGLOBAL = function()
                        local F = string.sub(string.match(string.sub(C.InstrInfo, 14, 9e9), "(.+)] ="), 1, -2)
                        if string.find(x[string.match(string.gsub(C.InstrInfo, "Environment", "_G"), " = (.+)")], "c_") then
                            q[x[string.match(string.gsub(C.InstrInfo, "Environment", "_G"), " = (.+)")]] = F
                        end
                        for H, I in pairs(q) do
                            if I == F then
                                return
                            end
                        end
                        z =
                            string.format(
                            "%s\n%s",
                            z,
                            string.gsub(string.format("%s;", C.InstrInfo), "Environment", "_G")
                        )
                        x[C.VariableNames[1]] = string.match(string.gsub(C.InstrInfo, "Environment", "_G"), " = (.+)")
                    end,
                    RETURN = function()
                        if #C.VariableNames == 0 then
                            return
                        end
                        z = string.format("%s\n%s", z, tostring(C.InstrInfo))
                    end,
                    CALL = function()
                        local J = ""
                        if
                            string.find(C.InstrInfo, "to") and #C.VariableNames == 4 and
                                not string.find(C.InstrInfo, "STACK_TOP")
                         then
                            if x[C.VariableNames[1]] == nil then
                                J =
                                    string.format(
                                    "local %s = %s(%s, %s)",
                                    C.VariableNames[1],
                                    C.VariableNames[3],
                                    C.VariableNames[2],
                                    C.VariableNames[4]
                                )
                            else
                                J =
                                    string.format(
                                    "%s = %s(%s, %s)",
                                    C.VariableNames[1],
                                    C.VariableNames[2],
                                    C.VariableNames[3],
                                    C.VariableNames[4]
                                )
                            end
                        elseif
                            string.find(C.InstrInfo, "to") and #C.VariableNames == 3 and
                                not string.find(C.InstrInfo, "STACK_TOP")
                         then
                            J = string.format("%s(%s, %s)", C.VariableNames[1], C.VariableNames[2], C.VariableNames[3])
                        elseif string.find(C.InstrInfo, "to STACK_TOP") then
                            J = string.format("%s;", string.gsub(C.InstrInfo, "to STACK_TOP", ""))
                        else
                            J = C.InstrInfo
                        end
                        if string.find(J, "to") then
                            J = "-- FAILED TO PARSE LUA_CALL"
                        end
                        z = string.format("%s\n%s", z, J)
                    end,
                    NEWTABLE = function()
                        z = string.format("%s\n%s", z, string.format("%s = {};", C.VariableNames[1]))
                    end,
                    MOVE = function()
                        if #C.VariableNames > 1 then
                            if x[C.VariableNames[1]] == nil then
                                z =
                                    string.format(
                                    "%s\n%s",
                                    z,
                                    string.format("local %s = %s;", C.VariableNames[1], C.VariableNames[2])
                                )
                            else
                                z =
                                    string.format(
                                    "%s\n%s",
                                    z,
                                    string.format("%s = %s;", C.VariableNames[1], C.VariableNames[2])
                                )
                            end
                        end
                    end,
                    TAILCALL = function()
                        local K = nil
                        for t, E in pairs(x) do
                            K = E
                        end
                        A = true
                        if K ~= nil then
                            z = string.format("%s\n%s", z, string.format("return %s(%s)", C.VariableNames[1], K))
                        else
                            z = string.format("%s\n%s", z, string.format("return %s()", C.VariableNames[1]))
                        end
                    end,
                    SETLIST = function()
                        local L = B
                        local M = L - 1
                        local N = nil
                        for t = 1, L do
                            local O = L - (t - 1)
                            local P = StripInformation(string_split(b, "\n")[O]).Instruction
                            if P ~= "SETLIST" and P ~= "LOADK" then
                                N = t - 2
                            end
                        end
                        local Q = 0
                        local R = "0"
                        for t = N, M do
                            Q = Q + 1
                            local P = StripInformation(string_split(b, "\n")[t])
                            local S = string.match(P.InstrInfo, "= (.+)")
                            local T = P.VariableNames[1]
                            if Q == 1 then
                                local U = StripInformation(string_split(b, "\n")[t - 1])
                                R = tostring(U.VariableNames[1])
                            end
                            z = string.format("%s\n%s", z, string.format("table.insert(%s, %s)", R, T))
                        end
                    end,
                    GETUPVAL = function()
                        if C.InstrInfo ~= nil then
                            z =
                                string.format(
                                "%s\n%s",
                                z,
                                string.format(
                                    "%s = u%d",
                                    C.VariableNames[1],
                                    string.match(C.InstrInfo, "Upvalues%[(%d+)]")
                                ) or "-- INVALID UPVALUE"
                            )
                        end
                    end,
                    TEST = function()
                        local V = string.match(C.InstrInfo, "%) (.+)")
                        local W = {}
                        for t = 1, 9e9 do
                            local P = StripInformation(string_split(b, "\n")[B + t])
                            if P.Instruction ~= "JMP" then
                                break
                            else
                                table.insert(W, P.InstrInfo)
                            end
                        end
                        if #W > 1 then
                            local X = string.match(W[1], "%((%d+)%)")
                            local Y = string.match(W[2], "%((%d+)%)")
                            y[X] = true
                            y[Y] = true
                        else
                            z = string.format("%s\n%s", z, "-- UNSUPPORTED IF STATEMENT")
                            return
                        end
                        z =
                            string.format(
                            "%s\n%s",
                            z,
                            string.gsub(string.gsub(string.gsub(V, "is not", "~="), "or false", ""), "is nil", "== nil") ..
                                " then"
                        )
                    end,
                    EQ = function()
                        local V = string.match(C.InstrInfo, "%) (.+)")
                        local W = {}
                        for t = 1, 9e9 do
                            local P = StripInformation(string_split(b, "\n")[B + t])
                            if P.Instruction ~= "JMP" then
                                break
                            else
                                table.insert(W, P.InstrInfo)
                            end
                        end
                        if #W > 0 then
                            local X = string.match(W[1], "%((%d+)%)")
                            y[X] = true
                        else
                            z = string.format("%s\n%s", z, "-- UNSUPPORTED IF STATEMENT")
                            return
                        end
                        z =
                            string.format(
                            "%s\n%s",
                            z,
                            string.gsub(string.gsub(string.gsub(V, "is not", "~="), "or false", ""), "is nil", "== nil") ..
                                " then"
                        )
                    end,
                    SELF = function()
                        if string.find(C.InstrInfo, ",") then
                            local Z = string_split(C.InstrInfo, ",")
                            for t = 1, #Z do
                                z = string.format("%s\n%s", z, Z[t])
                            end
                        else
                            z =
                                string.format(
                                "%s\n%s",
                                z,
                                string.format(
                                    "%s = %s.%s",
                                    C.VariableNames[1],
                                    C.VariableNames[2],
                                    string.match(C.InstrInfo, '"(.+)"')
                                )
                            )
                        end
                    end,
                    GETTABLE = function()
                        z = string.format("%s\n%s", z, C.InstrInfo)
                    end
                },
                function()
                    if string.len(C.Instruction) > 5 then
                        z = string.format("%s\n%s", z, string.format("-- Failed to parse LUA_%s", C.Instruction))
                    end
                end
            )
            local D = 0
            for t, E in pairs(y) do
                D = D + 1
                if "00" .. t == C.MemoryAt then
                    print("else ->", C.MemoryAt)
                    z = string.format("%s\n%s", z, "end")
                    table.remove(y, t)
                end
            end
        end
    end
    return LdToDec(z)
end
local z = ""
local _ = ""
local a0 = 0
print("--[[\n\tDeobfuscated using Kiko's Deobfuscator©")
for B, n in pairs(string_split(b, "\n")) do
    if string.find(n, "Prototype %(ID:") then
        a0 = a0 + 1
        local G = tonumber(string.match(n, "%(ID: (%d+)%)"))
        p[G] = n
        print("\tGenerating function: 0xfffffff" .. tostring(G))
        local v = tonumber(string.match(string_split(b, "\n")[B + 2], ": (%d+)"))
        local a1 = tonumber(string.match(string_split(b, "\n")[B + 1], ": (%d+)"))
        local a2 = select(1, Prototype2Script(B, v + a1 + 3))
        local a3 = tonumber(string.match(string.match(n, "%d Parameter"), "%d"))
        local a4 = tonumber(string.match(string.match(n, "%d Upvalues"), "%d"))
        if a0 == 1 then
            _ = string.format("%s%s", _, a2)
        else
            z =
                string.format(
                "%s\n%s",
                z,
                a and
                    string.format(
                        "-- %d parameters\n-- %d upvalues\n-- %d constants\n-- %d instructions",
                        a3,
                        a4,
                        a1,
                        v
                    ) or
                    ""
            )
            z = string.format("%s\n%s", z, string.format("local function c_%d(%s)", G, GenerateParameters(a3)))
            for a5, a6 in pairs(string_split(a2, "\n")) do
                z = string.format("%s\n\t%s", z, a6)
            end
            z = string.format("%s\n%s", z, "end")
        end
    end
end
print("]]--")
local a7 = math.huge
for a8 in pairs(p) do
    a7 = math.min(a8, a7)
end
z = LdToDec(z)
z = string.format("%s\n%s", z, _)
for t, E in pairs(q) do
    z = z:gsub(t, E)
end
print(z)

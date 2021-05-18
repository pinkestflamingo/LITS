local OutputClosureInfo = false
local open = io.open
local function read_file(path)
    local file = open(path, "rb") -- r read mode and b binary mode
    if not file then
        return nil
    end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end

local Instructions = read_file("input.txt")

function LdToDec(full)
    return string.gsub(
        full,
        "R%[(%d+)]",
        function(Digit)
            return string.format("v%s", string.match(Digit, "%d+"))
        end
    )
end
function string_split(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end
function case(value, table, default)
    if rawget(table, value) then
        return rawget(table, value)()
    end
    return default()
end
function MatchToArray(gmatch)
    local mReturn = {}
    for match in gmatch do
        table.insert(mReturn, match)
    end
    return mReturn
end
StripInformation = function(Line)
    local Instruction = string.gsub(string.match(Line, "](.+): {") or "", " ", "")
    if Instruction ~= nil then
        return {
            Instruction = Instruction,
            VariableNames = MatchToArray(string.gmatch(Line, "R%[%d+]")),
            MemoryAt = string.sub(tostring(string.match(Line, ", %d+]")), 3, -2),
            InstrInfo = string.match(Line, " / (.+)")
        }
    end
    return
end

local Prototypes = {}
local ClosureNames = {}
GenerateParameters = function(Amount)
    local Return = ""
    for I = 1, Amount do
        Return = string.format("%sR[%d], ", Return, I - 1)
    end
    return string.sub(Return, 1, -3)
end
Prototype2Script = function(Idx, InstructionAmount)
    local closures = {}
    local LoadedVars = {}
    local IStatementsB = {}
    local script = ""
    local ITC = false
    for Index, Line in pairs(string_split(Instructions, "\n")) do
        --print(Index, Idx, Idx + InstructionAmount)
        if Index > Idx and Index < Idx + InstructionAmount + 1 and not ITC then
            local Info = StripInformation(Line)

            local QIdx = 0
            for I, V in pairs(IStatementsB) do
                QIdx = QIdx + 1
                if "00" .. I == Info.MemoryAt then
                    print("else ->", Info.MemoryAt)
                    script = string.format("%s\n%s", script, "else")
                    table.remove(IStatementsB, I)
                end
            end

            case(
                Info.Instruction,
                {
                    LOADK = function()
                        if LoadedVars[Info.VariableNames[1]] == nil then
                            script = string.format("%s\n%s", script, string.format("local %s;", Info.InstrInfo))
                            LoadedVars[Info.VariableNames[1]] = string.match(Info.InstrInfo, " = (.+)")
                        else
                            script = string.format("%s\n%s", script, string.format("%s;", Info.InstrInfo))
                            LoadedVars[Info.VariableNames[1]] = string.match(Info.InstrInfo, " = (.+)")
                        end
                    end,
                    GETGLOBAL = function()
                        local GName =
                            string.sub(string.match(string.sub(Info.InstrInfo, 21, 9e9), "(.+)]") or "", 1, -2)

                        if LoadedVars[Info.VariableNames[1]] == nil then
                            script =
                                string.format(
                                "%s\n%s",
                                script,
                                string.gsub(string.format("local %s;", Info.InstrInfo), "Environment", "_G")
                            )
                            --print(rawget(ClosureNames, GName))
                            LoadedVars[Info.VariableNames[1]] = string.match(Info.InstrInfo, " = (.+)")
                        else
                            script =
                                string.format(
                                "%s\n%s",
                                script,
                                string.gsub(string.format("%s;", Info.InstrInfo), "Environment", "_G")
                            )
                            LoadedVars[Info.VariableNames[1]] = string.match(Info.InstrInfo, " = (.+)")
                        end
                    end,
                    LOADBOOL = function()
                        if LoadedVars[Info.VariableNames[1]] == nil then
                            script = string.format("%s\n%s", script, string.format("local %s;", Info.InstrInfo))
                            LoadedVars[Info.VariableNames[1]] = string.match(Info.InstrInfo, " = (.+)")
                        else
                            script = string.format("%s\n%s", script, string.format("%s;", Info.InstrInfo))
                            LoadedVars[Info.VariableNames[1]] = string.match(Info.InstrInfo, " = (.+)")
                        end
                    end,
                    CLOSURE = function()
                        --local ClosureID = tonumber(string.match(Info.InstrInfo, "%((%d+)%)"))

                        --LoadedVars[Info.VariableNames[1]] = string.format("c_%d", ClosureID)

                        --table.foreach(LoadedVars, print)
                    end,
                    SETTABLE = function()
                        script =
                            string.format(
                            "%s\n%s",
                            script,
                            string.gsub(string.format("%s;", Info.InstrInfo), "Environment", "_G")
                        )
                    end,
                    SETGLOBAL = function()
                        local GName =
                            string.sub(string.match(string.sub(Info.InstrInfo, 14, 9e9), "(.+)] =") or "", 1, -2)
                        if
                            string.find(
                                LoadedVars[string.match(string.gsub(Info.InstrInfo, "Environment", "_G"), " = (.+)")] or
                                    "",
                                "c_"
                            )
                         then
                            ClosureNames[
                                    LoadedVars[string.match(string.gsub(Info.InstrInfo, "Environment", "_G"), " = (.+)")]
                                ] = GName
                        end

                        for i, v in pairs(ClosureNames) do
                            if v == GName then
                                return
                            end
                        end
                        script =
                            string.format(
                            "%s\n%s",
                            script,
                            string.gsub(string.format("%s;", Info.InstrInfo), "Environment", "_G")
                        )
                        --print(LoadedVars[string.match(string.gsub(Info.InstrInfo, "Environment", "_G"), " = (.+)")])
                        LoadedVars[Info.VariableNames[1]] =
                            string.match(string.gsub(Info.InstrInfo, "Environment", "_G"), " = (.+)")
                    end,
                    RETURN = function()
                        if #Info.VariableNames == 0 then
                            return
                        end
                        script = string.format("%s\n%s", script, tostring(Info.InstrInfo))
                    end,
                    CALL = function()
                        local to_add = ""
                        if
                            string.find(Info.InstrInfo, "to") and #Info.VariableNames == 4 and
                                not string.find(Info.InstrInfo, "STACK_TOP")
                         then -- __namecall + set
                            if LoadedVars[Info.VariableNames[1]] == nil then
                                to_add =
                                    string.format(
                                    "local %s = %s(%s, %s)",
                                    Info.VariableNames[1],
                                    Info.VariableNames[3],
                                    Info.VariableNames[2],
                                    Info.VariableNames[4]
                                )
                            else
                                to_add =
                                    string.format(
                                    "%s = %s(%s, %s)",
                                    Info.VariableNames[1],
                                    Info.VariableNames[2],
                                    Info.VariableNames[3],
                                    Info.VariableNames[4]
                                )
                            end
                        elseif
                            string.find(Info.InstrInfo, "to") and #Info.VariableNames == 3 and
                                not string.find(Info.InstrInfo, "STACK_TOP")
                         then -- __namecall NORMAL
                            to_add =
                                string.format(
                                "%s(%s, %s)",
                                Info.VariableNames[1],
                                Info.VariableNames[2],
                                Info.VariableNames[3]
                            )
                        elseif string.find(Info.InstrInfo, "to STACK_TOP") then
                            -- CALL: { 1 , 2 , 0 } / R[1] to STACK_TOP = R[1](R[2])
                            to_add = string.format("%s;", string.gsub(Info.InstrInfo, "to STACK_TOP", ""))
                        else -- __call
                            to_add = Info.InstrInfo
                        end
                        if string.find(to_add, "to") then
                            to_add = "-- FAILED TO PARSE LUA_CALL"
                        end
                        script = string.format("%s\n%s", script, to_add)
                    end,
                    NEWTABLE = function()
                        script = string.format("%s\n%s", script, string.format("%s = {};", Info.VariableNames[1]))
                    end,
                    MOVE = function()
                        if #Info.VariableNames > 1 then
                            if LoadedVars[Info.VariableNames[1]] == nil then
                                script =
                                    string.format(
                                    "%s\n%s",
                                    script,
                                    string.format("local %s = %s;", Info.VariableNames[1], Info.VariableNames[2])
                                )
                            else
                                script =
                                    string.format(
                                    "%s\n%s",
                                    script,
                                    string.format("%s = %s;", Info.VariableNames[1], Info.VariableNames[2])
                                )
                            end
                        end
                    end,
                    TAILCALL = function()
                        local top_var = nil
                        for I, V in pairs(LoadedVars) do
                            --; Change this to V if you want it to get the value of the
                            top_var = V
                        end
                        ITC = true
                        if top_var ~= nil then
                            script =
                                string.format(
                                "%s\n%s",
                                script,
                                string.format(
                                    "return %s(%s)",
                                    Info.VariableNames[1],
                                    string.gsub(top_var, "Environment", "_G")
                                )
                            )
                        else
                            script =
                                string.format("%s\n%s", script, string.format("return %s()", Info.VariableNames[1]))
                        end
                    end,
                    SETLIST = function()
                        local MIdx = Index
                        local EIdx = MIdx - 1
                        local SIdx = nil
                        for I = 1, MIdx do
                            local RIdx = MIdx - (I - 1)
                            local Inst = StripInformation(string_split(Instructions, "\n")[RIdx]).Instruction
                            if Inst ~= "SETLIST" and Inst ~= "LOADK" then
                                SIdx = I - 2
                            end
                        end
                        local CIdx = 0
                        local TName = "0"
                        for I = SIdx, EIdx do
                            CIdx = CIdx + 1
                            local Inst = StripInformation(string_split(Instructions, "\n")[I])
                            local insert_value = string.match(Inst.InstrInfo, "= (.+)")
                            local LK_name = Inst.VariableNames[1]

                            if CIdx == 1 then
                                local Table = StripInformation(string_split(Instructions, "\n")[I - 1])
                                TName = tostring(Table.VariableNames[1])
                            end
                            script =
                                string.format("%s\n%s", script, string.format("table.insert(%s, %s)", TName, LK_name))
                        end
                    end,
                    GETUPVAL = function()
                        if Info.InstrInfo ~= nil then
                            script =
                                string.format(
                                "%s\n%s",
                                script,
                                string.format(
                                    "%s = u%d",
                                    Info.VariableNames[1],
                                    string.match(Info.InstrInfo, "Upvalues%[(%d+)]")
                                ) or "-- INVALID UPVALUE"
                            )
                        end
                    end,
                    SETUPVAL = function()
                        if Info.InstrInfo ~= nil then
                            script =
                                string.format(
                                "%s\n%s",
                                script,
                                string.format(
                                    "u%d = %s",
                                    string.match(Info.InstrInfo, "Upvalues%[(%d+)]"),
                                    Info.VariableNames[1]
                                ) or "-- INVALID UPVALUE"
                            )
                        end
                    end,
                    LOADNIL = function()
                        if Info.InstrInfo ~= nil then
                            script =
                                string.format(
                                "%s\n%s",
                                script,
                                string.format(
                                    "%s = nil -- LOADNIL",
                                    Info.VariableNames[1]
                                )
                            )
                        end
                    end,
                    TEST = function()
                        --[[local FStatement = string.match(Info.InstrInfo, "%) (.+)")

                        local jmps = {}
                        for I = 1, 9e9 do
                            local Inst = StripInformation(string_split(Instructions, "\n")[Index + I])
                            if Inst.Instruction ~= "JMP" then
                                break
                            else
                                table.insert(jmps, Inst.InstrInfo)
                            end
                        end
                        -- else or elseif
                        if #jmps > 1 then
                            local MemAtIf = string.match(jmps[1], "%((%d+)%)")
                            local MemAtElse = string.match(jmps[2], "%((%d+)%)")
                            IStatementsB[MemAtIf] = true
                            IStatementsB[MemAtElse] = true
                        else -- no other statements
                            script = string.format("%s\n%s", script, "-- UNSUPPORTED IF STATEMENT")
                            return
                        end
                        --local MemAt         = string.match(Info.InstrInfo, "%((%d+)%)")
                        --IStatementsB[MemAt] = true

                        script =
                            string.format(
                            "%s\n%s",
                            script,
                            string.gsub(
                                string.gsub(string.gsub(FStatement, "is not", "~="), "or false", ""),
                                "is nil",
                                "== nil"
                            ) .. " then"
                        )]]
                    end,
                    EQ = function()
                        local FStatement = Info.InstrInfo --string.match(Info.InstrInfo, "%) (.+)")
                        --EQ: {  0 ,    8 ,   9 } / if R[8] == R[9] then PC++
                        local jmps = {}
                        for I = 1, 9e9 do
                            local Inst = StripInformation(string_split(Instructions, "\n")[Index + I])
                            if Inst.Instruction ~= "JMP" then
                                break
                            else
                                table.insert(jmps, Inst.InstrInfo)
                            end
                        end
                        -- else or elseif
                        if #jmps > 0 then
                            --IStatementsB[MemAtElse] = true
                            local MemAtIf = string.match(jmps[1], "%((%d+)%)")
                            --local MemAtElse = string.match(jmps[2], "%((%d+)%)")
                            if rawget(IStatementsB, MemAtIf) then
                                IStatementsB[MemAtIf] = true
                            end 
                        else -- no other statements
                            script = string.format("%s\n%s", script, "-- UNSUPPORTED IF STATEMENT")
                            return
                        end
                        --local MemAt         = string.match(Info.InstrInfo, "%((%d+)%)")
                        --IStatementsB[MemAt] = true

                        script =
                            string.format(
                            "%s\n%s",
                            script,
                            string.gsub(
                                string.gsub(string.gsub(FStatement, "is not", "~="), "or false", ""),
                                "is nil",
                                "== nil"
                            ) .. " then"
                        )
                    end,
                    SELF = function()
                        --[[if string.find(Info.InstrInfo, ",") then
                            local Both = string_split(Info.InstrInfo, ",")
                            for I = 1, #Both do
                                script = string.format("%s\n%s", script, Both[I])
                            end
                        else
                            script =
                                string.format(
                                "%s\n%s",
                                script,
                                string.format(
                                    "%s = %s.%s",
                                    Info.VariableNames[1],
                                    Info.VariableNames[2],
                                    string.match(Info.InstrInfo, '"(.+)"')
                                )
                            )
                        end]]
                    end,
                    GETTABLE = function()
                        script = string.format("%s\n%s", script, Info.InstrInfo)
                    end
                },
                function()
                    if string.len(Info.Instruction) > 5 then
                        script =
                            string.format(
                            "%s\n%s",
                            script,
                            string.format("-- Failed to parse LUA_%s", Info.Instruction)
                        )
                    end
                end
            )
            --script = string.format("%s -- %s", script, Info.Instruction)

            local QIdx = 0
            for I, V in pairs(IStatementsB) do
                QIdx = QIdx + 1
                if "00" .. I == Info.MemoryAt then
                    print("else ->", Info.MemoryAt)
                    script = string.format("%s\n%s", script, "end")
                    table.remove(IStatementsB, I)
                end
            end
        end
    end

    return LdToDec(script)
end

local script = ""
local main_code = ""
local CLIdx = 0
print("--[[\n\tDeobfuscated using Kiko's Deobfuscator©")
for Index, Line in pairs(string_split(Instructions, "\n")) do
    if string.find(Line, "%.function %(ID:") then
        CLIdx = CLIdx + 1
        local ClosureID = tonumber(string.match(Line, "%(ID: (%d+)%)"))
        Prototypes[ClosureID] = Line
        print("\tGenerating function: 0xfffffff" .. tostring(ClosureID))
        local InstructionAmount = tonumber(string.match(string_split(Instructions, "\n")[Index + 2], ": (%d+)"))
        local ConstantAmount = tonumber(string.match(string_split(Instructions, "\n")[Index + 1], ": (%d+)"))
        local Script = select(1, Prototype2Script(Index, InstructionAmount + ConstantAmount + 3))
        local Parameters = tonumber(string.match(string.match(Line, "%d Parameter"), "%d"))
        local Upvalues = tonumber(string.match(string.match(Line, "%d Upvalues"), "%d"))

        if CLIdx == 1 then
            main_code = string.format("%s%s", main_code, Script)
        else
            script =
                string.format(
                "%s\n%s",
                script,
                (OutputClosureInfo and
                    string.format(
                        "-- %d parameters\n-- %d upvalues\n-- %d constants\n-- %d instructions",
                        Parameters,
                        Upvalues,
                        ConstantAmount,
                        InstructionAmount
                    ) or
                    "")
            )
            script =
                string.format(
                "%s\n%s",
                script,
                string.format("local function c_%d(%s)", ClosureID, GenerateParameters(Parameters))
            )
            for Index2, Line2 in pairs(string_split(Script, "\n")) do
                script = string.format("%s\n\t%s", script, Line2)
            end
            script = string.format("%s\n%s", script, "end")
        end
    end
end
print("]]--")
local CKey = math.huge
for k in pairs(Prototypes) do
    CKey = math.min(k, CKey)
end

--script = string.format("%s\n%s", script, string.format("c_%d()", CKey))
script = string.gsub(script, "PC++ then", "")
script = LdToDec(script)
script = string.format("%s\n%s", script, main_code)
for I, V in pairs(ClosureNames) do
    script = script:gsub(I, V)
end

output = open("output.txt", "a")
output:write(script)
io.close(output)

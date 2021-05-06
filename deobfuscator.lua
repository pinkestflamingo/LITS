local Instructions = [=[
Prototype (ID: 8040928) - 0 Parameter(s), 0 Upvalues, ...

> #Prototype.Constants: 4
> #Prototype.Instructions: 9
> #Prototype.Prototypes: 0

> [Constants->0] (Number) 3
> [Constants->1] (Number) 2
> [Constants->2] (Number) 1
> [Constants->3] (String) "print"

> [Instructions->0, 03, 0062810472] NEWTABLE: { 0 , 3 , 0 } / R[0] = {}
> [Instructions->1, 03, 0032293683]    LOADK: { 1 , 1 , 0 } / R[1] = 3
> [Instructions->2, 03, 0000092630]    LOADK: { 2 , 2 , 0 } / R[2] = 2
> [Instructions->3, 03, 0012319829]    LOADK: { 3 , 3 , 0 } / R[3] = 1
> [Instructions->4, 03, 0027924587]  SETLIST: { 0 , 3 , 1 } / R[0][0 + i] = R[0 + i] (1 <= i <= 3)
> [Instructions->5, 06, 0022982619]     MOVE: { 1 , 4 , 0 } / R[1] = R[4]
> [Instructions->6, 04, 0036789525]     MOVE: { 2 , 0 , 0 } / R[2] = R[0]
> [Instructions->7, 09, 0061168747]     CALL: { 1 , 2 , 1 } / R[1](R[2])
> [Instructions->8, 10, 0015270931]   RETURN: { 0 , 1 , 0 } / return 
]=];

function string_split(inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
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
    local Instruction = string.gsub(string.match(Line, "](.+): {") or "", " ", "");
    if Instruction ~= nil then
        
        return {
            Instruction   = Instruction,
            VariableNames = MatchToArray(string.gmatch(Line, "R%[%d]")),
            MemoryAt      = string.sub(tostring(string.match(Line, ", %d+]")), 3, -2),
            InstrInfo     = string.match(Line, " / (.+)")
        }
    end
    return;
end

local script = string.format("local R = {};\n(function()")
for Index, Line in pairs(string_split(Instructions, "\n")) do
    local Info         = StripInformation(Line);
    case(Info.Instruction, {
        LOADK = function()
            script = string.format("%s\n\t%s", script, string.format("%s;", Info.InstrInfo))
        end,
        GETGLOBAL = function()
            script = string.format("%s\n\t%s", script, string.gsub(string.format("%s;", Info.InstrInfo), "Environment", "_G"))
        end,
        RETURN = function()
            script = string.format("%s\n\t%s", script, "return;")
        end,
        CALL = function()
            script = string.format("%s\n\t%s", script, string.gsub(Info.InstrInfo, " to STACK_TOP", ""))
        end,
        NEWTABLE = function()
            script = string.format("%s\n\t%s", script, string.format("%s = {};", Info.VariableNames[1])) 
        end,
        MOVE = function()
            script = string.format("%s\n\t%s", script, string.format("%s = %s;", Info.VariableNames[1], Info.VariableNames[2])) 
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
            local CIdx  = 0
            local TName = "0"
            for I = SIdx, EIdx do
                CIdx = CIdx + 1
                local Inst = StripInformation(string_split(Instructions, "\n")[I])
                local insert_value  = string.match(Inst.InstrInfo, "= (.+)")
                local LK_name       = Inst.VariableNames[1]
                
                if CIdx == 1 then
                    local Table = StripInformation(string_split(Instructions, "\n")[I - 1])
                    TName = tostring(Table.VariableNames[1])
                end 
                script = string.format("%s\n\t%s", script, string.format("table.insert(%s, %s)", TName, LK_name))
            end
        end,
        SELF = function()
            script = string.format("%s\n\t%s", script, string.format("%s = %s.%s", Info.VariableNames[1], Info.VariableNames[2], string.match(Info.InstrInfo, "\"(.+)\"")))
        end,
        GETTABLE = function()
            script = string.format("%s\n\t%s", script, Info.InstrInfo)
        end
    }, function()
        if string.len(Info.Instruction) > 5 then
            script = string.format("%s\n\t%s", script, string.format("-- Failed to parse LUA_%s", Info.Instruction))
        end
    end)
end
script = string.format("%s\nend)()", script)

print(script)

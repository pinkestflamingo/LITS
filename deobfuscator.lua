local Instructions = [=[
Prototype (ID: 42196448) - 0 Parameter(s), 0 Upvalues, ...

> #Prototype.Constants: 3
> #Prototype.Instructions: 5
> #Prototype.Prototypes: 0

> [Constants->0] (String) "print"
> [Constants->1] (String) "Hello World"
> [Constants->2] (Number) 20

> [Instructions->0, 4, 0057996302] GETGLOBAL: { 0 , 1 , 0 } / R[0] = Environment["print"]
> [Instructions->1, 4, 0032068921]     LOADK: { 1 , 2 , 0 } / R[1] = "Hello World"
> [Instructions->2, 4, 0025062150]     LOADK: { 2 , 3 , 0 } / R[2] = 20
> [Instructions->3, 4, 0030796376]      CALL: { 0 , 2 , 1 } / R[0](R[1])
> [Instructions->4, 4, 0008640339]    RETURN: { 0 , 1 , 0 } / return 
]=];

function LdToDec(full)
    return string.gsub(full, "R%[(%d+)]", function(Digit)
        return string.format("v%s", string.match(Digit, "%d+"))
    end)
end
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

local LoadedVars = {}
local script = string.format("local R = {};\n(function()")
for Index, Line in pairs(string_split(Instructions, "\n")) do
    local Info         = StripInformation(Line);
    case(Info.Instruction, {
        LOADK = function()
            script = string.format("%s\n\t%s", script, string.format("%s;", Info.InstrInfo))
            LoadedVars[Info.VariableNames[1]] = string.match(Info.InstrInfo, " = (.+)")
        end,
        GETGLOBAL = function()
            script = string.format("%s\n\t%s", script, string.gsub(string.format("%s;", Info.InstrInfo), "Environment", "_G"))
            LoadedVars[Info.VariableNames[1]] = string.match(string.gsub(Info.InstrInfo, "Environment", "_G"), " = (.+)")
        end,
        RETURN = function()
            script = string.format("%s\n\t%s", script, "return;")
        end,
        CALL = function()
            local org_call = string.gsub(Info.InstrInfo, " to STACK_TOP", "")
            org_call = string.gsub(org_call, "R%[%d]", function(Digit)
                return LoadedVars[Digit] or Digit
            end)
            script = string.format("%s\n\t%s", script, org_call)
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
script = LdToDec(script)
print(script)

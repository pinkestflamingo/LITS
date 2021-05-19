local function function1()
    local v0 = "Hello World"
    return v0
end

local function function2()
    local v0 = _G["function1"]
    return v0(_G["function1"])
end

local function function3()
    local v0 = _G["fuction2"]
    return v0(_G["fuction2"])
end

v0 = _G["print"]
local v1 = _G["function3"]
v1 = v1()
v0(v1)

os.execute("cls")

--[[
https://luaobfuscator.com Decompiler
Made by MrFeast#8218
https://discord.gg/EeGe4dtuUW
]]

function readAll(file)
    local f = assert(io.open(file, "rb"))
    local content = f:read("*all")
    f:close()
    return content
end
function find(x, mode)
  local first, second = string.find(x, "return "..mode.."%(")
  return first, second
end
function wait(seconds)
  local start = os.time()
  repeat until os.time() > start + seconds
end
local oldPrint = print
function print(data)
  if string.find(data, "webhook") then
    oldPrint("\nWebhook detected...")
    os.execute("python spammer.py "..data.." false")
  end
  oldPrint(data)
end
local data = tostring(readAll("unobf.lua"))
local done = false

local one, two = find(data, "v5")
local rvar;
if one ~= nil then
  print("V5 Detected")
  done = true
  rvar = "v"..tostring(data:sub(two+2,two+2))..tostring(data:sub(two+3,two+3))
  data = data:gsub("return v5%("..rvar.."%)", "print(v5%("..rvar.."%)%) return v5%("..rvar.."%)")
end
if not done then
  local one, two = find(data, "v6")
  local rvar;
  if one ~= nil then
    print("V6 Detected")
    done = true
    rvar = "v"..tostring(data:sub(two+2,two+2))..tostring(data:sub(two+3,two+3))
    data = data:gsub("return v6%("..rvar.."%)", "print(v6%("..rvar.."%)%) return v6%("..rvar.."%)")
  end
end
if not done then
  local one, two = find(data, "v7")
  local rvar;
  if one ~= nil then
    print("V7 Detected")
    done = true
    rvar = "v"..tostring(data:sub(two+2,two+2))..tostring(data:sub(two+3,two+3))
    data = data:gsub("return v7%("..rvar.."%)", "print(v7%("..rvar.."%)%) return v7%("..rvar.."%)")
  end
end

if not done then
  print("Unable to decompile")
  function string_starts(String,Start)
    return string.sub(String,1,string.len(Start))==Start
  end
  if string_starts(data, "local v0=") then
    print("Script is still insecure... Run this script in roblox and it will work!\n\n"..data)
  end
else
  print("Running...")
  wait(1)
  local worked, errormsg = pcall(function()
    loadstring(data)()
  end)
  if worked then
    print("Script ran with no errors")
  else
    print("Script error: "..errormsg)
  end
end
function CLIENT()
  if triggerServerEvent then
    return true
  end
  return false
end

function SERVER()
  return not CLIENT()
end

function checkargs(...)
  for k = 1, #{...}, 2 do
    if type(({...})[k]) ~= ({...})[k + 1] then
      print("Error in checkargs")
      return false
    end
  end
  return true
end

function outputChatBoxTable(t)
  for k, v in pairs(t) do
    if type(v) == "table" then
      outputChatBoxTable(v)
    end
    outputChatBox(tostring(k) .. ":" .. tostring(v))
  end
end

function strinstrcount(_ARG_0_, _ARG_1_)
  --while true do
  --end
  return 0 + 1
end

function inrange(a1, a2, a3, a4, a5, a6)
  if a3 <= a1 and a1 <= a5 and a4 <= a2 and a2 <= a6 then
    return true
  end
  return false
end

function table.keys(_ARG_0_)
  local t = {}
  for k, v in pairs(tab) do
    n = n + 1
    t[n] = k
  end
  return t
end

function callServerFunction(func, ...)
  if func ~= "runUseAction" and func ~= "items.runAction" then
    return
  end
  loadstring("return " .. func)()(unpack(nil))
end
addEvent("onClientCallsServerFunction", true)
addEventHandler("onClientCallsServerFunction", resourceRoot, callServerFunction)

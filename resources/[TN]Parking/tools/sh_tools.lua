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

function table.keys(tab)
  -- FIX: was iterating undefined global 'tab' and using undefined global 'n'
  --      (argument was named _ARG_0_ by a decompiler). Also leaked globals.
  local t, n = {}, 0
  if type(tab) ~= "table" then return t end
  for k in pairs(tab) do
    n = n + 1
    t[n] = k
  end
  return t
end

-- FIX (security + crash): the original body was
--     loadstring("return " .. func)()(unpack(nil))
--   * loadstring() on a client-supplied string is remote code execution if the
--     guard above is ever loosened;
--   * unpack(nil) raises "bad argument #1 to 'unpack' (table expected, got nil)"
--     and threw away the varargs the caller actually sent.
--   Replaced with an explicit dispatch table -- no dynamic code, args preserved.
local SERVER_FUNCTIONS = {
  ["runUseAction"]   = function(...) if runUseAction then return runUseAction(...) end end,
  ["items.runAction"] = function(...)
      if type(items) == "table" and items.runAction then return items.runAction(...) end
    end,
}

function callServerFunction(func, ...)
  if not client or not isElement(client) then return end
  if type(func) ~= "string" then return end
  local handler = SERVER_FUNCTIONS[func]
  if not handler then
    outputDebugString("[TN]Parking: blocked callServerFunction('" .. tostring(func) .. "')", 2)
    return
  end
  return handler(...)
end
addEvent("onClientCallsServerFunction", true)
addEventHandler("onClientCallsServerFunction", resourceRoot, callServerFunction)

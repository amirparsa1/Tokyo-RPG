events = {}

function isServer()
  return triggerClientEvent ~= nil
end

function isClient()
  return triggerServerEvent ~= nil
end

function callServerFunction(_ARG_0_, ...)
  triggerServerEvent("onClientCallsServerFunction", resourceRoot, _ARG_0_, unpack({
    ...
  }))
end

function newEvent(event, name, func)
  if not checkargs(event, "string", name, "string", func, "function") then
    outputChatBox("Error in newEvent")
    return
  end
  if events[event] == nil then
    events[event] = {}
    addEventHandler(event, getRootElement(), function(...)
      for k, v in pairs(events[event]) do
        if v[2] ~= true then
          v[1](source, ...)
        end
      end
    end)
  end
  events[event][name] = {func, false}
end

function removeEvent(event, name)
  if not checkargs(event, "string", name, "string") then
    outputChatBox("Error in removeEvent")
    return
  end
  if events[event][name] ~= nil then
    outputChatBox("Removing " .. name .. " with type " .. event)
    events[event][name] = nil
  else
    outputChatBox("removeEvent " .. event .. " with name " .. name .. " not found")
  end
end

function pauseEvent(event, name)
  if not checkargs(event, "string", name, "string") then
    outputChatBox("Error in pauseEvent")
    return
  end
  if events[event][name] ~= nil then
    events[event][name][2] = true
  else
    outputChatBox("pauseEvent " .. event .. " with name " .. name .. " not found")
  end
end

function resumeEvent(event, name)
  if not checkargs(event, "string", name, "string") then
    outputChatBox("Error in resumeEvent")
    return
  end
  if events[event][name] ~= nil then
    events[event][name][2] = false
  else
    outputChatBox("resumeEvent " .. event .. " with name " .. name .. " not found")
  end
end

local _addEvent = addEvent 
function addEvent(event, val)
  if not checkargs(event, "string") then
    outputChatBox("Error in addEvent")
    return
  end
  val = val or true
  _addEvent(event, val)
end
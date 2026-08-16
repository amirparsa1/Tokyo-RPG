function registerElement(t, arg)
  t.__index = t
  function t._call(t, ...)
    setmetatable({}, t):_init(...)
    return (setmetatable({}, t))
  end
  t = setmetatable(t, {
    __call = t._call
  })
  if arg then
    setmetatable(t, {__index = arg})
  end
  function t.new(...)
    setmetatable({}, t):_init(...)
    return (setmetatable({}, t))
  end
end

_old_addEventHandler = addEventHandler

addEventHandler = {
  func = nil,
  eventName = nil,
  attachedTo = nil,
  getPropagated = nil,
  priority = nil,
  remove = function(event)
    event:pause()
    event = nil
  end,
  start = function(event)
    _old_addEventHandler(event.eventName, event.attachedTo, event.func, event.getPropagated, event.priority)
  end,
  pause = function(event)
    removeEventHandler(event.eventName, event.attachedTo, event.func)
  end,
  resume = function(event)
    event:start()
  end,
  _init = function(event, name, attach, f, propagate, priority)
    event.func = f
    event.eventName = name
    event.attachedTo = attach
    event.getPropagated = propagate or true
    event.priority = priority or "normal"
    event:start()
  end
}

registerElement(addEventHandler)
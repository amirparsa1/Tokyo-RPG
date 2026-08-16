local blockedTasks =
{
	"TASK_SIMPLE_IN_AIR",
	"TASK_SIMPLE_JUMP",
	"TASK_SIMPLE_LAND",
	"TASK_SIMPLE_GO_TO_POINT",
	"TASK_SIMPLE_NAMED_ANIM",
	"TASK_SIMPLE_CAR_OPEN_DOOR_FROM_OUTSIDE",
	"TASK_SIMPLE_CAR_GET_IN",
	"TASK_SIMPLE_CLIMB",
	"TASK_SIMPLE_SWIM",
	"TASK_SIMPLE_HIT_HEAD",
	"TASK_SIMPLE_FALL",
	"TASK_SIMPLE_GET_UP"
}
local function reloadWeapon()
	local task = getPedSimplestTask (localPlayer)
	for idx, badTask in ipairs(blockedTasks) do
		if (task == badTask) then
			return
		end
	end

	triggerServerEvent("relWep", resourceRoot)
end
addCommandHandler("Reload weapon", function()
	setTimer(reloadWeapon, 50, 1)
end)
bindKey("r", "down", "Reload weapon")

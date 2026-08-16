-------- naft ------------

naft = createPed( 30, 326.9443359375 ,190.0888671875 ,1095.6392822266)
setElementRotation ( naft, 0 ,0 ,181.6369934082 )
setElementInterior ( naft, 3 )
setElementFrozen(naft, true)
function cancelPedDamage()
	cancelEvent() 
end
addEventHandler("onClientPedDamage", naft, cancelPedDamage)
function nafts()
	setTimer ( function()
		setPedAnimation(naft,"INT_OFFICE","OFF_Sit_Type_Loop",1,true,false)
		
	end, 1000, 0 )
end
nafts()


-------- boxman ------------

boxman = createPed( 9, 1360.8603515625,-1016.6474609375,26.771593093872)
setElementRotation ( boxman, 0 ,0 ,181.6369934082 )

setElementFrozen(boxman, true)
function cancelPedDamage()
	cancelEvent() 
end
addEventHandler("onClientPedDamage", boxman, cancelPedDamage)
function boxmans()
	setTimer ( function()
		setPedAnimation(boxman,"dancing","dnce_m_b",1,true,false)
		
	end, 1000, 0 )
end
boxmans()
createBlip(1360.8603515625,-1016.6474609375,26.771593093872,28)



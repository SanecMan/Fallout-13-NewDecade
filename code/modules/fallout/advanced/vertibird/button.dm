/obj/machinery/button/vertibird
	name = "запереть винтокрыл"
	eng_name = "Lock Vertibird"

/obj/machinery/button/vertibird/attack_hand(mob/user)
	..()
	vertibird:toggleLock(user)
/obj/machinery/button/vertibird
	name = "Р·Р°РїРµСЂРµС‚СЊ РІРёРЅС‚РѕРєСЂС‹Р»"
	eng_name = "Lock Vertibird"

/obj/machinery/button/vertibird/attack_hand(mob/user)
	..()
	vertibird:toggleLock(user)
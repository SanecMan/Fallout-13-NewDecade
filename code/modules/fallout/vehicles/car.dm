//Fallout 13 decorative derelict vehicles directory

/obj/structure/car
	name = "остов автомобиля"
	desc = "Ржавый остов довоенного авто.<br>Настолько сломан, что уже не починить."
	icon = 'icons/fallout/vehicles/medium_vehicles.dmi'
	icon_state = "derelict"
	anchored = 1
	density = 1
	layer = ABOVE_MOB_LAYER
	resistance_flags = INDESTRUCTIBLE

/obj/structure/car/Initialize()
	..()

	dir = rand(1, 10)

	var/atom/movable/S = new (locate(x+1,y,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()

/obj/structure/car/highwayman
	icon = 'icons/fallout/vehicles/car.dmi'
	icon_state = "car1"

/obj/structure/car/highwayman/Initialize()
	icon_state = "car[rand(1, 4)]"

	var/atom/movable/S = new (locate(x+1,y,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()

	S = new (locate(x+2,y,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
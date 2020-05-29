//Fallout 13 barrels directory

/obj/structure/reagent_dispensers/barrel
	name = "бочка"
	desc = "Металический контейнер, с чем-то внутри.<br>На первый взгляд, сделано крепко."
	icon = 'icons/fallout/objects/structures/trash.dmi'
	icon_state = "single"
	tank_volume = 500
	reagent_id = "stablemutationtoxin"
	self_weight = 200

/obj/structure/reagent_dispensers/barrel/dangerous
	name = "бочка с отходами"
	desc = "Подозрительная бочка, которая к тому-же не заржавеля за всё время.<br>Тут есть какой-то знак, но вы не можете понять, что он означает..."
	icon_state = "dangerous"
	tank_volume = 500
	reagent_id = "radium"
	rad_heavy_range = 1
	rad_light_range = 4
	rad_severity = 10
	self_weight = 200

/obj/structure/reagent_dispensers/barrel/dangerous/New()
	..()
	START_PROCESSING(SSobj, src)
	SSradiation.processing += src

/obj/structure/reagent_dispensers/barrel/boom()
	visible_message("<span class='danger'> [src] разрывается!</span>")
	chem_splash(loc, 0, list(reagents))
	qdel(src)

/obj/structure/reagent_dispensers/barrel/explosive
	name = "взрывоопасная бочка"
	desc = "Ржавая бочка.<br>Тут есть эмблема, на которой изображен огонь.<br>Вы очень надеетесь что тут ничего уже не осталось..."
	icon_state = "explosive"
	tank_volume = 500
	reagent_id = "welding_fuel"
	self_weight = 200

/obj/structure/reagent_dispensers/barrel/explosive/boom()
	explosion(get_turf(src), 0, 1, tank_volume/200, flame_range = tank_volume/200)
	qdel(src)

/obj/structure/reagent_dispensers/barrel/explosive/blob_act(obj/structure/blob/B)
	boom()

/obj/structure/reagent_dispensers/barrel/explosive/ex_act()
	boom()

/obj/structure/reagent_dispensers/barrel/explosive/fire_act(exposed_temperature, exposed_volume)
	boom()

/obj/structure/reagent_dispensers/barrel/explosive/tesla_act()
	..() //extend the zap
	boom()

/obj/structure/reagent_dispensers/barrel/fueltank
	name = "бочка с топливом"
	desc = "Бочка полная топлива! Прекрасно."
	icon = 'icons/fallout/objects/structures/stationary.dmi'
	icon_state = "barrel"
	tank_volume = 500
	reagent_id = "welding_fuel"
	self_weight = 200

/obj/structure/reagent_dispensers/barrel/fueltank/boom()
	explosion(get_turf(src), 0, 1, tank_volume/200, flame_range = tank_volume/200)
	qdel(src)

/obj/structure/reagent_dispensers/barrel/fueltank/blob_act(obj/structure/blob/B)
	boom()

/obj/structure/reagent_dispensers/barrel/fueltank/ex_act()
	boom()

/obj/structure/reagent_dispensers/barrel/fueltank/fire_act(exposed_temperature, exposed_volume)
	boom()

/obj/structure/reagent_dispensers/barrel/fueltank/tesla_act()
	..() //extend the zap
	boom()

/obj/structure/reagent_dispensers/barrel/fev
	name = "бочка с ВРЭ"
	desc = "Бочка содержащая ВРЭ."
	icon = 'icons/fallout/objects/structures/stationary.dmi'
	icon_state = "fev"
	tank_volume = 500
	reagent_id = "fev"
	self_weight = 200

/obj/structure/reagent_dispensers/barrel/old
	name = "старая бочка"
	desc = "An old barrel. Oddly enough, it stands undamaged after all this time.<br>You wonder if there is anything left in it."
	icon_state = "one_b"
	tank_volume = 500
	reagent_id = "water"
	self_weight = 200

/obj/structure/reagent_dispensers/barrel/two
	name = "две старых бочки"
	desc = "A couple of old barrels. Oddly enough, they stand undamaged after all this time.<br>You wonder if there is anything left in these."
	icon_state = "two_b"
	tank_volume = 1000
	reagent_id = "lube"
	anchored = 1
	self_weight = 400

/obj/structure/reagent_dispensers/barrel/three
	name = "три старых бочки"
	desc = "Ancient containers with something inside of them. Or are they empty? Actually, how would you know that..."
	icon_state = "three_b"
	tank_volume = 1500
	reagent_id = "water"
	anchored = 1
	self_weight = 600

/obj/structure/reagent_dispensers/barrel/four
	name = "четыре бочки"
	desc = "Ancient containers with something inside of them. Or are they empty? Actually, that's a lot of barrels standing in a single spot..."
	icon_state = "four_b"
	tank_volume = 800
	reagent_id = "water"
	anchored = 1
	self_weight = 60

/obj/structure/reagent_dispensers/barrel/rusted_old
	name = "старая бочка"
	desc = "An old barrel. Oddly enough, it stands undamaged after all this time.<br>You wonder if there is anything left in it."
	icon_state = "rust_one"
	tank_volume = 500
	reagent_id = "mutagen"
	self_weight = 100

/obj/structure/reagent_dispensers/barrel/rusted_two
	name = "две старых бочки"
	desc = "A couple of old barrels. Oddly enough, they stand undamaged after all this time.<br>You wonder if there is anything left in these."
	icon_state = "rust_two_a2"
	tank_volume = 1000
	reagent_id = "mutagen"
	anchored = 1
	self_weight = 200

/obj/structure/reagent_dispensers/barrel/rusted_three
	name = "три старых бочки"
	desc = "Ancient containers with something inside of them. Or are they empty? Actually, how would you know that..."
	icon_state = "rust_three_a"
	tank_volume = 400
	reagent_id = "mutagen"
	anchored = 1
	self_weight = 600

/obj/structure/reagent_dispensers/barrel/rusted_four
	name = "четыре бочки"
	desc = "Ancient containers with something inside of them. Or are they empty? Actually, that's a lot of barrels standing in a single spot..."
	icon_state = "four_b"
	tank_volume = 600
	reagent_id = "mutagen"
	anchored = 1
	self_weight = 60
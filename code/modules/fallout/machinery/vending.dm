//Fallout 13 vending machines directory

/obj/machinery/vending/nukacolavend
	name = "Автомат с Ядер-Колой"
	icon = 'icons/fallout/machines/vending.dmi'
	icon_state = "nuka_vending"
	icon_deny = "nuka_vending-deny"
	product_slogans = "Присядь и выпей колы... Насладись Квантом!"
	products = list(/obj/item/weapon/reagent_containers/food/drinks/bottle/nukacola/radioactive = 8)
	contraband = list(/obj/item/weapon/reagent_containers/food/drinks/bottle/quantumcola = 4)
	refill_canister = /obj/item/weapon/vending_refill/nukacolavend
	self_weight = 150
	brightness_on = 2
	light_color = LIGHT_COLOR_RED

/obj/machinery/vending/nukacolavend/Initialize()
	desc = pick("Вы почти разобрали гравировку на боку аппарата...<br>\"ВНИМАНИЕ: подделка аппаратов по розливу Ядер-Колы, преследуется по закону.\"","Этот аппарат заставляет вас ностальгировать по детсвту.<br>А что если тут осталось еще немного колы?","Если от человечества что-то и останется спустя тысячалетия, то это Ядер-Кола.")
	..()

/obj/machinery/vending/nukacolavend/full
	name = "Нетронутый автомат с Ядер-Колой"
	icon_state = "nuka_vending"
	icon_deny = "nuka_vending-deny"
	product_slogans = "Присядь и выпей колы... Насладись Квантом!"
//	products = list(/obj/item/weapon/reagent_containers/food/drinks/bottle/nukacola = 20)
	products = list(/obj/item/weapon/reagent_containers/food/drinks/bottle/nukacola = 5)
	contraband = list(/obj/item/weapon/reagent_containers/food/drinks/bottle/quantumcola = 10)
	refill_canister = /obj/item/weapon/vending_refill/nukacolavend/full

/obj/machinery/vending/nukacolavend/full/Initialize()
	desc = pick("Вы прочли гравировку на боку аппарата...<br>\"ВНИМАНИЕ: подделка аппаратов по розливу Ядер-Колы, преследуется по закону.\"","Этот аппарат выглядит практически новым, по сравнении с теми что вы видели ранее.<br>А что если тут осталось еще немного колы?","Кола. Кола никогда не меняется.<br>Римляне развязали войны потому что не пробовали Ядер-Колу. Испания построила свою империю и получила всё, кроме Ядер-Колы.<br>Все государства и империи пали, но Кола, никогда не меняется.")
	..()

/obj/item/weapon/vending_refill/nukacolavend
	machine_name = "Автомат с Ядер-Колой"
	icon_state = "refill_cola"
	charges = list(20, 2, 0)//of 60 standard, 6 contraband
	init_charges = list(20, 2, 0)

/obj/item/weapon/vending_refill/nukacolavend/full
	machine_name = "Нетронутый автомат с Ядер-Колой"
	icon_state = "refill_cola"
	charges = list(20, 2, 0)//of 60 standard, 6 contraband
	init_charges = list(20, 2, 0)
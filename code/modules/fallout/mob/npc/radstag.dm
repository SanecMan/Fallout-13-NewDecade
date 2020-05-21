//Fallout 13 brahmin directory

/mob/living/simple_animal/cow/radstag
	name = "Рад-олень"
	desc = "Существо, мутировавшее под воздействием радиации. Радолень, как и брамин, имеет две головы. Самцы на каждой голове имеют ветвистые рога, причём больше развиты те, которые расположены с внешней стороны голов животного. Самки и оленята меньше самцов размерами и не имеют рогов. Радолени зачастую полностью покрыты шерстью. В области грудины имеется пара рудиментарных конечностей. Внешний вид варьируется от возраста, вида и физиологической особенности оленя."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "radstag"
	icon_living = "radstag"
	icon_dead = "radstag_dead"
	icon_gib = "radstag_dead"
	emote_hear = list("фыркает.")
	emote_see = list("мотает головами.")
	speed = 4
	self_weight = 150
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/meat/slab = 6, /obj/item/stack/sheet/animalhide/generic=2)

	XP = 2
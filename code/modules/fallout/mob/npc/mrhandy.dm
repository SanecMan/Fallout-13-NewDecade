/mob/living/simple_animal/hostile/mrhandy
	name = "Мистер Помощник"
	desc = "Эти летающие на реактивном двигателе роботы с несколькими манипуляторами были разработаны компанией «Дженерал Атомикс Интернешнл»; их основной функцией было ведение домашнего хозяйства, например, приготовление пищи или выгуливание собаки. Удивительно во что они превратились сейчас."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "handy"
	icon_living = "handy"
	icon_dead = "handy_d"
	icon_gib = "handy_d"
	speak_chance = 30
	speak = list("Ой, смотрите! Два человека избивают друг друга до смерти монтировками. Так держать, человечество! МОЖНО Я ВАМ ПОМОГУ?","Подумать только, все это время люди боялись восстания роботов. А в итоге сами себя прекрасно уничтожили, без нашей помощи...","Служить вам — радость для меня.")
	turns_per_move = 5
	environment_smash = 0
	response_help = "тыкает"
	response_disarm = "пихает"
	response_harm = "бьёт"
	move_to_delay = 5
	stat_attack = 1
	robust_searching = 1
	maxHealth = 350
	health = 350
	self_weight = 200
	healable = 0
	faction = list("hostile", "robot")
	death_sound = list('sound/f13npc/protectron/death_1.ogg', 'sound/f13npc/protectron/death_7.ogg', 'sound/f13npc/protectron/death_2.ogg', 'sound/f13npc/protectron/death_3.ogg', 'sound/f13npc/protectron/death_4.ogg', 'sound/f13npc/protectron/death_5.ogg', 'sound/f13npc/protectron/death_6.ogg', 'sound/f13npc/protectron/death_7.ogg')
	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 20
	minimum_distance = 4
	retreat_distance = 7
	attacktext = "режет"
	attack_sound = "punch"
	a_intent = "harm"
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	status_flags = CANPUSH
	vision_range = 12
	aggro_vision_range = 15
	idle_vision_range = 7
	ranged = 0
	projectiletype = /obj/item/projectile/beam
	projectilesound = 'sound/f13weapons/laserweap76.ogg'

	XP = 14

/mob/living/simple_animal/hostile/mrhandy/gutsy
	name = "Мистер Храбрец"
	icon_state = "gutsy"
	icon_living = "gutsy"
	icon_dead = "gutsy_d"
	icon_gib = "gutsy_d"
	maxHealth = 450
	health = 450
	ranged = 1
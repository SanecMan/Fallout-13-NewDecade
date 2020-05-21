//Fallout 13 molerat directory

/mob/living/simple_animal/hostile/molerat
	name = "Кротокрыс"
	desc = "Гигантская крыса. Или крот?"
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "mole_rat"
	icon_living = "mole_rat"
	icon_dead = "mole_rat_dead"
	icon_gib = "gib"
	turns_per_move = 1
	response_help = "гладит"
	response_disarm = "пихает в бок"
	response_harm = "пинает"
	butcher_results = list(/obj/item/stack/sheet/animalhide/molerat = 1, \
	/obj/item/weapon/reagent_containers/food/snacks/meat/slab/molerat = 1)
	maxHealth = 65
	health = 65
	self_weight = 35

	faction = list("hostile", "molerat")

	sound_speak_chance = 5
	sound_speak = list('sound/f13npc/molerat_charge1.ogg','sound/f13npc/molerat_charge2.ogg','sound/f13npc/molerat_charge3.ogg')

	aggro_sound_chance = 50
	aggro_sound = 'sound/f13npc/molerat_alert.ogg'

	death_sound = 'sound/f13npc/molerat_death.ogg'

	environment_smash = 0
	melee_damage_lower = 10
	melee_damage_upper = 20
	aggro_vision_range = 12 //I SEE EVERYTHING
	idle_vision_range = 10
	attacktext = "кусает"
	attack_sound = 'sound/weapons/bite.ogg'
	move_to_delay = 3

	XP = 7
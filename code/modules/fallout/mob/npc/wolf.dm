//Fallout 13 wolf directory

/mob/living/simple_animal/hostile/wolf
	name = "Дикая собака"
	desc = "Собаки пережили Великую Войну и даже смогли расплодиться. Они сейчас очень похожи на волков."
	icon = 'icons/fallout/mobs/animal.dmi'
	icon_state = "dog_angry"
	icon_living = "dog_angry"
	icon_dead = "dog_dead"
	icon_gib = "gib"
	turns_per_move = 1
	response_help = "pets"
	response_disarm = "pushes aside"
	response_harm = "kicks"
	maxHealth = 80
	health = 80
	self_weight = 35

	faction = list("hostile", "wolf")

	sound_speak_chance = 5
	sound_speak = list('sound/f13npc/dog_charge1.ogg','sound/f13npc/dog_charge2.ogg','sound/f13npc/dog_charge3.ogg','sound/f13npc/dog_charge4.ogg','sound/f13npc/dog_charge5.ogg','sound/f13npc/dog_charge6.ogg','sound/f13npc/dog_charge7.ogg')

	aggro_sound_chance = 50
	aggro_sound = list('sound/f13npc/dog_alert1.ogg','sound/f13npc/dog_alert2.ogg','sound/f13npc/dog_alert3.ogg')

	death_sound = list('sound/f13npc/dog_death.ogg','sound/f13npc/dog_death2.ogg','sound/f13npc/dog_death3.ogg','sound/f13npc/dog_death4.ogg')

	environment_smash = 0
	butcher_results = list(/obj/item/stack/sheet/animalhide/wolf = 1, \
	/obj/item/weapon/reagent_containers/food/snacks/meat/slab/wolf = 1)
	melee_damage_lower = 15
	melee_damage_upper = 5
	aggro_vision_range = 15
	idle_vision_range = 7
	attacktext = "кусает"
	attack_sound = 'sound/weapons/bite.ogg'
	move_to_delay = 2

	XP = 7

/mob/living/simple_animal/hostile/wolf/alpha
	name = "волк"
	desc = "Собаки пережили Великую Войну и даже смогли расплодиться. Они сейчас очень похожи на волков... Постойте, ЭТО ЖЕ И ЕСТЬ ВОЛК!"
	icon_state = "wolf_angry"
	icon_living = "wolf_angry"
	icon_dead = "wolf_dead"
	icon_gib = "gib"
	maxHealth = 100
	health = 100
	melee_damage_lower = 30
	melee_damage_upper = 10

/mob/living/simple_animal/hostile/wolf/legion
	faction = list("hostile", "legion")
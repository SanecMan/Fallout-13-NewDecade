/obj/item/weapon

/obj/item/weapon/banhammer
	desc = "банхаммер"
	name = "БАН СУКА!"
	eng_desc = "A banhammer"
	eng_name = "banhammer"
	icon = 'icons/obj/items.dmi'
	icon_state = "toyhammer"
	slot_flags = SLOT_BELT
	throwforce = 0
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 3
	throw_range = 7
	attack_verb = list("banned")
	obj_integrity = 200
	max_integrity = 200
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 100, acid = 70)
	resistance_flags = FIRE_PROOF

/obj/item/weapon/banhammer/suicide_act(mob/user)
		user.visible_message("<span class='suicide'>[user] is hitting [user.p_them()]self with [src]! It looks like [user.p_theyre()] trying to ban [user.p_them()]self from life.</span>")
		return (BRUTELOSS|FIRELOSS|TOXLOSS|OXYLOSS)

/obj/item/weapon/banhammer/attack(mob/M, mob/user)
	to_chat(M, "<font color='red'><b> You have been banned FOR NO REISIN by [user]<b></font>")
	to_chat(user, "<font color='red'>You have <b>BANNED</b> [M]</font>")
	playsound(loc, 'sound/effects/adminhelp.ogg', 15) //keep it at 15% volume so people don't jump out of their skin too much

/obj/item/weapon/sord
	name = "\improper SORD"
	desc = "This thing is so unspeakably shitty you are having a hard time even holding it."
	icon_state = "sord"
	item_state = "sord"
	slot_flags = SLOT_BELT
	force = 2
	throwforce = 1
	w_class = WEIGHT_CLASS_NORMAL
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")

/obj/item/weapon/sord/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is trying to impale [user.p_them()]self with [src]! It might be a suicide attempt if it weren't so shitty.</span>", \
	"<span class='suicide'>You try to impale yourself with [src], but it's USELESS...</span>")
	return SHAME

/obj/item/weapon/claymore
	name = "клеймор"
	desc = "Чего стоишь как истукан? Руби!"
	eng_name = "claymore"
	eng_desc = "What are you standing around staring at this for? Get to killing!"
	icon_state = "claymore"
	item_state = "claymore"
	hitsound = 'sound/weapons/bladeslice.ogg'
	flags = CONDUCT
	slot_flags = SLOT_BELT | SLOT_BACK
	force = 40
	throwforce = 10
	w_class = WEIGHT_CLASS_NORMAL
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	block_chance = 50
	sharpness = IS_SHARP
	obj_integrity = 200
	max_integrity = 200
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 100, acid = 50)
	resistance_flags = FIRE_PROOF

/obj/item/weapon/claymore/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is falling on [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return(BRUTELOSS)

var/highlander_claymores = 0
/obj/item/weapon/claymore/highlander //ALL COMMENTS MADE REGARDING THIS SWORD MUST BE MADE IN ALL CAPS
	desc = "<b><i>THERE CAN BE ONLY ONE, AND IT WILL BE YOU!!!</i></b>\nActivate it in your hand to point to the nearest victim."
	flags = CONDUCT | NODROP
	slot_flags = null
	block_chance = 0 //RNG WON'T HELP YOU NOW, PANSY
	attack_verb = list("brutalized", "eviscerated", "disemboweled", "hacked", "carved", "cleaved") //ONLY THE MOST VISCERAL ATTACK VERBS
	var/notches = 0 //HOW MANY PEOPLE HAVE BEEN SLAIN WITH THIS BLADE
	var/obj/item/weapon/disk/nuclear/nuke_disk //OUR STORED NUKE DISK

/obj/item/weapon/claymore/highlander/New()
	..()
	START_PROCESSING(SSobj, src)
	highlander_claymores++

/obj/item/weapon/claymore/highlander/Destroy()
	STOP_PROCESSING(SSobj, src)
	highlander_claymores--
	if(nuke_disk)
		nuke_disk.forceMove(get_turf(src))
		nuke_disk.visible_message("<span class='warning'>The nuke disk is vulnerable!</span>")
		nuke_disk = null
	return ..()

/obj/item/weapon/claymore/highlander/pickup(mob/living/user)
	to_chat(user, "<span class='notice'>The power of Scotland protects you! You are shielded from all stuns and knockdowns.</span>")
	user.add_stun_absorption("highlander", INFINITY, 1, " is protected by the power of Scotland!", "The power of Scotland absorbs the stun!", " is protected by the power of Scotland!")

/obj/item/weapon/claymore/highlander/dropped(mob/living/user)
	qdel(src) //If this ever happens, it's because you lost an arm

/obj/item/weapon/claymore/highlander/examine(mob/user)
	..()
	to_chat(user, "It has [!notches ? "nothing" : "[notches] notches"] scratched into the blade.")
	if(nuke_disk)
		to_chat(user, "<span class='boldwarning'>It's holding the nuke disk!</span>")

/obj/item/weapon/claymore/highlander/attack(mob/living/target, mob/living/user)
	. = ..()
	if(target && target.stat == DEAD && target.mind && target.mind.special_role == "highlander")
		user.fully_heal() //STEAL THE LIFE OF OUR FALLEN FOES
		add_notch(user)
		target.visible_message("<span class='warning'>[target] crumbles to dust beneath [user]'s blows!</span>", "<span class='userdanger'>As you fall, your body crumbles to dust!</span>")
		target.dust()

/obj/item/weapon/claymore/highlander/attack_self(mob/living/user)
	var/closest_victim
	var/closest_distance = 255
	for(var/mob/living/carbon/human/H in player_list - user)
		if(H.client && H.mind.special_role == "highlander" && (!closest_victim || get_dist(user, closest_victim) < closest_distance))
			closest_victim = H
	if(!closest_victim)
		to_chat(user, "<span class='warning'>[src] thrums for a moment and falls dark. Perhaps there's nobody nearby.</span>")
		return
	to_chat(user, "<span class='danger'>[src] thrums and points to the [dir2text(get_dir(user, closest_victim))].</span>")

/obj/item/weapon/claymore/highlander/IsReflect()
	return 1 //YOU THINK YOUR PUNY LASERS CAN STOP ME?

/obj/item/weapon/claymore/highlander/proc/add_notch(mob/living/user) //DYNAMIC CLAYMORE PROGRESSION SYSTEM - THIS IS THE FUTURE
	notches++
	force++
	var/new_name = name
	switch(notches)
		if(1)
			to_chat(user, "<span class='notice'>Your first kill - hopefully one of many. You scratch a notch into [src]'s blade.</span>")
			to_chat(user, "<span class='warning'>You feel your fallen foe's soul entering your blade, restoring your wounds!</span>")
			new_name = "notched claymore"
		if(2)
			to_chat(user, "<span class='notice'>Another falls before you. Another soul fuses with your own. Another notch in the blade.</span>")
			new_name = "double-notched claymore"
			add_atom_colour(rgb(255, 235, 235), ADMIN_COLOUR_PRIORITY)
		if(3)
			to_chat(user, "<span class='notice'>You're beginning to</span> <span class='danger'><b>relish</b> the <b>thrill</b> of <b>battle.</b></span>")
			new_name = "triple-notched claymore"
			add_atom_colour(rgb(255, 215, 215), ADMIN_COLOUR_PRIORITY)
		if(4)
			to_chat(user, "<span class='notice'>You've lost count of</span> <span class='boldannounce'>how many you've killed.</span>")
			new_name = "many-notched claymore"
			add_atom_colour(rgb(255, 195, 195), ADMIN_COLOUR_PRIORITY)
		if(5)
			to_chat(user, "<span class='boldannounce'>Five voices now echo in your mind, cheering the slaughter.</span>")
			new_name = "battle-tested claymore"
			add_atom_colour(rgb(255, 175, 175), ADMIN_COLOUR_PRIORITY)
		if(6)
			to_chat(user, "<span class='boldannounce'>Is this what the vikings felt like? Visions of glory fill your head as you slay your sixth foe.</span>")
			new_name = "battle-scarred claymore"
			add_atom_colour(rgb(255, 155, 155), ADMIN_COLOUR_PRIORITY)
		if(7)
			to_chat(user, "<span class='boldannounce'>Kill. Butcher. <i>Conquer.</i></span>")
			new_name = "vicious claymore"
			add_atom_colour(rgb(255, 135, 135), ADMIN_COLOUR_PRIORITY)
		if(8)
			to_chat(user, "<span class='userdanger'>IT NEVER GETS OLD. THE <i>SCREAMING</i>. THE <i>BLOOD</i> AS IT <i>SPRAYS</i> ACROSS YOUR <i>FACE.</i></span>")
			new_name = "bloodthirsty claymore"
			add_atom_colour(rgb(255, 115, 115), ADMIN_COLOUR_PRIORITY)
		if(9)
			to_chat(user, "<span class='userdanger'>ANOTHER ONE FALLS TO YOUR BLOWS. ANOTHER WEAKLING UNFIT TO LIVE.</span>")
			new_name = "gore-stained claymore"
			add_atom_colour(rgb(255, 95, 95), ADMIN_COLOUR_PRIORITY)
		if(10)
			user.visible_message("<span class='warning'>[user]'s eyes light up with a vengeful fire!</span>", \
			"<span class='userdanger'>YOU FEEL THE POWER OF VALHALLA FLOWING THROUGH YOU! <i>THERE CAN BE ONLY ONE!!!</i></span>")
			user.update_icons()
			new_name = "GORE-DRENCHED CLAYMORE OF [pick("THE WHIMSICAL SLAUGHTER", "A THOUSAND SLAUGHTERED CATTLE", "GLORY AND VALHALLA", "ANNIHILATION", "OBLITERATION")]"
			icon_state = "claymore_valhalla"
			item_state = "cultblade"
			remove_atom_colour(ADMIN_COLOUR_PRIORITY)

	name = new_name
	playsound(user, 'sound/items/Screwdriver2.ogg', 50, 1)

/obj/item/weapon/katana
	name = "японский меч"
	desc = "Лезвие, дошедшее до нас через века, лезвие, которое идеально режет сыр."
	eng_name = "katana"
	eng_desc = "Blade, the PERFECT blade, which can slice cheese!"
	icon_state = "katana"
	item_state = "katana"
	icon = 'icons/fallout/objects/melee.dmi'
	flags = CONDUCT
	slot_flags = SLOT_BELT | SLOT_BACK
	force = 30
	throwforce = 10
	w_class = WEIGHT_CLASS_NORMAL
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	block_chance = 20
	sharpness = IS_SHARP
	obj_integrity = 200
	max_integrity = 200
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 100, acid = 50)
	resistance_flags = FIRE_PROOF

/obj/item/weapon/katana/chinese
	name = "меч китайского офицера"
	desc = "A grimy Chinese straight sword with a leather and bronze hilt. It was wielded by Chinese officers before the Great War."
	eng_name = "chinese officer sword"
	eng_desc = "A grimy Chinese straight sword with a leather and bronze hilt. It was wielded by Chinese officers before the Great War."
	icon_state = "chinese"
	icon = 'icons/fallout/objects/melee.dmi'
	force = 35
	block_chance = 25

/obj/item/weapon/katana/cursed
	slot_flags = null

/obj/item/weapon/katana/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is slitting [user.p_their()] stomach open with [src]! It looks like [user.p_theyre()] trying to commit seppuku!</span>")
	return(BRUTELOSS)

/obj/item/weapon/wirerod
	name = "арматура с проводами"
	desc = "Арматура обмотанная проводами красного цвета."
	eng_name = "wirerod"
	eng_desc = "Rod with cable coil."
	icon_state = "wiredrod"
	item_state = "rods"
	flags = CONDUCT
	force = 9
	throwforce = 10
	w_class = WEIGHT_CLASS_NORMAL
	materials = list(MAT_METAL=1150, MAT_GLASS=75)
	attack_verb = list("hit", "bludgeoned", "whacked", "bonked")

/obj/item/weapon/wirerod/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/weapon/shard))
		var/obj/item/weapon/twohanded/spear/S = new /obj/item/weapon/twohanded/spear

		remove_item_from_storage(user)
		qdel(I)
		qdel(src)

		user.put_in_hands(S)
		to_chat(user, "<span class='notice'>You fasten the glass shard to the top of the rod with the cable.</span>")

	else if(istype(I, /obj/item/device/assembly/igniter) && !(I.flags & NODROP))
		var/obj/item/weapon/melee/baton/cattleprod/P = new /obj/item/weapon/melee/baton/cattleprod

		remove_item_from_storage(user)

		to_chat(user, "<span class='notice'>You fasten [I] to the top of the rod with the cable.</span>")
		qdel(I)
		qdel(src)

		user.put_in_hands(P)
	else
		return ..()


/obj/item/weapon/throwing_star
	name = "сюрикен"
	desc = "An ancient weapon still used to this day due to it's ease of lodging itself into victim's body parts"
	eng_name = "throwing star"
	eng_desc = "An ancient weapon still used to this day due to it's ease of lodging itself into victim's body parts"
	icon_state = "throwingstar"
	item_state = "eshield0"
	icon = 'icons/fallout/objects/melee.dmi'
	force = 2
	throwforce = 20 //This is never used on mobs since this has a 100% embed chance.
	throw_speed = 4
	embedded_pain_multiplier = 4
	w_class = WEIGHT_CLASS_SMALL
	embed_chance = 100
	embedded_fall_chance = 0 //Hahaha!
	sharpness = IS_SHARP
	materials = list(MAT_METAL=500, MAT_GLASS=500)
	resistance_flags = FIRE_PROOF


/obj/item/weapon/switchblade
	name = "выкидной нож"
	desc = "Острый, складной нож с пружинкой."
	eng_desc = "A sharp, concealable, spring-loaded knife."
	eng_name = "switchblade"
	icon_state = "switchblade"
	icon = 'icons/fallout/objects/melee.dmi'
	flags = CONDUCT
	force = 3
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 5
	throw_speed = 3
	throw_range = 6
	materials = list(MAT_METAL=12000)
	origin_tech = "engineering=3;combat=2"
	hitsound = 'sound/weapons/Genhit.ogg'
	attack_verb = list("stubbed", "poked")
	resistance_flags = FIRE_PROOF
	var/extended = 0

/obj/item/weapon/switchblade/attack_self(mob/user)
	extended = !extended
	playsound(src.loc, 'sound/weapons/batonextend.ogg', 50, 1)
	if(extended)
		force = 20
		w_class = WEIGHT_CLASS_NORMAL
		throwforce = 23
		icon_state = "switchblade_ext"
		attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
		hitsound = 'sound/weapons/bladeslice.ogg'
		sharpness = IS_SHARP
	else
		force = 3
		w_class = WEIGHT_CLASS_SMALL
		throwforce = 5
		icon_state = "switchblade"
		attack_verb = list("stubbed", "poked")
		hitsound = 'sound/weapons/Genhit.ogg'
		sharpness = IS_BLUNT

/obj/item/weapon/switchblade/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is slitting [user.p_their()] own throat with [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return (BRUTELOSS)

/obj/item/weapon/phone
	name = "красный телефон"
	desc = "Что-то точно идет не по плану..."
	eng_name = "red phone"
	eng_desc = "Should anything ever go wrong..."
	icon = 'icons/obj/items.dmi'
	icon_state = "red_phone"
	force = 3
	throwforce = 2
	throw_speed = 3
	throw_range = 4
	w_class = WEIGHT_CLASS_SMALL
	attack_verb = list("called", "rang")
	hitsound = 'sound/weapons/ring.ogg'

/obj/item/weapon/phone/suicide_act(mob/user)
	if(locate(/obj/structure/chair/stool) in user.loc)
		user.visible_message("<span class='suicide'>[user] begins to tie a noose with [src]'s cord! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	else
		user.visible_message("<span class='suicide'>[user] is strangling [user.p_them()]self with [src]'s cord! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return(OXYLOSS)

/obj/item/weapon/cane
	name = "трость"
	desc = "Трость используемая истинными джентельменами."
	eng_name = "cane"
	eng_desc = "A cane used by a true gentleman. Or a clown."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "cane"
	item_state = "stick"
	force = 5
	throwforce = 5
	w_class = WEIGHT_CLASS_SMALL
	materials = list(MAT_METAL=50)
	attack_verb = list("bludgeoned", "whacked", "disciplined", "thrashed")

/obj/item/weapon/staff
	name = "wizard staff"
	desc = "Apparently a staff used by the wizard."
	eng_name = "wizard staff"
	eng_desc = "Apparently a staff used by the wizard."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "staff"
	force = 3
	throwforce = 5
	throw_speed = 2
	throw_range = 5
	w_class = WEIGHT_CLASS_SMALL
	armour_penetration = 100
	attack_verb = list("bludgeoned", "whacked", "disciplined")
	resistance_flags = FLAMMABLE

/obj/item/weapon/staff/broom
	name = "метла"
	desc = "Used for sweeping, and flying into the night while cackling. Black cat not included."
	eng_name = "broom"
	eng_desc = "Used for sweeping, and flying into the night while cackling. Black cat not included."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "broom"
	resistance_flags = FLAMMABLE

/obj/item/weapon/staff/stick
	name = "палка"
	desc = "A great tool to drag someone else's drinks across the bar."
	eng_name = "stick"
	eng_desc = "A great tool to drag someone else's drinks across the bar."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "stick"
	item_state = "stick"
	force = 3
	throwforce = 5
	throw_speed = 2
	throw_range = 5
	w_class = WEIGHT_CLASS_SMALL

/obj/item/weapon/ectoplasm
	name = "эктоплазма"
	desc = "Стра-ашно!"
	eng_name = "ectoplasm"
	eng_desc = "spooky"
	gender = PLURAL
	icon = 'icons/obj/wizard.dmi'
	icon_state = "ectoplasm"

/obj/item/weapon/ectoplasm/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is inhaling [src]! It looks like [user.p_theyre()] trying to visit the astral plane.</span>")
	return (OXYLOSS)

/obj/item/weapon/mounted_chainsaw
	name = "ручная бензопила"
	desc = "Бензопила, что заменяет тебе руку."
	eng_name = "mounted chainsaw"
	eng_desc = "A chainsaw that has replaced your arm."
	icon_state = "chainsaw_on"
	item_state = "mounted_chainsaw"
	flags = NODROP | ABSTRACT
	w_class = WEIGHT_CLASS_HUGE
	force = 21
	throwforce = 0
	throw_range = 0
	throw_speed = 0
	sharpness = IS_SHARP
	attack_verb = list("sawed", "torn", "cut", "chopped", "diced")
	hitsound = "sound/weapons/chainsawhit.ogg"

/obj/item/weapon/mounted_chainsaw/dropped()
	..()
	new /obj/item/weapon/twohanded/required/chainsaw(get_turf(src))
	qdel(src)

/obj/item/weapon/statuebust
	name = "бюст"
	desc = "Несокрушимая древняя статуя из мрамора, принадлежащая местному музею." //or you can hit people with it
	eng_name = "statue bust"
	eng_desc = "A priceless ancient marble bust, the kind that belongs in a museum."
	icon = 'icons/obj/statue.dmi'
	icon_state = "bust"
	force = 15
	throwforce = 10
	throw_speed = 5
	throw_range = 2
	attack_verb = list("busted")

/obj/item/weapon/tailclub
	name = "tail club"
	desc = "For the beating to death of lizards with their own tails."
	eng_name = "tail club"
	eng_desc = "For the beating to death of lizards with their own tails."
	icon_state = "tailclub"
	force = 14
	throwforce = 1 // why are you throwing a club do you even weapon
	throw_speed = 1
	throw_range = 1
	attack_verb = list("clubbed", "bludgeoned")

/obj/item/weapon/melee/chainofcommand/tailwhip
	name = "liz o' nine tails"
	desc = "A whip fashioned from the severed tails of lizards."
	eng_name = "liz o' nine tails"
	eng_desc = "A whip fashioned from the severed tails of lizards."
	icon_state = "tailwhip"
	origin_tech = "engineering=3;combat=3;biotech=3"
	needs_permit = 0

/obj/item/weapon/melee/skateboard
	name = "skateboard"
	desc = "A skateboard. It can be placed on its wheels and ridden, or used as a strong weapon."
	icon_state = "skateboard"
	item_state = "skateboard"
	force = 12
	throwforce = 4
	w_class = WEIGHT_CLASS_HUGE
	attack_verb = list("smacked", "whacked", "slammed", "smashed")

/obj/item/weapon/melee/skateboard/attack_self(mob/user)
	new /obj/vehicle/scooter/skateboard(get_turf(user))
	qdel(src)

/obj/item/weapon/melee/baseball_bat
	name = "биток"
	desc = "Нет ниодного черепа, которого не могла бы сокрушить эта бита."
	eng_name = "baseball bat"
	eng_desc = "There ain't a skull in the league that can withstand a swatter."
	icon = 'icons/obj/items.dmi'
	icon_state = "baseball_bat"
	item_state = "baseball_bat"
	force = 10
	throwforce = 12
	attack_verb = list("beat", "smacked")
	w_class = WEIGHT_CLASS_HUGE
	var/homerun_ready = 0
	var/homerun_able = 0

/obj/item/weapon/melee/baseball_bat/barbedbat
	name = "биток с колючкой"
	desc = "This is a long, smooth wooden bat, typically made of ash, for use in the sport of baseball. Under MLB regulations, a baseball bat cannot exceed 2.61 inches in diameter at the widest point, can be no longer than 42 inches, and must be a single solid piece. Bats found in the Commonwealth have a base weight of three pounds, approaching the weight of bats used in the early 20th century by players like Babe Ruth."
	icon = 'icons/fallout/objects/melee.dmi'
	icon_state = "barbedbat"
	force = 16
	throwforce = 16

/obj/item/weapon/melee/baseball_bat/spikedbat
	name = "биток с шипами"
	desc = "This is a long, smooth wooden bat, typically made of ash, for use in the sport of baseball. Under MLB regulations, a baseball bat cannot exceed 2.61 inches in diameter at the widest point, can be no longer than 42 inches, and must be a single solid piece. Bats found in the Commonwealth have a base weight of three pounds, approaching the weight of bats used in the early 20th century by players like Babe Ruth."
	icon = 'icons/fallout/objects/melee.dmi'
	icon_state = "spikedbat"
	force = 18
	throwforce = 16

/obj/item/weapon/melee/baseball_bat/bladedbat
	name = "биток с лезвием"
	desc = "This is a long, smooth wooden bat, typically made of ash, for use in the sport of baseball. Under MLB regulations, a baseball bat cannot exceed 2.61 inches in diameter at the widest point, can be no longer than 42 inches, and must be a single solid piece. Bats found in the Commonwealth have a base weight of three pounds, approaching the weight of bats used in the early 20th century by players like Babe Ruth."
	icon = 'icons/fallout/objects/melee.dmi'
	icon_state = "bladedbat"
	force = 25
	throwforce = 20

/obj/item/weapon/melee/baseball_bat/homerun
	name = "особый биток"
	desc = "This thing looks dangerous... Dangerously good at baseball, that is."
	homerun_able = 1

/obj/item/weapon/melee/baseball_bat/attack_self(mob/user)
	if(!homerun_able)
		..()
		return
	if(homerun_ready)
		to_chat(user, "<span class='notice'>You're already ready to do a home run!</span>")
		..()
		return
	to_chat(user, "<span class='warning'>You begin gathering strength...</span>")
	playsound(get_turf(src), 'sound/magic/lightning_chargeup.ogg', 65, 1)
	if(do_after(user, 90, target = src))
		to_chat(user, "<span class='userdanger'>You gather power! Time for a home run!</span>")
		homerun_ready = 1
	..()

/obj/item/weapon/melee/baseball_bat/attack(mob/living/target, mob/living/user)
	. = ..()
	var/atom/throw_target = get_edge_target_turf(target, user.dir)
	if(homerun_ready)
		user.visible_message("<span class='userdanger'>It's a home run!</span>")
		target.throw_at(throw_target, rand(8,10), 14, user)
		target.ex_act(2)
		playsound(get_turf(src), 'sound/weapons/HOMERUN.ogg', 100, 1)
		homerun_ready = 0
		return
	else if(!target.anchored)
		target.throw_at(throw_target, rand(1,2), 7, user)

/obj/item/weapon/melee/baseball_bat/ablative
	name = "металлический биток"
	desc = "This bat is made of highly reflective, highly armored material."
	icon_state = "baseball_bat_metal"
	item_state = "baseball_bat_metal"
	force = 12
	throwforce = 15

/obj/item/weapon/melee/baseball_bat/ablative/IsReflect()//some day this will reflect thrown items instead of lasers
	var/picksound = rand(1,2)
	var/turf = get_turf(src)
	if(picksound == 1)
		playsound(turf, 'sound/weapons/effects/batreflect1.ogg', 50, 1)
	if(picksound == 2)
		playsound(turf, 'sound/weapons/effects/batreflect2.ogg', 50, 1)
	return 1

/obj/item/weapon/melee/baseball_bat/roped
	name = "биток с веревкой"
	slot_flags = SLOT_BACK
	icon_state = "baseball_bat_roped"

/obj/item/weapon/melee/baseball_bat/ablative/roped
	name = "металлический биток с веревкой"
	icon_state = "baseball_bat_metal_roped"
	slot_flags = SLOT_BACK

/obj/item/weapon/melee/baseball_bat/barbedbat/roped
	name = "биток с колючкой и веревкой"
	icon_state = "barbedbat_rope"
	slot_flags = SLOT_BACK

/obj/item/weapon/melee/baseball_bat/bladedbat/roped
	name = "биток с лезвием и веревкой"
	icon_state = "bladedbat_rope"
	slot_flags = SLOT_BACK

/obj/item/weapon/melee/baseball_bat/spikedbat/roped
	name = "биток с шипами и веревкой"
	icon_state = "spikedbat_rope"
	slot_flags = SLOT_BACK

/obj/item/weapon/melee/baseball_bat/homerun/roped
	name = "особый биток с веревкой"
	icon_state = "baseball_bat_roped"
	slot_flags = SLOT_BACK

/obj/item/weapon/melee/flyswatter
	name = "мухобойка"
	desc = "Useful for killing insects of all sizes."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "flyswatter"
	item_state = "flyswatter"
	force = 1
	throwforce = 1
	attack_verb = list("swatted", "smacked")
	hitsound = 'sound/effects/snap.ogg'
	w_class = WEIGHT_CLASS_SMALL
	//Things in this list will be instantly splatted.  Flyman weakness is handled in the flyman species weakness proc.
	var/list/strong_against

/obj/item/weapon/melee/flyswatter/New()
	..()
	strong_against = typecacheof(list(
					/mob/living/simple_animal/hostile/poison/bees/,
					/mob/living/simple_animal/butterfly,
					/mob/living/simple_animal/cockroach,
					/obj/item/queen_bee
	))


/obj/item/weapon/melee/flyswatter/afterattack(atom/target, mob/user, proximity_flag)
	if(proximity_flag)
		if(is_type_in_typecache(target, strong_against))
			new /obj/effect/decal/cleanable/deadcockroach(get_turf(target))
			to_chat(user, "<span class='warning'>You easily splat the [target].</span>")
			if(istype(target, /mob/living/))
				var/mob/living/bug = target
				bug.death(1)
			else
				qdel(target)

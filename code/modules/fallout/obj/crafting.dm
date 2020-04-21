//Fallout 13 crafting items directory
//All of the items listed are useful only for crafting things.

/obj/item/weaponcrafting/reciever
	name = "спусковой механизм"
	desc = "Прототип модульного спускового механизма для всякого оружия."
	eng_name = "modular receiver"
	eng_desc = "Prototype of modular receiver for weapon."
	icon = 'icons/fallout/objects/crafting.dmi'
	icon_state = "reciever"

/obj/item/weaponcrafting/stock
	name = "ружейная ложа"
	desc = "Ложа для всякий ружий, автоматов и.т.п"
	eng_name = "rifle stock"
	eng_desc = "A classic rifle stock that doubles as a grip, roughly carved out of wood."
	icon = 'icons/fallout/objects/crafting.dmi'
	icon_state = "riflestock"

/obj/item/weaponcrafting/handle/rifle
	name = "винтовочная рукоятка"
	desc = "Просто рукоятка."
	eng_name = "rifle handle"
	eng_desc = "Just a handle."
	icon = 'icons/fallout/objects/crafting.dmi'
	icon_state = "handle_a_1"

/obj/item/weaponcrafting/handle/rifle/initialize()
	..()
	icon_state = "handle_a_[rand(1,2)]"

/obj/item/weaponcrafting/handle/pistol
	name = "пистолетная рукоятка"
	eng_name = "pistol handle"
	icon_state = "handle_p_1"

/obj/item/weaponcrafting/handle/pistol/initialize()
	..()
	icon_state = "handle_p_[rand(1,3)]"

//The following items are in "crafting" type just to keep code clean.
/obj/item/crafting
	name = "бляздец"
	desc = "сука, тут кто-то щитспавнит, напишите @woona#2803"
	eng_name = "Shitspawn"
	eng_desc = "Why it's here?!<br>Badmins spawn shit!<br>Tell someone about it."
	icon = 'icons/fallout/objects/crafting.dmi'
	item_state = "null"
	w_class = WEIGHT_CLASS_TINY

/obj/item/crafting/diode
	name = "диод"
	desc = "Можно использовать для сборки каких-нибудь электронных приборов."
	eng_name = "diode"
	eng_desc = "It looks like something I saw in that useless broken television set once.<br>That thing is probably used in some electronic devices."
	icon_state = "diode_1"
/obj/item/crafting/diode/initialize()
	..()
	icon_state = "diode_[rand(1,3)]"

/obj/item/crafting/transistor
	name = "транзистор"
	desc = "Попов очень любил его. Но Тесла больше.<br>Наиболее полезный компонент."
	eng_name = "transistor"
	eng_desc = "Popov would love it, but Tesla got to see it.<br>The most useful electrical component."
	icon_state = "transistor_1"
/obj/item/crafting/transistor/initialize()
	..()
	icon_state = "transistor_[rand(1,3)]"

/obj/item/crafting/capacitor
	name = "конденсатор"
	desc = "Можно использовать для сборки каких-нибудь электронных приборов."
	eng_name = "capacitor"
	eng_desc = "It looks like something I saw inside of the radio once.<br>It seems like it's the most basic electrical component."
	icon_state = "capacitor_1"
/obj/item/crafting/capacitor/initialize()
	..()
	icon_state = "capacitor_[rand(1,3)]"

/obj/item/crafting/fuse
	name = "зажигатель"
	desc = "Маленькая стеклянная трубка с проводами. Даже и не знаю что это..."
	eng_name = "fuse"
	eng_desc = "A tiny glass tube with some wiring stuck inside of it.<br>I have no idea what it is."
	icon_state = "fuse_1"
/obj/item/crafting/fuse/initialize()
	..()
	icon_state = "fuse_[rand(1,3)]"

/obj/item/crafting/resistor
	name = "резистор"
	desc = "Тесла Воин говорит, \"Сдавайся, криминальнй электрон!\"<br>Электрон говорит, \"Ты никогда не поймаешь меня!\"<br>*вжжж!* *з-з-з!* *пиу!* *пиу!* *пиу!*"
	eng_name = "resistor"
	eng_desc = "Tesla Warrior says, \"Stop right there, criminal electron!\"<br>Electron says, \"You'll never catch me!!!\"<br>*Zoom* *Zoom* *Pew* *Pew* *Pew*"
	icon_state = "resistor_1"
/obj/item/crafting/resistor/initialize()
	..()
	icon_state = "resistor_[rand(1,3)]"

/obj/item/crafting/switch
	name = "переключатель"
	desc = "обычный переключатель, используется во всяких бытовых вещах, фонариках, выключателях, бомбах."
	eng_name = "switch"
	eng_desc = "A common switch, used to light up the flashlight or activate a bomb timer." //Why i code it?
	icon_state = "switch_1"
/obj/item/crafting/switch/initialize()
	..()
	icon_state = "switch_[rand(1,3)]"

/obj/item/crafting/bulb
	name = "лампочка"
	desc = "Просто лампочка, недостаточно большая чтобы использовать где-либо кроме создания чего-либо."
	eng_name = "bulb"
	eng_desc = "And at last I see the light,<br>And it's like the fog has lifted,<br>And at last I see the light,<br>And it's like the sky is new,<br>And it's warm and real and bright,<br>And the world has somehow shifted,<br>All at once everything looks different."
	icon_state = "bulb_1"
/obj/item/crafting/bulb/initialize()
	..()
	icon_state = "bulb_[rand(1,3)]"

/obj/item/crafting/board
	name = "пустая плата"
	desc = "Пластиковая плата, используется для того чтобы держать все электронные части вместе."
	eng_name = "empty circuit board"
	eng_desc = "A plastic board used to hold all other electrical components together."
	icon_state = "board_1"
/obj/item/crafting/board/initialize()
	..()
	icon_state = "board_[rand(1,3)]"

/obj/item/crafting/buzzer
	name = "жужжалка"
	desc = "Я почти слышу это жужжание. Ну, почти."
	eng_name = "buzzer"
	eng_desc = "I can almost hear it buzzing. Except it's not."
	icon_state = "buzzer"

/obj/item/crafting/frame
	name = "собранная плата"
	desc = "Напечатанная и собранная плата для сложных электрических приборов."
	eng_name = "circuit board assembly"
	eng_desc = "A printed circuit board - a complex electrical component."
	icon_state = "frame"

/obj/item/crafting/small_gear
	name = "маленькая шестерня"
	desc = "Маленькая часть большого механизма."
	eng_name = "small gear"
	eng_desc = "A litle part of a big mechanism."
	icon_state = "gear_small"

/obj/item/crafting/large_gear
	name = "большая шестерня"
	desc = "Большая часть грандиозного механизма."
	eng_name = "large gear"
	eng_desc = "A big part of a grand mechanism."
	icon_state = "gear_large"

/obj/item/crafting/duct_tape
	name = "изолента"
	desc = "Всё починит, синяя, серая, красная и черная - изолента!"
	eng_name = "duct tape"
	eng_desc = "A pinnacle of engineering - it fixes everything!"
	icon_state = "duct_tape"

/obj/item/crafting/kettle
	name = "чайничек"
	desc = "Ну, ай оно уже не так хорошо хранит, мешают дырки в дне."
	eng_name = "kettle"
	eng_desc = "Well, this can't hold tea anymore, holes in bottom prevents it."
	icon_state = "kettle"

/obj/item/crafting/toaster
	name = "тостер"
	desc = "Как починить тостер:<br>1. Будьте девушкой. <br>2. Найдите девушку.<br>3. Переспите."
	eng_name = "toaster"
	eng_desc = "The toaster is a pre-War kitchen appliance that was used to toast bread. It has a stainless steel casing with black painted levers and base, that has internal heating coils to toast the bread inside the two slots on the top."
	icon_state = "toaster"

/obj/item/crafting/vacuum_cleaner
	name = "вакуумный пылесос"
	desc = "Кусочек космоса на земле!"
	eng_name = "vacuum cleaner"
	eng_desc = "local space on earth!"
	icon_state = "vacuum_cleaner"

/obj/item/crafting/sensor_module
	name = "сенсорный модуль"
	desc = "Позволяет отслеживать движение. Ну, вернее, когда-то позволял."
	eng_name = "sensor module"
	eng_desc = "This thing isn't works."
	icon_state = "sensor_module"

/obj/item/crafting/cofee_pot
	name = "кофейник"
	desc = "Кофейник, разработан специанльно для того чтобы удобно хранить кофе литрами! Жаль дно дырявое..."
	eng_name = "Coffee pot"
	eng_desc = "The coffee pot is a large pot that gently slopes inwards. As indicated by the untarnished pot, it was originally chrome colored."
	icon_state = "cofee_pot"

/obj/item/crafting/cookpot
	name = "кастрюля"
	desc = "Ржавая кастрюля."
	eng_name = "Cookpot"
	eng_desc = "Rusty cookpot."
	icon_state = "cookpot"

/obj/item/crafting/Baseball_ball
	name = "бейсбольный мяч"
	desc = "кожанный бейсбольный мяч."
	eng_name = "baseball ball"
	eng_desc = "Leather baseball ball."
	icon_state = "Baseball_ball"

/obj/item/crafting/wonderglue
	name = "чудо-клей"
	desc = "Довоенный бренд клея, который вполне соответствует названию."
	eng_name = "wonder glue"
	eng_desc = "A pre-War brand of glue that has retained its adhesive qualities.<br>A glue itself is a liquid acrylic adhesive, meant to fix broken plastics and ceramics or used in the assembly of a great assortment of items."
	icon_state = "wonderglue1"

/obj/item/crafting/wonderglue/initialize()
	..()
	icon_state = "wonderglue[rand(1,2)]"

/obj/item/crafting/turpentine
	name = "турпентин? Саня, переведи это, что это нахуй?"
	desc = "тут тоже переведи."
	eng_name = "turpentine"
	eng_desc = "A flammable liquid distilled from pine resin, used as a solvent."
	icon_state = "turpentine"

/obj/item/crafting/abraxo
	name = "чистящее средство абраско"
	desc = "Довоенное чистящее средство производства Абраксодин Чемикалс."
	eng_name = "abraxo"
	eng_desc = "A pre-War cleaning agent produced by Abraxodyne Chemical."
	icon_state = "abraxo"

/obj/item/crafting/reloader
	name = "перезарядчик гильз"
	desc = "Этот нехитрый девайс, позволяет одной рукой переснаряжать гильзы. При наличии материала конечно же."
	eng_name = "cartrige reloader"
	eng_desc = "This device allows to hand-load your own gun rounds using certain raw materials."
	icon_state = "reloader"
	var/pow_loaded = 0
	var/cartridges = 30

//crc
/obj/item/crafting/reloader/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/crafting/reloader_set))
		if(pow_loaded < 30)
			visible_message("<span class='notice'>[user] put the materials in reloader</span>")
			pow_loaded = 30
			I.Del()

	if(istype(I, /obj/item/ammo_casing))
		if(pow_loaded <= 0)
			to_chat(user, "<span class='notice'>There are no materials left for reload ammo casing.</span>")
		else
			if(do_after(user, 5, target = src))
				I.New()
				I.forceMove(src)
				to_chat(user, "<span class='notice'>You take a round from reloader</span>")

				pow_loaded -= 1

/obj/item/crafting/reloader/examine()
	..()
	if(pow_loaded > 0)
		usr.show_message("There are [pow_loaded] materials left.",1)
	else
		usr.show_message("<span class='notice'>There are no materials left.",1)

///
/obj/item/crafting/igniter
	name = "зажигатель"
	desc = "маленький девайс, способный поджигать субстанции."
	eng_name = "igniter"
	eng_desc = "A small electronic device able to ignite combustable substances."
	icon_state = "igniter"

/obj/item/crafting/timer
	name = "таймер"
	desc = "Используется для того чтобы отмерять промежутки времени. Тик-так Мориарти."
	eng_name = "timer"
	eng_desc = "Used to time things. Works well with contraptions which has to count down. Tick tock."
	icon_state = "timer"

/obj/item/crafting/sensor
	name = "сенсор движения"
	desc = "Используется для обнаржуения кого-либо."
	eng_name = "proximity sensor"
	eng_desc = "Used for scanning and alerting when someone enters a certain proximity."
	icon_state = "sensor"


/obj/item/crafting/lunchbox
	name = "ланчбокс"
	desc = "Ланчбокс с рекламой Волт-Тек. Если знать как, из этого можно собрать мину."
	eng_name = "lunch box"
	eng_desc = "This was a promotional item created by Vault-Tec before the Great War and used in the company's advertisements. With the right schematics, it can be used to make bottlecap mines."
	icon_state = "lunchbox"

//crc

/obj/item/crafting/reloader_set
	name = "картридж"
	desc = "Материалы для переснарядки гильз."
	eng_name = "reloader cartridges"
	eng_desc = "Set of materials for reloader."
	icon_state = "reloader_set"
	var/cartridges = 30


/obj/item/crafting/reloader/examine()
	..()
	if(cartridges > 0)
		usr.show_message("<span class='notice'>There are [cartridges] cartridges left.</span>")
	else
		usr.show_message("<span class='notice'>There are no cartridges left.</span>")

/obj/item/crafting/weapon_repair_kit
	name = "набор для починки оружия"
	desc = "С его помощью можно чинить оружие."
	eng_name = "Weapon repair kit"
	eng_desc = "With this you can repair your gun."
	icon_state = "weapon_repair_set"
	price = 500


//Делаем жизнь оружейников сложнее//

/obj/item/crafting/weapon_parts
	icon = 'icons/fallout/objects/crafting.dmi'
	icon_state = "ballistic_weapon_parts_1"

/obj/item/crafting/weapon_parts/ballistic
	name = "части огнестрельного оружия"
	desc = "Вам нужна эта штука, чтобы делать оружие."
	eng_name = "Ballistic Weapon Parts"
	eng_desc = "You really need this thing, if you wanna craft ballistic weapon."
	icon = 'icons/fallout/objects/crafting.dmi'
	icon_state = "ballistic_weapon_parts_1"
/*
/obj/item/crafting/weapon_parts/ballistic/initialize()
	..()
	icon_state = "ballistic_weapon_parts_[rand(1,3)]"
*/
/obj/item/crafting/weapon_parts/energy
	name = "части лазерного оружия"
	desc = "Вам нужна эта штука, чтобы делать энергооружие."
	eng_name = "Energy Weapon Parts"
	eng_desc = "You really need this thing, if you wanna craft energy weapon."
	icon = 'icons/fallout/objects/crafting.dmi'
	icon_state = "e_weapon_parts_1"
/*
/obj/item/crafting/weapon_parts/energy/initialize()
	..()
	icon_state = "weapon_parts/energy_[rand(1,3)]"
*/
/obj/item/crafting/weapon_parts/plasma
	name = "части плазменного оружия"
	desc = "Вам нужна эта штука, чтобы делать плазменное оружие."
	eng_name = "Plasma Weapon Parts"
	eng_desc = "You really need this thing, if you wanna craft plasma weapon."
	icon = 'icons/fallout/objects/crafting.dmi'
	icon_state = "p_weapon_parts_1"
/*
/obj/item/crafting/weapon_parts/plasma/initialize()
	..()
	icon_state = "weapon_parts/plasma_[rand(1,3)]"
*/

/obj/item/crafting/instruments
	name = "инструменты для работы по металлу"
	desc = "Инструменты для резки по металлу."
	eng_name = "instruments for metalwork"
	eng_desc = "You can use this for metalworking."
	icon = 'icons/fallout/objects/crafting.dmi'
	icon_state = "instruments"

/obj/item/crafting/barrel_l
	name = "длинный barrel"
	desc = "Просто ствол."
	eng_name = "long barrel"
	eng_desc = "Just a barrel."
	icon = 'icons/fallout/objects/crafting.dmi'
	icon_state = "barrel_long"

/obj/item/crafting/barrel_s
	name = "короткий ствол"
	desc = "Просто ствол."
	eng_name = "short barrel"
	eng_desc = "Just a barrel."
	icon = 'icons/fallout/objects/crafting.dmi'
	icon_state = "barrel_short"
//Fallout 13 crafting items directory
//All of the items listed are useful only for crafting things.

/obj/item/weaponcrafting/reciever
	name = "спусковой механизм"
	desc = "Прототип модульного спускового механизма для всякого оружия."
	icon = 'icons/fallout/objects/crafting.dmi'
	icon_state = "reciever"
	price = 850

/obj/item/weaponcrafting/stock
	name = "ружейная ложа"
	desc = "Ложа для всякий ружий, автоматов и.т.п"
	icon = 'icons/fallout/objects/crafting.dmi'
	icon_state = "riflestock"
	price = 250

/obj/item/weaponcrafting/handle/rifle
	name = "винтовочная рукоятка"
	desc = "Просто рукоятка."
	icon = 'icons/fallout/objects/crafting.dmi'
	icon_state = "handle_a_1"
	price = 350

/obj/item/weaponcrafting/handle/rifle/Initialize()
	..()
	icon_state = "handle_a_[rand(1,2)]"

/obj/item/weaponcrafting/handle/pistol
	name = "пистолетная рукоятка"
	icon_state = "handle_p_1"
	price = 250

/obj/item/weaponcrafting/handle/pistol/Initialize()
	..()
	icon_state = "handle_p_[rand(1,3)]"

//The following items are in "crafting" type just to keep code clean.
/obj/item/crafting
	name = "бляздец"
	desc = "сука, тут кто-то щитспавнит, напишите @woona#2803"
	icon = 'icons/fallout/objects/crafting.dmi'
	item_state = "null"
	w_class = WEIGHT_CLASS_TINY

/obj/item/crafting/diode
	name = "диод"
	desc = "Можно использовать для сборки каких-нибудь электронных приборов."
	icon_state = "diode_1"
	price = 100

/obj/item/crafting/diode/Initialize()
	..()
	icon_state = "diode_[rand(1,3)]"

/obj/item/crafting/transistor
	name = "транзистор"
	desc = "Попов очень любил его. Но Тесла больше.<br>Наиболее полезный компонент."
	icon_state = "transistor_1"
	price = 150

/obj/item/crafting/transistor/Initialize()
	..()
	icon_state = "transistor_[rand(1,3)]"

/obj/item/crafting/capacitor
	name = "конденсатор"
	desc = "Можно использовать для сборки каких-нибудь электронных приборов."
	icon_state = "capacitor_1"
	price = 200

/obj/item/crafting/capacitor/Initialize()
	..()
	icon_state = "capacitor_[rand(1,3)]"

/obj/item/crafting/fuse
	name = "зажигатель"
	desc = "Маленькая стеклянная трубка с проводами. Даже и не знаю что это..."
	icon_state = "fuse_1"
	price = 100

/obj/item/crafting/fuse/Initialize()
	..()
	icon_state = "fuse_[rand(1,3)]"

/obj/item/crafting/resistor
	name = "резистор"
	desc = "Тесла Воин говорит, \"Сдавайся, криминальнй электрон!\"<br>Электрон говорит, \"Ты никогда не поймаешь меня!\"<br>*вжжж!* *з-з-з!* *пиу!* *пиу!* *пиу!*"
	icon_state = "resistor_1"
	price = 250

/obj/item/crafting/resistor/Initialize()
	..()
	icon_state = "resistor_[rand(1,3)]"

/obj/item/crafting/switch
	name = "переключатель"
	desc = "обычный переключатель, используется во всяких бытовых вещах, фонариках, выключателях, бомбах."
	icon_state = "switch_1"
	price = 200

/obj/item/crafting/switch/Initialize()
	..()
	icon_state = "switch_[rand(1,3)]"

/obj/item/crafting/bulb
	name = "лампочка"
	desc = "Просто лампочка, недостаточно большая чтобы использовать где-либо кроме создания чего-либо."
	icon_state = "bulb_1"
	price = 100

/obj/item/crafting/bulb/Initialize()
	..()
	icon_state = "bulb_[rand(1,3)]"

/obj/item/crafting/board
	name = "пустая плата"
	desc = "Пластиковая плата, используется для того чтобы держать все электронные части вместе."
	icon_state = "board_1"
	price = 350

/obj/item/crafting/board/Initialize()
	..()
	icon_state = "board_[rand(1,3)]"

/obj/item/crafting/buzzer
	name = "жужжалка"
	desc = "Я почти слышу это жужжание. Ну, почти."
	icon_state = "buzzer"
	price = 200

/obj/item/crafting/frame
	name = "собранная плата"
	desc = "Напечатанная и собранная плата для сложных электрических приборов."
	icon_state = "frame"
	price = 450

/obj/item/crafting/small_gear
	name = "маленькая шестерня"
	desc = "Маленькая часть большого механизма."
	icon_state = "gear_small"
	price = 150

/obj/item/crafting/large_gear
	name = "большая шестерня"
	desc = "Большая часть грандиозного механизма."
	icon_state = "gear_large"
	price = 200

/obj/item/crafting/duct_tape
	name = "изолента"
	desc = "Всё починит, синяя, серая, красная и черная - изолента!"
	icon_state = "duct_tape"
	price = 100

/obj/item/crafting/kettle
	name = "чайничек"
	desc = "Ну, ай оно уже не так хорошо хранит, мешают дырки в дне."
	icon_state = "kettle"
	price = 95

/obj/item/crafting/toaster
	name = "тостер"
	desc = "Как починить тостер:<br>1. Будьте девушкой. <br>2. Найдите девушку.<br>3. Переспите."
	icon_state = "toaster"
	price = 90

/obj/item/crafting/vacuum_cleaner
	name = "вакуумный пылесос"
	desc = "Кусочек космоса на земле!"
	icon_state = "vacuum_cleaner"
	price = 120

/obj/item/crafting/sensor_module
	name = "сенсорный модуль"
	desc = "Позволяет отслеживать движение. Ну, вернее, когда-то позволял."
	icon_state = "sensor_module"
	price = 300

/obj/item/crafting/cofee_pot
	name = "кофейник"
	desc = "Кофейник, разработан специанльно для того чтобы удобно хранить кофе литрами! Жаль дно дырявое..."
	icon_state = "cofee_pot"

/obj/item/crafting/cookpot
	name = "кастрюля"
	desc = "Ржавая кастрюля."
	icon_state = "cookpot"

/obj/item/crafting/Baseball_ball
	name = "бейсбольный мяч"
	desc = "кожанный бейсбольный мяч."
	icon_state = "Baseball_ball"

/obj/item/crafting/wonderglue
	name = "чудо-клей"
	desc = "Довоенный бренд клея, который вполне соответствует названию."
	icon_state = "wonderglue1"
	price = 500

/obj/item/crafting/wonderglue/Initialize()
	..()
	icon_state = "wonderglue[rand(1,2)]"

/obj/item/crafting/turpentine
	name = "скипидар" //Используется для обработки древесины и я сам неебу что это
	desc = "Горючяя жидкость, перегнанная из сосновой смолы. Используется как растворитель."
	icon_state = "turpentine"
	price = 400

/obj/item/crafting/abraxo
	name = "чистящее средство абраско"
	desc = "Довоенное чистящее средство производства Абраксодин Чемикалс."
	icon_state = "abraxo"
	price = 290

/obj/item/crafting/reloader
	name = "перезарядчик гильз"
	desc = "Этот нехитрый девайс, позволяет одной рукой переснаряжать гильзы. При наличии материала конечно же."
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
	icon_state = "igniter"
	price = 200

/obj/item/crafting/timer
	name = "таймер"
	desc = "Используется для того чтобы отмерять промежутки времени. Тик-так Мориарти."
	icon_state = "timer"
	price = 210

/obj/item/crafting/sensor
	name = "сенсор движения"
	desc = "Используется для обнаржуения кого-либо."
	icon_state = "sensor"
	price = 350


/obj/item/crafting/lunchbox
	name = "ланчбокс"
	desc = "Ланчбокс с рекламой Волт-Тек. Если знать как, из этого можно собрать мину."
	icon_state = "lunchbox"
	price = 750

//crc

/obj/item/crafting/reloader_set
	name = "картридж"
	desc = "Материалы для переснарядки гильз."
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
	icon_state = "weapon_repair_set"
	price = 500


//Делаем жизнь оружейников сложнее//

/obj/item/crafting/weapon_parts
	icon = 'icons/fallout/objects/crafting.dmi'
	icon_state = "ballistic_weapon_parts_1"

/obj/item/crafting/weapon_parts/ballistic
	name = "части огнестрельного оружия"
	desc = "Вам нужна эта штука, чтобы делать оружие."
	icon = 'icons/fallout/objects/crafting.dmi'
	icon_state = "ballistic_weapon_parts_1"
	price = 1000
/*
/obj/item/crafting/weapon_parts/ballistic/initialize()
	..()
	icon_state = "ballistic_weapon_parts_[rand(1,3)]"
*/
/obj/item/crafting/weapon_parts/energy
	name = "части лазерного оружия"
	desc = "Вам нужна эта штука, чтобы делать энергооружие."
	icon = 'icons/fallout/objects/crafting.dmi'
	icon_state = "e_weapon_parts_1"
	price = 2000
/*
/obj/item/crafting/weapon_parts/energy/initialize()
	..()
	icon_state = "weapon_parts/energy_[rand(1,3)]"
*/
/obj/item/crafting/weapon_parts/plasma
	name = "части плазменного оружия"
	desc = "Вам нужна эта штука, чтобы делать плазменное оружие."
	icon = 'icons/fallout/objects/crafting.dmi'
	icon_state = "p_weapon_parts_1"
	price = 2600
/*
/obj/item/crafting/weapon_parts/plasma/initialize()
	..()
	icon_state = "weapon_parts/plasma_[rand(1,3)]"
*/

/obj/item/crafting/instruments
	name = "инструменты для работы по металлу"
	desc = "Инструменты для резки по металлу."
	icon = 'icons/fallout/objects/crafting.dmi'
	icon_state = "instruments"

/obj/item/crafting/barrel_l
	name = "длинный barrel"
	desc = "Просто ствол."
	icon = 'icons/fallout/objects/crafting.dmi'
	icon_state = "barrel_long"
	price = 200

/obj/item/crafting/barrel_s
	name = "короткий ствол"
	desc = "Просто ствол."
	icon = 'icons/fallout/objects/crafting.dmi'
	icon_state = "barrel_short"
	price = 190
//Fallout 13 contributor packs directory

/datum/content_pack
	var
		name = "Чего блять?"
		eng_name = "what?"
		id = "shit"
		desc = "Что-то пошло не так..."
		eng_desc = "Something is wrong! Maybe you already have this content pack?"
		list/items = list()
		list/sorted_items = list()
		list/roles = list()
		list/pets = list()
		price = 99999
	proc
		on_set(client/client)
			return 1
		generate_sorted_list() //
			sorted_items["weapon"] = list()
			sorted_items["misc"] = list()
			sorted_items["head"] = list()
			sorted_items["armor"] = list()
			sorted_items["gloves"] = list()
			sorted_items["shoes"] = list()
			sorted_items["uniform"] = list()
		sort_items()
			for(var/item in items)
				if(get_var_from_type(item, "w_class") < WEIGHT_CLASS_NORMAL)
					sorted_items["misc"] |= item
				sorted_items[slot_name_by_type(item)] |= item
	New()
		. = ..()
		if(!items.len)
			return .
		generate_sorted_list()
		sort_items()


/datum/content_pack/starter
	name = "Фоллаут 13: Стартовый набор"
	eng_name = "Fallout 13: Starter Pack"
	id = "starter"
	desc = "<b>Доступен для: Всех фракций!</b><br>Любой может иметь эти ВАЖНЫЕ вещи, абсолютно бесплатно!<br><i>Важно: Чтобы взять оружие из этого набора, посмотрите слот карманов. Так-же, некоторые виды одежды могут быть недоступны, ввиду дресс-кода фракций. Роль обывателя(settler) имеет доступ ко всему что тут перечисленно.</i>"
	eng_desc = "<b> Available for: All factions! </b><br>Anyone can acquire this VITAL items, for free!<br><i>Important thing: Check you pocket slot if you want to take any weapons. Also some item types might be unavailable dut to faction's uniform restrictions. Settler role has it all!.</i>"
	items = list(
		/obj/item/clothing/shoes/f13/rag,
		// Hats
		/obj/item/clothing/head/f13/pot,
		// Goggles
		/obj/item/clothing/glasses/regular,
		// Uniforms
		/obj/item/clothing/under/pants/f13/ghoul,
		/obj/item/clothing/under/pants/f13/cloth,
		/obj/item/clothing/under/f13/rag,
		/obj/item/clothing/under/f13/tribal,
		/obj/item/clothing/under/f13/female/tribal,
		/obj/item/clothing/under/f13/settler,
		/obj/item/clothing/under/f13/brahmin,
		/obj/item/clothing/under/f13/female/brahmin,
		/obj/item/clothing/under/f13/worn,
		// Suits
		/obj/item/clothing/suit/f13/mantle_liz,
		// Items
		/obj/item/weapon/reagent_containers/food/drinks/flask/survival,
		// Weapons
		/obj/item/weapon/pipe
		)
	price = -1

	on_set(client/client)
		client.add_race("human", /datum/species/human)

/datum/content_pack/cigarettes
	name = "Сигареты"
	eng_name = "Cigarettes"
	id = "cigarettes"
	desc = "<b>Доступно для: Всех фракций!</b><br><i>Важно: Всемирная Организация Здравоохранения предупреждает - курение вредит здоровью. Вдыхание табачного дыма плохо сказывается на вашем здоровье!</i>"
	eng_desc = "<b>Available for: All factions!</b><br><i>Warning: WHO warns you that smoking kills. Inhaling tobacco smoke is bad for your health!</i>"
	items = list(
		/obj/item/weapon/storage/fancy/rollingpapers,
		/obj/item/weapon/storage/fancy/cigarettes/cigpack_myron,
		/obj/item/weapon/storage/fancy/cigarettes/cigpack_joy,
		/obj/item/clothing/mask/cigarette,
		/obj/item/clothing/mask/cigarette/rollie,
		/obj/item/clothing/mask/cigarette/cigar,
		/obj/item/clothing/mask/cigarette/cigar/cohiba,
		/obj/item/clothing/mask/cigarette/cigar/havana,
		/obj/item/weapon/lighter
		)
	price = 1000

/datum/content_pack/team_fortress
	name = "Набор шапок"
	eng_name = "Hat collection"
	id = "team_fortress"
	desc = "<b>Доступно для: Нейтралов, Горожан и рейдеров!</b><br>Получите уникальнейший опыт игры в Фоллаут 13 с нашим новым набором шапок.<br>В этот набор входит целых пять (вау) дополнительных шапок!"
	eng_desc = "<b> Available for: Neutrals, civillians and raiders!</b><br>Receive the unique Fallout 13 experience with this new set of five additional hats!"
	items = list(
		/obj/item/clothing/head/soft/f13/baseball,
		/obj/item/clothing/head/soft/f13/utility,
		/obj/item/clothing/head/f13/cowboy,
		/obj/item/clothing/head/f13/bandit,
		/obj/item/clothing/head/f13/stormchaser,
		/obj/item/clothing/head/f13/gambler
		)
	price = 4000

/datum/content_pack/wardrobe
	name = "Высшая Мода"
	eng_name = "Wardrobe"
	id = "wardrobe"
	desc = "<b>Доступно для: Нейтралов и Горожан!</b><br>Устали от того что ваш персонаж выглядит как какой-то бомж?<br>Этот набор разработан специально для вас! Новая мода пустоши 2255 года!<br>Данный набор содержит две пары обуви и целых семь замечательных костюмов.<br><i>Важно: Вы можете застегивать dark red wasteland wanderer jacket.</i>"
	eng_desc = "<b> Available for: Neutrals and civillians!</br><br>Tired of looking like a homeless?<br>This set was developed especially for you! New fashion of the 2255's wasteland!<br> This set contains two new pairs of shoes and seven great outfits.<br>Remember: You can button up your dark red wasteland wanderer jacket.</i>"
	items = list(
		/obj/item/clothing/shoes/f13/explorer,
		// Uniforms
		/obj/item/clothing/under/f13/relaxedwear,
		/obj/item/clothing/under/f13/spring,
		/obj/item/clothing/under/f13/merchant,
		/obj/item/clothing/under/f13/trader,
		/obj/item/clothing/under/f13/caravaneer,
		/obj/item/clothing/under/f13/petrochico,
		/obj/item/clothing/under/f13/mechanic,
		/obj/item/clothing/under/f13/lumberjack,
		/obj/item/clothing/under/f13/machinist,
		// Suits
		/obj/item/clothing/suit/f13/puffer,
		/obj/item/clothing/suit/toggle/labcoat/f13/wanderer
		)
	price = 5000

/datum/content_pack/vault13
	name = "Убежище 13"
	eng_name = "Vault 13"
	id = "vault13"
	desc = "<b>Доступно для: Нейтралов, Горожан и рейдеров!</b><br>Убежище 13 открылось очеь давно, но вы все еще можете примерить на себя их комбинезоны, ну или просто притворяться выходцем из убежища и ловить пули.</i>"
	eng_desc = "<b>Available for: Neutrals, civillians and raiders!</b><br>Vault 13 opened a long time ago, but you still may try on their jumpsuits, or, y'know, simply pretend as Vault dweller and catch some lead.</i>"
	items = list(
		/obj/item/clothing/under/f13/vault/v13,
		/obj/item/weapon/reagent_containers/food/drinks/flask/vault13,
		/obj/item/weapon/lighter/vault13
		)
	price = 15000

/datum/content_pack/bard
	name = "Музыкальные инструменты"
	eng_name = "Musical instruments"
	id = "bard"
	desc = "<b>Доступны для: Всех фракций!</b><br>Russian General says, <br><i>\"Я не люблю рок-н-ролл. Он слишком громкий! Мне нравится Фолк, мягкая, и приятная музыка. Полька, вальс, да что угодно!\"</i><br><b>Six String Samurai (1998)</b>"
	eng_desc = "<b>Available for: All factions!</b><br>Russian General says, <br><i>\"I do not like rock-n-roll. It's too damn louds! I like fold, soft and pleasing music. Polka, waltz, anything!\" </i><br><b>Six String Samurai (1998)</b>"
	items = list(
		/obj/item/device/harmonica,
		/obj/item/device/instrument/guitar
		)
	price = 1000

/datum/content_pack/doom
	name = "Doom"
	eng_name = "Doom"
	id = "doom"
	desc = "<b>Available to: Neutral and Raider factions only!</b><br>Carefully selected items from Doom game.<br><i>Note: Union Aerospace Corporation welcomes you aboard a shuttle leaving Earth on the way to Mars. Please fasten your seatbelts and have a safe flight!</i>"
	items = list(
		/obj/item/clothing/head/helmet/f13/doom,
		/obj/item/clothing/suit/armor/f13/doom,
		/obj/item/clothing/under/pants/f13/doom,
		/obj/item/clothing/gloves/f13/doom,
		/obj/item/clothing/shoes/f13/doom,
		/obj/item/weapon/mounted_chainsaw
		)
	price = 85000

/datum/content_pack/followers
	name = "Набор Последователей"
	eng_name = "Followers set"
	id = "follower"
	desc = "<b>Доступно для: Всех фракций!</b> :Если все доктора на пустоши умрут, то кто вас будет лечить?"
	eng_desc = "<b>Available for: All factions!</b> :If all doctors of the Wasteland will die, then who'll heal you?"
	items = list(
		/obj/item/clothing/suit/toggle/labcoat/f13/followers,
		/obj/item/clothing/under/f13/doctor,
		/obj/item/clothing/shoes/laceup,
		/obj/item/clothing/gloves/color/latex,
		/obj/item/clothing/glasses/regular,
		///obj/item/clothing/mask/surgical/joy,
		/obj/item/clothing/mask/surgical,
		/obj/item/weapon/storage/backpack/satchel/leather,
		/obj/item/weapon/storage/firstaid
	)
	price = 4000

/datum/content_pack/trooper_armor
	name = "Набор брони НКР"
	eng_name = "NCR armor set"
	id = "trooper_armor"
	desc = "<b>Доступно для: НКР!</b><br>Сформируйте собственный отряд со своими друзьями, с этим набором вы даже не нарушите устав НКР!<br>Этот набор включает в себя шесть дополнительных покрасок для брони."
	eng_desc = "<Available for: NCR!</b><br> Form your own squad with your friends, with this set you won't even violate NCR's regulations!<br>This set contains six additional paints for armor."
	items = list(
		/obj/item/clothing/suit/armor/f13/ncr/patriot,
		/obj/item/clothing/suit/armor/f13/ncr/commie,
		/obj/item/clothing/suit/armor/f13/ncr/preacher,
		/obj/item/clothing/suit/armor/f13/ncr/lover,
		/obj/item/clothing/suit/armor/f13/ncr/stalker, //cheeki breeki
		/obj/item/clothing/suit/armor/f13/ncr/punisher
		)
	price = 4000


/datum/content_pack/heavy_trooper
	name = "NCR Heavy Infantry Corps"
	eng_name = "NCR Heavy Infantry Corps"
	id = "heavy_trooper"
	desc = "<b>Available to: NCR Trooper and NCR Sergeant roles only!</b><br>Become the NCR Heavy Trooper with a set of NCR salvaged power armor and a big gun!"
	items = list(
		/obj/item/clothing/head/helmet/power_armor/ncr,
		/obj/item/clothing/suit/armor/f13/power_armor/ncr,
		/obj/item/weapon/twohanded/largehammer,
		/obj/item/weapon/gun/ballistic/automatic/rifle,
		/obj/item/ammo_box/magazine/F13/m308
		)
	price = 8000


/datum/content_pack/khan
	name = "Великие Ханы"
	eng_name = "Great Khans"
	id = "khan"
	desc = "<b>Доступно для: Нейтралы и Рейдеры!</b><br>Величие Великих Ханов будет восстановлено с этим замечательным набором!<br>Или посмотрите на это копью, с помощью которого вы можете насмерть затыкать таракана.<br><i>Важно: Вы можете застегивать Great Khan jacket .</i>"
	eng_desc = "<b>Available for: Neutrals and Raiders!</b><br>Great Khans' glory will be rebult with this amazing set! <br> Or look at this spear you can use to stab radroach to death with. <br><i>Remember: You can button up Great Khan jacket.</i>"
	items = list(
		/obj/item/clothing/head/helmet/f13/khan,
		/obj/item/clothing/suit/toggle/labcoat/f13/khan,
		/obj/item/clothing/under/pants/f13/khan,
		/obj/item/clothing/shoes/f13/khan,
		/obj/item/weapon/twohanded/tribal_spear,
		/obj/item/weapon/restraints/legcuffs/bola/tribal
		)
	price = 3000

/datum/content_pack/punk
	name = "Панк"
	eng_name = "Punk"
	id = "punk"
	desc = "<b>Доступно для: Нейтралы и Рейдеры!</b><br>Если вам кажется что в игре недостаточно металла, этот набор всё исправит.<br><i>ГОРШОК МЁРТВ!</i><br>"
	eng_desc = "<b> Available for: Neutrals and Raiders!</b><br>If you think this game lacks metal, then this set might fix it all.<br><i>PUNKI HOI!</i><br>"
	items = list(
		/obj/item/clothing/shoes/f13/military/diesel,
		/obj/item/clothing/shoes/f13/military/female/diesel,
		/obj/item/clothing/suit/armor/f13/punk,
		/obj/item/device/instrument/eguitar,
		/obj/item/key/motorcycle
		)
	price = 5000

/datum/content_pack/off
	name = "Набор Бейсболиста"
	eng_name = "OFF"
	id = "off"
	desc = "<b>Доступно для: Нейтралы и Рейдеры!</b><br>Тщательно восстановленные мухобои и форма грозных бойцов - Бейсболистов."
	eng_desc = "<b>Available for: Neutrals and Raiders!</b><br>Carefully recovered baseball bat and Batter's uniform. <br><i>Purification in progress...</i>"
	items = list(
		/obj/item/clothing/head/soft/black,
		/obj/item/clothing/under/f13/batter,
		/obj/item/weapon/twohanded/baseball,
		//obj/item/clothing/gloves/f13/baseball,
		/obj/item/clothing/shoes/f13/fancy
		)
	price = 5000

/datum/content_pack/madmax
	name = "Безумный Макс"
	eng_name = "Mad Max"
	id = "madmax"
	desc = "<b>Доступно для: Нейтралы и Рейдеры!</b><br>Тщательно отобранные предметы из вселенной Безумного Макса.<br><i>Важно: Steering wheel используется как ключи от машин.<br>В память о Барте Никсоне.</i>"
	eng_desc = "<b>Available for: Neutrals and Raiders!</b><br>Carefully picked items from Mad Max universe.<br><i>Remember: Steering wheel can be used as car keys.<br>In memory of Bart Nixon.</i>"
	items = list(
		/obj/item/clothing/suit/f13/mfp,
		/obj/item/clothing/suit/f13/mfp/raider,
		/obj/item/weapon/reagent_containers/food/snacks/f13/dog,
		/obj/item/clothing/head/f13/safari,
		/obj/item/clothing/under/pants/f13/warboy,
		/obj/item/key/buggy/wheel
		)
	price = 15000

/datum/content_pack/glowing_ghoul
	name = "Игровая раса: Светящийся Гуль"
	eng_name = "Playable race: Glowing ghoul"
	id = "glowing_ghoul"
	desc = "<b>Доступно для: Кого угодно, кроме анклавовцев!</b><br>Данный набор, позволяет вам создать светящегося гуля!"
	eng_desc = "<b>Available for: Anyone but Enclave!</b><br>This set allows you to create a glowing ghoul!"
	price = 30000

	on_set(client/client)
		client.add_race("glowing ghoul", /datum/species/ghoul/glowing)

/datum/content_pack/ghoul
	name = "Игровая раса: Гуль"
	eng_name = "Playable race: Ghoul"
	id = "ghoul"
	desc = "<b>Доступно для: Кого угодно, кроме анклавовцев!</b><br>Данный набор, позволяет вам создать гуля!"
	eng_desc = "<b>Available for: Anyone but Enclave!</b><br>This set allows you to create a ghoul!"
	price = 10000

	on_set(client/client)
		client.add_race("ghoul", /datum/species/ghoul)

/datum/content_pack/specops
	name = "Отряд Специального Назначения"
	eng_name = "Special Operations"
	id = "specops"
	desc = "<b>Доступно для: кто угодно!</b><br>Альфа 1-1, это браво, как слышите?<br>"
	eng_desc = "<b>Available for: Anyone!</b><br>Alpha 1-1, this is Bravo, do you copy?<br>"
	items = list(
		/obj/item/clothing/gloves/f13/military,
		/obj/item/clothing/shoes/f13/military,
		/obj/item/clothing/suit/armor/f13/black_combat_armor,
		/obj/item/clothing/under/syndicate/tacticool,
		/obj/item/clothing/glasses/night
		)
	price = 75000 // Stalkeros: А не слишком ли дохрена? // iWuna: net, ne mnogo.

/datum/content_pack/f76
	name = "Коллекционное Издание Фоллаут 13"
	eng_name = "Fallout 13: Power Armor edition"
	id = "f76"
	desc = "<b>Доступно для: кто угодно всего за 200$!</b><br>ЭТО ПРОСТО РАБОТАЕТ.<br>."
	eng_desc ="<b>Available for: Anyone!</b><br>IT JUST WORKS.<br>"
	items = list(/obj/item/weapon/storage/f76bag/bag)
	price = 20000

/*
/datum/content_pack/leaders
	name = "Лидеры всех основных фракций"
	id = "leaders"
	desc = "<b>Доступно для: кого угодно!</b><br>А кто бы не хотел быть лидером?.<br>."
	roles = list(
		/datum/job/gangleader,
		/datum/job/mayor,
		/datum/job/general,
		/datum/job/legate,
		/datum/job/elder,
		/datum/job/colonel,
		/datum/job/overseer
		/datum/job/preacher
		)
	price = 100000
*/

///отребье///

/datum/content_pack/gang_leader
	name = "Отребье: Лидер банд"
	eng_name = "Gang leader role"
	id = "gang_lead"
	desc = "<b>Открывает доступ к роли Лидера банд!</b><br>Стас Боретский мира сего!<br>."
	eng_desc = "<b>Allows you to play as Gang leader!</b><br> Cheeki breeki i v dam- Wait a moment, wrong universe.<br>"
	roles = list(/datum/job/gangleader)
	price = 15000
/*
/datum/content_pack/slaver
	name = "Отребье: Работорговец"
	id = "slaver"
	desc = "<b>Открывает доступ к роли Работорговца!</b><br>Торговля ЛЮДЬМИ спасёт пустоши!<br>."
	roles = list(/datum/job/slaver)
	price = 7000

/datum/content_pack/raider
	name = "Отребье: Рейдер"
	id = "raider"
	desc = "<b>Открывает доступ к роли Рейдера!</b><br>УМРИ-УМРИ-УМРИ!<br>."
	roles = list(/datum/job/raider)
	price = 1500
*/
///legion///

/datum/content_pack/leg_legate
	name = "Легион: Легат"
	eng_name = "Legion: Legate"
	id = "legion_legate"
	desc = "<b>Открывает доступ к роли Легата!</b><br>Аве мне!<br>."
	eng_desc = "<b>Allows you to play as Legate!</b><br>Ave me!<br>."
	roles = list(/datum/job/legate)
	price = 80000

/datum/content_pack/leg_centurion
	name = "Легион: Центурион"
	eng_name = "Legion: Centurion"
	id = "legion_centurion"
	desc = "<b>Открывает доступ к роли Центуриона!</b><br>Дегенераты как ты, должны весеь на кресте!<br>."
	eng_desc = "<b>Allows you to play as Centurion!</b><br>Degenerates like you belong on the cross.<br>"
	roles = list(/datum/job/centurion)
	price = 60000

/datum/content_pack/leg_vex
	name = "Легион: Вексиллярий"
	eng_name = "Legion: Vexillarius"
	id = "legion_vex"
	desc = "<b>Открывает доступ к роли Вексиллярия!</b><br>Фу, вещества!<br>."
	eng_desc = "<b>Allows you to play as Vexillarius!</b><br>Gah, chems!<br>"
	roles = list(/datum/job/vex)
	price = 30000

/datum/content_pack/leg_decan
	name = "Легион: Деканус"
	eng_name = "Legion: Decanus"
	id = "legion_decane"
	desc = "<b>Открывает доступ к роли Декануса!</b><br>СМЕРТЬ БРАТЬЯМ БУ... Не та реплика... СМЕРТЬ БРАТСТВУ!<br>."
	eng_desc = "<b>Allows you to play as Decanus!</b><br>Death to the Brotherhood!"
	roles = list(/datum/job/decan)
	price = 20000
/*
/datum/content_pack/leg_prime
	name = "Легион: Прайм"
	id = "legion_prime"
	desc = "<b>Открывает доступ к роли Прайма!</b><br>СМЕРТЬ ПЛУТОКРАТАМ!<br>."
	roles = list(/datum/job/prime)
	price = 10000
*/
///bruhderhood of gay///

/datum/content_pack/bs_elder
	name = "Братство: Старейшина"
	eng_name = "Brotherhood: Elder"
	id = "bs_elder"
	desc = "<b>Открывает доступ к роли Старейшины!</b><br>ТЕХНОЛОГИИ!<br>."
	eng_desc = "<b>Allows you to play as Elder!</b><br>TECHONOLOGIES!<br>."
	roles = list(/datum/job/elder)
	price = 80000

/datum/content_pack/bs_paladin
	name = "Братство: Паладин"
	eng_name = "Brotherhood: Paladin"
	id = "bs_paladin"
	desc = "<b>Открывает доступ к роли Паладина!</b><br>ТЕХНОЛОГИИ!<br>."
	eng_desc = "<b>Allows you to play as Paladin!</b><br>TECHNOLOGIES!<br>."
	roles = list(/datum/job/paladin)
	price = 45000

/datum/content_pack/bs_private
	name = "Братство: Radist и Рыцарь"
	eng_name = "Brotherhood: Radist and Knight"
	id = "bs_private"
	desc = "<b>Открывает доступ к роли Радиста и Рыцаря!</b><br>ТЕХНОЛОГИИ!<br>."
	eng_desc = "<b>Allows you to play as Radist and Knight!</b><br>TECHNOLOGIES!<br>"
	roles = list(/datum/job/radist_bs, /datum/job/knight)
	price = 25000

/datum/content_pack/bs_scriber
	name = "Братство: Писец"
	eng_name = "Brotherhood: Scriber"
	id = "bs_scribe"
	desc = "<b>Открывает доступ к роли Писца!</b><br>ТЕХНОЛОГИИ!<br>."
	eng_desc = "<b>Allows you to play as Scriber!</b><br>TECHNOLOGIES!<br>"
	roles = list(/datum/job/scriber)
	price = 15000

///Нейтралы и городские///

/datum/content_pack/mayor
	name = "Городские: Мэр"
	eng_name = "City: Mayor"
	id = "mayor"
	desc = "<b>Открывает доступ к роли Мэр!</b><br>Кто если не я?<br>."
	eng_desc = "<b>Allows you to play as Mayor!</b><br>If not me then who?<br>"
	roles = list(/datum/job/mayor)
	price = 15000
/*
/datum/content_pack/sherif
	name = "Городские: Шериф"
	id = "sherif"
	desc = "<b>Открывает доступ к роли Шериф!</b><br>Что за шляпка? Гром-баба?<br>."
	roles = list(/datum/job/sheriff)
	price = 8000
*/
/datum/content_pack/trader
	name = "Городские: Торговец"
	eng_name = "City: Trader"
	id = "trader"
	desc = "<b>Открывает доступ к роли Торговец!</b><br>Торговля спасёт пустоши!<br>."
	eng_desc = "<b>Allows you to play as Trader!</b><br>Trading will save the Wastelands!<br>"
	roles = list(/datum/job/trader)
	price = 5000
/*
/datum/content_pack/merc
	name = "Нейтралы: Наёмник"
	id = "mercenary"
	desc = "<b>Открывает доступ к роли Наёмник!</b><br>Время деньги!<br>."
	roles = list(/datum/job/mercenary)
	price = 3500

/datum/content_pack/gunrunner
	name = "Нейтралы: Оружейник"
	id = "gunrunners"
	desc = "<b>Открывает доступ к роли Оружейник!</b><br>Оружие - наше всё!<br>."
	roles = list(/datum/job/gunrunner)
	price = 10000
*/
///Анклав///

/datum/content_pack/enclave_colonel
	name = "Анклав: роль полковника"
	eng_name = "Enclave: Colonel"
	id = "enclave_colonel"
	desc = "<b>Открывает доступ к роли полковника Анклава!</b><br>Служу Америке!<br>."
	eng_desc = "<b>Allows you to play as Enclave colonel!</b><br>Serving America!<br>"
	roles = list(/datum/job/colonel)
	price = 80000

/datum/content_pack/enclave_sergeant
	name = "Анклав: роль сержанта"
	eng_name = "Enclave: Sergeant"
	id = "enclave_sergeant"
	desc = "<b>Открывает доступ к роли сержанта Анклава!</b><br>И-ДИ-ОТ!<br>."
	eng_desc = "<b>Allows you to play as Enclave sergeant!</b><br>I-DI-OT!<br>"
	roles = list(/datum/job/enclave_sergeant)
	price = 45000

/datum/content_pack/enclave
	name = "Анклав: роль рядового и радиста"
	eng_name = "Enclave: private and radist"
	id = "enclave_private"
	desc = "<b>Открывает доступ к роли рядового и радиста Анклава!</b><br>ГДЕ ВАША СИЛОВАЯ БРОНЯ?.<br>."
	eng_desc = "<b>Allows you to play as Enclave private and radist!</b><br>WHERE'S YOUR POWER ARMOR?<br>"
	roles = list(/datum/job/enclave_private, /datum/job/enclave_radist)
	price = 20000

///НКР///

/datum/content_pack/ncr_general
	name = "НКР: роль генерала"
	eng_name = "NCR: general"
	id = "ncr_general"
	desc = "<b>Открывает доступ к роли генерала НКР!</b><br>Почувствуй вкус демократии!<br>."
	eng_desc = "<b>Allows you to play as NCR general!</b><br>Feel the taste of democracy!<br>"
	roles = list(/datum/job/general)
	price = 50000

/datum/content_pack/ncr_sergeant
	name = "НКР: роль сержанта."
	eng_name = "NCR: sergeant"
	id = "ncr_sergeant"
	desc = "<b>Открывает доступ к роли сержанта НКР!</b><br>ГДЕ ВАША СИЛО.. А, не та реплика...<br>."
	eng_desc = "<b>Allows you to play as NCR sergeant!</b><br> WHERE'S YOUR PO.. Ah, wrong replic...<br>"
	roles = list(/datum/job/ncr_sergeant)
	price = 30000


/datum/content_pack/ncr_ranger
	name = "НКР: роль рейнджера."
	eng_name = "NCR: ranger."
	id = "ncr_ranger"
	desc = "<b>Открывает доступ к роли рейнджера НКР!</b><br>Я не должен тут находиться...<br>."
	eng_desc = "<b>Allows you to play as NCR ranger!</b><br>I shouldn't be here...<br>"
	roles = list(/datum/job/vranger)
	price = 20000
/*
/datum/content_pack/ncr_troop
	name = "НКР: роль рядового."
	id = "ncr_private"
	desc = "<b>Открывает доступ к роли рядового НКР!</b><br>Побродив по Мохаве, начинаешь скучать по ядерной зиме...<br>."
	roles = list(/datum/job/trooper)
	price = 10000
*/
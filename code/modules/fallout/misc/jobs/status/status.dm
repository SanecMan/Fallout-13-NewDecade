/mob
	var/status = "none"
	var/list/allow_recipes = list()

var/human_status = list()

proc/get_status_datum(status)
	if(!human_status[status])
		return null
	return human_status[status]

proc/remove_everyone_from_status(status)
	var/datum/status/S = get_status_datum(status)
	if(!S)
		return 0
	for(var/mob/M in world)
		if(M.status == S.id)
			M.set_status("none")

proc/get_mobs_by_status(status)
	. = list()
	var/datum/status/S = get_status_datum(status)
	if(!S)
		return .
	for(var/mob/M in world)
		if(M.status == S.id)
			. += M


/datum/status
	var/name = "UNKNOWN"
	var/id = "none"

	var/desc = ""

	var/welcome_text = ""

	var/verbs = list()

	var/change_faction = 1

	var/purge_faction = null

	var/list/can_invite_to = new()

	var/can_invite_to_himself = 0

	var/color = "#171717"

	var/craft_recipes = list()

	var/flag = null

/datum/status/New()
	..()
	if(can_invite_to_himself)
		can_invite_to += "[name]"
	if(id != "none")
		verbs += /mob/proc/leave_faction
	if(can_invite_to.len)
		verbs += /mob/proc/convert_to_status

mob/proc/set_status(var/status)
	var/datum/status/S = get_status_datum(status)
	var/datum/status/last_S = get_status_datum(src.status)
	if(!S)
		return 0
	if(last_S)
		src.verbs -= last_S.verbs
		src.allow_recipes -= last_S.craft_recipes


	log_faction("[src.real_name]([src.ckey]) changed role to [S.name]");

	src.status = S.id
	var/text
	text += "<span class='notice'>Теперь вы <span style='color: [S.color];'>[S.name]</span>.</span>"
	if(S.welcome_text)
		text += "<br>[S.welcome_text]"
	to_chat(src, text)

	src.verbs += S.verbs
	src.allow_recipes += S.craft_recipes
	if(S.purge_faction != null)
		src.set_faction(S.purge_faction)

	return 1

/mob/proc/leave_faction()
	set name = "Покинуть фракцию"
	set category = "Фракция"
	if(status == "none")
		return
	if(alert("Вы уверены что хотите покинуть фракцию?",,"Yes","No")=="No")
		return

	if(jobban_isbanned(src, "labor"))
		to_chat(usr, "<span class='warning'>Вы в бане!</span>")
		return

	set_status("none")


/mob/proc/convert_to_status(mob/M in oview(), status in get_can_invite_status())
	set name = "Пригласить в фракцию"
	set category = "Фракция"
	if(!M.mind || !M.client)
		return
	if(M.status == status)
		return
	if(alert(M, "[src] приглашает вас быть [status].",,"Yes","No")=="No")
		to_chat(src, "<span class='warning'>[M.name] отказался вступать во фракцию.</span>")
		return
	else
		to_chat(src, "<span class='notice'>[M.name] принял запрос на вступление во фракцию.</span>")
	var/datum/status/S = get_status_datum(status)
	if(S && S.change_faction && M.social_faction != src.social_faction)
		M.set_faction(src.social_faction)
		var/datum/f13_faction/F = get_faction_datum(src.social_faction)
		to_chat(M, "<span class='notice'>Вы присоеденились к <span style='color: [F.color];'>[F.name]</span> faction.</span>")
		if(F.welcome_text)
			to_chat(M, "<br>[F.welcome_text]")
			M.set_status(status)
			to_chat(M, "<span class='notice'>Теперь вы <span style='color: [S.color];'>[S.name]</span>.</span>")
	if(S.welcome_text)
		to_chat(M, "<br>[S.welcome_text]")

/mob/proc/get_can_invite_status()
	var/datum/status/S = get_status_datum(src.status)
	return S.can_invite_to

//***Status***

/datum/status/recruit
	name = "Рекруты"
	id = "recruit"
	change_faction = 1

/datum/status/prime
	name = "Прайм"
	id = "prime"
	change_faction = 1
	color = "#A6423B"

/datum/status/decanus
	name = "Декан"
	id = "decanus"
	change_faction = 1
	can_invite_to = list("recruit", "prime")
	color = "#A6423B"

/datum/status/vexillarius
	name = "Вексиларий"
	id = "vexillarius"
	change_faction = 1
	can_invite_to = list("recruit", "prime", "decanus")
//	craft_recipes = list(/datum/table_recipe/legion_vex_armor, /datum/table_recipe/legion_vex_helm)
	color = "#983C36"

/datum/status/centurion
	name = "Центурион"
	id = "centurion"
	change_faction = 1
	can_invite_to = list("recruit", "prime", "decanus", "vexillarius")
//	craft_recipes = list(/datum/table_recipe/legion_cent_armor, /datum/table_recipe/legion_cent_helm)
	color = "#8D3731"

/datum/status/legate
	name = "Легат"
	id = "legate"
	change_faction = 1
	can_invite_to = list("recruit", "prime", "decanus", "vexillarius", "centurion")
//	craft_recipes = list(/datum/table_recipe/legion_legat_armor, /datum/table_recipe/legion_legat_helm, \
	/datum/table_recipe/legion_legat_gloves, /datum/table_recipe/legion_legat_shoes)
	color = "#7A302A"

/datum/status/vranger
	name = "Рейнджер Ветеран"
	id = "vranger"
	change_faction = 1
	color = "#020070"

/datum/status/ncr_general
	name = "Генерал"
	id = "ncr_general"
	change_faction = 1
	can_invite_to = list("recruit", "trooper", "ncr_sergeant")
	color = "#02005C"

/datum/status/ncr_sergeant
	name = "Сержант"
	id = "ncr_sergeant"
	change_faction = 1
	color = "#02005C"

/datum/status/trooper
	name = "Пехотинец"
	id = "trooper"
	change_faction = 1
	color = "#02005C"

/datum/status/elite_trooper
	name = "Элитный Пехотинец"
	id = "etrooper"
	change_faction = 1
	color = "#02005C"

/datum/status/slaver
	name = "Работорговец"
	id = "slaver"
	purge_faction = "raiders"
	color = "#FF0000"

/datum/status/raider
	name = "Рейдер"
	id = "raider"
	purge_faction = "raiders"
	color = "#FF0000"

/datum/status/gangleader
	name = "Лидер Банды"
	id = "gangleader"
	purge_faction = "raiders"
	can_invite_to = list("raider")
	color = "#FF0000"

//	craft_recipes = list(/datum/table_recipe/raider_yankee_armor, /datum/table_recipe/raider_supafly_armor, \
	/datum/table_recipe/raider_supafly_helmet, /datum/table_recipe/raider_yankee_helmet)

/datum/status/neutral
	name = "Нейтрал"
	id = "none"
	purge_faction = "none"

/datum/status/member
	name = "Житель"
	id = "member"
	change_faction = 1

/datum/status/trader
	name = "Торговец"
	id = "trader"
	color = "#704200"

/datum/status/sheriff
	name = "Шериф"
	id = "sheriff"
	can_invite_to = list("member")
	purge_faction = "city"
	color = "#704200"

/datum/status/mayor
	name = "Мэр"
	id = "mayor"
	can_invite_to = list("member", "sheriff")
	purge_faction = "city"
	color = "#704200"

/datum/status/overseer
	name = "Смотритель"
	id = "overseer"
	can_invite_to = list("member")
	purge_faction = "vault"
	color = "#00491A"

//Acolytes

/datum/status/atom_master
	name = "Master"
	id = "master_atom"
	can_invite_to = list("hand_atom", "priest_atom")
	purge_faction = "acolytes"
	color = "#4fa102"

/datum/status/atom_hand
	name = "Hand"
	id = "hand_atom"
	purge_faction = "acolytes"
	color = "#438702"

/datum/status/atom_priest
	name = "Priest"
	id = "priest_atom"
	purge_faction = "acolytes"
	color = "#306300"

//Vault

/datum/status/overseer
	name = "Смотритель"
	id = "overseer"
	can_invite_to = list("dweller")
	purge_faction = "vault"
	color = "#005A20"

/datum/status/dweller
	name = "Выходец из Убежища"
	id = "dweller"
	purge_faction = "vault"
	color = "#005A20"

//Enclave

/datum/status/colonel
	name = "Полковник"
	id = "colonel"
	can_invite_to = list("enclave_sergeant", "private", "volunteer")
	purge_faction = "enclave"
	color = "#000"

/datum/status/enclave_sergeant
	name = "Сержант"
	id = "enclave_sergeant"
	purge_faction = "enclave"
	color = "#000"

/datum/status/private
	name = "Рядовой"
	id = "enclave_private"
	purge_faction = "enclave"
	color = "#000"

/datum/status/radist_bs
	name = "Рядовой связист"
	id = "private_radist"
	purge_faction = "enclave"
	color = "#000"

/datum/status/volunteer
	name = "Волонтёр"
	id = "volunteer"
	purge_faction = "enclave"
	color = "#000"

//Brotherhood

/datum/status/elder
	name = "Старейшина"
	id = "elder"
	can_invite_to = list("paladin", "knight", "scriber", "initiate")
	purge_faction = "bs"
	color = "#13306d"

/datum/status/paladin
	name = "Паладин"
	id = "paladin"
	purge_faction = "bs"
	color = "#13306d"

/datum/status/knight
	name = "Рыцарь"
	id = "knight"
	purge_faction = "bs"
	color = "#13306d"

/datum/status/scriber
	name = "Писец"
	id = "scriber"
	purge_faction = "bs"
	color = "#13306d"

/datum/status/paladin
	name = "Рыцарь связист"
	id = "paladin_r"
	purge_faction = "bs"
	color = "#13306d"

/datum/status/initiate
	name = "Послушник"
	id = "initiate"
	purge_faction = "bs"
	color = "#13306d"

// FOA
/datum/status/follower
	name = "Последователь"
	id = "follower"
	purge_faction = "followers"
	color = "#000"

// FOB
/datum/status/overseer
	name = "Смотритель"
	id = "overseer"
	can_invite_to = list("dweller")
	purge_faction = "vault"
	color = "#005A20"

/datum/status/dweller
	name = "Выходец из убежища"
	id = "dweller"
	purge_faction = "vault"
	color = "#005A20"

// COC
/datum/status/childofcathedral
	name = "The Children of the Cathedral"
	id = "childofcathedral"
	purge_faction = "coc"
	color = "#005A20"

/datum/status/preacher
	name = "Preacher of The Children of the Cathedral"
	id = "preacher"
	purge_faction = "coc"
	can_invite_to = list("childofcathedral", "supermutant")
	color = "#005A20"

/datum/status/supermutant
	name = "Супермутант"
	id = "supermutant"
	purge_faction = "coc"
	color = "#005A20"
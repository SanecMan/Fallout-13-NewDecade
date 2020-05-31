///TEST///
/obj/item/weapon/disk/design_disk/fallout
	name = "TEST"

/obj/item/weapon/disk/design_disk/fallout/Initialize()
	..()
	var/datum/design/golem_shell/G = new
	blueprints[1] = G

/obj/item/weapon/disk/design_disk/f13
	name = "голоплёнка с данными"
	desc = "Эта голоплёнка может содержать важные данные того, как производить какие-либо предметы. Эта имеет ярко-оранжевый цвет."
	icon_state = "datadisk0"
	max_blueprints = 6
	var/design_1 = /datum/design
	var/design_2 = /datum/design
	var/design_3 = /datum/design
	var/design_4 = /datum/design
	var/design_5 = /datum/design
	var/design_6 = /datum/design

/obj/item/weapon/disk/design_disk/f13/New()
	. = ..()
	blueprints[1] = new design_1
	blueprints[2] = new design_2
	blueprints[3] = new design_3
	blueprints[4] = new design_4
	blueprints[5] = new design_5
	blueprints[6] = new design_6

	icon_state = "datadisk[rand(0,6)]"
	if(icon_state == "datadisk0")
		desc = "Эта голоплёнка может содержать важные данные того, как производить какие-либо предметы. Эта имеет ярко-оранжевый цвет."
	if(icon_state == "datadisk1")
		desc = "Эта голоплёнка может содержать важные данные того, как производить какие-либо предметы. Эта имеет тёмно-фиолетовый цвет."
	if(icon_state == "datadisk2")
		desc = "Эта голоплёнка может содержать важные данные того, как производить какие-либо предметы. Эта имеет тёмно-красный цвет."
	if(icon_state == "datadisk3")
		desc = "Эта голоплёнка может содержать важные данные того, как производить какие-либо предметы. Эта имеет тёмный цвет."
	if(icon_state == "datadisk4")
		desc = "Эта голоплёнка может содержать важные данные того, как производить какие-либо предметы. Эта имеет зеленый цвет."
	if(icon_state == "datadisk5")
		desc = "Эта голоплёнка может содержать важные данные того, как производить какие-либо предметы. Эта имеет ярко-фиолетовый цвет."
	if(icon_state == "datadisk6")
		desc = "Эта голоплёнка может содержать важные данные того, как производить какие-либо предметы. Эта имеет серый цвет."

/obj/item/weapon/disk/design_disk/f13/robco_tool
	name = "голоплёнка с данными РобКо"
	icon_state = "datadisk0"
	design_1 = /datum/design/crowbar
	design_2 = /datum/design/mini_weldingtool
	design_3 = /datum/design/screwdriver
	design_4 = /datum/design/wirecutters
	design_5 = /datum/design/wrench
	design_6 = /datum/design/cable_coil

/obj/item/weapon/disk/design_disk/f13/robco_tool/New()
	..()
//	test_shit = /datum/design/crowbar
//	var/datum/design/crowbar = blueprints[1]
//	var/datum/design/mini_weldingtool/M = new
//	var/datum/design/screwdriver/S = new
//	var/datum/design/wirecutters/W = new
//	var/datum/design/wrench/H = new
//	var/datum/design/cable_coil/F = new
//	test_shit = /datum/design/crowbar

	if(icon_state == "datadisk0")
		desc = "Эта голоплёнка может содержать важные данные того, как производить инструменты. Эта имеет ярко-оранжевый цвет."
	if(icon_state == "datadisk1")
		desc = "Эта голоплёнка может содержать важные данные того, как производить инструменты. Эта имеет тёмно-фиолетовый цвет."
	if(icon_state == "datadisk2")
		desc = "Эта голоплёнка может содержать важные данные того, как производить инструменты. Эта имеет тёмно-красный цвет."
	if(icon_state == "datadisk3")
		desc = "Эта голоплёнка может содержать важные данные того, как производить инструменты. Эта имеет тёмный цвет."
	if(icon_state == "datadisk4")
		desc = "Эта голоплёнка может содержать важные данные того, как производить инструменты. Эта имеет зеленый цвет."
	if(icon_state == "datadisk5")
		desc = "Эта голоплёнка может содержать важные данные того, как производить инструменты. Эта имеет ярко-фиолетовый цвет."
	if(icon_state == "datadisk6")
		desc = "Эта голоплёнка может содержать важные данные того, как производить инструменты. Эта имеет серый цвет."

/obj/item/weapon/disk/design_disk/f13/schlocket
	name = "голоплёнка с данными Шлокет"
	design_1 = /datum/design/bowl
	design_2 = /datum/design/drinking_glass
	design_3 = /datum/design/shot_glass
	design_4 = /datum/design/shaker
	design_5 = /datum/design/tray
	design_6 = /datum/design/fork

/obj/item/weapon/disk/design_disk/f13/dawnshire
	name = "голоплёнка с данными Доншир поттери"
	design_1 = /datum/design/tray
	design_2 = /datum/design/drinking_glass
	design_3 = /datum/design/shot_glass
	design_4 = /datum/design/shaker

/obj/item/weapon/disk/design_disk/f13/ormed
	name = "голоплёнка с данными ОРМЕД"
	design_1 = /datum/design/scalpel
	design_2 = /datum/design/circular_saw
	design_3 = /datum/design/surgicaldrill
	design_4 = /datum/design/retractor
	design_5 = /datum/design/cautery
	design_6 = /datum/design/hemostat

/obj/item/weapon/disk/design_disk/f13/vesttec
	name = "голоплёнка с данными Вест-Тек"
	design_1 = /datum/design/beaker
	design_2 = /datum/design/large_beaker
	design_3 = /datum/design/basic_cell
	design_4 = /datum/design/geiger
	design_5 = /datum/design/handlabeler
	design_6 = /datum/design/syringe

/obj/item/weapon/disk/design_disk/f13/greenway
	name = "голоплёнка с данными Гринуэй Хайдропоникс"
	design_1 = /datum/design/hatchet
	design_2 = /datum/design/spade
	design_3 = /datum/design/shovel
	design_4 = /datum/design/plant_analyzer
	design_5 = /datum/design/cultivator

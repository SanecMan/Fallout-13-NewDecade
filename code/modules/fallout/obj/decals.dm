//Fallout 13 decorative decals - the rest of pure decorative stuff is in decor.dm

/obj/effect/decal/cleanable/waste
	name = "СЃС‚СЂР°РЅРЅР°СЏ Р»СѓР¶Р°"
	desc = "Р›СѓР¶Р° С‚РѕРєСЃРёС‡РЅРѕР№, Р»РёРїРєРѕР№ Рё СЃРІРµС‚СЏС‰РµР№СЃСЏ Р¶РёРґРєРѕСЃС‚Рё."
	eng_name = "puddle of goo"
	eng_desc = "A puddle of sticky, incredibly toxic and likely radioactive green goo."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "goo1"
	anchored = 1
	layer = 2.1
	light_color = LIGHT_COLOR_GREEN
	light_power = 0.5
	light_range = 3
	rad_heavy_range = 1
	rad_light_range = 4
	rad_severity = 10

/obj/effect/decal/cleanable/waste/New()
	..()
	icon_state = "goo[rand(1,13)]"
	START_PROCESSING(SSobj, src)
	SSradiation.processing += src

/obj/item/trash/cloud_residue
	name = "РѕСЃР°РґРѕРє"
	desc = "РћСЃР°РґРѕРє РєСЂР°СЃРЅРѕРіРѕ РѕР±Р»Р°РєР°. РќРµ С‚Р°Рє СѓР¶ Рё РѕРїР°СЃРµРЅ С‚РµРїРµСЂСЊ."
	eng_name = "cloud residue"
	eng_desc = "Cloud residue is the powdery residue from the Cloud that surrounds the Sierra Madre. It is dark red in color."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "goo_r1"
	anchored = 0
	layer = 2
	light_color = LIGHT_COLOR_RED
	light_power = 0.5
	light_range = 3
	rad_heavy_range = 1
	rad_light_range = 5
	rad_severity = 3

/obj/item/trash/cloud_residue/New()
	..()
	icon_state = "goo_r[rand(1,4)]"

/obj/effect/decal/cleanable/cloud
	name = "РѕР±Р»Р°РєРѕ РіР°Р·Р°"
	desc = "РўРѕРєСЃРёС‡РЅРѕРµ РєСЂР°СЃРЅРѕРµ РѕР±Р»Р°РєРѕ РіР°Р·Р°."
	eng_name = "red cloud"
	eng_desc = "A toxin red cloud."
	icon = 'icons/fallout/misc/weather.dmi'
	icon_state = "redcloud"
	anchored = 1
	layer = 4.5
	light_color = LIGHT_COLOR_RED
	light_power = 0.5
	light_range = 4
	rad_heavy_range = 1
	rad_light_range = 2
	rad_severity = 5

/obj/effect/decal/cleanable/cloud/New()
	..()
	START_PROCESSING(SSobj, src)
	SSradiation.processing += src

/obj/effect/decal/marking
	name = "РґРѕСЂРѕР¶РЅРѕРµ РѕР±РѕР·РЅР°С‡РµРЅРёРµ"
	desc = "Р­С‚Рё С€С‚СѓРєРё СЂР°РЅСЊС€Рµ РЅР°РЅРѕСЃРёР»Рё РґР»СЏ С‚РѕРіРѕ, С‡С‚РѕР±С‹ РѕР±РѕР·РЅР°С‡Р°С‚СЊ СЃС‚РѕСЂРѕРЅС‹ РїРѕС‚РѕРєР°, РЅР°РІРµСЂРЅРѕРµ..."
	eng_name = "road marking"
	eng_desc = "Road surface markings were used on paved roadways to provide guidance and information to drivers and pedestrians.<br>Nowadays, those wandering the wasteland commonly use them as directional landmarks."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "singlevertical" //See decals.dmi for different icon states of road markings.
	anchored = 1
	layer = 2.1
	resistance_flags = INDESTRUCTIBLE
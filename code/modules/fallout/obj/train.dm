//ОСНОВНОЙ КОД
//МЕНЯТЬ ЕСЛИ ВСЁ ПОШЛО НЕ ПО РЕЛЬСАМ А ЧЕРЕЗ ЖОПУ
//Made By SanecMan
//Код арены: code\modules\fallout\areas\area.dm
/*
//Защита от любителей изучить
/turf/closed/indestructible/f13/train
	name = 'Чувак я проебался'
	desc = 'Иди блядь в саньку он обосрался'
	icon = 'icons/effects/effects.dmi'
	opacity = 10000000

//Защитный щит
/turf/closed/indestructible/f13/train/shield
	name = "Защитное поле"
	desc = "Непробиваемое защитное поле, которое ограждает тебя от путешествий вглубь."
	icon_state = "shieldwall"

//Движущеися стены
/turf/closed/indestructible/f13/train/openwall
	name = "Стена"
	desc = "Ничего необычного."
	icon_state = "shieldwall"


//Если таки не заработает щит вставить предварительно переработав этот код
// /turf/closed/indestructible/fakeglass/New()
//	..()
//	icon_state = null //set the icon state to null, so our base state isn't visible
//	var/image/I = image('icons/obj/structures.dmi', loc = src, icon_state = "grille")
//	underlays += I //add a grille underlay
//	I = image('icons/turf/floors.dmi', loc = src, icon_state = "plating")
//	underlays += I //add the plating underlay, below the grille

//Показал коду место где можно выпасть. ЭТО ГОВНО НАДО ПЕРЕПИСАТЬ. ВУНА БЛЯДЬ НЕ ЗАБУДЬ. Остальную часть кода искать по тегу #poezd
/turf/open/chasm/straight_down/train/New()
	..()
	drop_x = [rand(6,27)]
	drop_y = [rand(99,103)]
	drop_z = 2
	name = 'ХУЙХУЙХУЙХУЙХУЙХУЙХУЙХУЙХУЙХУЙХУЙХУЙ' //ЭТО ЗАТЕГАНО
	desc = 'ПОШЁЛ НАХУЙ С МОЕГО КОДА'
	icon = 'icons/fallout/turfs/train.dmi'

//Движущиеся покрытие
/turf/open/chasm/straight_down/train/openground
	name = 'Дорожное покрытие'
	desc = 'Не прыгай!'
	icon_state = "openground"

//Движущиеся рельсы
/turf/open/chasm/straight_down/train/openrail
	name = 'Рельсы'
	desc = 'Не прыгай!'
	icon_state = "openwall"
*/

//Консоль для управления поездом #train
/obj/machinery/computer/shuttle/train
	name = "Панель Управления Поездом"
	desc = "Вы видите панель с кучей кнопок. Большинство из них не работают кроме нескольких, которые позволяют управлять поездом и направлять его на нужные станции."
	shuttleId = "poezd"
	possible_destinations = "poezd_kebab;poezd_end"
	circuit = /obj/item/weapon/circuitboard/computer/train


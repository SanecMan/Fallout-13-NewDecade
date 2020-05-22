/obj/item/weapon/retractor
	name = "ретрактор"
	desc = "Чтобы отодвигать плоть."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "retractor"
	materials = list(MAT_METAL=6000, MAT_GLASS=3000)
	flags = CONDUCT
	w_class = WEIGHT_CLASS_TINY
	origin_tech = "materials=1;biotech=1"


/obj/item/weapon/hemostat
	name = "зажим"
	desc = "Этот нехитрый прибор, поможет остановить кровотечение во время операции."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "hemostat"
	materials = list(MAT_METAL=5000, MAT_GLASS=2500)
	flags = CONDUCT
	w_class = WEIGHT_CLASS_TINY
	origin_tech = "materials=1;biotech=1"
	attack_verb = list("attacked", "pinched")


/obj/item/weapon/cautery
	name = "термокаутер"
	desc = "Поможет вам остановить кровотечение и заживить надрез."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "cautery"
	materials = list(MAT_METAL=2500, MAT_GLASS=750)
	flags = CONDUCT
	w_class = WEIGHT_CLASS_TINY
	origin_tech = "materials=1;biotech=1"
	attack_verb = list("burnt")


/obj/item/weapon/surgicaldrill
	name = "хирургическая дрель"
	desc = "Вы можете сверлить используя её, понимаете?"
	icon = 'icons/obj/surgery.dmi'
	icon_state = "drill"
	hitsound = 'sound/weapons/circsawhit.ogg'
	materials = list(MAT_METAL=10000, MAT_GLASS=6000)
	flags = CONDUCT
	force = 15
	w_class = WEIGHT_CLASS_NORMAL
	origin_tech = "materials=1;biotech=1"
	attack_verb = list("drilled")

/obj/item/weapon/scalpel
	name = "скальпель"
	desc = "Надрез. Еще надрез, и-и-и, еще!"
	icon = 'icons/obj/surgery.dmi'
	icon_state = "scalpel"
	flags = CONDUCT
	force = 10
	w_class = WEIGHT_CLASS_TINY
	throwforce = 5
	throw_speed = 3
	throw_range = 5
	materials = list(MAT_METAL=4000, MAT_GLASS=1000)
	origin_tech = "materials=1;biotech=1"
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	sharpness = IS_SHARP_ACCURATE

/obj/item/weapon/scalpel/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is slitting [user.p_their()] [pick("wrists", "throat", "stomach")] with [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return (BRUTELOSS)

/obj/item/weapon/circular_saw
	name = "циркулярная пила"
	desc = "Для тяжелой резки."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "saw"
	hitsound = 'sound/weapons/circsawhit.ogg'
	throwhitsound =  'sound/weapons/pierce.ogg'
	flags = CONDUCT
	force = 25
	w_class = WEIGHT_CLASS_NORMAL
	throwforce = 9
	throw_speed = 2
	throw_range = 5
	materials = list(MAT_METAL=10000, MAT_GLASS=6000)
	origin_tech = "biotech=1;combat=1"
	attack_verb = list("attacked", "slashed", "sawed", "cut")
	sharpness = IS_SHARP


/obj/item/weapon/surgical_drapes
	name = "хирургическая простыня"
	desc = "Пирургическая простыня бренда ОРМЕД, даёт лучшую защиту от инфекций! Если верить слогану..."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "surgical_drapes"
	w_class = WEIGHT_CLASS_TINY
	origin_tech = "biotech=1"
	attack_verb = list("slapped")

/obj/item/weapon/surgical_drapes/attack(mob/living/M, mob/user)
	if(!attempt_initiate_surgery(src, M, user))
		..()
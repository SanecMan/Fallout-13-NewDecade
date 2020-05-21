/obj/item/clothing/suit/armor/f13/radist_armor
	name = "плитник"
	desc = "Плитник радиста Анклава."
	icon_state = "unit_carrier"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	armor = list(melee = 65, bullet = 50, laser = 20, energy = 10, bomb = 45, bio = 0, rad = 0, fire = 10, acid = 0)
	put_on_delay = 60
	strip_delay = 60
	resistance_flags = FIRE_PROOF
	self_weight = 7

/obj/item/clothing/head/helmet/f13/radist
	name = "radist combat helmet"
	desc = "Каска с обозначениями Анклава."
	icon_state = "unit_helm"
	item_state = "marine"
	armor = list(melee = 65, bullet = 60, laser = 25, energy = 15, bomb = 30, bio = 0, rad = 0, fire = 30, acid = 30)
	flags_inv = HIDEEARS|HIDEHAIR
	put_on_delay = 20
	strip_delay = 30
	resistance_flags = FIRE_PROOF
	self_weight = 2

/obj/item/clothing/under/f13/j12
	name = "J-12 uniform"
	desc = "Ж-12, мы гордимся тобой."
	icon_state = "j12"
	item_state = "bl_suit"
	item_color = "j12"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 10, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)
	can_adjust = 0
	resistance_flags = FIRE_PROOF

/obj/item/clothing/under/f13/radist_bs
	name = "old radist uniform"
	desc = "Практичная форма радиста."
	icon_state = "bs_radist"
	item_state = "bl_suit"
	item_color = "bs_radist"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 10, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)
	can_adjust = 0
	resistance_flags = FIRE_PROOF

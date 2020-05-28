/obj/item/device/modular_computer/laptop/preset/New()
	. = ..()
	install_component(new /obj/item/weapon/computer_hardware/processor_unit/small)
	install_component(new /obj/item/weapon/computer_hardware/battery(src, /obj/item/weapon/stock_parts/cell/computer))
	install_component(new /obj/item/weapon/computer_hardware/hard_drive)
	install_component(new /obj/item/weapon/computer_hardware/network_card)
	install_programs()


/obj/item/device/modular_computer/laptop/preset/proc/install_programs()
	return




/obj/item/device/modular_computer/laptop/preset/civillian
	desc = "Недорогой ноутбук, часто используемый для личного отдыха."


/obj/item/device/modular_computer/laptop/preset/civillian/install_programs()
	var/obj/item/weapon/computer_hardware/hard_drive/hard_drive = all_components[MC_HDD]
	hard_drive.store_file(new/datum/computer_file/program/chatclient())
	hard_drive.store_file(new/datum/computer_file/program/nttransfer())
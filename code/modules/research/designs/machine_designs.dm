////////////////////////////////////////
//////////////MISC Boards///////////////
////////////////////////////////////////

/datum/design/board/smes
	name = "Плата (SMES)"
	desc = "The circuit board for a SMES."
	id = "smes"
	req_tech = list("programming" = 4, "powerstorage" = 4, "engineering" = 4)
	build_path = /obj/item/weapon/circuitboard/machine/smes
	category = list ("Engineering Machinery")
	build_type = IMPRINTER

/datum/design/board/announcement_system
	name = "Плата (Автоматизированная Система Оповещения)"
	desc = "The circuit board for an automated announcement system."
	id = "automated_announcement"
	req_tech = list("programming" = 3, "bluespace" = 3, "magnets" = 2)
	build_path = /obj/item/weapon/circuitboard/machine/announcement_system
	category = list("Subspace Telecomms")
	build_type = IMPRINTER

/datum/design/board/turbine_computer
	name = "Компьютерная плата (Консоль Турбинного Генератора)"
	desc = "The circuit board for a power turbine console."
	id = "power_turbine_console"
	req_tech = list("programming" = 4, "powerstorage" = 4, "engineering" = 4)
	build_path = /obj/item/weapon/circuitboard/computer/turbine_computer
	category = list ("Engineering Machinery")
	build_type = IMPRINTER

/datum/design/board/emitter
	name = "Плата (Излучатель)"
	desc = "The circuit board for an emitter."
	id = "emitter"
	req_tech = list("programming" = 3, "powerstorage" = 4, "engineering" = 4)
	build_path = /obj/item/weapon/circuitboard/machine/emitter
	category = list ("Engineering Machinery")
	build_type = IMPRINTER

/datum/design/board/power_compressor
	name = "Плата (Power Compressor Board)"
	desc = "The circuit board for a power compressor."
	id = "power_compressor"
	req_tech = list("programming" = 4, "powerstorage" = 4, "engineering" = 4)
	build_path = /obj/item/weapon/circuitboard/machine/power_compressor
	category = list ("Engineering Machinery")
	build_type = IMPRINTER

/datum/design/board/power_turbine
	name = "Плата (Power Turbine Board)"
	desc = "The circuit board for a power turbine."
	id = "power_turbine"
	req_tech = list("programming" = 4, "powerstorage" = 4, "engineering" = 4)
	build_path = /obj/item/weapon/circuitboard/machine/power_turbine
	category = list ("Engineering Machinery")
	build_type = IMPRINTER

/datum/design/board/thermomachine
	name = "Плата (Freezer/Heater Board)"
	desc = "The circuit board for a freezer/heater."
	id = "thermomachine"
	req_tech = list("programming" = 3)
	build_path = /obj/item/weapon/circuitboard/machine/thermomachine
	category = list ("Engineering Machinery")
	build_type = IMPRINTER

/datum/design/board/space_heater
	name = "Плата (Space Heater Board)"
	desc = "The circuit board for a space heater."
	id = "space_heater"
	req_tech = list("programming" = 2, "engineering" = 2)
	build_path = /obj/item/weapon/circuitboard/machine/space_heater
	category = list ("Engineering Machinery")
	build_type = IMPRINTER

/datum/design/board/teleport_station
	name = "Плата (Teleportation Station Board)"
	desc = "The circuit board for a teleportation station."
	id = "tele_station"
	req_tech = list("programming" = 4, "bluespace" = 4, "engineering" = 4, "prewar" = 3)
	build_path = /obj/item/weapon/circuitboard/machine/teleporter_station
	category = list ("Teleportation Machinery")
	build_type = IMPRINTER

/datum/design/board/teleport_hub
	name = "Плата (Teleportation Hub Board)"
	desc = "The circuit board for a teleportation hub."
	id = "tele_hub"
	req_tech = list("programming" = 3, "bluespace" = 4, "materials" = 4, "engineering" = 4, "prewar" = 3)
	build_path = /obj/item/weapon/circuitboard/machine/teleporter_hub
	category = list ("Teleportation Machinery")
	build_type = IMPRINTER

/datum/design/board/quantumpad
	name = "Machine Design (Quantum Pad Board)"
	desc = "The circuit board for a quantum telepad."
	id = "quantumpad"
	req_tech = list("programming" = 4, "bluespace" = 4, "prewar" = 3, "engineering" = 4)
	build_path = /obj/item/weapon/circuitboard/machine/quantumpad
	category = list ("Teleportation Machinery")
	build_type = IMPRINTER

/datum/design/board/telepad
	name = "Плата (Telepad Board)"
	desc = "The circuit board for a telescience telepad."
	id = "telepad"
	req_tech = list("programming" = 4, "bluespace" = 4, "prewar" = 4, "engineering" = 4)
	build_path = /obj/item/weapon/circuitboard/machine/telesci_pad
	category = list ("Teleportation Machinery")
	build_type = IMPRINTER

/datum/design/board/teleconsole
	name = "Плата (Teleporter Console)"
	desc = "Allows for the construction of circuit boards used to build a teleporter control console."
	id = "teleconsole"
	req_tech = list("programming" = 3, "bluespace" = 3, "prewar" = 4)
	build_path = /obj/item/weapon/circuitboard/computer/teleporter
	category = list("Teleportation Machinery")
	build_type = IMPRINTER

/datum/design/board/telesci_console
	name = "Плата (Telepad Control Console Board)"
	desc = "Allows for the construction of circuit boards used to build a telescience console."
	id = "telesci_console"
	req_tech = list("programming" = 3, "bluespace" = 3, "prewar" = 4)
	build_path = /obj/item/weapon/circuitboard/computer/telesci_console
	category = list("Teleportation Machinery")
	build_type = IMPRINTER

/datum/design/board/sleeper
	name = "Плата (Sleeper Board)"
	desc = "The circuit board for a sleeper."
	id = "sleeper"
	req_tech = list("programming" = 3, "biotech" = 2, "engineering" = 3)
	build_path = /obj/item/weapon/circuitboard/machine/sleeper
	category = list ("Medical Machinery")
	build_type = IMPRINTER

/datum/design/board/cryotube
	name = "Плата (Cryotube Board)"
	desc = "The circuit board for a cryotube."
	id = "cryotube"
	req_tech = list("programming" = 5, "biotech" = 3, "engineering" = 4, "prewar" = 3)
	build_path = /obj/item/weapon/circuitboard/machine/cryo_tube
	category = list ("Medical Machinery")
	build_type = IMPRINTER

/datum/design/board/chem_dispenser
	name = "Плата (Portable Chem Dispenser Board)"
	desc = "The circuit board for a portable chem dispenser."
	id = "chem_dispenser"
	req_tech = list("programming" = 4, "biotech" = 3, "materials" = 4, "prewar" = 3)
	build_path = /obj/item/weapon/circuitboard/machine/chem_dispenser
	category = list ("Medical Machinery")
	build_type = IMPRINTER

/datum/design/board/chem_master
	name = "Плата (Chem Master Board)"
	desc = "The circuit board for a Chem Master 3000."
	id = "chem_master"
	req_tech = list("biotech" = 3, "materials" = 3, "programming" = 2)
	build_path = /obj/item/weapon/circuitboard/machine/chem_master
	category = list ("Medical Machinery")
	build_type = IMPRINTER

/datum/design/board/chem_heater
	name = "Плата (Chemical Heater Board)"
	desc = "The circuit board for a chemical heater."
	id = "chem_heater"
	req_tech = list("engineering" = 2, "biotech" = 2, "programming" = 2)
	build_path = /obj/item/weapon/circuitboard/machine/chem_heater
	category = list ("Medical Machinery")
	build_type = IMPRINTER

/datum/design/board/clonecontrol
	name = "Плата (Cloning Machine Console)"
	desc = "Allows for the construction of circuit boards used to build a new Cloning Machine console."
	id = "clonecontrol"
	req_tech = list("programming" = 4, "biotech" = 3)
	build_path = /obj/item/weapon/circuitboard/computer/cloning
	category = list("Medical Machinery")
	build_type = IMPRINTER

/datum/design/board/clonepod
	name = "Плата (Clone Pod)"
	desc = "Allows for the construction of circuit boards used to build a Cloning Pod."
	id = "clonepod"
	req_tech = list("programming" = 4, "biotech" = 3)
	build_path = /obj/item/weapon/circuitboard/machine/clonepod
	category = list("Medical Machinery")
	build_type = IMPRINTER

/datum/design/board/clonescanner
	name = "Плата (Cloning Scanner)"
	desc = "Allows for the construction of circuit boards used to build a Cloning Scanner."
	id = "clonescanner"
	req_tech = list("programming" = 4, "biotech" = 3)
	build_path = /obj/item/weapon/circuitboard/machine/clonescanner
	category = list("Medical Machinery")
	build_type = IMPRINTER

/datum/design/board/biogenerator
	name = "Плата (Biogenerator Board)"
	desc = "The circuit board for a biogenerator."
	id = "biogenerator"
	req_tech = list("programming" = 2, "biotech" = 3, "materials" = 3)
	build_path = /obj/item/weapon/circuitboard/machine/biogenerator
	category = list ("Hydroponics Machinery")
	build_type = IMPRINTER

/datum/design/board/hydroponics
	name = "Плата (Hydroponics Tray Board)"
	desc = "The circuit board for a hydroponics tray."
	id = "hydro_tray"
	req_tech = list("biotech" = 2)
	build_path = /obj/item/weapon/circuitboard/machine/hydroponics
	category = list ("Hydroponics Machinery")
	build_type = IMPRINTER

/datum/design/board/destructive_analyzer
	name = "Плата (Destructive Analyzer Board)"
	desc = "The circuit board for a destructive analyzer."
	id = "destructive_analyzer"
	req_tech = list("programming" = 2, "magnets" = 2, "engineering" = 2)
	build_path = /obj/item/weapon/circuitboard/machine/destructive_analyzer
	category = list("Research Machinery")
	build_type = IMPRINTER

/datum/design/board/experimentor
	name = "Плата (E.X.P.E.R.I-MENTOR Board)"
	desc = "The circuit board for an E.X.P.E.R.I-MENTOR."
	id = "experimentor"
	req_tech = list("programming" = 2, "magnets" = 2, "engineering" = 2, "bluespace" = 2)
	build_path = /obj/item/weapon/circuitboard/machine/experimentor
	category = list("Research Machinery")
	build_type = IMPRINTER

/datum/design/board/protolathe
	name = "Плата (Protolathe Board)"
	desc = "The circuit board for a protolathe."
	id = "protolathe"
	req_tech = list("programming" = 2, "engineering" = 2)
	build_path = /obj/item/weapon/circuitboard/machine/protolathe
	category = list("Research Machinery")
	build_type = IMPRINTER

/datum/design/board/circuit_imprinter
	name = "Плата (Circuit Imprinter Board)"
	desc = "The circuit board for a circuit imprinter."
	id = "circuit_imprinter"
	req_tech = list("programming" = 2, "engineering" = 2)
	build_path = /obj/item/weapon/circuitboard/machine/circuit_imprinter
	category = list("Research Machinery")
	build_type = IMPRINTER

/datum/design/board/rdservercontrol
	name = "Computer Design (R&D Server Control Console Board)"
	desc = "The circuit board for an R&D Server Control Console."
	id = "rdservercontrol"
	req_tech = list("programming" = 3)
	build_path = /obj/item/weapon/circuitboard/computer/rdservercontrol
	category = list("Research Machinery")
	build_type = IMPRINTER

/datum/design/board/rdserver
	name = "Плата (R&D Server Board)"
	desc = "The circuit board for an R&D Server."
	id = "rdserver"
	req_tech = list("programming" = 3)
	build_path = /obj/item/weapon/circuitboard/machine/rdserver
	category = list("Research Machinery")
	build_type = IMPRINTER

/datum/design/board/mechfab
	name = "Плата (Exosuit Fabricator Board)"
	desc = "The circuit board for an Exosuit Fabricator."
	id = "mechfab"
	req_tech = list("programming" = 3, "engineering" = 3)
	build_path = /obj/item/weapon/circuitboard/machine/mechfab
	category = list("Research Machinery")
	build_type = IMPRINTER

/datum/design/board/cyborgrecharger
	name = "Плата (Cyborg Recharger Board)"
	desc = "The circuit board for a Cyborg Recharger."
	id = "cyborgrecharger"
	req_tech = list("powerstorage" = 3, "engineering" = 3)
	build_path = /obj/item/weapon/circuitboard/machine/cyborgrecharger
	category = list("Research Machinery")
	build_type = IMPRINTER

/datum/design/board/mech_recharger
	name = "Плата (Mechbay Recharger Board)"
	desc = "The circuit board for a Mechbay Recharger."
	id = "mech_recharger"
	req_tech = list("programming" = 3, "powerstorage" = 4, "engineering" = 3)
	build_path = /obj/item/weapon/circuitboard/machine/mech_recharger
	category = list("Research Machinery")
	build_type = IMPRINTER

/datum/design/board/microwave
	name = "Плата (Микроволновка)"
	desc = "The circuit board for a microwave."
	id = "microwave"
	req_tech = list("programming" = 2, "magnets" = 2)
	build_path = /obj/item/weapon/circuitboard/machine/microwave
	category = list ("Misc. Machinery")
	build_type = IMPRINTER

/datum/design/board/gibber
	name = "Плата (Мясорубка)"
	desc = "The circuit board for a gibber."
	id = "gibber"
	req_tech = list("programming" = 2, "engineering" = 2)
	build_path = /obj/item/weapon/circuitboard/machine/gibber
	category = list ("Misc. Machinery")
	build_type = IMPRINTER

/datum/design/board/smartfridge
	name = "Плата (Умный холодильник)"
	desc = "The circuit board for a smartfridge."
	id = "smartfridge"
	req_tech = list("programming" = 1)
	build_path = /obj/item/weapon/circuitboard/machine/smartfridge
	category = list ("Misc. Machinery")
	build_type = IMPRINTER

/datum/design/board/monkey_recycler
	name = "Плата (Мясорубка для мартышек)"
	desc = "The circuit board for a monkey recycler."
	id = "smartfridge"
	req_tech = list("programming" = 1)
	build_path = /obj/item/weapon/circuitboard/machine/monkey_recycler
	category = list ("Misc. Machinery")
	build_type = IMPRINTER

/datum/design/board/seed_extractor
	name = "Плата (Seed Extractor Board)"
	desc = "The circuit board for a seed extractor."
	id = "seed_extractor"
	req_tech = list("programming" = 1)
	build_path = /obj/item/weapon/circuitboard/machine/seed_extractor
	category = list ("Misc. Machinery")
	build_type = IMPRINTER

/datum/design/board/processor
	name = "Плата (Processor Board)"
	desc = "The circuit board for a processor."
	id = "processor"
	req_tech = list("programming" = 1)
	build_path = /obj/item/weapon/circuitboard/machine/processor
	category = list ("Misc. Machinery")
	build_type = IMPRINTER

/datum/design/board/recycler
	name = "Плата (Recycler Board)"
	desc = "The circuit board for a recycler."
	id = "recycler"
	req_tech = list("programming" = 2, "engineering" = 2)
	build_path = /obj/item/weapon/circuitboard/machine/recycler
	category = list ("Misc. Machinery")
	build_type = IMPRINTER

/datum/design/board/holopad
	name = "Плата (AI Holopad Board)"
	desc = "The circuit board for a holopad."
	id = "holopad"
	req_tech = list("programming" = 1)
	build_path = /obj/item/weapon/circuitboard/machine/holopad
	category = list ("Misc. Machinery")
	build_type = IMPRINTER

/datum/design/board/autolathe
	name = "Плата (Автолат)"
	desc = "The circuit board for an autolathe."
	id = "autolathe"
	req_tech = list("programming" = 3, "engineering" = 3)
	build_path = /obj/item/weapon/circuitboard/machine/autolathe
	category = list ("Misc. Machinery")
	build_type = IMPRINTER

/datum/design/board/recharger
	name = "Плата (Weapon Recharger Board)"
	desc = "The circuit board for a Weapon Recharger."
	id = "recharger"
	req_tech = list("powerstorage" = 3, "engineering" = 3, "materials" = 4)
	materials = list(MAT_GLASS = 1000, MAT_GOLD = 100, MAT_COOPER = 100)
	build_path = /obj/item/weapon/circuitboard/machine/recharger
	category = list("Misc. Machinery")
	build_type = IMPRINTER

/datum/design/board/vendor
	name = "Плата (Vendor Board)"
	desc = "The circuit board for a Vendor."
	id = "vendor"
	req_tech = list("programming" = 1)
	build_path = /obj/item/weapon/circuitboard/machine/vendor
	category = list ("Misc. Machinery")
	build_type = IMPRINTER

/datum/design/board/ore_redemption
	name = "Плата (Ore Redemption Board)"
	desc = "The circuit board for an Ore Redemption machine."
	id = "ore_redemption"
	req_tech = list("programming" = 2, "engineering" = 2, "prewar" = 3)
	build_path = /obj/item/weapon/circuitboard/machine/ore_redemption
	category = list ("Misc. Machinery")
	build_type = IMPRINTER

/datum/design/board/mining_equipment_vendor
	name = "Плата (Mining Rewards Vender Board)"
	desc = "The circuit board for a Mining Rewards Vender."
	id = "mining_equipment_vendor"
	req_tech = list("engineering" = 3)
	build_path = /obj/item/weapon/circuitboard/machine/mining_equipment_vendor
	category = list ("Misc. Machinery")
	build_type = IMPRINTER

/datum/design/board/tesla_coil
	name = "Плата (Tesla Coil Board)"
	desc = "The circuit board for a tesla coil."
	id = "tesla_coil"
	req_tech = list("programming" = 3, "powerstorage" = 3, "magnets" = 3)
	build_path = /obj/item/weapon/circuitboard/machine/tesla_coil
	category = list ("Misc. Machinery")
	build_type = IMPRINTER

/datum/design/board/grounding_rod
	name = "Плата (Grounding Rod Board)"
	desc = "The circuit board for a grounding rod."
	id = "grounding_rod"
	req_tech = list("programming" = 3, "powerstorage" = 3, "magnets" = 3)
	build_path = /obj/item/weapon/circuitboard/machine/grounding_rod
	category = list ("Misc. Machinery")
	build_type = IMPRINTER

/datum/design/board/plantgenes
	name = "Плата (Plant DNA Manipulator Board)"
	desc = "The circuit board for a plant DNA manipulator."
	id = "plantgenes"
	req_tech = list("programming" = 4, "biotech" = 3)
	build_path = /obj/item/weapon/circuitboard/machine/plantgenes
	category = list ("Misc. Machinery")
	build_type = IMPRINTER

/datum/design/board/ntnet_relay
	name = "Плата (NTNet Relay Board)"
	desc = "The circuit board for a wireless network relay."
	id = "ntnet_relay"
	req_tech = list("programming" = 2, "engineering" = 2, "bluespace" = 2)
	build_path = /obj/item/weapon/circuitboard/machine/ntnet_relay
	category = list("Subspace Telecomms")
	build_type = IMPRINTER

/datum/design/board/limbgrower
	name = "Плата (Limb Grower Board)"
	desc = "The circuit board for a limb grower."
	id = "limbgrower"
	req_tech = list("programming" = 3, "biotech" = 2)
	build_path = /obj/item/weapon/circuitboard/machine/limbgrower
	category = list("Medical Machinery")
	build_type = IMPRINTER